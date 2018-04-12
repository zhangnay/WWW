<?php
header('Content-type:text/html; Charset=utf-8');
include('./weixin.php');
include('./Base.php');
//public function 
$noncestr=$base->getStr(16);
$timestamp=time();
$weixin = new weixin();
$Base = new Base();
$ticket = $weixin->getTicket();
$data = array('jsapi_ticket' => $ticket, 
	'noncestr' => $noncestr, //随机字符串
	'timestamp' => $timestamp, //时间戳
	'url' => 'http://mp.weixin.qq.com');//当前网页
$string1=$Base->getStr($data);
$signature=sha1($string1);
?>
<script type="text/javascript">
wx.config({
    debug: true, // 开启调试模式,调用的所有api的返回值会在客户端alert出来，若要查看传入的参数，可以在pc端打开，参数信息会通过log打出，仅在pc端时才会打印。
    appId: 'wxd916e23e0c47e33d', // 必填，企业号的唯一标识，此处填写企业号corpid
    timestamp: <?php echo $timestamp?>, // 必填，生成签名的时间戳
    nonceStr: <?php echo $noncestr?>, // 必填，生成签名的随机串
    signature: <?php echo $signature?>,// 必填，签名，见附录1
    jsApiList: ['chooseImage'] // 必填，需要使用的JS接口列表，所有JS接口列表见附录2
});

//成功验证信息
wx.ready(function(){
    // config信息验证后会执行ready方法，所有接口调用都必须在config接口获得结果之后，config是一个客户端的异步操作，所以如果需要在页面加载时就调用相关接口，则须把相关接口放在ready函数中调用来确保正确执行。对于用户触发时才调用的接口，则可以直接调用，不需要放在ready函数中。
});

//失败
wx.error(function(res){
    // config信息验证失败会执行error函数，如签名过期导致验证失败，具体错误信息可以打开config的debug模式查看，也可以在返回的res参数中查看，对于SPA可以在这里更新签名。
});
</script>

