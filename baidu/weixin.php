<?php

include('./Base.php');
class weixin {
    
    public $base;
 	public function __construct(){
 		//echo 'sss';
        //$mchid="ss";
        $base = new Base();
        //echo $base->xml_parser($mchid);
 	}

    public function getTicket(){
        $file='./jsapi_ticket';
        if(file_exists($file)){//检验文件是否存在
            $con = file_get_contents($file);//取出文件
            $json=json_decode($con);//转换为PHP对象
            if(time()-fileatime($file)<$json->expires_in){
                return $json->jsapi_ticket;
            }
        }
        //$url = "https://qyapi.weixin.qq.com/cgi-bin/get_jsapi_ticket?access_token=ACCESS_TOKE"
    	$url = 'https://qyapi.weixin.qq.com/cgi-bin/get_jsapi_ticket?access_token='.$this->getToken();

    	$con = $this->curlGet($url);
    	$json = json_decode($con);
        if($json->errmsg=="ok"){
            file_put_contents($file, $con);
        }else{
            //echo "$json->errmsg";
        }
        //print_r($json);
    	//$ticket=$json->ticket;
        $ticket="bxLdikRXVbTPdHSM05e5u5sUoXNKd8-41ZO3MhKoyN5OfkWITDGgnr2fwJ0m9E8NYzWKVZvdVtaUgWvsdshFKA";
    	return $ticket;
// {
// "errcode":0,
// "errmsg":"ok",
// "ticket":"bxLdikRXVbTPdHSM05e5u5sUoXNKd8-41ZO3MhKoyN5OfkWITDGgnr2fwJ0m9E8NYzWKVZvdVtaUgWvsdshFKA",
// "expires_in":7200
// }
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

    	$appid="wxd916e23e0c47e33d";//应用id
    	$secret="88e69d605cf93dfe4806d15a6f2c07c6";//应用密码
    	$url="https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential&appid=".$appid."&secret=".$secret;//获取access_token

    	$con = $this->curlGet($url);//
    	file_put_contents($file, $con);//将返回的数据存为$file
		$json=json_decode($con);
		$access_token=$json->access_token;
		//echo $context;
		return $access_token;
    }
	

	public function curlGet( $url, $method = 'GET', $data=null){
		$ch = curl_init();
		$header = "Accept-Charset: utf-8";
		curl_setopt($ch, CURLOPT_URL, $url);
		if($method=="GET"){
		    curl_setopt($ch, CURLOPT_CUSTOMREQUEST, "GET");
	    }
	    if($method=="POST"){
		    curl_setopt($ch, CURLOPT_POST, TRUE);
		    curl_setopt($ch, CURLOPT_POSTFIELDS, $data);
	    }
		curl_setopt($ch, CURLOPT_HEADER, false);
		curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, FALSE);
		curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, FALSE);
		curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
		$temp = curl_exec($ch);
		if(empty($temp)){
			echo 'temp';
	    }else{
	    	//echo 'yes';
	    }
	    curl_close($ch);
		return $temp;
    }

    public function json_decode_test(){
    	$token='{"access_token":"J","expires_in":7200}';
    	$json=json_decode($token);
    	echo $json->access_token;
    }
}    


    $weixin = new weixin();
    //json_decode_test();
    //getUser();
    //getToken();
    //header('Content-type:image/jpeg');//设定即将显示的图片格式
    header('Content-type:text/html; Charset=utf-8');
    //header('Accept-Charset: utf-8');
    //echo $WeChat -> getQRCode();
    //$WeChat -> returnPay();
    //echo $weixin ->getToken();
    $weixin->getTicket();
?>