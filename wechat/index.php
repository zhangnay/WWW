<?php
include('./Base.php');
class index {
    
    public $base;
 	public function __construct(){
        $base = new Base();
 	}

    //获取用户
    public function getUser(){
    	$access_token=getToken();
    	$openid="o3WuY1TsF_3HVxUidsMyz2uQiZOc";
		$url = "https://api.weixin.qq.com/cgi-bin/user/info?access_token=".$access_token."&openid=".$openid;
		$con = curlGet($url);
		$json=json_decode($con);
		print_r($json);
    }

    //查询支付信息
    public function queryPay(){
        $base = new Base();
        $mch_appid = 0;//商户账号APPID
        $mchid = 1;//商户号
        $nonce_str = $base -> getStr();//随机字符串
        $partner_trade_no = 3;//商户订单号
        $sign="";

        $data = array(
            'mch_appid' => $mch_appid,
            'mchid' => $mchid,
            'nonce_str' => $nonce_str,
            'partner_trade_no' => $partner_trade_no,
            'sign' => $sign);
        
        $sign=$base->getSign($data);//生成签名

        $xml=$base->createXml($data);
        $url="https://api.mch.weixin.qq.com/mmpaymkttransfers/gettransferinfo";
        //$con=curlGet($url,POST,$xml);
        $con='<xml> 
        <return_code>SUCCESS</return_code>
        <return_msg>获取成功</return_msg>
        <result_code>SUCCESS</result_code>
        <mch_id>10000098</mch_id>
        <appid>wxe062425f740c30d8</appid>
        <detail_id>1000000000201503283103439304</detail_id>
        <partner_trade_no>1000005901201407261446939628</partner_trade_no>
        <status>SUCCESS</status>
        <payment_amount>650</payment_amount >
        <openid >oxTWIuGaIt6gTKsQRLau2M0yL16E</openid>
        <transfer_time>2015-04-21 20:00:00</transfer_time>
        <transfer_name >测试</transfer_name >
        <desc>福利测试</desc>
        </xml>';
        $json=simplexml_load_string($con);
        $json=json_encode($json,JSON_UNESCAPED_UNICODE);
        //echo $json;
        return $json;
    }

    //返回并解析查询的支付信息
    public function returnQuery(){
        $json=$this->queryPay();
        $result=json_decode($json);
        //echo $result;
        if($result->return_code=="SUCCESS"){//返回状态码--仅为通信标识
            if($result->result_code=='SUCCESS'){//业务结果--成功
                echo "query--yes";
            }else{
                echo $result->err_code;//SYSTEMERROR--重试
            }
        }else{
            echo 'zz'.$result->return_msg."ss";
        }
    }

    //返回并解析公众号支付到零钱的结果
    public function returnPublic(){
        $json=$this->publicNPay();
        $result=json_decode($json);
        //echo $result;
        if($result->return_code=="SUCCESS"){
            //返回状态码--仅为通信标识
            if($result->result_code=='SUCCESS'){
                //业务结果--成功
                echo "yes";
            }else{
                echo $result->err_code;//SYSTEMERROR--重试
            }
        }else{
            echo $result->return_msg;
        } 
    }
    
