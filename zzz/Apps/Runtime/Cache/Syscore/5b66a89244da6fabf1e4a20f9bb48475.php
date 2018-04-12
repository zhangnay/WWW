<?php if (!defined('THINK_PATH')) exit(); if(C('LAYOUT_ON')) { echo ''; } ?>
<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en">
<!--<![endif]-->
<head>
<meta charset="utf-8" />
<title><?php echo (L("v_do_tips")); ?></title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta content="width=device-width, initial-scale=1" name="viewport" />
<!--全局强制样式 开始-->
<link href="/zzz/Public/bootstrap/googlefont/googlefont.css" rel="stylesheet" type="text/css" />
<link href="/zzz/Public/bootstrap/global/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
<link href="/zzz/Public/bootstrap/global/plugins/simple-line-icons/simple-line-icons.min.css" rel="stylesheet" type="text/css" />
<link href="/zzz/Public/bootstrap/global/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<link href="/zzz/Public/bootstrap/global/plugins/uniform/css/uniform.default.min.css" rel="stylesheet" type="text/css" />
<link href="/zzz/Public/bootstrap/global/plugins/bootstrap-switch/css/bootstrap-switch.min.css" rel="stylesheet" type="text/css" />
<!--全局强制样式 结束-->
<!--皮肤全局样式 开始-->
<link href="/zzz/Public/bootstrap/global/css/components-rounded.min.css" rel="stylesheet" id="style_components" type="text/css" />
<link href="/zzz/Public/bootstrap/global/css/plugins.min.css" rel="stylesheet" type="text/css" />
<!--皮肤全局样式 结束-->
<!--页面级别样式 开始-->
<link href="/zzz/Public/bootstrap/pages/css/login-4.min.css" rel="stylesheet" type="text/css" />
<!--页面级别样式  结束-->
<link type="text/css" href="/zzz/./Apps/Syscore/View/Public/css/global.css" rel="stylesheet" />
<style type="text/css">
body{font:16px/25px "Helvetica Neue",Helvetica,Arial,"Hiragino Sans GB","Hiragino Sans GB W3","Microsoft YaHei UI","Microsoft YaHei","WenQuanYi Micro Hei",sans-serif;background:url(/zzz/Public/bootstrap/pages/img/bg/spring.jpg) center repeat;
}a,a:hover{color:#ff500b;}</style>
<body class="login">
<!--LOGO 开始-->
<div class="logo"></div>
<!--LOGO 结束-->
<!--登录 开始-->
<div class="content" style="text-align:center; background:rgba(0,0,0,0.4); padding:50px 0 50px 0;">
    <div class="form-group">
        <?php if(isset($message)) {?>
            <img src="/zzz/Public/img/success.png" align="absmiddle"><br><br><br>
            <?php if(mb_strlen($message,'utf-8')>6){ ?>
                <span style="font-size:19px; color:#26c281;"><?php echo($message); ?></span>
            <?php }else{ ?>
                <span style="font-size:38px; color:#26c281;"><?php echo($message); ?></span>
            <?php } ?>
        <?php }else{?>
            <img src="/zzz/Public/img/error.png" align="absmiddle"><br><br><br>
            <?php if(mb_strlen($error,'utf-8')>6){ ?>
                <span style="font-size:19px; color:#ff500b;"><?php echo($error); ?></span>
            <?php }else{ ?>
                <span style="font-size:38px; color:#ff500b;"><?php echo($error); ?></span>
            <?php } ?>
        <?php }?>
        <br><br><br><span style="color:#fff;"><?php echo (L("v_page_auto")); ?> <a id="href" href="<?php echo($jumpUrl); ?>"><?php echo (L("v_jump")); ?></a> <?php echo (L("v_waittime")); ?>： <b id="wait"><?php echo($waitSecond); ?></b></span>
    </div>
</div>
<!--登录 结束-->
<script type="text/javascript">
(function(){
var wait = document.getElementById('wait'),href = document.getElementById('href').href;
var interval = setInterval(function(){
	var time = --wait.innerHTML;
	if(time <= 0) {
		location.href = href;
		clearInterval(interval);
	};
}, 1000);
})();
</script>
<!--[if lt IE 9]>
<script src="/zzz/Public/bootstrap/global/plugins/respond.min.js"></script>
<script src="/zzz/Public/bootstrap/global/plugins/excanvas.min.js"></script> 
<![endif]-->
<!--核心插件 开始-->
<script src="/zzz/Public/bootstrap/global/plugins/jquery.min.js" type="text/javascript"></script>
<script src="/zzz/Public/bootstrap/global/plugins/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
<script src="/zzz/Public/bootstrap/global/plugins/js.cookie.min.js" type="text/javascript"></script>
<script src="/zzz/Public/bootstrap/global/plugins/bootstrap-hover-dropdown/bootstrap-hover-dropdown.min.js" type="text/javascript"></script>
<script src="/zzz/Public/bootstrap/global/plugins/jquery-slimscroll/jquery.slimscroll.min.js" type="text/javascript"></script>
<script src="/zzz/Public/bootstrap/global/plugins/jquery.blockui.min.js" type="text/javascript"></script>
<script src="/zzz/Public/bootstrap/global/plugins/uniform/jquery.uniform.min.js" type="text/javascript"></script>
<script src="/zzz/Public/bootstrap/global/plugins/bootstrap-switch/js/bootstrap-switch.min.js" type="text/javascript"></script>
<!--核心插件 结束-->
<!--页面级别插件 开始-->
<script src="/zzz/Public/bootstrap/global/plugins/jquery-validation/js/jquery.validate.min.js" type="text/javascript"></script>
<script src="/zzz/Public/bootstrap/global/plugins/backstretch/jquery.backstretch.min.js" type="text/javascript"></script>
<!--页面级别插件 结束-->
<!--皮肤全局脚本 开始-->
<script src="/zzz/Public/bootstrap/global/scripts/app.min.js" type="text/javascript"></script>
<!--皮肤全局脚本 结束-->
</body>
</html>