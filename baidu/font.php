<?php
header('Content-type:text/html; Charset=utf-8');
//header('Content-type:image/jpeg');
//Array ( [img] => Array ( [name] => head.jpg [type] => image/jpeg [tmp_name] => C:\Users\Administrator\AppData\Local\Temp\phpE916.tmp [error] => 0 [size] => 100782 ) )
require_once 'AipOcr.php';

// 你的 APPID AK SK
const APP_ID = '11070050';
const API_KEY = 'TEFyhaa7Ah2LfaDNokFfruCm';
const SECRET_KEY = 'L1gXvueYKmTGF23CH6FUyW8uEca5cGpK';

$client = new AipOcr(APP_ID, API_KEY, SECRET_KEY);
//echo $_GET['img'];
$image = file_get_contents($_GET['img']);
//print_r($image);
// 调用行驶证识别
$client->vehicleLicense($image);

// 如果有可选参数
$options = array();
$options["detect_direction"] = "true";
$options["accuracy"] = "normal";

//带参数调用行驶证识别
$json=$client->vehicleLicense($image, $options);
//echo is_array($json);
//print_r($json);
if($json['words_result']['车辆识别代号']['words']==""){
	$error='图片识别失败！请重新上传图片！';
	//header('Location:index.php?error='.$error);
	print_r($json);
}else{
	$ID=$json['words_result']['车辆识别代号']['words'];
	//echo $ID;
	//header('Location:index.php?id='.$ID);
}
?>