    //公众号支付的用户零钱
    public function publicNPay(){
        //echo "begin_publicNPay";
    	$base = new Base();
        $mch_appid = 'wxd916e23e0c47e33d';//商户账号APPID
        $mchid = 1;//商户号
        $device_info = '';//设备号NO
        $nonce_str = $base -> getStr();//随机字符串
        //echo $nonce_str;
        $partner_trade_no = 3;//商户订单号
        $openid = 4;//用户openid
        $check_name = 'NO_CHECK';//校验用户姓名选项--FORCE_CHECK
        $re_user_name="";
        if($check_name != 'NO_CHECK'){
            $re_user_name = '张三';//收款用户姓名--NO
        }
        
        $amount = 1;//金额--单位分
        $desc = '测试';//企业付款描述信息
        $spbill_create_ip = '192.168.99.1';//Ip地址
        $sign="";

        $data = array(
            'amount' => $amount, 
            'check_name' => $check_name,
            'desc' => $desc,
            'device_info' => $device_info,
            'mch_appid' => $mch_appid,
            'mchid' => $mchid,
            'nonce_str' => $nonce_str,
            'openid' => $openid,
            'partner_trade_no' => $partner_trade_no,
            're_user_name' => $re_user_name,
            'sign' => $sign,
            'spbill_create_ip' => $spbill_create_ip);
        
        $sign=$base->getSign($data);//生成签名
        //echo $sign;
        $data['sign'] =$sign;
        $xml=$base->createXml($data);//根据$data生成XML
        $url = "https://api.mch.weixin.qq.com/mmpaymkttransfers/promotion/transfers";
		//$con = curlGet($url,POST,$xml);
        $con='<xml><return_code>SUCCESS</return_code>
        <return_msg>null</return_msg>
        <mch_appid>wxec38b8ff840bd989</mch_appid>
        <mchid>10013274</mchid>
        <device_info>null</device_info>
        <nonce_str>lxuDzMnRjpcXzxLx0q</nonce_str>
        <result_code>SUCCESS</result_code>
        <partner_trade_no>10013574201505191526582441</partner_trade_no>
        <payment_no>1000018301201505190181489473</payment_no>
        <payment_time>2015-05-19 15：26：59</payment_time>
        </xml>';

        $json=simplexml_load_string($con);
        $json=json_encode($json,JSON_UNESCAPED_UNICODE);
        //echo $json;
        return $json;
    }
    
    //获取支付使用的ticket
    public function getTicket($expire_seconds=604800,$action_name='QR_SCENE',$scene_id=1){
    	$url ='https://api.weixin.qq.com/cgi-bin/qrcode/create?access_token='.$this->getToken();//使用access_token获取ticket
    	if($action_name='QR_SCENE'){//临时二维码默认7天
    		$data = '{"expire_seconds": %s, "action_name": "QR_SCENE", "action_info": {"scene": {"scene_id": %s}}}';//二维码格式
    		$data = sprintf($data,$expire_seconds,$scene_id);//修改二维码格式
    	}else{
    		$data = '{"action_name": "QR_LIMIT_SCENE", "action_info": {"scene": {"scene_id": %s}}}';
    		$data = sprintf($data,$scene_id);
    	}

    	$con = $this->curlGet($url,'POST',$data);
    	$json = json_decode($con);
    	$ticket=$json->ticket;
    	return $ticket;
    }

    //获取二维码
    public function getQRCode($expire_seconds=604800,$action_name='QR_SCENE',$scene_id=1){
    	$ticket=$this->getTicket($expire_seconds,$action_name,$scene_id);
    	$url='https://mp.weixin.qq.com/cgi-bin/showqrcode?ticket='.urlencode($ticket);//使用urlencode()转换ticket的格式
    	$con = $this->curlGet($url,'GET');//使用GET方式提交
    	return $con;
    }

    //获取access_token
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

    //提交URL
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
		// curl_setopt($ch, CURLOPT_SSLVERSION, CURL_SSLVERSION_TLSv1);
		// curl_setopt($ch, CURLOPT_HTTPHEADER, $header);
		// curl_setopt($ch, CURLOPT_USERAGENT, 'Mozilla/5.0 (compatible; MSIE 5.01; Windows NT 5.0)');
		// curl_setopt($ch, CURLOPT_FOLLOWLOCATION, 1);
		// curl_setopt($ch, CURLOPT_AUTOREFERER, 1);
		// curl_setopt($ch, CURLOPT_POSTFIELDS, $data);
		curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
		$temp = curl_exec($ch);
		if(empty($temp)){
			//$temp = Import::crawler()->curl_get_con($url);
			echo 'temp';
	    }else{
	    	//echo 'yes';
	    }
	    curl_close($ch);
		return $temp;
    }

    //测试
    public function json_decode_test(){
    	$token='{"access_token":"J","expires_in":7200}';
    	$json=json_decode($token);
    	echo $json->access_token;
    }
}    

?>