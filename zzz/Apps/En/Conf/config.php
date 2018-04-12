<?php
return array(
	//'配置项'=>'配置值'
	//语言配置
	'LANG_SWITCH_ON' => true,   // 开启语言包功能
	'LANG_AUTO_DETECT' => true, // 自动侦测语言 开启多语言功能后有效
	'LANG_LIST'        => 'en', // 允许切换的语言列表 用逗号分隔
	'VAR_LANGUAGE'     => 'lan', // 默认语言切换变量
	'DEFAULT_LANG'     =>  'en', // 默认语言
	//改变模板目录
    'VIEW_PATH'=>'./Template/',
	'DEFAULT_THEME' => 'en',
	//文件夹设置
    'TMPL_PARSE_STRING' => array(
        '__PUBLIC__'     => __ROOT__.'/Public',
        '__HOME_IMG__'  => __ROOT__.'/Template/en/Public/img',
        '__HOME_CSS__'  => __ROOT__.'/Template/en/Public/css',
        '__HOME_JS__'  => __ROOT__.'/Template/en/Public/js',
	),
);