<?php
//header('Content-type:text/html; Charset=utf-8');
header('Content-type:image/jpeg');
require_once 'AipOcr.php';

// 你的 APPID AK SK
const APP_ID = '11070050';
const API_KEY = 'TEFyhaa7Ah2LfaDNokFfruCm';
const SECRET_KEY = 'L1gXvueYKmTGF23CH6FUyW8uEca5cGpK';

$client = new AipOcr(APP_ID, API_KEY, SECRET_KEY);
date_default_timezone_set("PRC");//设置时区 
//echo "begin";
if(count($_FILES)>0){ 
	//echo "begin";
    $sort = array("image/jpeg","image/jpg","image/png","image/bmp");
    //print_r($_FILES);
    //判断是否是图片类型
    if(in_array($_FILES['img']['type'],$sort)){ 
        // $img = "img";    //获取上传到的文件夹位置
        // if(!file_exists($img)){//判断文件夹是否存在 ,如果不存在创建一个
        //     mkdir("$img",0700);        //0700最高权限
        // }
        // $time=date("Y_m_d_H_i_s");     //获取当前时间
        // $file_name = explode(".",$_FILES['img']['name']);         //$_FILES['img']['name'] 上传文件的名称 explode字符串打断转字符串
        // $file_name[0]=$time;  //使用当前时间作为上传图片的名字
        // $name = implode(".",$file_name);    //implode 把数组拼接成字符串
        // $img_name = "img/".$name;



//echo $_GET['img'];
$image = file_get_contents($_FILES['img']['tmp_name'],true);
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
    //echo $error='图片识别失败！请重新上传图片！';
    //header('Location:index.php?error='.$error);
    //echo "<img src=".$_FILES['img']['tmp_name']."/>"."sssss";
    //print_r($json);
}else{
    $ID=$json['words_result']['车辆识别代号']['words'];
    echo $ID;
    //header('Location:index.php?id='.$ID);
}

        //if(move_uploaded_file($_FILES['img']['tmp_name'],$img_name)){   //move_uploaded_file 移动文件
            // echo "<center><img style='width:200px;' src='$img_name'>
            // <p>
            // <a href='img_uploading.php'>重新上传</a></p></center>";
            //header('Location:font.php?img='.$img_name);
            //header('Location:font.php?img='.$_FILES['img']['tmp_name']);
            //echo "上传成功";
        //}else{
            //echo "上传失败"; 
        //}
    }else{ 
        echo "不是图片类型";
    }
}
?>