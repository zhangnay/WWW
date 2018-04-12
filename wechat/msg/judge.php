<?php

define('TOKEN', 'demo');
$check=new checkSignature();
$check->valid;

class checkSignature{

	public function valid(){
		$echoStr = $_GET['echostr'];
		if($this->check()){
			echo $echoStr;
			exit;
		}
	}

	public function responseMsg(){
		$postStr = $GLOBALS['HTTP_RAW_POST_DATA'];

		if(!empty($postStr)){
			$postObj= simplexml_load_string($postStr, 'SimpleXMLElement',LIBXML_NOCDATA);
			$fromUsername = $postObj->FromUserName;
			$toUsername = $postObj->ToUserName;
			$keyword = trim($postObj->Content);
			$time=time();
			$textTpl = "<xml>
			            <ToUserName><![CDATA[%s]]></ToUserName>
			            <FromUserName><![CDATA[%s]]></FromUserName>
			            <CreatTime>%s</CreatTime>
			            <MsgType><![CDATA[%s]]></MsgType>
			            <Content><![CDATA[%s]]></Content>
			            <FuncFlag>0</FuncFlag>
			            </xml>";
			if(!empty($keyword)){
				$msgType = "text";
				$contentStr = "Hello World";
				$resultStr = sprintf($textTpl,$fromUsername,$toUsername,$time,$msgType,$contentStr);
				echo $resultStr;
			}else{
				echo "Input Something...";
			}
		}else{
			echo "???";
			exit;
		}
	}




	private function check()
	{
		$signature = $_GET["signature"];
		$timestamp = $_GET["timestamp"];
		$nonce = $_GET["nonce"];

		$tmpArr = array(TOKEN, $timestamp, $nonce);
		sort($tmpArr, SORT_STRING);
		$tmpStr = implode( $tmpArr );
		$tmpStr = sha1( $tmpStr );

		if( $signature = $tmpStr){
			return true;
		}else{
			return false;
			//ho $token;
		}
	}
}
?>