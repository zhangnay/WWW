<?php

header('Content-type:text/html;Charset=utf-8');
date_default_timezone_set("PRC");//设置时区 
//echo "begin";
if(count($_FILES)>0){ 
	//echo "begin";
    $sort = array("image/jpeg","image/jpg","image/png","image/bmp");
    //判断是否是图片类型
    if(in_array($_FILES['img']['type'],$sort)){ 
        // $img = ".";    //获取上传到的文件夹位置
        // if(!file_exists($img)){//判断文件夹是否存在 ,如果不存在创建一个
        //     mkdir("$img",0700);        //0700最高权限
        // }else{
        //     echo '路径正确！';
        // }
        $time=date("Y_m_d_H_i_s");     //获取当前时间
        $file_name = explode(".",$_FILES['img']['name']);         //$_FILES['img']['name'] 上传文件的名称 explode字符串打断转字符串
        $file_name[0]=$time;  //使用当前时间作为上传图片的名字
        $name = implode(".",$file_name);    //implode 把数组拼接成字符串
        $img_name = "./".$name;
        if(move_uploaded_file($_FILES['img']['tmp_name'],$img_name)){   //move_uploaded_file 移动文件
            // echo "<center><img style='width:200px;' src='$img_name'>
            // <p>
            // <a href='img_uploading.php'>重新上传</a></p></center>";
            //header('Location:font.php?img=http://yss.eqi360.com/m/tpl/1/'.$img_name);
            echo "上传成功";
        }else{
            echo "上传失败".$img_name; 
        }
    }else{ 
        echo $_FILES['img']['type']."类型不合法！（jpeg、jpg、png、bmp）";
    }
}else{
    echo "图片未能上传！";
}
?>