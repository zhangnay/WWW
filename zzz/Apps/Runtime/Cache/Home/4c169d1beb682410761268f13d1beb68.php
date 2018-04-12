<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title><?php echo ($sitetitle); ?></title>
<meta name="keywords" content="<?php echo ($sitekeyword); ?>" />
<meta name="description" content="<?php echo ($sitedescription); ?>" />
<link type="text/css" href="/zzz/Template/default/Public/css/global.css" rel="stylesheet" />
</head>
<body>
<!--头部-->
<div class="top">
    <div class="c1200">
        <div class="fl gray"><?php echo ($slogan); ?></div>
        <div class="fr">
	        <?php if(is_array($language)): $i = 0; $__LIST__ = $language;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$lanRs): $mod = ($i % 2 );++$i; if(($lanRs['isdefault']) == "1"): ?><a href="/"><img src="<?php echo ($lanRs['ico']); ?>" width="18" height="10" border="0" class="mr5" /><?php echo ($lanRs['viewname']); ?></a>&nbsp;&nbsp; 
                <?php else: ?>
                    <a href="/<?php echo ($lanRs['mulu']); ?>/"><img src="<?php echo ($lanRs['ico']); ?>" width="18" height="10" border="0" class="mr5" /><?php echo ($lanRs['viewname']); ?></a>&nbsp;&nbsp;<?php endif; endforeach; endif; else: echo "" ;endif; ?>
	    </div>
	</div>
</div>
<div class="navall">
    <div class="top_all">
        <div class="logo"><a href="/"><img src="<?php echo ($logo); ?>" width="200" height="60" border="0" alt="" /></a></div>
	    <div class="top_nav">
	        <!--导航开始-->
		    <div id="nav">
		        <ul id="nav_E8gl38" class="navigation">
                    <?php getNavList(0); ?>
			    </ul>
		    </div>
            <script type="text/javascript" src="/zzz/Template/default/Public/js/jquery1.8.3.js"></script>
		    <!--导航结束-->
	    </div>
    </div>
</div>
<!--头部-->

<!--banner开始-->
<div id="slideBox" class="slideBox">
    <div class="hd">
	    <ul>
            <?php if(is_array($adbanner)): $i = 0; $__LIST__ = $adbanner;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$adRs): $mod = ($i % 2 );++$i;?><li></li><?php endforeach; endif; else: echo "" ;endif; ?>
        </ul>
	</div>
	<div class="bd">
		<ul>
            <?php if(is_array($adbanner)): $i = 0; $__LIST__ = $adbanner;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$adRs): $mod = ($i % 2 );++$i;?><li class="banner" style="background:url(<?php echo ($adRs["imgurl"]); ?>) center no-repeat;"></li><?php endforeach; endif; else: echo "" ;endif; ?>
        </ul>
	</div>
	<a rel="nofollow" class="prev" href="javascript:void(0)"></a>
	<a rel="nofollow" class="next" href="javascript:void(0)"></a>
</div>
<!--banner结束-->
<div class="cp100 h10 clear"></div>
<div class="floor">
    <div class="fl370mr30">
	    <div class="fl370h60">
		    <span class="fl f16"><?php echo (L("v_about")); ?></span>
			<span class="fr"><a href="<?php echo U('Page/view?id=223');?>">&gt;&gt;<?php echo (L("v_detail")); ?></a></span>
		</div>
		<div class="fl370">
		    <img src="/zzz/Template/default/Public/img/i1.jpg" width="370px" height="120" border="0" alt="" />
		</div>
		<div class="fl370px">
            <?php echo (htmlspecialchars_decode($aboutus)); ?>
		</div>
	</div>
    <div class="fl370mr30">
	    <div class="fl370h60">
		    <span class="fl f16"><?php echo (L("v_news")); ?></span>
			<span class="fr"><a href="<?php echo U('News/index');?>">&gt;&gt;<?php echo (L("v_more")); ?></a></span>
		</div>
		<div class="fl370">
		    <img src="/zzz/Template/default/Public/img/i2.jpg" width="370px" height="120" border="0" alt="" />
		</div>
		<div class="fl370px">
		    <ul>
                <?php if(is_array($news)): $i = 0; $__LIST__ = $news;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$newsRs): $mod = ($i % 2 );++$i;?><li><a href="<?php echo U('News/view?id='.$newsRs['id']);?>"><?php echo ($newsRs['title']); ?></a><span><?php echo date("Y-m-d",$newsRs['addtime']); ?></span></li><?php endforeach; endif; else: echo "" ;endif; ?>
			</ul>
		</div>
	</div>
    <div class="fl380">
	    <div class="video_title">
		    <span class="f16"><?php echo (L("v_video")); ?></span>
		</div>
		<div class="video_bg">
		<!--视频播放开始-->
		    <div id="player"></div>
			<script type="text/javascript" src="/zzz/Template/default/Public/js/jwplayer/jwplayer.js"></script>
            <script type="text/javascript">
                jwplayer("player").setup({
                    stretching: "fill", 
                    flashplayer: "/zzz/Template/default/Public/js/jwplayer/player.swf", 
                    image: "/zzz/Template/default/Public/js/jwplayer/screen.jpg", 
                    width: 360, 
                    height: 210,
                    levels: [{file: "<?php echo ($video); ?>"}] 
                });
            </script>
		<!--视频播放结束-->
		</div>
	</div>
</div>
<div class="cp100 h10 clear"></div>
<div class="cp100 h10 clear"></div>
<div class="c1200">
	<?php echo (L("v_links")); ?>：
    <?php if(is_array($adfriend)): $i = 0; $__LIST__ = $adfriend;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$adfriendRs): $mod = ($i % 2 );++$i;?><a href="<?php echo ($adfriendRs['linkurl']); ?>" target="_blank"><?php echo ($adfriendRs['title']); ?></a>&nbsp;&nbsp;&nbsp;<?php endforeach; endif; else: echo "" ;endif; ?>
</div>
<div class="cp100 h10 clear"></div>
<div class="foot">
    <div class="c1200">
	    <div class="copyright"><?php echo (htmlspecialchars_decode($copyright)); ?></div>
		<div class="foot_tel">
		    <div class="tel_img"><img src="/zzz/Template/default/Public/img/tel.jpg" /></div>
			<div class="tel_txt"><span class="f14"><?php echo (L("v_hotline")); ?>：</span><br /><span class="tel_span"><?php echo ($telephone); ?></span></div>
		</div>
	</div>
</div>
</body>
</html>

<!--banner开始-->
<script type="text/javascript" src="/zzz/Template/default/Public/js/jquery.SuperSlide.2.1.1.js"></script>
<script type="text/javascript">
$(".slideBox").hover(function(){
    $(this).find(".prev,.next").stop(true, true).fadeTo("show", 0.5)
},
function(){
    $(this).find(".prev,.next").fadeOut()
});
	jQuery(".slideBox").slide({mainCell:".bd ul",effect:"leftLoop",autoPlay:true,interTime:5500});
</script>
<!--banner结束-->