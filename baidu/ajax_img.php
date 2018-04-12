<?php


?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="Page-Enter" content="blendTrans(Duration=0.5)" /> 
<meta http-equiv="Page-Exit" content="blendTrans(Duration=0.5)" />
<title>百度识字</title>
<style type="text/css">
.file {  
    position: relative;  
    display: inline-block;  
    border: 1px solid #333;  
    padding: 4px 10px;  
    overflow: hidden;  
    text-decoration: none;  
    text-indent: 0;  
    line-height: 20px;  
    border-radius: 5px;  
    color: #000;  
    background:#ccc; /* 一些不支持背景渐变的浏览器 */    
    background:-moz-linear-gradient(top, #fff, #ccc);    
    background:-webkit-gradient(linear, 0 0, 0 bottom, from(#fff), to(#ccc));    
    background:-o-linear-gradient(top, #fff, #ccc);   
}  
.file input {      
    position: absolute;      
    font-size: 50px;      
    right: 0;      
    top: 0;      
    opacity: 0;  
    filter: progid:DXImageTransform.Microsoft.Alpha(opacity=0);  
}  
</style>
</head>
<body >
<form id= "uploadForm" style="margin:0 0 0 15%;width:70%">
  <div>
       <span style="width:15%;">车 架 号 ： </span>
       <input type="text" name="filen" id="cjh" value= "" style="width:70%;"/>  
       <a href="javascript:;" class="file" style="width:10%;min-width:60px;">
          <span style="width:60px;">选择文件</span>
          <input type="file" name="img" onchange="showPreview(this)" class="file"  /> 
        </a>
      </div>
       <br>
       <div class="" style="margin:0 0 0 9%;width:90%;">
          <img id="portrait" src="" width="70%"> 
       </div>  
       <input type="button" value="上传" onclick="doUpload()" />  
</form>  

    <script src="jquery.js"></script> 
    <script> 
    function doUpload() {  
       var formData = new FormData($( "#uploadForm" )[0]);  
       $.ajax({  
         url: 'img_uploading.php' ,  
         type: 'POST',  
         data: formData,  
         async: false,  
         cache: false,  
         contentType: false,  
         processData: false,  
         success: function (returndata) {  
           //alert(returndata);
           $('#cjh').val(returndata);
         },  
         error: function (returndata) {  
           alert(returndata);  
         }  
       });  
    }  
    </script> 

    <script type="text/javascript"> 
    function showPreview(source) { 
      var file = source.files[0]; 
      if (window.FileReader) { 
        var fr = new FileReader(); 
        fr.onloadend = function(e) { 
          document.getElementById("portrait").src = e.target.result; 
        }; 
        fr.readAsDataURL(file); 
      } 
    } 
   </script>
 </body>