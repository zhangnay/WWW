-- phpMyAdmin SQL Dump
-- version 3.5.2.2
-- http://www.phpmyadmin.net
--
-- 主机: localhost
-- 生成日期: 2016 年 10 月 25 日 16:42
-- 服务器版本: 5.5.27
-- PHP 版本: 5.4.4

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- 数据库: `bmgs`
--

-- --------------------------------------------------------

--
-- 表的结构 `bmkj_ad`
--

CREATE TABLE IF NOT EXISTS `bmkj_ad` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) DEFAULT NULL,
  `imgurl` varchar(500) DEFAULT NULL,
  `linkurl` text,
  `description` varchar(500) DEFAULT NULL,
  `typeid` tinyint(2) DEFAULT NULL,
  `position` varchar(20) DEFAULT NULL,
  `sequence` int(10) DEFAULT '0',
  `client` varchar(200) DEFAULT NULL,
  `lan` char(30) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=48 ;

--
-- 转存表中的数据 `bmkj_ad`
--

INSERT INTO `bmkj_ad` (`id`, `title`, `imgurl`, `linkurl`, `description`, `typeid`, `position`, `sequence`, `client`, `lan`) VALUES
(31, '深圳网站设计公司', '', '##', '', 2, 'Index', 0, 'pc,wap', 'ch'),
(27, '第1张幻灯片1920px * 500px', '/Template/default/Public/img/banner1.jpg', '#', '', 1, 'Index', 100, 'pc', 'ch'),
(36, '案例展示banner', '/Template/default/Public/img/project_banner.jpg', '##', '', 1, 'Project', 0, 'pc', 'ch'),
(28, '第2张幻灯片1920px * 500px', '/Template/default/Public/img/banner2.jpg', '##', '', 1, 'Index', 90, 'pc,wap', 'ch'),
(35, '新闻模块banner', '/Template/default/Public/img/news_banner.jpg', '##', '', 1, 'News', 0, 'pc', 'ch'),
(39, 'webdesign', '', '##', '', 2, 'Index', 0, 'pc,wap', 'en'),
(29, '第3张幻灯片1920px * 500px', '/Template/default/Public/img/banner1.jpg', '##', '', 1, 'Index', 80, 'pc,wap', 'ch'),
(34, '产品模块banner', '/Template/default/Public/img/pro_banner.jpg', '##', '', 1, 'Product', 0, 'pc', 'ch'),
(37, '下载中心banner', '/Template/default/Public/img/down_banner.jpg', '##', '', 1, 'Down', 0, 'pc', 'ch'),
(38, '关于我们banner', '/Template/default/Public/img/about_banner.jpg', '##', '', 1, 'Page', 0, 'pc', 'ch'),
(40, '产品模块banner', '/Template/en/Public/img/pro_banner.jpg', '##', '', 1, 'Product', 0, 'pc', 'en'),
(41, '新闻模块banner', '/Template/en/Public/img/news_banner.jpg', '##', '', 1, 'News', 0, 'pc', 'en'),
(42, '案例展示banner', '/Template/en/Public/img/project_banner.jpg', '##', '', 1, 'Project', 0, 'pc', 'en'),
(43, '下载中心banner', '/Template/en/Public/img/down_banner.jpg', '##', '', 1, 'Down', 0, 'pc', 'en'),
(44, '关于我们banner', '/Template/en/Public/img/about_banner.jpg', '##', '', 1, 'Page', 0, 'pc', 'en'),
(45, '第3张幻灯片1920px * 500px', '/Template/en/Public/img/banner1.jpg', '##', '', 1, 'Index', 0, 'pc', 'en'),
(46, '第2张幻灯片1920px * 500px', '/Template/en/Public/img/banner2.jpg', '##', '', 1, 'Index', 0, 'pc', 'en'),
(47, '第1张幻灯片1920px * 500px', '/Template/en/Public/img/banner1.jpg', '##', '', 1, 'Index', 0, 'pc', 'en');

-- --------------------------------------------------------

--
-- 表的结构 `bmkj_agree`
--

CREATE TABLE IF NOT EXISTS `bmkj_agree` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `moduleid` smallint(6) DEFAULT NULL,
  `infoid` int(10) DEFAULT NULL,
  `ip` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=50 ;

--
-- 转存表中的数据 `bmkj_agree`
--

INSERT INTO `bmkj_agree` (`id`, `moduleid`, `infoid`, `ip`) VALUES
(36, 0, 22, '::1'),
(35, 0, 18, '::1'),
(34, 0, 16, '::1'),
(33, 0, 20, '::1'),
(32, 0, 19, '::1'),
(31, 0, 21, '::1'),
(30, 0, 17, '::1'),
(37, 0, 36, '127.0.0.1'),
(38, 0, 37, '127.0.0.1'),
(39, 0, 38, '127.0.0.1'),
(40, 0, 44, '127.0.0.1'),
(41, 0, 43, '127.0.0.1'),
(42, 0, 40, '127.0.0.1'),
(43, 0, 41, '127.0.0.1'),
(44, 0, 62, '127.0.0.1'),
(45, 0, 59, '127.0.0.1'),
(46, 0, 42, '127.0.0.1'),
(47, 0, 75, '::1'),
(48, 0, 74, '::1'),
(49, 0, 76, '::1');

-- --------------------------------------------------------

--
-- 表的结构 `bmkj_area`
--

CREATE TABLE IF NOT EXISTS `bmkj_area` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parentid` int(10) DEFAULT NULL,
  `sequence` int(10) DEFAULT '0',
  `areaname` varchar(50) DEFAULT NULL,
  `lan` char(30) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

--
-- 转存表中的数据 `bmkj_area`
--

INSERT INTO `bmkj_area` (`id`, `parentid`, `sequence`, `areaname`, `lan`) VALUES
(1, 0, 0, '广东省', 'ch'),
(2, 1, 0, '深圳市', 'ch'),
(3, 2, 0, '龙岗区', 'ch'),
(4, 3, 0, '坂田街道', 'ch'),
(5, 0, 0, '海南省', 'ch'),
(6, 5, 0, '海口市', 'ch'),
(7, 5, 0, '三亚市', 'ch'),
(8, 5, 0, '东方市', 'ch'),
(9, 5, 0, '三沙市', 'ch'),
(10, 0, 0, 'Guangdong', 'en');

-- --------------------------------------------------------

--
-- 表的结构 `bmkj_attribute`
--

CREATE TABLE IF NOT EXISTS `bmkj_attribute` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `moduleid` smallint(6) DEFAULT NULL,
  `sortid` int(10) DEFAULT NULL,
  `fieldtype` tinyint(1) DEFAULT NULL,
  `sequence` int(10) DEFAULT '0',
  `attname` varchar(50) DEFAULT NULL,
  `attvalue` mediumtext,
  `lan` char(30) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=56 ;

--
-- 转存表中的数据 `bmkj_attribute`
--

INSERT INTO `bmkj_attribute` (`id`, `moduleid`, `sortid`, `fieldtype`, `sequence`, `attname`, `attvalue`, `lan`) VALUES
(50, 1, 119, 1, 0, '颜色', '红色|紫色*|蓝色', 'ch'),
(51, 1, 119, 1, 0, '容量', '100ml|180ml*|300ml', 'ch'),
(52, 1, 119, 2, 0, '适合年龄', '18~25岁|25~35岁|35~55岁', 'ch'),
(53, 1, 150, 1, 0, 'Colour', 'red|purple*|blue', 'en'),
(54, 1, 150, 1, 0, 'Capacity', '100ml|180ml*|300ml', 'en'),
(55, 1, 150, 2, 0, 'Suitable age', '18~25|25~35|35~55', 'en');

-- --------------------------------------------------------

--
-- 表的结构 `bmkj_attribute_value`
--

CREATE TABLE IF NOT EXISTS `bmkj_attribute_value` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `infoid` int(10) DEFAULT NULL,
  `attid` int(10) DEFAULT NULL,
  `moduleid` varchar(50) DEFAULT NULL,
  `attvalue` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=287 ;

--
-- 转存表中的数据 `bmkj_attribute_value`
--

INSERT INTO `bmkj_attribute_value` (`id`, `infoid`, `attid`, `moduleid`, `attvalue`) VALUES
(233, 214, 51, '1', '300ml'),
(234, 214, 50, '1', '蓝色'),
(235, 215, 51, '1', '180ml'),
(236, 215, 50, '1', '紫色'),
(237, 215, 52, '1', '35~55岁|'),
(238, 214, 52, '1', '18~25岁|'),
(239, 216, 52, '1', '18~25岁|25~35岁|35~55岁|'),
(240, 216, 51, '1', '180ml'),
(241, 216, 50, '1', '紫色'),
(242, 217, 52, '1', '18~25岁|25~35岁|35~55岁|'),
(243, 217, 51, '1', '300ml'),
(244, 217, 50, '1', '红色'),
(245, 218, 52, '1', '25~35岁|'),
(246, 218, 51, '1', '180ml'),
(247, 218, 50, '1', '蓝色'),
(248, 219, 52, '1', '18~25岁|'),
(249, 219, 51, '1', '300ml'),
(250, 219, 50, '1', '红色'),
(251, 220, 52, '1', '18~25岁|'),
(252, 220, 51, '1', '180ml'),
(253, 220, 50, '1', '紫色'),
(254, 221, 52, '1', '35~55岁|'),
(255, 221, 51, '1', '180ml'),
(256, 221, 50, '1', '紫色'),
(257, 222, 52, '1', '18~25岁|'),
(258, 222, 51, '1', '100ml'),
(259, 222, 50, '1', '蓝色'),
(260, 223, 55, '1', '35~55|'),
(261, 223, 54, '1', '180ml'),
(262, 223, 53, '1', 'purple'),
(263, 224, 55, '1', '18~25|'),
(264, 224, 54, '1', '100ml'),
(265, 224, 53, '1', 'red'),
(266, 225, 55, '1', '25~35|'),
(267, 225, 54, '1', '300ml'),
(268, 225, 53, '1', 'blue'),
(269, 226, 55, '1', '25~35|'),
(270, 226, 54, '1', '180ml'),
(271, 226, 53, '1', 'purple'),
(272, 227, 55, '1', '25~35|'),
(273, 227, 54, '1', '100ml'),
(274, 227, 53, '1', 'red'),
(275, 228, 55, '1', '18~25|'),
(276, 228, 54, '1', '180ml'),
(277, 228, 53, '1', 'purple'),
(278, 229, 55, '1', '35~55|'),
(279, 229, 54, '1', '100ml'),
(280, 229, 53, '1', 'red'),
(281, 230, 55, '1', '35~55|'),
(282, 230, 54, '1', '300ml'),
(283, 230, 53, '1', 'blue'),
(284, 231, 55, '1', '25~35|'),
(285, 231, 54, '1', '300ml'),
(286, 231, 53, '1', 'red');

-- --------------------------------------------------------

--
-- 表的结构 `bmkj_auth_group`
--

CREATE TABLE IF NOT EXISTS `bmkj_auth_group` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parentid` int(10) DEFAULT NULL,
  `title` char(100) DEFAULT NULL,
  `status` tinyint(1) DEFAULT '1',
  `rules` text,
  `lan` char(30) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- 转存表中的数据 `bmkj_auth_group`
--

INSERT INTO `bmkj_auth_group` (`id`, `parentid`, `title`, `status`, `rules`, `lan`) VALUES
(1, 0, '超级管理员', 1, '', 'ch'),
(5, 0, '测试', 1, '266,267,265,268,269,270,271', 'ch');

-- --------------------------------------------------------

--
-- 表的结构 `bmkj_auth_group_access`
--

