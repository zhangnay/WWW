<?php
include('./index.php');
header('Content-type:image/jpeg');//设定即将显示的图片格式
//header('Content-type:text/html; Charset=utf-8');

$index = new index();
echo $index->getQRCode();
?>