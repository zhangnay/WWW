<?php
class Base{
	public function xml_parser($str){   
       $xml_parser = xml_parser_create();   
       if(!xml_parse($xml_parser,$str,true)){   
           xml_parser_free($xml_parser);   
           return false;   
       }else {   
           return (json_decode(json_encode(simplexml_load_string($str)),true));   
       }   
    }

    public function getToken(){
        $file='./access_token';//创建access_token文件
        if(file_exists($file)){//检验文件是否存在
            $con = file_get_contents($file);//取出文件
            $json=json_decode($con);//转换为PHP对象
            if(time()-fileatime($file)<$json->expires_in){//如果当前时间与文件创建时间之差小于access_token的有效时间
                //echo $json->access_token;
                return $json->access_token;//返回之前的access_token
            }
        }
    }

    public function getSign($data){
    	$stringA='';
    	foreach ($data as $key => $val) {
    		if($val!=""){
    		    if($key=="jsapi_ticket"){
    			    $stringA.=$key.'='.$val;
    		    }else{
    			    $stringA.='&'.$key.'='.$val;
    		    }
    		}
    	}
    	//echo $stringA;
    	//$key="192006250b4c09247ec02edce69f6a2d";
    	//$stringSignTemp=$stringA+"&key=".$key;
    	//$sign=strtoupper(MD5($stringSignTemp));
    	//$sign=hash_hmac("sha256",$stringSignTemp,$key).toUpperCase();
    	return $stringA;
    }

   public function createXml($data){
        $xml='<?xml version="1.0" encoding="utf-8"?>
        <xml>';
        foreach ($data as $key => $val) {
        	$xml.='<'.$key.'>'.$val.'</'.$key.'>';
        }
        $xml.='</xml>';
        return $xml;
    }
    public function old_creataXml(){
    	$xml="";
    	$xml.='<?xml version="1.0" encoding="utf-8"?>
        <xml>
        <mch_appid>'.$data['mch_appid'].'</mch_appid>
        <mchid>'.$data['mchid'].'</mchid>
        <nonce_str>'.$data['nonce_str'].'</nonce_str>
        <partner_trade_no>'.$data['partner_trade_no'].'</partner_trade_no>
        <openid>'.$data['openid'].'</openid>
        <check_name>'.$data['check_name'].'</check_name>';

        if($data['check_name']!="NO_CHECK"){
        	$xml.='<re_user_name>'.$data['re_user_name'].'</re_user_name>';
        }
        $xml.='<amount>'.$data['amount'].'</amount>
        <desc>'.$data['desc'].'</desc>
        <spbill_create_ip>'.$data['spbill_create_ip'].'</spbill_create_ip>
        <sign>'.$data['sign'].'</sign>
        </xml>';
        return $xml;
    }

    public function getStr( $length = 32 ) { 
        // 密码字符集，可任意添加你需要的字符
        //'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!@#$%^&*()-_ []{}<>~`+=,.;:/?|'
        $chars = 'qwertyuiopasdfghjklzxcvbnmABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
        $password = ""; 
        for ( $i = 0; $i < $length; $i++ ) 
        { 
        // 这里提供两种字符获取方式 
        // 第一种是使用 substr 截取$chars中的任意一位字符； 
        // 第二种是取字符数组 $chars 的任意元素 
        // $password .= substr($chars, mt_rand(0, strlen($chars) – 1), 1); 
        	$password .= $chars[ mt_rand(0, strlen($chars) - 1) ]; 
        } 
        return $password; 
    } 

}

?>