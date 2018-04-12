<?php
//改变模板目录
//define('TMPL_PATH','./Template/');
return array(
	//'配置项'=>'配置值'
	//语言配置
	'LANG_SWITCH_ON' => true,   // 开启语言包功能
	'LANG_AUTO_DETECT' => true, // 自动侦测语言 开启多语言功能后有效
	'LANG_LIST'        => 'ch,en', // 允许切换的语言列表 用逗号分隔
	'VAR_LANGUAGE'     => 'lan', // 默认语言切换变量
	'DEFAULT_LANG'     =>  'ch', // 默认语言
	//改变模板目录
//	'DEFAULT_THEME' => 'Pc',
    'TMPL_PARSE_STRING' => array(
        '__PUBLIC__'     => __ROOT__.'/Public',
        '__ADMIN_IMG__'  => __ROOT__.'/'.APP_PATH.'Syscore/View/Public/img',
        '__ADMIN_CSS__'  => __ROOT__.'/'.APP_PATH.'Syscore/View/Public/css',
        '__ADMIN_JS__'  => __ROOT__.'/'.APP_PATH.'Syscore/View/Public/js',
	),
);
?>