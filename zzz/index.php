<?php
// 检测PHP环境
// if(version_compare(PHP_VERSION,'5.3.0','<'))  die('require PHP > 5.3.0 !');
// 开启调试模式 建议开发阶段开启 部署阶段注释或者设为false
define('APP_DEBUG',false);
// 定义应用目录
define('APP_PATH','./Apps/');
//默认绑定Home模块，URL中去掉Home
//define('BIND_MODULE', 'Home');
// 引入ThinkPHP入口文件
require './ThinkPHP/ThinkPHP.php';
?>