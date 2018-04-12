<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en">
<!--<![endif]-->
<head>
<meta charset="utf-8" />
<title><?php echo (L("v_admin_system")); ?></title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta content="width=device-width, initial-scale=1" name="viewport" />
<meta content="" name="author" />
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
<!--皮肤布局样式 开始-->
<link href="/zzz/Public/bootstrap/layouts/layout/css/layout.min.css" rel="stylesheet" type="text/css" />
<link href="/zzz/Public/bootstrap/layouts/layout/css/themes/darkblue.min.css" rel="stylesheet" type="text/css" id="style_color" />
<!--皮肤布局样式 结束-->
<link href="/zzz/./Apps/Syscore/View/Public/css/global.css" rel="stylesheet" type="text/css" id="style_color" />
</head>
<body class="page-header-fixed page-footer-fixed page-sidebar-closed-hide-logo page-content-white">
        <!--头部 开始-->
        <div class="page-header navbar navbar-fixed-top">
            <!--头部内部 开始-->
            <div class="page-header-inner ">
                <!--LOGO 开始-->
                <div class="page-logo">
                    <a href="<?php echo U('Index/index?lan='.I('get.lan'));?>"><?php if(($_GET['lan']) == "ch"): ?><img src="/zzz/Public/bootstrap/layouts/layout/img/logo.png" class="logo-default" /><?php else: ?><img src="/zzz/Public/bootstrap/layouts/layout/img/logoen.png" class="logo-default" /><?php endif; ?></a>
                    <div class="menu-toggler sidebar-toggler"> </div>
                </div>
                <!--LOGO 结束-->
                <!--头部左侧横向菜单 开始-->
                <div class="hor-menu   hidden-sm hidden-xs">
                    <ul class="nav navbar-nav">
                        <li class="classic-menu-dropdown 
                            <?php switch(CONTROLLER_NAME): case "Guestbook": case "User": case "Area": case "AuthGroup": case "AuthRule": case "Language": case "Module": case "Setconfig": case "Navigation": case "Banner": case "Comment": case "Ad": case "Keywordlink": case "Chat": case "Field": case "Databackup": break; default: ?>active<?php endswitch;?>">
                            <a href="<?php echo U('Index/index?lan='.I('get.lan'));?>"><i class="fa fa-home"></i> <?php echo (L("v_home")); ?>
                                <?php switch(CONTROLLER_NAME): case "Guestbook": case "User": case "Area": case "AuthGroup": case "AuthRule": case "Language": case "Module": case "Setconfig": case "Navigation": case "Banner": case "Comment": case "Ad": case "Keywordlink": case "Chat": case "Field": case "Databackup": break; default: ?><span class="selected"></span><?php endswitch;?>
                            </a>
                        </li>
                        <li class="classic-menu-dropdown 
                            <?php switch(CONTROLLER_NAME): case "Guestbook": case "User": case "Area": case "AuthGroup": case "AuthRule": case "Language": case "Module": case "Setconfig": case "Navigation": case "Banner": case "Comment": case "Ad": case "Keywordlink": case "Chat": case "Field": case "Databackup": ?>active<?php break; endswitch;?>">
                            <a href="<?php echo U('Field/index?lan='.I('get.lan'));?>"><i class="fa fa-gear"></i> <?php echo (L("v_global")); ?>
                                <?php switch(CONTROLLER_NAME): case "Guestbook": case "User": case "Area": case "AuthGroup": case "AuthRule": case "Language": case "Module": case "Setconfig": case "Navigation": case "Banner": case "Comment": case "Ad": case "Keywordlink": case "Chat": case "Field": case "Databackup": ?><span class="selected"></span><?php break; endswitch;?>
                            </a>
                        </li>
                        <li class="classic-menu-dropdown"><a href="/" target="_blank"><i class="fa fa-desktop"></i> <?php echo (L("v_homepage")); ?></a></li>
                    </ul>
                </div>
                <!--头部左侧横向菜单 结束-->
                <!--响应式菜单开关 开始-->
                <a href="javascript:;" class="menu-toggler responsive-toggler" data-toggle="collapse" data-target=".navbar-collapse"> </a>
                <!--响应式菜单开关 结束-->
                <!--头部右侧横向菜单 开始-->
                <div class="top-menu">
                    <ul class="nav navbar-nav pull-right">
                        <!--语言导航条 开始-->
                        <?php if(($languageNum) > "1"): ?><li class="dropdown dropdown-language">
                                <a href="javascript:;" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" data-close-others="true">
                                    <img alt="" src="<?php echo ($nowLan["ico"]); ?>">
                                    <span class="langname"><?php echo ($nowLan["adminname"]); ?></span>
                                    <i class="fa fa-angle-down"></i>
                                </a>
                                <ul class="dropdown-menu dropdown-menu-default">
                                    <?php if(is_array($headlan)): $i = 0; $__LIST__ = $headlan;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$headlan): $mod = ($i % 2 );++$i; if(($_GET['lan']) != $headlan["mulu"]): ?><li><a href="<?php echo U('Index/index?lan='.$headlan['mulu']);?>"><img src="<?php echo ($headlan['ico']); ?>"><?php echo ($headlan['adminname']); ?></a></li><?php endif; endforeach; endif; else: echo "" ;endif; ?>
                                </ul>
                            </li><?php endif; ?>
                        <!--语言导航条 结束-->
                        <!--用户登录下拉 开始-->
                        <li class="dropdown dropdown-user">
                            <a href="javascript:;" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" data-close-others="true">
                                <img alt="" class="img-circle" src="<?php echo I('session.avatar');?>" />
                                <span class="username username-hide-on-mobile"> <?php echo I('session.realname');?></span>
                                <i class="fa fa-angle-down"></i>
                            </a>
                            <ul class="dropdown-menu dropdown-menu-default">
                                <li>
                                    <a href="<?php echo U('User/edit?lan='.I('get.lan').'&id='.I('session.userid'));?>">
                                        <i class="icon-user"></i> <?php echo (L("v_me_edit")); ?></a>
                                </li>
                                <li>
                                    <a href="<?php echo U('Login/logout');?>" onClick='return confirm("<?php echo (L("v_confirm_quit")); ?>");'>
                                        <i class="icon-power"></i> <?php echo (L("v_logout")); ?></a>
                                </li>
                            </ul>
                        </li>
                        <!--用户登录下拉 结束-->
                    </ul>
                </div>
                <!--头部右侧横向菜单 结束-->
            </div>
            <!--头部内部 结束-->
        </div>
        <!--头部 结束-->
        <!--头部和内容分割 开始-->
        <div class="clearfix"> </div>
        <!--头部和内容分割 结束-->
        
