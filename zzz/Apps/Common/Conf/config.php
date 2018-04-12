<?php
return array(
	//'配置项'=>'配置值'
    'DB_TYPE'=>'mysql',// 数据库类型
    'DB_HOST'=>'127.0.0.1',// 服务器地址
    'DB_NAME'=>'zzz',// 数据库名
    'DB_USER'=>'root',// 用户名
    'DB_PWD'=>'root',// 密码
    'DB_PORT'=>3306,// 端口
    'DB_PREFIX'=>'bmkj_',// 数据库表前缀
    'DB_CHARSET'=>'utf8',// 数据库字符集
	'URL_CASE_INSENSITIVE' => true,//URL地址不区分大小写
    'LOAD_EXT_CONFIG' => 'set_config',
    'DEFAULT_CHARSET'       =>  'utf-8', // 默认输出编码
    'DEFAULT_TIMEZONE'      =>  'PRC',  // 默认时区
    'LOAD_EXT_FILE' => 'Common',//跟数据库备份相关
	//隐藏home和变更后台syscore
    'URL_MODULE_MAP'    =>    array('hetada'=>'syscore'),//两个都必须是小写啊！！！！
    'MODULE_ALLOW_LIST'    =>    array('Home','En','Hetada'),
    'DEFAULT_MODULE'       =>    'Home',	

    //简化URL
    //启用路由功能	
	'URL_ROUTER_ON'		=>	true,
	//路由定义
	'URL_ROUTE_RULES'	=> 	array(
		//新闻规则示例，实际没用到
		'/^([a-zA-Z\d]+)\/n(\d+)-p(\d+)$/'=>'News/index?sortid=:2&p=:3&title=:1',
		'/^([a-zA-Z\d]+)-n(\d+)-id(\d+)$/'   => 'News/view?id=:3&sortid=:2&title=:1',
	),

    //Auth权限设置
    'AUTH_CONFIG' => array(
        'AUTH_ON' => true,  // 认证开关
        'AUTH_TYPE' => 1, // 认证方式，1为实时认证；2为登录认证。
        'AUTH_GROUP' => 'bmkj_auth_group', // 用户组数据表名
        'AUTH_GROUP_ACCESS' => 'bmkj_auth_group_access', // 用户-用户组关系表
        'AUTH_RULE' => 'bmkj_auth_rule', // 权限规则表
        'AUTH_USER' => 'bmkj_user', // 用户信息表
    ),   
	//跳转提示页面模板
	'TMPL_ACTION_SUCCESS'=>'Public:dispatch_jump',
    'TMPL_ACTION_ERROR'=>'Public:dispatch_jump',

);