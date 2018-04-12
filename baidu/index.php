<?php


?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="Page-Enter" content="blendTrans(Duration=0.5)" /> 
<meta http-equiv="Page-Exit" content="blendTrans(Duration=0.5)" />
<title>百度识字</title>

</head>
<body >
<form action="error.php"  name="form" method="POST" enctype="multipart/form-data">
<?php
if(isset($_GET['id']) ? $_GET['id'] : ''){
	echo '车 架 号 ： 
<input class="pw"  name="cjh"   id="cjh" onchange="fuzhi()"  type="text" style="width:71%" value="'.$_GET['id'].'" /><br>';

echo "您的车架号：".$_GET['id'];
echo '<br>请仔细比对车架号是否正确！';	
}else if(isset($_GET['error']) ? $_GET['error'] : ''){
	echo $_GET['error'];
	echo '<input type="file" name="img" value="选择上传文件"/>';
	echo '<input type="submit" value="上传"/>';
}else{
	echo '<input type="file" name="img" value="选择上传文件"/>';
	echo '<input type="submit" value="上传"/>';
}
?>




</form>

</form>
</body>