CREATE TABLE IF NOT EXISTS `bmkj_auth_group_access` (
  `uid` int(10) unsigned NOT NULL DEFAULT '0',
  `group_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `bmkj_auth_group_access`
--

INSERT INTO `bmkj_auth_group_access` (`uid`, `group_id`) VALUES
(1, 1),
(5, 5);

-- --------------------------------------------------------

--
-- 表的结构 `bmkj_auth_rule`
--

CREATE TABLE IF NOT EXISTS `bmkj_auth_rule` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `parentid` int(10) DEFAULT NULL,
  `name` char(80) DEFAULT NULL,
  `title` char(20) DEFAULT '',
  `type` tinyint(1) DEFAULT '1',
  `status` tinyint(1) DEFAULT '1',
  `condition` char(100) DEFAULT '',
  `sequence` int(10) DEFAULT NULL,
  `modulesign` char(30) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=272 ;

--
-- 转存表中的数据 `bmkj_auth_rule`
--

INSERT INTO `bmkj_auth_rule` (`id`, `parentid`, `name`, `title`, `type`, `status`, `condition`, `sequence`, `modulesign`) VALUES
(21, 0, 'journal/index', '工作计划管理', 1, 1, '', 20000, 'oa'),
(24, 0, 'authrule/index', '权限管理', 1, 1, '', 900, 'oa'),
(22, 0, 'index/index', '系统首页', 1, 1, '', 800, 'oa'),
(23, 22, 'index/qqmail', '企业邮箱', 1, 1, '', 0, 'oa'),
(25, 24, 'authrule/edit', '编辑权限', 1, 1, '', 0, 'oa'),
(26, 24, 'authrule/update_all', '批量更新', 1, 1, '', 0, 'oa'),
(27, 24, 'authrule/delete_one', '单条删除', 1, 1, '', 0, 'oa'),
(28, 24, 'authrule/delete_all', '批量删除', 1, 1, '', 0, 'oa'),
(29, 0, 'authgroup/index', '权限组管理', 1, 1, '', 1000, 'oa'),
(30, 29, 'authgroup/edit', '编辑权限组', 1, 1, '', 0, 'oa'),
(31, 29, 'authgroup/delete_one', '单条删除', 1, 1, '', 0, 'oa'),
(32, 29, 'authgroup/delete_all', '批量删除', 1, 1, '', 0, 'oa'),
(33, 21, 'journal/edit', '编辑工作计划', 1, 1, '', 100, 'oa'),
(34, 21, 'journal/delete_one', '单条删除', 1, 1, '', 90, 'oa'),
(35, 21, 'journal/delete_all', '批量删除', 1, 1, '', 80, 'oa'),
(36, 0, 'customer/index', '客户管理', 1, 1, '', 19000, 'oa'),
(37, 36, 'customer/edit', '编辑客户', 1, 1, '', 500, 'oa'),
(38, 36, 'customer/delete_one', '单条删除客户', 1, 1, '', 490, 'oa'),
(39, 36, 'customer/delete_all', '批量删除客户', 1, 1, '', 480, 'oa'),
(42, 0, 'orderbuy/index/orderorbuy/1', '订单管理', 1, 1, '', 18000, 'oa'),
(43, 42, 'orderbuy/edit/orderorbuy/1', '编辑订单', 1, 1, '', 0, 'oa'),
(44, 0, 'sell/index', '产品管理', 1, 1, '', 13000, 'oa'),
(45, 44, 'sell/edit', '编辑产品', 1, 1, '', 0, 'oa'),
(46, 44, 'sell/delete_one', '单条删除', 1, 1, '', 0, 'oa'),
(47, 44, 'sell/delete_all', '批量删除', 1, 1, '', 0, 'oa'),
(48, 44, 'category/index/moduleid/1', '分类管理', 1, 1, '', 0, 'oa'),
(49, 44, 'category/edit/moduleid/1', '编辑分类', 1, 1, '', 0, 'oa'),
(50, 0, 'orderbuy/index/orderorbuy/0', '采购管理', 1, 1, '', 17000, 'oa'),
(51, 50, 'orderbuy/edit/orderorbuy/0', '编辑采购', 1, 1, '', 0, 'oa'),
(52, 0, 'document/index', '文件管理', 1, 1, '', 16000, 'oa'),
(53, 52, 'document/edit', '编辑文件', 1, 1, '', 0, 'oa'),
(54, 52, 'category/index/moduleid/3', '分类管理', 1, 1, '', 0, 'oa'),
(55, 0, 'cashflow/index/cashtype/1', '收入管理', 1, 1, '', 15000, 'oa'),
(56, 0, 'cashflow/index/cashtype/0', '支出管理', 1, 1, '', 14000, 'oa'),
(57, 0, 'supplier/index', '供应商管理', 1, 1, '', 12000, 'oa'),
(58, 57, 'supplier/edit', '编辑供应商', 1, 1, '', 0, 'oa'),
(59, 0, 'info/index', '资讯管理', 1, 1, '', 11000, 'oa'),
(60, 59, 'info/edit', '编辑资讯', 1, 1, '', 0, 'oa'),
(61, 59, 'category/index/moduleid/2', '分类管理', 1, 1, '', 0, 'oa'),
(62, 59, 'category/edit/moduleid/2', '编辑分类', 1, 1, '', 0, 'oa'),
(63, 59, 'sms/index', '短消息管理', 1, 1, '', 0, 'oa'),
(64, 59, 'sms/edit', '发送短消息', 1, 1, '', 0, 'oa'),
(65, 0, 'attendance/index', '考勤管理', 1, 1, '', 10000, 'oa'),
(66, 65, 'attendance/edit', '编辑考勤', 1, 1, '', 0, 'oa'),
(67, 0, 'salary/index', '工资管理', 1, 1, '', 9000, 'oa'),
(68, 67, 'salary/edit', '编辑工资', 1, 1, '', 0, 'oa'),
(69, 0, 'user/index', '员工管理', 1, 1, '', 8000, 'oa'),
(70, 69, 'user/edit', '编辑员工', 1, 1, '', 0, 'oa'),
(71, 22, 'setconfig/index', '参数设置', 1, 1, '', 0, 'oa'),
(72, 0, 'department/index', '部门管理', 1, 1, '', 7000, 'oa'),
(73, 72, 'department/edit', '编辑部门', 1, 1, '', 0, 'oa'),
(74, 0, 'setattendance/index', '考勤设置', 1, 1, '', 6000, 'oa'),
(75, 22, 'databackup/index', '数据库备份', 1, 1, '', 5000, 'oa'),
(76, 36, 'followup/index', '客户跟进', 1, 1, '', 450, 'oa'),
(77, 36, 'followup/edit', '编辑跟进', 1, 1, '', 440, 'oa'),
(78, 36, 'assortment/index/module/customer/sorttype/level', '客户级别管理', 1, 1, '', 410, 'oa'),
(79, 36, 'assortment/edit/module/customer/sorttype/level', '编辑客户级别', 1, 1, '', 400, 'oa'),
(80, 36, 'customer/excelexport', '批量导出客户', 1, 1, '', 460, 'oa'),
(81, 36, 'customer/excelimport', '批量导入客户', 1, 1, '', 470, 'oa'),
(82, 36, 'followup/delete_one', '单条删除客户跟进', 1, 1, '', 430, 'oa'),
(83, 36, 'followup/delete_all', '批量删除客户跟进', 1, 1, '', 420, 'oa'),
(84, 36, 'assortment/delete_one/module/customer/sorttype/level', '单条删除客户级别', 1, 1, '', 390, 'oa'),
(85, 36, 'assortment/delete_all/module/customer/sorttype/level', '批量删除客户级别', 1, 1, '', 380, 'oa'),
(86, 36, 'assortment/index/module/customer/sorttype/comefrom', '客户来源管理', 1, 1, '', 370, 'oa'),
(87, 36, 'assortment/edit/module/customer/sorttype/comefrom', '编辑客户来源', 1, 1, '', 360, 'oa'),
(88, 36, 'assortment/delete_one/module/customer/sorttype/comefrom', '单条删除客户来源', 1, 1, '', 350, 'oa'),
(89, 36, 'assortment/delete_all/module/customer/sorttype/comefrom', '批量删除客户来源', 1, 1, '', 340, 'oa'),
(90, 36, 'assortment/index/module/customer/sorttype/status', '客户状态管理', 1, 1, '', 330, 'oa'),
(91, 36, 'assortment/edit/module/customer/sorttype/status', '编辑客户状态', 1, 1, '', 320, 'oa'),
(92, 36, 'assortment/delete_one/module/customer/sorttype/status', '单条删除客户状态', 1, 1, '', 310, 'oa'),
(93, 36, 'assortment/delete_all/module/customer/sorttype/status', '批量删除客户状态', 1, 1, '', 300, 'oa'),
(262, 259, 'inbox/delete_all', '批量删除', 1, 1, '', 0, 'oa'),
(261, 259, 'inbox/delete_one', '单条删除', 1, 1, '', 0, 'oa'),
(98, 42, 'orderbuy/delete_one/orderorbuy/1', '单条删除订单', 1, 1, '', 0, 'oa'),
(99, 42, 'orderbuy/delete_all/orderorbuy/1', '批量删除订单', 1, 1, '', 0, 'oa'),
(100, 50, 'orderbuy/delete_one/orderorbuy/0', '单条删除采购', 1, 1, '', 0, 'oa'),
(101, 50, 'orderbuy/delete_all/orderorbuy/0', '批量删除采购', 1, 1, '', 0, 'oa'),
(102, 52, 'document/delete_one', '单条删除文件', 1, 1, '', 0, 'oa'),
(103, 52, 'document/delete_all', '批量删除文件', 1, 1, '', 0, 'oa'),
(104, 52, 'category/edit/moduleid/3', '编辑分类', 1, 1, '', 0, 'oa'),
(105, 52, 'category/delete_one/moduleid/3', '单条删除分类', 1, 1, '', 0, 'oa'),
(106, 52, 'category/delete_all/moduleid/3', '批量删除分类', 1, 1, '', 0, 'oa'),
(111, 55, 'cashflow/edit/cashtype/1', '编辑收入', 1, 1, '', 0, 'oa'),
(112, 55, 'cashflow/delete_one/cashtype/1', '单条删除', 1, 1, '', 0, 'oa'),
(113, 55, 'cashflow/delete_all/cashtype/1', '批量删除', 1, 1, '', 0, 'oa'),
(114, 55, 'assortment/index/module/cashflow/sorttype/income', '收入类型管理', 1, 1, '', 0, 'oa'),
(115, 55, 'assortment/edit/module/cashflow/sorttype/income', '编辑收入类型', 1, 1, '', 0, 'oa'),
(116, 55, 'assortment/delete_one/module/cashflow/sorttype/income', '单条删除类型', 1, 1, '', 0, 'oa'),
(117, 55, 'assortment/delete_all/module/cashflow/sorttype/income', '批量删除类型', 1, 1, '', 0, 'oa'),
(118, 56, 'cashflow/edit/cashtype/0', '编辑支出', 1, 1, '', 0, 'oa'),
(119, 56, 'cashflow/delete_one/cashtype/0', '单条删除', 1, 1, '', 0, 'oa'),
(120, 56, 'cashflow/delete_all/cashtype/0', '批量删除', 1, 1, '', 0, 'oa'),
(121, 56, 'assortment/index/module/cashflow/sorttype/expend', '支出类型管理', 1, 1, '', 0, 'oa'),
(122, 56, 'assortment/edit/module/cashflow/sorttype/expend', '编辑支出类型', 1, 1, '', 0, 'oa'),
(123, 56, 'assortment/delete_one/module/cashflow/sorttype/expend', '单条删除支出类型', 1, 1, '', 0, 'oa'),
(124, 56, 'assortment/delete_all/module/cashflow/sorttype/expend', '批量删除支出类型', 1, 1, '', 0, 'oa'),
(125, 44, 'sell/excelexport', '批量导出', 1, 1, '', 0, 'oa'),
(126, 44, 'sell/excelimport', '批量导入', 1, 1, '', 0, 'oa'),
(127, 44, 'category/delete_one/moduleid/1', '单条删除分类', 1, 1, '', 0, 'oa'),
(128, 44, 'category/delete_all/moduleid/1', '批量删除分类', 1, 1, '', 0, 'oa'),
(129, 44, 'property/index/moduleid/1', '属性管理', 1, 1, '', 0, 'oa'),
(130, 44, 'property/edit/moduleid/1', '编辑属性', 1, 1, '', 0, 'oa'),
(131, 44, 'property/delete_one/moduleid/1', '单条删除属性', 1, 1, '', 0, 'oa'),
(132, 44, 'property/delete_all/moduleid/1', '批量删除属性', 1, 1, '', 0, 'oa'),
(133, 57, 'supplier/delete_one', '单条删除', 1, 1, '', 0, 'oa'),
(134, 57, 'supplier/delete_all', '批量删除', 1, 1, '', 0, 'oa'),
(135, 57, 'assortment/index/module/supplier/sorttype/level', '级别管理', 1, 1, '', 0, 'oa'),
(136, 57, 'assortment/edit/module/supplier/sorttype/level', '编辑级别', 1, 1, '', 0, 'oa'),
(137, 57, 'assortment/delete_one/module/supplier/sorttype/level', '单条删除级别', 1, 1, '', 0, 'oa'),
(138, 57, 'assortment/delete_all/module/supplier/sorttype/level', '批量删除级别', 1, 1, '', 0, 'oa'),
(139, 57, 'assortment/index/module/supplier/sorttype/comefrom', '来源管理', 1, 1, '', 0, 'oa'),
(140, 57, 'assortment/edit/module/supplier/sorttype/comefrom', '编辑来源', 1, 1, '', 0, 'oa'),
(141, 57, 'assortment/delete_one/module/supplier/sorttype/comefrom', '单条删除来源', 1, 1, '', 0, 'oa'),
(142, 57, 'assortment/delete_all/module/supplier/sorttype/comefrom', '批量删除来源', 1, 1, '', 0, 'oa'),
(143, 57, 'assortment/index/module/supplier/sorttype/status', '状态管理', 1, 1, '', 0, 'oa'),
(144, 57, 'assortment/edit/module/supplier/sorttype/status', '编辑状态', 1, 1, '', 0, 'oa'),
(145, 57, 'assortment/delete_one/module/supplier/sorttype/status', '单条删除状态', 1, 1, '', 0, 'oa'),
(146, 57, 'assortment/delete_all/module/supplier/sorttype/status', '批量删除状态', 1, 1, '', 0, 'oa'),
(255, 69, 'user/editmyself', '编辑个人资料', 1, 1, '', 0, 'oa'),
(256, 36, 'followup/view', '查看跟进', 1, 1, '', 0, 'oa'),
(257, 65, 'attendance/view', '查看详情', 1, 1, '', 0, 'oa'),
(258, 69, 'user/view', '查看详情', 1, 1, '', 0, 'oa'),
(151, 59, 'info/delete_one', '单条删除资讯', 1, 1, '', 0, 'oa'),
(152, 59, 'info/delete_all', '批量删除资讯', 1, 1, '', 0, 'oa'),
(153, 59, 'sms/delete_one', '单条删除短消息', 1, 1, '', 0, 'oa'),
(154, 59, 'sms/delete_all', '批量删除短消息', 1, 1, '', 0, 'oa'),
(155, 59, 'category/delete_one/moduleid/2', '单条删除分类', 1, 1, '', 0, 'oa'),
(156, 59, 'category/delete_all/moduleid/2', '批量删除分类', 1, 1, '', 0, 'oa'),
(254, 22, 'index/delcache', '清理缓存', 1, 1, '', 0, 'oa'),
(161, 65, 'attendance/delete_one', '单条删除考勤', 1, 1, '', 0, 'oa'),
(162, 65, 'attendance/delete_all', '批量删除考勤', 1, 1, '', 0, 'oa'),
(163, 67, 'salary/delete_one', '单条删除工资', 1, 1, '', 0, 'oa'),
(164, 67, 'salary/delete_all', '批量删除工资', 1, 1, '', 0, 'oa'),
(165, 67, 'assortment/index/module/salary/sorttype/reduce', '工资扣除项管理', 1, 1, '', 0, 'oa'),
(166, 67, 'assortment/edit/module/salary/sorttype/reduce', '编辑工资扣除项', 1, 1, '', 0, 'oa'),
(167, 67, 'assortment/delete_one/module/salary/sorttype/reduce', '单条删除工资扣除项', 1, 1, '', 0, 'oa'),
(168, 67, 'assortment/delete_all/module/salary/sorttype/reduce', '批量删除工资扣除项', 1, 1, '', 0, 'oa'),
(169, 67, 'assortment/index/module/salary/sorttype/plus', '工资加给项管理', 1, 1, '', 0, 'oa'),
(170, 67, 'assortment/edit/module/salary/sorttype/plus', '编辑工资加给项', 1, 1, '', 0, 'oa'),
(171, 67, 'assortment/delete_one/module/salary/sorttype/plus', '单条删除工资加给项', 1, 1, '', 0, 'oa'),
(172, 67, 'assortment/delete_all/module/salary/sorttype/plus', '批量删除工资加给项', 1, 1, '', 0, 'oa'),
(173, 69, 'user/delete_one', '单条删除员工', 1, 1, '', 0, 'oa'),
(174, 69, 'user/delete_all', '批量删除员工', 1, 1, '', 0, 'oa'),
(175, 69, 'assortment/index/module/user/sorttype/status', '状态管理', 1, 1, '', 0, 'oa'),
(176, 69, 'assortment/edit/module/user/sorttype/status', '编辑状态', 1, 1, '', 0, 'oa'),
(177, 69, 'assortment/delete_one/module/user/sorttype/status', '单条删除状态', 1, 1, '', 0, 'oa'),
(178, 69, 'assortment/delete_all/module/user/sorttype/status', '批量删除状态', 1, 1, '', 0, 'oa'),
(183, 72, 'department/delete_one', '单条删除部门', 1, 1, '', 0, 'oa'),
(184, 72, 'department/delete_all', '批量删除部门', 1, 1, '', 0, 'oa'),
(185, 74, 'setattendance/edit', '编辑考勤设置', 1, 1, '', 0, 'oa'),
(186, 74, 'setattendance/delete_one', '单条删除', 1, 1, '', 0, 'oa'),
(187, 74, 'setattendance/delete_all', '批量删除', 1, 1, '', 0, 'oa'),
(188, 0, 'area/index', '地区管理', 1, 1, '', 2000, 'oa'),
(189, 188, 'area/edit', '编辑地区', 1, 1, '', 0, 'oa'),
(190, 188, 'area/delete_one', '单条删除', 1, 1, '', 0, 'oa'),
(191, 188, 'area/delete_all', '批量删除', 1, 1, '', 0, 'oa'),
(192, 36, 'assortment/update_all/module/customer/sorttype/level', '批量更新级别', 1, 1, '', 0, 'oa'),
(193, 36, 'assortment/update_all/module/customer/sorttype/comefrom', '批量更新来源', 1, 1, '', 0, 'oa'),
(194, 36, 'assortment/update_all/module/customer/sorttype/status', '批量更新状态', 1, 1, '', 0, 'oa'),
(260, 259, 'inbox/view', '查看详情', 1, 1, '', 0, 'oa'),
(196, 52, 'category/update_all/moduleid/3', '批量更新分类', 1, 1, '', 0, 'oa'),
(198, 55, 'assortment/update_all/module/cashflow/sorttype/income', '批量更新收入类型', 1, 1, '', 0, 'oa'),
(199, 56, 'assortment/update_all/module/cashflow/sorttype/expend', '批量更新支出类型', 1, 1, '', 0, 'oa'),
(200, 44, 'sell/update_all', '批量更新产品', 1, 1, '', 0, 'oa'),
(201, 44, 'category/update_all/moduleid/1', '批量更新分类', 1, 1, '', 0, 'oa'),
(202, 44, 'property/update_all/moduleid/1', '批量更新属性', 1, 1, '', 0, 'oa'),
(203, 57, 'assortment/update_all/module/supplier/sorttype/level', '批量更新级别', 1, 1, '', 0, 'oa'),
(204, 57, 'assortment/update_all/module/supplier/sorttype/comefrom', '批量更新来源', 1, 1, '', 0, 'oa'),
(205, 57, 'assortment/update_all/module/supplier/sorttype/status', '批量更新状态', 1, 1, '', 0, 'oa'),
(259, 0, 'inbox/index', '收件箱管理', 1, 1, '', 4000, 'oa'),
(207, 59, 'info/update_all', '批量更新资讯', 1, 1, '', 0, 'oa'),
(208, 59, 'category/update_all/moduleid/2', '批量更新分类', 1, 1, '', 0, 'oa'),
(253, 67, 'salary/view', '查看详情', 1, 1, '', 0, 'oa'),
(210, 67, 'assortment/update_all/module/salary/sorttype/reduce', '批量更新扣除项', 1, 1, '', 0, 'oa'),
(211, 67, 'assortment/update_all/module/salary/sorttype/plus', '批量更新加给项', 1, 1, '', 0, 'oa'),
(212, 69, 'assortment/update_all/module/user/sorttype/status', '批量更新状态', 1, 1, '', 0, 'oa'),
(214, 72, 'department/update_all', '批量更新部门', 1, 1, '', 0, 'oa'),
(232, 42, 'assortment/edit/module/order/sorttype/status', '编辑状态', 1, 1, '', 0, 'oa'),
(231, 42, 'assortment/index/module/order/sorttype/status', '状态管理', 1, 1, '', 0, 'oa'),
(217, 21, 'journal/view', '查看工作计划', 1, 1, '', 0, 'oa'),
(218, 36, 'customer/view', '查看客户', 1, 1, '', 0, 'oa'),
(219, 59, 'sms/view', '查看短消息', 1, 1, '', 0, 'oa'),
(220, 21, 'assortment/index/module/journal/sorttype/status', '状态管理', 1, 1, '', 0, 'oa'),
(221, 21, 'assortment/edit/module/journal/sorttype/status', '编辑状态', 1, 1, '', 0, 'oa'),
(222, 21, 'assortment/delete_one/module/journal/sorttype/status', '单条删除状态', 1, 1, '', 0, 'oa'),
(223, 21, 'assortment/delete_all/module/journal/sorttype/status', '批量删除状态', 1, 1, '', 0, 'oa'),
(224, 36, 'customer/followuplist', '跟进列表', 1, 1, '', 0, 'oa'),
(225, 36, 'customer/followupview', '跟进详情', 1, 1, '', 0, 'oa'),
(226, 36, 'customer/orderlist', '订单列表', 1, 1, '', 0, 'oa'),
(227, 36, 'customer/orderview', '订单详情', 1, 1, '', 0, 'oa'),
(228, 36, 'customer/doclist', '附件列表', 1, 1, '', 0, 'oa'),
(229, 52, 'document/view', '查看文件', 1, 1, '', 0, 'oa'),
(230, 59, 'info/view', '查看详情', 1, 1, '', 0, 'oa'),
(233, 42, 'assortment/delete_one/module/order/sorttype/status', '单条删除状态', 1, 1, '', 0, 'oa'),
(234, 42, 'assortment/delete_all/module/order/sorttype/status', '批量删除状态', 1, 1, '', 0, 'oa'),
(235, 50, 'assortment/index/module/buy/sorttype/status', '状态管理', 1, 1, '', 0, 'oa'),
(236, 235, 'assortment/edit/module/buy/sorttype/status', '编辑状态', 1, 1, '', 0, 'oa'),
(237, 50, 'assortment/delete_one/module/buy/sorttype/status', '单条删除状态', 1, 1, '', 0, 'oa'),
(238, 50, 'assortment/delete_all/module/buy/sorttype/status', '批量删除状态', 1, 1, '', 0, 'oa'),
(239, 0, 'assortment/index/module/logics/sorttype/logicscom', '物流公司管理', 1, 1, '', 3000, 'oa'),
(240, 239, 'assortment/edit/module/logics/sorttype/logicscom', '编辑物流公司', 1, 1, '', 0, 'oa'),
(241, 239, 'assortment/delete_one/module/logics/sorttype/logicscom', '单条删除', 1, 1, '', 0, 'oa'),
(242, 239, 'assortment/delete_all/module/logics/sorttype/logicscom', '批量删除', 1, 1, '', 0, 'oa'),
(243, 239, 'assortment/update_all/module/logics/sorttype/logicscom', '批量更新', 1, 1, '', 0, 'oa'),
(244, 42, 'orderbuy/view/orderorbuy/1', '查看订单详情', 1, 1, '', 0, 'oa'),
(245, 50, 'orderbuy/view/orderorbuy/0', '查看采购详情', 1, 1, '', 0, 'oa'),
(246, 55, 'cashflow/view/cashtype/1', '查看详情', 1, 1, '', 0, 'oa'),
(247, 56, 'cashflow/view/cashtype/0', '查看详情', 1, 1, '', 0, 'oa'),
(248, 44, 'sell/view', '查看产品详情', 1, 1, '', 0, 'oa'),
(249, 57, 'supplier/view', '查看供应商详情', 1, 1, '', 0, 'oa'),
(250, 57, 'supplier/orderlist', '采购列表', 1, 1, '', 0, 'oa'),
(251, 57, 'supplier/orderview', '采购详情', 1, 1, '', 0, 'oa'),
(252, 57, 'supplier/doclist', '附件列表', 1, 1, '', 0, 'oa'),
(263, 22, 'index/desktop', '生成桌面快捷方式', 1, 1, '', 0, 'oa'),
(264, 22, 'hetada', '网站管理', 1, 1, '', 700, 'oa'),
(265, 0, 'index/index', '后台管理', 1, 1, '', NULL, 'web'),
(266, 0, 'product/index', '产品管理', 1, 1, '', NULL, 'web'),
(267, 266, 'product/edit', '产品编辑', 1, 1, '', NULL, 'web'),
(268, 265, 'setconfig/index', '参数设置', 1, 1, '', NULL, 'web'),
(269, 265, 'sort/index', '分类管理', 1, 1, '', NULL, 'web'),
(270, 265, 'attribute/index', '属性管理', 1, 1, '', NULL, 'web'),
(271, 265, 'attribute/getattribute', '分类属性获取', 1, 1, '', NULL, 'web');

-- --------------------------------------------------------

--
-- 表的结构 `bmkj_chat`
--

CREATE TABLE IF NOT EXISTS `bmkj_chat` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `chattype` varchar(50) DEFAULT NULL,
  `account` varchar(200) DEFAULT NULL,
  `chatname` varchar(100) DEFAULT NULL,
  `thumb` varchar(255) DEFAULT NULL,
  `sequence` smallint(6) DEFAULT NULL,
  `lan` char(30) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- 转存表中的数据 `bmkj_chat`
--

INSERT INTO `bmkj_chat` (`id`, `chattype`, `account`, `chatname`, `thumb`, `sequence`, `lan`) VALUES
(1, 'QQ', '1163938946', '售前咨询', '/Apps/Syscore/View/Public/img/qq.gif', 5, 'ch');

-- --------------------------------------------------------

--
-- 表的结构 `bmkj_comment`
--

CREATE TABLE IF NOT EXISTS `bmkj_comment` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `moduleid` smallint(6) DEFAULT NULL,
  `infoid` bigint(20) DEFAULT NULL,
  `parentid` int(10) DEFAULT NULL,
  `sequence` int(10) NOT NULL DEFAULT '0',
  `userid` int(10) DEFAULT NULL,
  `star` tinyint(1) DEFAULT '0',
  `content` mediumtext,
  `addtime` int(10) DEFAULT NULL,
  `agree` int(10) DEFAULT '0',
  `against` int(10) DEFAULT '0',
  `ip` varchar(50) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `anonymous` tinyint(1) DEFAULT '0',
  `lan` char(30) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `id_2` (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=80 ;

--
-- 转存表中的数据 `bmkj_comment`
--

INSERT INTO `bmkj_comment` (`id`, `moduleid`, `infoid`, `parentid`, `sequence`, `userid`, `star`, `content`, `addtime`, `agree`, `against`, `ip`, `status`, `anonymous`, `lan`) VALUES
(74, 1, 222, 0, 0, NULL, 3, '已到手，产品不错，好评！！', 1477199831, 1, 0, NULL, 1, 1, 'ch'),
(75, 2, 314, 0, 0, NULL, 3, '11111111111111', 1477202573, 0, 1, NULL, 1, 1, 'ch'),
(76, 1, 222, 74, 0, NULL, 3, '111111111111111111', 1477206552, 0, 1, '::1', 1, 1, 'ch'),
(77, 1, 222, 76, 0, NULL, 3, '222222222', 1477206599, 0, 0, '::1', 1, 1, 'ch'),
(78, 1, 222, 77, 0, NULL, 3, '33333333333', 1477206834, 0, 0, '::1', 1, 1, 'ch'),
(79, 1, 222, 74, 0, NULL, 3, 'AAAAAAAAAAAAAA', 1477212846, 0, 0, NULL, 1, 1, 'ch');

-- --------------------------------------------------------

--
-- 表的结构 `bmkj_down`
--

CREATE TABLE IF NOT EXISTS `bmkj_down` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sortid` int(10) DEFAULT NULL,
  `areaid` int(10) DEFAULT NULL,
  `client` varchar(200) DEFAULT 'pc,wap,weixin',
  `status` varchar(200) DEFAULT NULL,
  `sequence` int(10) DEFAULT '0',
  `hits` int(10) DEFAULT '1',
  `auth_group` varchar(200) DEFAULT NULL,
  `thumb` varchar(255) DEFAULT NULL,
  `linkurl` varchar(255) DEFAULT NULL,
  `title` varchar(100) DEFAULT NULL,
  `seotitle` varchar(255) DEFAULT NULL,
  `keyword` varchar(255) DEFAULT NULL,
  `description` varchar(500) DEFAULT NULL,
  `fileurl` varchar(255) DEFAULT NULL,
  `morefileurl` text,
  `content1` text,
  `addtime` int(10) DEFAULT NULL,
  `lan` char(30) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=225 ;

--
-- 转存表中的数据 `bmkj_down`
--

INSERT INTO `bmkj_down` (`id`, `sortid`, `areaid`, `client`, `status`, `sequence`, `hits`, `auth_group`, `thumb`, `linkurl`, `title`, `seotitle`, `keyword`, `description`, `fileurl`, `morefileurl`, `content1`, `addtime`, `lan`) VALUES
(201, 136, 4, 'pc,wap', 'view,commend,new,hot', 0, 1, '', '', '', '化妆品系列产品规格目录', '', '', '', '/uploads/test.rar', '', '', 1477157700, 'ch'),
(202, 136, 4, 'pc,wap', 'view,commend,new,hot', 0, 1, '', '', '', '护肤品代理价格表', '', '', '', '/uploads/test.rar', '', '', 1477157895, 'ch'),
(203, 136, 4, 'pc,wap', 'view,commend,new,hot', 0, 1, '', '', '', '化妆品系列产品规格目录', '', '', '', '/uploads/test.rar', '', '', 1477157908, 'ch'),
(204, 136, 4, 'pc,wap', 'view,commend,new,hot', 0, 1, '', '', '', '护肤品代理价格表', '', '', '', '/uploads/test.rar', '', '', 1477157994, 'ch'),
(205, 136, 4, 'pc,wap', 'view,commend,new,hot', 0, 1, '', '', '', '化妆品系列产品规格目录', '', '', '', '/uploads/test.rar', '', '', 1477158010, 'ch'),
(206, 136, 4, 'pc,wap', 'view,commend,new,hot', 0, 1, '', '', '', '护肤品代理价格表', '', '', '', '/uploads/test.rar', '', '', 1477158031, 'ch'),
(207, 136, 4, 'pc,wap', 'view,commend,new,hot', 0, 1, '', '', '', '化妆品系列产品规格目录', '', '', '', '/uploads/test.rar', '', '', 1477158045, 'ch'),
(208, 136, 4, 'pc,wap', 'view,commend,new,hot', 0, 1, '', '', '', '护肤品代理价格表', '', '', '', '/uploads/test.rar', '', '', 1477158061, 'ch'),
(209, 136, 4, 'pc,wap', 'view,commend,new,hot', 0, 1, '', '', '', '化妆品系列产品规格目录', '', '', '', '/uploads/test.rar', '', '', 1477158076, 'ch'),
(210, 136, 4, 'pc,wap', 'view,commend,new,hot', 0, 1, '', '', '', '护肤品代理价格表', '', '', '', '/uploads/test.rar', '', '', 1477158093, 'ch'),
(211, 136, 4, 'pc,wap', 'view,commend,new,hot', 0, 1, '', '', '', '化妆品系列产品规格目录', '', '', '', '/uploads/test.rar', '', '', 1477158106, 'ch'),
(212, 136, 4, 'pc,wap', 'view,commend,new,hot', 0, 1, '', '', '', '护肤品代理价格表', '', '', '', '/uploads/test.rar', '', '', 1477158122, 'ch'),
(213, 166, 10, 'pc,wap', 'view,commend,new,hot', 0, 1, '', '', '', 'Cosmetics series product specifications', '', '', '', '/uploads/test.rar', '', '', 1477243307, 'en'),
(214, 166, 10, 'pc,wap', 'view,commend,new,hot', 0, 1, '', '', '', 'Skin care agent price list', '', '', '', '/uploads/test.rar', '', '', 1477243369, 'en'),
(215, 165, 10, 'pc,wap', 'view,commend,new,hot', 0, 1, '', '', '', 'Cosmetics series product specifications', '', '', '', '/uploads/test.rar', '', '', 1477243416, 'en'),
(216, 162, 10, 'pc,wap', 'view,commend,new,hot', 0, 1, '', '', '', 'Skin care agent price list', '', '', '', '/uploads/test.rar', '', '', 1477243449, 'en'),
(217, 162, 10, 'pc,wap', 'view,commend,new,hot', 0, 1, '', '', '', 'Cosmetics series product specifications', '', '', '', '/uploads/test.rar', '', '', 1477243463, 'en'),
(218, 164, 10, 'pc,wap', 'view,commend,new,hot', 0, 1, '', '', '', 'Skin care agent price list', '', '', '', '/uploads/test.rar', '', '', 1477243482, 'en'),
(219, 163, 10, 'pc,wap', 'view,commend,new,hot', 0, 1, '', '', '', 'Cosmetics series product specifications', '', '', '', '/uploads/test.rar', '', '', 1477243506, 'en'),
(220, 165, 10, 'pc,wap', 'view,commend,new,hot', 0, 1, '', '', '', 'Skin care agent price list', '', '', '', '/uploads/test.rar', '', '', 1477243522, 'en'),
(221, 166, 10, 'pc,wap', 'view,commend,new,hot', 0, 1, '', '', '', 'Cosmetics series product specifications', '', '', '', '/uploads/test.rar', '', '', 1477243536, 'en'),
(222, 163, 10, 'pc,wap', 'view,commend,new,hot', 0, 1, '', '', '', 'Skin care agent price list', '', '', '', '/uploads/test.rar', '', '', 1477243551, 'en'),
(223, 163, 10, 'pc,wap', 'view,commend,new,hot', 0, 1, '', '', '', 'Cosmetics series product specifications', '', '', '', '/uploads/test.rar', '', '', 1477243569, 'en'),
(224, 162, 10, 'pc,wap', 'view,commend,new,hot', 0, 1, '', '', '', 'Skin care agent price list', '', '', '', '/uploads/test.rar', '', '', 1477243583, 'en');

-- --------------------------------------------------------

--
-- 表的结构 `bmkj_field`
--

CREATE TABLE IF NOT EXISTS `bmkj_field` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `fieldlabel` varchar(50) DEFAULT NULL,
  `fieldtext` varchar(100) DEFAULT NULL,
  `fieldvalue` text,
  `fieldtype` varchar(50) DEFAULT NULL,
  `sequence` int(10) DEFAULT NULL,
  `lan` char(30) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=98 ;

--
-- 转存表中的数据 `bmkj_field`
--

INSERT INTO `bmkj_field` (`id`, `fieldlabel`, `fieldtext`, `fieldvalue`, `fieldtype`, `sequence`, `lan`) VALUES
(50, 'logo', '电脑版LOGO', '/Template/default/Public/img/logo.png', 'imgupload', 0, 'ch'),
(51, 'telephone', '电脑版电话', '400-400-4000', 'text', 0, 'ch'),
(52, 'copyright', '电脑版底部版权', '深圳市XXXX科技有限公司 版权所有&lt;br&gt;\r\nCopyright &amp;copy; 2011-2016　localhost  All Rights Reserved.  &lt;a href=&quot;http://www.miitbeian.gov.cn/&quot; rel=&quot;nofollow&quot; target=&quot;_blank&quot;&gt;粤ICP备11111111号-1​&lt;/a&gt;&lt;br&gt;\r\n地址：广东省深圳市龙岗区坂田街道吉华路XXX号XX大厦111室', 'textarea', 0, 'ch'),
(53, 'aboutus', '电脑版首页公司简介', '&lt;p&gt;&amp;nbsp; &amp;nbsp; &amp;nbsp; 深圳市XX科技有限公司从2006年起研究网络营销及电子商务领域；以网站建设为基础,致力于为您提供品牌营销型网站设计、系统软件开发、企业邮箱、域名注册及虚拟主机、云服务器、网站维护托管、SEO/SEM优化推广、400电话等产品和服务。&lt;/p&gt;', 'richtext', 0, 'ch'),
(54, 'slogan', '电脑版首页顶部左侧文字', '有理想的地方，地狱都是天堂。', 'text', 0, 'ch'),
(55, 'video', '电脑版首页视频', 'http://www.bmkj.net/didyouknow.flv', 'fileupload', 0, 'ch'),
(56, 'sitetitle', '网站标题', '深圳市XXX科技有限公司', 'text', 0, 'ch'),
(57, 'sitekeyword', '网站关键词', '深圳市XXX科技有限公司', 'text', 0, 'ch'),
(58, 'sitedescription', '网站描述', '深圳市XXX科技有限公司', 'textarea', 0, 'ch'),
(59, 'producttitle', '产品中心标题', '产品中心', 'text', 0, 'ch'),
(60, 'productkeyword', '产品中心关键词', '产品中心', 'text', 0, 'ch'),
(61, 'productdescription', '产品中心描述', '产品中心', 'textarea', 0, 'ch'),
(62, 'newstitle', '新闻资讯标题', '新闻资讯', 'text', 0, 'ch'),
(63, 'newskeyword', '新闻资讯关键词', '新闻资讯', 'text', 0, 'ch'),
(64, 'newsdescription', '新闻资讯描述', '新闻资讯', 'textarea', 0, 'ch'),
(65, 'projecttitle', '案例展示标题', '案例展示', 'text', 0, 'ch'),
(66, 'projectkeyword', '案例展示关键词', '案例展示', 'text', 0, 'ch'),
(67, 'projectdescription', '案例展示描述', '案例展示', 'textarea', 0, 'ch'),
(68, 'downtitle', '下载中心标题', '下载中心', 'text', 0, 'ch'),
(69, 'downkeyword', '下载中心关键词', '下载中心', 'text', 0, 'ch'),
(70, 'downdescription', '下载中心描述', '下载中心', 'textarea', 0, 'ch'),
(71, 'guestbooktitle', '在线留言标题', '在线留言', 'text', 0, 'ch'),
(72, 'guestbookkeyword', '在线留言关键词', '在线留言', 'text', 0, 'ch'),
(73, 'guestbookdescription', '在线留言描述', '在线留言', 'textarea', 0, 'ch'),
(74, 'logo', '电脑版LOGO', '/Template/en/Public/img/logo.png', 'imgupload', 0, 'en'),
(75, 'telephone', '电脑版电话', '86-755-XXXX XXXX', 'text', 0, 'en'),
(76, 'copyright', '电脑版底部版权', 'Shen Zhen XXX Technology Co., Ltd. &lt;br&gt;\r\nCopyright &amp;copy; 2011-2016　localhost  All Rights Reserved.  &lt;br&gt;\r\nAdd：Bantian street, Longgang District of Shenzhen City, Guangdong province Jihua Road No. XXX XX building room 111', 'textarea', 0, 'en'),
(77, 'aboutus', '电脑版首页公司简介', '&lt;p&gt;Shenzhen XX Technology Co., Ltd. from 2006 to study the field of network marketing and e-commerce; The website&amp;nbsp;&lt;/p&gt;&lt;p&gt;construction as the foundation, dedicated to providing you with the brand marketing website design, software&amp;nbsp;&lt;/p&gt;&lt;p&gt;development, enterprise mailbox, domain name registration, virtual host, server, cloud hosting, website maintenance&amp;nbsp;&lt;/p&gt;&lt;p&gt;SEO/SEM optimization promotion, 400 phones and other...&lt;/p&gt;', 'richtext', 0, 'en'),
(78, 'slogan', '电脑版首页顶部左侧文字', 'Have fond dream place , hell to be also Heaven', 'text', 0, 'en'),
(79, 'video', '电脑版首页视频', 'http://www.bmkj.net/didyouknow.flv', 'fileupload', 0, 'en'),
(80, 'sitetitle', '网站标题', 'Shen Zhen XXX Technology Co., Ltd.', 'text', 0, 'en'),
(81, 'sitekeyword', '网站关键词', 'Shen Zhen XXX Technology Co., Ltd.', 'text', 0, 'en'),
(82, 'sitedescription', '网站描述', 'Shen Zhen XXX Technology Co., Ltd.', 'textarea', 0, 'en'),
(83, 'producttitle', '产品中心标题', 'Products', 'text', 0, 'en'),
(84, 'productkeyword', '产品中心关键词', 'products', 'text', 0, 'en'),
(85, 'productdescription', '产品中心描述', 'products', 'textarea', 0, 'en'),
(86, 'newstitle', '新闻资讯标题', 'News', 'text', 0, 'en'),
(87, 'newskeyword', '新闻资讯关键词', 'news', 'text', 0, 'en'),
(88, 'newsdescription', '新闻资讯描述', 'news', 'textarea', 0, 'en'),
(89, 'projecttitle', '案例展示标题', 'projects', 'text', 0, 'en'),
(90, 'projectkeyword', '案例展示关键词', 'projects', 'text', 0, 'en'),
(91, 'projectdescription', '案例展示描述', 'projects', 'textarea', 0, 'en'),
(92, 'downtitle', '下载中心标题', 'download', 'text', 0, 'en'),
(93, 'downkeyword', '下载中心关键词', 'download', 'text', 0, 'en'),
(94, 'downdescription', '下载中心描述', 'download', 'textarea', 0, 'en'),
(95, 'guestbooktitle', '在线留言标题', 'feedback', 'text', 0, 'en'),
(96, 'guestbookkeyword', '在线留言关键词', 'feedback', 'text', 0, 'en'),
(97, 'guestbookdescription', '在线留言描述', 'feedback', 'textarea', 0, 'en');

-- --------------------------------------------------------

--
-- 表的结构 `bmkj_guestbook`
--

CREATE TABLE IF NOT EXISTS `bmkj_guestbook` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(30) DEFAULT NULL,
  `title` varchar(100) DEFAULT NULL,
  `content` text,
  `status` tinyint(1) DEFAULT NULL,
  `realname` varchar(30) DEFAULT NULL,
  `contact` varchar(500) DEFAULT NULL,
  `company` varchar(200) DEFAULT NULL,
  `telephone` varchar(50) DEFAULT NULL,
  `mobile` varchar(50) DEFAULT NULL,
  `qq` varchar(30) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `addtime` int(10) DEFAULT NULL,
  `ip` varchar(50) DEFAULT NULL,
  `lan` char(30) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=37 ;

--
-- 转存表中的数据 `bmkj_guestbook`
--

INSERT INTO `bmkj_guestbook` (`id`, `username`, `title`, `content`, `status`, `realname`, `contact`, `company`, `telephone`, `mobile`, `qq`, `email`, `addtime`, `ip`, `lan`) VALUES
(36, NULL, '我想做你们的化妆品代理', '我想做你们的化妆品代理', 0, '李总', NULL, NULL, '', '13111111111', '10000000000', 'info@xxxx.net', 1477158697, NULL, 'ch');

-- --------------------------------------------------------

--
-- 表的结构 `bmkj_keywordlink`
--

CREATE TABLE IF NOT EXISTS `bmkj_keywordlink` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `keyword` varchar(50) DEFAULT NULL,
  `linkurl` varchar(255) DEFAULT NULL,
  `sequence` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=45 ;

-- --------------------------------------------------------

--
-- 表的结构 `bmkj_language`
--

CREATE TABLE IF NOT EXISTS `bmkj_language` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `adminname` varchar(50) DEFAULT NULL,
  `viewname` varchar(50) DEFAULT NULL,
  `status` tinyint(1) DEFAULT '1',
  `isdefault` tinyint(1) DEFAULT NULL,
  `mulu` varchar(20) DEFAULT NULL,
  `sequence` int(10) DEFAULT '0',
  `ico` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=27 ;

--
-- 转存表中的数据 `bmkj_language`
--

INSERT INTO `bmkj_language` (`id`, `adminname`, `viewname`, `status`, `isdefault`, `mulu`, `sequence`, `ico`) VALUES
(2, '简体中文', '简体中文', 1, 1, 'ch', 100, '/Apps/Syscore/View/Public/img/cn.png'),
(25, 'English', 'English', 1, 0, 'en', 90, '/Apps/Syscore/View/Public/img/en.png');

-- --------------------------------------------------------

--
-- 表的结构 `bmkj_module`
--

CREATE TABLE IF NOT EXISTS `bmkj_module` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `module` varchar(20) DEFAULT NULL,
  `modulename` varchar(20) DEFAULT NULL,
  `moduledir` varchar(20) DEFAULT NULL,
  `disabled` tinyint(1) DEFAULT '1',
  `listnum` smallint(6) DEFAULT NULL,
  `isdisplay` varchar(200) DEFAULT NULL,
  `sequence` int(10) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `moduleid` (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- 转存表中的数据 `bmkj_module`
--

INSERT INTO `bmkj_module` (`id`, `module`, `modulename`, `moduledir`, `disabled`, `listnum`, `isdisplay`, `sequence`) VALUES
(1, 'Product', '产品', 'Product', 1, 6, 'attribute,area,morecontents,thumb,morepics,fileurl,morefiles,price,hits,client,status,addtime,linkurl,sort,sortimg,addinfo,leftdisplay', 100),
(2, 'News', '新闻', 'News', 1, 7, 'attribute,area,morecontents,thumb,morepics,fileurl,morefiles,price,hits,client,status,addtime,linkurl,sort,sortimg,addinfo,leftdisplay', 90),
(3, 'Down', '下载', 'Down', 1, 10, 'attribute,area,morecontents,thumb,morepics,fileurl,morefiles,price,hits,client,status,addtime,linkurl,sort,sortimg,addinfo,leftdisplay', 80),
(4, 'Page', '单页', 'Page', 1, 10, 'attribute,area,morecontents,thumb,morepics,fileurl,morefiles,price,hits,client,status,addtime,linkurl,sort,sortimg,addinfo,leftdisplay', 70),
(5, 'Project', '案例', 'Project', 1, 6, 'attribute,area,morecontents,thumb,morepics,fileurl,morefiles,price,hits,client,status,addtime,linkurl,sort,sortimg,addinfo,leftdisplay', 55);

-- --------------------------------------------------------

--
-- 表的结构 `bmkj_navigation`
--

CREATE TABLE IF NOT EXISTS `bmkj_navigation` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `navname` varchar(50) DEFAULT NULL,
  `navurl` varchar(500) DEFAULT NULL,
  `sequence` int(10) DEFAULT NULL,
  `client` varchar(200) DEFAULT NULL,
  `outflag` int(2) DEFAULT NULL,
  `parentid` int(10) DEFAULT NULL,
  `lan` char(30) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=118 ;

--
-- 转存表中的数据 `bmkj_navigation`
--

INSERT INTO `bmkj_navigation` (`id`, `navname`, `navurl`, `sequence`, `client`, `outflag`, `parentid`, `lan`) VALUES
(86, 'Home', '/en/', 100, 'pc,wap', 0, 0, 'en'),
(87, 'Products', '/en/Product/index.html', 90, 'pc,wap', 0, 0, 'en'),
(54, '首页', '/', 100, 'pc,wap', 0, 0, 'ch'),
(55, '产品中心', '/Product/index.html', 90, 'pc,wap', 0, 0, 'ch'),
(56, '新闻资讯', '/News/index.html', 80, 'pc,wap', 0, 0, 'ch'),
(57, '案例展示', '/Project/index.html', 70, 'pc,wap', 0, 0, 'ch'),
(58, '下载中心', '/Down/index.html', 60, 'pc,wap', 0, 0, 'ch'),
(59, '关于我们', '/Page/view/id/223.html', 50, 'pc,wap', 0, 0, 'ch'),
(60, '联系我们', '/Page/view/id/224.html', 40, 'pc,wap', 0, 0, 'ch'),
(61, '在线留言', '/Guestbook/index.html', 30, 'pc,wap', 0, 0, 'ch'),
(62, '一级分类A', '/Product/index/sortid/111.html', 100, 'pc,wap', 0, 55, 'ch'),
(63, '一级分类B', '/Product/index/sortid/112.html', 90, 'pc,wap', 0, 55, 'ch'),
(64, '一级分类C', '/Product/index/sortid/113.html', 80, 'pc,wap', 0, 55, 'ch'),
(65, '一级分类D', '/Product/index/sortid/114.html', 70, 'pc,wap', 0, 55, 'ch'),
(66, '一级分类E', '/Product/index/sortid/115.html', 60, 'pc,wap', 0, 55, 'ch'),
(67, '二级分类A', '/Product/index/sortid/116.html', 100, 'pc,wap', 0, 62, 'ch'),
(68, '二级分类AA', '/Product/index/sortid/122.html', 90, 'pc,wap', 0, 62, 'ch'),
(70, '公司新闻', '/News/index/sortid/123.html', 100, 'pc,wap', 0, 56, 'ch'),
(71, '行业动态', '/News/index/sortid/124.html', 90, 'pc,wap', 0, 56, 'ch'),
(72, '常见问题', '/News/index/sortid/125.html', 80, 'pc,wap', 0, 56, 'ch'),
(73, '一级分类', '/News/index/sortid/126.html', 70, 'pc,wap', 0, 56, 'ch'),
(74, '二级分类A', '/News/index/sortid/128.html', 100, 'pc,wap', 0, 73, 'ch'),
(75, '二级分类B', '/News/index/sortid/127.html', 90, 'pc,wap', 0, 73, 'ch'),
(76, '一级分类A', '/Project/index/sortid/138.html', 100, 'pc,wap', 0, 57, 'ch'),
(77, '一级分类B', '/Project/index/sortid/139.html', 90, 'pc,wap', 0, 57, 'ch'),
(78, '一级分类C', '/Project/index/sortid/140.html', 80, 'pc,wap', 0, 57, 'ch'),
(79, '二级分类', '/Project/index/sortid/141.html', 0, 'pc,wap', 0, 76, 'ch'),
(80, '一级分类A', '/Down/index/sortid/136.html', 100, 'pc,wap', 0, 58, 'ch'),
(81, '一级分类B', '/Down/index/sortid/132.html', 0, 'pc,wap', 0, 58, 'ch'),
(82, '二级分类', '/Down/index/sortid/133.html', 0, 'pc,wap', 0, 81, 'ch'),
(83, '公司简介', '/Page/view/id/223.html', 100, 'pc,wap', 0, 59, 'ch'),
(84, '招贤纳士', '/Page/view/id/226.html', 90, 'pc,wap', 0, 59, 'ch'),
(85, '企业文化', '/Page/view/id/225.html', 80, 'pc,wap', 0, 59, 'ch'),
(88, 'News', '/en/News/index.html', 80, 'pc,wap', 0, 0, 'en'),
(89, 'Projects', '/en/Project/index.html', 70, 'pc,wap', 0, 0, 'en'),
(90, 'Download', '/en/Down/index.html', 60, 'pc,wap', 0, 0, 'en'),
(91, 'About us', '/en/Page/view/id/227.html', 50, 'pc,wap', 0, 0, 'en'),
(92, 'Contact us', '/en/Page/view/id/228.html', 40, 'pc,wap', 0, 0, 'en'),
(93, 'Feedback', '/en/guestbook/index.html', 30, 'pc,wap', 0, 0, 'en'),
(94, 'Category A', '/en/Product/index/sortid/144.html', 100, 'pc,wap', 0, 87, 'en'),
(95, 'Category B', '/en/Product/index/sortid/145.html', 90, 'pc,wap', 0, 87, 'en'),
(96, 'Category C', '/en/Product/index/sortid/146.html', 80, 'pc,wap', 0, 87, 'en'),
(97, 'Category D', '/en/Product/index/sortid/147.html', 70, 'pc,wap', 0, 87, 'en'),
(98, 'Category E', '/en/Product/index/sortid/148.html', 60, 'pc,wap', 0, 87, 'en'),
(99, 'Category AA', '/en/Product/index/sortid/149.html', 100, 'pc,wap', 0, 94, 'en'),
(100, 'Category BB', '/en/Product/index/sortid/152.html', 90, 'pc,wap', 0, 94, 'en'),
(101, 'Company news', '/en/News/index/sortid/153.html', 100, 'pc,wap', 0, 88, 'en'),
(102, 'Industry news', '/en/News/index/sortid/154.html', 90, 'pc,wap', 0, 88, 'en'),
(103, 'FAQ', '/en/News/index/sortid/155.html', 80, 'pc,wap', 0, 88, 'en'),
(104, 'Category A', '/en/News/index/sortid/156.html', 70, 'pc,wap', 0, 88, 'en'),
(105, 'Category AA', '/en/News/index/sortid/157.html', 100, 'pc,wap', 0, 104, 'en'),
(106, 'Category BB', '/en/News/index/sortid/159.html', 90, 'pc,wap', 0, 104, 'en'),
(107, 'Category A', '/en/Project/index/sortid/168.html', 100, 'pc,wap', 0, 89, 'en'),
(108, 'Category B', '/en/Project/index/sortid/169.html', 90, 'pc,wap', 0, 89, 'en'),
(109, 'Category C', '/en/Project/index/sortid/170.html', 80, 'pc,wap', 0, 89, 'en'),
(110, 'Category CC', '/en/Project/index/sortid/171.html', 100, 'pc,wap', 0, 109, 'en'),
(111, 'Category A', '/en/Down/index/sortid/162.html', 100, 'pc,wap', 0, 90, 'en'),
(112, 'Category B', '/en/Down/index/sortid/163.html', 90, 'pc,wap', 0, 90, 'en'),
(113, 'Category C', '/en/Down/index/sortid/163.html', 80, 'pc,wap', 0, 90, 'en'),
(114, 'Category CC', '/en/Down/index/sortid/165.html', 100, 'pc,wap', 0, 113, 'en'),
(115, 'About us', '/en/Page/view/id/227.html', 100, 'pc,wap', 0, 91, 'en'),
(116, 'Culture', '/en/Page/view/id/229.html', 90, 'pc,wap', 0, 91, 'en'),
(117, 'Jobs', '/en/Page/view/id/230.html', 80, 'pc,wap', 0, 91, 'en');

-- --------------------------------------------------------

--
-- 表的结构 `bmkj_news`
--

CREATE TABLE IF NOT EXISTS `bmkj_news` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sortid` int(10) DEFAULT NULL,
  `areaid` int(10) DEFAULT NULL,
  `client` varchar(200) DEFAULT 'pc,wap,weixin',
  `status` varchar(200) DEFAULT NULL,
  `sequence` int(10) DEFAULT '0',
  `hits` int(10) DEFAULT '1',
  `auth_group` varchar(200) DEFAULT NULL,
  `thumb` varchar(255) DEFAULT NULL,
  `linkurl` varchar(255) DEFAULT NULL,
  `title` varchar(100) DEFAULT NULL,
  `seotitle` varchar(255) DEFAULT NULL,
  `keyword` varchar(255) DEFAULT NULL,
  `description` varchar(500) DEFAULT NULL,
  `fileurl` varchar(255) DEFAULT NULL,
  `author` varchar(50) DEFAULT NULL,
  `copyfrom` varchar(50) DEFAULT NULL,
  `fromurl` varchar(255) DEFAULT NULL,
  `content1` text,
  `addtime` int(10) DEFAULT NULL,
  `urlroute` varchar(100) DEFAULT NULL,
  `lan` char(30) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=325 ;

--
-- 转存表中的数据 `bmkj_news`
--

INSERT INTO `bmkj_news` (`id`, `sortid`, `areaid`, `client`, `status`, `sequence`, `hits`, `auth_group`, `thumb`, `linkurl`, `title`, `seotitle`, `keyword`, `description`, `fileurl`, `author`, `copyfrom`, `fromurl`, `content1`, `addtime`, `urlroute`, `lan`) VALUES
(305, 123, 4, 'pc,wap', 'view,commend,new,hot', 0, 4, '', '', '', '【重要公告】骗子猖狂，警防诈骗！', '', '', '亲爱的会员们，近期骗子猖狂，有不法分子通过非法途径获取会员信息，借此冒充本站会员打电话，类似中奖、护肤品促销类的缘由，让会员打款等诈骗行为，请大家谨慎，以防被骗。本公司在其他地区暂时没有分站，请大家切记，不要上当受骗。', '', '小编', '深圳市XX科技有限公司', '##', '&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;亲爱的会员们，近期骗子猖狂，有不法分子通过非法途径获取会员信息，&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;借此冒充本站会员打电话，类似中奖、护肤品促销类的缘由，让会员打款等诈骗行为，请大家谨慎，以防被骗。本公司在其他地区暂时没有分站，请大家切记，不要上当受骗。&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;我们的所有的活动都是在线上商城举办的，我们不做线下活动。所以会员们以后再接到这样的电话，直接无视吧！&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;祝您购物愉快！！！&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', 1477135174, '', 'ch'),
(306, 123, 4, 'pc,wap', 'view,commend,new,hot', 0, 1, '', '', '', '活动：新版上线，折扣多多,惊喜多多!', '', '', '热烈庆祝商城新版上线！为答谢亲们对本商城的支持和关爱，商城推出购物满300元包邮,所有商城产品一律5—7折优惠！', '', '小编', '深圳市XX科技有限公司', '##', '&lt;p&gt;热烈庆祝商城新版上线！为答谢亲们对本商城的支持和关爱，商城推出购物满300元包邮,所有商城产品一律5—7折优惠！&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;亲爱的顾客：你们好！ &amp;nbsp;&lt;/p&gt;&lt;p&gt;&amp;nbsp; &amp;nbsp;&amp;nbsp;&lt;/p&gt;&lt;p&gt;我们的产品均为正规渠道进货，请美女姐姐妹妹们放心购买，安心使用！&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;我想，所有心存善意的人，都是我所喜爱的。我们都称顾客为“上帝”，我却更希望和您能平等友善的交流和沟通。当我给了您尊重和耐心，也希望得到您的微笑和包容。生活不可能永远一帆风顺，可贵的是你我相互友好的心。&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;也许有时候我们会犯点小错误，但是请您相信，无论客观发生了什么，我们可以一起用积极的态度来面对和解决。就算也许会有小插曲，和您交易交往，那也是最快乐的，祝大家购物愉快！(*^__^*) ……&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', 1477135651, '', 'ch'),
(307, 124, 4, 'pc,wap', 'view,commend,new,hot', 0, 1, '', '', '', '注意生活小细节，减少换季敏感现象', '', '', '秋季容易肌肤敏感，但是先不要责怪所用的化妆品，在平时的生活细节中，你可以能已经埋下了过敏隐患。', '', '小编', '深圳市XX科技有限公司', '##', '&lt;p&gt;秋季容易肌肤敏感，但是先不要责怪所用的化妆品，在平时的生活细节中，你可以能已经埋下了过敏隐患。&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;为减少面部受冷风刺激面积，也许你会在外出时带上能罩住口鼻的大口罩，这样的话就最好选一次性口罩。要是觉得不美观，那选一款漂亮的绢丝口罩，它的质地很柔软，跟皮肤摩擦也会造成刺激，但记得用后一定要及时消毒清洗哦。&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-size: 12px;&quot;&gt;晚上十点到凌晨两点你还在熬夜吗？赶紧让睡眠恢复到正常状态吧。这一时段对新陈代谢来说是最重要的，休息不好会导致免疫力下降，肌肤的表层也会变脆弱，只有充足的睡眠才可以帮助肌肤恢复健康。&lt;/span&gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-size: 12px;&quot;&gt;&lt;br/&gt;&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-size: 12px;&quot;&gt;&lt;br/&gt;&lt;/span&gt;&lt;/p&gt;&lt;p&gt;避免使用吸油纸。吸油纸会带走皮肤表面水分，同时吸走多余油脂时也会把皮肤中具有保护力的油脂吸走，导致皮脂分部失衡。如果你离不开吸油纸，那么每天最多使用两张，并且采用按压的方式，不要使劲揉搓。&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', 1477136053, '', 'ch'),
(308, 124, 4, 'pc,wap', 'view,commend,new,hot', 0, 1, '', '', '', '宅女护肤宝典让你宅并美丽着', '', '', '现在很多女生越来越宅了，只要能不出门就不出门，赖在家里做喜欢做的事，即便是假期，宅女们也不想出门凑热闹，不往景区扎堆，宅在家里看碟、上网，找朋友来聚会，有些甚至日夜颠倒，久而久之，毛孔粗大、痘痘粉刺、黑眼圈等肌肤问题就不约而同地找上门来了。', '', '小编', '深圳市XX科技有限公司', '##', '&lt;p&gt;现在很多女生越来越宅了，只要能不出门就不出门，赖在家里做喜欢做的事，即便是假期，宅女们也不想出门凑热闹，不往景区扎堆，宅在家里看碟、上网，找朋友来聚会，有些甚至日夜颠倒，久而久之，毛孔粗大、痘痘粉刺、黑眼圈等肌肤问题就不约而同地找上门来了。那宅女应该如何护肤呢？请看美容爱好者小编推荐的宅女护肤宝典让你宅并美丽着！&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-size: 16px;&quot;&gt;&lt;strong&gt;宅女护肤宝典一、对付皮肤粗糙&lt;/strong&gt;&lt;/span&gt;&lt;/p&gt;&lt;p&gt;宅女长时在家上网，电脑的静电会使荧光屏吸附灰尘、污粒，而电脑族与电脑的距离往往过于靠近，大量的灰尘会落在皮肤上，使毛孔堵塞，导致皮肤越来越粗糙。&lt;/p&gt;&lt;p&gt;&lt;/p&gt;&lt;p&gt;Tips 1：洁面&lt;/p&gt;&lt;p&gt;宅女们上网后一定要彻底洁面，可用温和洗面奶将脸上的污垢清除干净。洗脸水最好选择温水，才能让皮肤更加彻底地清洁。&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;Tips 2：定期去角质&lt;/p&gt;&lt;p&gt;灰尘、油脂堆积在脸上，容易导致脸上的废旧角质变厚，影响皮肤的畅通性，所以定期去角质是非常必要的。一周一到两次即可，根据肤质选择适合的去角质产品。敏感肌肤要慎用去角质产品。&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;&lt;strong&gt;&lt;span style=&quot;font-size: 16px;&quot;&gt;宅女护肤宝典二、 控油&lt;/span&gt;&lt;/strong&gt;&lt;/p&gt;&lt;p&gt;在家上网，看碟、熬夜，容易导致肌肤油脂分泌失调，冒油现象加剧，容易一脸泛油光，出油过多还容易堵塞毛孔，引发痘痘，黑头。&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;Tips 1：补水控油&lt;/p&gt;&lt;p&gt;皮肤出油过多，是因为肌肤太缺水了，所以要控油，除了洁面，还要补水，所以洁面后应该用爽肤水和乳液为肌肤补充水分。&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;Tips 2：去黑头&lt;/p&gt;&lt;p&gt;出油过多，也容易出现黑头，特别是鼻子上，更容易有黑头，所以MM们可以选择去黑头产品定期去黑头。一周去黑头一到两次就行了，不管选择什么去黑头产品，去完黑头来一定要收缩毛孔。&lt;/p&gt;&lt;p&gt;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-size: 16px;&quot;&gt;&lt;strong&gt;宅女护肤宝典三、去除黑眼圈&lt;/strong&gt;&lt;/span&gt;&lt;/p&gt;&lt;p&gt;宅女们都喜欢熬夜，当然，一熬夜，黑眼圈马上就找上门了，整天在家挂着一对熊猫眼，对着镜子自己看了心情也不好，所以要宅得漂亮，黑眼圈必除。&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;Tips 1：每天早晚使用晚霜，最好根据肤质选择晚霜，油性皮肤的人选择质地清爽一些的哦。&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;Tips 2：睡前也可使用喝剩的茶包或青瓜切片璷在眼部，有效改善黑眼圈。&lt;/p&gt;', 1477136111, '', 'ch'),
(309, 123, 4, 'pc,wap', 'view,commend,new,hot', 0, 1, '', '', '', '【重要公告】骗子猖狂，警防诈骗！', '', '', '亲爱的会员们，近期骗子猖狂，有不法分子通过非法途径获取会员信息，借此冒充本站会员打电话，类似中奖、护肤品促销类的缘由，让会员打款等诈骗行为，请大家谨慎，以防被骗。本公司在其他地区暂时没有分站，请大家切记，不要上当受骗。', '', '小编', '深圳市XX科技有限公司', '##', '&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;亲爱的会员们，近期骗子猖狂，有不法分子通过非法途径获取会员信息，&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;&lt;br/&gt;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;借此冒充本站会员打电话，类似中奖、护肤品促销类的缘由，让会员打款等诈骗行为，请大家谨慎，以防被骗。本公司在其他地区暂时没有分站，请大家切记，不要上当受骗。&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;&lt;br/&gt;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;我们的所有的活动都是在线上商城举办的，我们不做线下活动。所以会员们以后再接到这样的电话，直接无视吧！&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;&lt;br/&gt;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;祝您购物愉快！！！&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', 1477137052, '', 'ch'),
(310, 123, 4, 'pc,wap', 'view,commend,new,hot', 0, 3, '', '', '', '活动：新版上线，折扣多多,惊喜多多!', '', '', '热烈庆祝商城新版上线！为答谢亲们对本商城的支持和关爱，商城推出购物满300元包邮,所有商城产品一律5—7折优惠！', '', '小编', '深圳市XX科技有限公司', '##', '&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;热烈庆祝商城新版上线！为答谢亲们对本商城的支持和关爱，商城推出购物满300元包邮,所有商城产品一律5—7折优惠！&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;&lt;br/&gt;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;&lt;br/&gt;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;亲爱的顾客：你们好！ &amp;nbsp;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;&amp;nbsp; &amp;nbsp;&amp;nbsp;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;我们的产品均为正规渠道进货，请美女姐姐妹妹们放心购买，安心使用！&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;&lt;br/&gt;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;&lt;br/&gt;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;我想，所有心存善意的人，都是我所喜爱的。我们都称顾客为“上帝”，我却更希望和您能平等友善的交流和沟通。当我给了您尊重和耐心，也希望得到您的微笑和包容。生活不可能永远一帆风顺，可贵的是你我相互友好的心。&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;&lt;br/&gt;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;也许有时候我们会犯点小错误，但是请您相信，无论客观发生了什么，我们可以一起用积极的态度来面对和解决。就算也许会有小插曲，和您交易交往，那也是最快乐的，祝大家购物愉快！(*^__^*) ……&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', 1477137091, '', 'ch'),
(311, 124, 4, 'pc,wap', 'view,commend,new,hot', 0, 2, '', '', '', '注意生活小细节，减少换季敏感现象', '', '', '秋季容易肌肤敏感，但是先不要责怪所用的化妆品，在平时的生活细节中，你可以能已经埋下了过敏隐患。', '', '小编', '深圳市XX科技有限公司', '##', '&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;秋季容易肌肤敏感，但是先不要责怪所用的化妆品，在平时的生活细节中，你可以能已经埋下了过敏隐患。&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;&lt;br/&gt;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;&lt;br/&gt;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;为减少面部受冷风刺激面积，也许你会在外出时带上能罩住口鼻的大口罩，这样的话就最好选一次性口罩。要是觉得不美观，那选一款漂亮的绢丝口罩，它的质地很柔软，跟皮肤摩擦也会造成刺激，但记得用后一定要及时消毒清洗哦。&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;&lt;br/&gt;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;&lt;span style=&quot;font-size: 12px;&quot;&gt;晚上十点到凌晨两点你还在熬夜吗？赶紧让睡眠恢复到正常状态吧。这一时段对新陈代谢来说是最重要的，休息不好会导致免疫力下降，肌肤的表层也会变脆弱，只有充足的睡眠才可以帮助肌肤恢复健康。&lt;/span&gt;&lt;br/&gt;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;&lt;span style=&quot;font-size: 12px;&quot;&gt;&lt;br/&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;&lt;span style=&quot;font-size: 12px;&quot;&gt;&lt;br/&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;避免使用吸油纸。吸油纸会带走皮肤表面水分，同时吸走多余油脂时也会把皮肤中具有保护力的油脂吸走，导致皮脂分部失衡。如果你离不开吸油纸，那么每天最多使用两张，并且采用按压的方式，不要使劲揉搓。&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', 1477137148, '', 'ch'),
(312, 124, 4, 'pc,wap', 'view,commend,new,hot', 0, 4, '', '', '', '宅女护肤宝典让你宅并美丽着', '', '', '现在很多女生越来越宅了，只要能不出门就不出门，赖在家里做喜欢做的事，即便是假期，宅女们也不想出门凑热闹，不往景区扎堆，宅在家里看碟、上网，找朋友来聚会，有些甚至日夜颠倒，久而久之，毛孔粗大、痘痘粉刺、黑眼圈等肌肤问题就不约而同地找上门来了。', '', '小编', '深圳市XX科技有限公司', '##', '&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;现在很多女生越来越宅了，只要能不出门就不出门，赖在家里做喜欢做的事，即便是假期，宅女们也不想出门凑热闹，不往景区扎堆，宅在家里看碟、上网，找朋友来聚会，有些甚至日夜颠倒，久而久之，毛孔粗大、痘痘粉刺、黑眼圈等肌肤问题就不约而同地找上门来了。那宅女应该如何护肤呢？请看美容爱好者小编推荐的宅女护肤宝典让你宅并美丽着！&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;&lt;br/&gt;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;&lt;span style=&quot;font-size: 16px;&quot;&gt;&lt;strong&gt;宅女护肤宝典一、对付皮肤粗糙&lt;/strong&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;宅女长时在家上网，电脑的静电会使荧光屏吸附灰尘、污粒，而电脑族与电脑的距离往往过于靠近，大量的灰尘会落在皮肤上，使毛孔堵塞，导致皮肤越来越粗糙。&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;&lt;br/&gt;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;Tips 1：洁面&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;宅女们上网后一定要彻底洁面，可用温和洗面奶将脸上的污垢清除干净。洗脸水最好选择温水，才能让皮肤更加彻底地清洁。&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;&lt;br/&gt;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;Tips 2：定期去角质&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;灰尘、油脂堆积在脸上，容易导致脸上的废旧角质变厚，影响皮肤的畅通性，所以定期去角质是非常必要的。一周一到两次即可，根据肤质选择适合的去角质产品。敏感肌肤要慎用去角质产品。&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;&lt;br/&gt;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;&lt;br/&gt;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;&lt;strong&gt;&lt;span style=&quot;font-size: 16px;&quot;&gt;宅女护肤宝典二、 控油&lt;/span&gt;&lt;/strong&gt;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;在家上网，看碟、熬夜，容易导致肌肤油脂分泌失调，冒油现象加剧，容易一脸泛油光，出油过多还容易堵塞毛孔，引发痘痘，黑头。&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;&lt;br/&gt;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;Tips 1：补水控油&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;皮肤出油过多，是因为肌肤太缺水了，所以要控油，除了洁面，还要补水，所以洁面后应该用爽肤水和乳液为肌肤补充水分。&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;&lt;br/&gt;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;Tips 2：去黑头&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;出油过多，也容易出现黑头，特别是鼻子上，更容易有黑头，所以MM们可以选择去黑头产品定期去黑头。一周去黑头一到两次就行了，不管选择什么去黑头产品，去完黑头来一定要收缩毛孔。&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;&lt;br/&gt;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;&lt;br/&gt;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;&lt;br/&gt;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;&lt;span style=&quot;font-size: 16px;&quot;&gt;&lt;strong&gt;宅女护肤宝典三、去除黑眼圈&lt;/strong&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;宅女们都喜欢熬夜，当然，一熬夜，黑眼圈马上就找上门了，整天在家挂着一对熊猫眼，对着镜子自己看了心情也不好，所以要宅得漂亮，黑眼圈必除。&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;&lt;br/&gt;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;Tips 1：每天早晚使用晚霜，最好根据肤质选择晚霜，油性皮肤的人选择质地清爽一些的哦。&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;&lt;br/&gt;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;Tips 2：睡前也可使用喝剩的茶包或青瓜切片璷在眼部，有效改善黑眼圈。&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', 1477137257, '', 'ch'),
(313, 123, 4, 'pc,wap', 'view,commend,new,hot', 0, 1, '', '', '', '【重要公告】骗子猖狂，警防诈骗！', '', '', '亲爱的会员们，近期骗子猖狂，有不法分子通过非法途径获取会员信息，借此冒充本站会员打电话，类似中奖、护肤品促销类的缘由，让会员打款等诈骗行为，请大家谨慎，以防被骗。本公司在其他地区暂时没有分站，请大家切记，不要上当受骗。', '', '小编', '深圳市XX科技有限公司', '##', '&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;亲爱的会员们，近期骗子猖狂，有不法分子通过非法途径获取会员信息，&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;&lt;br/&gt;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;借此冒充本站会员打电话，类似中奖、护肤品促销类的缘由，让会员打款等诈骗行为，请大家谨慎，以防被骗。本公司在其他地区暂时没有分站，请大家切记，不要上当受骗。&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;&lt;br/&gt;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;我们的所有的活动都是在线上商城举办的，我们不做线下活动。所以会员们以后再接到这样的电话，直接无视吧！&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;&lt;br/&gt;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;祝您购物愉快！！！&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', 1477137311, '', 'ch'),
(314, 123, 4, 'pc,wap', 'view,commend,new,hot', 0, 23, '', '', '', '活动：新版上线，折扣多多,惊喜多多!', '', '', '热烈庆祝商城新版上线！为答谢亲们对本商城的支持和关爱，商城推出购物满300元包邮,所有商城产品一律5—7折优惠！', '', '小编', '深圳市XX科技有限公司', '##', '&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;热烈庆祝商城新版上线！为答谢亲们对本商城的支持和关爱，商城推出购物满300元包邮,所有商城产品一律5—7折优惠！&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;&lt;br/&gt;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;&lt;br/&gt;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;亲爱的顾客：你们好！ &amp;nbsp;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;&amp;nbsp; &amp;nbsp;&amp;nbsp;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;我们的产品均为正规渠道进货，请美女姐姐妹妹们放心购买，安心使用！&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;&lt;br/&gt;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;&lt;br/&gt;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;我想，所有心存善意的人，都是我所喜爱的。我们都称顾客为“上帝”，我却更希望和您能平等友善的交流和沟通。当我给了您尊重和耐心，也希望得到您的微笑和包容。生活不可能永远一帆风顺，可贵的是你我相互友好的心。&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;&lt;br/&gt;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;也许有时候我们会犯点小错误，但是请您相信，无论客观发生了什么，我们可以一起用积极的态度来面对和解决。就算也许会有小插曲，和您交易交往，那也是最快乐的，祝大家购物愉快！(*^__^*) ……&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', 1477137348, '', 'ch'),
(315, 153, 10, 'pc,wap', 'view,commend,new,hot', 0, 1, '', '', '', '[notice] important liar rampant, police anti fraud!', '', '', 'Dear members, the recent liar rampant, criminals to obtain membership information through illegal means, thereby posing as members of this site call, similar reason winning, skin care products promotion class, let members play money and other fraud, please take care, to prevent being cheated. In other parts of the company there is no station, please remember, don''t be deceived.', '', 'Admin', 'Shenzhen XX Technology Co., Ltd.', '##', '&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;Dear members, the recent liar rampant, criminals to obtain membership information by illegal means,&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;To pass to the station members call, similar to the winning, skin care products, such as the reason for the category of promotion, so that members play, such as fraud, please be careful to prevent being cheated. In other parts of the company there is no station, please remember, don&amp;#39;t be deceived.&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;All of our activities are held online mall, we do not do the next line activities. So the members later received such a phone call, just ignore it!&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;I wish you a happy shopping!!!&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', 1477242232, '', 'en'),
(316, 153, 10, 'pc,wap', 'view,commend,new,hot', 0, 1, '', '', '', 'Activities: the new version of the line, a lot of discounts, a lot of surprises!', '', '', 'Warmly celebrate the new on-line mall! Thanks for the pro of the mall''s support and care, shopping mall launched over 300 yuan shipping, all products are 5 - 30 percent off discount mall!', '', 'Admin', 'Shen Zhen XXX Technology Co., Ltd. ', '##', '&lt;p&gt;Warmly celebrate the new on-line mall! Thanks for the pro of the mall&amp;#39;s support and care, shopping mall launched over 300 yuan shipping, all products are 5 - 30 percent off discount mall!&lt;/p&gt;&lt;p&gt;Dear customer: you are good!&lt;/p&gt;&lt;p&gt;Our products are the formal channels of purchase, please sister assured purchase, ease of use!&lt;/p&gt;&lt;p&gt;I think all the people who are well intentioned are my favorite. We all call the customer &amp;quot;God&amp;quot;, but I hope that you can be equal and friendly exchanges and communication. When I give you respect and patience, but also hope to get your smile and tolerance. Life can not always be smooth sailing, precious is that you and I are friendly to each other.&lt;/p&gt;&lt;p&gt;Maybe sometimes we will make a little mistake, but please believe that, no matter what happens, we can use a positive attitude to face and solve. Even if there will be a small episode, and you trade exchanges, that is the most happy, I wish you a happy shopping! (*^__^*)......&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', 1477242343, NULL, 'en'),
(317, 154, 10, 'pc,wap', 'view,commend,new,hot', 0, 1, '', '', '', 'Pay attention to small details of life, reduce seasonal sensitive phenomenon', '', '', 'Fall prone to sensitive skin, but do not blame the use of cosmetics, in the usual life details, you can be able to have planted a hidden allergy.', '', 'Admin', 'Shen Zhen XXX Technology Co., Ltd.', '##', '&lt;p&gt;Fall prone to sensitive skin, but do not blame the use of cosmetics, in the usual life details, you can be able to have planted a hidden allergy.&lt;/p&gt;&lt;p&gt;In order to reduce the area of stimulation by cold face, maybe you will bring out the mask over the nose and mouth, so the best selection of disposable masks. If you&amp;#39;re not beautiful, it choose a beautiful silk mask, its texture is soft, with skin friction will cause irritation, but remember to use must be timely cleaning and disinfection.&lt;/p&gt;&lt;p&gt;Do you still stay up late at ten a.m. until two o&amp;#39;clock in the morning? Let&amp;#39;s get back to normal sleep. This period of metabolism is the most important, the rest is not good will lead to decreased immunity, the skin&amp;#39;s surface will become fragile, only adequate sleep can help the skin to restore health.&lt;/p&gt;&lt;p&gt;Avoid the use of oil absorbing paper. Oil paper will take away the skin surface moisture, and take away excess oil will also put oil suction has a protective force in the skin, leading to sebaceous segment imbalance. If you cannot do without oil absorbing paper, then every day use up to two, and the press the way, don&amp;#39;t rub.&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', 1477242410, NULL, 'en'),
(318, 154, 10, 'pc,wap', 'view,commend,new,hot', 0, 2, '', '', '', 'Indoorswoman regimen let you and beautiful house', '', '', 'Now a lot of girls getting home, as long as it can not be left out, Lai do love to do at home, even holidays, Indoorswoman also do not want to go out of the ride, not to get together in the house area, Kandie, Internet, find a friend to the party, and even some of the night, in the course of time. Large pores, acne pimples, dark circles and other skin problems invariably came to the door.', '', 'Admin', 'Shen Zhen XXX Technology Co., Ltd. ', '##', '&lt;p&gt;Now a lot of girls getting home, as long as it can not be left out, Lai do love to do at home, even holidays, Indoorswoman also do not want to go out of the ride, not to get together in the house area, Kandie, Internet, find a friend to the party, and even some of the night, in the course of time. Large pores, acne pimples, dark circles and other skin problems invariably came to the door. The Indoorswoman should be how to care? Please look at the beauty of the skin Indoorswoman enthusiasts editorial recommendation book let you and beautiful house!&lt;/p&gt;&lt;p&gt;Indoorswoman regimen, with rough skin&lt;/p&gt;&lt;p&gt;The Internet at home Indoorswoman long, the computer screen will make the electrostatic adsorption of dust, dirt particles, and the distance between the computer computer family are often too near, a lot of dust will fall on the skin, make the skin more clogged pores, resulting in rough.&lt;/p&gt;&lt;p&gt;Tips 1: Cleansing&lt;/p&gt;&lt;p&gt;Indoorswoman are after the Internet must be thoroughly cleansing, use a mild Cleansing Cream will clean the dirt on his face. Wash water is best to choose warm water, in order to make the skin more thoroughly clean.&lt;/p&gt;&lt;p&gt;Tips 2: regular Scrub&lt;/p&gt;&lt;p&gt;Dust, grease accumulation in the face, is likely to lead to the face of the waste horny thickening, affect the smooth skin, so regular scrub is very necessary. A Monday to two times, according to the skin to select the appropriate products to horny. Sensitive skin exfoliating products should be used with caution.&lt;/p&gt;&lt;p&gt;Indoorswoman skincare collection two, oil&lt;/p&gt;&lt;p&gt;The Internet at home, Kandie, staying up late, easy to cause the skin oil secretion, oil leak phenomenon intensified, easy face shiny, too much out of the oil is easy to plug the pores, causing acne, blackhead.&lt;/p&gt;&lt;p&gt;Tips 1: replenishment oil control&lt;/p&gt;&lt;p&gt;Skin out of oil too much, because the skin is too dry, so to oil control, in addition to cleansing, but also pay, so after cleansing should use toner and lotion for the skin to add moisture.&lt;/p&gt;&lt;p&gt;Tips 2: go to black&lt;/p&gt;&lt;p&gt;Out of the oil too much, it is prone to black, especially on the nose, more likely to have a black, so MM can choose to go to black products regularly to black. A week to go to the black one or two times on the line, no matter what the choice to black products, to finish the black to be sure to shrink pores.&lt;/p&gt;&lt;p&gt;Indoorswoman skincare collection three, remove the black eye&lt;/p&gt;&lt;p&gt;Indoorswoman would love to stay up late, of course, a night, black eye immediately came to the door, all day at home hanging on the panda eyes, look at myself in the mirror of the mood is not good, so the house is very beautiful, black eye will be in addition to.&lt;/p&gt;&lt;p&gt;Tips 1: day and night cream, the best choice under the skin cream, refreshing texture of some selected people with oily skin oh.&lt;/p&gt;&lt;p&gt;Tips 2: bedtime can drink the leftover tea or cucumber slices Lu used in the eye, effectively improve the black eye.&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', 1477242477, NULL, 'en'),
(319, 153, 10, 'pc,wap', 'view,commend,new,hot', 0, 1, '', '', '', '[notice] important liar rampant, police anti fraud!', '', '', 'Dear members, the recent liar rampant, criminals to obtain membership information through illegal means, thereby posing as members of this site call, similar reason winning, skin care products promotion class, let members play money and other fraud, please take care, to prevent being cheated. In other parts of the company there is no station, please remember, don''t be deceived.', '', 'Admin', 'Shenzhen XX Technology Co., Ltd.', '##', '&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;Dear members, the recent liar rampant, criminals to obtain membership information by illegal means,&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;To pass to the station members call, similar to the winning, skin care products, such as the reason for the category of promotion, so that members play, such as fraud, please be careful to prevent being cheated. In other parts of the company there is no station, please remember, don&amp;#39;t be deceived.&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;All of our activities are held online mall, we do not do the next line activities. So the members later received such a phone call, just ignore it!&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;I wish you a happy shopping!!!&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', 1477242544, NULL, 'en'),
(320, 153, 10, 'pc,wap', 'view,commend,new,hot', 0, 1, '', '', '', 'Activities: the new version of the line, a lot of discounts, a lot of surprises!', '', '', 'Warmly celebrate the new on-line mall! Thanks for the pro of the mall''s support and care, shopping mall launched over 300 yuan shipping, all products are 5 - 30 percent off discount mall!', '', 'Admin', 'Shen Zhen XXX Technology Co., Ltd. ', '##', '&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;Warmly celebrate the new on-line mall! Thanks for the pro of the mall&amp;#39;s support and care, shopping mall launched over 300 yuan shipping, all products are 5 - 30 percent off discount mall!&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;Dear customer: you are good!&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;Our products are the formal channels of purchase, please sister assured purchase, ease of use!&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;I think all the people who are well intentioned are my favorite. We all call the customer &amp;quot;God&amp;quot;, but I hope that you can be equal and friendly exchanges and communication. When I give you respect and patience, but also hope to get your smile and tolerance. Life can not always be smooth sailing, precious is that you and I are friendly to each other.&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;Maybe sometimes we will make a little mistake, but please believe that, no matter what happens, we can use a positive attitude to face and solve. Even if there will be a small episode, and you trade exchanges, that is the most happy, I wish you a happy shopping! (*^__^*)......&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', 1477242582, NULL, 'en'),
(321, 154, 10, 'pc,wap', 'view,commend,new,hot', 0, 1, '', '', '', 'Pay attention to small details of life, reduce seasonal sensitive phenomenon', '', '', 'Fall prone to sensitive skin, but do not blame the use of cosmetics, in the usual life details, you can be able to have planted a hidden allergy.', '', 'Admin', 'Shen Zhen XXX Technology Co., Ltd.', '##', '&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;Fall prone to sensitive skin, but do not blame the use of cosmetics, in the usual life details, you can be able to have planted a hidden allergy.&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;In order to reduce the area of stimulation by cold face, maybe you will bring out the mask over the nose and mouth, so the best selection of disposable masks. If you&amp;#39;re not beautiful, it choose a beautiful silk mask, its texture is soft, with skin friction will cause irritation, but remember to use must be timely cleaning and disinfection.&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;Do you still stay up late at ten a.m. until two o&amp;#39;clock in the morning? Let&amp;#39;s get back to normal sleep. This period of metabolism is the most important, the rest is not good will lead to decreased immunity, the skin&amp;#39;s surface will become fragile, only adequate sleep can help the skin to restore health.&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;Avoid the use of oil absorbing paper. Oil paper will take away the skin surface moisture, and take away excess oil will also put oil suction has a protective force in the skin, leading to sebaceous segment imbalance. If you cannot do without oil absorbing paper, then every day use up to two, and the press the way, don&amp;#39;t rub.&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', 1477242610, NULL, 'en'),
(322, 154, 10, 'pc,wap', 'view,commend,new,hot', 0, 1, '', '', '', 'Indoorswoman regimen let you and beautiful house', '', '', 'Now a lot of girls getting home, as long as it can not be left out, Lai do love to do at home, even holidays, Indoorswoman also do not want to go out of the ride, not to get together in the house area, Kandie, Internet, find a friend to the party, and even some of the night, in the course of time. Large pores, acne pimples, dark circles and other skin problems invariably came to the door.', '', 'Admin', 'Shen Zhen XXX Technology Co., Ltd. ', '##', '&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;Now a lot of girls getting home, as long as it can not be left out, Lai do love to do at home, even holidays, Indoorswoman also do not want to go out of the ride, not to get together in the house area, Kandie, Internet, find a friend to the party, and even some of the night, in the course of time. Large pores, acne pimples, dark circles and other skin problems invariably came to the door. The Indoorswoman should be how to care? Please look at the beauty of the skin Indoorswoman enthusiasts editorial recommendation book let you and beautiful house!&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;Indoorswoman regimen, with rough skin&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;The Internet at home Indoorswoman long, the computer screen will make the electrostatic adsorption of dust, dirt particles, and the distance between the computer computer family are often too near, a lot of dust will fall on the skin, make the skin more clogged pores, resulting in rough.&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;Tips 1: Cleansing&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;Indoorswoman are after the Internet must be thoroughly cleansing, use a mild Cleansing Cream will clean the dirt on his face. Wash water is best to choose warm water, in order to make the skin more thoroughly clean.&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;Tips 2: regular Scrub&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;Dust, grease accumulation in the face, is likely to lead to the face of the waste horny thickening, affect the smooth skin, so regular scrub is very necessary. A Monday to two times, according to the skin to select the appropriate products to horny. Sensitive skin exfoliating products should be used with caution.&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;Indoorswoman skincare collection two, oil&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;The Internet at home, Kandie, staying up late, easy to cause the skin oil secretion, oil leak phenomenon intensified, easy face shiny, too much out of the oil is easy to plug the pores, causing acne, blackhead.&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;Tips 1: replenishment oil control&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;Skin out of oil too much, because the skin is too dry, so to oil control, in addition to cleansing, but also pay, so after cleansing should use toner and lotion for the skin to add moisture.&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;Tips 2: go to black&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;Out of the oil too much, it is prone to black, especially on the nose, more likely to have a black, so MM can choose to go to black products regularly to black. A week to go to the black one or two times on the line, no matter what the choice to black products, to finish the black to be sure to shrink pores.&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;Indoorswoman skincare collection three, remove the black eye&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;Indoorswoman would love to stay up late, of course, a night, black eye immediately came to the door, all day at home hanging on the panda eyes, look at myself in the mirror of the mood is not good, so the house is very beautiful, black eye will be in addition to.&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;Tips 1: day and night cream, the best choice under the skin cream, refreshing texture of some selected people with oily skin oh.&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;Tips 2: bedtime can drink the leftover tea or cucumber slices Lu used in the eye, effectively improve the black eye.&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', 1477242635, NULL, 'en'),
(323, 153, 10, 'pc,wap', 'view,commend,new,hot', 0, 1, '', '', '', '[notice] important liar rampant, police anti fraud!', '', '', 'Dear members, the recent liar rampant, criminals to obtain membership information through illegal means, thereby posing as members of this site call, similar reason winning, skin care products promotion class, let members play money and other fraud, please take care, to prevent being cheated. In other parts of the company there is no station, please remember, don''t be deceived.', '', 'Admin', 'Shenzhen XX Technology Co., Ltd.', '##', '&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;Dear members, the recent liar rampant, criminals to obtain membership information by illegal means,&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;To pass to the station members call, similar to the winning, skin care products, such as the reason for the category of promotion, so that members play, such as fraud, please be careful to prevent being cheated. In other parts of the company there is no station, please remember, don&amp;#39;t be deceived.&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;All of our activities are held online mall, we do not do the next line activities. So the members later received such a phone call, just ignore it!&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;I wish you a happy shopping!!!&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', 1477242682, NULL, 'en'),
(324, 153, 10, 'pc,wap', 'view,commend,new,hot', 0, 6, '', '', '', 'Activities: the new version of the line, a lot of discounts, a lot of surprises!', '', '', 'Warmly celebrate the new on-line mall! Thanks for the pro of the mall''s support and care, shopping mall launched over 300 yuan shipping, all products are 5 - 30 percent off discount mall!', '', 'Admin', 'Shen Zhen XXX Technology Co., Ltd. ', '##', '&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;Warmly celebrate the new on-line mall! Thanks for the pro of the mall&amp;#39;s support and care, shopping mall launched over 300 yuan shipping, all products are 5 - 30 percent off discount mall!&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;Dear customer: you are good!&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;Our products are the formal channels of purchase, please sister assured purchase, ease of use!&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;I think all the people who are well intentioned are my favorite. We all call the customer &amp;quot;God&amp;quot;, but I hope that you can be equal and friendly exchanges and communication. When I give you respect and patience, but also hope to get your smile and tolerance. Life can not always be smooth sailing, precious is that you and I are friendly to each other.&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;Maybe sometimes we will make a little mistake, but please believe that, no matter what happens, we can use a positive attitude to face and solve. Even if there will be a small episode, and you trade exchanges, that is the most happy, I wish you a happy shopping! (*^__^*)......&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', 1477242791, NULL, 'en');

-- --------------------------------------------------------

--
-- 表的结构 `bmkj_page`
--

CREATE TABLE IF NOT EXISTS `bmkj_page` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sortid` int(10) DEFAULT NULL,
  `areaid` int(10) DEFAULT NULL,
  `client` varchar(200) DEFAULT 'pc,wap,weixin',
  `status` varchar(200) DEFAULT NULL,
  `sequence` int(10) DEFAULT '0',
  `hits` int(10) DEFAULT '1',
  `auth_group` varchar(200) DEFAULT NULL,
  `thumb` varchar(255) DEFAULT NULL,
  `linkurl` varchar(255) DEFAULT NULL,
  `title` varchar(100) DEFAULT NULL,
  `seotitle` varchar(255) DEFAULT NULL,
  `keyword` varchar(255) DEFAULT NULL,
  `description` varchar(500) DEFAULT NULL,
  `fileurl` varchar(255) DEFAULT NULL,
  `content1` text,
  `addtime` int(10) DEFAULT NULL,
  `urlroute` varchar(100) DEFAULT NULL,
  `lan` char(30) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=231 ;

--
-- 转存表中的数据 `bmkj_page`
--

INSERT INTO `bmkj_page` (`id`, `sortid`, `areaid`, `client`, `status`, `sequence`, `hits`, `auth_group`, `thumb`, `linkurl`, `title`, `seotitle`, `keyword`, `description`, `fileurl`, `content1`, `addtime`, `urlroute`, `lan`) VALUES
(223, 137, 4, 'pc,wap', 'view,commend,new,hot', 100, 38, '', '/Template/default/Public/img/about_banner.jpg', '', '公司简介', '', '', '', '', '&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;深圳市XX科技有限公司从2006年起研究网络营销及电子商务领域；&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;以网站建设为基础,致力于为您提供品牌营销型网站设计、系统软件开发、企业邮箱、域名注册及虚拟主机、云服务器、网站维护托管、SEO/SEM优化推广、400电话等产品和服务。&lt;/span&gt;&lt;/p&gt;', 1477046555, '', 'ch'),
(224, 137, 4, 'pc,wap', 'view,commend,new,hot', 90, 36, '', '/Template/default/Public/img/contact_banner.jpg', '', '联系我们', '', '', '', '', '&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;&lt;strong&gt;&lt;span style=&quot;font-size: 18px;&quot;&gt;深圳市XX科技有限公司&lt;/span&gt;&lt;/strong&gt;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;&lt;strong&gt;地 址：&lt;/strong&gt;&lt;/span&gt;深圳市龙岗区坂田吉华路XXXX号XXX大厦XX室&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;&lt;strong&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;电 话：&lt;/span&gt;&lt;/strong&gt;0755 - XXXX XXXX （周一至周五 9：00 ~ 18：00）&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;&lt;strong&gt;24小时咨询：&lt;/strong&gt;&lt;/span&gt;134 &lt;span style=&quot;font-size: 13.3333px;&quot;&gt;XXXX&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;font-size: 13.3333px;&quot;&gt;XXXX&lt;/span&gt;（李经理） 134 &lt;span style=&quot;font-size: 13.3333px;&quot;&gt;XXXX&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;font-size: 13.3333px;&quot;&gt;XXXX&lt;/span&gt;（张经理）&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;&lt;strong&gt;E-mail：&lt;/strong&gt;&lt;/span&gt;info@xxxx.com&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;&lt;strong&gt;QQ：&lt;/strong&gt;&lt;/span&gt;10000000000 &amp;nbsp; &amp;nbsp;&lt;strong&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;QQ：&lt;/span&gt;&lt;/strong&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;20000000&lt;/span&gt;&lt;/p&gt;', 1477046592, '', 'ch'),
(225, 137, 4, 'pc,wap', 'view,commend,new,hot', 0, 3, '', '/Template/default/Public/img/culture_banner.jpg', '', '企业文化', '', '', '', '', '&lt;p&gt;企业文化&lt;/p&gt;', 1477046807, '', 'ch'),
(226, 137, 4, 'pc,wap', 'view,commend,new,hot', 0, 5, '', '/Template/default/Public/img/job_banner.jpg', '', '招贤纳士', '', '', '', '', '&lt;p&gt;招贤纳士&lt;/p&gt;', 1477046818, '', 'ch'),
(227, 167, 10, 'pc,wap', 'view,commend,new,hot', 100, 30, '', '/Template/en/Public/img/about_banner.jpg', '', 'Company profile', '', '', '', '', '&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;Shenzhen XX Technology Co., Ltd. from 2006 to study the field of network marketing and e-commerce;&amp;nbsp;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;The website construction as the foundation, dedicated to providing you with the brand marketing website design,&amp;nbsp;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;software development, enterprise mailbox, domain name registration, virtual host, server, cloud hosting,&amp;nbsp;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;website maintenance SEO/SEM optimization promotion, 400 phones and other products and services.&lt;/p&gt;', 1477225184, NULL, 'en'),
(228, 167, 10, 'pc,wap', 'view,commend,new,hot', 70, 26, '', '/Template/en/Public/img/contact_banner.jpg', '', 'Contact us', '', '', '', '', '&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-size: 16px;&quot;&gt;&lt;strong&gt;Shenzhen XX Technology Co., Ltd.&lt;/strong&gt;&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;&lt;strong&gt;Add:&lt;/strong&gt;&lt;/span&gt; Shenzhen city Longgang District Bantian Jihua Road No. XXXX building room XX XXX&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;&lt;strong&gt;Tel: &lt;/strong&gt;&lt;/span&gt;86-755 - XXXX XXXX (Monday to Friday 18:00 ~ 9:00)&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;&lt;strong&gt;Mob：&lt;/strong&gt;&lt;/span&gt;86-134 XXXX XXXX &amp;nbsp;86-134 XXXX XXXX&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;strong&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;Email：&lt;/span&gt;&lt;/strong&gt;info@xxxx.com&lt;/p&gt;&lt;p&gt;&lt;br/&gt;QQ：20000000 QQ：10000000000&lt;/p&gt;', 1477225280, NULL, 'en'),
(229, 167, 10, 'pc,wap', 'view,commend,new,hot', 90, 4, '', '/Template/en/Public/img/culture_banner.jpg', '', 'Corporate culture', '', '', '', '', '&lt;p&gt;Corporate culture&lt;/p&gt;', 1477225442, NULL, 'en'),
(230, 167, 10, 'pc,wap', 'view,commend,new,hot', 80, 4, '', '/Template/en/Public/img/job_banner.jpg', '', 'Jobs', '', '', '', '', '&lt;p&gt;Jobs&lt;/p&gt;', 1477225464, NULL, 'en');

-- --------------------------------------------------------

--
-- 表的结构 `bmkj_product`
--

CREATE TABLE IF NOT EXISTS `bmkj_product` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sortid` int(10) DEFAULT NULL,
  `areaid` int(10) DEFAULT NULL,
  `client` varchar(200) DEFAULT 'pc,wap,weixin',
  `price` decimal(10,2) unsigned DEFAULT '0.00',
  `status` varchar(200) DEFAULT NULL,
  `sequence` int(10) DEFAULT '0',
  `hits` int(10) DEFAULT '1',
  `auth_group` varchar(200) DEFAULT NULL,
  `thumb` varchar(255) DEFAULT NULL,
  `morepics` text,
  `linkurl` varchar(255) DEFAULT NULL,
  `title` varchar(100) DEFAULT NULL,
  `seotitle` varchar(255) DEFAULT NULL,
  `keyword` varchar(255) DEFAULT NULL,
  `description` varchar(500) DEFAULT NULL,
  `fileurl` varchar(255) DEFAULT NULL,
  `content1` text,
  `content2` text,
  `content3` text,
  `addtime` int(10) DEFAULT NULL,
  `lan` char(30) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=232 ;

--
-- 转存表中的数据 `bmkj_product`
--

INSERT INTO `bmkj_product` (`id`, `sortid`, `areaid`, `client`, `price`, `status`, `sequence`, `hits`, `auth_group`, `thumb`, `morepics`, `linkurl`, `title`, `seotitle`, `keyword`, `description`, `fileurl`, `content1`, `content2`, `content3`, `addtime`, `lan`) VALUES
(214, 119, 4, 'pc,wap', '359.00', 'view,commend,new,hot', 0, 50, '', '/Template/default/Public/img/p1.jpg', '/Template/default/Public/img/p2.jpg|/Template/default/Public/img/p3.jpg|/Template/default/Public/img/p4.jpg|/Template/default/Public/img/p5.jpg', '', '韩国护肤品化妆品', '', '', '韩国护肤品化妆品', '', '&lt;p&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;淡化岁月痕迹，再生干细胞、重现年轻态&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;更新肌肤、抵抗衰老，平复皱纹，焕发肌肤青春活力&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-size: 16px;&quot;&gt;&lt;strong&gt;干细胞技术：&lt;/strong&gt;&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;有效防止肌肤老化，维持肌肤滋润健康状态；&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;&lt;strong&gt;&lt;span style=&quot;font-size: 16px;&quot;&gt;填补皮肤纹理技术：&lt;/span&gt;&lt;/strong&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;硅凝胶及专利功能性粉体(韩国专利号:10-2008-0119458中国专利号: 200910142035.8)，有效的掩盖皱纹，呈现细嫩年轻的皮肤；&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;&lt;strong&gt;&lt;span style=&quot;font-size: 16px;&quot;&gt;防止老化：&lt;/span&gt;&lt;/strong&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;干细胞营养，具有出众的防止肌肤老化效果，维持肌肤滋润健康状态；&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;&lt;strong&gt;&lt;span style=&quot;font-size: 16px;&quot;&gt;软玉粉：&lt;/span&gt;&lt;/strong&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;安抚肌肤，重现肌肤健康生机。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-size: 16px;&quot;&gt;&lt;strong&gt;使用方法：&lt;/strong&gt;&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;涂抹基础化妆品或防晒产品之后，取适量BB霜轻轻拍打并均匀的涂抹于脸部。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;&lt;br/&gt;&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;/Template/default/Public/img/p2.jpg&quot;/&gt;&lt;/p&gt;', '&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;&lt;strong style=&quot;font-size: 13.3333px;&quot;&gt;&lt;span style=&quot;font-size: 16px;&quot;&gt;【功效】：&lt;/span&gt;&lt;/strong&gt;&lt;strong&gt;&lt;span style=&quot;font-size: 16px;&quot;&gt;&lt;br/&gt;&lt;/span&gt;&lt;/strong&gt;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;保湿 美白 遮瑕 收缩毛孔&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;富有丝滑感的BB霜蕴含植物水份，用后滋润不干燥，具有隔离霜和粉底霜的双重功效，完美呈现彩妆效果；使用温和而舒适，使肌肤自然呈现光滑、均匀、细腻、干净的裸妆效果，实现高雅富贵的妆容气质。&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;&lt;br/&gt;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;&lt;strong&gt;&lt;span style=&quot;font-size: 16px;&quot;&gt;【成分】：&lt;/span&gt;&lt;/strong&gt;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;蕴含植物水份&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;&lt;br/&gt;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;&lt;strong&gt;&lt;span style=&quot;font-size: 16px;&quot;&gt;【用法】：&lt;/span&gt;&lt;/strong&gt;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;使用基础化妆品、防晒产品后，取适量，轻拍，使其充分被肌肤吸收。&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;&lt;br/&gt;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;&lt;span style=&quot;font-size: 16px;&quot;&gt;&lt;strong&gt;【使用范围】：&lt;/strong&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;适合任何肌肤，四季可以使用。&lt;/p&gt;', '&lt;p&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;保证100%原装正品，假一赔百；&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;15天无条件退换货；&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;若您买到假货，请拨打当地12315电话向质量监督管理局或媒体投诉。&lt;br/&gt;&lt;/span&gt;&lt;/p&gt;', 1477047226, 'ch'),
(215, 119, 4, 'pc,wap', '138.00', 'view,commend,new,hot', 0, 59, '', '/Template/default/Public/img/p1.jpg', '/Template/default/Public/img/p2.jpg|/Template/default/Public/img/p3.jpg|/Template/default/Public/img/p4.jpg|/Template/default/Public/img/p5.jpg', '', '韩国护肤品化妆品', '', '', '韩国护肤品化妆品', '', '&lt;p&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;淡化岁月痕迹，再生干细胞、重现年轻态&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;更新肌肤、抵抗衰老，平复皱纹，焕发肌肤青春活力&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-size: 16px;&quot;&gt;&lt;strong&gt;干细胞技术：&lt;/strong&gt;&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;有效防止肌肤老化，维持肌肤滋润健康状态；&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;&lt;strong&gt;&lt;span style=&quot;font-size: 16px;&quot;&gt;填补皮肤纹理技术：&lt;/span&gt;&lt;/strong&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;硅凝胶及专利功能性粉体(韩国专利号:10-2008-0119458中国专利号: 200910142035.8)，有效的掩盖皱纹，呈现细嫩年轻的皮肤；&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;&lt;strong&gt;&lt;span style=&quot;font-size: 16px;&quot;&gt;防止老化：&lt;/span&gt;&lt;/strong&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;干细胞营养，具有出众的防止肌肤老化效果，维持肌肤滋润健康状态；&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;&lt;strong&gt;&lt;span style=&quot;font-size: 16px;&quot;&gt;软玉粉：&lt;/span&gt;&lt;/strong&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;安抚肌肤，重现肌肤健康生机。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-size: 16px;&quot;&gt;&lt;strong&gt;使用方法：&lt;/strong&gt;&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;涂抹基础化妆品或防晒产品之后，取适量BB霜轻轻拍打并均匀的涂抹于脸部。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;&lt;br/&gt;&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;/Template/default/Public/img/p2.jpg&quot;/&gt;&lt;/p&gt;', '&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;&lt;strong style=&quot;font-size: 13.3333px;&quot;&gt;&lt;span style=&quot;font-size: 16px;&quot;&gt;【功效】：&lt;/span&gt;&lt;/strong&gt;&lt;strong&gt;&lt;span style=&quot;font-size: 16px;&quot;&gt;&lt;br/&gt;&lt;/span&gt;&lt;/strong&gt;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;保湿 美白 遮瑕 收缩毛孔&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;富有丝滑感的BB霜蕴含植物水份，用后滋润不干燥，具有隔离霜和粉底霜的双重功效，完美呈现彩妆效果；使用温和而舒适，使肌肤自然呈现光滑、均匀、细腻、干净的裸妆效果，实现高雅富贵的妆容气质。&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;&lt;br/&gt;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;&lt;strong&gt;&lt;span style=&quot;font-size: 16px;&quot;&gt;【成分】：&lt;/span&gt;&lt;/strong&gt;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;蕴含植物水份&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;&lt;br/&gt;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;&lt;strong&gt;&lt;span style=&quot;font-size: 16px;&quot;&gt;【用法】：&lt;/span&gt;&lt;/strong&gt;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;使用基础化妆品、防晒产品后，取适量，轻拍，使其充分被肌肤吸收。&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;&lt;br/&gt;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;&lt;span style=&quot;font-size: 16px;&quot;&gt;&lt;strong&gt;【使用范围】：&lt;/strong&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;适合任何肌肤，四季可以使用。&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', '&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;保证100%原装正品，假一赔百；&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;&lt;br/&gt;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;15天无条件退换货；&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;&lt;br/&gt;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;若您买到假货，请拨打当地12315电话向质量监督管理局或媒体投诉。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', 1477067736, 'ch'),
(216, 119, 4, 'pc,wap', '110.00', 'view,commend,new,hot', 0, 1, '', '/Template/default/Public/img/p1.jpg', '/Template/default/Public/img/p2.jpg|/Template/default/Public/img/p3.jpg|/Template/default/Public/img/p4.jpg|/Template/default/Public/img/p5.jpg', '', '韩国护肤品化妆品', '', '', '', '', '&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;淡化岁月痕迹，再生干细胞、重现年轻态&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;&lt;br/&gt;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;更新肌肤、抵抗衰老，平复皱纹，焕发肌肤青春活力&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;&lt;br/&gt;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;&lt;span style=&quot;font-size: 16px;&quot;&gt;&lt;strong&gt;干细胞技术：&lt;/strong&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;有效防止肌肤老化，维持肌肤滋润健康状态；&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;&lt;br/&gt;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;&lt;strong&gt;&lt;span style=&quot;font-size: 16px;&quot;&gt;填补皮肤纹理技术：&lt;/span&gt;&lt;/strong&gt;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;硅凝胶及专利功能性粉体(韩国专利号:10-2008-0119458中国专利号: 200910142035.8)，有效的掩盖皱纹，呈现细嫩年轻的皮肤；&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;&lt;br/&gt;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;&lt;strong&gt;&lt;span style=&quot;font-size: 16px;&quot;&gt;防止老化：&lt;/span&gt;&lt;/strong&gt;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;干细胞营养，具有出众的防止肌肤老化效果，维持肌肤滋润健康状态；&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;&lt;br/&gt;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;&lt;strong&gt;&lt;span style=&quot;font-size: 16px;&quot;&gt;软玉粉：&lt;/span&gt;&lt;/strong&gt;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;安抚肌肤，重现肌肤健康生机。&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;&lt;br/&gt;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;&lt;span style=&quot;font-size: 16px;&quot;&gt;&lt;strong&gt;使用方法：&lt;/strong&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;涂抹基础化妆品或防晒产品之后，取适量BB霜轻轻拍打并均匀的涂抹于脸部。&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;&lt;br/&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;&lt;img src=&quot;http://localhost:9000/Template/default/Public/img/p2.jpg&quot;/&gt;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', '&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;&lt;strong style=&quot;font-size: 13.3333px;&quot;&gt;&lt;span style=&quot;font-size: 16px;&quot;&gt;【功效】：&lt;/span&gt;&lt;/strong&gt;&lt;strong&gt;&lt;span style=&quot;font-size: 16px;&quot;&gt;&lt;br/&gt;&lt;/span&gt;&lt;/strong&gt;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;保湿 美白 遮瑕 收缩毛孔&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;富有丝滑感的BB霜蕴含植物水份，用后滋润不干燥，具有隔离霜和粉底霜的双重功效，完美呈现彩妆效果；使用温和而舒适，使肌肤自然呈现光滑、均匀、细腻、干净的裸妆效果，实现高雅富贵的妆容气质。&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;&lt;br/&gt;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;&lt;strong&gt;&lt;span style=&quot;font-size: 16px;&quot;&gt;【成分】：&lt;/span&gt;&lt;/strong&gt;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;蕴含植物水份&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;&lt;br/&gt;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;&lt;strong&gt;&lt;span style=&quot;font-size: 16px;&quot;&gt;【用法】：&lt;/span&gt;&lt;/strong&gt;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;使用基础化妆品、防晒产品后，取适量，轻拍，使其充分被肌肤吸收。&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;&lt;br/&gt;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;&lt;span style=&quot;font-size: 16px;&quot;&gt;&lt;strong&gt;【使用范围】：&lt;/strong&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;适合任何肌肤，四季可以使用。&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', '&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;保证100%原装正品，假一赔百；&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;&lt;br/&gt;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;15天无条件退换货；&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;&lt;br/&gt;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;若您买到假货，请拨打当地12315电话向质量监督管理局或媒体投诉。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', 1477134305, 'ch'),
(217, 119, 4, 'pc,wap', '210.00', 'view,commend,new,hot', 0, 2, '', '/Template/default/Public/img/p1.jpg', '/Template/default/Public/img/p2.jpg|/Template/default/Public/img/p3.jpg|/Template/default/Public/img/p4.jpg|/Template/default/Public/img/p5.jpg', '', '韩国护肤品化妆品', '', '', '', '', '&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;淡化岁月痕迹，再生干细胞、重现年轻态&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;&lt;br/&gt;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;更新肌肤、抵抗衰老，平复皱纹，焕发肌肤青春活力&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;&lt;br/&gt;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;&lt;span style=&quot;font-size: 16px;&quot;&gt;&lt;strong&gt;干细胞技术：&lt;/strong&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;有效防止肌肤老化，维持肌肤滋润健康状态；&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;&lt;br/&gt;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;&lt;strong&gt;&lt;span style=&quot;font-size: 16px;&quot;&gt;填补皮肤纹理技术：&lt;/span&gt;&lt;/strong&gt;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;硅凝胶及专利功能性粉体(韩国专利号:10-2008-0119458中国专利号: 200910142035.8)，有效的掩盖皱纹，呈现细嫩年轻的皮肤；&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;&lt;br/&gt;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;&lt;strong&gt;&lt;span style=&quot;font-size: 16px;&quot;&gt;防止老化：&lt;/span&gt;&lt;/strong&gt;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;干细胞营养，具有出众的防止肌肤老化效果，维持肌肤滋润健康状态；&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;&lt;br/&gt;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;&lt;strong&gt;&lt;span style=&quot;font-size: 16px;&quot;&gt;软玉粉：&lt;/span&gt;&lt;/strong&gt;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;安抚肌肤，重现肌肤健康生机。&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;&lt;br/&gt;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;&lt;span style=&quot;font-size: 16px;&quot;&gt;&lt;strong&gt;使用方法：&lt;/strong&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;涂抹基础化妆品或防晒产品之后，取适量BB霜轻轻拍打并均匀的涂抹于脸部。&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;&lt;br/&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;&lt;img src=&quot;http://localhost:9000/Template/default/Public/img/p2.jpg&quot;/&gt;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', '&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;&lt;strong style=&quot;font-size: 13.3333px;&quot;&gt;&lt;span style=&quot;font-size: 16px;&quot;&gt;【功效】：&lt;/span&gt;&lt;/strong&gt;&lt;strong&gt;&lt;span style=&quot;font-size: 16px;&quot;&gt;&lt;br/&gt;&lt;/span&gt;&lt;/strong&gt;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;保湿 美白 遮瑕 收缩毛孔&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;富有丝滑感的BB霜蕴含植物水份，用后滋润不干燥，具有隔离霜和粉底霜的双重功效，完美呈现彩妆效果；使用温和而舒适，使肌肤自然呈现光滑、均匀、细腻、干净的裸妆效果，实现高雅富贵的妆容气质。&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;&lt;br/&gt;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;&lt;strong&gt;&lt;span style=&quot;font-size: 16px;&quot;&gt;【成分】：&lt;/span&gt;&lt;/strong&gt;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;蕴含植物水份&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;&lt;br/&gt;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;&lt;strong&gt;&lt;span style=&quot;font-size: 16px;&quot;&gt;【用法】：&lt;/span&gt;&lt;/strong&gt;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;使用基础化妆品、防晒产品后，取适量，轻拍，使其充分被肌肤吸收。&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;&lt;br/&gt;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;&lt;span style=&quot;font-size: 16px;&quot;&gt;&lt;strong&gt;【使用范围】：&lt;/strong&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;适合任何肌肤，四季可以使用。&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', '&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;保证100%原装正品，假一赔百；&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;&lt;br/&gt;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;15天无条件退换货；&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;&lt;br/&gt;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;若您买到假货，请拨打当地12315电话向质量监督管理局或媒体投诉。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', 1477134377, 'ch'),
(218, 119, 4, 'pc,wap', '322.00', 'view,commend,new,hot', 0, 3, '', '/Template/default/Public/img/p1.jpg', '/Template/default/Public/img/p2.jpg|/Template/default/Public/img/p3.jpg|/Template/default/Public/img/p4.jpg|/Template/default/Public/img/p5.jpg', '', '韩国护肤品化妆品', '', '', '', '', '&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;淡化岁月痕迹，再生干细胞、重现年轻态&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;&lt;br/&gt;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;更新肌肤、抵抗衰老，平复皱纹，焕发肌肤青春活力&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;&lt;br/&gt;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;&lt;span style=&quot;font-size: 16px;&quot;&gt;&lt;strong&gt;干细胞技术：&lt;/strong&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;有效防止肌肤老化，维持肌肤滋润健康状态；&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;&lt;br/&gt;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;&lt;strong&gt;&lt;span style=&quot;font-size: 16px;&quot;&gt;填补皮肤纹理技术：&lt;/span&gt;&lt;/strong&gt;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;硅凝胶及专利功能性粉体(韩国专利号:10-2008-0119458中国专利号: 200910142035.8)，有效的掩盖皱纹，呈现细嫩年轻的皮肤；&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;&lt;br/&gt;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;&lt;strong&gt;&lt;span style=&quot;font-size: 16px;&quot;&gt;防止老化：&lt;/span&gt;&lt;/strong&gt;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;干细胞营养，具有出众的防止肌肤老化效果，维持肌肤滋润健康状态；&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;&lt;br/&gt;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;&lt;strong&gt;&lt;span style=&quot;font-size: 16px;&quot;&gt;软玉粉：&lt;/span&gt;&lt;/strong&gt;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;安抚肌肤，重现肌肤健康生机。&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;&lt;br/&gt;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;&lt;span style=&quot;font-size: 16px;&quot;&gt;&lt;strong&gt;使用方法：&lt;/strong&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;涂抹基础化妆品或防晒产品之后，取适量BB霜轻轻拍打并均匀的涂抹于脸部。&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;&lt;br/&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;&lt;img src=&quot;http://localhost:9000/Template/default/Public/img/p2.jpg&quot;/&gt;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', '&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;&lt;strong style=&quot;font-size: 13.3333px;&quot;&gt;&lt;span style=&quot;font-size: 16px;&quot;&gt;【功效】：&lt;/span&gt;&lt;/strong&gt;&lt;strong&gt;&lt;span style=&quot;font-size: 16px;&quot;&gt;&lt;br/&gt;&lt;/span&gt;&lt;/strong&gt;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;保湿 美白 遮瑕 收缩毛孔&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;富有丝滑感的BB霜蕴含植物水份，用后滋润不干燥，具有隔离霜和粉底霜的双重功效，完美呈现彩妆效果；使用温和而舒适，使肌肤自然呈现光滑、均匀、细腻、干净的裸妆效果，实现高雅富贵的妆容气质。&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;&lt;br/&gt;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;&lt;strong&gt;&lt;span style=&quot;font-size: 16px;&quot;&gt;【成分】：&lt;/span&gt;&lt;/strong&gt;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;蕴含植物水份&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;&lt;br/&gt;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;&lt;strong&gt;&lt;span style=&quot;font-size: 16px;&quot;&gt;【用法】：&lt;/span&gt;&lt;/strong&gt;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;使用基础化妆品、防晒产品后，取适量，轻拍，使其充分被肌肤吸收。&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;&lt;br/&gt;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;&lt;span style=&quot;font-size: 16px;&quot;&gt;&lt;strong&gt;【使用范围】：&lt;/strong&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;适合任何肌肤，四季可以使用。&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', '&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;保证100%原装正品，假一赔百；&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;&lt;br/&gt;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;15天无条件退换货；&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;&lt;br/&gt;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;若您买到假货，请拨打当地12315电话向质量监督管理局或媒体投诉。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', 1477134448, 'ch'),
(219, 119, 4, 'pc,wap', '267.00', 'view,commend,new,hot', 0, 1, '', '/Template/default/Public/img/p1.jpg', '/Template/default/Public/img/p2.jpg|/Template/default/Public/img/p3.jpg|/Template/default/Public/img/p4.jpg|/Template/default/Public/img/p5.jpg', '', '韩国护肤品化妆品', '', '', '', '', '&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;淡化岁月痕迹，再生干细胞、重现年轻态&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;&lt;br/&gt;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;更新肌肤、抵抗衰老，平复皱纹，焕发肌肤青春活力&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;&lt;br/&gt;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;&lt;span style=&quot;font-size: 16px;&quot;&gt;&lt;strong&gt;干细胞技术：&lt;/strong&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;有效防止肌肤老化，维持肌肤滋润健康状态；&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;&lt;br/&gt;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;&lt;strong&gt;&lt;span style=&quot;font-size: 16px;&quot;&gt;填补皮肤纹理技术：&lt;/span&gt;&lt;/strong&gt;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;硅凝胶及专利功能性粉体(韩国专利号:10-2008-0119458中国专利号: 200910142035.8)，有效的掩盖皱纹，呈现细嫩年轻的皮肤；&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;&lt;br/&gt;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;&lt;strong&gt;&lt;span style=&quot;font-size: 16px;&quot;&gt;防止老化：&lt;/span&gt;&lt;/strong&gt;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;干细胞营养，具有出众的防止肌肤老化效果，维持肌肤滋润健康状态；&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;&lt;br/&gt;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;&lt;strong&gt;&lt;span style=&quot;font-size: 16px;&quot;&gt;软玉粉：&lt;/span&gt;&lt;/strong&gt;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;安抚肌肤，重现肌肤健康生机。&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;&lt;br/&gt;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;&lt;span style=&quot;font-size: 16px;&quot;&gt;&lt;strong&gt;使用方法：&lt;/strong&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;涂抹基础化妆品或防晒产品之后，取适量BB霜轻轻拍打并均匀的涂抹于脸部。&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;&lt;br/&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;&lt;img src=&quot;http://localhost:9000/Template/default/Public/img/p2.jpg&quot;/&gt;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', '&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;&lt;strong style=&quot;font-size: 13.3333px;&quot;&gt;&lt;span style=&quot;font-size: 16px;&quot;&gt;【功效】：&lt;/span&gt;&lt;/strong&gt;&lt;strong&gt;&lt;span style=&quot;font-size: 16px;&quot;&gt;&lt;br/&gt;&lt;/span&gt;&lt;/strong&gt;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;保湿 美白 遮瑕 收缩毛孔&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;富有丝滑感的BB霜蕴含植物水份，用后滋润不干燥，具有隔离霜和粉底霜的双重功效，完美呈现彩妆效果；使用温和而舒适，使肌肤自然呈现光滑、均匀、细腻、干净的裸妆效果，实现高雅富贵的妆容气质。&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;&lt;br/&gt;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;&lt;strong&gt;&lt;span style=&quot;font-size: 16px;&quot;&gt;【成分】：&lt;/span&gt;&lt;/strong&gt;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;蕴含植物水份&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;&lt;br/&gt;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;&lt;strong&gt;&lt;span style=&quot;font-size: 16px;&quot;&gt;【用法】：&lt;/span&gt;&lt;/strong&gt;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;使用基础化妆品、防晒产品后，取适量，轻拍，使其充分被肌肤吸收。&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;&lt;br/&gt;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;&lt;span style=&quot;font-size: 16px;&quot;&gt;&lt;strong&gt;【使用范围】：&lt;/strong&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;适合任何肌肤，四季可以使用。&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', '&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;保证100%原装正品，假一赔百；&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;&lt;br/&gt;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;15天无条件退换货；&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;&lt;br/&gt;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;若您买到假货，请拨打当地12315电话向质量监督管理局或媒体投诉。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', 1477134531, 'ch'),
(220, 119, 4, 'pc,wap', '328.00', 'view,commend,new,hot', 0, 1, '', '/Template/default/Public/img/p1.jpg', '/Template/default/Public/img/p2.jpg|/Template/default/Public/img/p3.jpg|/Template/default/Public/img/p4.jpg|/Template/default/Public/img/p5.jpg', '', '韩国护肤品化妆品', '', '', '', '', '&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;淡化岁月痕迹，再生干细胞、重现年轻态&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;&lt;br/&gt;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;更新肌肤、抵抗衰老，平复皱纹，焕发肌肤青春活力&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;&lt;br/&gt;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;&lt;span style=&quot;font-size: 16px;&quot;&gt;&lt;strong&gt;干细胞技术：&lt;/strong&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;有效防止肌肤老化，维持肌肤滋润健康状态；&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;&lt;br/&gt;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;&lt;strong&gt;&lt;span style=&quot;font-size: 16px;&quot;&gt;填补皮肤纹理技术：&lt;/span&gt;&lt;/strong&gt;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;硅凝胶及专利功能性粉体(韩国专利号:10-2008-0119458中国专利号: 200910142035.8)，有效的掩盖皱纹，呈现细嫩年轻的皮肤；&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;&lt;br/&gt;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;&lt;strong&gt;&lt;span style=&quot;font-size: 16px;&quot;&gt;防止老化：&lt;/span&gt;&lt;/strong&gt;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;干细胞营养，具有出众的防止肌肤老化效果，维持肌肤滋润健康状态；&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;&lt;br/&gt;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;&lt;strong&gt;&lt;span style=&quot;font-size: 16px;&quot;&gt;软玉粉：&lt;/span&gt;&lt;/strong&gt;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;安抚肌肤，重现肌肤健康生机。&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;&lt;br/&gt;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;&lt;span style=&quot;font-size: 16px;&quot;&gt;&lt;strong&gt;使用方法：&lt;/strong&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;涂抹基础化妆品或防晒产品之后，取适量BB霜轻轻拍打并均匀的涂抹于脸部。&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;&lt;br/&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;&lt;img src=&quot;http://localhost:9000/Template/default/Public/img/p2.jpg&quot;/&gt;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', '&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;&lt;strong style=&quot;font-size: 13.3333px;&quot;&gt;&lt;span style=&quot;font-size: 16px;&quot;&gt;【功效】：&lt;/span&gt;&lt;/strong&gt;&lt;strong&gt;&lt;span style=&quot;font-size: 16px;&quot;&gt;&lt;br/&gt;&lt;/span&gt;&lt;/strong&gt;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;保湿 美白 遮瑕 收缩毛孔&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;富有丝滑感的BB霜蕴含植物水份，用后滋润不干燥，具有隔离霜和粉底霜的双重功效，完美呈现彩妆效果；使用温和而舒适，使肌肤自然呈现光滑、均匀、细腻、干净的裸妆效果，实现高雅富贵的妆容气质。&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;&lt;br/&gt;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;&lt;strong&gt;&lt;span style=&quot;font-size: 16px;&quot;&gt;【成分】：&lt;/span&gt;&lt;/strong&gt;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;蕴含植物水份&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;&lt;br/&gt;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;&lt;strong&gt;&lt;span style=&quot;font-size: 16px;&quot;&gt;【用法】：&lt;/span&gt;&lt;/strong&gt;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;使用基础化妆品、防晒产品后，取适量，轻拍，使其充分被肌肤吸收。&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;&lt;br/&gt;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;&lt;span style=&quot;font-size: 16px;&quot;&gt;&lt;strong&gt;【使用范围】：&lt;/strong&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;适合任何肌肤，四季可以使用。&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', '&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;保证100%原装正品，假一赔百；&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;&lt;br/&gt;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;15天无条件退换货；&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;&lt;br/&gt;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;若您买到假货，请拨打当地12315电话向质量监督管理局或媒体投诉。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', 1477134606, 'ch'),
(221, 119, 4, 'pc,wap', '179.00', 'view,commend,new,hot', 0, 4, '', '/Template/default/Public/img/p1.jpg', '/Template/default/Public/img/p2.jpg|/Template/default/Public/img/p3.jpg|/Template/default/Public/img/p4.jpg|/Template/default/Public/img/p5.jpg', '', '韩国护肤品化妆品', '', '', '', '', '&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;淡化岁月痕迹，再生干细胞、重现年轻态&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;&lt;br/&gt;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;更新肌肤、抵抗衰老，平复皱纹，焕发肌肤青春活力&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;&lt;br/&gt;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;&lt;span style=&quot;font-size: 16px;&quot;&gt;&lt;strong&gt;干细胞技术：&lt;/strong&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;有效防止肌肤老化，维持肌肤滋润健康状态；&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;&lt;br/&gt;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;&lt;strong&gt;&lt;span style=&quot;font-size: 16px;&quot;&gt;填补皮肤纹理技术：&lt;/span&gt;&lt;/strong&gt;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;硅凝胶及专利功能性粉体(韩国专利号:10-2008-0119458中国专利号: 200910142035.8)，有效的掩盖皱纹，呈现细嫩年轻的皮肤；&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;&lt;br/&gt;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;&lt;strong&gt;&lt;span style=&quot;font-size: 16px;&quot;&gt;防止老化：&lt;/span&gt;&lt;/strong&gt;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;干细胞营养，具有出众的防止肌肤老化效果，维持肌肤滋润健康状态；&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;&lt;br/&gt;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;&lt;strong&gt;&lt;span style=&quot;font-size: 16px;&quot;&gt;软玉粉：&lt;/span&gt;&lt;/strong&gt;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;安抚肌肤，重现肌肤健康生机。&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;&lt;br/&gt;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;&lt;span style=&quot;font-size: 16px;&quot;&gt;&lt;strong&gt;使用方法：&lt;/strong&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;涂抹基础化妆品或防晒产品之后，取适量BB霜轻轻拍打并均匀的涂抹于脸部。&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;&lt;br/&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;&lt;img src=&quot;http://localhost:9000/Template/default/Public/img/p2.jpg&quot;/&gt;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', '&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;&lt;strong style=&quot;font-size: 13.3333px;&quot;&gt;&lt;span style=&quot;font-size: 16px;&quot;&gt;【功效】：&lt;/span&gt;&lt;/strong&gt;&lt;strong&gt;&lt;span style=&quot;font-size: 16px;&quot;&gt;&lt;br/&gt;&lt;/span&gt;&lt;/strong&gt;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;保湿 美白 遮瑕 收缩毛孔&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;富有丝滑感的BB霜蕴含植物水份，用后滋润不干燥，具有隔离霜和粉底霜的双重功效，完美呈现彩妆效果；使用温和而舒适，使肌肤自然呈现光滑、均匀、细腻、干净的裸妆效果，实现高雅富贵的妆容气质。&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;&lt;br/&gt;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;&lt;strong&gt;&lt;span style=&quot;font-size: 16px;&quot;&gt;【成分】：&lt;/span&gt;&lt;/strong&gt;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;蕴含植物水份&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;&lt;br/&gt;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;&lt;strong&gt;&lt;span style=&quot;font-size: 16px;&quot;&gt;【用法】：&lt;/span&gt;&lt;/strong&gt;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;使用基础化妆品、防晒产品后，取适量，轻拍，使其充分被肌肤吸收。&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;&lt;br/&gt;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;&lt;span style=&quot;font-size: 16px;&quot;&gt;&lt;strong&gt;【使用范围】：&lt;/strong&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;适合任何肌肤，四季可以使用。&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', '&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;保证100%原装正品，假一赔百；&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;&lt;br/&gt;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;15天无条件退换货；&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;&lt;br/&gt;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;若您买到假货，请拨打当地12315电话向质量监督管理局或媒体投诉。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', 1477134672, 'ch');
INSERT INTO `bmkj_product` (`id`, `sortid`, `areaid`, `client`, `price`, `status`, `sequence`, `hits`, `auth_group`, `thumb`, `morepics`, `linkurl`, `title`, `seotitle`, `keyword`, `description`, `fileurl`, `content1`, `content2`, `content3`, `addtime`, `lan`) VALUES
(222, 119, 4, 'pc,wap', '293.00', 'view,commend,new,hot', 0, 42, '', '/Template/default/Public/img/p1.jpg', '/Template/default/Public/img/p2.jpg|/Template/default/Public/img/p3.jpg|/Template/default/Public/img/p4.jpg|/Template/default/Public/img/p5.jpg', '', '韩国护肤品化妆品', '', '', '', '', '&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;淡化岁月痕迹，再生干细胞、重现年轻态&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;&lt;br/&gt;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;更新肌肤、抵抗衰老，平复皱纹，焕发肌肤青春活力&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;&lt;br/&gt;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;&lt;span style=&quot;font-size: 16px;&quot;&gt;&lt;strong&gt;干细胞技术：&lt;/strong&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;有效防止肌肤老化，维持肌肤滋润健康状态；&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;&lt;br/&gt;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;&lt;strong&gt;&lt;span style=&quot;font-size: 16px;&quot;&gt;填补皮肤纹理技术：&lt;/span&gt;&lt;/strong&gt;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;硅凝胶及专利功能性粉体(韩国专利号:10-2008-0119458中国专利号: 200910142035.8)，有效的掩盖皱纹，呈现细嫩年轻的皮肤；&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;&lt;br/&gt;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;&lt;strong&gt;&lt;span style=&quot;font-size: 16px;&quot;&gt;防止老化：&lt;/span&gt;&lt;/strong&gt;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;干细胞营养，具有出众的防止肌肤老化效果，维持肌肤滋润健康状态；&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;&lt;br/&gt;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;&lt;strong&gt;&lt;span style=&quot;font-size: 16px;&quot;&gt;软玉粉：&lt;/span&gt;&lt;/strong&gt;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;安抚肌肤，重现肌肤健康生机。&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;&lt;br/&gt;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;&lt;span style=&quot;font-size: 16px;&quot;&gt;&lt;strong&gt;使用方法：&lt;/strong&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;涂抹基础化妆品或防晒产品之后，取适量BB霜轻轻拍打并均匀的涂抹于脸部。&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;&lt;br/&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;&lt;img src=&quot;http://localhost:9000/Template/default/Public/img/p2.jpg&quot;/&gt;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', '&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;&lt;strong style=&quot;font-size: 13.3333px;&quot;&gt;&lt;span style=&quot;font-size: 16px;&quot;&gt;【功效】：&lt;/span&gt;&lt;/strong&gt;&lt;strong&gt;&lt;span style=&quot;font-size: 16px;&quot;&gt;&lt;br/&gt;&lt;/span&gt;&lt;/strong&gt;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;保湿 美白 遮瑕 收缩毛孔&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;富有丝滑感的BB霜蕴含植物水份，用后滋润不干燥，具有隔离霜和粉底霜的双重功效，完美呈现彩妆效果；使用温和而舒适，使肌肤自然呈现光滑、均匀、细腻、干净的裸妆效果，实现高雅富贵的妆容气质。&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;&lt;br/&gt;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;&lt;strong&gt;&lt;span style=&quot;font-size: 16px;&quot;&gt;【成分】：&lt;/span&gt;&lt;/strong&gt;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;蕴含植物水份&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;&lt;br/&gt;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;&lt;strong&gt;&lt;span style=&quot;font-size: 16px;&quot;&gt;【用法】：&lt;/span&gt;&lt;/strong&gt;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;使用基础化妆品、防晒产品后，取适量，轻拍，使其充分被肌肤吸收。&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;&lt;br/&gt;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;&lt;span style=&quot;font-size: 16px;&quot;&gt;&lt;strong&gt;【使用范围】：&lt;/strong&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;适合任何肌肤，四季可以使用。&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', '&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;保证100%原装正品，假一赔百；&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;&lt;br/&gt;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;15天无条件退换货；&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;&lt;br/&gt;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;若您买到假货，请拨打当地12315电话向质量监督管理局或媒体投诉。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', 1477134733, 'ch'),
(223, 150, 10, 'pc,wap', '293.00', 'view,commend,new,hot', 0, 2, '', '/Template/default/Public/img/p1.jpg', '/Template/default/Public/img/p2.jpg|/Template/default/Public/img/p3.jpg|/Template/default/Public/img/p4.jpg|/Template/default/Public/img/p5.jpg', '', 'South Korea skin care cosmetics', '', '', '', '', '&lt;p&gt;Fade traces of the years, the regeneration of stem cells, reproduce the young state&lt;/p&gt;&lt;p&gt;Update the skin, resist aging, remove wrinkles, keep skin youthful vitality&lt;/p&gt;&lt;p&gt;Stem cell technology:&lt;/p&gt;&lt;p&gt;Effectively prevent skin aging, keep skin moist and healthy;&lt;/p&gt;&lt;p&gt;Skin texture technology:&lt;/p&gt;&lt;p&gt;Silica gel and functional powder (patent number: 10-2008-0119458 China Korean patent patent number: 200910142035.8), effectively masking wrinkles, showing delicate young skin;&lt;/p&gt;&lt;p&gt;Prevent aging:&lt;/p&gt;&lt;p&gt;Stem cell nutrition, with outstanding prevention of skin aging effect, to maintain the healthy state of skin moisture;&lt;/p&gt;&lt;p&gt;Nephrite powder:&lt;/p&gt;&lt;p&gt;Soothe the skin, reproduce the skin health and vitality.&lt;/p&gt;&lt;p&gt;Usage method：&lt;/p&gt;&lt;p&gt;After applying the basis of cosmetics or sunscreen products, take the right amount of BB cream gently pat and evenly applied to the face&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', '&lt;p&gt;[function]:&lt;/p&gt;&lt;p&gt;Moisturizing whitening skin shrink pores&lt;/p&gt;&lt;p&gt;A silky feeling BB cream contains plant water, after use moisture does not dry, and has double effects of cream and cream foundation, perfect makeup effect; gentle and comfortable, make the skin smooth, uniform and exquisite natural appearance, clean nude make-up effect, achieve elegant temperament makeup.&lt;/p&gt;&lt;p&gt;[composition]:&lt;/p&gt;&lt;p&gt;Plant water&lt;/p&gt;&lt;p&gt;[usage]:&lt;/p&gt;&lt;p&gt;Use basic cosmetics, sunscreen products, take the right amount, pat, so that it is fully absorbed by the skin.&lt;/p&gt;&lt;p&gt;[range]:&lt;/p&gt;&lt;p&gt;Suitable for any skin, the four seasons can be used.&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', '&lt;p&gt;Guaranteed 100% original genuine, fake a lose 100;&lt;/p&gt;&lt;p&gt;15 days unconditionalreturn;&lt;/p&gt;&lt;p&gt;If you buy a fake, please call the local 12315 phone to the quality supervision and administration or media complaints.&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', 1477226784, 'en'),
(224, 150, 10, 'pc,wap', '169.00', 'view,commend,new,hot', 0, 1, '', '/Template/default/Public/img/p1.jpg', '/Template/default/Public/img/p2.jpg|/Template/default/Public/img/p3.jpg|/Template/default/Public/img/p4.jpg|/Template/default/Public/img/p5.jpg', '', 'South Korea skin care cosmetics', '', '', '', '', '&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;Fade traces of the years, the regeneration of stem cells, reproduce the young state&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;Update the skin, resist aging, remove wrinkles, keep skin youthful vitality&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;Stem cell technology:&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;Effectively prevent skin aging, keep skin moist and healthy;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;Skin texture technology:&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;Silica gel and functional powder (patent number: 10-2008-0119458 China Korean patent patent number: 200910142035.8), effectively masking wrinkles, showing delicate young skin;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;Prevent aging:&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;Stem cell nutrition, with outstanding prevention of skin aging effect, to maintain the healthy state of skin moisture;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;Nephrite powder:&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;Soothe the skin, reproduce the skin health and vitality.&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;Usage method：&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;After applying the basis of cosmetics or sunscreen products, take the right amount of BB cream gently pat and evenly applied to the face&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', '&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;[function]:&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;Moisturizing whitening skin shrink pores&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;A silky feeling BB cream contains plant water, after use moisture does not dry, and has double effects of cream and cream foundation, perfect makeup effect; gentle and comfortable, make the skin smooth, uniform and exquisite natural appearance, clean nude make-up effect, achieve elegant temperament makeup.&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;[composition]:&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;Plant water&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;[usage]:&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;Use basic cosmetics, sunscreen products, take the right amount, pat, so that it is fully absorbed by the skin.&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;[range]:&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;Suitable for any skin, the four seasons can be used.&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', '&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;Guaranteed 100% original genuine, fake a lose 100;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;15 days unconditionalreturn;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;If you buy a fake, please call the local 12315 phone to the quality supervision and administration or media complaints.&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', 1477227267, 'en'),
(225, 150, 10, 'pc,wap', '189.00', 'view,commend,new,hot', 0, 3, '', '/Template/default/Public/img/p1.jpg', '/Template/default/Public/img/p2.jpg|/Template/default/Public/img/p3.jpg|/Template/default/Public/img/p4.jpg|/Template/default/Public/img/p5.jpg', '', 'South Korea skin care cosmetics', '', '', '', '', '&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;Fade traces of the years, the regeneration of stem cells, reproduce the young state&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;Update the skin, resist aging, remove wrinkles, keep skin youthful vitality&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;Stem cell technology:&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;Effectively prevent skin aging, keep skin moist and healthy;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;Skin texture technology:&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;Silica gel and functional powder (patent number: 10-2008-0119458 China Korean patent patent number: 200910142035.8), effectively masking wrinkles, showing delicate young skin;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;Prevent aging:&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;Stem cell nutrition, with outstanding prevention of skin aging effect, to maintain the healthy state of skin moisture;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;Nephrite powder:&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;Soothe the skin, reproduce the skin health and vitality.&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;Usage method：&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;After applying the basis of cosmetics or sunscreen products, take the right amount of BB cream gently pat and evenly applied to the face&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', '&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;[function]:&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;Moisturizing whitening skin shrink pores&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;A silky feeling BB cream contains plant water, after use moisture does not dry, and has double effects of cream and cream foundation, perfect makeup effect; gentle and comfortable, make the skin smooth, uniform and exquisite natural appearance, clean nude make-up effect, achieve elegant temperament makeup.&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;[composition]:&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;Plant water&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;[usage]:&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;Use basic cosmetics, sunscreen products, take the right amount, pat, so that it is fully absorbed by the skin.&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;[range]:&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;Suitable for any skin, the four seasons can be used.&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', '&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;Guaranteed 100% original genuine, fake a lose 100;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;15 days unconditionalreturn;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;If you buy a fake, please call the local 12315 phone to the quality supervision and administration or media complaints.&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', 1477227354, 'en'),
(226, 150, 10, 'pc,wap', '268.00', 'view,commend,new,hot', 0, 1, '', '/Template/default/Public/img/p1.jpg', '/Template/default/Public/img/p2.jpg|/Template/default/Public/img/p3.jpg|/Template/default/Public/img/p4.jpg|/Template/default/Public/img/p5.jpg', '', 'South Korea skin care cosmetics', '', '', '', '', '&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;Fade traces of the years, the regeneration of stem cells, reproduce the young state&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;Update the skin, resist aging, remove wrinkles, keep skin youthful vitality&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;Stem cell technology:&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;Effectively prevent skin aging, keep skin moist and healthy;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;Skin texture technology:&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;Silica gel and functional powder (patent number: 10-2008-0119458 China Korean patent patent number: 200910142035.8), effectively masking wrinkles, showing delicate young skin;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;Prevent aging:&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;Stem cell nutrition, with outstanding prevention of skin aging effect, to maintain the healthy state of skin moisture;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;Nephrite powder:&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;Soothe the skin, reproduce the skin health and vitality.&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;Usage method：&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;After applying the basis of cosmetics or sunscreen products, take the right amount of BB cream gently pat and evenly applied to the face&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', '&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;[function]:&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;Moisturizing whitening skin shrink pores&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;A silky feeling BB cream contains plant water, after use moisture does not dry, and has double effects of cream and cream foundation, perfect makeup effect; gentle and comfortable, make the skin smooth, uniform and exquisite natural appearance, clean nude make-up effect, achieve elegant temperament makeup.&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;[composition]:&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;Plant water&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;[usage]:&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;Use basic cosmetics, sunscreen products, take the right amount, pat, so that it is fully absorbed by the skin.&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;[range]:&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;Suitable for any skin, the four seasons can be used.&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', '&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;Guaranteed 100% original genuine, fake a lose 100;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;15 days unconditionalreturn;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;If you buy a fake, please call the local 12315 phone to the quality supervision and administration or media complaints.&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', 1477227431, 'en'),
(227, 150, 10, 'pc,wap', '198.00', 'view,commend,new,hot', 0, 3, '', '/Template/default/Public/img/p1.jpg', '/Template/default/Public/img/p2.jpg|/Template/default/Public/img/p3.jpg|/Template/default/Public/img/p4.jpg|/Template/default/Public/img/p5.jpg', '', 'South Korea skin care cosmetics', '', '', '', '', '&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;Fade traces of the years, the regeneration of stem cells, reproduce the young state&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;Update the skin, resist aging, remove wrinkles, keep skin youthful vitality&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;Stem cell technology:&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;Effectively prevent skin aging, keep skin moist and healthy;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;Skin texture technology:&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;Silica gel and functional powder (patent number: 10-2008-0119458 China Korean patent patent number: 200910142035.8), effectively masking wrinkles, showing delicate young skin;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;Prevent aging:&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;Stem cell nutrition, with outstanding prevention of skin aging effect, to maintain the healthy state of skin moisture;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;Nephrite powder:&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;Soothe the skin, reproduce the skin health and vitality.&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;Usage method：&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;After applying the basis of cosmetics or sunscreen products, take the right amount of BB cream gently pat and evenly applied to the face&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', '&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;[function]:&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;Moisturizing whitening skin shrink pores&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;A silky feeling BB cream contains plant water, after use moisture does not dry, and has double effects of cream and cream foundation, perfect makeup effect; gentle and comfortable, make the skin smooth, uniform and exquisite natural appearance, clean nude make-up effect, achieve elegant temperament makeup.&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;[composition]:&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;Plant water&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;[usage]:&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;Use basic cosmetics, sunscreen products, take the right amount, pat, so that it is fully absorbed by the skin.&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;[range]:&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;Suitable for any skin, the four seasons can be used.&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', '&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;Guaranteed 100% original genuine, fake a lose 100;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;15 days unconditionalreturn;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;If you buy a fake, please call the local 12315 phone to the quality supervision and administration or media complaints.&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', 1477234312, 'en'),
(228, 150, 10, 'pc,wap', '173.00', 'view,commend,new,hot', 0, 1, '', '/Template/default/Public/img/p1.jpg', '/Template/default/Public/img/p2.jpg|/Template/default/Public/img/p3.jpg|/Template/default/Public/img/p4.jpg|/Template/default/Public/img/p5.jpg', '', 'South Korea skin care cosmetics', '', '', '', '', '&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;Fade traces of the years, the regeneration of stem cells, reproduce the young state&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;Update the skin, resist aging, remove wrinkles, keep skin youthful vitality&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;Stem cell technology:&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;Effectively prevent skin aging, keep skin moist and healthy;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;Skin texture technology:&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;Silica gel and functional powder (patent number: 10-2008-0119458 China Korean patent patent number: 200910142035.8), effectively masking wrinkles, showing delicate young skin;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;Prevent aging:&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;Stem cell nutrition, with outstanding prevention of skin aging effect, to maintain the healthy state of skin moisture;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;Nephrite powder:&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;Soothe the skin, reproduce the skin health and vitality.&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;Usage method：&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;After applying the basis of cosmetics or sunscreen products, take the right amount of BB cream gently pat and evenly applied to the face&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', '&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;[function]:&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;Moisturizing whitening skin shrink pores&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;A silky feeling BB cream contains plant water, after use moisture does not dry, and has double effects of cream and cream foundation, perfect makeup effect; gentle and comfortable, make the skin smooth, uniform and exquisite natural appearance, clean nude make-up effect, achieve elegant temperament makeup.&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;[composition]:&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;Plant water&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;[usage]:&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;Use basic cosmetics, sunscreen products, take the right amount, pat, so that it is fully absorbed by the skin.&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;[range]:&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;Suitable for any skin, the four seasons can be used.&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', '&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;Guaranteed 100% original genuine, fake a lose 100;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;15 days unconditionalreturn;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;If you buy a fake, please call the local 12315 phone to the quality supervision and administration or media complaints.&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', 1477234378, 'en'),
(229, 150, 10, 'pc,wap', '110.00', 'view,commend,new,hot', 0, 1, '', '/Template/default/Public/img/p1.jpg', '/Template/default/Public/img/p2.jpg|/Template/default/Public/img/p3.jpg|/Template/default/Public/img/p4.jpg|/Template/default/Public/img/p5.jpg', '', 'South Korea skin care cosmetics', '', '', '', '', '&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;Fade traces of the years, the regeneration of stem cells, reproduce the young state&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;Update the skin, resist aging, remove wrinkles, keep skin youthful vitality&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;Stem cell technology:&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;Effectively prevent skin aging, keep skin moist and healthy;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;Skin texture technology:&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;Silica gel and functional powder (patent number: 10-2008-0119458 China Korean patent patent number: 200910142035.8), effectively masking wrinkles, showing delicate young skin;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;Prevent aging:&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;Stem cell nutrition, with outstanding prevention of skin aging effect, to maintain the healthy state of skin moisture;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;Nephrite powder:&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;Soothe the skin, reproduce the skin health and vitality.&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;Usage method：&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;After applying the basis of cosmetics or sunscreen products, take the right amount of BB cream gently pat and evenly applied to the face&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', '&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;[function]:&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;Moisturizing whitening skin shrink pores&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;A silky feeling BB cream contains plant water, after use moisture does not dry, and has double effects of cream and cream foundation, perfect makeup effect; gentle and comfortable, make the skin smooth, uniform and exquisite natural appearance, clean nude make-up effect, achieve elegant temperament makeup.&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;[composition]:&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;Plant water&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;[usage]:&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;Use basic cosmetics, sunscreen products, take the right amount, pat, so that it is fully absorbed by the skin.&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;[range]:&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;Suitable for any skin, the four seasons can be used.&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', '&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;Guaranteed 100% original genuine, fake a lose 100;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;15 days unconditionalreturn;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;If you buy a fake, please call the local 12315 phone to the quality supervision and administration or media complaints.&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', 1477241359, 'en'),
(230, 150, 10, 'pc,wap', '210.00', 'view,commend,new,hot', 0, 1, '', '/Template/default/Public/img/p1.jpg', '/Template/default/Public/img/p2.jpg|/Template/default/Public/img/p3.jpg|/Template/default/Public/img/p4.jpg|/Template/default/Public/img/p5.jpg', '', 'South Korea skin care cosmetics', '', '', '', '', '&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;Fade traces of the years, the regeneration of stem cells, reproduce the young state&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;Update the skin, resist aging, remove wrinkles, keep skin youthful vitality&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;Stem cell technology:&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;Effectively prevent skin aging, keep skin moist and healthy;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;Skin texture technology:&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;Silica gel and functional powder (patent number: 10-2008-0119458 China Korean patent patent number: 200910142035.8), effectively masking wrinkles, showing delicate young skin;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;Prevent aging:&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;Stem cell nutrition, with outstanding prevention of skin aging effect, to maintain the healthy state of skin moisture;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;Nephrite powder:&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;Soothe the skin, reproduce the skin health and vitality.&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;Usage method：&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;After applying the basis of cosmetics or sunscreen products, take the right amount of BB cream gently pat and evenly applied to the face&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', '&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;[function]:&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;Moisturizing whitening skin shrink pores&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;A silky feeling BB cream contains plant water, after use moisture does not dry, and has double effects of cream and cream foundation, perfect makeup effect; gentle and comfortable, make the skin smooth, uniform and exquisite natural appearance, clean nude make-up effect, achieve elegant temperament makeup.&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;[composition]:&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;Plant water&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;[usage]:&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;Use basic cosmetics, sunscreen products, take the right amount, pat, so that it is fully absorbed by the skin.&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;[range]:&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;Suitable for any skin, the four seasons can be used.&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', '&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;Guaranteed 100% original genuine, fake a lose 100;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;15 days unconditionalreturn;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;If you buy a fake, please call the local 12315 phone to the quality supervision and administration or media complaints.&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', 1477241419, 'en'),
(231, 150, 10, 'pc,wap', '330.00', 'view,commend,new,hot', 0, 6, '', '/Template/default/Public/img/p1.jpg', '/Template/default/Public/img/p2.jpg|/Template/default/Public/img/p3.jpg|/Template/default/Public/img/p4.jpg|/Template/default/Public/img/p5.jpg', '', 'South Korea skin care cosmetics', '', '', '', '', '&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;Fade traces of the years, the regeneration of stem cells, reproduce the young state&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;Update the skin, resist aging, remove wrinkles, keep skin youthful vitality&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;Stem cell technology:&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;Effectively prevent skin aging, keep skin moist and healthy;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;Skin texture technology:&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;Silica gel and functional powder (patent number: 10-2008-0119458 China Korean patent patent number: 200910142035.8), effectively masking wrinkles, showing delicate young skin;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;Prevent aging:&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;Stem cell nutrition, with outstanding prevention of skin aging effect, to maintain the healthy state of skin moisture;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;Nephrite powder:&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;Soothe the skin, reproduce the skin health and vitality.&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;Usage method：&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;After applying the basis of cosmetics or sunscreen products, take the right amount of BB cream gently pat and evenly applied to the face&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', '&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;[function]:&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;Moisturizing whitening skin shrink pores&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;A silky feeling BB cream contains plant water, after use moisture does not dry, and has double effects of cream and cream foundation, perfect makeup effect; gentle and comfortable, make the skin smooth, uniform and exquisite natural appearance, clean nude make-up effect, achieve elegant temperament makeup.&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;[composition]:&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;Plant water&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;[usage]:&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;Use basic cosmetics, sunscreen products, take the right amount, pat, so that it is fully absorbed by the skin.&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;[range]:&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;Suitable for any skin, the four seasons can be used.&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', '&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;Guaranteed 100% original genuine, fake a lose 100;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;15 days unconditionalreturn;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;If you buy a fake, please call the local 12315 phone to the quality supervision and administration or media complaints.&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', 1477241503, 'en');

-- --------------------------------------------------------

--
-- 表的结构 `bmkj_project`
--

CREATE TABLE IF NOT EXISTS `bmkj_project` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sortid` int(10) DEFAULT NULL,
  `areaid` int(10) DEFAULT NULL,
  `client` varchar(200) DEFAULT 'pc,wap,weixin',
  `status` varchar(200) DEFAULT NULL,
  `sequence` int(10) DEFAULT '0',
  `hits` int(10) DEFAULT '1',
  `auth_group` varchar(200) DEFAULT NULL,
  `thumb` varchar(255) DEFAULT NULL,
  `morepics` text,
  `linkurl` varchar(255) DEFAULT NULL,
  `title` varchar(100) DEFAULT NULL,
  `seotitle` varchar(255) DEFAULT NULL,
  `keyword` varchar(255) DEFAULT NULL,
  `description` varchar(500) DEFAULT NULL,
  `fileurl` varchar(255) DEFAULT NULL,
  `content1` text,
  `content2` text,
  `content3` text,
  `addtime` int(10) DEFAULT NULL,
  `urlroute` varchar(100) DEFAULT NULL,
  `lan` char(30) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=233 ;

--
-- 转存表中的数据 `bmkj_project`
--

INSERT INTO `bmkj_project` (`id`, `sortid`, `areaid`, `client`, `status`, `sequence`, `hits`, `auth_group`, `thumb`, `morepics`, `linkurl`, `title`, `seotitle`, `keyword`, `description`, `fileurl`, `content1`, `content2`, `content3`, `addtime`, `urlroute`, `lan`) VALUES
(219, 142, 4, 'pc,wap', 'view,commend,new,hot', 0, 4, '', '/Template/default/Public/img/c1.jpg', '', '', '有效防止肌肤老化，维持肌肤滋润健康状态', '', '', '淡化岁月痕迹，再生干细胞、重现年轻态\r\n更新肌肤、抵抗衰老，平复皱纹，焕发肌肤青春活力\r\n干细胞技术：有效防止肌肤老化，维持肌肤滋润健康状态；\r\n填补皮肤纹理技术：硅凝胶及专利功能性粉体(韩国专利号:10-2008-0119458中国专利号: 200910142035.8)', '', '&lt;p&gt;淡化岁月痕迹，再生干细胞、重现年轻态&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;更新肌肤、抵抗衰老，平复皱纹，焕发肌肤青春活力&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;干细胞技术：有效防止肌肤老化，维持肌肤滋润健康状态；&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;填补皮肤纹理技术：硅凝胶及专利功能性粉体(韩国专利号:10-2008-0119458中国专利号: 200910142035.8)，有效的掩盖皱纹，呈现细嫩年轻的皮肤；&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;防止老化：干细胞营养，具有出众的防止肌肤老化效果，维持肌肤滋润健康状态；&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;软玉粉：安抚肌肤，重现肌肤健康生机。&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;使用方法：涂抹基础化妆品或防晒产品之后，取适量BB霜轻轻拍打并均匀的涂抹于脸部。&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', '', '', 1477137901, '', 'ch'),
(221, 138, 4, 'pc,wap', 'view,commend,new,hot', 0, 1, '', '/Template/default/Public/img/c1.jpg', '', '', '有效防止肌肤老化，维持肌肤滋润健康状态', '', '', '淡化岁月痕迹，再生干细胞、重现年轻态\r\n更新肌肤、抵抗衰老，平复皱纹，焕发肌肤青春活力\r\n干细胞技术：有效防止肌肤老化，维持肌肤滋润健康状态；\r\n填补皮肤纹理技术：硅凝胶及专利功能性粉体(韩国专利号:10-2008-0119458中国专利号: 200910142035.8)', '', '&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;淡化岁月痕迹，再生干细胞、重现年轻态&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;&lt;br/&gt;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;更新肌肤、抵抗衰老，平复皱纹，焕发肌肤青春活力&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;&lt;br/&gt;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;干细胞技术：有效防止肌肤老化，维持肌肤滋润健康状态；&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;&lt;br/&gt;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;填补皮肤纹理技术：硅凝胶及专利功能性粉体(韩国专利号:10-2008-0119458中国专利号: 200910142035.8)，有效的掩盖皱纹，呈现细嫩年轻的皮肤；&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;&lt;br/&gt;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;防止老化：干细胞营养，具有出众的防止肌肤老化效果，维持肌肤滋润健康状态；&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;&lt;br/&gt;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;软玉粉：安抚肌肤，重现肌肤健康生机。&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;&lt;br/&gt;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;使用方法：涂抹基础化妆品或防晒产品之后，取适量BB霜轻轻拍打并均匀的涂抹于脸部。&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', '', '', 1477138256, '', 'ch'),
(220, 138, 4, 'pc,wap', 'view,commend,new,hot', 0, 1, '', '/Template/default/Public/img/c1.jpg', '', '', '安抚肌肤，重现肌肤健康生机', '', '', '淡化岁月痕迹，再生干细胞、重现年轻态\r\n更新肌肤、抵抗衰老，平复皱纹，焕发肌肤青春活力\r\n干细胞技术：有效防止肌肤老化，维持肌肤滋润健康状态；', '', '&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;淡化岁月痕迹，再生干细胞、重现年轻态&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;&lt;br/&gt;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;更新肌肤、抵抗衰老，平复皱纹，焕发肌肤青春活力&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;&lt;br/&gt;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;干细胞技术：有效防止肌肤老化，维持肌肤滋润健康状态；&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;&lt;br/&gt;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;填补皮肤纹理技术：硅凝胶及专利功能性粉体(韩国专利号:10-2008-0119458中国专利号: 200910142035.8)，有效的掩盖皱纹，呈现细嫩年轻的皮肤；&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;&lt;br/&gt;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;防止老化：干细胞营养，具有出众的防止肌肤老化效果，维持肌肤滋润健康状态；&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;&lt;br/&gt;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;软玉粉：安抚肌肤，重现肌肤健康生机。&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;&lt;br/&gt;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;使用方法：涂抹基础化妆品或防晒产品之后，取适量BB霜轻轻拍打并均匀的涂抹于脸部。&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', '', '', 1477138197, '', 'ch'),
(222, 138, 4, 'pc,wap', 'view,commend,new,hot', 0, 1, '', '/Template/default/Public/img/c1.jpg', '', '', '安抚肌肤，重现肌肤健康生机', '', '', '淡化岁月痕迹，再生干细胞、重现年轻态\r\n更新肌肤、抵抗衰老，平复皱纹，焕发肌肤青春活力\r\n干细胞技术：有效防止肌肤老化，维持肌肤滋润健康状态；', '', '&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;淡化岁月痕迹，再生干细胞、重现年轻态&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;&lt;br/&gt;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;更新肌肤、抵抗衰老，平复皱纹，焕发肌肤青春活力&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;&lt;br/&gt;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;干细胞技术：有效防止肌肤老化，维持肌肤滋润健康状态；&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;&lt;br/&gt;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;填补皮肤纹理技术：硅凝胶及专利功能性粉体(韩国专利号:10-2008-0119458中国专利号: 200910142035.8)，有效的掩盖皱纹，呈现细嫩年轻的皮肤；&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;&lt;br/&gt;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;防止老化：干细胞营养，具有出众的防止肌肤老化效果，维持肌肤滋润健康状态；&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;&lt;br/&gt;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;软玉粉：安抚肌肤，重现肌肤健康生机。&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;&lt;br/&gt;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;使用方法：涂抹基础化妆品或防晒产品之后，取适量BB霜轻轻拍打并均匀的涂抹于脸部。&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', '', '', 1477138330, '', 'ch'),
(223, 138, 4, 'pc,wap', 'view,commend,new,hot', 0, 2, '', '/Template/default/Public/img/c1.jpg', '', '', '有效防止肌肤老化，维持肌肤滋润健康状态', '', '', '淡化岁月痕迹，再生干细胞、重现年轻态\r\n更新肌肤、抵抗衰老，平复皱纹，焕发肌肤青春活力\r\n干细胞技术：有效防止肌肤老化，维持肌肤滋润健康状态；\r\n填补皮肤纹理技术：硅凝胶及专利功能性粉体(韩国专利号:10-2008-0119458中国专利号: 200910142035.8)', '', '&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;淡化岁月痕迹，再生干细胞、重现年轻态&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;&lt;br/&gt;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;更新肌肤、抵抗衰老，平复皱纹，焕发肌肤青春活力&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;&lt;br/&gt;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;干细胞技术：有效防止肌肤老化，维持肌肤滋润健康状态；&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;&lt;br/&gt;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;填补皮肤纹理技术：硅凝胶及专利功能性粉体(韩国专利号:10-2008-0119458中国专利号: 200910142035.8)，有效的掩盖皱纹，呈现细嫩年轻的皮肤；&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;&lt;br/&gt;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;防止老化：干细胞营养，具有出众的防止肌肤老化效果，维持肌肤滋润健康状态；&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;&lt;br/&gt;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;软玉粉：安抚肌肤，重现肌肤健康生机。&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;&lt;br/&gt;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;使用方法：涂抹基础化妆品或防晒产品之后，取适量BB霜轻轻拍打并均匀的涂抹于脸部。&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', '', '', 1477138359, '', 'ch'),
(224, 138, 4, 'pc,wap', 'view,commend,new,hot', 0, 1, '', '/Template/default/Public/img/c1.jpg', '', '', '安抚肌肤，重现肌肤健康生机', '', '', '淡化岁月痕迹，再生干细胞、重现年轻态\r\n更新肌肤、抵抗衰老，平复皱纹，焕发肌肤青春活力\r\n干细胞技术：有效防止肌肤老化，维持肌肤滋润健康状态；', '', '&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;淡化岁月痕迹，再生干细胞、重现年轻态&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;&lt;br/&gt;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;更新肌肤、抵抗衰老，平复皱纹，焕发肌肤青春活力&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;&lt;br/&gt;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;干细胞技术：有效防止肌肤老化，维持肌肤滋润健康状态；&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;&lt;br/&gt;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;填补皮肤纹理技术：硅凝胶及专利功能性粉体(韩国专利号:10-2008-0119458中国专利号: 200910142035.8)，有效的掩盖皱纹，呈现细嫩年轻的皮肤；&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;&lt;br/&gt;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;防止老化：干细胞营养，具有出众的防止肌肤老化效果，维持肌肤滋润健康状态；&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;&lt;br/&gt;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;软玉粉：安抚肌肤，重现肌肤健康生机。&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;&lt;br/&gt;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;使用方法：涂抹基础化妆品或防晒产品之后，取适量BB霜轻轻拍打并均匀的涂抹于脸部。&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', '', '', 1477138387, '', 'ch'),
(225, 138, 4, 'pc,wap', 'view,commend,new,hot', 0, 25, '', '/Template/default/Public/img/c1.jpg', '', '', '有效防止肌肤老化，维持肌肤滋润健康状态', '', '', '淡化岁月痕迹，再生干细胞、重现年轻态\r\n更新肌肤、抵抗衰老，平复皱纹，焕发肌肤青春活力\r\n干细胞技术：有效防止肌肤老化，维持肌肤滋润健康状态；\r\n填补皮肤纹理技术：硅凝胶及专利功能性粉体(韩国专利号:10-2008-0119458中国专利号: 200910142035.8)', '', '&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;淡化岁月痕迹，再生干细胞、重现年轻态&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;&lt;br/&gt;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;更新肌肤、抵抗衰老，平复皱纹，焕发肌肤青春活力&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;&lt;br/&gt;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;干细胞技术：有效防止肌肤老化，维持肌肤滋润健康状态；&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;&lt;br/&gt;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;填补皮肤纹理技术：硅凝胶及专利功能性粉体(韩国专利号:10-2008-0119458中国专利号: 200910142035.8)，有效的掩盖皱纹，呈现细嫩年轻的皮肤；&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;&lt;br/&gt;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;防止老化：干细胞营养，具有出众的防止肌肤老化效果，维持肌肤滋润健康状态；&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;&lt;br/&gt;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;软玉粉：安抚肌肤，重现肌肤健康生机。&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;&lt;br/&gt;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;使用方法：涂抹基础化妆品或防晒产品之后，取适量BB霜轻轻拍打并均匀的涂抹于脸部。&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', '', '', 1477138431, '', 'ch'),
(226, 172, 10, 'pc,wap', 'view,commend,new,hot', 0, 1, '', '/Template/default/Public/img/c1.jpg', '', '', 'Effectively prevent skin aging, keep skin moist and healthy.', '', '', 'Fade traces of the years, the regeneration of stem cells, reproduce the young state\r\nUpdate the skin, resist aging, remove wrinkles, keep skin youthful vitality\r\nStem cell technology: effectively prevent skin aging, maintain the healthy state of skin moisture;\r\nTo fill the skin texture technology: silicone gel and patent functional powder (South Korean Patent No.: 10-2008-0119458 China Patent No.: 200910142035.8)', '', '&lt;p&gt;Fade traces of the years, the regeneration of stem cells, reproduce the young state&lt;/p&gt;&lt;p&gt;Update the skin, resist aging, remove wrinkles, keep skin youthful vitality&lt;/p&gt;&lt;p&gt;Stem cell technology: effectively prevent skin aging, maintain the healthy state of skin moisture;&lt;/p&gt;&lt;p&gt;Fill the skin texture: silica gel and functional powder (patent number: 10-2008-0119458 Chinese Korean patent patent number: 200910142035.8), effectively masking wrinkles, showing delicate young skin;&lt;/p&gt;&lt;p&gt;Prevent aging: stem cell nutrition, with superior to prevent the aging of the skin effect, to maintain the healthy state of skin moisture;&lt;/p&gt;&lt;p&gt;Nephrite powder: soothe skin, skin health vitality.&lt;/p&gt;&lt;p&gt;Usage: after applying the basic cosmetics or sunscreen products, take the right amount of BB cream gently pat and evenly applied to the face.&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', '', '', 1477242892, '', 'en'),
(227, 172, 10, 'pc,wap', 'view,commend,new,hot', 0, 1, '', '/Template/default/Public/img/c1.jpg', '', '', 'Soothe the skin, reproduce the skin health and vitality', '', '', 'Fade traces of the years, the regeneration of stem cells, reproduce the young state\r\nUpdate the skin, resist aging, remove wrinkles, keep skin youthful vitality\r\nStem cell technology: effectively prevent skin aging, maintain the healthy state of skin moisture;', '', '&lt;p&gt;Fade traces of the years, the regeneration of stem cells, reproduce the young state&lt;/p&gt;&lt;p&gt;Update the skin, resist aging, remove wrinkles, keep skin youthful vitality&lt;/p&gt;&lt;p&gt;Stem cell technology: effectively prevent skin aging, maintain the healthy state of skin moisture;&lt;/p&gt;&lt;p&gt;Fill the skin texture: silica gel and functional powder (patent number: 10-2008-0119458 Chinese Korean patent patent number: 200910142035.8), effectively masking wrinkles, showing delicate young skin;&lt;/p&gt;&lt;p&gt;Prevent aging: stem cell nutrition, with superior to prevent the aging of the skin effect, to maintain the healthy state of skin moisture;&lt;/p&gt;&lt;p&gt;Nephrite powder: soothe skin, skin health vitality.&lt;/p&gt;&lt;p&gt;Usage: after applying the basic cosmetics or sunscreen products, take the right amount of BB cream gently pat and evenly applied to the face.&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', '', '', 1477243026, NULL, 'en'),
(228, 168, 10, 'pc,wap', 'view,commend,new,hot', 0, 1, '', '/Template/default/Public/img/c1.jpg', '', '', 'Effectively prevent skin aging, keep skin moist and healthy.', '', '', 'Fade traces of the years, the regeneration of stem cells, reproduce the young state\r\nUpdate the skin, resist aging, remove wrinkles, keep skin youthful vitality\r\nStem cell technology: effectively prevent skin aging, maintain the healthy state of skin moisture;\r\nTo fill the skin texture technology: silicone gel and patent functional powder (South Korean Patent No.: 10-2008-0119458 China Patent No.: 200910142035.8)', '', '&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;Fade traces of the years, the regeneration of stem cells, reproduce the young state&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;Update the skin, resist aging, remove wrinkles, keep skin youthful vitality&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;Stem cell technology: effectively prevent skin aging, maintain the healthy state of skin moisture;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;Fill the skin texture: silica gel and functional powder (patent number: 10-2008-0119458 Chinese Korean patent patent number: 200910142035.8), effectively masking wrinkles, showing delicate young skin;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;Prevent aging: stem cell nutrition, with superior to prevent the aging of the skin effect, to maintain the healthy state of skin moisture;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;Nephrite powder: soothe skin, skin health vitality.&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;Usage: after applying the basic cosmetics or sunscreen products, take the right amount of BB cream gently pat and evenly applied to the face.&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', '', '', 1477243076, NULL, 'en'),
(229, 168, 10, 'pc,wap', 'view,commend,new,hot', 0, 1, '', '/Template/default/Public/img/c1.jpg', '', '', 'Soothe the skin, reproduce the skin health and vitality', '', '', 'Fade traces of the years, the regeneration of stem cells, reproduce the young state\r\nUpdate the skin, resist aging, remove wrinkles, keep skin youthful vitality\r\nStem cell technology: effectively prevent skin aging, maintain the healthy state of skin moisture;', '', '&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;Fade traces of the years, the regeneration of stem cells, reproduce the young state&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;Update the skin, resist aging, remove wrinkles, keep skin youthful vitality&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;Stem cell technology: effectively prevent skin aging, maintain the healthy state of skin moisture;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;Fill the skin texture: silica gel and functional powder (patent number: 10-2008-0119458 Chinese Korean patent patent number: 200910142035.8), effectively masking wrinkles, showing delicate young skin;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;Prevent aging: stem cell nutrition, with superior to prevent the aging of the skin effect, to maintain the healthy state of skin moisture;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;Nephrite powder: soothe skin, skin health vitality.&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;Usage: after applying the basic cosmetics or sunscreen products, take the right amount of BB cream gently pat and evenly applied to the face.&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', '', '', 1477243108, NULL, 'en'),
(230, 169, 10, 'pc,wap', 'view,commend,new,hot', 0, 1, '', '/Template/default/Public/img/c1.jpg', '', '', 'Effectively prevent skin aging, keep skin moist and healthy.', '', '', 'Fade traces of the years, the regeneration of stem cells, reproduce the young state\r\nUpdate the skin, resist aging, remove wrinkles, keep skin youthful vitality\r\nStem cell technology: effectively prevent skin aging, maintain the healthy state of skin moisture;\r\nTo fill the skin texture technology: silicone gel and patent functional powder (South Korean Patent No.: 10-2008-0119458 China Patent No.: 200910142035.8)', '', '&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;Fade traces of the years, the regeneration of stem cells, reproduce the young state&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;Update the skin, resist aging, remove wrinkles, keep skin youthful vitality&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;Stem cell technology: effectively prevent skin aging, maintain the healthy state of skin moisture;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;Fill the skin texture: silica gel and functional powder (patent number: 10-2008-0119458 Chinese Korean patent patent number: 200910142035.8), effectively masking wrinkles, showing delicate young skin;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;Prevent aging: stem cell nutrition, with superior to prevent the aging of the skin effect, to maintain the healthy state of skin moisture;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;Nephrite powder: soothe skin, skin health vitality.&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;Usage: after applying the basic cosmetics or sunscreen products, take the right amount of BB cream gently pat and evenly applied to the face.&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', '', '', 1477243147, NULL, 'en'),
(231, 169, 10, 'pc,wap', 'view,commend,new,hot', 0, 1, '', '/Template/default/Public/img/c1.jpg', '', '', 'Soothe the skin, reproduce the skin health and vitality', '', '', 'Fade traces of the years, the regeneration of stem cells, reproduce the young state\r\nUpdate the skin, resist aging, remove wrinkles, keep skin youthful vitality\r\nStem cell technology: effectively prevent skin aging, maintain the healthy state of skin moisture;', '', '&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;Fade traces of the years, the regeneration of stem cells, reproduce the young state&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;Update the skin, resist aging, remove wrinkles, keep skin youthful vitality&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;Stem cell technology: effectively prevent skin aging, maintain the healthy state of skin moisture;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;Fill the skin texture: silica gel and functional powder (patent number: 10-2008-0119458 Chinese Korean patent patent number: 200910142035.8), effectively masking wrinkles, showing delicate young skin;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;Prevent aging: stem cell nutrition, with superior to prevent the aging of the skin effect, to maintain the healthy state of skin moisture;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;Nephrite powder: soothe skin, skin health vitality.&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;Usage: after applying the basic cosmetics or sunscreen products, take the right amount of BB cream gently pat and evenly applied to the face.&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', '', '', 1477243192, NULL, 'en'),
(232, 170, 10, 'pc,wap', 'view,commend,new,hot', 0, 1, '', '/Template/default/Public/img/c1.jpg', '', '', 'Effectively prevent skin aging, keep skin moist and healthy.', '', '', 'Fade traces of the years, the regeneration of stem cells, reproduce the young state\r\nUpdate the skin, resist aging, remove wrinkles, keep skin youthful vitality\r\nStem cell technology: effectively prevent skin aging, maintain the healthy state of skin moisture;\r\nTo fill the skin texture technology: silicone gel and patent functional powder (South Korean Patent No.: 10-2008-0119458 China Patent No.: 200910142035.8)', '', '&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;Fade traces of the years, the regeneration of stem cells, reproduce the young state&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;Update the skin, resist aging, remove wrinkles, keep skin youthful vitality&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;Stem cell technology: effectively prevent skin aging, maintain the healthy state of skin moisture;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;Fill the skin texture: silica gel and functional powder (patent number: 10-2008-0119458 Chinese Korean patent patent number: 200910142035.8), effectively masking wrinkles, showing delicate young skin;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;Prevent aging: stem cell nutrition, with superior to prevent the aging of the skin effect, to maintain the healthy state of skin moisture;&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;Nephrite powder: soothe skin, skin health vitality.&lt;/p&gt;&lt;p style=&quot;font-size: 13.3333px; white-space: normal;&quot;&gt;Usage: after applying the basic cosmetics or sunscreen products, take the right amount of BB cream gently pat and evenly applied to the face.&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', '', '', 1477243226, NULL, 'en');

-- --------------------------------------------------------

--
-- 表的结构 `bmkj_sort`
--

CREATE TABLE IF NOT EXISTS `bmkj_sort` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `parentid` int(10) DEFAULT NULL COMMENT '父分类ID',
  `moduleid` smallint(6) DEFAULT NULL COMMENT '模块ID',
  `sequence` int(10) DEFAULT '0',
  `title` varchar(100) DEFAULT NULL COMMENT '分类标题',
  `seotitle` varchar(255) DEFAULT NULL,
  `keyword` varchar(255) DEFAULT NULL COMMENT '分类关键词',
  `description` varchar(500) DEFAULT NULL COMMENT '分类描述',
  `thumb` varchar(255) DEFAULT NULL,
  `urlroute` varchar(100) DEFAULT NULL,
  `lan` char(30) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=173 ;

--
-- 转存表中的数据 `bmkj_sort`
--

INSERT INTO `bmkj_sort` (`id`, `parentid`, `moduleid`, `sequence`, `title`, `seotitle`, `keyword`, `description`, `thumb`, `urlroute`, `lan`) VALUES
(76, 0, 6, 0, '网站留言', '', '', '', '', NULL, 'ch'),
(137, 0, 4, 0, '关于我们', '', '', '', '', '', 'ch'),
(138, 0, 5, 100, '一级分类A', '', '', '', '', '', 'ch'),
(139, 0, 5, 90, '一级分类B', '', '', '', '', '', 'ch'),
(140, 0, 5, 80, '一级分类C', '', '', '', '', '', 'ch'),
(141, 138, 5, 0, '二级分类', '', '', '', '', '', 'ch'),
(142, 141, 5, 0, '三级分类B', '', '', '', '', '', 'ch'),
(143, 141, 5, 0, '三级分类A', '', '', '', '', '', 'ch'),
(166, 165, 3, 0, 'Category CCC', '', '', '', '', NULL, 'en'),
(167, 0, 4, 0, 'About us', '', '', '', '', NULL, 'en'),
(168, 0, 5, 100, 'Category A', '', '', '', '', NULL, 'en'),
(169, 0, 5, 90, 'Category B', '', '', '', '', NULL, 'en'),
(170, 0, 5, 80, 'Category C', '', '', '', '', NULL, 'en'),
(171, 170, 5, 100, 'Category CC', '', '', '', '', NULL, 'en'),
(172, 171, 5, 100, 'Category CCC', '', '', '', '', NULL, 'en'),
(133, 132, 3, 0, '二级分类', '', '', '', '', '', 'ch'),
(134, 133, 3, 0, '三级分类B', '', '', '', '', '', 'ch'),
(135, 133, 3, 0, '三级分类A', '', '', '', '', '', 'ch'),
(136, 0, 3, 0, '一级分类A', '', '', '', '', '', 'ch'),
(123, 0, 2, 100, '公司新闻', '', '', '', '', '', 'ch'),
(124, 0, 2, 90, '行业动态', '', '', '', '', '', 'ch'),
(125, 0, 2, 80, '常见问题', '', '', '', '', '', 'ch'),
(126, 0, 2, 70, '一级分类', '', '', '', '', '', 'ch'),
(127, 126, 2, 0, '二级分类B', '', '', '', '', '', 'ch'),
(128, 126, 2, 0, '二级分类A', '', '', '', '', '', 'ch'),
(129, 128, 2, 0, '三级分类1', '', '', '', '', '', 'ch'),
(130, 128, 2, 0, '三级分类2', '', '', '', '', '', 'ch'),
(131, 128, 2, 0, '三级分类3', '', '', '', '', '', 'ch'),
(132, 0, 3, 0, '一级分类B', '', '', '', '', '', 'ch'),
(92, 0, 6, 0, 'Default Sort', '', '', '', '', NULL, 'en'),
(144, 0, 1, 100, 'Category A', '', '', '', '', '', 'en'),
(145, 0, 1, 90, 'Category B', '', '', '', '', '', 'en'),
(146, 0, 1, 80, 'Category C', '', '', '', '', NULL, 'en'),
(147, 0, 1, 70, 'Category D', '', '', '', '', NULL, 'en'),
(148, 0, 1, 60, 'Category E', '', '', '', '', NULL, 'en'),
(149, 144, 1, 100, 'Category AA', '', '', '', '', NULL, 'en'),
(150, 149, 1, 100, 'Category AAA', '', '', '', '', NULL, 'en'),
(151, 149, 1, 90, 'Category BBB', '', '', '', '', NULL, 'en'),
(152, 144, 1, 90, 'Category BB', '', '', '', '', NULL, 'en'),
(153, 0, 2, 100, 'Company news', '', '', '', '', NULL, 'en'),
(154, 0, 2, 90, 'Industry news', '', '', '', '', NULL, 'en'),
(155, 0, 2, 80, 'FAQ', '', '', '', '', NULL, 'en'),
(156, 0, 2, 70, 'Category A', '', '', '', '', NULL, 'en'),
(157, 156, 2, 100, 'Category AA', '', '', '', '', NULL, 'en'),
(158, 157, 2, 100, 'Category AAA', '', '', '', '', NULL, 'en'),
(159, 156, 2, 90, 'Category BB', '', '', '', '', NULL, 'en'),
(160, 157, 2, 90, 'Category BBB', '', '', '', '', NULL, 'en'),
(161, 157, 2, 80, 'Category CCC', '', '', '', '', NULL, 'en'),
(162, 0, 3, 100, 'Category A', '', '', '', '', NULL, 'en'),
(163, 0, 3, 90, 'Category B', '', '', '', '', NULL, 'en'),
(164, 0, 3, 80, 'Category C', '', '', '', '', NULL, 'en'),
(165, 164, 3, 100, 'Category CC', '', '', '', '', NULL, 'en'),
(111, 0, 1, 100, '一级分类A', '', '', '', '', '', 'ch'),
(112, 0, 1, 90, '一级分类B', '', '', '', '', '', 'ch'),
(113, 0, 1, 80, '一级分类C', '', '', '', '', '', 'ch'),
(114, 0, 1, 70, '一级分类D', '', '', '', '', '', 'ch'),
(115, 0, 1, 60, '一级分类E', '', '', '', '', '', 'ch'),
(116, 111, 1, 0, '二级分类A', '', '', '', '', '', 'ch'),
(117, 112, 1, 0, '二级分类B', '', '', '', '', '', 'ch'),
(118, 113, 1, 0, '二级分类C', '', '', '', '', '', 'ch'),
(119, 116, 1, 0, '三级分类A', '', '', '', '', '', 'ch'),
(121, 117, 1, 0, '三级分类C', '', '', '', '', '', 'ch'),
(122, 111, 1, 0, '二级分类AA', '', '', '', '', '', 'ch');

-- --------------------------------------------------------

--
-- 表的结构 `bmkj_user`
--

CREATE TABLE IF NOT EXISTS `bmkj_user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `identifier` varchar(100) DEFAULT NULL,
  `departmentid` int(10) DEFAULT NULL,
  `username` varchar(30) DEFAULT NULL,
  `password` varchar(32) DEFAULT NULL,
  `realname` varchar(20) DEFAULT NULL,
  `status` int(10) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `gender` tinyint(1) unsigned DEFAULT '1',
  `idnumber` varchar(50) DEFAULT NULL,
  `nation` varchar(20) DEFAULT NULL,
  `nativeplace` varchar(20) DEFAULT NULL,
  `areaid` int(10) DEFAULT NULL,
  `address` varchar(500) DEFAULT NULL,
  `mobile` varchar(20) DEFAULT NULL,
  `telephone` varchar(20) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `wechat` varchar(50) DEFAULT NULL,
  `qq` varchar(20) DEFAULT NULL,
  `account` varchar(50) DEFAULT NULL,
  `bank` varchar(50) DEFAULT NULL,
  `major` varchar(50) DEFAULT NULL,
  `education` varchar(20) DEFAULT NULL,
  `school` varchar(50) DEFAULT NULL,
  `entry` date DEFAULT NULL,
  `departure` date DEFAULT NULL,
  `note` text,
  `avatar` varchar(500) DEFAULT NULL,
  `authgroupid` int(10) DEFAULT NULL,
  `morefileurl` text,
  `sequence` int(10) DEFAULT NULL,
  `addtime` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- 转存表中的数据 `bmkj_user`
--

INSERT INTO `bmkj_user` (`id`, `identifier`, `departmentid`, `username`, `password`, `realname`, `status`, `birthday`, `gender`, `idnumber`, `nation`, `nativeplace`, `areaid`, `address`, `mobile`, `telephone`, `email`, `wechat`, `qq`, `account`, `bank`, `major`, `education`, `school`, `entry`, `departure`, `note`, `avatar`, `authgroupid`, `morefileurl`, `sequence`, `addtime`) VALUES
(1, '', 1, 'admin', 'f6fdffe48c908deb0f4c3bd36c032e72', '管理员', 1, '2016-08-02', 1, '', '', '', 1, '', '13000000000', '0755-xxxxxxxx', '1000000000@qq.com', '13000000000', '10000000', '', '', '', '博士后', '', '2016-08-02', '9999-12-31', '', '/Public/bootstrap/layouts/layout/img/avatar.jpg', 1, '', 100, 1438877219),
(5, NULL, NULL, 'test', '05a671c66aefea124cc08b76ea6d30bb', 'test', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, 1477375461);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