<!--百度编辑器开始-->
<script src="/zzz/Public/js/jquery.js" type="text/javascript"></script>
<script src="/zzz/Public/ueditor/ueditor.config.js" type="text/javascript"></script>
<script src="/zzz/Public/ueditor/ueditor.all.min.js" type="text/javascript"></script>
<?php if(I('get.lan') == 'ch'): ?><script type="text/javascript" charset="utf-8" src="/zzz/Public/ueditor/lang/zh-cn/zh-cn.js"></script>
<?php else: ?>
<script type="text/javascript" charset="utf-8" src="/zzz/Public/ueditor/lang/en/en.js"></script><?php endif; ?>
<!--百度编辑器结束-->
        <!--容器 开始-->
        <div class="page-container">
            <!--侧边栏 开始-->
            <div class="page-sidebar-wrapper">
                <!--侧边栏 开始-->
                <div class="page-sidebar navbar-collapse collapse">
                                        <!--侧边栏菜单 开始-->
                    <ul class="page-sidebar-menu  page-header-fixed hidden-sm hidden-xs" data-keep-expanded="false" data-auto-scroll="true" data-slide-speed="200">
                        <li class="nav-item
                            <?php switch(CONTROLLER_NAME): case "Guestbook": case "Field": case "Chat": case "Ad": case "Keywordlink": case "Navigation": case "Comment": case "Area": case "User": ?>active open<?php break; endswitch;?>">
                            <a href="javascript:;" class="nav-link nav-toggle">
				                <i class="icon-globe"></i>
                                <span class="title"><?php echo (L("v_global")); ?></span>
                                <span class="selected"></span><span class="arrow open"></span>
                            </a>
                            <ul class="sub-menu">
                                <li class="nav-item<?php if((CONTROLLER_NAME) == "Field"): ?>active open<?php endif; ?>">
                                    <a href="<?php echo U('Field/index?lan='.I('get.lan'));?>" class="nav-link "><i class="fa fa-list-alt"></i><?php echo (L("v_field")); ?> <?php echo (L("v_manage")); if((CONTROLLER_NAME) == "Field"): ?><span class="fa fa-angle-right pull-right"></span><?php endif; ?></a>
                                </li>
                                <li class="nav-item<?php if((CONTROLLER_NAME) == "Guestbook"): ?>active open<?php endif; ?>">
                                    <a href="<?php echo U('Guestbook/index?lan='.I('get.lan'));?>" class="nav-link "><i class="icon-notebook"></i> <?php echo (L("v_guestbook")); ?> <?php echo (L("v_manage")); if((CONTROLLER_NAME) == "Guestbook"): ?><span class="fa fa-angle-right pull-right"></span><?php endif; ?></a>
                                </li>
                                <?php if((C("chat")) == "1"): ?><li class="nav-item<?php if((CONTROLLER_NAME) == "Chat"): ?>active open<?php endif; ?>">
                                    <a href="<?php echo U('Chat/index?lan='.I('get.lan'));?>" class="nav-link "><i class="fa fa-comments"></i><?php echo (L("v_chat")); if((CONTROLLER_NAME) == "Chat"): ?><span class="fa fa-angle-right pull-right"></span><?php endif; ?></a>
                                </li><?php endif; ?>
                                <?php if((C("advertisement")) == "1"): ?><li class="nav-item<?php if((CONTROLLER_NAME) == "Ad"): ?>active open<?php endif; ?>">
                                    <a href="<?php echo U('Ad/index?lan='.I('get.lan'));?>" class="nav-link "><i class="fa fa-bullhorn"></i><?php echo (L("v_ad")); ?> <?php echo (L("v_manage")); if((CONTROLLER_NAME) == "Ad"): ?><span class="fa fa-angle-right pull-right"></span><?php endif; ?></a>
                                </li><?php endif; ?>
                                <li class="nav-item<?php if((CONTROLLER_NAME) == "Keywordlink"): ?>active open<?php endif; ?>">
                                    <a href="<?php echo U('Keywordlink/index?lan='.I('get.lan'));?>" class="nav-link "><i class="fa fa-flag"></i><?php echo (L("v_keyword")); ?> <?php echo (L("v_manage")); if((CONTROLLER_NAME) == "Keywordlink"): ?><span class="fa fa-angle-right pull-right"></span><?php endif; ?></a>
                                </li>
                                <?php if((C("navigation")) == "1"): ?><li class="nav-item<?php if((CONTROLLER_NAME) == "Navigation"): ?>active open<?php endif; ?>">
                                    <a href="<?php echo U('Navigation/index?lan='.I('get.lan'));?>" class="nav-link "><i class="fa fa-navicon"></i><?php echo (L("v_navigation")); ?> <?php echo (L("v_manage")); if((CONTROLLER_NAME) == "Navigation"): ?><span class="fa fa-angle-right pull-right"></span><?php endif; ?></a>
                                </li><?php endif; ?>
                                <?php if((C("comment")) == "1"): ?><li class="nav-item<?php if((CONTROLLER_NAME) == "Comment"): ?>active open<?php endif; ?>">
                                    <a href="<?php echo U('Comment/index?lan='.I('get.lan'));?>" class="nav-link "><i class="fa fa-commenting-o"></i><?php echo (L("v_comment")); ?> <?php echo (L("v_manage")); if((CONTROLLER_NAME) == "Comment"): ?><span class="fa fa-angle-right pull-right"></span><?php endif; ?></a>
                                </li><?php endif; ?>
                                <?php if((C("area")) == "1"): ?><li class="nav-item<?php if((CONTROLLER_NAME) == "Area"): ?>active open<?php endif; ?>">
                                    <a href="<?php echo U('Area/index?lan='.I('get.lan'));?>" class="nav-link "><i class="fa fa-map-marker"></i><?php echo (L("v_area_manage")); if((CONTROLLER_NAME) == "Area"): ?><span class="fa fa-angle-right pull-right"></span><?php endif; ?></a>
                                </li><?php endif; ?>
                                <li class="nav-item<?php if((CONTROLLER_NAME) == "User"): ?>active open<?php endif; ?>">
                                    <a href="<?php echo U('User/index?lan='.I('get.lan'));?>" class="nav-link "><i class="fa fa-user"></i><?php echo (L("v_user_manage")); if((CONTROLLER_NAME) == "User"): ?><span class="fa fa-angle-right pull-right"></span><?php endif; ?></a>
                                </li>
                            </ul>
                        </li>
                        <?php if(C("authgroup")== 1 or C("authrule")== 1 or C("language")== 1 or C("module")== 1 or C("parametersetting")== 1 or C("databackup")== 1): ?><li class="nav-item
                            <?php switch(CONTROLLER_NAME): case "AuthGroup": case "AuthRule": case "Language": case "Module": case "Setconfig": case "Databackup": ?>active open<?php break; endswitch;?>">
                            <a href="javascript:;" class="nav-link nav-toggle">
				                <i class="icon-settings"></i>
                                <span class="title"><?php echo (L("v_system_manage")); ?></span>
                                <span class="selected"></span><span class="arrow open"></span>
                            </a>
                            <ul class="sub-menu">
                                <?php if((C("authgroup")) == "1"): ?><li class="nav-item<?php if((CONTROLLER_NAME) == "AuthGroup"): ?>active open<?php endif; ?>">
                                    <a href="<?php echo U('AuthGroup/index?lan='.I('get.lan'));?>" class="nav-link "><i class="fa fa-users"></i><?php echo (L("v_usergroup_manage")); if((CONTROLLER_NAME) == "AuthGroup"): ?><span class="fa fa-angle-right pull-right"></span><?php endif; ?></a>
                                </li><?php endif; ?>
                                <?php if((C("authrule")) == "1"): ?><li class="nav-item<?php if((CONTROLLER_NAME) == "AuthRule"): ?>active open<?php endif; ?>">
                                    <a href="<?php echo U('AuthRule/index?lan='.I('get.lan'));?>" class="nav-link "><i class="fa fa-briefcase"></i><?php echo (L("v_auth_manage")); if((CONTROLLER_NAME) == "AuthRule"): ?><span class="fa fa-angle-right pull-right"></span><?php endif; ?></a>
                                </li><?php endif; ?>
                                <?php if((C("language")) == "1"): ?><li class="nav-item<?php if((CONTROLLER_NAME) == "Language"): ?>active open<?php endif; ?>">
                                    <a href="<?php echo U('Language/index?lan='.I('get.lan'));?>" class="nav-link "><i class="fa fa-language"></i><?php echo (L("v_language_manage")); if((CONTROLLER_NAME) == "Language"): ?><span class="fa fa-angle-right pull-right"></span><?php endif; ?></a>
                                </li><?php endif; ?>
                                <?php if((C("module")) == "1"): ?><li class="nav-item<?php if((CONTROLLER_NAME) == "Module"): ?>active open<?php endif; ?>">
                                    <a href="<?php echo U('Module/index?lan='.I('get.lan'));?>" class="nav-link "><i class="fa fa-cubes"></i><?php echo (L("v_module_manage")); if((CONTROLLER_NAME) == "Module"): ?><span class="fa fa-angle-right pull-right"></span><?php endif; ?></a>
                                </li><?php endif; ?>
                                <?php if((C("parametersetting")) == "1"): ?><li class="nav-item<?php if((CONTROLLER_NAME) == "Setconfig"): ?>active open<?php endif; ?>">
                                    <a href="<?php echo U('Setconfig/index?lan='.I('get.lan'));?>" class="nav-link "><i class="fa fa-cogs"></i><?php echo (L("v_config_setting")); if((CONTROLLER_NAME) == "Setconfig"): ?><span class="fa fa-angle-right pull-right"></span><?php endif; ?></a>
                                </li><?php endif; ?>
                                <?php if((C("databackup")) == "1"): ?><li class="nav-item<?php if((CONTROLLER_NAME) == "Databackup"): ?>active open<?php endif; ?>">
                                    <a href="<?php echo U('Databackup/index?lan='.I('get.lan'));?>" class="nav-link "><i class="fa fa-database"></i><?php echo (L("v_data")); ?> <?php echo (L("v_backup")); if((CONTROLLER_NAME) == "Databackup"): ?><span class="fa fa-angle-right pull-right"></span><?php endif; ?></a>
                                </li><?php endif; ?>
                            </ul>
                        </li><?php endif; ?>
                    </ul>
                    <!--侧边栏菜单 结束-->

                                    <div class="page-sidebar-wrapper">
                    <!--响应式水平和侧边栏菜单 开始-->
                    <ul class="page-sidebar-menu visible-sm visible-xs  page-header-fixed">
                        <!--内容管理开始-->
                        <?php if(is_array($modulelist)): $i = 0; $__LIST__ = $modulelist;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$modulers): $mod = ($i % 2 );++$i; $isdisplay_array=explode(',',$modulers['isdisplay']); ?>
                        <li class="nav-item <?php if($modulers['id'] == I('get.moduleid')): ?>active open<?php endif; ?>">
                            <a href="javascript:;" class="nav-link nav-toggle">
				                <?php switch($modulers["id"]): case "1": ?><i class="icon-grid"></i><?php break;?>
                                    <?php case "2": ?><i class="icon-book-open"></i><?php break;?>
                                    <?php case "3": ?><i class="icon-paper-clip"></i><?php break;?>
                                    <?php case "4": ?><i class="icon-doc"></i><?php break;?>
                                    <?php case "5": ?><i class="icon-badge"></i><?php break;?>
                                    <?php case "6": ?><i class="icon-notebook"></i><?php break;?>
                                    <?php default: ?><i class="icon-grid"></i><?php endswitch;?>
                                <span class="title">
				                    <?php switch($modulers["id"]): case "1": echo (L("v_product")); break;?>
                                        <?php case "2": echo (L("v_news")); break;?>
                                        <?php case "3": echo (L("v_down")); break;?>
                                        <?php case "4": echo (L("v_page_module")); break;?>
                                        <?php case "5": echo (L("v_project")); break;?>
                                        <?php case "6": echo (L("v_guestbook")); break;?>
                                        <?php default: echo ($modulers['modulename']); endswitch;?> <?php echo (L("v_manage")); ?>
                                </span>
                                <span class="selected"></span>
                                <span class="arrow open"></span>
                            </a>
                            <ul class="sub-menu">
                                <?php if((in_array('addinfo',$isdisplay_array))): ?><!--是否显示添加信息-->
                                <li class="nav-item<?php if(($modulers['id'] == I('get.moduleid')) and (CONTROLLER_NAME == $modulers['module']) and ACTION_NAME == 'edit'): ?>active open<?php endif; ?>">
                                    <a href="<?php echo U($modulers['module'].'/edit?moduleid='.$modulers['id'].'&lan='.I('get.lan'));?>" class="nav-link ">
                                        <i class="fa fa-edit"></i>
                                        <?php echo (L("v_add")); ?>
				                        <?php switch($modulers["id"]): case "1": echo (L("v_product")); break;?>
                                            <?php case "2": echo (L("v_news")); break;?>
                                            <?php case "3": echo (L("v_down")); break;?>
                                            <?php case "4": echo (L("v_page_module")); break;?>
                                            <?php case "5": echo (L("v_project")); break;?>
                                            <?php case "6": echo (L("v_guestbook")); break;?>
                                            <?php default: echo ($modulers['modulename']); endswitch;?>
                                        <?php if(($modulers['id'] == I('get.moduleid')) and (CONTROLLER_NAME == $modulers['module']) and ACTION_NAME == 'edit'): ?><span class="fa fa-angle-right pull-right"></span><?php endif; ?>
                                    </a>
                                </li><?php endif; ?>
                                <!--信息管理-->
                                <li class="nav-item<?php if(($modulers['id'] == I('get.moduleid')) and (CONTROLLER_NAME == $modulers['module']) and ACTION_NAME == 'index'): ?>active open<?php endif; ?>">
                                    <a href="<?php echo U($modulers['module'].'/index?moduleid='.$modulers['id'].'&lan='.I('get.lan'));?>" class="nav-link ">
                                        <i class="fa fa-th"></i>
				                        <?php switch($modulers["id"]): case "1": echo (L("v_product")); break;?>
                                            <?php case "2": echo (L("v_news")); break;?>
                                            <?php case "3": echo (L("v_down")); break;?>
                                            <?php case "4": echo (L("v_page_module")); break;?>
                                            <?php case "5": echo (L("v_project")); break;?>
                                            <?php case "6": echo (L("v_guestbook")); break;?>
                                            <?php default: echo ($modulers['modulename']); endswitch;?> <?php echo (L("v_manage")); ?>
                                        <?php if(($modulers['id'] == I('get.moduleid')) and (CONTROLLER_NAME == $modulers['module']) and ACTION_NAME == 'index'): ?><span class="fa fa-angle-right pull-right"></span><?php endif; ?>
                                    </a>
                                </li>
                                <?php if((in_array('sort',$isdisplay_array))): ?><!--是否显示分类-->
                                <li class="nav-item<?php if(($modulers['id'] == I('get.moduleid')) and (CONTROLLER_NAME == 'Sort')): ?>active open<?php endif; ?>">
                                    <a href="<?php echo U('Sort/index?moduleid='.$modulers['id'].'&lan='.I('get.lan'));?>" class="nav-link ">
                                        <i class="fa fa-sitemap"></i>
				                        <?php switch($modulers["id"]): case "1": echo (L("v_product")); break;?>
                                            <?php case "2": echo (L("v_news")); break;?>
                                            <?php case "3": echo (L("v_down")); break;?>
                                            <?php case "4": echo (L("v_page_module")); break;?>
                                            <?php case "5": echo (L("v_project")); break;?>
                                            <?php case "6": echo (L("v_guestbook")); break;?>
                                            <?php default: echo ($modulers['modulename']); endswitch;?> <?php echo (L("v_sort")); ?>
                                        <?php if(($modulers['id'] == I('get.moduleid')) and (CONTROLLER_NAME == 'Sort')): ?><span class="fa fa-angle-right pull-right"></span><?php endif; ?>
                                    </a>
                                </li><?php endif; ?>
                                <?php if((in_array('attribute',$isdisplay_array))): ?><!--是否显示属性-->
                                <li class="nav-item<?php if(($modulers['id'] == I('get.moduleid')) and (CONTROLLER_NAME == 'Attribute')): ?>active open<?php endif; ?>">
                                    <a href="<?php echo U('Attribute/index?moduleid='.$modulers['id'].'&lan='.I('get.lan'));?>" class="nav-link ">
                                        <i class="fa fa-tag"></i>
				                        <?php switch($modulers["id"]): case "1": echo (L("v_product")); break;?>
                                            <?php case "2": echo (L("v_news")); break;?>
                                            <?php case "3": echo (L("v_down")); break;?>
                                            <?php case "4": echo (L("v_page_module")); break;?>
                                            <?php case "5": echo (L("v_project")); break;?>
                                            <?php case "6": echo (L("v_guestbook")); break;?>
                                            <?php default: echo ($modulers['modulename']); endswitch;?> <?php echo (L("v_attribute")); ?>
                                        <?php if(($modulers['id'] == I('get.moduleid')) and (CONTROLLER_NAME == 'Attribute')): ?><span class="fa fa-angle-right pull-right"></span><?php endif; ?>
                                    </a>
                                </li><?php endif; ?>
                            </ul>
                        </li><?php endforeach; endif; else: echo "" ;endif; ?>
                        <!--内容管理结束-->
                        <!--全局管理开始-->
                        <li class="nav-item
                            <?php switch(CONTROLLER_NAME): case "Field": case "Chat": case "Ad": case "Navigation": case "Comment": case "Area": case "User": ?>active open<?php break; endswitch;?>">
                            <a href="javascript:;" class="nav-link nav-toggle">
				                <i class="icon-globe"></i>
                                <span class="title"><?php echo (L("v_global")); ?></span>
                                <span class="selected"></span><span class="arrow open"></span>
                            </a>
                            <ul class="sub-menu">
                                <li class="nav-item<?php if((CONTROLLER_NAME) == "Field"): ?>active open<?php endif; ?>">
                                    <a href="<?php echo U('Field/index?lan='.I('get.lan'));?>" class="nav-link "><i class="fa fa-list-alt"></i><?php echo (L("v_field")); ?> <?php echo (L("v_manage")); if((CONTROLLER_NAME) == "Field"): ?><span class="fa fa-angle-right pull-right"></span><?php endif; ?></a>
                                </li>
                                <?php if((C("chat")) == "1"): ?><li class="nav-item<?php if((CONTROLLER_NAME) == "Chat"): ?>active open<?php endif; ?>">
                                    <a href="<?php echo U('Chat/index?lan='.I('get.lan'));?>" class="nav-link "><i class="fa fa-comments"></i><?php echo (L("v_chat")); if((CONTROLLER_NAME) == "Chat"): ?><span class="fa fa-angle-right pull-right"></span><?php endif; ?></a>
                                </li><?php endif; ?>
                                <?php if((C("advertisement")) == "1"): ?><li class="nav-item<?php if((CONTROLLER_NAME) == "Ad"): ?>active open<?php endif; ?>">
                                    <a href="<?php echo U('Ad/index?lan='.I('get.lan'));?>" class="nav-link "><i class="fa fa-bullhorn"></i><?php echo (L("v_ad")); ?> <?php echo (L("v_manage")); if((CONTROLLER_NAME) == "Ad"): ?><span class="fa fa-angle-right pull-right"></span><?php endif; ?></a>
                                </li><?php endif; ?>
                                <?php if((C("navigation")) == "1"): ?><li class="nav-item<?php if((CONTROLLER_NAME) == "Navigation"): ?>active open<?php endif; ?>">
                                    <a href="<?php echo U('Navigation/index?lan='.I('get.lan'));?>" class="nav-link "><i class="fa fa-navicon"></i><?php echo (L("v_navigation")); ?> <?php echo (L("v_manage")); if((CONTROLLER_NAME) == "Navigation"): ?><span class="fa fa-angle-right pull-right"></span><?php endif; ?></a>
                                </li><?php endif; ?>
                                <?php if((C("comment")) == "1"): ?><li class="nav-item<?php if((CONTROLLER_NAME) == "Comment"): ?>active open<?php endif; ?>">
                                    <a href="<?php echo U('Comment/index?lan='.I('get.lan'));?>" class="nav-link "><i class="fa fa-commenting-o"></i><?php echo (L("v_comment")); ?> <?php echo (L("v_manage")); if((CONTROLLER_NAME) == "Comment"): ?><span class="fa fa-angle-right pull-right"></span><?php endif; ?></a>
                                </li><?php endif; ?>
                                <?php if((C("area")) == "1"): ?><li class="nav-item<?php if((CONTROLLER_NAME) == "Area"): ?>active open<?php endif; ?>">
                                    <a href="<?php echo U('Area/index?lan='.I('get.lan'));?>" class="nav-link "><i class="fa fa-map-marker"></i><?php echo (L("v_area_manage")); if((CONTROLLER_NAME) == "Area"): ?><span class="fa fa-angle-right pull-right"></span><?php endif; ?></a>
                                </li><?php endif; ?>
                                <li class="nav-item<?php if((CONTROLLER_NAME) == "User"): ?>active open<?php endif; ?>">
                                    <a href="<?php echo U('User/index?lan='.I('get.lan'));?>" class="nav-link "><i class="fa fa-user"></i><?php echo (L("v_user_manage")); if((CONTROLLER_NAME) == "User"): ?><span class="fa fa-angle-right pull-right"></span><?php endif; ?></a>
                                </li>
                            </ul>
                        </li>
                        <?php if(C("authgroup")== 1 or C("authrule")== 1 or C("language")== 1 or C("module")== 1 or C("parametersetting")== 1 or C("databackup")== 1): ?><li class="nav-item
                            <?php switch(CONTROLLER_NAME): case "AuthGroup": case "AuthRule": case "Language": case "Module": case "Setconfig": case "Databackup": ?>active open<?php break; endswitch;?>">
                            <a href="javascript:;" class="nav-link nav-toggle">
				                <i class="icon-settings"></i>
                                <span class="title"><?php echo (L("v_system_manage")); ?></span>
                                <span class="selected"></span><span class="arrow open"></span>
                            </a>
                            <ul class="sub-menu">
                                <?php if((C("authgroup")) == "1"): ?><li class="nav-item<?php if((CONTROLLER_NAME) == "AuthGroup"): ?>active open<?php endif; ?>">
                                    <a href="<?php echo U('AuthGroup/index?lan='.I('get.lan'));?>" class="nav-link "><i class="fa fa-users"></i><?php echo (L("v_usergroup_manage")); if((CONTROLLER_NAME) == "AuthGroup"): ?><span class="fa fa-angle-right pull-right"></span><?php endif; ?></a>
                                </li><?php endif; ?>
                                <?php if((C("authrule")) == "1"): ?><li class="nav-item<?php if((CONTROLLER_NAME) == "AuthRule"): ?>active open<?php endif; ?>">
                                    <a href="<?php echo U('AuthRule/index?lan='.I('get.lan'));?>" class="nav-link "><i class="fa fa-briefcase"></i><?php echo (L("v_auth_manage")); if((CONTROLLER_NAME) == "AuthRule"): ?><span class="fa fa-angle-right pull-right"></span><?php endif; ?></a>
                                </li><?php endif; ?>
                                <?php if((C("language")) == "1"): ?><li class="nav-item<?php if((CONTROLLER_NAME) == "Language"): ?>active open<?php endif; ?>">
                                    <a href="<?php echo U('Language/index?lan='.I('get.lan'));?>" class="nav-link "><i class="fa fa-language"></i><?php echo (L("v_language_manage")); if((CONTROLLER_NAME) == "Language"): ?><span class="fa fa-angle-right pull-right"></span><?php endif; ?></a>
                                </li><?php endif; ?>
                                <?php if((C("module")) == "1"): ?><li class="nav-item<?php if((CONTROLLER_NAME) == "Module"): ?>active open<?php endif; ?>">
                                    <a href="<?php echo U('Module/index?lan='.I('get.lan'));?>" class="nav-link "><i class="fa fa-cubes"></i><?php echo (L("v_module_manage")); if((CONTROLLER_NAME) == "Module"): ?><span class="fa fa-angle-right pull-right"></span><?php endif; ?></a>
                                </li><?php endif; ?>
                                <?php if((C("parametersetting")) == "1"): ?><li class="nav-item<?php if((CONTROLLER_NAME) == "Setconfig"): ?>active open<?php endif; ?>">
                                    <a href="<?php echo U('Setconfig/index?lan='.I('get.lan'));?>" class="nav-link "><i class="fa fa-cogs"></i><?php echo (L("v_config_setting")); if((CONTROLLER_NAME) == "Setconfig"): ?><span class="fa fa-angle-right pull-right"></span><?php endif; ?></a>
                                </li><?php endif; ?>
                                <?php if((C("databackup")) == "1"): ?><li class="nav-item<?php if((CONTROLLER_NAME) == "Databackup"): ?>active open<?php endif; ?>">
                                    <a href="<?php echo U('Databackup/index?lan='.I('get.lan'));?>" class="nav-link "><i class="fa fa-database"></i><?php echo (L("v_data")); ?> <?php echo (L("v_backup")); if((CONTROLLER_NAME) == "Databackup"): ?><span class="fa fa-angle-right pull-right"></span><?php endif; ?></a>
                                </li><?php endif; ?>
                            </ul>
                        </li><?php endif; ?>
                        <!--全局管理结束-->
                    </ul>
                    <!--响应式水平和侧边栏 结束-->
                </div>

                </div>
            <!--侧边栏 结束-->
            </div>
            <!--侧边栏 结束-->
            <!--内容 开始-->
            <div class="page-content-wrapper">
                <!--内容主体 开始-->
                <div class="page-content">
                    <!--页面头部 开始-->
                    <!--页面导航 开始-->
                    <div class="page-bar">
                        <ul class="page-breadcrumb">
                            <li><span><?php echo (L("v_global")); ?></span><i class="fa fa-angle-right"></i></li>
                            <li><span><?php echo (L("v_global")); ?></span><i class="fa fa-angle-right"></i></li>
                            <li><span><?php echo (L("v_ad")); ?> <?php echo (L("v_manage")); ?></span><i class="fa fa-angle-right"></i></li>
                            <li><span><?php if(($rs["id"]) == ""): echo (L("v_add")); else: echo (L("v_edit")); endif; ?> <?php echo (L("v_ad")); ?></span></li>
                        </ul>
                    </div>
                    <!--页面导航 结束-->
                    <!--页面头部 结束-->
                    <!--右侧主体 开始-->
                    <div class="row margin-top-20">
                        <div class="col-md-12">
                            <form method="post" action="" class="form-horizontal" id="validationForm">
                                <input type="hidden" name="id" value="<?php echo ($rs["id"]); ?>">
                                <input type="hidden" name="lan" value="<?php echo I('get.lan');?>">
                                <input type="hidden" name="fieldtype" value="<?php if(($_GET['fieldtype']) == ""): echo ($rs['fieldtype']); else: echo I('get.fieldtype'); endif; ?>" />
                                <div class="portlet bg-green bg-font-white">
                                    <div class="portlet-body">
                                        <div class="tabbable-bordered">
                                            <div class="edit_nav_left">
                                                <i class="fa fa-edit font-white"></i> <span class="font-white"><?php if(($rs["id"]) == ""): echo (L("v_add")); else: echo (L("v_edit")); endif; ?> <?php echo (L("v_ad")); ?></span>
                                            </div>
                                            <ul class="nav nav-tabs tabs-reversed"></ul>
                                            <div class="tab-content">
                                                <div class="tab-pane active" id="tab_general">
                                                    <div class="form-body">
                                                        <div class="alert alert-danger display-hide"><button class="close" data-close="alert"></button><?php echo (L("v_error_tips")); ?></div>
                                                        <div class="form-group">
                                                            <label class="control-label col-md-3"><?php echo (L("v_title")); ?></label>
                                                            <div class="col-md-4">
                                                                <input type="text" class="form-control" name="title" value="<?php echo ($rs["title"]); ?>" />
                                                            </div>
                                                        </div>
                                                        <div class="form-group">
                                                            <label class="control-label col-md-3"><?php echo (L("v_img")); ?></label>
                                                            <div class="col-md-4">
                                                                <div class="input-group"><input type="text" name="imgurl" id="morepics1" value="<?php echo ($rs['imgurl']); ?>" class="form-control" /><span class="input-group-btn"><input type="button" onClick="upImage1();" value=" <?php echo (L("v_upload_img")); ?> " class="btn green" /></span></div>
                                                            </div>
                                                        </div>
                                                        <div class="form-group">
                                                            <label class="control-label col-md-3"><?php echo (L("v_linkurl")); ?></label>
                                                            <div class="col-md-4">
                                                                <input type="text" class="form-control" name="linkurl" value="<?php echo ($rs["linkurl"]); ?>" />
                                                            </div>
                                                        </div>
                                                        <div class="form-group">
                                                            <label class="control-label col-md-3"><?php echo (L("v_description")); ?></label>
                                                            <div class="col-md-4">
                                                                <textarea name="description" class="form-control" rows="5"><?php echo ($rs["description"]); ?></textarea>
                                                            </div>
                                                        </div>
                                                        <div class="form-group">
                                                            <label class="control-label col-md-3"><?php echo (L("v_sequence")); ?></label>
                                                            <div class="col-md-4">
                                                                <div class="input-icon right"><i class="fa"></i><input type="text" class="form-control" name="sequence" value="<?php if(empty($rs['sequence'])){ echo "0"; }else{ echo $rs['sequence']; } ?>" onKeyDown="if(event.keyCode==13)event.returnValue=false" onChange="if(/\D/.test(this.value)){alert('<?php echo (L("v_require_number")); ?>！');this.value='0';}" /></div>
                                                            </div>
                                                        </div>
                                                        <div class="form-group">
                                                            <label class="control-label col-md-3"><?php echo (L("v_type")); ?></label>
                                                            <div class="radio-list">
                                                                <label class="radio-inline">
                                                                    <input type="radio" name="typeid" id="optionsRadios1" value="1"<?php if(($rs['typeid'] == 1) or $rs['typeid'] == ''): ?>checked="checked"<?php endif; ?> /> <?php echo (L("v_banner")); ?>
                                                                </label>
                                                                <label class="radio-inline">
                                                                    <input type="radio" name="typeid" id="optionsRadios1" value="2"<?php if($rs['typeid'] == 2): ?>checked="checked"<?php endif; ?> /><?php echo (L("v_friendlink")); ?>
                                                                </label>
                                                            </div>
                                                        </div>
                                                        <div class="form-group">
                                                            <label class="control-label col-md-3"><?php echo (L("v_position")); ?></label>
                                                            <div class="radio-list">
                                                                <label class="radio-inline">
                                                                    <input type="radio" name="position" id="optionsRadios1" value="Index"<?php if(($rs['position'] == 'Index') or $rs['position'] == ''): ?>checked="checked"<?php endif; ?> /><?php echo (L("v_index")); ?>
                                                                </label>
                                                                <?php if(is_array($Module)): $i = 0; $__LIST__ = $Module;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$ModuleRs): $mod = ($i % 2 );++$i;?><label class="radio-inline">
                                                                        <input type="radio" name="position" id="optionsRadios1" value="<?php echo ($ModuleRs['moduledir']); ?>"<?php if($rs['position'] == $ModuleRs['moduledir']): ?>checked="checked"<?php endif; ?> />
						                                                <?php switch($ModuleRs["id"]): case "1": echo (L("v_product")); break;?>
                                                                            <?php case "2": echo (L("v_news")); break;?>
                                                                            <?php case "3": echo (L("v_down")); break;?>
                                                                            <?php case "4": echo (L("v_page_module")); break;?>
                                                                            <?php case "5": echo (L("v_project")); break;?>
                                                                            <?php case "6": echo (L("v_guestbook")); break;?>
                                                                            <?php default: ?> <?php echo ($ModuleRs['modulename']); endswitch;?> <?php echo (L("v_module")); ?>
                                                                    </label><?php endforeach; endif; else: echo "" ;endif; ?>
                                                            </div>
                                                        </div>
                                                        <div class="form-group">
                                                            <label class="control-label col-md-3"><?php echo (L("v_client")); ?></label>
                                                            <div class="col-md-4">
                                                                <div class="checkbox-list">
                                                                    <label class="checkbox-inline">
                                                                        <?php $client_array=explode(',',$rs['client']); ?>
                                                                        <input type="checkbox" name="client[]" value="pc" <?php if((in_array('pc',$client_array)) or $rs['client'] == ''): ?>checked="checked"<?php endif; ?>><?php echo (L("v_client_pc")); ?>
                                                                    </label>
                                                                    <label class="checkbox-inline">
                                                                        <input type="checkbox" name="client[]" value="wap" <?php if((in_array('wap',$client_array)) or $rs['client'] == ''): ?>checked="checked"<?php endif; ?>><?php echo (L("v_client_mobile")); ?>
                                                                    </label>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="form-actions">
                                                    <div class="row">
                                                        <div class="col-md-offset-3 col-md-9">
                                                            <button type="submit" class="btn green"><i class="fa fa-check"></i> <?php echo (L("v_save")); ?></button>
                                                            <button type="button" class="btn default" onclick="javascript:history.back(-1);"><?php echo (L("v_goback")); ?></button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                    <!--右侧主体 结束-->
                </div>
                <!--内容主体 结束-->
            </div>
            <!--内容 结束-->
            
        </div>
        <!--容器 结束-->
        <!--底部 开始-->
        <div class="page-footer">
            <div class="page-footer-inner"><?php echo (L("v_version")); ?>：<?php echo (session('system_version')); ?> &copy; <?php echo (session('system_url')); ?></div>
            <div class="scroll-to-top">
                <i class="icon-arrow-up"></i>
            </div>
        </div>
        <!--底部 结束-->
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
        <script src="/zzz/Public/bootstrap/global/plugins/bootstrap-switch/js/bootstrap-switch.min.js" type="text/javascript"></script>
        <!--核心插件 结束-->
        <!--皮肤全局脚本 开始-->
        <script src="/zzz/Public/bootstrap/global/scripts/app.min.js" type="text/javascript"></script>
        <!--皮肤全局脚本 结束-->
        <!--皮肤布局脚本 开始-->
        <script src="/zzz/Public/bootstrap/layouts/layout/scripts/layout.min.js" type="text/javascript"></script>
        <script src="/zzz/Public/bootstrap/layouts/global/scripts/quick-sidebar.min.js" type="text/javascript"></script>
        <!--皮肤布局脚本 结束-->
<script src="/zzz/Public/bootstrap/global/plugins/uniform/jquery.uniform.min.js" type="text/javascript"></script>
<!--图片上传开始-->
<script type="text/plain" id="input_editor1" style="display:none;"></script>
<script type="text/javascript">
//弹出图片上传的对话框
    var url='<?php echo U('Syscore/Ueditor/Index');?>';
    //实例化编辑器
    var upload_editor1 = UE.getEditor('input_editor1',{
        serverUrl :url,
        UEDITOR_HOME_URL:'/Public/ueditor/',
    });
function upImage1(){
	  
    upload_editor1.ready(function(){
        upload_editor1.execCommand('serverparam', {
        'userid': 'image',//图片子文件夹
        });

        upload_editor1.hide();//隐藏编辑器
        //监听图片上传
        upload_editor1.addListener('beforeInsertImage', function (t,arg){
            document.getElementById("morepics1").value=arg[0].src;
        });
    });
    //弹出图片上传的对话框
    var myImage1 = upload_editor1.getDialog("insertimage");
    myImage1.open();
}
</script>
<!--图片上传结束-->
</body>
</html>