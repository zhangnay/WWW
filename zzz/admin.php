<?php
// 关闭调试模式
define('APP_DEBUG',false);
// 定义应用目录
define('APP_PATH','./Apps/');
//默认绑定Home模块，URL中去掉Home
define('BIND_MODULE', 'Syscore');
// 引入ThinkPHP入口文件
require './ThinkPHP/ThinkPHP.php';
?>