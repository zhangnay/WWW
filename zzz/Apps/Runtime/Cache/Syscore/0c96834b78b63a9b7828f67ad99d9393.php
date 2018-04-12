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
                            <li><span><?php echo (L("v_comment")); ?> <?php echo (L("v_manage")); ?></span></li>
                        </ul>
                        <form name="formsearch" method="post" action="">
                            <input type="hidden" name="lan" value="<?php echo I('get.lan');?>">
                            <div class="col-md-4 input-group pull-right margin-top-5">
                                <input type="text" name="keyword" class="form-control" placeholder="<?php echo (L("v_quickfind")); ?>" />
                                <span class="input-group-btn pdr5"><button type="submit" class="btn blue"><?php echo (L("v_search")); ?></button></span>
                            </div>
                        </form>
                    </div>
                    <!--页面导航 结束-->
                    <!--页面头部 结束-->
                    <!--右侧主体 开始-->
                    <div class="col-md-12 margin-top-10"></div>
                    <form name="form2" id="form2" action="" method="post">
                        <table class="table table-striped table-bordered table-hover table-checkable order-column">
                            <thead>
                                <tr class="bg-default">
                                    <th>ID</th>
                                    <th><?php echo (L("v_comment")); ?> <?php echo (L("v_content_a")); ?></th>
                                    <th><?php echo (L("v_reply")); ?></th>
                                    <th><?php echo (L("v_date")); ?></th>
                                    <th><?php echo (L("v_status")); ?></th>
                                    <th><?php echo (L("v_sequence")); ?></th>
                                    <th><?php echo (L("v_do")); ?></th>
                                </tr>
                            </thead>
                            <tbody>
                              <?php if(is_array($list)): $i = 0; $__LIST__ = $list;if( count($__LIST__)==0 ) : echo "$empty" ;else: foreach($__LIST__ as $key=>$rs): $mod = ($i % 2 );++$i;?><input type="hidden" name="id[]" value="<?php echo ($rs["id"]); ?>" />
                                <tr class="odd gradeX">
                                    <td><input type="checkbox" name="selectid[]" id="selectid" value="<?php echo ($rs['id']); ?>" /> <?php echo ($rs['id']); ?></td>
                                    <td>
                                        <?php echo ($rs['html']); ?> <?php echo (mb_substr($rs['content'],0,36,'utf-8')); ?>
                                        <?php if(($defaultlan) == $rs["lan"]): $module = '/'; ?>
                                        <?php else: ?>
                                            <?php $module = '/'.$rs['lan'].'/'; endif; ?>
                                        <?php switch($rs['moduleid']): case "1": ?>[ <?php echo (L("v_product")); ?> ]
                                                <a href="<?php echo U($module.'Product/view?id='.$rs['infoid']);?>" target="_blank">&gt;&gt;<?php echo (L("v_view")); ?> <?php echo (L("v_original")); ?></a><?php break;?>
                                            <?php case "2": ?>[ <?php echo (L("v_news")); ?> ]
                                                <a href="<?php echo U($module.'News/view?id='.$rs['infoid']);?>" target="_blank">&gt;&gt;<?php echo (L("v_view")); ?> <?php echo (L("v_original")); ?></a><?php break;?>
                                            <?php case "3": ?>[ <?php echo (L("v_down")); ?> ]
                                                <a href="<?php echo U($module.'Down/view?id='.$rs['infoid']);?>" target="_blank">&gt;&gt;<?php echo (L("v_view")); ?> <?php echo (L("v_original")); ?></a><?php break;?>
                                            <?php case "4": ?>[ <?php echo (L("v_page")); ?> ]
                                                <a href="<?php echo U($module.'Page/view?id='.$rs['infoid']);?>" target="_blank">&gt;&gt;<?php echo (L("v_view")); ?> <?php echo (L("v_original")); ?></a><?php break;?>
                                            <?php case "5": ?>[ <?php echo (L("v_project")); ?> ]
                                                <a href="<?php echo U($module.'Project/view?id='.$rs['infoid']);?>" target="_blank">&gt;&gt;<?php echo (L("v_view")); ?> <?php echo (L("v_original")); ?></a><?php break;?>
                                            <?php default: endswitch;?>
                                    </td>
                                    <td><a href="<?php echo U('Comment/edit?moduleid='.$rs['moduleid'].'&parentid='.$rs['id'].'&id='.$rs['id'].'&reply=yes&lan='.I('get.lan'));?>"><?php echo (L("v_reply")); ?></a></td>
                                    <td><?php echo (date('Y-m-d H:i:s',$rs['addtime'])); ?></td>
                                    <td>
						                <?php if(($rs['status']) == "1"): ?><a onClick='return confirm("<?php echo (L("v_whether")); ?> <?php echo (L("v_check_cancel")); ?>？");' href="<?php echo U('Comment/update_status?status=0&id='.$rs['id']);?>" class="btn green btn-sm"><?php echo (L("v_audit")); ?></a>
						                <?php else: ?>
						                    <a onClick='return confirm("<?php echo (L("v_whether")); ?> <?php echo (L("v_check_pass")); ?>？");' href="<?php echo U('Comment/update_status?status=1&id='.$rs['id']);?>" class="btn red-flamingo btn-sm"><?php echo (L("v_audit_pending")); ?></a><?php endif; ?>
                                    </td>
                                    <td><input name="sequence[]" type="text" value="<?php echo ($rs['sequence']); ?>" class="form-control input-sm" onKeyDown="if(event.keyCode==13)event.returnValue=false" onChange="if(/\D/.test(this.value)){alert('<?php echo (L("v_require_number")); ?>！');this.value='0';}" /></td>
                                    <td><a href="<?php echo U('Comment/edit?moduleid='.$rs['moduleid'].'&parentid='.$rs['parentid'].'&id='.$rs['id'].'&lan='.I('get.lan'));?>" class="btn green btn-sm"><i class="fa fa-edit"></i> <?php echo (L("v_edit")); ?></a><a class="btn red-flamingo btn-sm" onClick='return confirm("<?php echo (L("v_confirm_delete")); ?>！");' href="/zzz/hetada/comment/delete_one/id/<?php echo ($rs["id"]); ?>"><i class="fa fa-times"></i> <?php echo (L("v_delete")); ?></a></td>
                                </tr><?php endforeach; endif; else: echo "$empty" ;endif; ?>
                                <tr>
                                    <td colspan="7">
                                        <div class="fl pdl7 lh34"><div class="pages"><?php echo ($page); ?></div></div>
                                        <div class="fr pdr5"><button type="button" class="btn blue" onclick="CheckOthers(this.form);"><i class="fa fa-check"></i> <?php echo (L("v_select_all")); ?></button><button type="button" class="btn green-meadow" onClick='ConfirmDel("","/zzz/hetada/comment/update_pass/?status=1","update");'><i class="fa fa-check-circle-o"></i> <?php echo (L("v_check_pass")); ?></button><button type="button" class="btn red-intense" onClick='ConfirmDel("","/zzz/hetada/comment/update_pass/?status=0","update");'><i class="fa fa-minus-circle"></i> <?php echo (L("v_check_cancel")); ?></button><button type="button" class="btn green" onClick='ConfirmDel("","/zzz/hetada/comment/update_all/","update");'><i class="fa fa-arrow-circle-o-up"></i> <?php echo (L("v_update_all")); ?></button><button type="button" class="btn red-flamingo" onClick='ConfirmDel("<?php echo (L("v_confirm_delete")); ?>！","/zzz/hetada/comment/delete_all/","delete");'><i class="fa fa-times"></i> <?php echo (L("v_delete_select")); ?></button></div>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </form>
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
<script src="/zzz/./Apps/Syscore/View/Public/js/admin.js" type="text/javascript"></script>
</body>
</html>