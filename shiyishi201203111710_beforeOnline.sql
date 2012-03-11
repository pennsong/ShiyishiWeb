-- phpMyAdmin SQL Dump
-- version 3.1.2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Mar 11, 2012 at 09:09 AM
-- Server version: 5.1.42
-- PHP Version: 5.2.12

SET FOREIGN_KEY_CHECKS=0;

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";

SET AUTOCOMMIT=0;
START TRANSACTION;


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `shiyishi`
--

-- --------------------------------------------------------

--
-- Table structure for table `zp_admin`
--

DROP TABLE IF EXISTS `zp_admin`;
CREATE TABLE IF NOT EXISTS `zp_admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '管理员ID',
  `admin_number` varchar(250) DEFAULT NULL COMMENT '客服编号',
  `admin_name` varchar(100) NOT NULL COMMENT '管理员用户名',
  `admin_email` varchar(50) NOT NULL COMMENT '管理员邮箱',
  `admin_password` varchar(100) NOT NULL COMMENT '管理员密码',
  `admin_realname` varchar(100) NOT NULL COMMENT '管理员真实姓名',
  `admin_zhiwu` int(10) NOT NULL COMMENT '组ID',
  `admin_purview` text COMMENT '权限',
  `admin_citys` varchar(254) NOT NULL COMMENT '可管理的城市',
  `admin_desc` varchar(255) DEFAULT NULL COMMENT '描述',
  `admin_state` tinyint(2) NOT NULL DEFAULT '1' COMMENT '管理员状态',
  `admin_lastloginip` varchar(26) DEFAULT NULL COMMENT ' 最后一次登录的IP',
  `admin_lastlogintime` int(10) NOT NULL DEFAULT '0' COMMENT ' 最后一次登录时间',
  `admin_logintimes` int(11) NOT NULL DEFAULT '0' COMMENT ' 登陆次数',
  `admin_createtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT ' 添加管理员时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `zp_admin`
--

INSERT INTO `zp_admin` (`id`, `admin_number`, `admin_name`, `admin_email`, `admin_password`, `admin_realname`, `admin_zhiwu`, `admin_purview`, `admin_citys`, `admin_desc`, `admin_state`, `admin_lastloginip`, `admin_lastlogintime`, `admin_logintimes`, `admin_createtime`) VALUES
(1, 'A001', 'admin', 'admin@shiyishi.cn', 'e9205cefc6d71c930b20a5af7463e697', 'Admin', 1, NULL, 'a:5:{i:0;s:1:"1";i:1;s:1:"2";i:2;s:1:"3";i:3;s:1:"4";i:4;s:1:"6";}', '总管理员', 1, NULL, 1331266107, 0, '2010-03-20 11:28:57');

-- --------------------------------------------------------

--
-- Table structure for table `zp_admin_duty`
--

DROP TABLE IF EXISTS `zp_admin_duty`;
CREATE TABLE IF NOT EXISTS `zp_admin_duty` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `duty_name` varchar(50) NOT NULL,
  `duty_link` varchar(50) NOT NULL,
  `parent_id` smallint(6) unsigned NOT NULL DEFAULT '1',
  `order_id` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `purview` text,
  PRIMARY KEY (`id`),
  KEY `parent` (`parent_id`),
  KEY `orderid` (`order_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `zp_admin_duty`
--

INSERT INTO `zp_admin_duty` (`id`, `duty_name`, `duty_link`, `parent_id`, `order_id`, `purview`) VALUES
(1, '管理员', 'administrator', 0, 1, 'a:3:{s:10:"admin_menu";a:3:{i:0;s:8:"add,edit";i:1;s:6:"remove";i:2;s:5:"order";}s:11:"admin_clear";a:1:{i:0;s:5:"clear";}s:11:"admin_admin";a:4:{i:0;s:8:"add,edit";i:1;s:5:"index";i:2;s:6:"remove";i:3;s:5:"watch";}}'),
(2, '客服', 'kf', 0, 5, 'a:22:{s:11:"admin_order";a:5:{i:0;s:4:"list";i:1;s:10:"addgetstat";i:2;s:4:"edit";i:3;s:4:"view";i:4;s:6:"remove";}s:14:"admin_telorder";a:5:{i:0;s:4:"list";i:1;s:7:"addshow";i:2;s:9:"addticket";i:3;s:6:"donepw";i:4;s:4:"last";}s:10:"admin_show";a:1:{i:0;s:4:"list";}s:10:"admin_user";a:1:{i:0;s:4:"list";}s:18:"admin_user_account";a:1:{i:0;s:4:"list";}s:16:"admin_user_point";a:1:{i:0;s:4:"list";}s:18:"admin_user_giftlog";a:1:{i:0;s:4:"list";}s:14:"admin_user_rec";a:1:{i:0;s:4:"list";}s:11:"admin_gifts";a:1:{i:0;s:4:"list";}s:14:"admin_gift_cat";a:1:{i:0;s:4:"list";}s:17:"admin_giftgetlogs";a:1:{i:0;s:4:"list";}s:10:"admin_news";a:1:{i:0;s:4:"list";}s:14:"admin_news_cat";a:1:{i:0;s:4:"list";}s:9:"admin_faq";a:1:{i:0;s:4:"list";}s:13:"admin_faq_cat";a:1:{i:0;s:4:"list";}s:16:"admin_chargecard";a:1:{i:0;s:4:"list";}s:14:"admin_giftcard";a:1:{i:0;s:4:"list";}s:16:"admin_membercard";a:1:{i:0;s:4:"list";}s:13:"admin_paytype";a:1:{i:0;s:4:"list";}s:19:"admin_delivery_type";a:1:{i:0;s:4:"list";}s:19:"admin_delivery_area";a:1:{i:0;s:4:"list";}s:18:"admin_delivery_man";a:1:{i:0;s:4:"list";}}'),
(3, '出票员', 'cpy', 0, 3, 'a:1:{s:11:"admin_order";a:4:{i:0;s:4:"list";i:1;s:10:"addprobill";i:2;s:10:"addgetstat";i:3;s:4:"view";}}'),
(6, '编辑', 'editer', 0, 4, 'a:27:{s:9:"admin_hdp";a:4:{i:0;s:4:"list";i:1;s:3:"add";i:2;s:4:"edit";i:3;s:6:"remove";}s:10:"admin_hdpx";a:4:{i:0;s:4:"list";i:1;s:3:"add";i:2;s:4:"edit";i:3;s:6:"remove";}s:10:"admin_bytj";a:2:{i:0;s:4:"list";i:1;s:5:"check";}s:10:"admin_rmxl";a:4:{i:0;s:4:"list";i:1;s:3:"add";i:2;s:4:"edit";i:3;s:6:"remove";}s:10:"admin_rmyg";a:2:{i:0;s:4:"list";i:1;s:5:"check";}s:10:"admin_tjhd";a:4:{i:0;s:4:"list";i:1;s:3:"add";i:2;s:4:"edit";i:3;s:6:"remove";}s:10:"admin_rmyc";a:2:{i:0;s:4:"list";i:1;s:5:"check";}s:10:"admin_tjcg";a:2:{i:0;s:4:"list";i:1;s:5:"check";}s:10:"admin_show";a:5:{i:0;s:4:"list";i:1;s:3:"add";i:2;s:4:"edit";i:3;s:5:"check";i:4;s:6:"remove";}s:14:"admin_category";a:5:{i:0;s:4:"list";i:1;s:5:"order";i:2;s:3:"add";i:3;s:4:"edit";i:4;s:6:"remove";}s:11:"admin_venue";a:5:{i:0;s:4:"list";i:1;s:3:"add";i:2;s:4:"edit";i:3;s:5:"check";i:4;s:6:"remove";}s:12:"admin_series";a:5:{i:0;s:4:"list";i:1;s:3:"add";i:2;s:4:"edit";i:3;s:5:"order";i:4;s:6:"remove";}s:13:"admin_circuit";a:5:{i:0;s:4:"list";i:1;s:3:"add";i:2;s:4:"edit";i:3;s:5:"order";i:4;s:6:"remove";}s:11:"admin_gifts";a:5:{i:0;s:4:"list";i:1;s:3:"add";i:2;s:4:"edit";i:3;s:5:"check";i:4;s:6:"remove";}s:14:"admin_gift_cat";a:5:{i:0;s:4:"list";i:1;s:5:"order";i:2;s:3:"add";i:3;s:4:"edit";i:4;s:6:"remove";}s:10:"admin_news";a:4:{i:0;s:4:"list";i:1;s:3:"add";i:2;s:4:"edit";i:3;s:6:"remove";}s:14:"admin_news_cat";a:5:{i:0;s:4:"list";i:1;s:5:"order";i:2;s:3:"add";i:3;s:4:"edit";i:4;s:6:"remove";}s:9:"admin_faq";a:4:{i:0;s:4:"list";i:1;s:3:"add";i:2;s:4:"edit";i:3;s:6:"remove";}s:13:"admin_faq_cat";a:5:{i:0;s:4:"list";i:1;s:5:"order";i:2;s:3:"add";i:3;s:4:"edit";i:4;s:6:"remove";}s:9:"admin_ads";a:6:{i:0;s:4:"list";i:1;s:6:"search";i:2;s:3:"add";i:3;s:4:"edit";i:4;s:4:"view";i:5;s:6:"remove";}s:17:"admin_friendlinks";a:5:{i:0;s:4:"list";i:1;s:3:"add";i:2;s:4:"edit";i:3;s:5:"order";i:4;s:6:"remove";}s:11:"admin_pages";a:4:{i:0;s:4:"list";i:1;s:3:"add";i:2;s:4:"edit";i:3;s:6:"remove";}s:10:"admin_area";a:5:{i:0;s:4:"list";i:1;s:5:"order";i:2;s:3:"add";i:3;s:4:"edit";i:4;s:6:"remove";}s:13:"admin_paytype";a:4:{i:0;s:4:"list";i:1;s:3:"add";i:2;s:4:"edit";i:3;s:6:"remove";}s:19:"admin_delivery_type";a:4:{i:0;s:4:"list";i:1;s:3:"add";i:2;s:4:"edit";i:3;s:6:"remove";}s:19:"admin_delivery_area";a:4:{i:0;s:4:"list";i:1;s:3:"add";i:2;s:4:"edit";i:3;s:6:"remove";}s:18:"admin_delivery_man";a:4:{i:0;s:4:"list";i:1;s:3:"add";i:2;s:4:"edit";i:3;s:6:"remove";}}'),
(7, '财务', 'caiwu', 0, 2, 'a:1:{s:11:"admin_order";a:3:{i:0;s:4:"list";i:1;s:10:"addgetstat";i:2;s:4:"view";}}');

-- --------------------------------------------------------

--
-- Table structure for table `zp_admin_log`
--

DROP TABLE IF EXISTS `zp_admin_log`;
CREATE TABLE IF NOT EXISTS `zp_admin_log` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `adminid` int(11) NOT NULL DEFAULT '0',
  `adminname` varchar(50) NOT NULL,
  `action` varchar(50) NOT NULL,
  `model` varchar(50) NOT NULL,
  `dothing` varchar(255) NOT NULL,
  `logurl` varchar(254) NOT NULL,
  `onlineip` varchar(50) NOT NULL,
  `createtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `model` (`model`),
  KEY `action` (`action`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=502 ;

--
-- Dumping data for table `zp_admin_log`
--

INSERT INTO `zp_admin_log` (`id`, `adminid`, `adminname`, `action`, `model`, `dothing`, `logurl`, `onlineip`, `createtime`) VALUES
(1, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '127.0.0.1', '2011-02-22 11:50:59'),
(2, 1, 'admin【管理员】', 'logout', 'index', 'admin【管理员】在 #TIME# 退出系统', 'http://admin.shiyishi.cn/logout.do', '127.0.0.1', '2011-02-22 12:13:21'),
(3, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/login/login.do', '127.0.0.1', '2011-02-22 12:13:29'),
(4, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '61.135.152.194', '2011-02-22 14:36:26'),
(5, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '61.135.152.194', '2011-02-22 14:45:52'),
(6, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '61.135.152.194', '2011-02-22 14:45:53'),
(7, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '61.135.152.194', '2011-02-22 14:45:55'),
(8, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '61.135.152.194', '2011-02-22 14:52:22'),
(9, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '61.135.152.194', '2011-03-10 16:15:27'),
(10, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '61.135.152.194', '2011-03-23 15:35:41'),
(11, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '61.135.152.194', '2011-03-28 16:50:40'),
(12, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '61.135.152.194', '2011-03-29 17:18:00'),
(13, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '61.135.152.194', '2011-03-30 15:00:41'),
(14, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '61.135.152.194', '2011-03-31 19:18:53'),
(15, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '123.103.6.29', '2011-04-01 01:17:16'),
(16, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '61.135.152.194', '2011-04-01 11:10:00'),
(17, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/login/login.do', '61.135.152.194', '2011-04-01 14:46:15'),
(18, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '123.103.6.29', '2011-04-05 08:49:38'),
(19, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/login/login.do', '123.103.6.29', '2011-04-05 23:31:28'),
(20, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/login/login.do', '123.103.6.29', '2011-04-06 22:33:13'),
(21, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '123.103.6.11', '2011-04-08 23:11:01'),
(22, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.channelwin.info/index/login.do', '61.135.152.194', '2011-04-12 17:35:29'),
(23, 1, 'admin【管理员】', 'logout', 'index', 'admin【管理员】在 #TIME# 退出系统', 'http://admin.channelwin.info/logout.do', '61.135.152.194', '2011-04-12 17:36:31'),
(24, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.channelwin.info/index/login.do', '222.128.177.33', '2011-04-12 17:53:32'),
(25, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.channelwin.info/index/login.do', '61.135.152.194', '2011-04-12 18:27:16'),
(26, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.channelwin.info/index/login.do', '117.79.83.161', '2011-04-12 22:57:54'),
(27, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.channelwin.info/index/login.do', '117.79.232.153', '2011-04-12 23:31:13'),
(28, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.channelwin.info/login/login.do', '117.79.83.161', '2011-04-12 23:56:45'),
(29, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.channelwin.info/index/login.do', '114.249.223.233', '2011-04-13 09:48:29'),
(30, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.channelwin.info/index/login.do', '61.135.152.194', '2011-04-13 10:32:00'),
(31, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.channelwin.info/login/login.do', '61.135.152.194', '2011-04-13 15:08:57'),
(32, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.channelwin.info/index/login.do', '114.249.223.233', '2011-04-13 17:15:50'),
(33, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.channelwin.info/login/login.do', '61.135.152.194', '2011-04-13 17:58:06'),
(34, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.channelwin.info/index/login.do', '61.135.152.194', '2011-04-13 18:03:36'),
(35, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.channelwin.info/login/login.do', '114.249.223.233', '2011-04-14 10:15:53'),
(36, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.channelwin.info/index/login.do', '61.135.152.194', '2011-04-14 11:54:01'),
(37, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.channelwin.info/login/login.do', '61.135.152.194', '2011-04-14 14:24:08'),
(38, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.channelwin.info/index/login.do', '114.249.223.233', '2011-04-14 15:57:25'),
(39, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.channelwin.info/index/login.do', '114.249.223.233', '2011-04-14 17:07:50'),
(40, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.channelwin.info/index/login.do', '117.79.83.185', '2011-04-18 01:54:46'),
(41, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.channelwin.info/login/login.do', '61.135.152.194', '2011-04-18 11:34:42'),
(42, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.channelwin.info/index/login.do', '222.128.179.159', '2011-04-18 11:36:07'),
(43, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.channelwin.info/index/login.do', '222.128.179.159', '2011-04-18 11:36:27'),
(44, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.channelwin.info/login/login.do', '222.128.179.159', '2011-04-18 11:36:45'),
(45, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.channelwin.info/index/login.do', '114.249.215.254', '2011-04-19 10:05:40'),
(46, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.channelwin.info/index/login.do', '61.135.152.194', '2011-04-19 10:44:29'),
(47, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.channelwin.info/login/login.do', '61.135.152.194', '2011-04-19 11:05:49'),
(48, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.channelwin.info/index/login.do', '114.249.215.254', '2011-04-19 11:58:03'),
(49, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.channelwin.info/index/login.do', '117.79.83.178', '2011-04-20 01:19:58'),
(50, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.channelwin.info/index/login.do', '117.79.83.178', '2011-04-22 00:05:37'),
(51, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.channelwin.info/login/login.do', '117.79.83.178', '2011-04-22 01:09:52'),
(52, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.channelwin.info/index/login.do', '117.79.83.178', '2011-04-24 22:36:19'),
(53, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.channelwin.info/login/login.do', '117.79.83.178', '2011-04-25 00:30:04'),
(54, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.channelwin.info/index/login.do', '114.249.234.8', '2011-04-25 10:14:27'),
(55, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.channelwin.info/index/login.do', '61.135.152.194', '2011-04-25 14:45:13'),
(56, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.channelwin.info/index/login.do', '61.135.152.194', '2011-04-26 10:53:20'),
(57, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.channelwin.info/index/login.do', '119.57.31.105', '2011-04-26 11:28:51'),
(58, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.channelwin.info/index/login.do', '119.57.31.105', '2011-04-26 11:28:57'),
(59, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.channelwin.info/index/login.do', '119.57.31.105', '2011-04-26 11:30:56'),
(60, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.channelwin.info/index/login.do', '114.249.236.239', '2011-04-26 13:19:13'),
(61, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.channelwin.info/login/login.do', '61.135.152.194', '2011-04-26 13:24:51'),
(62, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.channelwin.info/index/login.do', '61.135.152.194', '2011-04-26 13:30:14'),
(63, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.channelwin.info/index/login.do', '114.249.236.239', '2011-04-26 13:33:50'),
(64, 1, 'admin【管理员】', 'logout', 'index', 'admin【管理员】在 #TIME# 退出系统', 'http://admin.channelwin.info/logout.do', '61.135.152.194', '2011-04-26 13:34:24'),
(65, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.channelwin.info/index/login.do', '119.57.31.105', '2011-04-26 13:37:41'),
(66, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.channelwin.info/index/login.do', '114.249.236.239', '2011-04-26 15:30:00'),
(67, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.channelwin.info/index/login.do', '61.135.152.194', '2011-04-26 15:36:16'),
(68, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.channelwin.info/login/login.do', '114.249.236.239', '2011-04-26 15:37:23'),
(69, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.channelwin.info/index/login.do', '114.249.236.239', '2011-04-26 17:40:47'),
(70, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.channelwin.info/index/login.do', '114.249.216.31', '2011-04-26 20:53:55'),
(71, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.channelwin.info/index/login.do', '117.79.83.161', '2011-04-26 21:30:34'),
(72, 1, 'admin【管理员】', 'logout', 'index', 'admin【管理员】在 #TIME# 退出系统', 'http://admin.channelwin.info/logout.do', '114.249.216.31', '2011-04-26 22:30:22'),
(73, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.channelwin.info/index/login.do', '114.249.212.135', '2011-04-26 22:35:58'),
(74, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.channelwin.info/login/login.do', '117.79.83.161', '2011-04-26 23:27:10'),
(75, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.channelwin.info/index/login.do', '119.57.31.105', '2011-04-30 13:27:04'),
(76, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.channelwin.info/login/login.do', '119.57.31.105', '2011-04-30 15:54:54'),
(77, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.channelwin.info/index/login.do', '114.249.222.234', '2011-05-01 13:49:39'),
(78, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.channelwin.info/login/login.do', '114.249.222.234', '2011-05-01 15:43:17'),
(79, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.channelwin.info/index/login.do', '114.249.217.223', '2011-05-03 00:52:52'),
(80, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.channelwin.info/index/login.do', '61.135.152.194', '2011-05-05 16:56:24'),
(81, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.channelwin.info/index/login.do', '117.79.83.182', '2011-05-06 22:59:58'),
(82, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.channelwin.info/login/login.do', '117.79.83.182', '2011-05-07 01:03:26'),
(83, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.channelwin.info/index/login.do', '114.249.210.33', '2011-05-07 15:55:01'),
(84, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.channelwin.info/index/login.do', '125.39.134.37', '2011-05-07 21:47:05'),
(85, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.channelwin.info/login/login.do', '114.249.210.33', '2011-05-07 22:01:41'),
(86, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.channelwin.info/index/login.do', '114.241.82.188', '2011-05-08 09:57:31'),
(87, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.channelwin.info/login/login.do', '114.241.82.188', '2011-05-08 12:46:07'),
(88, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.channelwin.info/login/login.do', '119.57.31.105', '2011-05-08 13:51:56'),
(89, 1, 'admin【管理员】', 'logout', 'index', 'admin【管理员】在 #TIME# 退出系统', 'http://admin.channelwin.info/logout.do', '114.241.82.188', '2011-05-08 13:52:24'),
(90, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.channelwin.info/login/login.do', '114.241.82.188', '2011-05-08 13:52:31'),
(91, 1, 'admin【管理员】', 'logout', 'index', 'admin【管理员】在 #TIME# 退出系统', 'http://admin.channelwin.info/logout.do', '119.57.31.105', '2011-05-08 13:59:37'),
(92, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.channelwin.info/login/login.do', '119.57.31.105', '2011-05-08 13:59:42'),
(93, 1, 'admin【管理员】', 'logout', 'index', 'admin【管理员】在 #TIME# 退出系统', 'http://admin.channelwin.info/logout.do', '114.241.82.188', '2011-05-08 14:19:03'),
(94, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.channelwin.info/login/login.do', '119.57.31.105', '2011-05-08 14:51:01'),
(95, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.channelwin.info/index/login.do', '61.135.152.194', '2011-05-10 14:58:31'),
(96, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.channelwin.info/index/login.do', '61.135.152.194', '2011-05-11 14:31:10'),
(97, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.channelwin.info/index/login.do', '61.135.152.194', '2011-05-12 17:34:01'),
(98, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.channelwin.info/index/login.do', '61.135.152.194', '2011-05-12 17:34:01'),
(99, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.channelwin.info/index/login.do', '114.249.223.94', '2011-05-13 23:09:38'),
(100, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.channelwin.info/login/login.do', '114.249.223.94', '2011-05-13 23:39:31'),
(101, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.channelwin.info/index/login.do', '125.39.134.51', '2011-05-13 23:57:54'),
(102, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.channelwin.info/login/login.do', '114.249.223.94', '2011-05-14 00:33:49'),
(103, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.channelwin.info/index/login.do', '121.18.126.176', '2011-05-14 00:41:09'),
(104, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.channelwin.info/index/login.do', '114.249.233.5', '2011-05-15 11:47:26'),
(105, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.channelwin.info/index/login.do', '125.39.134.51', '2011-05-15 20:31:58'),
(106, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.channelwin.info/index/login.do', '61.135.152.203', '2011-05-16 14:24:16'),
(107, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.channelwin.info/index/login.do', '61.135.152.203', '2011-05-16 14:24:16'),
(108, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.channelwin.info/index/login.do', '61.135.152.203', '2011-05-16 14:25:07'),
(109, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.channelwin.info/index/login.do', '58.246.139.98', '2011-05-16 15:04:13'),
(110, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.channelwin.info/index/login.do', '58.246.139.98', '2011-05-16 15:29:02'),
(111, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.channelwin.info/index/login.do', '58.246.139.98', '2011-05-16 15:37:14'),
(112, 1, 'admin【管理员】', 'logout', 'index', 'admin【管理员】在 #TIME# 退出系统', 'http://admin.channelwin.info/logout.do', '58.246.139.98', '2011-05-16 15:39:14'),
(113, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.channelwin.info/index/login.do', '61.135.152.203', '2011-05-16 15:54:25'),
(114, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.channelwin.info/index/login.do', '114.249.232.228', '2011-05-16 16:01:13'),
(115, 1, 'admin【管理员】', 'logout', 'index', 'admin【管理员】在 #TIME# 退出系统', 'http://admin.channelwin.info/logout.do', '114.249.232.228', '2011-05-16 16:12:48'),
(116, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.channelwin.info/login/login.do', '114.249.232.228', '2011-05-16 16:12:50'),
(117, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.channelwin.info/index/login.do', '58.246.139.98', '2011-05-16 16:42:26'),
(118, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.channelwin.info/index/login.do', '58.246.139.98', '2011-05-16 16:53:48'),
(119, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '114.249.232.228', '2011-05-16 17:24:47'),
(120, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '114.249.217.230', '2011-05-16 22:16:50'),
(121, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '125.39.134.42', '2011-05-16 23:00:04'),
(122, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/login/login.do', '114.249.217.230', '2011-05-16 23:32:14'),
(123, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/login/login.do', '114.249.217.230', '2011-05-16 23:32:23'),
(124, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '61.135.152.203', '2011-05-17 13:57:09'),
(125, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '61.135.152.203', '2011-05-17 14:20:32'),
(126, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '221.221.149.11', '2011-05-17 22:40:54'),
(127, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '222.128.173.130', '2011-05-18 10:15:31'),
(128, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '222.128.173.130', '2011-05-18 11:57:15'),
(129, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/login/login.do', '114.249.208.79', '2011-05-18 12:12:08'),
(130, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '61.135.152.203', '2011-05-18 12:49:15'),
(131, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/login/login.do', '61.135.152.203', '2011-05-18 12:52:32'),
(132, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '114.249.208.79', '2011-05-18 14:12:24'),
(133, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '114.249.216.55', '2011-05-18 16:59:53'),
(134, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '61.135.152.203', '2011-05-18 17:41:46'),
(135, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '61.135.152.203', '2011-05-18 18:00:22'),
(136, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/login/login.do', '61.135.152.203', '2011-05-18 18:07:03'),
(137, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '58.246.139.98', '2011-05-19 14:50:17'),
(138, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '58.246.139.98', '2011-05-19 14:57:32'),
(139, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '61.135.152.203', '2011-05-19 15:32:07'),
(140, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/login/login.do', '61.135.152.203', '2011-05-19 16:30:00'),
(141, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/login/login.do', '61.135.152.203', '2011-05-19 17:03:38'),
(142, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/login/login.do', '61.135.152.203', '2011-05-20 10:53:15'),
(143, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '114.249.214.209', '2011-05-20 12:18:37'),
(144, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/login/login.do', '114.249.214.209', '2011-05-20 12:24:58'),
(145, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '114.249.214.209', '2011-05-20 13:54:55'),
(146, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/login/login.do', '61.135.152.203', '2011-05-20 14:17:19'),
(147, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '114.249.231.125', '2011-05-21 13:08:47'),
(148, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '114.249.231.125', '2011-05-21 13:13:37'),
(149, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '114.249.232.64', '2011-05-21 21:50:56'),
(150, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '125.39.134.62', '2011-05-21 23:28:02'),
(151, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '125.69.28.208', '2011-05-22 00:02:49'),
(152, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '125.39.134.62', '2011-05-22 00:14:37'),
(153, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/login/login.do', '119.57.31.104', '2011-05-22 14:14:56'),
(154, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '119.57.31.104', '2011-05-26 13:16:55'),
(155, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '119.57.31.104', '2011-05-26 13:16:59'),
(156, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '119.57.31.104', '2011-05-26 13:26:07'),
(157, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '114.249.227.80', '2011-05-26 15:22:25'),
(158, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '119.57.31.104', '2011-05-26 15:40:38'),
(159, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '118.112.248.103', '2011-05-26 16:19:19'),
(160, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '114.249.238.51', '2011-05-26 23:06:55'),
(161, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/login/login.do', '118.112.248.103', '2011-05-26 23:28:57'),
(162, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '61.135.152.203', '2011-05-31 14:28:34'),
(163, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '61.135.152.203', '2011-05-31 16:46:23'),
(164, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '125.39.34.2', '2011-06-05 22:22:42'),
(165, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '125.39.34.2', '2011-06-06 08:56:30'),
(166, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/login/login.do', '125.39.34.2', '2011-06-06 10:19:56'),
(167, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '125.39.34.2', '2011-06-06 10:52:03'),
(168, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '114.249.210.147', '2011-06-06 22:46:48'),
(169, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '61.135.152.203', '2011-06-07 10:23:12'),
(170, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '1.202.198.123', '2011-06-07 10:23:22'),
(171, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/login/login.do', '61.135.152.203', '2011-06-07 10:24:03'),
(172, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '61.135.152.203', '2011-06-07 10:35:06'),
(173, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '119.57.31.104', '2011-06-07 11:10:32'),
(174, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/login/login.do', '1.202.198.123', '2011-06-07 11:10:50'),
(175, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '125.39.34.2', '2011-06-08 22:31:05'),
(176, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/login/login.do', '222.128.179.225', '2011-06-08 22:31:08'),
(177, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '1.202.198.123', '2011-06-09 10:03:21'),
(178, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '61.135.152.203', '2011-06-09 10:07:44'),
(179, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '1.202.198.123', '2011-06-13 11:38:33'),
(180, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/login/login.do', '1.202.198.123', '2011-06-13 15:06:10'),
(181, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '119.57.31.104', '2011-06-14 19:24:10'),
(182, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/login/login.do', '114.249.220.179', '2011-06-14 23:51:51'),
(183, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '61.135.152.203', '2011-06-15 15:57:34'),
(184, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '1.202.198.123', '2011-06-15 16:55:46'),
(185, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/login/login.do', '1.202.198.123', '2011-06-17 09:34:54'),
(186, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '61.135.152.203', '2011-06-17 10:56:42'),
(187, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/login/login.do', '1.202.198.123', '2011-06-17 14:09:25'),
(188, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '222.128.175.213', '2011-06-17 23:31:30'),
(189, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '117.79.73.67', '2011-06-18 11:28:35'),
(190, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/login/login.do', '114.249.233.174', '2011-06-18 13:16:39'),
(191, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '114.249.233.174', '2011-06-19 00:52:16'),
(192, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/login/login.do', '119.57.31.104', '2011-06-19 14:39:32'),
(193, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/login/login.do', '119.57.31.104', '2011-06-19 15:37:07'),
(194, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/login/login.do', '1.202.198.123', '2011-06-20 10:02:37'),
(195, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '61.135.152.203', '2011-06-20 10:18:48'),
(196, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/login/login.do', '1.202.198.123', '2011-06-20 10:22:20'),
(197, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/login/login.do', '1.202.198.123', '2011-06-20 14:51:36'),
(198, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '119.57.31.104', '2011-06-21 11:11:14'),
(199, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '119.57.31.104', '2011-06-22 17:24:07'),
(200, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '58.246.139.98', '2011-06-24 16:23:18'),
(201, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '125.39.132.73', '2011-06-27 22:22:17'),
(202, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/login/login.do', '125.39.132.73', '2011-06-27 22:44:34'),
(203, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/login/login.do', '1.202.198.123', '2011-06-28 09:33:54'),
(204, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '1.202.198.123', '2011-06-28 18:17:24'),
(205, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '125.39.132.73', '2011-06-28 22:39:52'),
(206, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '1.202.198.123', '2011-07-01 14:15:11'),
(207, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/login/login.do', '1.202.198.123', '2011-07-01 14:27:18'),
(208, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '124.200.241.148', '2011-07-01 21:57:02'),
(209, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/login/login.do', '124.200.241.148', '2011-07-01 22:07:43'),
(210, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '222.128.183.138', '2011-07-01 22:28:08'),
(211, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/login/login.do', '114.249.235.107', '2011-07-02 14:14:04'),
(212, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/login/login.do', '114.249.235.107', '2011-07-02 14:32:26'),
(213, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '124.200.53.152', '2011-07-02 15:08:19'),
(214, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/login/login.do', '114.249.235.107', '2011-07-02 15:40:09'),
(215, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/login/login.do', '114.249.235.107', '2011-07-02 19:06:47'),
(216, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/login/login.do', '114.249.235.107', '2011-07-02 19:07:24'),
(217, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/login/login.do', '114.249.235.107', '2011-07-02 19:10:35'),
(218, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/login/login.do', '124.200.53.152', '2011-07-02 19:25:46'),
(219, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/login/login.do', '124.200.53.152', '2011-07-02 20:42:58'),
(220, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/login/login.do', '114.249.235.107', '2011-07-02 22:07:31'),
(221, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/login/login.do', '114.249.235.107', '2011-07-02 22:08:01'),
(222, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '124.200.53.152', '2011-07-02 22:14:54'),
(223, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '124.200.241.148', '2011-07-02 22:38:19'),
(224, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '114.245.191.57', '2011-07-03 17:29:06'),
(225, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '114.245.191.57', '2011-07-03 19:34:55'),
(226, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '1.202.198.123', '2011-07-04 10:22:18'),
(227, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '1.202.198.123', '2011-07-05 18:34:23'),
(228, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '124.200.53.152', '2011-07-05 23:33:25'),
(229, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '114.247.42.60', '2011-07-07 13:59:09'),
(230, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '61.135.152.203', '2011-07-07 15:01:54'),
(231, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/login/login.do', '61.135.152.203', '2011-07-07 16:19:23'),
(232, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '114.247.42.60', '2011-07-07 17:09:14'),
(233, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/login/login.do', '114.247.42.60', '2011-07-07 17:14:05'),
(234, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '61.135.152.203', '2011-07-07 17:18:43'),
(235, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/login/login.do', '114.247.42.60', '2011-07-07 17:50:41'),
(236, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/login/login.do', '114.247.42.60', '2011-07-07 17:59:02'),
(237, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '61.135.152.203', '2011-07-07 18:02:51'),
(238, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/login/login.do', '114.247.42.60', '2011-07-08 10:42:37'),
(239, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/login/login.do', '61.135.152.203', '2011-07-08 11:46:19'),
(240, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '119.57.31.110', '2011-07-08 12:02:51'),
(241, 1, 'admin【管理员】', 'logout', 'index', 'admin【管理员】在 #TIME# 退出系统', 'http://admin.shiyishi.cn/logout.do', '119.57.31.110', '2011-07-08 12:04:06'),
(242, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '119.57.31.110', '2011-07-08 12:07:20'),
(243, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '61.135.152.203', '2011-07-08 13:48:27'),
(244, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '114.247.42.60', '2011-07-11 14:32:42'),
(245, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/login/login.do', '114.247.42.60', '2011-07-11 16:49:49'),
(246, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '119.57.31.110', '2011-07-13 13:09:49'),
(247, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '119.57.31.110', '2011-07-13 14:34:17'),
(248, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '119.57.31.110', '2011-07-13 19:41:37'),
(249, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '222.128.181.226', '2011-07-14 12:17:40'),
(250, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '114.249.222.60', '2011-07-17 18:50:33'),
(251, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '124.200.52.154', '2011-07-17 19:26:30'),
(252, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/login/login.do', '114.249.222.60', '2011-07-17 22:09:16'),
(253, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '114.249.229.119', '2011-07-19 00:18:10'),
(254, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '119.57.31.110', '2011-07-20 12:01:42'),
(255, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/login/login.do', '119.57.31.110', '2011-07-23 14:05:18'),
(256, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '124.200.52.157', '2011-07-25 13:39:30'),
(257, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '114.247.42.60', '2011-07-25 15:15:02'),
(258, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '119.57.31.110', '2011-07-27 11:47:46'),
(259, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '119.57.31.110', '2011-07-27 14:37:23'),
(260, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '114.247.42.60', '2011-07-27 15:06:08'),
(261, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/login/login.do', '114.247.42.60', '2011-07-27 15:12:02'),
(262, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '119.57.31.110', '2011-07-27 15:23:27'),
(263, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '119.57.31.110', '2011-07-27 15:37:06'),
(264, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '61.135.152.203', '2011-07-27 15:53:08'),
(265, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '202.106.169.240', '2011-07-29 10:27:19'),
(266, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '202.106.169.240', '2011-07-29 10:44:32'),
(267, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '114.241.145.104', '2011-07-30 17:18:18'),
(268, 1, 'admin【管理员】', 'logout', 'index', 'admin【管理员】在 #TIME# 退出系统', 'http://admin.shiyishi.cn/logout.do', '114.241.145.104', '2011-07-30 17:21:29'),
(269, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '114.247.42.60', '2011-08-01 14:14:56'),
(270, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '127.0.0.1', '2011-08-04 11:41:13'),
(271, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/login/login.do', '61.135.152.203', '2011-08-04 11:46:57'),
(272, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/login/login.do', '61.135.152.203', '2011-08-04 11:47:08'),
(273, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/login/login.do', '61.135.152.203', '2011-08-04 13:12:24'),
(274, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/login/login.do', '127.0.0.1', '2011-08-04 13:21:42');
INSERT INTO `zp_admin_log` (`id`, `adminid`, `adminname`, `action`, `model`, `dothing`, `logurl`, `onlineip`, `createtime`) VALUES
(275, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/login/login.do', '61.135.152.203', '2011-08-04 15:09:56'),
(276, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '114.247.42.60', '2011-08-04 16:10:35'),
(277, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '119.57.31.110', '2011-08-09 13:19:52'),
(278, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '114.247.42.60', '2011-08-09 13:43:14'),
(279, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/login/login.do', '114.247.42.60', '2011-08-09 15:43:37'),
(280, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/login/login.do', '114.247.42.60', '2011-08-09 16:05:34'),
(281, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '119.57.31.110', '2011-08-09 16:22:15'),
(282, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '119.57.31.110', '2011-08-09 16:33:13'),
(283, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/login/login.do', '114.247.42.60', '2011-08-09 16:41:29'),
(284, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '119.57.31.110', '2011-08-09 17:55:33'),
(285, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '119.57.31.110', '2011-08-09 18:04:01'),
(286, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '114.247.42.60', '2011-08-09 18:24:24'),
(287, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '119.57.31.110', '2011-08-09 18:57:59'),
(288, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/login/login.do', '114.247.42.60', '2011-08-10 10:16:03'),
(289, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '114.247.42.60', '2011-08-10 13:59:52'),
(290, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '114.252.89.135', '2011-08-10 15:04:06'),
(291, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/login/login.do', '114.247.42.60', '2011-08-10 15:04:58'),
(292, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '119.57.31.110', '2011-08-10 15:08:44'),
(293, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '119.57.31.110', '2011-08-12 14:02:41'),
(294, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '119.57.31.110', '2011-08-12 14:22:53'),
(295, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '114.247.42.60', '2011-08-15 13:50:02'),
(296, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '114.247.42.60', '2011-08-16 14:05:26'),
(297, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '222.128.174.17', '2011-08-16 23:55:55'),
(298, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '114.247.42.60', '2011-08-17 09:33:47'),
(299, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '114.247.42.60', '2011-08-17 11:22:42'),
(300, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/login/login.do', '114.247.42.60', '2011-08-17 16:19:33'),
(301, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/login/login.do', '114.247.42.60', '2011-08-17 17:58:42'),
(302, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '114.249.239.4', '2011-08-17 20:09:56'),
(303, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '114.249.223.32', '2011-08-17 23:03:43'),
(304, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '114.247.42.60', '2011-08-18 09:37:23'),
(305, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/login/login.do', '114.247.42.60', '2011-08-18 11:15:16'),
(306, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/login/login.do', '114.247.42.60', '2011-08-18 14:16:27'),
(307, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/login/login.do', '114.247.42.60', '2011-08-18 16:57:10'),
(308, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/login/login.do', '114.247.42.60', '2011-08-18 17:58:07'),
(309, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '124.200.52.153', '2011-08-18 18:49:54'),
(310, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/login/login.do', '114.247.42.60', '2011-08-19 09:40:37'),
(311, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '114.247.42.60', '2011-08-19 14:15:53'),
(312, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '114.249.48.237', '2011-08-19 14:25:54'),
(313, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '119.57.31.110', '2011-08-19 15:33:00'),
(314, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '119.57.31.110', '2011-08-19 16:04:26'),
(315, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '119.57.31.110', '2011-08-22 10:57:10'),
(316, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '119.57.31.110', '2011-08-22 11:50:10'),
(317, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '114.247.42.60', '2011-08-22 12:11:45'),
(318, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '119.57.31.110', '2011-08-22 16:01:40'),
(319, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '119.57.31.110', '2011-08-29 10:05:00'),
(320, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '119.57.31.110', '2011-09-09 13:02:26'),
(321, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '119.57.31.110', '2011-09-09 13:44:59'),
(322, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '119.57.31.110', '2011-09-13 13:50:17'),
(323, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '119.57.31.110', '2011-09-13 14:04:32'),
(324, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '58.246.139.98', '2011-09-15 14:36:55'),
(325, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '119.57.31.110', '2011-09-15 14:42:23'),
(326, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '119.57.31.110', '2011-09-15 15:28:37'),
(327, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '119.57.31.110', '2011-09-15 16:29:16'),
(328, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '114.94.205.144', '2011-09-17 01:23:53'),
(329, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '114.94.205.144', '2011-09-18 00:28:33'),
(330, 1, 'admin【管理员】', 'logout', 'index', 'admin【管理员】在 #TIME# 退出系统', 'http://admin.shiyishi.cn/logout.do', '114.94.205.144', '2011-09-18 00:28:53'),
(331, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/login/login.do', '114.94.205.144', '2011-09-18 00:28:59'),
(332, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '58.246.139.98', '2011-09-20 14:00:33'),
(333, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '58.246.139.98', '2011-09-20 14:49:57'),
(334, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '58.246.139.98', '2011-09-20 16:25:36'),
(335, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '58.246.139.98', '2011-09-20 16:32:55'),
(336, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '119.57.31.110', '2011-09-20 16:33:21'),
(337, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '58.246.139.98', '2011-09-20 16:52:23'),
(338, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '119.57.31.110', '2011-09-21 13:45:35'),
(339, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '58.246.139.98', '2011-09-21 14:22:46'),
(340, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/login/login.do', '119.57.31.110', '2011-09-21 15:41:33'),
(341, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '58.246.139.98', '2011-09-22 10:30:24'),
(342, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/login/login.do', '58.246.139.98', '2011-09-22 14:00:26'),
(343, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '58.246.139.98', '2011-09-23 10:08:29'),
(344, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '58.246.139.98', '2011-09-26 12:58:46'),
(345, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/login/login.do', '58.246.139.98', '2011-09-26 13:02:12'),
(346, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '58.246.139.98', '2011-09-26 16:23:55'),
(347, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '58.37.109.153', '2011-10-08 16:50:05'),
(348, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '119.57.31.110', '2011-10-10 16:43:18'),
(349, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '58.246.139.98', '2011-10-10 16:52:31'),
(350, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/login/login.do', '58.246.139.98', '2011-10-10 16:59:10'),
(351, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '119.57.31.110', '2011-10-11 15:33:16'),
(352, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '58.246.139.98', '2011-10-11 18:02:47'),
(353, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '58.246.139.98', '2011-10-12 14:38:47'),
(354, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '58.246.139.98', '2011-10-12 19:11:53'),
(355, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '58.246.139.98', '2011-10-13 17:55:34'),
(356, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '58.246.139.98', '2011-10-13 19:37:06'),
(357, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '58.246.139.98', '2011-10-18 18:14:52'),
(358, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '58.246.139.98', '2011-10-18 18:35:40'),
(359, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '58.246.139.98', '2011-10-19 16:45:12'),
(360, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '58.24.159.204', '2011-10-20 01:35:20'),
(361, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '58.37.99.55', '2011-10-20 20:21:07'),
(362, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '58.37.99.55', '2011-10-21 11:01:55'),
(363, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '119.57.31.110', '2011-10-21 11:34:27'),
(364, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '119.57.31.110', '2011-10-21 15:44:05'),
(365, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '119.57.31.110', '2011-10-21 16:39:48'),
(366, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '119.57.31.110', '2011-10-24 14:03:44'),
(367, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '58.246.139.98', '2011-10-24 15:15:57'),
(368, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '58.246.139.98', '2011-10-25 18:15:07'),
(369, 1, 'admin【管理员】', 'logout', 'index', 'admin【管理员】在 #TIME# 退出系统', 'http://admin.shiyishi.cn/logout.do', '58.246.139.98', '2011-10-25 18:17:50'),
(370, 2, 'admint01【管理员】', 'login', 'index', 'admint01【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/login/login.do', '58.246.139.98', '2011-10-25 18:17:56'),
(371, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '58.246.139.98', '2011-10-27 16:16:16'),
(372, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '218.79.164.64', '2011-10-27 23:13:20'),
(373, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '58.246.139.98', '2011-10-31 10:06:35'),
(374, 1, 'admin【管理员】', 'logout', 'index', 'admin【管理员】在 #TIME# 退出系统', 'http://admin.shiyishi.cn/logout.do', '58.246.139.98', '2011-10-31 10:07:31'),
(375, 2, 'admint01【管理员】', 'login', 'index', 'admint01【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/login/login.do', '58.246.139.98', '2011-10-31 10:07:48'),
(376, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/login/login.do', '58.246.139.98', '2011-10-31 12:54:15'),
(377, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '58.246.139.98', '2011-10-31 15:17:39'),
(378, 2, 'admint01【管理员】', 'login', 'index', 'admint01【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '58.246.139.98', '2011-10-31 16:06:17'),
(379, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '58.246.139.98', '2011-11-09 20:38:54'),
(380, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '58.246.139.98', '2011-11-10 15:06:47'),
(381, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '58.246.139.98', '2011-11-10 15:52:15'),
(382, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/login/login.do', '58.246.139.98', '2011-11-10 16:07:48'),
(383, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/login/login.do', '58.246.139.98', '2011-11-10 16:25:00'),
(384, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '58.246.139.98', '2011-11-10 16:45:24'),
(385, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '58.246.139.98', '2011-11-10 17:04:44'),
(386, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '58.246.139.98', '2011-11-11 15:06:58'),
(387, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '218.79.187.210', '2011-11-13 00:55:29'),
(388, 2, 'admint01【管理员】', 'login', 'index', 'admint01【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '111.161.64.190', '2011-11-14 13:58:34'),
(389, 2, 'admint01【管理员】', 'login', 'index', 'admint01【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/login/login.do', '111.161.64.190', '2011-11-14 14:06:44'),
(390, 2, 'admint01【管理员】', 'login', 'index', 'admint01【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/login/login.do', '111.161.64.190', '2011-11-14 14:10:29'),
(391, 2, 'admint01【管理员】', 'login', 'index', 'admint01【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '111.161.64.190', '2011-11-14 15:26:55'),
(392, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '111.161.64.190', '2011-11-15 14:00:35'),
(393, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '111.161.64.190', '2011-11-15 17:34:17'),
(394, 2, 'admint01【管理员】', 'login', 'index', 'admint01【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '111.161.64.190', '2011-11-15 17:36:02'),
(395, 2, 'admint01【管理员】', 'login', 'index', 'admint01【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '111.161.64.190', '2011-11-15 17:40:55'),
(396, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '111.161.64.190', '2011-11-16 10:51:56'),
(397, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/login/login.do', '111.161.64.190', '2011-11-16 12:05:55'),
(398, 2, 'admint01【管理员】', 'login', 'index', 'admint01【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '111.161.64.190', '2011-11-16 13:26:59'),
(399, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '111.161.64.190', '2011-11-16 14:50:54'),
(400, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/login/login.do', '111.161.64.190', '2011-11-16 15:04:48'),
(401, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '58.246.139.98', '2011-12-02 16:52:08'),
(402, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '180.155.79.181', '2011-12-03 16:32:41'),
(403, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '180.155.79.181', '2011-12-03 17:55:43'),
(404, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '180.155.79.181', '2011-12-03 18:10:58'),
(405, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '180.155.79.181', '2011-12-03 23:32:28'),
(406, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '111.161.64.190', '2011-12-05 17:58:25'),
(407, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '58.246.139.98', '2011-12-05 17:59:13'),
(408, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '58.246.139.98', '2011-12-06 14:37:06'),
(409, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '218.79.219.159', '2011-12-06 22:47:21'),
(410, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '218.79.219.159', '2011-12-07 00:11:19'),
(411, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '222.131.99.22', '2011-12-10 15:14:28'),
(412, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '111.161.64.190', '2011-12-12 10:31:01'),
(413, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '111.161.64.190', '2011-12-14 11:28:00'),
(414, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '58.246.139.98', '2011-12-14 17:23:28'),
(415, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '58.246.139.98', '2011-12-14 18:03:56'),
(416, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '58.246.139.98', '2011-12-15 11:07:39'),
(417, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '58.246.139.98', '2011-12-16 15:14:35'),
(418, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '58.246.139.98', '2011-12-16 16:23:08'),
(419, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '58.246.139.98', '2011-12-16 17:17:24'),
(420, 1, 'admin【管理员】', 'logout', 'index', 'admin【管理员】在 #TIME# 退出系统', 'http://admin.shiyishi.cn/logout.do', '58.246.139.98', '2011-12-16 17:18:07'),
(421, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '218.79.165.157', '2011-12-20 12:59:29'),
(422, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '111.161.64.190', '2011-12-20 15:05:13'),
(423, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '58.246.139.98', '2011-12-20 15:33:37'),
(424, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/login/login.do', '111.161.64.190', '2011-12-20 15:44:01'),
(425, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/login/login.do', '111.161.64.190', '2011-12-20 15:51:52'),
(426, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '111.161.64.190', '2011-12-23 14:27:31'),
(427, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '111.161.64.190', '2011-12-23 16:28:56'),
(428, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '111.161.64.190', '2011-12-26 13:36:13'),
(429, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/login/login.do', '111.161.64.190', '2011-12-26 14:19:05'),
(430, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/login/login.do', '111.161.64.190', '2011-12-26 15:05:40'),
(431, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '111.161.64.190', '2011-12-26 15:44:25'),
(432, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '111.161.64.190', '2011-12-26 17:06:39'),
(433, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '111.161.64.190', '2011-12-26 18:44:43'),
(434, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '111.161.64.190', '2011-12-26 18:57:16'),
(435, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/login/login.do', '111.161.64.190', '2011-12-26 19:09:40'),
(436, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '58.246.139.98', '2011-12-28 10:52:26'),
(437, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/login/login.do', '58.246.139.98', '2011-12-28 11:49:30'),
(438, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/login/login.do', '58.246.139.98', '2011-12-28 11:57:31'),
(439, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/login/login.do', '58.246.139.98', '2011-12-28 12:16:33'),
(440, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '58.246.139.98', '2012-01-09 14:21:30'),
(441, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '101.80.107.79', '2012-01-10 23:15:34'),
(442, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '101.80.104.191', '2012-01-31 00:15:58'),
(443, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '111.161.64.190', '2012-01-31 14:36:34'),
(444, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/login/login.do', '111.161.64.190', '2012-01-31 14:48:49'),
(445, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '58.246.139.98', '2012-01-31 15:21:47'),
(446, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/login/login.do', '111.161.64.190', '2012-01-31 15:23:55'),
(447, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '111.161.64.190', '2012-02-01 10:34:42'),
(448, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '111.161.64.190', '2012-02-01 13:19:45'),
(449, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '180.155.74.232', '2012-02-01 13:45:09'),
(450, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/login/login.do', '111.161.64.190', '2012-02-01 13:55:09'),
(451, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/login/login.do', '111.161.64.190', '2012-02-01 14:22:47'),
(452, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/login/login.do', '111.161.64.190', '2012-02-01 14:37:26'),
(453, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '58.246.139.98', '2012-02-01 14:39:43'),
(454, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '180.155.74.232', '2012-02-01 14:54:20'),
(455, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/login/login.do', '180.155.74.232', '2012-02-01 15:27:35'),
(456, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/login/login.do', '111.161.64.190', '2012-02-01 15:27:41'),
(457, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/login/login.do', '180.155.74.232', '2012-02-01 15:35:00'),
(458, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/login/login.do', '111.161.64.190', '2012-02-01 15:35:14'),
(459, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/login/login.do', '111.161.64.190', '2012-02-01 16:11:31'),
(460, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/login/login.do', '111.161.64.190', '2012-02-01 16:39:57'),
(461, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '111.161.64.190', '2012-02-01 17:12:38'),
(462, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '111.161.64.190', '2012-02-01 17:44:04'),
(463, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '111.161.64.190', '2012-02-01 18:31:10'),
(464, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '111.161.64.190', '2012-02-02 11:23:31'),
(465, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/login/login.do', '111.161.64.190', '2012-02-02 11:29:59'),
(466, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '111.161.64.190', '2012-02-02 12:49:26'),
(467, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '111.161.64.190', '2012-02-02 14:18:55'),
(468, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '111.161.64.190', '2012-02-02 14:30:35'),
(469, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '58.246.139.98', '2012-02-06 14:31:30'),
(470, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/login/login.do', '58.246.139.98', '2012-02-06 14:48:49'),
(471, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '111.161.64.190', '2012-02-06 14:49:00'),
(472, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/login/login.do', '111.161.64.190', '2012-02-06 15:00:00'),
(473, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/login/login.do', '58.246.139.98', '2012-02-06 15:08:00'),
(474, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/login/login.do', '58.246.139.98', '2012-02-06 15:48:48'),
(475, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '111.161.64.190', '2012-02-06 15:49:11'),
(476, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '58.246.139.98', '2012-02-07 15:29:24'),
(477, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '58.246.139.98', '2012-02-08 17:13:59'),
(478, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '58.246.139.98', '2012-02-15 14:31:53'),
(479, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '111.161.64.190', '2012-02-15 14:33:19'),
(480, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '58.246.139.98', '2012-02-15 14:34:43'),
(481, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '58.246.139.98', '2012-02-15 17:04:28'),
(482, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '58.246.139.98', '2012-02-27 15:36:49'),
(483, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/login/login.do', '58.246.139.98', '2012-02-27 15:38:44'),
(484, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/login/login.do', '58.246.139.98', '2012-02-27 15:46:24'),
(485, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '58.246.139.98', '2012-02-28 13:40:36'),
(486, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.localshiyishi.cn/index/login.do', '127.0.0.1', '2012-02-28 23:31:36'),
(487, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '116.236.241.90', '2012-02-29 17:23:00'),
(488, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '111.161.64.190', '2012-03-02 17:36:50'),
(489, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '111.161.64.190', '2012-03-02 17:55:51'),
(490, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '116.236.241.90', '2012-03-07 16:36:49'),
(491, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '111.161.64.190', '2012-03-08 13:45:34'),
(492, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '58.246.139.98', '2012-03-08 14:58:51'),
(493, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '111.161.64.190', '2012-03-08 16:51:18'),
(494, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '111.161.64.190', '2012-03-08 16:59:08'),
(495, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '111.161.64.190', '2012-03-08 17:02:20'),
(496, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '111.161.64.190', '2012-03-08 17:02:50'),
(497, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '111.161.64.190', '2012-03-08 17:50:17'),
(498, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '58.246.139.98', '2012-03-08 17:59:23'),
(499, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '111.161.64.190', '2012-03-08 18:02:49'),
(500, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '111.161.64.190', '2012-03-08 18:16:31'),
(501, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '111.161.64.190', '2012-03-09 12:08:27');

-- --------------------------------------------------------

--
-- Table structure for table `zp_admin_log_ext`
--

DROP TABLE IF EXISTS `zp_admin_log_ext`;
CREATE TABLE IF NOT EXISTS `zp_admin_log_ext` (
  `id` int(11) unsigned NOT NULL,
  `requestvar` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `zp_admin_log_ext`
--

INSERT INTO `zp_admin_log_ext` (`id`, `requestvar`) VALUES
(1, 'a:3:{s:8:"formhash";s:8:"bae240e0";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(2, 'a:0:{}'),
(3, 'a:3:{s:8:"formhash";s:8:"1f8e407c";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(4, 'a:3:{s:8:"formhash";s:8:"df619209";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(5, 'a:3:{s:8:"formhash";s:8:"e7fa6016";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(6, 'a:3:{s:8:"formhash";s:8:"e7fa6016";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(7, 'a:3:{s:8:"formhash";s:8:"e7fa6016";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(8, 'a:3:{s:8:"formhash";s:8:"146978e3";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(9, 'a:3:{s:8:"formhash";s:8:"8e5c6301";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(10, 'a:3:{s:8:"formhash";s:8:"9136149f";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(11, 'a:3:{s:8:"formhash";s:8:"a2bc97cd";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(12, 'a:3:{s:8:"formhash";s:8:"1c08fed6";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(13, 'a:3:{s:8:"formhash";s:8:"d4bea38b";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(14, 'a:3:{s:8:"formhash";s:8:"4532bbfc";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(15, 'a:3:{s:8:"formhash";s:8:"c8c231a1";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(16, 'a:3:{s:8:"formhash";s:8:"11962fb0";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(17, 'a:3:{s:8:"formhash";s:8:"83299c29";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(18, 'a:3:{s:8:"formhash";s:8:"86ee2ec2";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(19, 'a:3:{s:8:"formhash";s:8:"28c14f44";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(20, 'a:3:{s:8:"formhash";s:8:"51abb3a1";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(21, 'a:3:{s:8:"formhash";s:8:"95f5bd28";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(22, 'a:3:{s:8:"formhash";s:8:"e5919eef";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(23, 'a:0:{}'),
(24, 'a:3:{s:8:"formhash";s:8:"25db3239";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(25, 'a:3:{s:8:"formhash";s:8:"7171dbef";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(26, 'a:3:{s:8:"formhash";s:8:"a8436174";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(27, 'a:3:{s:8:"formhash";s:8:"41b0a88a";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(28, 'a:3:{s:8:"formhash";s:8:"bb00f2da";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(29, 'a:3:{s:8:"formhash";s:8:"b36794f6";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(30, 'a:3:{s:8:"formhash";s:8:"96ac67f7";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(31, 'a:3:{s:8:"formhash";s:8:"2fe9b1f1";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(32, 'a:3:{s:8:"formhash";s:8:"7673612a";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(33, 'a:3:{s:8:"formhash";s:8:"1f3a6703";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(34, 'a:3:{s:8:"formhash";s:8:"a747b814";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(35, 'a:3:{s:8:"formhash";s:8:"b735adad";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(36, 'a:3:{s:8:"formhash";s:8:"17d904f7";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(37, 'a:3:{s:8:"formhash";s:8:"0a8695bb";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(38, 'a:3:{s:8:"formhash";s:8:"d983e90c";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(39, 'a:3:{s:8:"formhash";s:8:"1cdd1d3b";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(40, 'a:3:{s:8:"formhash";s:8:"c53b17d1";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(41, 'a:3:{s:8:"formhash";s:8:"4a1d718b";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(42, 'a:3:{s:8:"formhash";s:8:"a51d47e1";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(43, 'a:3:{s:8:"formhash";s:8:"e1752ad7";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(44, 'a:3:{s:8:"formhash";s:8:"0c9561c4";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(45, 'a:3:{s:8:"formhash";s:8:"996145a2";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(46, 'a:3:{s:8:"formhash";s:8:"37d23fb1";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(47, 'a:3:{s:8:"formhash";s:8:"8b40cbdd";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(48, 'a:3:{s:8:"formhash";s:8:"5b05b549";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(49, 'a:3:{s:8:"formhash";s:8:"4b8c94d1";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(50, 'a:3:{s:8:"formhash";s:8:"19f21713";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(51, 'a:3:{s:8:"formhash";s:8:"12c3d968";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(52, 'a:3:{s:8:"formhash";s:8:"4d7f4e28";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(53, 'a:3:{s:8:"formhash";s:8:"45d7ca29";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(54, 'a:3:{s:8:"formhash";s:8:"0c1253a0";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(55, 'a:3:{s:8:"formhash";s:8:"7adbf7f3";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(56, 'a:3:{s:8:"formhash";s:8:"f5cc37ca";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(57, 'a:3:{s:8:"formhash";s:8:"a155a6a5";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(58, 'a:3:{s:8:"formhash";s:8:"a155a6a5";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(59, 'a:3:{s:8:"formhash";s:8:"a155a6a5";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(60, 'a:3:{s:8:"formhash";s:8:"075ff901";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(61, 'a:3:{s:8:"formhash";s:8:"ee9f834e";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(62, 'a:3:{s:8:"formhash";s:8:"02eceda1";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(63, 'a:3:{s:8:"formhash";s:8:"065d9708";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(64, 'a:0:{}'),
(65, 'a:3:{s:8:"formhash";s:8:"c468ec1f";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(66, 'a:3:{s:8:"formhash";s:8:"5ce8fc4a";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(67, 'a:3:{s:8:"formhash";s:8:"1fbd749c";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(68, 'a:3:{s:8:"formhash";s:8:"98b2bc0b";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(69, 'a:3:{s:8:"formhash";s:8:"18aa8ca9";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(70, 'a:3:{s:8:"formhash";s:8:"cad7dcae";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(71, 'a:3:{s:8:"formhash";s:8:"5399752b";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(72, 'a:0:{}'),
(73, 'a:3:{s:8:"formhash";s:8:"8889e883";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(74, 'a:3:{s:8:"formhash";s:8:"bf2bac68";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(75, 'a:3:{s:8:"formhash";s:8:"9815d5ba";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(76, 'a:3:{s:8:"formhash";s:8:"213bdb8b";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(77, 'a:3:{s:8:"formhash";s:8:"39ac3feb";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(78, 'a:3:{s:8:"formhash";s:8:"aac34855";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(79, 'a:3:{s:8:"formhash";s:8:"151fa72f";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(80, 'a:3:{s:8:"formhash";s:8:"6608a4f4";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(81, 'a:3:{s:8:"formhash";s:8:"33e3e260";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(82, 'a:3:{s:8:"formhash";s:8:"62dfbc7e";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(83, 'a:3:{s:8:"formhash";s:8:"f775d766";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(84, 'a:3:{s:8:"formhash";s:8:"ea316dec";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(85, 'a:3:{s:8:"formhash";s:8:"23f1326d";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(86, 'a:3:{s:8:"formhash";s:8:"5eb113f6";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(87, 'a:3:{s:8:"formhash";s:8:"d989c1ca";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(88, 'a:3:{s:8:"formhash";s:8:"720fea06";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(89, 'a:0:{}'),
(90, 'a:3:{s:8:"formhash";s:8:"124efd37";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(91, 'a:0:{}'),
(92, 'a:3:{s:8:"formhash";s:8:"8bd75c63";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(93, 'a:0:{}'),
(94, 'a:3:{s:8:"formhash";s:8:"bae8a00f";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(95, 'a:3:{s:8:"formhash";s:8:"dd0bc39f";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(96, 'a:3:{s:8:"formhash";s:8:"bb901a86";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(97, 'a:3:{s:8:"formhash";s:8:"123aa217";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(98, 'a:3:{s:8:"formhash";s:8:"123aa217";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(99, 'a:3:{s:8:"formhash";s:8:"f179bdbe";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(100, 'a:3:{s:8:"formhash";s:8:"c09e5a52";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(101, 'a:3:{s:8:"formhash";s:8:"e78c8f30";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(102, 'a:3:{s:8:"formhash";s:8:"bb55c60b";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(103, 'a:3:{s:8:"formhash";s:8:"37bd5719";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(104, 'a:3:{s:8:"formhash";s:8:"364ce81a";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(105, 'a:3:{s:8:"formhash";s:8:"a7abb3c1";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(106, 'a:3:{s:8:"formhash";s:8:"25f82aee";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(107, 'a:3:{s:8:"formhash";s:8:"25f82aee";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(108, 'a:3:{s:8:"formhash";s:8:"956803d1";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(109, 'a:3:{s:8:"formhash";s:8:"c3ef1d79";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(110, 'a:3:{s:8:"formhash";s:8:"6bea970e";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(111, 'a:3:{s:8:"formhash";s:8:"a2f7da89";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(112, 'a:0:{}'),
(113, 'a:3:{s:8:"formhash";s:8:"513aa849";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(114, 'a:3:{s:8:"formhash";s:8:"aaf1b916";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(115, 'a:0:{}'),
(116, 'a:3:{s:8:"formhash";s:8:"f56df249";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(117, 'a:3:{s:8:"formhash";s:8:"c6afcd35";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(118, 'a:3:{s:8:"formhash";s:8:"06855d6f";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(119, 'a:3:{s:8:"formhash";s:8:"4a2f6f01";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(120, 'a:3:{s:8:"formhash";s:8:"c23c0f99";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(121, 'a:3:{s:8:"formhash";s:8:"7209d23b";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(122, 'a:3:{s:8:"formhash";s:8:"2785db0a";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(123, 'a:3:{s:8:"formhash";s:8:"3d7182a6";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(124, 'a:3:{s:8:"formhash";s:8:"c03ac822";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(125, 'a:3:{s:8:"formhash";s:8:"7b48829c";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(126, 'a:3:{s:8:"formhash";s:8:"bb4bfc91";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(127, 'a:3:{s:8:"formhash";s:8:"695c52dd";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(128, 'a:3:{s:8:"formhash";s:8:"3cad6139";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(129, 'a:3:{s:8:"formhash";s:8:"80bc0b75";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(130, 'a:3:{s:8:"formhash";s:8:"d701c051";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(131, 'a:3:{s:8:"formhash";s:8:"cfef631f";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(132, 'a:3:{s:8:"formhash";s:8:"b589a5ed";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(133, 'a:3:{s:8:"formhash";s:8:"45c15b5d";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(134, 'a:3:{s:8:"formhash";s:8:"9e9d88c5";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(135, 'a:3:{s:8:"formhash";s:8:"87d06bae";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(136, 'a:3:{s:8:"formhash";s:8:"96def4fb";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(137, 'a:3:{s:8:"formhash";s:8:"19b03b7a";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(138, 'a:3:{s:8:"formhash";s:8:"c506b8c4";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(139, 'a:3:{s:8:"formhash";s:8:"3ef8e0f2";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(140, 'a:3:{s:8:"formhash";s:8:"e0637283";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(141, 'a:3:{s:8:"formhash";s:8:"39152509";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(142, 'a:3:{s:8:"formhash";s:8:"c98f2b6e";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(143, 'a:3:{s:8:"formhash";s:8:"a8ced338";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(144, 'a:3:{s:8:"formhash";s:8:"82725416";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(145, 'a:3:{s:8:"formhash";s:8:"592c77fa";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(146, 'a:3:{s:8:"formhash";s:8:"84b2fde9";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(147, 'a:3:{s:8:"formhash";s:8:"4d0cabdc";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(148, 'a:3:{s:8:"formhash";s:8:"4d4ad9d5";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(149, 'a:3:{s:8:"formhash";s:8:"96fadd38";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(150, 'a:3:{s:8:"formhash";s:8:"5ff6ce40";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(151, 'a:3:{s:8:"formhash";s:8:"6774c1ff";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(152, 'a:3:{s:8:"formhash";s:8:"e0891233";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(153, 'a:3:{s:8:"formhash";s:8:"94e55670";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(154, 'a:3:{s:8:"formhash";s:8:"a4a3c9c5";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(155, 'a:3:{s:8:"formhash";s:8:"a4a3c9c5";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(156, 'a:3:{s:8:"formhash";s:8:"89f99c70";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(157, 'a:3:{s:8:"formhash";s:8:"c089e42e";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(158, 'a:3:{s:8:"formhash";s:8:"2ff93ded";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(159, 'a:3:{s:8:"formhash";s:8:"c910cd4c";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(160, 'a:3:{s:8:"formhash";s:8:"107c45ee";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(161, 'a:3:{s:8:"formhash";s:8:"fe779853";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(162, 'a:3:{s:8:"formhash";s:8:"84a5a9e2";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(163, 'a:3:{s:8:"formhash";s:8:"bc707883";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(164, 'a:3:{s:8:"formhash";s:8:"f4b50c4c";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(165, 'a:3:{s:8:"formhash";s:8:"856ce79c";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(166, 'a:3:{s:8:"formhash";s:8:"c371ae8a";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(167, 'a:3:{s:8:"formhash";s:8:"255cf534";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(168, 'a:3:{s:8:"formhash";s:8:"d94aad83";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(169, 'a:3:{s:8:"formhash";s:8:"79083254";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(170, 'a:3:{s:8:"formhash";s:8:"d3e8d2fa";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(171, 'a:3:{s:8:"formhash";s:8:"9c6db1ff";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(172, 'a:3:{s:8:"formhash";s:8:"43ec0e21";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(173, 'a:3:{s:8:"formhash";s:8:"fa2696b2";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(174, 'a:3:{s:8:"formhash";s:8:"7885a98f";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(175, 'a:3:{s:8:"formhash";s:8:"6aeb4ea4";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(176, 'a:3:{s:8:"formhash";s:8:"1f980f3e";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(177, 'a:3:{s:8:"formhash";s:8:"5725ef65";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(178, 'a:3:{s:8:"formhash";s:8:"1181f82f";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(179, 'a:3:{s:8:"formhash";s:8:"78d041f8";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(180, 'a:3:{s:8:"formhash";s:8:"c3ba332f";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(181, 'a:3:{s:8:"formhash";s:8:"95b9b8e8";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(182, 'a:3:{s:8:"formhash";s:8:"798ef4d8";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(183, 'a:3:{s:8:"formhash";s:8:"8ec00a8a";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(184, 'a:3:{s:8:"formhash";s:8:"6406ad07";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(185, 'a:3:{s:8:"formhash";s:8:"ec690b8d";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(186, 'a:3:{s:8:"formhash";s:8:"fd9740ee";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(187, 'a:3:{s:8:"formhash";s:8:"876b2320";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(188, 'a:3:{s:8:"formhash";s:8:"f5d568cf";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(189, 'a:3:{s:8:"formhash";s:8:"585cdaca";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(190, 'a:3:{s:8:"formhash";s:8:"a0eb1f48";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(191, 'a:3:{s:8:"formhash";s:8:"53c2df42";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(192, 'a:3:{s:8:"formhash";s:8:"b3017826";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(193, 'a:3:{s:8:"formhash";s:8:"f0c606a4";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(194, 'a:3:{s:8:"formhash";s:8:"17b2d574";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(195, 'a:3:{s:8:"formhash";s:8:"d4cc764e";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(196, 'a:3:{s:8:"formhash";s:8:"8c068a90";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(197, 'a:3:{s:8:"formhash";s:8:"5cdbb69e";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(198, 'a:3:{s:8:"formhash";s:8:"de52dd39";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(199, 'a:3:{s:8:"formhash";s:8:"81e7dff6";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(200, 'a:3:{s:8:"formhash";s:8:"5d2daa87";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(201, 'a:3:{s:8:"formhash";s:8:"ae110d7c";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(202, 'a:3:{s:8:"formhash";s:8:"b7ba64be";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(203, 'a:3:{s:8:"formhash";s:8:"0d905b7f";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(204, 'a:3:{s:8:"formhash";s:8:"39a2e81f";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(205, 'a:3:{s:8:"formhash";s:8:"0333b213";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(206, 'a:3:{s:8:"formhash";s:8:"21c59c33";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(207, 'a:3:{s:8:"formhash";s:8:"10857995";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(208, 'a:3:{s:8:"formhash";s:8:"3ffb6ff0";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(209, 'a:3:{s:8:"formhash";s:8:"16a18a83";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(210, 'a:3:{s:8:"formhash";s:8:"7b015e0f";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(211, 'a:3:{s:8:"formhash";s:8:"f56dcaf5";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(212, 'a:3:{s:8:"formhash";s:8:"50b9c069";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(213, 'a:3:{s:8:"formhash";s:8:"053b2fde";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(214, 'a:3:{s:8:"formhash";s:8:"e8647850";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(215, 'a:3:{s:8:"formhash";s:8:"3fb33dc1";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(216, 'a:3:{s:8:"formhash";s:8:"fe4ff2dc";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(217, 'a:3:{s:8:"formhash";s:8:"6132b9d0";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(218, 'a:3:{s:8:"formhash";s:8:"9f293347";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(219, 'a:3:{s:8:"formhash";s:8:"6397bd6d";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(220, 'a:3:{s:8:"formhash";s:8:"50050891";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(221, 'a:3:{s:8:"formhash";s:8:"66fd92e8";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(222, 'a:3:{s:8:"formhash";s:8:"fdfc5dc6";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(223, 'a:3:{s:8:"formhash";s:8:"9e452977";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(224, 'a:3:{s:8:"formhash";s:8:"202a4703";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(225, 'a:3:{s:8:"formhash";s:8:"a5eb0ef3";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(226, 'a:3:{s:8:"formhash";s:8:"45de108c";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(227, 'a:3:{s:8:"formhash";s:8:"e256331b";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(228, 'a:3:{s:8:"formhash";s:8:"b902adbd";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(229, 'a:3:{s:8:"formhash";s:8:"587e03ec";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(230, 'a:3:{s:8:"formhash";s:8:"548d3dd9";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(231, 'a:3:{s:8:"formhash";s:8:"493f41a5";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(232, 'a:3:{s:8:"formhash";s:8:"6862f5cf";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(233, 'a:3:{s:8:"formhash";s:8:"e954b253";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(234, 'a:3:{s:8:"formhash";s:8:"1d777df5";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(235, 'a:3:{s:8:"formhash";s:8:"f816d436";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(236, 'a:3:{s:8:"formhash";s:8:"df55a349";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(237, 'a:3:{s:8:"formhash";s:8:"725d8528";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(238, 'a:3:{s:8:"formhash";s:8:"c9d7a847";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(239, 'a:3:{s:8:"formhash";s:8:"db4af870";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(240, 'a:3:{s:8:"formhash";s:8:"cc89c8d6";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(241, 'a:0:{}'),
(242, 'a:3:{s:8:"formhash";s:8:"40cfd5e5";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(243, 'a:3:{s:8:"formhash";s:8:"accd733d";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(244, 'a:3:{s:8:"formhash";s:8:"218db1c7";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(245, 'a:3:{s:8:"formhash";s:8:"aac9b4f8";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(246, 'a:3:{s:8:"formhash";s:8:"fcd1ec2b";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(247, 'a:3:{s:8:"formhash";s:8:"51d9dd3d";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(248, 'a:3:{s:8:"formhash";s:8:"2d29e77b";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(249, 'a:3:{s:8:"formhash";s:8:"f272ef77";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(250, 'a:3:{s:8:"formhash";s:8:"068a0f68";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(251, 'a:3:{s:8:"formhash";s:8:"ebc397a0";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(252, 'a:3:{s:8:"formhash";s:8:"6cc8db4d";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(253, 'a:3:{s:8:"formhash";s:8:"318e492d";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(254, 'a:3:{s:8:"formhash";s:8:"49078fa6";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(255, 'a:3:{s:8:"formhash";s:8:"19a8b66b";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(256, 'a:3:{s:8:"formhash";s:8:"f3e85ef7";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(257, 'a:3:{s:8:"formhash";s:8:"f8f1bab5";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(258, 'a:3:{s:8:"formhash";s:8:"830d22b1";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(259, 'a:3:{s:8:"formhash";s:8:"c6aa191b";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(260, 'a:3:{s:8:"formhash";s:8:"f62c167f";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(261, 'a:3:{s:8:"formhash";s:8:"179bf62c";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(262, 'a:3:{s:8:"formhash";s:8:"bec463f8";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(263, 'a:3:{s:8:"formhash";s:8:"bc5b25b9";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(264, 'a:3:{s:8:"formhash";s:8:"c83ecee6";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(265, 'a:3:{s:8:"formhash";s:8:"588aa202";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(266, 'a:3:{s:8:"formhash";s:8:"2bbb2129";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(267, 'a:3:{s:8:"formhash";s:8:"ec2d2dfe";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(268, 'a:0:{}'),
(269, 'a:3:{s:8:"formhash";s:8:"5f4d91e8";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(270, 'a:3:{s:8:"formhash";s:8:"8a3c541c";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(271, 'a:3:{s:8:"formhash";s:8:"c711b76f";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(272, 'a:3:{s:8:"formhash";s:8:"e5f99b6a";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(273, 'a:3:{s:8:"formhash";s:8:"3ed6f994";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(274, 'a:3:{s:8:"formhash";s:8:"d23bfa35";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(275, 'a:3:{s:8:"formhash";s:8:"30b63d66";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(276, 'a:3:{s:8:"formhash";s:8:"b3868bda";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(277, 'a:3:{s:8:"formhash";s:8:"ae90c42d";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(278, 'a:3:{s:8:"formhash";s:8:"f0ea7cda";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(279, 'a:3:{s:8:"formhash";s:8:"f1482bb7";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(280, 'a:3:{s:8:"formhash";s:8:"022973fc";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(281, 'a:3:{s:8:"formhash";s:8:"d2a78837";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(282, 'a:3:{s:8:"formhash";s:8:"5cd470e3";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(283, 'a:3:{s:8:"formhash";s:8:"5155c51e";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(284, 'a:3:{s:8:"formhash";s:8:"817462c1";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(285, 'a:3:{s:8:"formhash";s:8:"4834e1e0";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(286, 'a:3:{s:8:"formhash";s:8:"d019112c";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(287, 'a:3:{s:8:"formhash";s:8:"8a8d3ce7";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(288, 'a:3:{s:8:"formhash";s:8:"adf32909";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(289, 'a:3:{s:8:"formhash";s:8:"bf90b179";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(290, 'a:3:{s:8:"formhash";s:8:"91567c9d";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(291, 'a:3:{s:8:"formhash";s:8:"a6751c2f";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(292, 'a:3:{s:8:"formhash";s:8:"d1344650";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(293, 'a:3:{s:8:"formhash";s:8:"a8651020";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(294, 'a:3:{s:8:"formhash";s:8:"5f097535";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(295, 'a:3:{s:8:"formhash";s:8:"c354fb49";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(296, 'a:3:{s:8:"formhash";s:8:"919a914e";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(297, 'a:3:{s:8:"formhash";s:8:"a7248dea";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(298, 'a:3:{s:8:"formhash";s:8:"9b26699d";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(299, 'a:3:{s:8:"formhash";s:8:"35fe3463";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(300, 'a:3:{s:8:"formhash";s:8:"abfe4cad";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(301, 'a:3:{s:8:"formhash";s:8:"bbe773d3";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(302, 'a:3:{s:8:"formhash";s:8:"dfd8fb3c";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(303, 'a:3:{s:8:"formhash";s:8:"44450ff5";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(304, 'a:3:{s:8:"formhash";s:8:"13ba07d5";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(305, 'a:3:{s:8:"formhash";s:8:"17bcd94b";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(306, 'a:3:{s:8:"formhash";s:8:"9c1b4a65";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(307, 'a:3:{s:8:"formhash";s:8:"27a1c09c";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(308, 'a:3:{s:8:"formhash";s:8:"37b3cea7";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(309, 'a:3:{s:8:"formhash";s:8:"0fc46732";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(310, 'a:3:{s:8:"formhash";s:8:"4ca1b5b5";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(311, 'a:3:{s:8:"formhash";s:8:"3e80b796";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(312, 'a:3:{s:8:"formhash";s:8:"660632d5";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(313, 'a:3:{s:8:"formhash";s:8:"26014673";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(314, 'a:3:{s:8:"formhash";s:8:"1bc7f6be";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(315, 'a:3:{s:8:"formhash";s:8:"733e790e";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(316, 'a:3:{s:8:"formhash";s:8:"cc7e0ce7";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(317, 'a:3:{s:8:"formhash";s:8:"60f995b7";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(318, 'a:3:{s:8:"formhash";s:8:"cd94cabf";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(319, 'a:3:{s:8:"formhash";s:8:"1b984f02";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(320, 'a:3:{s:8:"formhash";s:8:"628477b9";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(321, 'a:3:{s:8:"formhash";s:8:"ab46e6e3";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(322, 'a:3:{s:8:"formhash";s:8:"82c9df9b";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(323, 'a:3:{s:8:"formhash";s:8:"eec0c43c";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(324, 'a:3:{s:8:"formhash";s:8:"fd3fe050";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(325, 'a:3:{s:8:"formhash";s:8:"87504cfd";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(326, 'a:3:{s:8:"formhash";s:8:"9304fb7c";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(327, 'a:3:{s:8:"formhash";s:8:"b9490a6d";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(328, 'a:3:{s:8:"formhash";s:8:"f8d1cbc5";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(329, 'a:3:{s:8:"formhash";s:8:"aa6345b7";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(330, 'a:0:{}'),
(331, 'a:3:{s:8:"formhash";s:8:"da2a5a8c";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(332, 'a:3:{s:8:"formhash";s:8:"daafe7c7";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(333, 'a:3:{s:8:"formhash";s:8:"ac24c435";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(334, 'a:3:{s:8:"formhash";s:8:"432facdb";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(335, 'a:3:{s:8:"formhash";s:8:"8bbc8aa5";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(336, 'a:3:{s:8:"formhash";s:8:"a343e00b";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(337, 'a:3:{s:8:"formhash";s:8:"a83589fd";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(338, 'a:3:{s:8:"formhash";s:8:"bb7dbffe";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(339, 'a:3:{s:8:"formhash";s:8:"942145a9";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(340, 'a:3:{s:8:"formhash";s:8:"07966f2c";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(341, 'a:3:{s:8:"formhash";s:8:"18b7c7b1";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(342, 'a:3:{s:8:"formhash";s:8:"432a678b";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(343, 'a:3:{s:8:"formhash";s:8:"ce4a32ae";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(344, 'a:3:{s:8:"formhash";s:8:"90bfe592";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(345, 'a:3:{s:8:"formhash";s:8:"8a9a3f5e";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(346, 'a:3:{s:8:"formhash";s:8:"3cf8185e";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(347, 'a:3:{s:8:"formhash";s:8:"5af2759a";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(348, 'a:3:{s:8:"formhash";s:8:"843c4bbe";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(349, 'a:3:{s:8:"formhash";s:8:"b8409bd5";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(350, 'a:3:{s:8:"formhash";s:8:"986b0489";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(351, 'a:3:{s:8:"formhash";s:8:"8ceba5b7";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(352, 'a:3:{s:8:"formhash";s:8:"334c5b5d";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(353, 'a:3:{s:8:"formhash";s:8:"6e569229";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(354, 'a:3:{s:8:"formhash";s:8:"e4b497d3";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(355, 'a:3:{s:8:"formhash";s:8:"311b4331";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(356, 'a:3:{s:8:"formhash";s:8:"ea8fa062";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(357, 'a:3:{s:8:"formhash";s:8:"7157b8ec";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(358, 'a:3:{s:8:"formhash";s:8:"7bec1902";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(359, 'a:3:{s:8:"formhash";s:8:"2929ba6e";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(360, 'a:3:{s:8:"formhash";s:8:"f0c6eff3";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(361, 'a:3:{s:8:"formhash";s:8:"54810fc9";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(362, 'a:3:{s:8:"formhash";s:8:"e8062bf6";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(363, 'a:3:{s:8:"formhash";s:8:"7d26842f";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(364, 'a:3:{s:8:"formhash";s:8:"ba2ed8d8";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(365, 'a:3:{s:8:"formhash";s:8:"e49b1ec4";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(366, 'a:3:{s:8:"formhash";s:8:"188c7ca9";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(367, 'a:3:{s:8:"formhash";s:8:"4cffac8b";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(368, 'a:3:{s:8:"formhash";s:8:"a9ce2c4e";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(369, 'a:0:{}'),
(370, 'a:3:{s:8:"formhash";s:8:"64f95db0";s:10:"admin_name";s:8:"admint01";s:9:"admin_pwd";s:6:"******";}'),
(371, 'a:3:{s:8:"formhash";s:8:"5de9fd96";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(372, 'a:3:{s:8:"formhash";s:8:"22666b9b";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(373, 'a:3:{s:8:"formhash";s:8:"f1bc4899";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(374, 'a:0:{}'),
(375, 'a:3:{s:8:"formhash";s:8:"268ed95f";s:10:"admin_name";s:8:"admint01";s:9:"admin_pwd";s:6:"******";}'),
(376, 'a:3:{s:8:"formhash";s:8:"02f9ad9d";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(377, 'a:3:{s:8:"formhash";s:8:"f3afe3bf";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(378, 'a:3:{s:8:"formhash";s:8:"7774753e";s:10:"admin_name";s:8:"admint01";s:9:"admin_pwd";s:6:"******";}'),
(379, 'a:3:{s:8:"formhash";s:8:"9e9d1fdb";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(380, 'a:3:{s:8:"formhash";s:8:"0545b75f";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(381, 'a:3:{s:8:"formhash";s:8:"46ebd4b8";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(382, 'a:3:{s:8:"formhash";s:8:"017f1913";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(383, 'a:3:{s:8:"formhash";s:8:"666bb7dd";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(384, 'a:3:{s:8:"formhash";s:8:"f5b15e85";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(385, 'a:3:{s:8:"formhash";s:8:"45fd6b32";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(386, 'a:3:{s:8:"formhash";s:8:"ddcea316";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(387, 'a:3:{s:8:"formhash";s:8:"735292fa";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(388, 'a:3:{s:8:"formhash";s:8:"f50f781b";s:10:"admin_name";s:8:"admint01";s:9:"admin_pwd";s:6:"******";}'),
(389, 'a:3:{s:8:"formhash";s:8:"59ea8b27";s:10:"admin_name";s:8:"admint01";s:9:"admin_pwd";s:6:"******";}'),
(390, 'a:3:{s:8:"formhash";s:8:"17bf2cb7";s:10:"admin_name";s:8:"admint01";s:9:"admin_pwd";s:6:"******";}'),
(391, 'a:3:{s:8:"formhash";s:8:"6ee143eb";s:10:"admin_name";s:8:"admint01";s:9:"admin_pwd";s:6:"******";}'),
(392, 'a:3:{s:8:"formhash";s:8:"46b8225e";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(393, 'a:3:{s:8:"formhash";s:8:"a1e25abf";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(394, 'a:3:{s:8:"formhash";s:8:"e973c698";s:10:"admin_name";s:8:"admint01";s:9:"admin_pwd";s:6:"******";}'),
(395, 'a:3:{s:8:"formhash";s:8:"17d7575a";s:10:"admin_name";s:8:"admint01";s:9:"admin_pwd";s:6:"******";}'),
(396, 'a:3:{s:8:"formhash";s:8:"9c2220cc";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(397, 'a:3:{s:8:"formhash";s:8:"3a9685f0";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(398, 'a:3:{s:8:"formhash";s:8:"483036ac";s:10:"admin_name";s:8:"admint01";s:9:"admin_pwd";s:6:"******";}'),
(399, 'a:3:{s:8:"formhash";s:8:"66593779";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(400, 'a:3:{s:8:"formhash";s:8:"1cf5518a";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(401, 'a:3:{s:8:"formhash";s:8:"44f1bd04";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(402, 'a:3:{s:8:"formhash";s:8:"17b7d1a5";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(403, 'a:3:{s:8:"formhash";s:8:"a4d3197c";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(404, 'a:3:{s:8:"formhash";s:8:"2b482c7a";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(405, 'a:3:{s:8:"formhash";s:8:"133d241e";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(406, 'a:3:{s:8:"formhash";s:8:"cd0c4246";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(407, 'a:3:{s:8:"formhash";s:8:"d66fd6e8";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(408, 'a:3:{s:8:"formhash";s:8:"e889004e";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(409, 'a:3:{s:8:"formhash";s:8:"7f6b0cad";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(410, 'a:3:{s:8:"formhash";s:8:"6a5d22c0";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(411, 'a:3:{s:8:"formhash";s:8:"9390c2ba";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(412, 'a:3:{s:8:"formhash";s:8:"f972f1ac";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(413, 'a:3:{s:8:"formhash";s:8:"5433f7f9";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(414, 'a:3:{s:8:"formhash";s:8:"ae382df7";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(415, 'a:3:{s:8:"formhash";s:8:"86458e30";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(416, 'a:3:{s:8:"formhash";s:8:"17a13080";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(417, 'a:3:{s:8:"formhash";s:8:"40a42e59";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(418, 'a:3:{s:8:"formhash";s:8:"472b2016";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(419, 'a:3:{s:8:"formhash";s:8:"b869c71b";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(420, 'a:0:{}'),
(421, 'a:3:{s:8:"formhash";s:8:"af79af87";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(422, 'a:3:{s:8:"formhash";s:8:"3338012e";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(423, 'a:3:{s:8:"formhash";s:8:"af4ef49b";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(424, 'a:3:{s:8:"formhash";s:8:"a718ec06";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(425, 'a:3:{s:8:"formhash";s:8:"efb1183d";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(426, 'a:3:{s:8:"formhash";s:8:"a124f1aa";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(427, 'a:3:{s:8:"formhash";s:8:"3c54e6cf";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(428, 'a:3:{s:8:"formhash";s:8:"2dec374d";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(429, 'a:3:{s:8:"formhash";s:8:"b105c5a4";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(430, 'a:3:{s:8:"formhash";s:8:"13645ae7";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(431, 'a:3:{s:8:"formhash";s:8:"358e49b3";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(432, 'a:3:{s:8:"formhash";s:8:"0c8b7da9";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(433, 'a:3:{s:8:"formhash";s:8:"5774360a";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(434, 'a:3:{s:8:"formhash";s:8:"7ffa0c22";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(435, 'a:3:{s:8:"formhash";s:8:"24f3257a";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(436, 'a:3:{s:8:"formhash";s:8:"8f898af5";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(437, 'a:3:{s:8:"formhash";s:8:"4746a2a4";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(438, 'a:3:{s:8:"formhash";s:8:"d9113fa2";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(439, 'a:3:{s:8:"formhash";s:8:"fc77ec39";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(440, 'a:3:{s:8:"formhash";s:8:"afaa026f";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(441, 'a:3:{s:8:"formhash";s:8:"d46d4040";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(442, 'a:3:{s:8:"formhash";s:8:"6839f6de";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(443, 'a:3:{s:8:"formhash";s:8:"2a0209c4";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(444, 'a:3:{s:8:"formhash";s:8:"18e11a6d";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(445, 'a:3:{s:8:"formhash";s:8:"b6fe4389";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(446, 'a:3:{s:8:"formhash";s:8:"b9e8466b";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(447, 'a:3:{s:8:"formhash";s:8:"e8cd1003";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(448, 'a:3:{s:8:"formhash";s:8:"10e3a77f";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(449, 'a:3:{s:8:"formhash";s:8:"244ffc97";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(450, 'a:3:{s:8:"formhash";s:8:"3fbab0e0";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(451, 'a:3:{s:8:"formhash";s:8:"cfe3d7f1";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(452, 'a:3:{s:8:"formhash";s:8:"1bc55205";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(453, 'a:3:{s:8:"formhash";s:8:"23b86216";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(454, 'a:3:{s:8:"formhash";s:8:"28491d2e";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(455, 'a:3:{s:8:"formhash";s:8:"baaddcf8";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(456, 'a:3:{s:8:"formhash";s:8:"f9c49a52";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(457, 'a:3:{s:8:"formhash";s:8:"4843a398";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(458, 'a:3:{s:8:"formhash";s:8:"8f0ada0e";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(459, 'a:3:{s:8:"formhash";s:8:"4ed9e360";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(460, 'a:3:{s:8:"formhash";s:8:"ddb296d7";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(461, 'a:3:{s:8:"formhash";s:8:"70dc4935";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(462, 'a:3:{s:8:"formhash";s:8:"43c56ed9";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(463, 'a:3:{s:8:"formhash";s:8:"47b9cc73";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(464, 'a:3:{s:8:"formhash";s:8:"4264291d";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(465, 'a:3:{s:8:"formhash";s:8:"5e83aa09";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(466, 'a:3:{s:8:"formhash";s:8:"742f51f0";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(467, 'a:3:{s:8:"formhash";s:8:"59943235";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(468, 'a:3:{s:8:"formhash";s:8:"57dd973b";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(469, 'a:3:{s:8:"formhash";s:8:"9c74de4a";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(470, 'a:3:{s:8:"formhash";s:8:"f611e905";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(471, 'a:3:{s:8:"formhash";s:8:"1d147f64";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(472, 'a:3:{s:8:"formhash";s:8:"a0cb9a44";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(473, 'a:3:{s:8:"formhash";s:8:"17524db2";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(474, 'a:3:{s:8:"formhash";s:8:"99f30d3b";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(475, 'a:3:{s:8:"formhash";s:8:"d8918525";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(476, 'a:3:{s:8:"formhash";s:8:"77e45d9c";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(477, 'a:3:{s:8:"formhash";s:8:"98433168";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(478, 'a:3:{s:8:"formhash";s:8:"5f7dd33f";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(479, 'a:3:{s:8:"formhash";s:8:"7a3c34fc";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(480, 'a:3:{s:8:"formhash";s:8:"ec4d1db8";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(481, 'a:3:{s:8:"formhash";s:8:"1ec14688";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(482, 'a:3:{s:8:"formhash";s:8:"a72a4298";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(483, 'a:3:{s:8:"formhash";s:8:"475d522d";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(484, 'a:3:{s:8:"formhash";s:8:"bfc0da3d";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(485, 'a:3:{s:8:"formhash";s:8:"d964ceb1";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(486, 'a:3:{s:8:"formhash";s:8:"ae5c36df";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(487, 'a:3:{s:8:"formhash";s:8:"43e203ac";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(488, 'a:3:{s:8:"formhash";s:8:"1120b0d2";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(489, 'a:3:{s:8:"formhash";s:8:"f4772ea0";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(490, 'a:3:{s:8:"formhash";s:8:"40a7602c";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(491, 'a:3:{s:8:"formhash";s:8:"8ee8e1c5";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(492, 'a:3:{s:8:"formhash";s:8:"9d554c5f";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(493, 'a:3:{s:8:"formhash";s:8:"80c6bcfe";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}');
INSERT INTO `zp_admin_log_ext` (`id`, `requestvar`) VALUES
(494, 'a:3:{s:8:"formhash";s:8:"f8b1bd8d";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(495, 'a:3:{s:8:"formhash";s:8:"a4fb91ea";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(496, 'a:3:{s:8:"formhash";s:8:"cbe20d72";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(497, 'a:3:{s:8:"formhash";s:8:"1c6915ac";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(498, 'a:3:{s:8:"formhash";s:8:"a95eebd0";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(499, 'a:3:{s:8:"formhash";s:8:"d456822a";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(500, 'a:3:{s:8:"formhash";s:8:"050b03f1";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(501, 'a:3:{s:8:"formhash";s:8:"2bf4f085";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}');

-- --------------------------------------------------------

--
-- Table structure for table `zp_admin_menu`
--

DROP TABLE IF EXISTS `zp_admin_menu`;
CREATE TABLE IF NOT EXISTS `zp_admin_menu` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `menu_name` varchar(50) NOT NULL,
  `menu_link` varchar(255) DEFAULT '',
  `parent_id` smallint(6) unsigned NOT NULL DEFAULT '0',
  `order_id` int(8) unsigned NOT NULL DEFAULT '0',
  `has_im` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `parent` (`parent_id`),
  KEY `orderid` (`order_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=112 ;

--
-- Dumping data for table `zp_admin_menu`
--

INSERT INTO `zp_admin_menu` (`id`, `menu_name`, `menu_link`, `parent_id`, `order_id`, `has_im`) VALUES
(1, '系统', '', 0, 7, 180),
(2, '清理缓存', '/admin/clear.do', 29, 1, 243),
(3, '操作菜单', '/admin/menu.do', 4, 2, 184),
(4, '常规操作', '', 1, 1, 181),
(5, '站点设置', '/admin/config.do', 4, 1, 182),
(6, '管理组设置', '/admin/duty.do', 9, 2, 173),
(7, '管理员列表', '/admin/admin.do', 38, 1, 161),
(9, '权限管理', '', 63, 2, 172),
(10, '管理日志', '/admin/adminlog.do', 38, 2, 166),
(11, '广告管理', '/admin/ads.do', 23, 1, 145),
(12, '专题页面', '/admin/pages.do', 4, 3, 190),
(17, '合同系统', '', 18, 2, 36),
(18, '合同', '', 0, 4, 35),
(19, '会员', '', 0, 1, 85),
(21, '扩展', '', 0, 5, 101),
(22, '工具', '', 0, 8, 241),
(23, '广告系统', '', 21, 5, 144),
(26, '职场资讯', '', 21, 3, 120),
(27, '资讯列表', '/admin/news.do', 26, 1, 121),
(28, '资讯分类', '/admin/news_cat.do', 26, 2, 126),
(29, '常用工具', '', 22, 1, 242),
(32, '帮助列表', '/admin/faq.do', 76, 1, 133),
(36, '会员管理', '', 19, 1, 86),
(37, '个人用户', '/admin/user.do', 36, 1, 87),
(38, '后台用户', '', 63, 1, 160),
(43, '邮件系统', '', 22, 4, 250),
(45, '邮件发送设置', '/admin/mailtask.do', 43, 3, 251),
(46, '邮件模板设置', '/admin/mailtemplate.do', 43, 4, 256),
(47, '邮件接口参数', '/admin/mailconfig.do', 43, 5, 261),
(51, '城市设置', '/admin/area.do', 4, 4, 195),
(59, '首页幻灯片1', '/admin/hdp.do', 61, 1, 3),
(60, '首页', '', 0, 0, 1),
(61, '首页管理', '', 60, 1, 2),
(63, '权限', '', 0, 6, 159),
(64, '简历', '', 0, 2, 50),
(65, '简历管理', '', 64, 1, 51),
(67, '行业设置', '/admin/dustrytype.do', 97, 1, 59),
(68, '求职中简历', '/admin/qzresume.do', 65, 1, 52),
(69, '免打扰简历', '/admin/mdrresume.do', 65, 2, 58),
(76, '帮助管理', '', 21, 4, 132),
(77, '帮助分类', '/admin/faq_cat.do', 76, 2, 138),
(78, '友情链接', '', 21, 6, 152),
(79, '链接管理', '/admin/friendlinks.do', 78, 1, 153),
(97, '简历设置', '', 64, 2, 0),
(98, '职位设置', '/admin/funtype.do', 97, 2, 0),
(110, '已录取简历', '/admin/ylqresume.do', 65, 3, 0),
(100, '企业用户', '/admin/e_user/list.do', 36, 50, 0),
(101, '合同管理', '/admin/contract/list.do', 17, 50, 0),
(102, '职位', '', 0, 3, 0),
(103, '职位管理', '', 102, 50, 0),
(106, '视频面试管理', '/admin/interview/list.do', 36, 50, 0),
(105, '职位管理', '/admin/jobs/list.do', 103, 50, 0),
(107, '视频简历审核', '/admin/videoresume.do', 65, 3, 0),
(109, '奖励申领管理', '/admin/user_apply.do', 36, 3, 0),
(111, '推荐企业', '/admin/relinks.do', 4, 50, 0);

-- --------------------------------------------------------

--
-- Table structure for table `zp_admit`
--

DROP TABLE IF EXISTS `zp_admit`;
CREATE TABLE IF NOT EXISTS `zp_admit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `rid` int(11) NOT NULL,
  `cid` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `personid` varchar(255) NOT NULL,
  `createtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `rid` (`rid`),
  KEY `cid` (`cid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `zp_admit`
--

INSERT INTO `zp_admit` (`id`, `uid`, `rid`, `cid`, `name`, `personid`, `createtime`) VALUES
(1, 36, 12, 1, '贾道允测试', '37080919851223186X', '2011-06-07 01:49:13');

-- --------------------------------------------------------

--
-- Table structure for table `zp_ads`
--

DROP TABLE IF EXISTS `zp_ads`;
CREATE TABLE IF NOT EXISTS `zp_ads` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `adplace` varchar(250) NOT NULL,
  `cityids` varchar(255) NOT NULL DEFAULT '0' COMMENT '投放城市',
  `subject` varchar(255) NOT NULL DEFAULT '',
  `adtype` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `begintime` int(10) NOT NULL DEFAULT '0',
  `endtime` int(10) NOT NULL DEFAULT '0',
  `content` mediumtext NOT NULL,
  `code` mediumtext NOT NULL,
  `isclosed` tinyint(1) NOT NULL DEFAULT '0',
  `attr` varchar(255) NOT NULL DEFAULT '',
  `createdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `adplace` (`adplace`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `zp_ads`
--


-- --------------------------------------------------------

--
-- Table structure for table `zp_app_person_interview`
--

DROP TABLE IF EXISTS `zp_app_person_interview`;
CREATE TABLE IF NOT EXISTS `zp_app_person_interview` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `aid` int(11) NOT NULL,
  `starttime` int(11) NOT NULL,
  `endtime` int(11) NOT NULL,
  `status` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `aid` (`aid`),
  KEY `status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `zp_app_person_interview`
--


-- --------------------------------------------------------

--
-- Table structure for table `zp_app_video_interview`
--

DROP TABLE IF EXISTS `zp_app_video_interview`;
CREATE TABLE IF NOT EXISTS `zp_app_video_interview` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cid` int(11) NOT NULL,
  `room` varchar(250) DEFAULT '' COMMENT '房间号',
  `starttime` int(11) NOT NULL,
  `endtime` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `createtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `passtime` timestamp NULL DEFAULT '0000-00-00 00:00:00',
  `nopasstime` timestamp NULL DEFAULT '0000-00-00 00:00:00',
  `intstart` int(10) NOT NULL DEFAULT '0',
  `intend` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `status` (`status`,`createtime`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=33 ;

--
-- Dumping data for table `zp_app_video_interview`
--

INSERT INTO `zp_app_video_interview` (`id`, `cid`, `room`, `starttime`, `endtime`, `status`, `createtime`, `passtime`, `nopasstime`, `intstart`, `intend`) VALUES
(20, 7, 'room10', 1305244800, 1305417600, 2, '2011-05-14 00:33:31', '2011-05-19 16:40:20', '2011-05-16 16:11:10', 1305387967, 0),
(14, 2, 'room7', 1304776800, 1304787600, 2, '2011-05-07 21:58:09', '2011-05-07 21:58:32', '0000-00-00 00:00:00', 1304778971, 0),
(13, 7, '', 1304776800, 1306467000, 2, '2011-05-06 22:10:46', '2011-05-08 15:06:33', '2011-05-14 00:24:26', 1304779017, 1304779847),
(12, 1, '', 1305245700, 1305249300, 2, '2011-05-06 18:24:52', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0),
(11, 1, 'room10', 1305243000, 1305268200, 2, '2011-05-06 18:23:34', '2011-05-07 03:06:05', '0000-00-00 00:00:00', 0, 0),
(15, 1, 'room9', 1304820000, 1304857800, 2, '2011-05-08 09:56:53', '2011-05-08 09:57:55', '0000-00-00 00:00:00', 1304840116, 0),
(16, 1, '', 1305219600, 1307798100, 2, '2011-05-12 17:41:34', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0),
(17, 1, 'room9', 1305735300, 1307802600, 2, '2011-05-12 17:42:06', '2011-05-19 17:45:02', '0000-00-00 00:00:00', 0, 0),
(18, 1, 'room8', 1305216000, 1307807100, 2, '2011-05-12 17:58:52', '2011-05-16 14:27:42', '0000-00-00 00:00:00', 0, 0),
(19, 2, 'room10', 1305559800, 1305572300, 2, '2011-05-14 00:17:12', '2011-05-15 20:38:47', '0000-00-00 00:00:00', 1305467926, 0),
(21, 1, 'room10', 1308189600, 1308211200, 2, '2011-05-16 15:45:26', '2011-05-17 13:57:45', '2011-05-17 13:57:37', 0, 0),
(22, 7, 'room10', 1305640800, 1305729000, 2, '2011-05-16 22:20:57', '2011-05-19 16:30:06', '0000-00-00 00:00:00', 0, 0),
(23, 7, 'room10', 1305759600, 1305845100, 2, '2011-05-18 11:54:46', '2011-05-19 16:15:55', '0000-00-00 00:00:00', 0, 0),
(24, 7, 'room10', 1305909900, 1306082700, 2, '2011-05-18 14:12:08', '2011-05-19 16:15:43', '0000-00-00 00:00:00', 1305985831, 0),
(25, 7, 'room10', 1306100700, 1306102500, 2, '2011-05-18 17:14:53', '2011-05-18 17:15:05', '0000-00-00 00:00:00', 0, 0),
(26, 2, '', 1306037700, 1306133100, 2, '2011-05-21 13:36:04', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0),
(27, 7, '', 1305993600, 1306845000, 2, '2011-05-21 16:17:28', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0),
(28, 11, '', 1306036800, 1306123200, 2, '2011-05-21 22:23:35', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0),
(29, 11, 'room10', 1305993600, 1306080900, 1, '2011-05-22 00:03:37', '2011-05-22 00:15:00', '0000-00-00 00:00:00', 1306050931, 0),
(30, 11, 'room10', 1309528800, 1311132600, 1, '2011-07-01 21:57:44', '2011-07-01 22:00:37', '0000-00-00 00:00:00', 1309531662, 0),
(31, 12, '', 1309665600, 1309762800, 2, '2011-07-02 15:44:29', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0),
(32, 41, 'room10', 1318435200, 1318450500, 1, '2011-10-12 14:44:28', '2011-10-12 14:44:53', '0000-00-00 00:00:00', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `zp_app_video_interview_mans`
--

DROP TABLE IF EXISTS `zp_app_video_interview_mans`;
CREATE TABLE IF NOT EXISTS `zp_app_video_interview_mans` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `roomid` int(11) unsigned NOT NULL DEFAULT '0',
  `uid` int(11) unsigned NOT NULL DEFAULT '0',
  `gender` tinyint(1) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0排队中1正在面试',
  `intdate` int(8) NOT NULL DEFAULT '0',
  `logintime` int(10) unsigned NOT NULL DEFAULT '0',
  `lastactivetime` int(10) unsigned NOT NULL DEFAULT '0',
  `intstart` int(10) NOT NULL DEFAULT '0',
  `intend` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `intdate` (`intdate`),
  KEY `intdate_2` (`intdate`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=22 ;

--
-- Dumping data for table `zp_app_video_interview_mans`
--

INSERT INTO `zp_app_video_interview_mans` (`id`, `roomid`, `uid`, `gender`, `status`, `intdate`, `logintime`, `lastactivetime`, `intstart`, `intend`) VALUES
(1, 1, 2, 0, 1, 20110430, 1304147939, 1304152219, 1304147975, 0),
(2, 1, 12, 0, 0, 20110430, 1304148276, 1304148276, 0, 0),
(3, 14, 1, 0, -1, 20110507, 1304777471, 1304782352, 0, 1304782564),
(4, 13, 1, 0, -1, 20110507, 1304778106, 1304778116, 1304778446, 1304779847),
(5, 13, 11, 0, -1, 20110507, 1304778306, 1304778306, 1304778325, 1304779847),
(6, 13, 14, 0, 1, 20110507, 1304778503, 1304778964, 1304778982, 1304779847),
(7, 15, 2, 0, -1, 20110508, 1304838548, 1304838682, 1304838712, 1304838821),
(8, 15, 1, 0, 1, 20110508, 1304839062, 1304840180, 1304839125, 0),
(9, 20, 2, 0, -1, 20110514, 1305305064, 1305305454, 1305305156, 1305305453),
(10, 20, 11, 0, -1, 20110514, 1305305495, 1305386382, 1305305529, 1305305562),
(11, 20, 12, 0, 0, 20110514, 1305361337, 1305361389, 0, 0),
(12, 20, 14, 0, -1, 20110514, 1305386447, 1305386774, 1305386480, 1305386577),
(13, 20, 1, 0, 1, 20110514, 1305386801, 1305386891, 1305386989, 0),
(14, 19, 1, 0, 0, 20110515, 1305465740, 1305475193, 1305466071, 0),
(15, 19, 1, 0, 1, 20110516, 1305527512, 1305560553, 1305559715, 0),
(16, 18, 1, 0, 0, 20110516, 1305527512, 1305560553, 0, 0),
(17, 29, 1, 0, 0, 20110522, 1305994948, 1305995276, 0, 0),
(18, 29, 11, 0, 0, 20110522, 1306050539, 1306050782, 1306050563, 0),
(19, 29, 2, 0, 1, 20110522, 1306050992, 1306051564, 1306051009, 0),
(20, 30, 1, 0, 0, 20110701, 1309529556, 1309529996, 1309529592, 0),
(21, 30, 1, 0, -1, 20110702, 1309586766, 1309594096, 1309589302, 1309594098);

-- --------------------------------------------------------

--
-- Table structure for table `zp_area`
--

DROP TABLE IF EXISTS `zp_area`;
CREATE TABLE IF NOT EXISTS `zp_area` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `area_name` varchar(250) NOT NULL,
  `area_en` varchar(250) NOT NULL,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `order_id` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `type` tinyint(1) DEFAULT '0' COMMENT '1大城市，2小城市',
  PRIMARY KEY (`id`),
  KEY `parent_id` (`parent_id`),
  KEY `order_id` (`order_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=427 ;

--
-- Dumping data for table `zp_area`
--

INSERT INTO `zp_area` (`id`, `area_name`, `area_en`, `parent_id`, `order_id`, `type`) VALUES
(1, '北京', 'beijing', -4, 1, 1),
(423, '丰台', 'fengtai', 1, 50, -1),
(3, '上海', 'shanghai', -1, 2, 1),
(4, '重庆', 'chongqing', -1, 4, 3),
(5, '南京', 'nanjing', 32, 5, 3),
(6, '广州', 'guangzhou', 46, 6, 1),
(9, '深圳', 'shenzhen', 46, 7, 1),
(10, '武汉', 'wuhan', 44, 8, 3),
(11, '杭州', 'hangzhou', 31, 9, 1),
(12, '西安', 'xian', 53, 10, 3),
(13, '成都', 'chengdu', 49, 11, 3),
(18, '昆明', 'kunming', 51, 50, 3),
(17, '宁波', 'ningbo', 31, 50, 3),
(16, '青岛', 'qingdao', 42, 50, 3),
(15, '厦门', 'xiamen', 40, 50, 3),
(14, '苏州', 'suzhou', 32, 50, 3),
(19, '郑州', 'zhengzhou', 43, 50, 3),
(20, '长沙', 'changsha', 45, 50, 3),
(21, '佛山', 'foshan', 46, 50, 3),
(22, '福州', 'fuzhou', 40, 50, 3),
(23, '贵阳', 'guiyang', 50, 50, 3),
(24, '南宁', 'nanning', 47, 50, 3),
(25, '东莞', 'dongguan', 46, 50, 3),
(26, '沈阳', 'shenyang', 36, 50, 3),
(27, '泉州', 'quanzhou', 40, 50, 0),
(28, '济南', 'jinan', 42, 50, 3),
(29, '常州', 'changzhou', 32, 50, 3),
(30, '洛阳', 'luoyang', 43, 50, 3),
(31, '浙江省', 'zhejiang', 0, 1, 0),
(32, '江苏省', 'jiangsu', 0, 2, 0),
(33, '河北省', 'hebei', 0, 50, 0),
(34, '山西省', 'shanxi', 0, 50, 0),
(35, '内蒙古自治区', 'neimenggu', 0, 50, 0),
(36, '辽宁省', 'liaoning', 0, 50, 0),
(37, '吉林省', 'jilin', 0, 50, 0),
(38, '黑龙江省', 'heilongjiang', 0, 50, 0),
(39, '安徽省', 'anhui', 0, 50, 0),
(40, '福建省', 'fujian', 0, 50, 0),
(41, '江西省', 'jiangxi', 0, 50, 0),
(42, '山东省', 'shandong', 0, 50, 0),
(43, '河南省', 'henan', 0, 50, 0),
(44, '湖北省', 'hubei', 0, 50, 0),
(45, '湖南省', 'hunan', 0, 50, 0),
(46, '广东省', 'guangdong', 0, 50, 0),
(47, '广西壮族自治区', 'guangxi', 0, 50, 0),
(48, '海南省', 'hainan', 0, 50, 0),
(49, '四川省', 'sichuan', 0, 50, 0),
(50, '贵州省', 'guizhou', 0, 50, 0),
(51, '云南省', 'yunnan', 0, 50, 0),
(52, '西藏自治区', 'xizang', 0, 50, 0),
(53, '陕西省', 'shanxi0', 0, 50, 0),
(54, '甘肃省', 'gansu', 0, 50, 0),
(55, '青海省', 'qinghai', 0, 50, 0),
(56, '宁夏回族自治区', 'ningxia', 0, 50, 0),
(57, '新疆维吾尔自治区', 'xinjiang', 0, 50, 0),
(58, '台湾省', 'taiwan', 0, 50, 0),
(59, '香港特别行政区', 'hongkong', 0, 50, 0),
(60, '澳门特别行政区', 'Macau', 0, 50, 0),
(61, '石家庄', 'shijiazhuang', 33, 50, 0),
(62, '唐山', 'tangshan', 33, 50, 0),
(63, '秦皇岛', 'qinhuangdao', 33, 50, 0),
(64, '邯郸', 'handan', 33, 50, 0),
(65, '邢台', 'xingtai', 33, 50, 0),
(66, '保定', 'baoding', 33, 50, 0),
(67, '张家口', 'zhangjiakou', 33, 50, 0),
(68, '承德', 'chengde', 33, 50, 0),
(69, '沧州', 'cangzhou', 33, 50, 0),
(70, '廊坊', 'langfang', 33, 50, 0),
(71, '衡水', 'hengshui', 33, 50, 0),
(72, '太原', 'taiyuan', 34, 50, 0),
(73, '大同', 'datong', 34, 50, 0),
(74, '阳泉', 'yangquan', 34, 50, 0),
(75, '长治', 'changzhi', 34, 50, 0),
(76, '晋城', 'jincheng', 34, 50, 0),
(77, '晋中', 'jinzhong', 34, 50, 0),
(78, '运城', 'yuncheng', 34, 50, 0),
(79, '忻州', 'xinzhou', 34, 50, 0),
(80, '临汾', 'linfen', 34, 50, 0),
(81, '吕梁', 'lvliang', 34, 50, 0),
(82, '朔州', 'shuozhou', 34, 50, 0),
(83, '呼和浩特', 'huhehaote', 35, 50, 0),
(84, '包头', 'baotou', 35, 50, 0),
(85, '赤峰', 'chifeng', 35, 50, 0),
(86, '通辽', 'tongliao', 35, 50, 0),
(87, '鄂尔多斯', 'eerduosi', 35, 50, 0),
(88, '呼伦贝尔', 'hulunbeier', 35, 50, 0),
(89, '巴彦淖尔', 'bayannaoer', 35, 50, 0),
(90, '乌兰察布', 'wulanchabu', 35, 50, 0),
(91, '兴安盟', 'xinganmeng', 35, 50, 0),
(92, '锡林郭勒盟', 'xilinguolemeng', 35, 50, 0),
(93, '阿拉善盟', 'alashanmeng', 35, 50, 0),
(94, '乌海', 'wuhai', 35, 50, 0),
(95, '大连', 'dalian', 36, 50, 0),
(96, '鞍山', 'anshan', 36, 50, 0),
(97, '抚顺', 'fushun', 36, 50, 0),
(98, '本溪', 'benxi', 36, 50, 0),
(99, '丹东', 'dandong', 36, 50, 0),
(100, '锦州', 'jinzhou', 36, 50, 0),
(101, '营口', 'yingkou', 36, 50, 0),
(102, '辽阳', 'liaoyang', 36, 50, 0),
(103, '盘锦', 'panjin', 36, 50, 0),
(104, '铁岭', 'tieling', 36, 50, 0),
(105, '朝阳', 'chaoyang', 36, 50, 0),
(106, '葫芦岛', 'huludao', 36, 50, 0),
(107, '阜新', 'fuxin', 36, 50, 0),
(108, '长春', 'changchun', 37, 50, 0),
(109, '吉林', 'jilinshi', 37, 50, 0),
(110, '四平', 'siping', 37, 50, 0),
(111, '辽源', 'liaoyuan', 37, 50, 0),
(112, '通化', 'tonghua', 37, 50, 0),
(113, '白山', 'baishan', 37, 50, 0),
(114, '松原', 'songyuan', 37, 50, 0),
(115, '白城', 'baicheng', 37, 50, 0),
(116, '延边州', 'yanbianzhou', 37, 50, 0),
(117, '哈尔滨', 'haerbin', 38, 50, 0),
(118, '齐齐哈尔', 'qiqihaer', 38, 50, 0),
(119, '鸡西', 'jixi', 38, 50, 0),
(120, '鹤岗', 'hegang', 38, 50, 0),
(121, '双鸭山', 'shuangyashan', 38, 50, 0),
(122, '大庆', 'daqing', 38, 50, 0),
(123, '伊春', 'yichun', 38, 50, 0),
(124, '佳木斯', 'jiamusi', 38, 50, 0),
(125, '七台河', 'qitaihe', 38, 50, 0),
(126, '牡丹江', 'mudanjiang', 38, 50, 0),
(127, '黑河', 'heihe', 38, 50, 0),
(128, '绥化', 'suihua', 38, 50, 0),
(129, '大兴安岭地区', 'daxinganling', 38, 50, 0),
(130, '无锡', 'wuxi', 32, 50, 0),
(131, '徐州', 'xuzhou', 32, 50, 0),
(132, '南通', 'nantong', 32, 50, 0),
(133, '连云港', 'lianyungang', 32, 50, 0),
(134, '淮安', 'huaian', 32, 50, 0),
(135, '盐城', 'yancheng', 32, 50, 0),
(136, '扬州', 'yangzhou', 32, 50, 0),
(137, '镇江', 'zhenjiang', 32, 50, 0),
(138, '泰州', 'qinzhou', 32, 50, 0),
(139, '宿迁', 'suqian', 32, 50, 0),
(140, '温州', 'wenzhou', 31, 50, 0),
(141, '嘉兴', 'jiaxing', 31, 50, 0),
(142, '湖州', 'huzhou', 31, 50, 0),
(143, '绍兴', 'shaoxing', 31, 50, 0),
(144, '金华', 'jinhua', 31, 50, 0),
(145, '衢州', 'quzhou', 31, 50, 0),
(146, '舟山', 'zhoushan', 31, 50, 0),
(147, '台州', 'taizhou', 31, 50, 0),
(148, '丽水', 'lishui', 31, 50, 0),
(149, '合肥', 'hefei', 39, 50, 0),
(150, '芜湖', 'wuhu', 39, 50, 0),
(151, '蚌埠', 'bengbu', 39, 50, 0),
(152, '淮南', 'huainan', 39, 50, 0),
(153, '马鞍山', 'maanshan', 39, 50, 0),
(154, '淮北', 'huaibei', 39, 50, 0),
(155, '铜陵', 'tongling', 39, 50, 0),
(156, '安庆', 'anqing', 39, 50, 0),
(157, '黄山', 'huangshan', 39, 50, 0),
(158, '滁州', 'chuzhou', 39, 50, 0),
(159, '阜阳', 'fuyang', 39, 50, 0),
(160, '宿州', 'anhuisuzhou', 39, 50, 0),
(161, '巢湖', 'chaohu', 39, 50, 0),
(162, '六安', 'luan', 39, 50, 0),
(163, '毫州', 'haozhou', 39, 50, 0),
(164, '池州', 'chizhou', 39, 50, 0),
(165, '宣城', 'xuancheng', 39, 50, 0),
(166, '莆田', 'putian', 40, 50, 0),
(167, '三明', 'sanming', 40, 50, 0),
(168, '漳州', 'zhangzhou', 39, 50, 0),
(169, '南平', 'nanping', 40, 50, 0),
(170, '龙岩', 'longyan', 40, 50, 0),
(171, '宁州', 'ningzhou', 39, 50, 0),
(172, '南昌', 'nanchang', 41, 50, 0),
(173, '景德镇', 'jingdezhen', 41, 50, 0),
(174, '萍乡', 'pingxiang', 41, 50, 0),
(175, '九江', 'jiujiang', 41, 50, 0),
(176, '新余', 'xinyu', 41, 50, 0),
(177, '鹰潭', 'yingtan', 41, 50, 0),
(178, '赣州', 'ganzhou', 41, 50, 0),
(179, '吉安', 'jian', 41, 50, 0),
(180, '宜春', 'jaingxiyichun', 41, 50, 0),
(181, '抚州', 'jiangxifuzhou', 41, 50, 0),
(182, '上饶', 'shangrao', 41, 50, 0),
(183, '淄博', 'zibo', 42, 50, 0),
(184, '枣庄', 'zaozhuang', 42, 50, 0),
(185, '东营', 'dongying', 42, 50, 0),
(186, '烟台', 'yantai', 42, 50, 0),
(187, '潍坊', 'weifang', 42, 50, 0),
(188, '威海', 'weihai', 42, 50, 0),
(189, '济宁', 'jining', 42, 50, 0),
(190, '泰安', 'taian', 42, 50, 0),
(191, '日照', 'rizhao', 42, 50, 0),
(192, '莱芜', 'laiwu', 42, 50, 0),
(193, '临沂', 'linyi', 42, 50, 0),
(194, '德州', 'dezhou', 42, 50, 0),
(195, '聊城', 'liaocheng', 42, 50, 0),
(196, '滨州', 'binzhou', 42, 50, 0),
(197, '菏泽', 'heze', 42, 50, 0),
(198, '济源', 'jiyuan', 43, 50, 0),
(199, '开封', 'kaifeng', 43, 50, 0),
(200, '平顶山', 'pingdingshan', 43, 50, 0),
(201, '焦作', 'jiaozuo', 43, 50, 0),
(202, '鹤壁', 'hebi', 43, 50, 0),
(203, '新乡', 'xinxiang', 43, 50, 0),
(204, '安阳', 'anyang', 43, 50, 0),
(205, '濮阳', 'puyang', 43, 50, 0),
(206, '许昌', 'xuchang', 43, 50, 0),
(207, '漯河', 'luohe', 43, 50, 0),
(208, '三门峡', 'sanmenxia', 43, 50, 0),
(209, '南阳', 'nanyang', 43, 50, 0),
(210, '商丘', 'shangqiu', 43, 50, 0),
(211, '信阳', 'xinyang', 43, 50, 0),
(212, '周口', 'zhoukou', 43, 50, 0),
(213, '驻马店', 'zhumadian', 43, 50, 0),
(214, '黄石', 'huangshi', 44, 50, 0),
(215, '襄樊', 'xiangfan', 44, 50, 0),
(216, '十堰', 'shiyan', 44, 50, 0),
(217, '荆州', 'jingzhou', 44, 50, 0),
(218, '宜昌', 'yichang', 44, 50, 0),
(219, '荆门', 'jingmen', 44, 50, 0),
(220, '鄂州', 'ezhou', 44, 50, 0),
(221, '孝感', 'xiaogan', 44, 50, 0),
(222, '黄冈', 'huanggang', 44, 50, 0),
(223, '咸宁', 'xianning', 44, 50, 0),
(224, '随州', 'suizhou', 44, 50, 0),
(225, '恩施', 'enshi', 44, 50, 0),
(226, '仙桃', 'xiantao', 44, 50, 0),
(227, '潜江', 'qianjiang', 44, 50, 0),
(228, '天门', 'tianmen', 44, 50, 0),
(229, '神农架林区', 'shennognjia', 44, 50, 0),
(230, '株洲', 'zhuzhou', 45, 50, 0),
(231, '湘潭', 'xiangtan', 45, 50, 0),
(232, '衡阳', 'hengyang', 45, 50, 0),
(233, '邵阳', 'shaoyang', 45, 50, 0),
(234, '岳阳', 'yueyang', 45, 50, 0),
(235, '常德', 'changde', 45, 50, 0),
(236, '张家界', 'zhangjiajie', 45, 50, 0),
(237, '益阳', 'yiyang', 45, 50, 0),
(238, '郴州', 'chenzhou', 45, 50, 0),
(239, '永州', 'yongzhou', 45, 50, 0),
(240, '怀化', 'huaihua', 45, 50, 0),
(241, '娄底', 'loudi', 45, 50, 0),
(242, '湘西', 'xiangxi', 45, 50, 0),
(243, '珠海', 'zhuhai', 46, 50, 0),
(244, '汕头', 'shantou', 46, 50, 0),
(245, '韶关', 'shaoguan', 46, 50, 0),
(246, '江门', 'jiangmen', 46, 50, 0),
(247, '湛江', 'zhanjiang', 46, 50, 0),
(248, '茂名', 'maoming', 46, 50, 0),
(249, '肇庆', 'zhaoqing', 46, 50, 0),
(250, '惠州', 'huizhou', 46, 50, 0),
(251, '梅州', 'meizhou', 46, 50, 0),
(252, '汕尾', 'shanwei', 46, 50, 0),
(253, '河源', 'heyuan', 46, 50, 0),
(254, '阳江', 'yangjiang', 46, 50, 0),
(255, '清远', 'qingyuan', 46, 50, 0),
(256, '中山', 'zhongshan', 46, 50, 0),
(257, '潮州', 'chaozhou', 46, 50, 0),
(258, '揭阳', 'jieyang', 46, 50, 0),
(259, '云浮', 'yunfu', 46, 50, 0),
(260, '柳州', 'liuzhou', 47, 50, 0),
(261, '桂林', 'guilin', 47, 50, 0),
(262, '梧州', 'wuzhou', 47, 50, 0),
(263, '北海', 'beihai', 47, 50, 0),
(264, '防城港', 'fangchenggang', 47, 50, 0),
(265, '钦州', 'guangxiqinzhou', 47, 50, 0),
(266, '贵港', 'guigang', 47, 50, 0),
(267, '玉林', 'yulin', 47, 50, 0),
(268, '百色', 'baise', 47, 50, 0),
(269, '贺州', 'hezhou', 47, 50, 0),
(270, '河池', 'hechi', 47, 50, 0),
(271, '来宾', 'laibin', 47, 50, 0),
(272, '崇左', 'chongzuo', 47, 50, 0),
(273, '海口', 'haikou', 48, 50, 0),
(274, '三亚', 'sanya', 48, 50, 0),
(275, '文昌', 'wenchang', 48, 50, 0),
(276, '琼海', 'qionghai', 48, 50, 0),
(277, '万宁', 'wanning', 48, 50, 0),
(278, '五指山', 'wuzhishan', 48, 50, 0),
(279, '东方', 'dongfang', 48, 50, 0),
(280, '儋州', 'danzhou', 48, 50, 0),
(281, '临高', 'lingao', 48, 50, 0),
(282, '澄迈', 'chengmai', 48, 50, 0),
(283, '定安', 'dingan', 48, 50, 0),
(284, '屯昌', 'tunchang', 48, 50, 0),
(285, '昌江', 'changjiang', 48, 50, 0),
(286, '白沙', 'baisha', 48, 50, 0),
(287, '琼中', 'qiongzhong', 48, 50, 0),
(288, '陵水', 'lingshui', 48, 50, 0),
(289, '保亭', 'baoting', 48, 50, 0),
(290, '乐东', 'ledong', 48, 50, 0),
(291, '西南中沙群岛办事处（县级）', 'xinanzhongshaqundaobanshichu', 48, 50, 0),
(292, '自贡', 'zigong', 49, 50, 0),
(293, '攀枝花', 'panzhihua', 49, 50, 0),
(294, '泸州', 'luzhou', 49, 50, 0),
(295, '德阳', 'deyang', 49, 50, 0),
(296, '绵阳', 'mianyang', 49, 50, 0),
(297, '广元', 'guangyuan', 49, 50, 0),
(298, '遂宁', 'suining', 49, 50, 0),
(299, '内江', 'neijiang', 49, 50, 0),
(300, '乐山', 'leshan', 49, 50, 0),
(301, '南充', 'nanchong', 49, 50, 0),
(302, '宜宾', 'yibin', 49, 50, 0),
(303, '广安', 'guangan', 49, 50, 0),
(304, '达州', 'dazhou', 49, 50, 0),
(305, '眉山', 'meishan', 49, 50, 0),
(306, '雅安', 'yaan', 49, 50, 0),
(307, '巴中', 'bazhong', 49, 50, 0),
(308, '资阳', 'ziyang', 49, 50, 0),
(309, '阿坝州', 'aba', 49, 50, 0),
(310, '甘孜州', 'ganzi', 49, 50, 0),
(311, '凉山州', 'liangshan', 49, 50, 0),
(312, '六盘水', 'liupanshui', 31, 50, 0),
(313, '遵义', 'zunyi', 50, 50, 0),
(314, '安顺', 'anshun', 50, 50, 0),
(315, '铜仁地区', 'tongren', 50, 50, 0),
(316, '毕节地区', 'bijie', 50, 50, 0),
(317, '黔西南州', 'qianxinan', 50, 50, 0),
(318, '黔东南州', 'qiandongnan', 50, 50, 0),
(319, '黔南州', 'qiannanzhou', 50, 50, 0),
(320, '曲靖', 'qujing', 51, 50, 0),
(321, '玉溪', 'yuxi', 51, 50, 0),
(322, '宝山', 'baoshan', 51, 50, 0),
(323, '邵通', 'shaotong', 51, 50, 0),
(324, '丽江', 'lijiang', 51, 50, 0),
(325, '普洱', 'puer', 51, 50, 0),
(326, '临沧', 'lincang', 51, 50, 0),
(327, '文山州', 'wenshan', 51, 50, 0),
(328, '红河州', 'honghe', 51, 50, 0),
(329, '西双版纳州', 'xishuangbanna', 51, 50, 0),
(330, '楚雄州', 'chuxiong', 51, 50, 0),
(331, '大理州', 'dali', 51, 50, 0),
(332, '德宏州', 'dehong', 51, 50, 0),
(333, '怒江州', 'nujiang', 51, 50, 0),
(334, '迪庆州', 'diqing', 51, 50, 0),
(335, '拉萨', 'lasa', 52, 50, 0),
(336, '昌都地区', 'changdu', 52, 50, 0),
(337, '山南地区', 'shannan', 52, 50, 0),
(338, '日喀则地区', 'rikaze', 52, 50, 0),
(339, '那曲地区', 'naqu', 52, 50, 0),
(340, '阿里地区', 'ali', 52, 50, 0),
(341, '林芝地区', 'linzhi', 52, 50, 0),
(342, '铜川', 'tongchuan', 53, 50, 0),
(343, '宝鸡', 'baoji', 53, 50, 0),
(344, '咸阳', 'xianyang', 53, 50, 0),
(345, '渭南', 'weinan', 53, 50, 0),
(346, '延安', 'yanan', 53, 50, 0),
(347, '汉中', 'hanzhong', 53, 50, 0),
(348, '榆林', 'shanxiyulin', 53, 50, 0),
(349, '安康', 'ankang', 53, 50, 0),
(350, '商洛', 'shangluo', 53, 50, 0),
(351, '兰州', 'lanzhou', 54, 50, 0),
(352, '嘉峪关', 'jiayuguan', 54, 50, 0),
(353, '金昌', 'jinchang', 54, 50, 0),
(354, '白银', 'baiyin', 54, 50, 0),
(355, '天水', 'tianshui', 54, 50, 0),
(356, '武威', 'wuwei', 54, 50, 0),
(357, '张掖', 'zhangye', 54, 50, 0),
(358, '平凉', 'pingliang', 54, 50, 0),
(359, '酒泉', 'jiuquan', 54, 50, 0),
(360, '庆阳', 'qingyang', 54, 50, 0),
(361, '定西', 'dingxi', 54, 50, 0),
(362, '陇南', 'longnan', 54, 50, 0),
(363, '临夏州', 'linxia', 54, 50, 0),
(364, '甘南州', 'gannan', 54, 50, 0),
(365, '西宁', 'xining', 55, 50, 0),
(366, '海东地区', 'haidong', 55, 50, 0),
(367, '海北州', 'haibei', 55, 50, 0),
(368, '黄南州', 'huangnan', 55, 50, 0),
(369, '海南州', 'hainanzhou', 55, 50, 0),
(370, '果洛州', 'guoluo', 55, 50, 0),
(371, '玉树州', 'yushu', 55, 50, 0),
(372, '海西州', 'haixi', 55, 50, 0),
(373, '银川', 'yinchuan', 56, 50, 0),
(374, '石嘴山', 'shizuishan', 56, 50, 0),
(375, '吴忠', 'wuzhong', 56, 50, 0),
(376, '固原', 'guyuan', 56, 50, 0),
(377, '中卫', 'zhongwei', 56, 50, 0),
(378, '乌鲁木齐', 'wulumuqi', 57, 50, 0),
(379, '克拉玛依', 'kelamayi', 57, 50, 0),
(380, '吐鲁番地区', 'tulufan', 57, 50, 0),
(381, '哈密地区', 'hami', 57, 50, 0),
(382, '和田地区', 'hetian', 57, 50, 0),
(383, '阿克苏地区', 'akesu', 57, 50, 0),
(384, '喀什地区', 'kashi', 57, 50, 0),
(385, '克孜勒苏柯尔克孜自治州', 'kezilesukeerkezi', 57, 50, 0),
(386, '巴音格楞蒙古自治州', 'bayingeleng', 57, 50, 0),
(387, '昌吉回族自治州', 'changji', 57, 50, 0),
(388, '博尔塔拉蒙古自治州', 'boertala', 57, 50, 0),
(389, '伊犁哈萨克自治州', 'yili', 57, 50, 0),
(390, '塔城地区', 'tacheng', 57, 50, 0),
(391, '阿勒泰地区', 'aletai', 57, 50, 0),
(392, '石河子', 'shihezi', 57, 50, 0),
(393, '阿拉尔', 'alaer', 57, 50, 0),
(394, '图木舒克', 'tumushuke', 57, 50, 0),
(395, '五家渠', 'wujiaqu', 57, 50, 0),
(396, '台北', 'taibei', 58, 50, 0),
(397, '高雄', 'gaoxiong', 58, 50, 0),
(398, '台中', 'taizhong', 58, 50, 0),
(399, '台南', 'tainan', 58, 50, 0),
(400, '新竹', 'xinzhu', 58, 50, 0),
(401, '嘉义', 'jiayi', 58, 50, 0),
(402, '南投', 'nantou', 58, 50, 0),
(403, '彰化', 'zhanghua', 58, 50, 0),
(404, '台北县', 'taibeixian', 58, 50, 0),
(405, '桃园县', 'taoyuan', 58, 50, 0),
(406, '新竹县', 'xinzhuxian', 58, 50, 0),
(407, '苗栗县', 'miaoli', 58, 50, 0),
(408, '台中县', 'taizhongxian', 58, 50, 0),
(409, '彰化县', 'zhanghuaxian', 58, 50, 0),
(410, '南投县', 'nantouxian', 58, 50, 0),
(411, '云林县', 'yunlin', 58, 50, 0),
(412, '嘉义县', 'jiayixian', 58, 50, 0),
(413, '台南县', 'tainanxian', 58, 50, 0),
(414, '高雄县', 'gaoxiongxian', 58, 50, 0),
(415, '漳州', 'zhangzhoushi', 40, 50, 0),
(416, '宁德', 'ningde', 40, 50, 0),
(417, '六盘水市', 'liupanshuishi', 50, 50, 0),
(418, '海淀', 'haidian', 1, 1, -1),
(419, '朝阳', 'chaoyang1', 1, 2, -1),
(420, '闽中', 'mz', 3, 1, -1),
(421, '西城', 'xicheng', 1, 50, -1),
(422, '东城', 'dongcheng', 1, 50, -1),
(2, '天津', 'Tianjin', -2, 5, 1);

-- --------------------------------------------------------

--
-- Table structure for table `zp_buy_recode`
--

DROP TABLE IF EXISTS `zp_buy_recode`;
CREATE TABLE IF NOT EXISTS `zp_buy_recode` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cid` int(11) NOT NULL COMMENT '公司id',
  `cname` int(11) NOT NULL COMMENT '公司名称',
  `uids` text CHARACTER SET ucs2 NOT NULL COMMENT '购买简历数据的序列化数组',
  `price` float NOT NULL COMMENT '交易金额',
  `ispay` int(11) NOT NULL COMMENT '是否付费',
  `datetime` int(11) NOT NULL COMMENT '购买时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `cid` (`cid`,`ispay`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `zp_buy_recode`
--


-- --------------------------------------------------------

--
-- Table structure for table `zp_chargecard`
--

DROP TABLE IF EXISTS `zp_chargecard`;
CREATE TABLE IF NOT EXISTS `zp_chargecard` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cardnum` bigint(12) NOT NULL DEFAULT '0' COMMENT '卡号',
  `cardpwd` char(6) NOT NULL COMMENT '密码',
  `fee` float(10,2) NOT NULL DEFAULT '0.00' COMMENT '费用',
  `isactive` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1已激活 0未激活',
  `isuse` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1已使用 0未使用',
  `userid` int(11) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `usedatetime` int(10) NOT NULL DEFAULT '0' COMMENT '充值日期',
  `startdatetime` int(10) NOT NULL DEFAULT '0',
  `enddatetime` int(10) NOT NULL DEFAULT '0',
  `createdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC COMMENT='充值卡' AUTO_INCREMENT=1 ;

--
-- Dumping data for table `zp_chargecard`
--


-- --------------------------------------------------------

--
-- Table structure for table `zp_comment`
--

DROP TABLE IF EXISTS `zp_comment`;
CREATE TABLE IF NOT EXISTS `zp_comment` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `typeid` tinyint(2) NOT NULL DEFAULT '1' COMMENT '1为演出评论',
  `itemid` int(11) NOT NULL DEFAULT '0' COMMENT '评论的信息ID',
  `pid` int(11) NOT NULL DEFAULT '0' COMMENT '父评论ID',
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT '评论者ID',
  `content` text,
  `order_id` int(11) NOT NULL DEFAULT '0' COMMENT '推荐排序用,越大越靠前',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `userip` char(15) NOT NULL DEFAULT '0.0.0.0' COMMENT 'ip',
  `createdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='演出评价' AUTO_INCREMENT=1 ;

--
-- Dumping data for table `zp_comment`
--


-- --------------------------------------------------------

--
-- Table structure for table `zp_config`
--

DROP TABLE IF EXISTS `zp_config`;
CREATE TABLE IF NOT EXISTS `zp_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `webname` varchar(200) NOT NULL,
  `weburl` varchar(200) NOT NULL,
  `imgurl` varchar(200) NOT NULL,
  `domain` varchar(200) NOT NULL,
  `charset` varchar(200) NOT NULL,
  `kfphone` varchar(200) NOT NULL DEFAULT '400-880-2880',
  `txmoney` smallint(4) NOT NULL DEFAULT '0' COMMENT '提现起点',
  `isvideo` tinyint(1) NOT NULL DEFAULT '0',
  `seo_title` varchar(200) NOT NULL,
  `seo_keyword` varchar(254) NOT NULL,
  `seo_description` varchar(254) NOT NULL,
  `version` char(20) NOT NULL DEFAULT '0',
  `icp` varchar(250) DEFAULT NULL,
  `updatetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `zp_config`
--

INSERT INTO `zp_config` (`id`, `webname`, `weburl`, `imgurl`, `domain`, `charset`, `kfphone`, `txmoney`, `isvideo`, `seo_title`, `seo_keyword`, `seo_description`, `version`, `icp`, `updatetime`) VALUES
(1, '视一视-测试站点', 'http://www.shiyishi.cn', 'http://img.shiyishi.cn', 'shiyishi.cn', 'utf-8', '400-810-8810', 1000, 0, '视一视-测试站点', '视一视', '视一视', 'Beta 1.00', '报备中...', '2011-07-20 12:03:13');

-- --------------------------------------------------------

--
-- Table structure for table `zp_contract`
--

DROP TABLE IF EXISTS `zp_contract`;
CREATE TABLE IF NOT EXISTS `zp_contract` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `code` varchar(255) NOT NULL,
  `wordall` int(11) NOT NULL,
  `word` int(11) NOT NULL,
  `videoall` int(11) NOT NULL,
  `video` int(11) NOT NULL,
  `postall` int(11) NOT NULL,
  `post` int(11) NOT NULL,
  `startdate` int(11) NOT NULL,
  `enddate` int(11) NOT NULL,
  `createdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `zp_contract`
--

INSERT INTO `zp_contract` (`id`, `uid`, `code`, `wordall`, `word`, `videoall`, `video`, `postall`, `post`, `startdate`, `enddate`, `createdate`) VALUES
(1, 2, 'ctc1', 100, 50, 0, 0, 100, 100, 1330272000, 1364400000, '2012-02-28 13:41:11'),
(2, 2, 'ctc2', 1000, 890, 0, 0, 100, 100, 1330358400, 1361548800, '2012-02-28 14:09:10');

-- --------------------------------------------------------

--
-- Table structure for table `zp_departments`
--

DROP TABLE IF EXISTS `zp_departments`;
CREATE TABLE IF NOT EXISTS `zp_departments` (
  `id` int(11) NOT NULL,
  `cid` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `zp_departments`
--


-- --------------------------------------------------------

--
-- Table structure for table `zp_dustrytype`
--

DROP TABLE IF EXISTS `zp_dustrytype`;
CREATE TABLE IF NOT EXISTS `zp_dustrytype` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `thename` varchar(250) NOT NULL,
  `enname` varchar(250) NOT NULL,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `order_id` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `createdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `parent_id` (`parent_id`),
  KEY `order_id` (`order_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=49 ;

--
-- Dumping data for table `zp_dustrytype`
--

INSERT INTO `zp_dustrytype` (`id`, `thename`, `enname`, `parent_id`, `order_id`, `createdate`) VALUES
(2, '零售业务', 'Retail Business', 0, 0, '2012-03-08 13:47:07'),
(3, '销售业务', 'Sales', 0, 0, '2012-03-08 13:47:36'),
(4, '客户服务/售后服务', 'Customer service / After-sales service', 0, 0, '2012-03-08 13:48:18'),
(5, '采购/贸易', 'Purchase / Trade', 0, 0, '2012-03-08 13:48:43'),
(6, '计算机软件/硬件', 'Computer software / Hardware', 0, 0, '2012-03-08 13:49:09'),
(7, '互联网/电子商务/网游', 'Internet / E-commerce / Online game', 0, 0, '2012-03-08 13:49:53'),
(8, '电信/通信', 'Telecom / Communication', 0, 0, '2012-03-08 13:52:39'),
(9, '电子/电气/半导体/仪器仪表', 'Electrical / Electronic / Semiconductor / Instrument', 0, 0, '2012-03-08 13:53:18'),
(10, 'IT支持', 'IT support', 0, 0, '2012-03-08 13:53:48'),
(11, '建筑/装修', 'Construction / Renovation', 0, 0, '2012-03-08 13:54:31'),
(12, '房地产开发/经纪/中介', 'Real estate development / Brokerage / Intermediary', 0, 0, '2012-03-08 13:55:34'),
(13, '物业管理', 'Property Management', 0, 0, '2012-03-08 13:56:01'),
(14, '财务/审计/税务', 'Finance / Audit / Taxation', 0, 0, '2012-03-08 13:56:36'),
(15, '银行', 'Bank', 0, 0, '2012-03-08 13:57:04'),
(16, '金融/证券/期货/投资', 'Financial / Securities / Futures / Investment', 0, 0, '2012-03-08 13:57:34'),
(17, '保险', 'Insurance', 0, 0, '2012-03-08 13:58:15'),
(18, '汽车/摩托车制造', 'Car/motorcycle manufacturing', 0, 0, '2012-03-08 13:59:10'),
(19, '汽车销售与服务', 'Automobile sales and service', 0, 0, '2012-03-08 13:59:57'),
(20, '工程机械', 'Construction machinery', 0, 0, '2012-03-08 14:00:30'),
(21, '生产/加工/制造', 'Production / Processing / Manufacturing', 0, 0, '2012-03-08 14:01:13'),
(22, '交通运输', 'Transportation', 0, 0, '2012-03-08 14:01:45'),
(23, '服装/纺织/食品/饮料', 'Apparel / Textile / Food / Beverage', 0, 0, '2012-03-08 14:02:29'),
(24, '物流/仓储', 'Logistics / Warehousing', 0, 0, '2012-03-08 14:03:18'),
(25, '技工', 'skilled worker', 0, 0, '2012-03-08 14:03:42'),
(26, '质量控制/安全防护', 'Quality control / Security', 0, 0, '2012-03-08 14:04:16'),
(27, '市场/营销', 'Marketing / Sales', 0, 0, '2012-03-08 14:04:39'),
(28, '公关/媒介', 'PR / Media', 0, 0, '2012-03-08 14:05:09'),
(29, '美术/设计/创意', 'Art / Design / Creative', 0, 0, '2012-03-08 14:05:41'),
(30, '广告/会展', 'Advertising / Exhibition', 0, 0, '2012-03-08 14:06:02'),
(31, '传媒/影视/报刊/出版/印刷', 'Media / TV / Newspaper / Publication / Printing', 0, 0, '2012-03-08 14:06:50'),
(32, '生物工程/制药/医疗器械', 'Biotechnology / Pharmaceutical / Medical Device', 0, 0, '2012-03-08 14:07:22'),
(33, '化工', 'Chemical industry', 0, 0, '2012-03-08 14:07:54'),
(34, '环境科学/环保', 'Environmental Science / Environmental Protection', 0, 0, '2012-03-08 14:08:24'),
(35, '能源/矿产/地质勘查', 'Energy / Mining / Geological Survey', 0, 0, '2012-03-08 14:08:49'),
(36, '高级管理', 'Senior management', 0, 0, '2012-03-08 14:09:25'),
(37, '高级管理', 'Senior management', 0, 0, '2012-03-08 14:10:33'),
(38, '人力资源', 'Human Resources', 0, 0, '2012-03-08 14:11:02'),
(39, '行政/后勤/文秘', 'Administrative / logistical / secretarial', 0, 0, '2012-03-08 14:11:27'),
(40, '咨询/顾问', 'Advisory / Consultancy', 0, 0, '2012-03-08 14:12:02'),
(41, '教育/培训', 'Education / Training', 0, 0, '2012-03-08 14:12:31'),
(42, '律师/法务', 'Law / Legal', 0, 0, '2012-03-08 14:12:58'),
(43, '翻译', 'Translation', 0, 0, '2012-03-08 14:13:38'),
(44, '酒店/餐饮/旅游/娱乐', 'Hotel / Catering / Tourism / Entertainmen', 0, 0, '2012-03-08 14:14:07'),
(45, '保健/美容/美发/健身', 'Health / Beauty / Beauty / Fitness', 0, 0, '2012-03-08 14:14:41'),
(46, '医疗/护理', 'Medical / Nursing', 0, 0, '2012-03-08 14:15:11'),
(47, '保安/家政', 'Security / Home Economics', 0, 0, '2012-03-08 14:15:44'),
(48, '其他', 'Others', 0, 0, '2012-03-08 14:16:09');

-- --------------------------------------------------------

--
-- Table structure for table `zp_enrolllog`
--

DROP TABLE IF EXISTS `zp_enrolllog`;
CREATE TABLE IF NOT EXISTS `zp_enrolllog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `eid` int(11) NOT NULL DEFAULT '0',
  `jobid` int(11) NOT NULL DEFAULT '0',
  `uid` int(11) NOT NULL DEFAULT '0',
  `usercard` varchar(250) NOT NULL COMMENT '身份证',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `createdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `eid` (`eid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=15 ;

--
-- Dumping data for table `zp_enrolllog`
--

INSERT INTO `zp_enrolllog` (`id`, `eid`, `jobid`, `uid`, `usercard`, `status`, `createdate`) VALUES
(1, 2, 1, 3, '132345434545678', 1, '2012-02-28 13:52:03'),
(2, 2, 1, 4, '123456787654323', 1, '2012-02-28 13:54:49'),
(3, 2, 1, 5, '123432343433333', 1, '2012-02-28 14:13:29'),
(4, 2, 1, 6, '111111111111111', 1, '2012-02-28 14:13:38'),
(5, 2, 1, 7, '000000000000000', 1, '2012-02-28 14:14:31'),
(6, 2, 1, 8, '132222222222222', 1, '2012-02-28 14:14:40'),
(7, 2, 1, 9, '999999999999999', 1, '2012-02-28 14:14:48'),
(8, 2, 1, 10, '888888888888888', 1, '2012-02-28 14:14:56'),
(9, 2, 1, 11, '777777777777777', 1, '2012-02-28 14:15:03'),
(10, 2, 1, 12, '098765666666666', 1, '2012-02-28 14:15:12'),
(11, 2, 1, 13, '666666666666666', 1, '2012-02-28 14:15:24'),
(12, 2, 1, 14, '123232321222222', 1, '2012-02-28 14:17:24'),
(13, 2, 1, 15, '143234544444445', 1, '2012-02-28 23:36:08'),
(14, 0, 1, 1, '110106198007053431', 1, '2012-03-10 13:50:59');

-- --------------------------------------------------------

--
-- Table structure for table `zp_e_user`
--

DROP TABLE IF EXISTS `zp_e_user`;
CREATE TABLE IF NOT EXISTS `zp_e_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8 DEFAULT '',
  `password` varchar(255) CHARACTER SET utf8 DEFAULT '',
  `company` varchar(255) CHARACTER SET utf8 NOT NULL,
  `company_s` varchar(255) CHARACTER SET utf8 DEFAULT '',
  `dustrytype` varchar(255) DEFAULT '',
  `company_type` int(11) DEFAULT '0',
  `company_scale` int(11) DEFAULT '0',
  `company_properties` int(11) NOT NULL DEFAULT '0',
  `live_gnd_p` int(11) DEFAULT '0',
  `live_gnd_c` int(11) DEFAULT '0',
  `live_address` varchar(254) DEFAULT NULL,
  `postcode` varchar(255) CHARACTER SET utf8 DEFAULT '',
  `address` varchar(255) CHARACTER SET utf8 DEFAULT '',
  `contact` varchar(255) CHARACTER SET utf8 NOT NULL,
  `tel` varchar(255) CHARACTER SET utf8 NOT NULL,
  `mobile` varchar(255) CHARACTER SET utf8 NOT NULL,
  `dtype` tinyint(1) NOT NULL,
  `durl` varchar(255) CHARACTER SET utf8 DEFAULT '',
  `email` varchar(255) CHARACTER SET utf8 NOT NULL,
  `logo` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '企业LOGO',
  `info` text CHARACTER SET utf8,
  `status` int(11) DEFAULT '1',
  `createtime` int(11) NOT NULL DEFAULT '0',
  `lasttime` int(11) NOT NULL DEFAULT '0',
  `ip` varchar(255) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`id`),
  KEY `dustrytype` (`dustrytype`),
  KEY `status` (`status`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `zp_e_user`
--

INSERT INTO `zp_e_user` (`id`, `username`, `password`, `company`, `company_s`, `dustrytype`, `company_type`, `company_scale`, `company_properties`, `live_gnd_p`, `live_gnd_c`, `live_address`, `postcode`, `address`, `contact`, `tel`, `mobile`, `dtype`, `durl`, `email`, `logo`, `info`, `status`, `createtime`, `lasttime`, `ip`) VALUES
(2, 'ct', 'f379eaf3c831b04de153469d1bec345e', 'ct', 'ct', '1', 1, 1, 1, 1, 418, '', '200001', 'ct address', 'ct', '14333333', '13897878767', 0, '', 'ct@1.com', '', 'company intro<br />', 2, 1330328161, 1330328223, '58.246.139.98'),
(3, '', '', '', '', '', 0, 0, 0, 0, 0, NULL, '', '', '', '', '', 0, '', '', NULL, NULL, 1, 1331358029, 0, '123.126.50.78');

-- --------------------------------------------------------

--
-- Table structure for table `zp_faq`
--

DROP TABLE IF EXISTS `zp_faq`;
CREATE TABLE IF NOT EXISTS `zp_faq` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `subject` varchar(250) NOT NULL COMMENT '标题',
  `catid` int(4) unsigned NOT NULL DEFAULT '0' COMMENT '分类',
  `cityids` varchar(250) NOT NULL DEFAULT '0' COMMENT '城市IDS',
  `order_id` int(8) NOT NULL DEFAULT '50' COMMENT '排序',
  `content` text COMMENT '日志内容',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `createdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '发布时间 默认为当前时间',
  PRIMARY KEY (`id`),
  KEY `catid` (`catid`),
  KEY `cityids` (`cityids`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `zp_faq`
--

INSERT INTO `zp_faq` (`id`, `subject`, `catid`, `cityids`, `order_id`, `content`, `status`, `createdate`) VALUES
(1, '关于我们', 1, ',1,', 1, '关于我们关于我们关于我们关于我们', 0, '2011-04-01 16:32:49'),
(2, '网站声明', 1, '0', 2, '<p>网站声明网站声明网站声明网站声明网站声明</p>', 0, '2011-04-01 16:35:47'),
(3, '服务中心', 1, '0', 50, '服务中心<br />afdasd', 0, '2011-07-02 22:45:01');

-- --------------------------------------------------------

--
-- Table structure for table `zp_faq_cat`
--

DROP TABLE IF EXISTS `zp_faq_cat`;
CREATE TABLE IF NOT EXISTS `zp_faq_cat` (
  `id` int(8) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `order_id` int(8) NOT NULL DEFAULT '0',
  `createdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `zp_faq_cat`
--

INSERT INTO `zp_faq_cat` (`id`, `name`, `parent_id`, `order_id`, `createdate`) VALUES
(1, '默认分类', 0, 1, '2011-04-01 16:29:54');

-- --------------------------------------------------------

--
-- Table structure for table `zp_files`
--

DROP TABLE IF EXISTS `zp_files`;
CREATE TABLE IF NOT EXISTS `zp_files` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `file_name` varchar(255) NOT NULL,
  `file_url` varchar(255) NOT NULL,
  `file_small` varchar(255) NOT NULL,
  `file_type` varchar(255) NOT NULL,
  `raw_name` varchar(255) NOT NULL,
  `file_ext` varchar(255) DEFAULT NULL,
  `file_size` varchar(255) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `createdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `status` (`status`),
  KEY `createdate` (`createdate`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `zp_files`
--


-- --------------------------------------------------------

--
-- Table structure for table `zp_friendlinks`
--

DROP TABLE IF EXISTS `zp_friendlinks`;
CREATE TABLE IF NOT EXISTS `zp_friendlinks` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `linkname` varchar(255) NOT NULL,
  `linkurl` varchar(255) NOT NULL,
  `linkimg` varchar(255) DEFAULT NULL,
  `target` enum('_blank','_self') NOT NULL DEFAULT '_blank',
  `rel` enum('follow','nofollow') NOT NULL DEFAULT 'nofollow',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `startdate` int(10) NOT NULL DEFAULT '0',
  `enddate` int(10) NOT NULL DEFAULT '0',
  `displayorder` int(10) NOT NULL DEFAULT '0',
  `createdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `status` (`status`),
  KEY `displayorder` (`displayorder`),
  KEY `startdate` (`startdate`),
  KEY `enddate` (`enddate`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `zp_friendlinks`
--

INSERT INTO `zp_friendlinks` (`id`, `linkname`, `linkurl`, `linkimg`, `target`, `rel`, `status`, `startdate`, `enddate`, `displayorder`, `createdate`) VALUES
(4, '火狐网址大全', 'http://www.huohu123.com/?sr=huohu123', NULL, '_blank', 'nofollow', 1, 1295884800, 2000000000, 0, '2011-01-25 11:22:49'),
(5, '火狐中国版', 'http://firefox.com.cn/?sr=huohu123', NULL, '_blank', 'nofollow', 1, 1295884800, 2000000000, 0, '2011-01-25 11:23:57'),
(6, '搜狗网址导航', 'http://123.sogou.com/', NULL, '_blank', 'nofollow', 1, 1295884800, 2000000000, 0, '2011-01-25 13:56:27');

-- --------------------------------------------------------

--
-- Table structure for table `zp_funtype`
--

DROP TABLE IF EXISTS `zp_funtype`;
CREATE TABLE IF NOT EXISTS `zp_funtype` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `thename` varchar(250) NOT NULL,
  `enname` varchar(250) NOT NULL,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `order_id` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `createdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `parent_id` (`parent_id`),
  KEY `order_id` (`order_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=613 ;

--
-- Dumping data for table `zp_funtype`
--

INSERT INTO `zp_funtype` (`id`, `thename`, `enname`, `parent_id`, `order_id`, `createdate`) VALUES
(4, '店员/营业员/导购员', 'Clerk / Salesperson / Purchasing guide', 3, 0, '2012-03-08 15:17:56'),
(3, '零售业务', 'Retail Business', 0, 0, '2012-03-08 15:16:24'),
(5, '收银员', 'Cashier', 3, 0, '2012-03-08 15:19:03'),
(6, '防损员/内保', 'Loss Prevention Officer / Internal security', 3, 0, '2012-03-08 15:19:48'),
(7, '品类管理', 'Category Management', 3, 0, '2012-03-08 15:20:34'),
(8, '店长/卖场经理', 'Store manager', 3, 0, '2012-03-08 15:21:08'),
(9, '促销专员/导购', 'Promotion Officer / Shopping guide', 3, 0, '2012-03-08 15:21:52'),
(10, '招商经理/主管', 'Investment Manager / Supervisor', 3, 0, '2012-03-08 15:22:23'),
(11, '美容顾问', 'Beauty Consultant', 3, 0, '2012-03-08 15:22:52'),
(13, '理货员/陈列员', 'Tally clerk / Display member', 3, 0, '2012-03-08 15:24:09'),
(14, '库管员', 'Warehouse keeper', 3, 0, '2012-03-08 15:24:35'),
(15, '奢侈品业务', 'Luxury business', 3, 0, '2012-03-08 15:25:49'),
(17, '其他', 'Others', 3, 0, '2012-03-08 15:26:38'),
(18, '销售业务', 'Sales', 0, 0, '2012-03-08 15:35:31'),
(19, '销售代表', 'Sales Representative', 18, 0, '2012-03-08 15:36:39'),
(20, '客户代表', 'Customer representative', 18, 0, '2012-03-08 15:37:09'),
(21, '电话销售', 'Phone Sales', 18, 0, '2012-03-08 15:37:41'),
(22, '销售工程师', 'Sales Engineer', 18, 0, '2012-03-08 15:38:04'),
(23, '渠道/分销专员', 'Channel / distribution Commissioner', 18, 0, '2012-03-08 15:38:30'),
(24, '网站推广', 'Web site promotion', 18, 0, '2012-03-08 15:38:58'),
(25, '团购业务员', 'Buy sales', 18, 0, '2012-03-08 15:39:31'),
(26, '经销商', 'Dealer', 18, 0, '2012-03-08 15:39:55'),
(27, '销售总监', 'Director of Sales', 18, 0, '2012-03-08 15:40:20'),
(28, '销售经理', 'Sales Manager', 18, 0, '2012-03-08 15:40:51'),
(29, '客户经理', 'Account Manager', 18, 0, '2012-03-08 15:41:10'),
(30, '客户主管', 'Account Executive', 18, 0, '2012-03-08 15:42:09'),
(31, '渠道/分销总监', 'Channel / Distribution director', 18, 0, '2012-03-08 15:42:50'),
(32, '渠道/分销经理/主管', 'Channel / Distribution Manager / Supervisor', 18, 0, '2012-03-08 15:43:13'),
(33, '团购经理/主管', 'Buy Manager / Supervisor', 18, 0, '2012-03-08 15:43:37'),
(34, '售前/售后管理', 'Pre / After-sales management', 18, 0, '2012-03-08 15:44:17'),
(35, '销售行政经理/主管', 'Sales Administration Manager / Supervisor', 18, 0, '2012-03-08 15:48:23'),
(36, '销售行政专员/助理', 'Sales Administration Officer / Assistant', 18, 0, '2012-03-08 15:48:59'),
(37, '商务经理/主管', 'Business Manager / Superviso', 18, 0, '2012-03-08 15:49:26'),
(38, '业务分析', 'Business Analysis', 18, 0, '2012-03-08 15:49:56'),
(39, '其他', 'Others', 18, 0, '2012-03-08 15:50:19'),
(40, '客户服务/售后服务', 'Customer service / After-sales service', 0, 0, '2012-03-08 15:55:02'),
(41, '客户服务总监', 'Client Services Director', 40, 0, '2012-03-08 15:55:30'),
(42, '客户服务经理', 'Customer Service Manager', 40, 0, '2012-03-08 15:55:55'),
(43, '客户服务主管', 'Customer Service Supervisor', 40, 0, '2012-03-08 15:56:21'),
(44, '客户关系/投诉/协调人员', 'Customer relations / Complaints / Coordinators', 40, 0, '2012-03-08 15:57:07'),
(45, '客户咨询热线/呼叫中心人员', 'Customer hotline / Call center staff', 40, 0, '2012-03-08 15:57:39'),
(46, '客户服务专员/助理', 'Customer Service Officer / Assistant', 40, 0, '2012-03-08 15:58:12'),
(47, '售前/售后技术支持管理', 'Pre / Post sales technical support management', 40, 0, '2012-03-08 15:58:56'),
(48, '售前/售后技术支持工程师', 'Pre / Post sales technical support engineers', 40, 0, '2012-03-08 15:59:34'),
(49, '其他', 'Others', 40, 0, '2012-03-08 15:59:57'),
(50, '采购/贸易', 'Purchase / Trade', 0, 0, '2012-03-08 16:01:36'),
(51, '采购总监/经理', 'Purchasing Director / Manager', 50, 0, '2012-03-08 16:01:56'),
(52, '采购主管', 'Procurement Officer', 50, 0, '2012-03-08 16:02:26'),
(53, '采购专员/助理', 'Procurement Officer / Assistant', 50, 0, '2012-03-08 16:02:52'),
(54, '外贸/外销员/助理', 'Foreign trade / Business clerk / Assistant', 50, 0, '2012-03-08 16:05:18'),
(55, '外贸/贸易经理/主管', 'Foreign Trade / Trade Manager / Supervisor', 50, 0, '2012-03-08 16:05:48'),
(56, '业务跟单/驻厂员', 'Documentary Handler / Mill staff', 50, 0, '2012-03-08 16:06:10'),
(57, '报关员/制单员', 'Customs declaration / document production staff', 50, 0, '2012-03-08 16:06:37'),
(58, '其他', 'Others', 50, 0, '2012-03-08 16:07:02'),
(59, '计算机软件/硬件', 'Computer software / hardware', 0, 0, '2012-03-08 16:07:29'),
(60, '软件工程师', 'Software Engineer', 59, 0, '2012-03-08 16:07:55'),
(61, '高级软件工程师', 'Senior Software Enginee', 59, 0, '2012-03-08 16:08:22'),
(62, '软件测试', 'Software Testing', 59, 0, '2012-03-08 16:08:44'),
(63, '研发工程师', 'R & D engineers', 59, 0, '2012-03-08 16:09:15'),
(64, '系统工程师', 'Systems Engineer', 59, 0, '2012-03-08 16:09:40'),
(65, '数据库开发工程师', 'Database Development Engineer', 59, 0, '2012-03-08 16:10:01'),
(66, '数据库管理员', 'Database Administrator', 59, 0, '2012-03-08 16:10:24'),
(67, 'ERP技术/开发应用', 'ERP technology / development and application', 59, 0, '2012-03-08 16:10:46'),
(68, '实施工程师', 'Implementation Engineer', 59, 0, '2012-03-08 16:11:07'),
(69, '高级硬件工程师', 'Senior Hardware Engineer', 59, 0, '2012-03-08 16:11:28'),
(70, '硬件工程师', 'Hardware Engineer', 59, 0, '2012-03-08 16:11:52'),
(71, '其他', 'Others', 59, 0, '2012-03-08 16:12:15'),
(72, '互联网/电子商务/网游', 'Internet / E-commerce / Online game', 0, 0, '2012-03-08 16:13:02'),
(73, '网站运营管理', 'Web Operations Management', 72, 0, '2012-03-08 16:13:32'),
(74, '产品经理/主管', 'Product Manager / Supervisor', 72, 0, '2012-03-08 16:13:56'),
(75, '电子商务/SEO', 'E-commerce / SEO', 72, 0, '2012-03-08 16:14:24'),
(76, '网络管理员', 'Network administrator', 72, 0, '2012-03-08 16:14:52'),
(77, '网站编辑', 'Site Editor', 72, 0, '2012-03-08 16:15:14'),
(78, '网页设计/制作', 'Web Design / Production', 72, 0, '2012-03-08 16:15:38'),
(79, '网络工程师', 'Network Engineer', 72, 0, '2012-03-08 16:16:01'),
(80, '互联网研发工程师', 'Internet R & D engineers', 72, 0, '2012-03-08 16:16:24'),
(81, '系统管理员', 'System administrator', 72, 0, '2012-03-08 16:16:49'),
(82, '系统分析师/架构师', 'Systems Analyst / Architect', 72, 0, '2012-03-08 16:17:09'),
(83, '网络与信息安全工程师', 'Network and Information Security Enginee', 72, 0, '2012-03-08 16:17:41'),
(84, '语音/视频/图形', 'Voice / video / graphics', 72, 0, '2012-03-08 16:18:14'),
(85, 'UI/UE设计师/顾问', 'UI / UE designer / consultant', 72, 0, '2012-03-08 16:18:37'),
(86, '三维/3D设计/制作', '3D Design / Production', 72, 0, '2012-03-08 16:19:03'),
(87, 'Flash设计/开发', 'Flash design / development', 72, 0, '2012-03-08 16:19:33'),
(88, '游戏设计/开发', 'Game Design / Development', 72, 0, '2012-03-08 16:19:52'),
(89, '其他', 'Others', 72, 0, '2012-03-08 16:20:12'),
(90, '电信/通信', 'Telecom / Communication', 0, 0, '2012-03-08 16:20:37'),
(91, '无线/射频通信工程师', 'Wireless / RF Communications Engineer', 90, 0, '2012-03-08 16:21:00'),
(92, '电信/通信工程师', 'Telecom / Communications Engineer', 90, 0, '2012-03-08 16:21:23'),
(93, '通信电源工程师', 'Communication power engineers', 90, 0, '2012-03-08 16:21:48'),
(94, '移动通信工程师', 'Mobile Engineer', 90, 0, '2012-03-08 16:22:11'),
(95, '电信网络工程师', 'Telecommunications Network Engineer', 90, 0, '2012-03-08 16:22:42'),
(96, '电信交换工程师', 'Telecommunication switching engineers', 90, 0, '2012-03-08 16:23:24'),
(97, '数据通信工程师', 'Data Communications Enginee', 90, 0, '2012-03-08 16:23:46'),
(98, '有线传输工程师', 'Cable transmission engineer', 90, 0, '2012-03-08 16:24:09'),
(99, '项目经理/主管', 'Project Manager / Supervisor', 90, 0, '2012-03-08 16:24:30'),
(100, '标准化工程师', 'Standardization Engineer', 90, 0, '2012-03-08 16:24:55'),
(101, '研发工程师', 'R & D engineers', 90, 0, '2012-03-08 16:25:21'),
(102, '其他', 'Others', 90, 0, '2012-03-08 16:25:51'),
(103, '电子/电气/半导体/仪器仪表', 'Electrical / Electronic / Semiconductor / Instrument', 0, 0, '2012-03-08 16:29:59'),
(104, 'IT支持', 'IT support', 0, 0, '2012-03-08 16:30:21'),
(105, '建筑/装修', 'Construction / renovation', 0, 0, '2012-03-08 16:30:48'),
(106, '房地产开发/经纪/中介', 'Real estate development / brokerage / intermediary', 0, 0, '2012-03-08 16:31:11'),
(107, '物业管理', 'Property Management', 0, 0, '2012-03-08 16:31:30'),
(108, '财务/审计/税务', 'Finance / Audit / Taxation', 0, 0, '2012-03-08 16:31:52'),
(109, '银行', 'Bank', 0, 0, '2012-03-08 16:32:12'),
(110, '金融/证券/期货/投资', 'Financial / Securities / Futures / Investment', 0, 0, '2012-03-08 16:32:37'),
(111, '保险', 'Insurance', 0, 0, '2012-03-08 16:33:04'),
(112, '汽车/摩托车制造', 'Car/Motorcycle manufacturing', 0, 0, '2012-03-08 16:33:46'),
(113, '汽车销售与服务', 'Automobile sales and service', 0, 0, '2012-03-08 16:34:10'),
(114, '工程机械', 'Construction Machinery', 0, 0, '2012-03-08 16:34:33'),
(115, '生产/加工/制造', 'Production / Processing / Manufacturing', 0, 0, '2012-03-08 16:35:14'),
(116, '交通运输', 'Transportation', 0, 0, '2012-03-08 16:35:49'),
(117, '服装/纺织/食品/饮料', 'Apparel / Textile / Food / Beverage', 0, 0, '2012-03-08 16:36:25'),
(118, '物流/仓储', 'Logistics / Warehousing', 0, 0, '2012-03-08 16:36:47'),
(119, '技工', 'Skilled worker', 0, 0, '2012-03-08 16:37:19'),
(120, '质量控制/安全防护', 'Quality control / Security', 0, 0, '2012-03-08 16:37:53'),
(121, '市场/营销', 'Marketing / Sales', 0, 0, '2012-03-08 16:38:20'),
(122, '公关/媒介', 'PR / Media', 0, 0, '2012-03-08 16:38:39'),
(123, '美术/设计/创意', 'Art / Design / Creative', 0, 0, '2012-03-08 16:39:00'),
(124, '广告/会展', 'Advertising / Exhibition', 0, 0, '2012-03-08 16:39:20'),
(125, '传媒/影视/报刊/出版/印刷', 'Media / TV / Newspaper / Publication / Printing', 0, 0, '2012-03-08 16:40:15'),
(126, '生物工程/制药/医疗器械', 'Biotechnology / Pharmaceutical / Medical Device', 0, 0, '2012-03-08 16:40:46'),
(127, '化工', 'Chemical industry', 0, 0, '2012-03-08 16:41:06'),
(128, '环境科学/环保', 'Environmental Science / Environmental Protection', 0, 0, '2012-03-08 16:41:33'),
(129, '能源/矿产/地质勘查', 'Energy / Mining / Geological Survey', 0, 0, '2012-03-08 16:42:00'),
(130, '高级管理', 'Senior Management', 0, 0, '2012-03-08 16:42:20'),
(131, '人力资源', 'Human Resources', 0, 0, '2012-03-08 16:42:45'),
(132, '行政/后勤/文秘', 'Administrative / Logistical / Secretarial', 0, 0, '2012-03-08 16:43:23'),
(133, '咨询/顾问', 'Advisory / Consultancy', 0, 0, '2012-03-08 16:43:47'),
(134, '教育/培训', 'Education / Training', 0, 0, '2012-03-08 16:44:08'),
(135, '律师/法务', 'Law / Legal', 0, 0, '2012-03-08 16:44:31'),
(136, '翻译', 'Translation', 0, 0, '2012-03-08 16:44:52'),
(137, '酒店/餐饮/旅游/娱乐', 'Hotel / Catering / Tourism / Entertainment', 0, 0, '2012-03-08 16:45:17'),
(138, '保健/美容/美发/健身', 'Health / Beauty / Beauty / Fitness', 0, 0, '2012-03-08 16:45:39'),
(139, '医疗/护理', 'Medical / Nursing', 0, 0, '2012-03-08 16:46:03'),
(140, '保安/家政', 'Security / Home Economics', 0, 0, '2012-03-08 16:46:23'),
(141, '其他', 'Others', 0, 0, '2012-03-08 16:46:42'),
(142, '半导体技术', 'Semiconductor technology', 103, 0, '2012-03-08 16:53:53'),
(143, '研发工程师', 'R & D engineers', 103, 0, '2012-03-08 16:55:12'),
(144, '无线电工程师', 'Radio engineer', 103, 0, '2012-03-08 16:59:54'),
(145, '测试/可靠性工程师', 'Test / Reliability Engineer', 103, 0, '2012-03-08 17:01:38'),
(146, '项目管理/产品管理', 'Project Management / Product Management', 103, 0, '2012-03-08 17:02:15'),
(147, '产品工艺/规划/制程工程师', 'Product Process / Planning / Process Engineer', 103, 0, '2012-03-08 17:02:50'),
(148, '销售/经纪人', 'Sales / Broker', 113, 0, '2012-03-08 17:03:31'),
(149, '物流总监/经理', 'Logistics Director / Manager', 118, 0, '2012-03-08 17:03:41'),
(150, '首席财务官CFO', 'CFO', 108, 0, '2012-03-08 17:03:45'),
(151, '物流主管', 'Logistics director', 118, 0, '2012-03-08 17:04:13'),
(152, '汽车/摩托车修理', 'Car / Motorcycle repair', 113, 0, '2012-03-08 17:04:14'),
(153, '财务总监', 'CFO', 108, 0, '2012-03-08 17:04:21'),
(154, '灯光/照明', 'Equipment / Instrumentation / Measurement', 103, 0, '2012-03-08 17:04:23'),
(155, '售后服务/客户服务', 'Service / Customer Service', 113, 0, '2012-03-08 17:04:40'),
(156, '物流专员/助理', 'Logistics Officer / Assistant', 118, 0, '2012-03-08 17:04:40'),
(157, '财务经理', 'Finance Manager', 108, 0, '2012-03-08 17:04:47'),
(158, 'IC验证工程师', 'IC verification engineer', 103, 0, '2012-03-08 17:04:49'),
(159, '4S店管理', '4S store management', 113, 0, '2012-03-08 17:04:59'),
(160, '仓库经理/主管', 'Warehouse Manager / Supervisor', 118, 0, '2012-03-08 17:05:14'),
(161, '零配件销售', 'Parts Sales', 113, 0, '2012-03-08 17:05:14'),
(162, '财务主管/总帐主管', 'Finance director / General ledger charge', 108, 0, '2012-03-08 17:05:25'),
(163, '集成电路IC设计/应用工程师', 'IC Design / Applications Engineer', 103, 0, '2012-03-08 17:05:32'),
(164, '装饰美容', 'Decorative Beauty', 113, 0, '2012-03-08 17:05:37'),
(165, '仓库/物料管理员', 'Warehouse / Material Manager', 118, 0, '2012-03-08 17:05:39'),
(166, '检验检测', 'Inspection', 113, 0, '2012-03-08 17:05:55'),
(167, '财务分析经理/主管', 'Financial Analysis Manager / Supervisor', 108, 0, '2012-03-08 17:05:56'),
(168, '供应链管理', 'Supply Chain Management', 118, 0, '2012-03-08 17:06:11'),
(169, '二手车评估师', 'Used car appraiser', 113, 0, '2012-03-08 17:06:13'),
(170, '成本经理/主管', 'Cost Manager / Supervisor', 108, 0, '2012-03-08 17:06:21'),
(171, '其他', 'Others', 113, 0, '2012-03-08 17:06:33'),
(172, '运输经理/主管', 'Transportation Manager / Supervisor', 118, 0, '2012-03-08 17:06:39'),
(173, '家用电器/数码产品研发', 'Appliances / Digital product development', 103, 0, '2012-03-08 17:06:42'),
(174, '会计经理/主管', 'Accounting Manager / Supervisor', 108, 0, '2012-03-08 17:06:46'),
(175, '工程机械经理', 'Construction Machinery Manager', 114, 0, '2012-03-08 17:06:54'),
(176, '会计师', 'Accountants', 108, 0, '2012-03-08 17:07:07'),
(177, '快递员/速递员', 'Courier', 118, 0, '2012-03-08 17:07:09'),
(178, '工程机械主管', 'Charge of construction machinery', 114, 0, '2012-03-08 17:07:14'),
(179, 'FAE现场应用工程师', 'FAE Field Application Engineer', 103, 0, '2012-03-08 17:07:18'),
(180, '会计', 'Accounting', 108, 0, '2012-03-08 17:07:27'),
(181, '调度员', 'Dispatcher', 118, 0, '2012-03-08 17:07:31'),
(182, '工程/设备工程师', 'Engineering / Equipment Engineer', 114, 0, '2012-03-08 17:07:44'),
(183, '成本会计', 'Cost accounting', 108, 0, '2012-03-08 17:07:47'),
(184, '单证员', 'Vouching', 118, 0, '2012-03-08 17:07:49'),
(185, '机械工程师', 'Mechanical Engineer', 114, 0, '2012-03-08 17:08:03'),
(186, '出纳员', 'Teller', 108, 0, '2012-03-08 17:08:08'),
(187, '搬运工', 'Porter', 118, 0, '2012-03-08 17:08:10'),
(188, '设备工程师（调试/安装/维护）', 'Equipment Engineer (commissioning / Installation / Maintenance', 103, 0, '2012-03-08 17:08:15'),
(189, '技术研发工程师', 'R & D engineers', 114, 0, '2012-03-08 17:08:23'),
(190, '审计经理/主管', 'Audit Manager / Supervisor', 108, 0, '2012-03-08 17:08:31'),
(191, '其他', 'Others', 118, 0, '2012-03-08 17:08:36'),
(192, '技术文档工程师', 'Technical Documentation Engineer', 114, 0, '2012-03-08 17:08:40'),
(193, '嵌入式硬件/软件工程师', 'Embedded Hardware / Software Engineer', 103, 0, '2012-03-08 17:08:42'),
(194, '审计专员/助理', 'Audit Officer / Assistant', 108, 0, '2012-03-08 17:08:51'),
(195, '产品工艺/制程工程师', 'Product Process / Process Enginee', 114, 0, '2012-03-08 17:08:58'),
(196, '资产/资金管理', 'Asset / Fund management', 108, 0, '2012-03-08 17:09:16'),
(197, '结构工程师', 'Structural Engineers', 114, 0, '2012-03-08 17:09:17'),
(198, '电子/电气工程师', 'Electronic / Electrical engineer', 103, 0, '2012-03-08 17:09:23'),
(199, '车床/磨床/铣床/冲床工', 'Turning / Grinding / Milling / Punch worker', 119, 0, '2012-03-08 17:09:27'),
(200, '气动工程师', 'Pneumatic Engineers', 114, 0, '2012-03-08 17:09:36'),
(201, '财务助理/会计助理', 'Finance Assistant / Accounting Assistan', 108, 0, '2012-03-08 17:09:37'),
(202, '电子/电器维修', 'Electronic / Electrical maintenance', 103, 0, '2012-03-08 17:09:59'),
(203, '模具工程师', 'Tooling engineers', 114, 0, '2012-03-08 17:10:01'),
(204, '税务经理/主管', 'Tax Manager / Supervisor', 108, 0, '2012-03-08 17:10:05'),
(205, '钳工/钣工', 'Fitter / Sheet metal work', 119, 0, '2012-03-08 17:10:12'),
(206, '机械设计师', 'Mechanical Designer', 114, 0, '2012-03-08 17:10:13'),
(207, '税务专员/助理', 'Tax Commissioner / Assistant', 108, 0, '2012-03-08 17:10:26'),
(208, '电路工程师/技术员', 'Circuit Engineer / Technician', 103, 0, '2012-03-08 17:10:26'),
(209, '机械制图员', 'Mechanical draftsman', 114, 0, '2012-03-08 17:10:29'),
(210, '电焊工/铆焊工', 'Welders', 119, 0, '2012-03-08 17:10:37'),
(211, '维修工程师', 'Maintenance Engineer', 114, 0, '2012-03-08 17:10:43'),
(212, '机电工程师', 'Electrical and Mechanical Engineer', 103, 0, '2012-03-08 17:10:54'),
(213, '统计员', 'Statistician', 108, 0, '2012-03-08 17:10:56'),
(214, '电工', 'Electrician', 119, 0, '2012-03-08 17:10:58'),
(215, '财务分析员', 'Financial Analyst', 108, 0, '2012-03-08 17:11:20'),
(216, '电子元器件工程师', 'Electronics Engineer', 103, 0, '2012-03-08 17:11:23'),
(217, '铸造/锻造工程师/技师', 'Casting / Forging engineers / Technicians', 114, 0, '2012-03-08 17:11:31'),
(218, '汽车修理工/机修工', 'Auto mechanic / Mechanic', 119, 0, '2012-03-08 17:11:32'),
(219, '电池/电源开发', 'Battery / Power Development', 103, 0, '2012-03-08 17:11:48'),
(220, '其他', 'Others', 108, 0, '2012-03-08 17:11:48'),
(221, 'CNC/数控工程师', 'CNC Engineer', 114, 0, '2012-03-08 17:11:51'),
(222, '银行经理/主任', 'Bank Manager / Director', 109, 0, '2012-03-08 17:12:16'),
(223, '自动化工程师', 'Automation Engineer', 103, 0, '2012-03-08 17:12:20'),
(224, '水工/木工/油漆工', 'Hydraulic / Carpenter / Painter', 119, 0, '2012-03-08 17:12:21'),
(225, '银行会计/柜员', 'Bank accounting / Teller', 109, 0, '2012-03-08 17:12:43'),
(226, '模具工', 'Mold Industry', 119, 0, '2012-03-08 17:12:46'),
(227, '音频/视频工程师/技术员', 'Audio / Video Engineer / Technician', 103, 0, '2012-03-08 17:13:01'),
(228, '信用卡/银行卡业务', 'Credit card / Bank card business', 109, 0, '2012-03-08 17:13:09'),
(229, '普工', 'Ordinary workers', 119, 0, '2012-03-08 17:13:09'),
(230, '信贷管理/资信评估', 'Credit Management / Credit Rating', 109, 0, '2012-03-08 17:13:36'),
(231, '模拟电路设计/应用工程师', 'Analog Circuit Design / Applications Engineer', 103, 0, '2012-03-08 17:13:38'),
(401, '环境工程技术/园林景区', 'Environmental Engineering Technology / Garden area', 128, 0, '2012-03-08 17:36:05'),
(233, '铲车/叉车工', 'Forklift truck / Forklift operator', 119, 0, '2012-03-08 17:13:40'),
(234, '客户服务', 'Customer Service', 109, 0, '2012-03-08 17:14:00'),
(235, '空调工程/设计', 'Air-conditioning engineering / Design', 103, 0, '2012-03-08 17:14:13'),
(236, '空调工/电梯工/锅炉工', 'Air-conditioning engineering / Elevator workers / Kotelshchik', 119, 0, '2012-03-08 17:14:21'),
(237, '公司业务', 'Business', 109, 0, '2012-03-08 17:14:22'),
(238, '其他', 'Others', 114, 0, '2012-03-08 17:14:35'),
(239, '个人业务', 'Personal business', 109, 0, '2012-03-08 17:14:42'),
(240, '其他', 'Others', 119, 0, '2012-03-08 17:14:45'),
(241, '其他', 'Others', 103, 0, '2012-03-08 17:15:00'),
(242, '其他', 'Others', 109, 0, '2012-03-08 17:15:03'),
(243, '工厂厂长/副厂长', 'Factory director / Assistant director', 115, 0, '2012-03-08 17:15:24'),
(244, '质量管理/测试经理(QA/QC经理)', 'QA / QC Manager', 120, 0, '2012-03-08 17:15:39'),
(245, '首席技术官CTO/首席信息官CIO', 'CTO / CIO', 104, 0, '2012-03-08 17:15:45'),
(246, '生产总监/经理/车间主任', 'Production Director / Manager / Workshop Directo', 115, 0, '2012-03-08 17:15:55'),
(247, '质量管理/测试主管(QA/QC主管)', 'QA/QC Supervisor', 120, 0, '2012-03-08 17:16:04'),
(248, '证券总监/部门经理', 'Securities Director / Department Manager', 110, 0, '2012-03-08 17:16:11'),
(249, '技术总监/经理', 'Technical Director / Manager', 104, 0, '2012-03-08 17:16:15'),
(250, '证券/期货/外汇经纪人', 'Securities / Futures / Forex brokers', 110, 0, '2012-03-08 17:16:32'),
(251, '质量检验员/测试员', 'Quality Inspector / Tester', 120, 0, '2012-03-08 17:16:33'),
(252, '信息技术经理/主管', 'Information Technology Manager / Supervisor', 104, 0, '2012-03-08 17:16:45'),
(253, '质量管理/测试工程师(QA/QC工程师)', 'QA / QC Engineer', 120, 0, '2012-03-08 17:16:54'),
(254, '证券分析/金融研究', 'Securities Analysis / Financial Research', 110, 0, '2012-03-08 17:16:54'),
(255, '安全消防', 'Fire Safety', 120, 0, '2012-03-08 17:17:15'),
(256, '信息技术专员', 'Information Technology Officer', 104, 0, '2012-03-08 17:17:18'),
(257, '客户经理/主管', 'Account Manager / Supervisor', 110, 0, '2012-03-08 17:17:21'),
(258, '认证/体系工程师/审核员', 'Certification / System Engineer / Auditor', 120, 0, '2012-03-08 17:17:37'),
(259, '投资/理财服务', 'Investment / Financial Services', 110, 0, '2012-03-08 17:17:43'),
(260, '技术支持/维护经理', 'Technical Support / Maintenance Manager', 104, 0, '2012-03-08 17:17:44'),
(261, '项目经理/主管', 'Project Manager / Supervisor', 110, 0, '2012-03-08 17:18:02'),
(262, '供应商/采购设备与材料质量管理', 'Supplier / Procurement of equipment and materials quality control', 120, 0, '2012-03-08 17:18:06'),
(263, '技术支持/维护工程师', 'Technical Support / Maintenance Engineer', 104, 0, '2012-03-08 17:18:10'),
(264, '融资总监', 'Finance Director', 110, 0, '2012-03-08 17:18:21'),
(265, '项目经理/主管', 'Project Manager / Supervisor', 115, 0, '2012-03-08 17:18:25'),
(573, '医药质检', 'Pharmaceutical Quality', 139, 0, '2012-03-08 18:01:19'),
(267, '安全管理', 'Security Management', 120, 0, '2012-03-08 17:18:30'),
(268, '项目经理/主管', 'Project Manager / Supervisor', 104, 0, '2012-03-08 17:18:40'),
(269, '投资银行业务', 'Investment Banking', 110, 0, '2012-03-08 17:18:40'),
(270, '质量管理', 'Quality Management', 115, 0, '2012-03-08 17:18:42'),
(271, 'HSE工程师', 'HSE Engineer', 120, 0, '2012-03-08 17:18:57'),
(272, '融资经理/融资主管/专员', 'Finance Manager / Finance Director / Commissioner', 110, 0, '2012-03-08 17:19:06'),
(273, '质量工程师', 'Quality Engineer', 104, 0, '2012-03-08 17:19:10'),
(274, '生产主管/督导/组长', 'Production manager / Supervisor / Team leader', 115, 0, '2012-03-08 17:19:16'),
(275, '其他', 'Others', 120, 0, '2012-03-08 17:19:19'),
(276, '股票/期货操盘手', 'Stock / Futures Trader', 110, 0, '2012-03-08 17:19:28'),
(277, '制造工程师', 'Manufacturing Engineer', 115, 0, '2012-03-08 17:19:33'),
(278, '其他', 'Others', 104, 0, '2012-03-08 17:19:37'),
(279, '市场总监', 'Marketing Director', 121, 0, '2012-03-08 17:19:41'),
(280, '项目工程师', 'Project Engineer', 115, 0, '2012-03-08 17:19:52'),
(281, '风险管理/控制/稽查', 'Risk management / Control / Inspection', 110, 0, '2012-03-08 17:19:58'),
(282, '高级建筑工程师/总工', 'Senior Construction Engineer / Chief Enginee', 105, 0, '2012-03-08 17:20:04'),
(283, '维修工程师', 'Maintenance Engineer', 115, 0, '2012-03-08 17:20:07'),
(284, '市场营销经理', 'Marketing Manage', 121, 0, '2012-03-08 17:20:11'),
(285, '基金管理', 'Fund Management', 110, 0, '2012-03-08 17:20:22'),
(286, '铸造/锻造/注塑工程师', 'Casting / Forging / Injection Engineers', 115, 0, '2012-03-08 17:20:25'),
(287, '市场拓展经理/主管', 'Marketing Manager / Supervisor', 121, 0, '2012-03-08 17:20:32'),
(288, '建筑师/土建工程师', 'Architect / Civil engineer', 105, 0, '2012-03-08 17:20:34'),
(289, '工业工程师', 'Industrial Engineer', 115, 0, '2012-03-08 17:20:39'),
(290, '外汇交易/基金/国债经理人', 'Foreign exchange / Fund / Treasury Manager', 110, 0, '2012-03-08 17:20:46'),
(291, '市场专员/市场助理', 'Marketing Specialist / Marketing Assistant', 121, 0, '2012-03-08 17:20:53'),
(292, '生产计划', 'Production planning', 115, 0, '2012-03-08 17:20:56'),
(293, '资产评估', 'Asset valuation', 110, 0, '2012-03-08 17:21:05'),
(294, '工程监理/质量工程师', 'Project Management / Quality Engineer', 105, 0, '2012-03-08 17:21:07'),
(295, '设备管理', 'Device Management', 115, 0, '2012-03-08 17:21:17'),
(296, '市场经理', 'Marketing Manager', 121, 0, '2012-03-08 17:21:24'),
(297, '担保/拍卖/典当业务', 'Guarantee / Auction / Pawn business', 110, 0, '2012-03-08 17:21:40'),
(405, '环保技术', 'Environmental technology', 128, 0, '2012-03-08 17:37:00'),
(299, '给排水工程/暖通/制冷工程', 'Water supply and drainage / HVAC / Refrigeration Engineering', 105, 0, '2012-03-08 17:21:45'),
(300, '产品开发/技术/工艺', 'Product development / Technology / Process', 115, 0, '2012-03-08 17:21:51'),
(301, '市场营销主管', 'Marketing Manager', 121, 0, '2012-03-08 17:21:54'),
(302, '储备经理人', 'Reserve managers', 110, 0, '2012-03-08 17:22:04'),
(303, '化验/检验', 'Test / Inspection', 115, 0, '2012-03-08 17:22:10'),
(304, '结构工程师', 'Structural Engineers', 105, 0, '2012-03-08 17:22:12'),
(305, '其他', 'Others', 110, 0, '2012-03-08 17:22:25'),
(306, '市场拓展专员/助理', 'Marketing Specialist / Assistant', 121, 0, '2012-03-08 17:22:25'),
(307, '仓库物料', 'Storage of materials', 115, 0, '2012-03-08 17:22:26'),
(308, '电气设计', 'Electrical Design', 105, 0, '2012-03-08 17:22:38'),
(309, '采购管理', 'Procurement management', 115, 0, '2012-03-08 17:22:43'),
(310, '业务经理/主管', 'Business Manager / Supervisor', 111, 0, '2012-03-08 17:22:50'),
(311, '市场营销专员/助理', 'Marketing Specialist / Assistant', 121, 0, '2012-03-08 17:22:51'),
(312, '包装工程师', 'Packaging Engineer', 115, 0, '2012-03-08 17:23:03'),
(313, '造价师/预算师', 'Cost Engineer / Budget Division', 105, 0, '2012-03-08 17:23:04'),
(314, '项目经理/主管', 'Project Manager / Supervisor', 111, 0, '2012-03-08 17:23:09'),
(315, '产品/品牌经理', 'Product / Brand Manager', 121, 0, '2012-03-08 17:23:11'),
(316, '材料工程师', 'Materials Engineer', 115, 0, '2012-03-08 17:23:17'),
(317, '项目管理/招投标', 'Project management / Bidding', 105, 0, '2012-03-08 17:23:30'),
(348, '会务专员', 'Conference commissioner', 121, 0, '2012-03-08 17:28:02'),
(319, '其他', 'Others', 115, 0, '2012-03-08 17:23:35'),
(320, '产品/品牌主管', 'Product / Brand manager', 121, 0, '2012-03-08 17:23:39'),
(415, '石油天然气技术人员', 'Oil and gas technician', 129, 0, '2012-03-08 17:38:40'),
(322, '司机/驾驶员', 'Driver', 116, 0, '2012-03-08 17:23:57'),
(323, '城市规划', 'City planning', 105, 0, '2012-03-08 17:24:08'),
(324, '航空/列车/船舶操作维修', 'Air / Train / Ship Operations and Maintenance', 116, 0, '2012-03-08 17:24:16'),
(425, '业务拓展', 'Business Development', 124, 0, '2012-03-08 17:40:35'),
(426, '行政总监', 'Commissioner Director', 132, 0, '2012-03-08 17:40:42'),
(326, '产品/品牌专员/助理', 'Product / brand Commissioner / Assistant', 121, 0, '2012-03-08 17:24:37'),
(327, '市政工程师', 'Municipal Enginee', 105, 0, '2012-03-08 17:24:40'),
(329, '航空/列车/船舶乘务', 'Air / Train / Ship crew', 116, 0, '2012-03-08 17:24:59'),
(424, '项目管理', 'Project Management', 124, 0, '2012-03-08 17:40:19'),
(331, '公交/地铁', 'Bus / Metro', 116, 0, '2012-03-08 17:25:13'),
(332, '室内外装潢设计', 'Indoor and outdoor decoration design', 105, 0, '2012-03-08 17:25:17'),
(422, '客户主管/专员', 'Account Executive / Officer', 124, 0, '2012-03-08 17:40:05'),
(335, '景观/园林设计', 'Landscape / Garden design', 105, 0, '2012-03-08 17:25:47'),
(336, '市场主管', 'Marketing Manager', 121, 0, '2012-03-08 17:26:03'),
(337, '飞机/列车/船舶设计与制造', 'Plane / Train / Ship design and manufacture', 116, 0, '2012-03-08 17:26:07'),
(421, '客户总监/经理', 'Account Director / Manager', 124, 0, '2012-03-08 17:39:49'),
(339, '幕墙工程师', 'Curtain wall engineers', 105, 0, '2012-03-08 17:26:20'),
(340, '市场调研与分析', 'Market research and analysis', 121, 0, '2012-03-08 17:26:26'),
(342, '市场策划/企划经理/主管', 'Marketing / Planning Manager / Supervisor', 121, 0, '2012-03-08 17:26:46'),
(439, '婚礼策划服务', 'Wedding planning services', 124, 0, '2012-03-08 17:42:31'),
(427, '电力工程师/技术员', 'Electrical Engineer / Technician', 129, 0, '2012-03-08 17:40:53'),
(344, '市场策划/企划专员/助理', 'Marketing / Planning Commissioner / Assistant', 121, 0, '2012-03-08 17:27:09'),
(345, '智能大厦/布线/弱电/安防', 'Intelligent building / Wiring / Weak / Security', 105, 0, '2012-03-08 17:27:17'),
(346, '促销督导', 'Promotion Steering', 121, 0, '2012-03-08 17:27:41'),
(347, '其他', 'Others', 116, 0, '2012-03-08 17:27:44'),
(349, '测绘/测量/制图', 'Surveying / Measuring / Mapping', 105, 0, '2012-03-08 17:28:27'),
(350, '其他', 'Others', 121, 0, '2012-03-08 17:28:28'),
(351, '服装/店面/纺织设计', 'Clothing / Shop / Textile design', 117, 0, '2012-03-08 17:28:30'),
(352, '公关总监/经理', 'Public Relations Director / Manager', 122, 0, '2012-03-08 17:28:53'),
(353, '面料辅料开发/采购', 'Fabrics & Accessories development / Procurement', 117, 0, '2012-03-08 17:29:12'),
(354, '铁路/道路/桥梁技术', 'Rail / Road / Bridge technology', 105, 0, '2012-03-08 17:29:14'),
(355, '公关主管', 'Public relations executive', 122, 0, '2012-03-08 17:29:23'),
(356, '服装打样/制版', 'Clothing proofing / Plate', 117, 0, '2012-03-08 17:29:35'),
(357, '公关专员/助理', 'Public Relations Officer / Assistant', 122, 0, '2012-03-08 17:29:44'),
(358, '项目经理/主管', 'Project Manager / Supervisor', 117, 0, '2012-03-08 17:29:54'),
(359, '安全管理/安全员', 'Safety Management / Safety Officer', 105, 0, '2012-03-08 17:29:55'),
(420, '其他', 'Others', 107, 0, '2012-03-08 17:39:17'),
(361, '生产管理', 'Production management', 117, 0, '2012-03-08 17:30:08'),
(362, '媒介经理/主管', 'Media Manager / Supervisor', 122, 0, '2012-03-08 17:30:10'),
(418, '其他', 'Others', 123, 0, '2012-03-08 17:38:58'),
(364, '施工员', 'Construction workers', 105, 0, '2012-03-08 17:30:28'),
(365, '服装/纺织/皮革跟单', 'Apparel / Textile / Leather Documentary Handler', 117, 0, '2012-03-08 17:30:32'),
(366, '媒介专员/媒介购买', 'Media Specialist / Media buying', 122, 0, '2012-03-08 17:30:43'),
(367, '销售/市场推广', 'Sales / Marketing', 117, 0, '2012-03-08 17:30:47'),
(419, '空调/热能工程师', 'Air conditioning / Heat engineers', 129, 0, '2012-03-08 17:39:11'),
(369, '质量管理/验货员(QA/QC)', 'QA/QC', 117, 0, '2012-03-08 17:31:01'),
(370, '其他', 'Others', 105, 0, '2012-03-08 17:31:04'),
(371, '项目工程管理', 'Project Management', 112, 0, '2012-03-08 17:31:12'),
(372, '其他', 'Others', 122, 0, '2012-03-08 17:31:13'),
(373, '样衣工', 'Sample clothing Producer', 117, 0, '2012-03-08 17:31:17'),
(374, '裁床', 'Cutting', 117, 0, '2012-03-08 17:31:29'),
(375, '设计工程师', 'Design Engineer', 112, 0, '2012-03-08 17:31:33'),
(376, '研发工程师', 'R & D engineers', 112, 0, '2012-03-08 17:31:51'),
(377, '食品/饮料研发检验', 'Food / Beverage R & D test', 117, 0, '2012-03-08 17:31:56'),
(378, '其他', 'Others', 117, 0, '2012-03-08 17:32:14'),
(379, '发动机/底盘/总装工程师', 'Engine / Chassis / Assembly engineers', 112, 0, '2012-03-08 17:32:28'),
(380, '房地产中介/交易', 'Real estate agents / Trading', 106, 0, '2012-03-08 17:32:32'),
(381, '机械工程师', 'Mechanical Engineer', 112, 0, '2012-03-08 17:33:01'),
(473, '其他', 'Others', 132, 0, '2012-03-08 17:46:34'),
(383, '电子工程师', 'Electronics Engineer', 112, 0, '2012-03-08 17:33:25'),
(384, '房地产开发/策划', 'Real Estate Development / Planning', 106, 0, '2012-03-08 17:33:32'),
(385, '创意指导/总监', 'Creative Director / Director', 123, 0, '2012-03-08 17:33:34'),
(386, '安全性能工程师', 'Safety engineer', 112, 0, '2012-03-08 17:33:45'),
(387, '美术编辑/美术设计', 'Art Editor / Art and Design', 123, 0, '2012-03-08 17:33:50'),
(388, '装配工艺工程师', 'Assembly process engineer', 112, 0, '2012-03-08 17:34:03'),
(389, '项目管理/招投标', 'Project management / Bidding', 106, 0, '2012-03-08 17:34:11'),
(390, '产品/包装设计', 'Product / Packaging design', 123, 0, '2012-03-08 17:34:12'),
(391, '理赔专员/顾问', 'Claims Specialist / Consultant', 112, 0, '2012-03-08 17:34:25'),
(392, '展示/装潢设计', 'Show / Interior design', 123, 0, '2012-03-08 17:34:36'),
(393, '房地产评估', 'Real estate appraisal', 106, 0, '2012-03-08 17:34:36'),
(394, '其他', 'Others', 112, 0, '2012-03-08 17:34:44'),
(395, '其他', 'Others', 106, 0, '2012-03-08 17:35:01'),
(396, '平面设计', 'Graphic Design', 123, 0, '2012-03-08 17:35:20'),
(397, '污水处理工程师', 'Wastewater treatment engineers', 128, 0, '2012-03-08 17:35:24'),
(398, '家具设计', 'Furniture Design', 123, 0, '2012-03-08 17:35:34'),
(399, '工艺品/珠宝设计', 'Crafts / Jewelry Design', 123, 0, '2012-03-08 17:35:49'),
(404, '物业管理专员/助理', 'Property Management Officer / Assistant', 107, 0, '2012-03-08 17:36:52'),
(402, '物业经理/主管', 'Property Manager / Supervisor', 107, 0, '2012-03-08 17:36:23'),
(403, '环境管理/保护', 'Environmental management / Protection', 128, 0, '2012-03-08 17:36:35'),
(406, '招商经理/主管', 'Investment Manager / Supervisor', 107, 0, '2012-03-08 17:37:21'),
(407, 'EHS管理', 'EHS Management', 128, 0, '2012-03-08 17:37:25'),
(408, '店面/陈列/展览设计', 'Store / Display / Exhibit design', 123, 0, '2012-03-08 17:37:31'),
(409, '多媒体/动画设计', 'Multimedia / Animation Design', 123, 0, '2012-03-08 17:37:48'),
(410, '其他', 'Others', 128, 0, '2012-03-08 17:37:48'),
(411, '印刷排版/制版', 'Typography / Plate', 123, 0, '2012-03-08 17:38:05'),
(412, '物业招商/租赁/租售', 'Property investment / Leasing / Rental', 107, 0, '2012-03-08 17:38:10'),
(413, '项目经理/主管', 'Project Manager / Supervisor', 129, 0, '2012-03-08 17:38:11'),
(414, '设计管理人员', 'Design management', 123, 0, '2012-03-08 17:38:24'),
(416, 'CAD设计/制图', 'CAD design / Drafting', 123, 0, '2012-03-08 17:38:42'),
(417, '物业维修', 'Property maintenance', 107, 0, '2012-03-08 17:38:45'),
(428, '媒介策划/管理', 'Media planning / Management', 124, 0, '2012-03-08 17:41:00'),
(429, '保险代理/经纪人/客户经理', 'Insurance Agent / Broker / Account Manager', 111, 0, '2012-03-08 17:41:07'),
(430, '行政主管', 'Administrative', 132, 0, '2012-03-08 17:41:10'),
(431, '设计/创意管理', 'Design / Creative Management', 124, 0, '2012-03-08 17:41:22'),
(432, '保险顾问/财务规划师', 'Insurance Advisor / Financial Planner', 111, 0, '2012-03-08 17:41:28'),
(433, '会展策划/设计', 'Event Planning / Design', 124, 0, '2012-03-08 17:41:39'),
(434, '保险产品开发/项目策划', 'Insurance product development / Project planning', 111, 0, '2012-03-08 17:41:55'),
(435, '企业策划人员', 'Corporate planners', 124, 0, '2012-03-08 17:41:58'),
(436, '文案策划', 'Text planning', 124, 0, '2012-03-08 17:42:13'),
(437, '行政经理/办公室主任', 'Manager / Director of the Office', 132, 0, '2012-03-08 17:42:16'),
(438, '保险培训师', 'Insurance Trainers', 111, 0, '2012-03-08 17:42:18'),
(440, '契约管理', 'Contract Management', 111, 0, '2012-03-08 17:42:43'),
(441, '美术指导', 'Art Direction', 124, 0, '2012-03-08 17:42:43'),
(442, '行政专员/助理', 'Chief Commissioner / Assistant', 132, 0, '2012-03-08 17:42:44'),
(443, '制作执行', 'Production Executive', 124, 0, '2012-03-08 17:42:59'),
(444, '核保理赔', 'Underwriting claims', 111, 0, '2012-03-08 17:43:02'),
(445, '助理/秘书', 'Assistant / Secretary', 132, 0, '2012-03-08 17:43:11'),
(446, '其他', 'Others', 124, 0, '2012-03-08 17:43:18'),
(447, '受理', 'Insurance accepted', 111, 0, '2012-03-08 17:43:21'),
(448, '核力/火力工程师', 'Nuclear force / Fire engineer', 129, 0, '2012-03-08 17:43:24'),
(449, '精算/投资/稽核/律师/法务/合规', 'Actuarial / Investment / Audit / Law / Legal / Compli', 111, 0, '2012-03-08 17:43:49'),
(450, '前台/总机/接待', 'Reception / Switchboard / Reception', 132, 0, '2012-03-08 17:43:53'),
(451, '保险精算师', 'Actuary', 111, 0, '2012-03-08 17:44:10'),
(452, '导演/编导/影视制作', 'Director / Film and television production', 125, 0, '2012-03-08 17:44:13'),
(453, '后勤人员', 'Support staff', 132, 0, '2012-03-08 17:44:19'),
(454, '总编/副总编/主编', 'Editor / Associate editor', 125, 0, '2012-03-08 17:44:32'),
(505, '其他', 'Others', 133, 0, '2012-03-08 17:50:33'),
(456, '客户服务/续期管理', 'Customer Service / Renewal management', 111, 0, '2012-03-08 17:44:34'),
(457, '地质勘查/选矿/采矿', 'Geological Survey / Mineral / Mining', 129, 0, '2012-03-08 17:44:40'),
(458, '合同管理', 'Contract Management', 132, 0, '2012-03-08 17:44:47'),
(459, '艺术指导/舞美设计', 'Art director / Stage design', 125, 0, '2012-03-08 17:44:54'),
(460, '保险内勤', 'Insurance back office', 111, 0, '2012-03-08 17:44:58'),
(461, '水利/水电工程师', 'Water / Hydropower Engineer', 129, 0, '2012-03-08 17:45:02'),
(462, '摄影师/摄像师', 'Photographer / Cameraman', 125, 0, '2012-03-08 17:45:13'),
(463, '储备经理人', 'Reserve managers', 111, 0, '2012-03-08 17:45:17'),
(464, '其他', 'Others', 129, 0, '2012-03-08 17:45:25'),
(465, '后期制作/音效师', 'Post-production / Sound engineer', 125, 0, '2012-03-08 17:45:35'),
(466, '电脑操作/打字/录入员', 'Computer operation / Typing / Entry clerk', 132, 0, '2012-03-08 17:45:41'),
(467, '其他', 'Others', 111, 0, '2012-03-08 17:45:42'),
(468, '首席执行官CEO/总裁/总经理', 'CEO / President / General Manager', 130, 0, '2012-03-08 17:45:52'),
(469, '文员', 'Clerk', 132, 0, '2012-03-08 17:46:06'),
(470, '主持人/演员/模特/配音', 'Host / Actor / Model / Voice', 125, 0, '2012-03-08 17:46:08'),
(471, '首席运营官COO/运营总监', 'COO / Director of Operations', 130, 0, '2012-03-08 17:46:15'),
(472, '编辑/撰稿', 'Editor / Writer', 125, 0, '2012-03-08 17:46:24'),
(474, '记者/采编', 'Reporters / Editors', 125, 0, '2012-03-08 17:46:43'),
(475, '首席财务官CFO', 'CFO', 130, 0, '2012-03-08 17:46:55'),
(476, '文案/策划', 'Copy / Planning', 125, 0, '2012-03-08 17:47:01'),
(477, '首席技术官CTO/首席信息官CIO', 'CTO/CIO', 130, 0, '2012-03-08 17:47:20'),
(478, '校对/录入', 'Proofreading / Entry', 125, 0, '2012-03-08 17:47:22'),
(479, '咨询总监', 'Consulting Director', 133, 0, '2012-03-08 17:47:28'),
(480, '出版/发行', 'Publication / Distribution', 125, 0, '2012-03-08 17:47:38'),
(481, '副总裁/副总经理', 'Vice President', 130, 0, '2012-03-08 17:47:38'),
(482, '咨询经理/主管', 'Consulting Manager / Supervisor', 133, 0, '2012-03-08 17:47:50'),
(483, '总裁助理/总经理助理', 'Assistant General Manager', 130, 0, '2012-03-08 17:47:57'),
(484, '酒店管理', 'Hotel Management', 137, 0, '2012-03-08 17:48:07'),
(485, '排版设计/完稿/美编', 'Layout design / Finalized / Art Editor', 125, 0, '2012-03-08 17:48:07'),
(486, '咨询顾问', 'Consultant', 133, 0, '2012-03-08 17:48:16'),
(487, '总监', 'Director', 130, 0, '2012-03-08 17:48:21'),
(488, '印刷操作', 'Printing operation', 125, 0, '2012-03-08 17:48:22'),
(489, '专业顾问', 'Professional advisers', 133, 0, '2012-03-08 17:48:44'),
(490, '大堂经理/领班', 'Lobby manager / Foreman', 137, 0, '2012-03-08 17:48:48'),
(491, '分公司经理/代表处首代', 'Branch Manager / Office first-generation', 130, 0, '2012-03-08 17:48:51'),
(492, '化妆师/造型师/服装/道具', 'Make-up artist / Stylist / Clothing / Props', 125, 0, '2012-03-08 17:48:58'),
(493, '情报信息分析', 'Intelligence and information analysis', 133, 0, '2012-03-08 17:49:07'),
(494, '合伙人', 'Partner', 130, 0, '2012-03-08 17:49:12'),
(495, '经纪人', 'Broker', 125, 0, '2012-03-08 17:49:14'),
(496, '前厅接待/礼仪/迎宾', 'Lobby reception / Ceremony / Welcome', 137, 0, '2012-03-08 17:49:17'),
(497, '培训师', 'Trainer', 133, 0, '2012-03-08 17:49:29'),
(498, '其他', 'Others', 125, 0, '2012-03-08 17:49:32'),
(499, '其他', 'Others', 130, 0, '2012-03-08 17:49:36'),
(500, '娱乐或餐饮管理', 'Entertainment or food and beverage management', 137, 0, '2012-03-08 17:49:43'),
(501, '服务员', 'Attendant', 137, 0, '2012-03-08 17:50:03'),
(502, '市场调研', 'Market research', 133, 0, '2012-03-08 17:50:07'),
(503, '客房服务', 'Room Service', 137, 0, '2012-03-08 17:50:21'),
(504, '人力资源总监', 'HR Director', 131, 0, '2012-03-08 17:50:24'),
(506, '厨师/面点师', 'Cooks / Bakers', 137, 0, '2012-03-08 17:50:48'),
(507, '人力资源经理', 'Human Resources Manager', 131, 0, '2012-03-08 17:50:49'),
(508, '人力资源主管', 'HR Supervisor', 131, 0, '2012-03-08 17:51:08'),
(509, '调酒师/茶艺师', 'Bartender /Tea Craftsman', 137, 0, '2012-03-08 17:51:11'),
(510, '人力资源专员/助理', 'HR Officer / Assistant', 131, 0, '2012-03-08 17:51:29'),
(511, '医药代表', 'Medical representatives', 126, 0, '2012-03-08 17:51:43'),
(512, '营养师', 'Nutritionist', 137, 0, '2012-03-08 17:51:46'),
(513, '培训经理/主管', 'Training Manager / Supervisor', 131, 0, '2012-03-08 17:51:53'),
(514, '医疗器械推广', 'Promotion of medical devices', 126, 0, '2012-03-08 17:52:01'),
(515, '导游/票务', 'Guide / Ticket', 137, 0, '2012-03-08 17:52:07'),
(516, '产品研发/注册', 'R & D / Registration', 126, 0, '2012-03-08 17:52:16'),
(517, '旅游顾问', 'Travel Consultant', 137, 0, '2012-03-08 17:52:27'),
(518, '培训专员/助理/培训师', 'Training Officer / Assistant / Trainer', 131, 0, '2012-03-08 17:52:31'),
(519, '项目经理/主管', 'Project Manager / Supervisor', 126, 0, '2012-03-08 17:52:32'),
(520, '招聘专员/助理', 'Recruiter / Assistant', 131, 0, '2012-03-08 17:52:50'),
(521, '计划调度/旅游产品', 'Planning and scheduling / Travel products', 137, 0, '2012-03-08 17:52:54'),
(522, '药品生产/质量管理', 'Pharmaceutical production / Quality management', 126, 0, '2012-03-08 17:53:02'),
(523, '主持/司仪', 'Host / Master of ceremonies', 137, 0, '2012-03-08 17:53:19'),
(524, '招聘经理/主管', 'Recruitment Manager / Supervisor', 131, 0, '2012-03-08 17:53:21'),
(525, '生物工程/生物制药', 'Biotechnology / Biopharmaceutical', 126, 0, '2012-03-08 17:53:22'),
(526, '招商经理/主管', 'Investment Manager / Supervisor', 126, 0, '2012-03-08 17:53:37'),
(527, '救生员', 'Lifeguards', 137, 0, '2012-03-08 17:53:41'),
(528, '薪酬福利管理', 'Salaries and benefits management', 131, 0, '2012-03-08 17:53:51'),
(529, '临床研究/协调', 'Clinical research / Coordination', 126, 0, '2012-03-08 17:53:57'),
(530, '其他', 'Others', 137, 0, '2012-03-08 17:54:01'),
(531, '其他', 'Others', 126, 0, '2012-03-08 17:54:13'),
(532, '绩效考核管理', 'Performance appraisal management', 131, 0, '2012-03-08 17:54:19'),
(533, '美发/发型师', 'Hair stylist', 138, 0, '2012-03-08 17:54:46'),
(534, '化工工程师', 'Chemical Engineer', 127, 0, '2012-03-08 17:54:56'),
(561, '内科医生', 'Physicians', 139, 0, '2012-03-08 17:58:20'),
(536, '化学分析', 'Chemical analysis', 127, 0, '2012-03-08 17:55:15'),
(537, '健身/美体/舞蹈教练', 'Fitness / Body / Dance instructor', 138, 0, '2012-03-08 17:55:17'),
(538, '化学制剂研发', 'Chemical research and development', 127, 0, '2012-03-08 17:55:31'),
(539, '整形/美容/美甲', 'Plastic / Beauty / Nail', 138, 0, '2012-03-08 17:55:38'),
(540, '员工关系/企业文化/工会', 'Employee Relations / Corporate Culture / Unions', 131, 0, '2012-03-08 17:55:38'),
(541, '化学操作', 'Chemical operations', 127, 0, '2012-03-08 17:55:46'),
(542, '化妆师', 'Make-up artist', 138, 0, '2012-03-08 17:55:59'),
(543, '化学技术', 'Chemical Technology', 127, 0, '2012-03-08 17:56:00'),
(544, '培训师/讲师', 'Trainer / Lecturer', 134, 0, '2012-03-08 17:56:06'),
(545, '研发工程师', 'R & D engineers', 127, 0, '2012-03-08 17:56:12'),
(546, '猎头顾问/助理', 'Executive Search Consultant / Assistant', 131, 0, '2012-03-08 17:56:15'),
(547, '按摩/足疗', 'Massage / Reflexology', 138, 0, '2012-03-08 17:56:19'),
(548, '项目经理/主管', 'Project Manager / Supervisor', 127, 0, '2012-03-08 17:56:29'),
(549, '招生/课程顾问', 'Admissions / Curriculum consultant', 134, 0, '2012-03-08 17:56:39'),
(550, '其他', 'Others', 138, 0, '2012-03-08 17:56:40'),
(551, '塑料工程师', 'Plastics Engineers', 127, 0, '2012-03-08 17:56:43'),
(552, '其他', 'Othes', 131, 0, '2012-03-08 17:56:43'),
(553, '实验技术员/研究员', 'Experimental Technician / Researcher', 127, 0, '2012-03-08 17:57:02'),
(554, '教练', 'Coach', 134, 0, '2012-03-08 17:57:04'),
(555, '医药代表', 'Medical representatives', 139, 0, '2012-03-08 17:57:19'),
(556, '油漆/化工涂料', 'Paint / Chemical coating', 127, 0, '2012-03-08 17:57:25'),
(557, '医生/医师', 'Doctors / Physicians', 139, 0, '2012-03-08 17:57:40'),
(558, '其他', 'Others', 127, 0, '2012-03-08 17:57:41'),
(559, '护士/护理人员', 'Nurse', 139, 0, '2012-03-08 17:58:01'),
(560, '教学/教务管理人员', 'Teaching / Academic management', 134, 0, '2012-03-08 17:58:01'),
(562, '外科医生', 'Surgeon', 139, 0, '2012-03-08 17:58:39'),
(563, '儿科医生', 'Pediatrician', 139, 0, '2012-03-08 17:58:59'),
(564, '牙科医生', 'Dentist', 139, 0, '2012-03-08 17:59:16'),
(565, '中医科医生', 'Chinese medicine practitioners', 139, 0, '2012-03-08 17:59:39'),
(566, '教育产品开发', 'Education and Product Development', 134, 0, '2012-03-08 17:59:39'),
(567, '麻醉医生', 'Anesthesiologists', 139, 0, '2012-03-08 17:59:58'),
(568, '家教', 'Tutor', 134, 0, '2012-03-08 18:00:14'),
(569, '心理医生', 'Psychiatrist', 139, 0, '2012-03-08 18:00:18'),
(570, '眼科医生/验光师', 'Ophthalmologist / Optometrist', 139, 0, '2012-03-08 18:00:43'),
(571, '校长', 'Principal', 134, 0, '2012-03-08 18:01:01'),
(572, '药库主任/药剂师', 'Storehouse Director / Pharmacist', 139, 0, '2012-03-08 18:01:03'),
(574, '大学教师', 'University teachers', 134, 0, '2012-03-08 18:01:31'),
(575, '医疗管理人员', 'Medical management', 139, 0, '2012-03-08 18:01:39'),
(576, '营养师', 'Nutritionist', 139, 0, '2012-03-08 18:02:01'),
(577, '高中教师', 'High school teachers', 134, 0, '2012-03-08 18:02:03'),
(578, '宠物护理/兽医', 'Pet Care / Veterinary', 139, 0, '2012-03-08 18:02:21'),
(579, '职业中专/技校教师', 'Vocational school / technical school teachers', 134, 0, '2012-03-08 18:02:31'),
(580, '针灸推拿', 'Acupuncture', 139, 0, '2012-03-08 18:02:45'),
(581, '其他', 'Others', 139, 0, '2012-03-08 18:03:05'),
(582, '初中教师', 'Junior high school teachers', 134, 0, '2012-03-08 18:03:07'),
(583, '小学教师', 'Primary school teachers', 134, 0, '2012-03-08 18:03:32'),
(584, '幼教', 'Early childhood education', 134, 0, '2012-03-08 18:03:56'),
(585, '保安', 'Security', 140, 0, '2012-03-08 18:03:56'),
(586, '保洁', 'Cleaning', 140, 0, '2012-03-08 18:04:16'),
(587, '其他', 'Others', 134, 0, '2012-03-08 18:04:17'),
(588, '普工', 'Ordinary workers', 140, 0, '2012-03-08 18:04:35'),
(589, '话务员', 'Operator', 140, 0, '2012-03-08 18:04:56'),
(590, '律师/律师助理', 'Lawyers / Paralegals', 135, 0, '2012-03-08 18:04:57'),
(591, '家政人员', 'Housekeeping staff', 140, 0, '2012-03-08 18:05:14'),
(592, '法务经理/主管', 'Legal Manager / Supervisor', 135, 0, '2012-03-08 18:05:35'),
(593, '其他', 'Others', 140, 0, '2012-03-08 18:05:35'),
(594, '律师/法务/合规顾问', 'Law / Legal / Compliance Advisor', 135, 0, '2012-03-08 18:05:59'),
(595, '律师/法务/合规部经理/主任', 'Law / Legal / Compliance Manager / Director', 135, 0, '2012-03-08 18:06:27'),
(596, '产权/专利顾问/专业代理', 'Property / Patent consultant / Professional agent', 135, 0, '2012-03-08 18:07:12'),
(597, '法务专员/助理', 'Legal Officer / Assistant', 135, 0, '2012-03-08 18:07:33'),
(598, '其他', 'Others', 135, 0, '2012-03-08 18:08:00'),
(599, '英语', 'English translation', 136, 0, '2012-03-08 18:08:35'),
(600, '法语', 'French translation', 136, 0, '2012-03-08 18:09:04'),
(601, '日语', 'Japanese translation', 136, 0, '2012-03-08 18:09:28'),
(602, '德语', 'German translation', 136, 0, '2012-03-08 18:09:49'),
(603, '俄语', 'Russian Translation', 136, 0, '2012-03-08 18:10:06'),
(604, '韩语', 'Korean translation', 136, 0, '2012-03-08 18:10:37'),
(605, '西班牙语', 'Spanish translation', 136, 0, '2012-03-08 18:10:56'),
(606, '意大利语', 'Italian translation', 136, 0, '2012-03-08 18:11:21'),
(607, '葡萄牙语', 'Portuguese translation', 136, 0, '2012-03-08 18:11:40'),
(608, '阿拉伯语', 'Arabic Translator', 136, 0, '2012-03-08 18:12:02'),
(612, '其他', 'others', 141, 0, '2012-03-08 18:17:20'),
(611, '其他语种', 'Other languages', 136, 0, '2012-03-08 18:14:45');

-- --------------------------------------------------------

--
-- Table structure for table `zp_home_hdp`
--

DROP TABLE IF EXISTS `zp_home_hdp`;
CREATE TABLE IF NOT EXISTS `zp_home_hdp` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `urllink` varchar(255) NOT NULL,
  `piclink` varchar(255) NOT NULL,
  `order_id` int(10) NOT NULL DEFAULT '0',
  `cityids` varchar(250) NOT NULL,
  `expiredtime` int(10) NOT NULL DEFAULT '0',
  `createdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `expiredtime` (`expiredtime`),
  KEY `cityids` (`cityids`),
  KEY `order_id` (`order_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `zp_home_hdp`
--


-- --------------------------------------------------------

--
-- Table structure for table `zp_jobs`
--

DROP TABLE IF EXISTS `zp_jobs`;
CREATE TABLE IF NOT EXISTS `zp_jobs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cid` int(11) NOT NULL COMMENT '公司ID，与euser表中id对应',
  `scid` int(11) DEFAULT '0',
  `title` varchar(255) NOT NULL COMMENT '招聘标题',
  `live_gnd_p` int(11) NOT NULL COMMENT '省id',
  `live_gnd_c` int(11) NOT NULL COMMENT '市id',
  `live_address` varchar(254) DEFAULT NULL,
  `funtype_1` int(11) NOT NULL COMMENT '职位1',
  `funtype_2` int(11) NOT NULL COMMENT '职位2',
  `dustrytype_1` int(11) NOT NULL,
  `dustrytype_2` int(11) NOT NULL,
  `company_type` int(11) NOT NULL,
  `company_scale` int(11) NOT NULL,
  `company_properties` int(11) NOT NULL,
  `gender` int(11) NOT NULL,
  `language` int(11) NOT NULL,
  `money` int(11) NOT NULL COMMENT '薪资',
  `jobterm` int(11) NOT NULL COMMENT '职位性质',
  `degree` int(11) NOT NULL COMMENT '学历要求',
  `pnum` int(11) NOT NULL DEFAULT '0' COMMENT '招聘人数',
  `work_exp` int(11) NOT NULL COMMENT '工作经验',
  `jtext` text NOT NULL COMMENT '招聘内容',
  `createtime` int(11) NOT NULL COMMENT '建立时间',
  `startdate` int(11) NOT NULL,
  `enddate` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `modifydate` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `cid` (`cid`),
  KEY `scid` (`scid`),
  KEY `live_gnd_p` (`live_gnd_p`),
  KEY `live_gnd_c` (`live_gnd_c`),
  KEY `funtype_1` (`funtype_1`),
  KEY `funtype_2` (`funtype_2`),
  KEY `status` (`status`),
  KEY `dustrytype_1` (`dustrytype_1`),
  KEY `dustrytype_2` (`dustrytype_2`),
  KEY `modifydate` (`modifydate`),
  KEY `company_type` (`company_type`,`company_scale`,`company_properties`),
  KEY `gender` (`gender`,`language`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `zp_jobs`
--

INSERT INTO `zp_jobs` (`id`, `cid`, `scid`, `title`, `live_gnd_p`, `live_gnd_c`, `live_address`, `funtype_1`, `funtype_2`, `dustrytype_1`, `dustrytype_2`, `company_type`, `company_scale`, `company_properties`, `gender`, `language`, `money`, `jobterm`, `degree`, `pnum`, `work_exp`, `jtext`, `createtime`, `startdate`, `enddate`, `status`, `modifydate`) VALUES
(1, 2, 0, 'ct职位1', 44, 10, NULL, 1, 2, 0, 0, 10, 1, 0, 1, 1, 1, 1, 1, 0, 0, '123<br />', 1330408287, 1330358400, 1332777600, 1, 1330408287);

-- --------------------------------------------------------

--
-- Table structure for table `zp_jobs_template`
--

DROP TABLE IF EXISTS `zp_jobs_template`;
CREATE TABLE IF NOT EXISTS `zp_jobs_template` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cid` int(11) NOT NULL COMMENT '公司ID，与euser表中id对应',
  `scid` int(11) DEFAULT '0',
  `title` varchar(255) NOT NULL COMMENT '招聘标题',
  `live_gnd_p` int(11) NOT NULL COMMENT '省id',
  `live_gnd_c` int(11) NOT NULL COMMENT '市id',
  `live_address` varchar(254) DEFAULT NULL,
  `funtype_1` int(11) NOT NULL COMMENT '职位1',
  `funtype_2` int(11) NOT NULL COMMENT '职位2',
  `dustrytype_1` int(11) NOT NULL,
  `dustrytype_2` int(11) NOT NULL,
  `company_type` int(11) NOT NULL,
  `company_scale` int(11) NOT NULL,
  `company_properties` int(11) NOT NULL,
  `gender` int(11) NOT NULL,
  `language` int(11) NOT NULL,
  `money` int(11) NOT NULL COMMENT '薪资',
  `jobterm` int(11) NOT NULL COMMENT '职位性质',
  `degree` int(11) NOT NULL COMMENT '学历要求',
  `pnum` int(11) NOT NULL COMMENT '招聘人数',
  `work_exp` int(11) NOT NULL COMMENT '工作经验',
  `jtext` text NOT NULL COMMENT '招聘内容',
  `createtime` int(11) NOT NULL COMMENT '建立时间',
  `startdate` int(11) NOT NULL,
  `enddate` int(11) NOT NULL,
  `modifydate` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `cid` (`cid`),
  KEY `scid` (`scid`),
  KEY `live_gnd_p` (`live_gnd_p`),
  KEY `live_gnd_c` (`live_gnd_c`),
  KEY `funtype_1` (`funtype_1`),
  KEY `funtype_2` (`funtype_2`),
  KEY `startdate` (`startdate`),
  KEY `enddate` (`enddate`),
  KEY `modifydate` (`modifydate`),
  KEY `dustrytype_1` (`dustrytype_1`),
  KEY `dustrytype_2` (`dustrytype_2`),
  KEY `company_type` (`company_type`,`company_scale`,`company_properties`),
  KEY `gender` (`gender`,`language`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `zp_jobs_template`
--


-- --------------------------------------------------------

--
-- Table structure for table `zp_job_category`
--

DROP TABLE IF EXISTS `zp_job_category`;
CREATE TABLE IF NOT EXISTS `zp_job_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rid` int(11) NOT NULL COMMENT '根节点id',
  `pid` int(11) NOT NULL COMMENT '父分类id',
  `level` int(11) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 NOT NULL COMMENT '职务分类名称',
  PRIMARY KEY (`id`),
  KEY `rid` (`rid`,`pid`),
  KEY `level` (`level`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `zp_job_category`
--


-- --------------------------------------------------------

--
-- Table structure for table `zp_leader`
--

DROP TABLE IF EXISTS `zp_leader`;
CREATE TABLE IF NOT EXISTS `zp_leader` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `eid` int(11) NOT NULL DEFAULT '0',
  `roomid` int(11) NOT NULL DEFAULT '0',
  `room` varchar(250) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `startdate` int(10) NOT NULL DEFAULT '0',
  `enddate` int(10) NOT NULL DEFAULT '0',
  `passwd` varchar(250) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `zp_leader`
--


-- --------------------------------------------------------

--
-- Table structure for table `zp_mailconfig`
--

DROP TABLE IF EXISTS `zp_mailconfig`;
CREATE TABLE IF NOT EXISTS `zp_mailconfig` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `m_key` varchar(250) NOT NULL,
  `m_value` varchar(250) NOT NULL,
  `m_type` enum('local','smtp') NOT NULL DEFAULT 'local',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `zp_mailconfig`
--

INSERT INTO `zp_mailconfig` (`id`, `m_key`, `m_value`, `m_type`) VALUES
(1, 'from_user', '试一试', 'local'),
(2, 'from_email', 'admin@shiyishi.cn', 'local'),
(3, 'from_user', '票虫网', 'smtp'),
(4, 'from_email', 'admin@piaochong.com', 'smtp'),
(5, 'username', 'test', 'smtp'),
(6, 'password', '123456', 'smtp');

-- --------------------------------------------------------

--
-- Table structure for table `zp_mailtask`
--

DROP TABLE IF EXISTS `zp_mailtask`;
CREATE TABLE IF NOT EXISTS `zp_mailtask` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `taskname` varchar(250) NOT NULL,
  `templateid` int(11) NOT NULL DEFAULT '0',
  `usertype` varchar(255) NOT NULL DEFAULT 'person,company',
  `sendfrequency` int(11) NOT NULL DEFAULT '0' COMMENT '发送频率 天为单位',
  `status` enum('show','hide') NOT NULL DEFAULT 'show',
  `action` enum('auto','reg','act','invite','inviteleader','find') NOT NULL DEFAULT 'auto' COMMENT '发送行为 auto自动，reg注册时发送',
  `createdate` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `zp_mailtask`
--

INSERT INTO `zp_mailtask` (`id`, `taskname`, `templateid`, `usertype`, `sendfrequency`, `status`, `action`, `createdate`) VALUES
(1, '找回密码邮件', 2, 'common', 0, 'show', 'find', 1274429478),
(4, '注册邮件', 1, 'person,company', 0, 'show', 'reg', 1305194774),
(5, '邀请应聘者', 3, 'person,company', 0, 'show', 'invite', 1305792157);

-- --------------------------------------------------------

--
-- Table structure for table `zp_mailtemplate`
--

DROP TABLE IF EXISTS `zp_mailtemplate`;
CREATE TABLE IF NOT EXISTS `zp_mailtemplate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(250) NOT NULL,
  `mailsubject` varchar(250) NOT NULL,
  `mailcontent` text NOT NULL,
  `status` enum('show','hide') NOT NULL DEFAULT 'show',
  `createdate` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `zp_mailtemplate`
--

INSERT INTO `zp_mailtemplate` (`id`, `name`, `mailsubject`, `mailcontent`, `status`, `createdate`) VALUES
(1, '会员注册模板', '欢迎您加入视一视', '<p>亲爱的用户：感谢您注册视一视，祝您找到一个称心如意的工作！<br /><br />建议您保管好本邮件！如果您需要其它帮助，请访问“帮助中心”。<br /><br />任何问题欢迎您致电或邮件联系客服。</p>', 'show', 1271602886),
(2, '会员找回密码邮件', '您使用了视一视的密码找回功能-{用户名}', '<p>Hi,{用户名}: </p>\r\n<blockquote style="MARGIN-RIGHT: 0px" dir="ltr">\r\n<p><br />您在视一视的登录密码已经重置，新密码为：</p>\r\n<blockquote style="MARGIN-RIGHT: 0px" dir="ltr">\r\n<p>请牢记：{用户密码}</p>\r\n<p><br /></p>\r\n<p align="left">任何问题欢迎您致电或邮件联系客服。<br /></p>\r\n<p align="left"><br /></p>\r\n<p align="left"><br /></p></blockquote></blockquote>', 'show', 1274413509),
(3, '邀请发送邮件通知', '{企业}邀请您参加视频面试', '<p>{姓名}：</p>\r\n<blockquote style="MARGIN-RIGHT: 0px" dir="ltr">\r\n<p>{企业}邀请您于{时间}参加在线面试 <a href="http://www.shiyishi.cn/">http://www.shiyishi.cn/</a>，请按时参加。</p></blockquote>', 'show', 1305791251);

-- --------------------------------------------------------

--
-- Table structure for table `zp_major`
--

DROP TABLE IF EXISTS `zp_major`;
CREATE TABLE IF NOT EXISTS `zp_major` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `thename` varchar(250) NOT NULL,
  `enname` varchar(250) NOT NULL,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `order_id` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `createdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `parent_id` (`parent_id`),
  KEY `order_id` (`order_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `zp_major`
--


-- --------------------------------------------------------

--
-- Table structure for table `zp_myjob_int`
--

DROP TABLE IF EXISTS `zp_myjob_int`;
CREATE TABLE IF NOT EXISTS `zp_myjob_int` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `aid` int(11) DEFAULT '0',
  `uid` int(11) unsigned NOT NULL DEFAULT '0',
  `gender` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1男2女',
  `eid` int(11) unsigned NOT NULL DEFAULT '0',
  `jobid` int(11) unsigned NOT NULL DEFAULT '0',
  `isnew` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1新0旧',
  `status` tinyint(1) NOT NULL DEFAULT '-1' COMMENT '1有效0删除',
  `interview_type` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1普通面试2视频面试',
  `interview_date` int(10) NOT NULL DEFAULT '0',
  `interview_enddate` int(11) DEFAULT '0',
  `invite_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `aid` (`aid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `zp_myjob_int`
--


-- --------------------------------------------------------

--
-- Table structure for table `zp_myjob_pos`
--

DROP TABLE IF EXISTS `zp_myjob_pos`;
CREATE TABLE IF NOT EXISTS `zp_myjob_pos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) unsigned NOT NULL DEFAULT '0',
  `eid` int(11) unsigned NOT NULL DEFAULT '0',
  `jobid` int(11) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1有效0删除',
  `job_expiry_date` int(10) NOT NULL DEFAULT '0',
  `apply_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `zp_myjob_pos`
--


-- --------------------------------------------------------

--
-- Table structure for table `zp_myjob_rviewd`
--

DROP TABLE IF EXISTS `zp_myjob_rviewd`;
CREATE TABLE IF NOT EXISTS `zp_myjob_rviewd` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) unsigned NOT NULL DEFAULT '0',
  `eid` int(11) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1有效0删除',
  `viewd_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=21 ;

--
-- Dumping data for table `zp_myjob_rviewd`
--

INSERT INTO `zp_myjob_rviewd` (`id`, `uid`, `eid`, `status`, `viewd_date`) VALUES
(1, 2, 2, 1, '2012-02-27 15:46:04'),
(2, 2, 2, 1, '2012-02-27 15:47:14'),
(3, 2, 2, 1, '2012-02-27 15:47:24'),
(4, 2, 2, 1, '2012-02-27 15:47:55'),
(5, 2, 2, 1, '2012-02-27 15:48:13'),
(6, 3, 2, 1, '2012-02-28 13:39:49'),
(7, 3, 2, 1, '2012-02-28 13:41:18'),
(8, 4, 2, 1, '2012-02-28 13:54:31'),
(9, 13, 2, 1, '2012-02-28 14:09:27'),
(10, 12, 2, 1, '2012-02-28 14:09:34'),
(11, 11, 2, 1, '2012-02-28 14:09:40'),
(12, 10, 2, 1, '2012-02-28 14:09:48'),
(13, 9, 2, 1, '2012-02-28 14:09:54'),
(14, 8, 2, 1, '2012-02-28 14:10:01'),
(15, 7, 2, 1, '2012-02-28 14:10:06'),
(16, 6, 2, 1, '2012-02-28 14:10:12'),
(17, 5, 2, 1, '2012-02-28 14:10:18'),
(18, 14, 2, 1, '2012-02-28 14:17:06'),
(19, 15, 2, 1, '2012-02-28 23:35:53'),
(20, 17, 2, 1, '2012-03-09 12:11:57');

-- --------------------------------------------------------

--
-- Table structure for table `zp_news`
--

DROP TABLE IF EXISTS `zp_news`;
CREATE TABLE IF NOT EXISTS `zp_news` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `subject` varchar(250) NOT NULL COMMENT '标题',
  `catid` int(4) unsigned NOT NULL DEFAULT '0' COMMENT '分类',
  `cityids` varchar(250) NOT NULL COMMENT '城市ID',
  `thumb` varchar(255) DEFAULT NULL COMMENT '缩略图',
  `keywords` varchar(250) DEFAULT NULL COMMENT '关键词',
  `order_id` int(8) NOT NULL DEFAULT '50' COMMENT '排序',
  `content` text COMMENT '日志内容',
  `itemid` varchar(254) NOT NULL DEFAULT '0' COMMENT '关联的演出ID',
  `createdate` int(10) NOT NULL DEFAULT '0' COMMENT '发布时间 默认为当前时间',
  PRIMARY KEY (`id`),
  KEY `catid` (`catid`),
  KEY `cityid` (`cityids`),
  KEY `itemid` (`itemid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `zp_news`
--


-- --------------------------------------------------------

--
-- Table structure for table `zp_news_cat`
--

DROP TABLE IF EXISTS `zp_news_cat`;
CREATE TABLE IF NOT EXISTS `zp_news_cat` (
  `id` int(8) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `order_id` int(8) NOT NULL DEFAULT '0',
  `createdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `zp_news_cat`
--

INSERT INTO `zp_news_cat` (`id`, `name`, `parent_id`, `order_id`, `createdate`) VALUES
(1, '本站公告', 0, 1, '2010-03-17 14:25:29'),
(2, '演出动态', 0, 2, '2010-08-15 11:04:59');

-- --------------------------------------------------------

--
-- Table structure for table `zp_online_resume`
--

DROP TABLE IF EXISTS `zp_online_resume`;
CREATE TABLE IF NOT EXISTS `zp_online_resume` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT '用户ID',
  `name` varchar(255) CHARACTER SET utf8 NOT NULL COMMENT '姓名',
  `personID` varchar(255) CHARACTER SET utf8 NOT NULL COMMENT '身份证号',
  `phone` varchar(255) CHARACTER SET utf8 NOT NULL COMMENT '电话',
  `email` varchar(255) CHARACTER SET utf8 NOT NULL COMMENT 'email',
  `gender` char(1) CHARACTER SET utf8 NOT NULL COMMENT '性别',
  `age` int(11) NOT NULL COMMENT '年龄',
  `height` varchar(255) CHARACTER SET utf8 NOT NULL COMMENT '身高',
  `rtext` text CHARACTER SET utf8 NOT NULL COMMENT '简历内容',
  `vid` int(11) NOT NULL COMMENT '视频ID',
  `vurl` varchar(255) CHARACTER SET utf8 NOT NULL COMMENT '视频路径',
  `createtime` int(11) NOT NULL COMMENT '建立时间',
  `modifytime` int(11) NOT NULL COMMENT '修改时间',
  `type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0无目的求职 1指定公司求职 2指定职务求职 ',
  `typeid` int(11) NOT NULL COMMENT '对应type的id',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uid` (`uid`),
  KEY `type` (`type`),
  KEY `typeid` (`typeid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `zp_online_resume`
--


-- --------------------------------------------------------

--
-- Table structure for table `zp_pages`
--

DROP TABLE IF EXISTS `zp_pages`;
CREATE TABLE IF NOT EXISTS `zp_pages` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `pagename` varchar(50) NOT NULL,
  `pagetitle` varchar(254) NOT NULL,
  `content` text NOT NULL,
  `status` enum('show','hide') NOT NULL DEFAULT 'show',
  `template` varchar(254) NOT NULL,
  `createdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `status` (`status`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `zp_pages`
--

INSERT INTO `zp_pages` (`id`, `pagename`, `pagetitle`, `content`, `status`, `template`, `createdate`) VALUES
(1, 'aboutus', '关于我们', '<p>关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们111</p>', 'show', 'page_default.tpl', '2010-08-06 14:04:13'),
(2, 'geren', '个人专题', 'asdasd<br />', 'show', 'geren.tpl', '2011-06-19 00:53:12');

-- --------------------------------------------------------

--
-- Table structure for table `zp_purview`
--

DROP TABLE IF EXISTS `zp_purview`;
CREATE TABLE IF NOT EXISTS `zp_purview` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `purview_name` varchar(50) NOT NULL DEFAULT '',
  `purview_link` varchar(255) NOT NULL DEFAULT '',
  `parent_id` smallint(6) unsigned NOT NULL DEFAULT '0',
  `order_id` int(8) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `parent` (`parent_id`),
  KEY `orderid` (`order_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `zp_purview`
--


-- --------------------------------------------------------

--
-- Table structure for table `zp_p_user`
--

DROP TABLE IF EXISTS `zp_p_user`;
CREATE TABLE IF NOT EXISTS `zp_p_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8 NOT NULL,
  `password` varchar(255) CHARACTER SET utf8 NOT NULL,
  `email` varchar(255) CHARACTER SET utf8 NOT NULL,
  `createtime` int(11) NOT NULL,
  `lasttime` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `zp_p_user`
--


-- --------------------------------------------------------

--
-- Table structure for table `zp_relink`
--

DROP TABLE IF EXISTS `zp_relink`;
CREATE TABLE IF NOT EXISTS `zp_relink` (
  `id` int(11) NOT NULL,
  `title` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `url` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `img` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `orid` int(11) NOT NULL,
  `createtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `orid` (`orid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `zp_relink`
--


-- --------------------------------------------------------

--
-- Table structure for table `zp_resume`
--

DROP TABLE IF EXISTS `zp_resume`;
CREATE TABLE IF NOT EXISTS `zp_resume` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT '用户ID',
  `rtype` enum('cn','en') NOT NULL DEFAULT 'cn',
  `uname` varchar(250) NOT NULL COMMENT '姓名',
  `idcard` varchar(250) NOT NULL COMMENT '身份证号',
  `phone` varchar(250) NOT NULL COMMENT '电话',
  `email` varchar(250) NOT NULL COMMENT 'email',
  `gender` tinyint(1) NOT NULL DEFAULT '1' COMMENT '性别 1男 2女',
  `stature` varchar(250) DEFAULT NULL COMMENT '身高',
  `weight` varchar(250) DEFAULT NULL COMMENT '体重',
  `birth_year` smallint(4) NOT NULL DEFAULT '0' COMMENT '出生年',
  `birth_month` tinyint(2) NOT NULL DEFAULT '0' COMMENT '出生月',
  `birth_day` tinyint(2) NOT NULL DEFAULT '0' COMMENT '出生日',
  `degree` varchar(250) NOT NULL DEFAULT '0' COMMENT '学历',
  `speciality` varchar(250) NOT NULL COMMENT '专业',
  `birth_gnd` varchar(250) NOT NULL COMMENT '户籍地',
  `live_gnd` varchar(250) NOT NULL COMMENT '现居住地',
  `live_address` varchar(254) DEFAULT NULL,
  `jobterm` varchar(250) NOT NULL COMMENT '岗位性质',
  `entrytime` varchar(250) NOT NULL COMMENT '到岗时间',
  `funtype` varchar(250) NOT NULL COMMENT '期望职位',
  `dustrytype` varchar(250) NOT NULL COMMENT '期望行业',
  `salary` varchar(250) NOT NULL COMMENT '期望薪资',
  `work_gnd` varchar(250) NOT NULL COMMENT '期望工作地',
  `nowzt` varchar(250) NOT NULL COMMENT '目前状态',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '个人状态0免打扰 1求职',
  `introduction` text COMMENT '自我评价',
  `interest` text,
  `zycourse` text,
  `views` int(10) NOT NULL DEFAULT '0',
  `modifydate` int(10) NOT NULL DEFAULT '0',
  `createdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=17 ;

--
-- Dumping data for table `zp_resume`
--

INSERT INTO `zp_resume` (`id`, `uid`, `rtype`, `uname`, `idcard`, `phone`, `email`, `gender`, `stature`, `weight`, `birth_year`, `birth_month`, `birth_day`, `degree`, `speciality`, `birth_gnd`, `live_gnd`, `live_address`, `jobterm`, `entrytime`, `funtype`, `dustrytype`, `salary`, `work_gnd`, `nowzt`, `status`, `introduction`, `interest`, `zycourse`, `views`, `modifydate`, `createdate`) VALUES
(1, 2, 'cn', 'ut1', '132323456545678', '13898987679', 'ut1@1.com', 1, '123', '123', 2012, 1, 1, '1', '1234', '1,418', '1,418', NULL, '全职', '0', '1,2', ',', '1', '1,0', '在职', 1, '1234', NULL, '1234', 0, 1330328420, '2012-02-27 15:40:20'),
(2, 3, 'cn', 'ut2', '132345434545678', '13876765654', 'ut2@1.com', 1, '123', '123', 2012, 1, 1, '1', '1234', '1,418', '1,418', NULL, '全职', '0', '1,2', ',', '1', '1,0', '在职', 1, '1234', NULL, NULL, 0, 1330407533, '2012-02-28 13:38:53'),
(3, 4, 'cn', 'ut3', '123456787654323', '13987876543', 'ut3@1.com', 1, '123', '123', 2012, 1, 1, '3', '123', '1,418', '1,419', NULL, '全职', '0', '1,2', ',', '1', '1,0', '在职', 1, '1234', NULL, '1234', 0, 1330408461, '2012-02-28 13:54:21'),
(4, 5, 'cn', 'ut4', '123432343433333', '13489898787', 'ut4@1.com', 1, '123', '123', 2012, 1, 1, '1', '1234', '1,419', '1,418', NULL, '全职', '0', '1,2', ',', '1', '1,0', '在职', 1, '1234', NULL, NULL, 0, 1330408599, '2012-02-28 13:56:39'),
(5, 6, 'cn', 'ut5', '111111111111111', '13989898098', 'ut5@1.com', 1, '123', '123', 2012, 1, 1, '1', '1234', '1,418', '1,418', NULL, '全职', '0', '1,2', ',', '1', '1,0', '在职', 1, '1234', NULL, NULL, 0, 1330408655, '2012-02-28 13:57:35'),
(6, 7, 'cn', 'ut6', '000000000000000', '13989890000', 'ut6@1.com', 1, '123', '123', 2012, 1, 1, '1', '1234', '1,419', '1,418', NULL, '全职', '0', '1,2', ',', '1', '1,0', '在职', 1, '1234', NULL, NULL, 0, 1330408735, '2012-02-28 13:58:55'),
(7, 8, 'cn', 'ut7', '132222222222222', '13987666666', 'ut7@1.com', 1, '123', '123', 2012, 1, 1, '3', '1234', '1,419', '1,418', NULL, '全职', '0', '1,2', ',', '1', '1,0', '在职', 1, '1234', NULL, NULL, 0, 1330408812, '2012-02-28 14:00:12'),
(8, 9, 'cn', 'ut8', '999999999999999', '13876567890', 'ut8@1.com', 1, '123', '123', 2012, 1, 1, '1', '1234', '1,418', '1,418', NULL, '全职', '0', '1,2', ',', '1', '1,0', '在职', 1, NULL, NULL, NULL, 0, 1330408881, '2012-02-28 14:01:21'),
(9, 10, 'cn', 'ut9', '888888888888888', '13989878909', 'ut9@1.com', 1, '123', '123', 2012, 1, 1, '1', '1234', '1,418', '1,418', NULL, '全职', '0', '1,2', ',', '1', '1,0', '在职', 1, '1234', NULL, NULL, 0, 1330408938, '2012-02-28 14:02:18'),
(10, 11, 'cn', 'ut10', '777777777777777', '13989898909', 'ut10@1.com', 1, '123', '123', 2012, 1, 1, '3', '1234', '1,418', '1,419', NULL, '全职', '0', '1,2', ',', '1', '1,0', '在职', 1, '1234', NULL, NULL, 0, 1330409008, '2012-02-28 14:03:28'),
(11, 12, 'cn', 'ut11', '098765666666666', '13987878909', 'u11@1.com', 1, '123', '123', 2012, 1, 1, '1', '1234', '1,419', '1,418', NULL, '全职', '0', '1,2', ',', '1', '1,0', '在职', 1, '1234', NULL, NULL, 0, 1330409066, '2012-02-28 14:04:26'),
(12, 13, 'cn', 'ut12', '666666666666666', '13987878798', 'ut12@1.com', 1, '123', '123', 2012, 1, 1, '0', '1234', '1,418', '1,419', NULL, '全职', '0', '1,2', ',', '1', '1,0', '在职', 1, NULL, NULL, NULL, 0, 1330409175, '2012-02-28 14:06:15'),
(13, 14, 'cn', 'ut13', '123232321222222', '13987876540', 'ut13@1.com', 1, '123', '123', 2012, 1, 1, '3', '123', '1,418', '1,419', NULL, '全职', '0', '1,2', ',', '1', '1,0', '在职', 1, '123', NULL, NULL, 0, 1330409812, '2012-02-28 14:16:52'),
(14, 15, 'cn', 'ut14', '143234544444445', '13876767656', 'ut14@1.com', 1, '123', '123', 2012, 1, 1, '1', '1234', '1,419', '1,418', NULL, '全职', '0', '1,2', ',', '1', '1,0', '在职', 1, '1234', NULL, NULL, 0, 1330409953, '2012-02-28 14:19:13'),
(15, 16, 'cn', '白亚萍', '410181198508233523', '15936297202', 'yaping4155@163.com', 2, '163', '52', 1985, 8, 23, '8', '电子技术工程', '1,419', '1,419', NULL, '全职', '7', '131,510', ',', '3', '1,0', '在职', 0, NULL, NULL, NULL, 0, 1331264590, '2012-03-09 11:43:10'),
(16, 17, 'cn', '姚瑶', '110101198205270025', '13810857566', 'yaoyao@chinawinhr.com.cm', 1, '162', '45', 1982, 5, 27, '8', '工商管理', '1,', '1,', '', '全职', '0', '131,510', ',', '3', '1,422', '离职', 1, '性格开朗。。。', '000000000', '55555', 0, 1331265660, '2012-03-09 12:00:25');

-- --------------------------------------------------------

--
-- Table structure for table `zp_resume_box`
--

DROP TABLE IF EXISTS `zp_resume_box`;
CREATE TABLE IF NOT EXISTS `zp_resume_box` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cid` int(11) NOT NULL,
  `jid` int(11) NOT NULL,
  `rid` int(11) NOT NULL,
  `posttime` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `cid` (`cid`,`rid`),
  KEY `posttime` (`posttime`),
  KEY `jid` (`jid`),
  KEY `status` (`status`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `zp_resume_box`
--


-- --------------------------------------------------------

--
-- Table structure for table `zp_resume_buy`
--

DROP TABLE IF EXISTS `zp_resume_buy`;
CREATE TABLE IF NOT EXISTS `zp_resume_buy` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cid` int(11) NOT NULL COMMENT '公司id',
  `rid` int(11) NOT NULL COMMENT '简历id',
  `istext` int(11) NOT NULL COMMENT '是否购买文字简历',
  `isvideo` int(11) NOT NULL COMMENT '是否购买视频简历',
  `buytime` int(11) NOT NULL COMMENT '购买时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `cid` (`cid`,`rid`,`istext`,`isvideo`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `zp_resume_buy`
--


-- --------------------------------------------------------

--
-- Table structure for table `zp_resume_ctf`
--

DROP TABLE IF EXISTS `zp_resume_ctf`;
CREATE TABLE IF NOT EXISTS `zp_resume_ctf` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) unsigned NOT NULL DEFAULT '0',
  `rtype` enum('cn','en') NOT NULL DEFAULT 'cn',
  `awarddate` char(10) NOT NULL DEFAULT '0',
  `awardorg` varchar(250) NOT NULL,
  `ctfname` varchar(200) NOT NULL,
  `modifydate` int(10) NOT NULL DEFAULT '0',
  `createdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `rtype` (`rtype`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `zp_resume_ctf`
--

INSERT INTO `zp_resume_ctf` (`id`, `uid`, `rtype`, `awarddate`, `awardorg`, `ctfname`, `modifydate`, `createdate`) VALUES
(1, 3, 'cn', '2012-1-1', '1234', '1234', 0, '2012-02-28 13:38:53');

-- --------------------------------------------------------

--
-- Table structure for table `zp_resume_download`
--

DROP TABLE IF EXISTS `zp_resume_download`;
CREATE TABLE IF NOT EXISTS `zp_resume_download` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cid` int(11) NOT NULL,
  `rid` int(11) NOT NULL,
  `posttime` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `rtype` tinyint(4) NOT NULL DEFAULT '1' COMMENT '下载简历1文本2视频3全部',
  PRIMARY KEY (`id`),
  KEY `cid` (`cid`,`rid`),
  KEY `posttime` (`posttime`),
  KEY `status` (`status`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=15 ;

--
-- Dumping data for table `zp_resume_download`
--

INSERT INTO `zp_resume_download` (`id`, `cid`, `rid`, `posttime`, `status`, `rtype`) VALUES
(1, 2, 1, 1330328888, 1, 3),
(2, 2, 2, 1330407681, 1, 1),
(3, 2, 3, 1330408474, 1, 1),
(4, 2, 12, 1330409370, 1, 1),
(5, 2, 11, 1330409377, 1, 1),
(6, 2, 10, 1330409383, 1, 1),
(7, 2, 9, 1330409391, 1, 1),
(8, 2, 8, 1330409397, 1, 1),
(9, 2, 7, 1330409403, 1, 1),
(10, 2, 6, 1330409409, 1, 1),
(11, 2, 5, 1330409415, 1, 1),
(12, 2, 4, 1330409421, 1, 1),
(13, 2, 13, 1330409830, 1, 1),
(14, 2, 14, 1330443355, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `zp_resume_edu`
--

DROP TABLE IF EXISTS `zp_resume_edu`;
CREATE TABLE IF NOT EXISTS `zp_resume_edu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) unsigned NOT NULL DEFAULT '0',
  `rtype` enum('cn','en') NOT NULL DEFAULT 'cn',
  `fromdate` char(10) NOT NULL,
  `todate` char(10) NOT NULL,
  `schoolname` varchar(250) NOT NULL,
  `major` varchar(200) NOT NULL,
  `degree` varchar(200) NOT NULL,
  `modifydate` int(10) NOT NULL DEFAULT '0',
  `createdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `rtype` (`rtype`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=15 ;

--
-- Dumping data for table `zp_resume_edu`
--

INSERT INTO `zp_resume_edu` (`id`, `uid`, `rtype`, `fromdate`, `todate`, `schoolname`, `major`, `degree`, `modifydate`, `createdate`) VALUES
(1, 2, 'cn', '2012-1-1', '至今', '1234', '1234', '1', 0, '2012-02-27 15:40:20'),
(2, 3, 'cn', '2012-1-1', '至今', '1234', '1234', '1', 0, '2012-02-28 13:38:53'),
(3, 4, 'cn', '2012-1-1', '至今', '1234', '1234', '1', 0, '2012-02-28 13:54:21'),
(4, 7, 'cn', '2012-1-1', '至今', '12341', '1234', '1', 0, '2012-02-28 13:58:55'),
(5, 8, 'cn', '2012-1-1', '至今', '12341', '1234', '1', 0, '2012-02-28 14:00:12'),
(6, 9, 'cn', '2012-1-1', '至今', '12341', '1234', '1', 0, '2012-02-28 14:01:21'),
(7, 10, 'cn', '2012-1-1', '至今', '1234', '1234', '1', 0, '2012-02-28 14:02:18'),
(8, 11, 'cn', '2012-1-1', '至今', '12341', '1234', '1', 0, '2012-02-28 14:03:28'),
(9, 12, 'cn', '2012-1-1', '至今', '12341', '1234', '1', 0, '2012-02-28 14:04:26'),
(10, 13, 'cn', '2012-1-1', '至今', '1234', '2134', '1', 0, '2012-02-28 14:06:15'),
(11, 14, 'cn', '2012-1-1', '至今', '12341', '1234', '1', 0, '2012-02-28 14:16:52'),
(12, 15, 'cn', '2012-1-1', '至今', '12341234', '1234', '1', 0, '2012-02-28 14:19:13'),
(13, 16, 'cn', '2005-9-1', '至今', '湖北黄冈师院', '电子技术', '8', 0, '2012-03-09 11:43:10'),
(14, 17, 'cn', '2001-9-1', '2004-7-1', '工商大学', '工商管理', '8', 1331265660, '2012-03-09 12:00:25');

-- --------------------------------------------------------

--
-- Table structure for table `zp_resume_it`
--

DROP TABLE IF EXISTS `zp_resume_it`;
CREATE TABLE IF NOT EXISTS `zp_resume_it` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) unsigned NOT NULL DEFAULT '0',
  `rtype` enum('cn','en') NOT NULL DEFAULT 'cn',
  `skillname` varchar(250) NOT NULL,
  `ability` varchar(250) NOT NULL,
  `usetime` varchar(200) NOT NULL,
  `modifydate` int(10) NOT NULL DEFAULT '0',
  `createdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `rtype` (`rtype`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `zp_resume_it`
--

INSERT INTO `zp_resume_it` (`id`, `uid`, `rtype`, `skillname`, `ability`, `usetime`, `modifydate`, `createdate`) VALUES
(1, 16, 'cn', '计算机二级', '熟练', '6', 0, '2012-03-09 11:43:10'),
(2, 17, 'cn', 'word,excel', '熟练', '36', 1331265660, '2012-03-09 12:00:25');

-- --------------------------------------------------------

--
-- Table structure for table `zp_resume_lang`
--

DROP TABLE IF EXISTS `zp_resume_lang`;
CREATE TABLE IF NOT EXISTS `zp_resume_lang` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) unsigned NOT NULL DEFAULT '0',
  `rtype` enum('cn','en') NOT NULL DEFAULT 'cn',
  `language` varchar(250) NOT NULL,
  `rwability` varchar(250) NOT NULL,
  `lsability` varchar(200) NOT NULL,
  `modifydate` int(10) NOT NULL DEFAULT '0',
  `createdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `rtype` (`rtype`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=17 ;

--
-- Dumping data for table `zp_resume_lang`
--

INSERT INTO `zp_resume_lang` (`id`, `uid`, `rtype`, `language`, `rwability`, `lsability`, `modifydate`, `createdate`) VALUES
(1, 2, 'cn', '01', '熟练', '熟练', 0, '2012-02-27 15:40:20'),
(2, 3, 'cn', '01', '熟练', '熟练', 0, '2012-02-28 13:38:53'),
(3, 4, 'cn', '01', '熟练', '熟练', 0, '2012-02-28 13:54:21'),
(4, 5, 'cn', '01', '熟练', '熟练', 0, '2012-02-28 13:56:39'),
(5, 6, 'cn', '01', '熟练', '熟练', 0, '2012-02-28 13:57:35'),
(6, 7, 'cn', '01', '熟练', '熟练', 0, '2012-02-28 13:58:55'),
(7, 8, 'cn', '01', '熟练', '熟练', 0, '2012-02-28 14:00:12'),
(8, 9, 'cn', '01', '熟练', '熟练', 0, '2012-02-28 14:01:21'),
(9, 10, 'cn', '01', '熟练', '熟练', 0, '2012-02-28 14:02:18'),
(10, 11, 'cn', '01', '熟练', '熟练', 0, '2012-02-28 14:03:28'),
(11, 12, 'cn', '01', '熟练', '熟练', 0, '2012-02-28 14:04:26'),
(12, 13, 'cn', '01', '熟练', '熟练', 0, '2012-02-28 14:06:15'),
(13, 14, 'cn', '01', '熟练', '熟练', 0, '2012-02-28 14:16:52'),
(14, 15, 'cn', '01', '熟练', '熟练', 0, '2012-02-28 14:19:13'),
(15, 16, 'cn', '01', '熟练', '熟练', 0, '2012-03-09 11:43:10'),
(16, 17, 'cn', '10', '熟练', '熟练', 1331265660, '2012-03-09 12:00:25');

-- --------------------------------------------------------

--
-- Table structure for table `zp_resume_lock`
--

DROP TABLE IF EXISTS `zp_resume_lock`;
CREATE TABLE IF NOT EXISTS `zp_resume_lock` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cid` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  `rid` int(11) NOT NULL,
  `createtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `starttime` int(11) NOT NULL,
  `endtime` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cid` (`cid`,`uid`,`rid`),
  UNIQUE KEY `uid` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `zp_resume_lock`
--


-- --------------------------------------------------------

--
-- Table structure for table `zp_resume_price`
--

DROP TABLE IF EXISTS `zp_resume_price`;
CREATE TABLE IF NOT EXISTS `zp_resume_price` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `jid` int(11) NOT NULL COMMENT '简历类别id',
  `t_price` float NOT NULL COMMENT '文字简历价格',
  `v_price` float NOT NULL COMMENT '视频简历价格',
  PRIMARY KEY (`id`),
  UNIQUE KEY `jid` (`jid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `zp_resume_price`
--


-- --------------------------------------------------------

--
-- Table structure for table `zp_resume_tmp`
--

DROP TABLE IF EXISTS `zp_resume_tmp`;
CREATE TABLE IF NOT EXISTS `zp_resume_tmp` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cid` int(11) NOT NULL,
  `rid` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `createdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `cid` (`cid`,`rid`),
  KEY `status` (`status`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `zp_resume_tmp`
--


-- --------------------------------------------------------

--
-- Table structure for table `zp_resume_vod`
--

DROP TABLE IF EXISTS `zp_resume_vod`;
CREATE TABLE IF NOT EXISTS `zp_resume_vod` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) unsigned NOT NULL DEFAULT '0',
  `vodurl` varchar(255) NOT NULL,
  `vodimg` varchar(255) NOT NULL,
  `views` int(11) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `modifydate` int(10) unsigned NOT NULL DEFAULT '0',
  `createdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `zp_resume_vod`
--

INSERT INTO `zp_resume_vod` (`id`, `uid`, `vodurl`, `vodimg`, `views`, `status`, `modifydate`, `createdate`) VALUES
(1, 2, 'users/2012/02/27/4d09c6b01ec38075.flv', 'images/msdatu.jpg', 0, 1, 0, '2012-02-27 15:44:37');

-- --------------------------------------------------------

--
-- Table structure for table `zp_resume_work`
--

DROP TABLE IF EXISTS `zp_resume_work`;
CREATE TABLE IF NOT EXISTS `zp_resume_work` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) unsigned NOT NULL DEFAULT '0',
  `rtype` enum('cn','en') NOT NULL DEFAULT 'cn',
  `fromdate` char(10) NOT NULL,
  `todate` char(10) NOT NULL,
  `company` varchar(250) NOT NULL,
  `companytype` varchar(200) NOT NULL,
  `position` varchar(200) NOT NULL,
  `income` varchar(200) NOT NULL DEFAULT '0',
  `responsiblity` text NOT NULL COMMENT '工作描述',
  `modifydate` int(10) NOT NULL DEFAULT '0',
  `createdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=17 ;

--
-- Dumping data for table `zp_resume_work`
--

INSERT INTO `zp_resume_work` (`id`, `uid`, `rtype`, `fromdate`, `todate`, `company`, `companytype`, `position`, `income`, `responsiblity`, `modifydate`, `createdate`) VALUES
(1, 2, 'cn', '2012-1-1', '至今', '123', '1', '123', '1', '123', 0, '2012-02-27 15:40:20'),
(2, 3, 'cn', '2012-1-1', '至今', '1234', '1', '1234', '1', '1234', 0, '2012-02-28 13:38:53'),
(3, 4, 'cn', '2012-1-1', '至今', '123', '1', '123', '1', '1234', 0, '2012-02-28 13:54:21'),
(4, 5, 'cn', '2012-1-1', '至今', '1234', '1', '1234', '1', '1234', 0, '2012-02-28 13:56:39'),
(5, 6, 'cn', '2012-1-1', '至今', '1234', '1', '1234', '1', '1234', 0, '2012-02-28 13:57:35'),
(6, 7, 'cn', '2012-1-1', '至今', '1234', '1', '1234', '1', '1234', 0, '2012-02-28 13:58:55'),
(7, 8, 'cn', '2012-1-1', '至今', '1234', '1', '1234', '1', '1234', 0, '2012-02-28 14:00:12'),
(8, 9, 'cn', '2012-1-1', '至今', '1234', '1', '1234', '1', '1234', 0, '2012-02-28 14:01:21'),
(9, 10, 'cn', '2012-1-1', '至今', '1234', '1', '1234', '1', '1234', 0, '2012-02-28 14:02:18'),
(10, 11, 'cn', '2012-1-1', '至今', '1234', '1', '1234', '1', '1234', 0, '2012-02-28 14:03:28'),
(11, 12, 'cn', '2012-1-1', '至今', '1234', '1', '1234', '1', '1234', 0, '2012-02-28 14:04:26'),
(12, 13, 'cn', '2012-1-1', '至今', '1234', '1', '1234', '1', '1234', 0, '2012-02-28 14:06:15'),
(13, 14, 'cn', '2012-1-1', '至今', '123', '1', '1234', '1', '1234', 0, '2012-02-28 14:16:52'),
(14, 15, 'cn', '2012-1-1', '至今', '1234', '1', '1234', '1', '1234', 0, '2012-02-28 14:19:13'),
(15, 16, 'cn', '2011-6-15', '至今', '无', '1', '无', '1', '为应届毕业生', 0, '2012-03-09 11:43:10'),
(16, 17, 'cn', '2010-1-1', '2012-7-1', '纪恒集团', '1', '人事专员', '3', '人力资源相关事务', 1331265660, '2012-03-09 12:00:25');

-- --------------------------------------------------------

--
-- Table structure for table `zp_subcompany`
--

DROP TABLE IF EXISTS `zp_subcompany`;
CREATE TABLE IF NOT EXISTS `zp_subcompany` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cid` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `createdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `cid` (`cid`,`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `zp_subcompany`
--


-- --------------------------------------------------------

--
-- Table structure for table `zp_user`
--

DROP TABLE IF EXISTS `zp_user`;
CREATE TABLE IF NOT EXISTS `zp_user` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `username` varchar(50) DEFAULT NULL,
  `userphoto` varchar(255) DEFAULT NULL,
  `mobile` varchar(20) DEFAULT NULL,
  `usertype` enum('member','enterp') NOT NULL DEFAULT 'member',
  `idcard` varchar(250) NOT NULL,
  `allmoney` float(10,2) NOT NULL DEFAULT '0.00',
  `allpoint` int(10) NOT NULL DEFAULT '0',
  `resume_txt` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1中文2英文3中文+英文',
  `resume_vod` tinyint(1) NOT NULL DEFAULT '0',
  `resume_status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '求职状态',
  `puid` int(11) NOT NULL DEFAULT '0',
  `eid` int(11) NOT NULL DEFAULT '0',
  `jobid` int(11) NOT NULL DEFAULT '0',
  `edatetime` int(10) NOT NULL DEFAULT '0' COMMENT '录用时间',
  `etimes` int(10) NOT NULL DEFAULT '0' COMMENT '录用次数',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `regip` char(15) NOT NULL DEFAULT '0.0.0.0',
  `regdate` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `status` (`status`),
  KEY `email` (`email`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=19 ;

--
-- Dumping data for table `zp_user`
--

INSERT INTO `zp_user` (`id`, `email`, `password`, `username`, `userphoto`, `mobile`, `usertype`, `idcard`, `allmoney`, `allpoint`, `resume_txt`, `resume_vod`, `resume_status`, `puid`, `eid`, `jobid`, `edatetime`, `etimes`, `status`, `regip`, `regdate`) VALUES
(1, '123@sina.con', '25d55ad283aa400af464c76d713c07ad', NULL, NULL, '18213954043', 'member', '110106198007053431', 0.00, 0, 0, 0, 2, 0, 0, 1, 1331358659, 0, 1, '114.241.135.65', 1330264737),
(2, 'ut1@1.com', 'af75699691b3aae1169fe984f5c98f30', 'ut1', NULL, '13898987679', 'member', '132323456545678', 0.00, 0, 1, 1, 1, 0, 0, 0, 0, 0, 1, '58.246.139.98', 1330328286),
(3, 'ut2@1.com', 'af75699691b3aae1169fe984f5c98f30', 'ut2', NULL, '13876765654', 'member', '132345434545678', 0.00, 0, 1, 0, 2, 2, 2, 1, 1330408323, 1, 1, '58.246.139.98', 1330407483),
(4, 'ut3@1.com', 'af75699691b3aae1169fe984f5c98f30', 'ut3', NULL, '13987876543', 'member', '123456787654323', 0.00, 0, 1, 0, 2, 0, 2, 1, 1330408489, 0, 1, '58.246.139.98', 1330408415),
(5, 'ut4@1.com', 'af75699691b3aae1169fe984f5c98f30', 'ut4', NULL, '13489898787', 'member', '123432343433333', 0.00, 0, 1, 0, 2, 2, 2, 1, 1330409609, 1, 1, '58.246.139.98', 1330408568),
(6, 'ut5@1.com', 'af75699691b3aae1169fe984f5c98f30', 'ut5', NULL, '13989898098', 'member', '111111111111111', 0.00, 0, 1, 0, 2, 0, 2, 1, 1330409618, 0, 1, '58.246.139.98', 1330408623),
(7, 'ut6@1.com', 'af75699691b3aae1169fe984f5c98f30', 'ut6', NULL, '13989890000', 'member', '000000000000000', 0.00, 0, 1, 0, 2, 2, 2, 1, 1330409671, 1, 1, '58.246.139.98', 1330408705),
(8, 'ut7@1.com', 'af75699691b3aae1169fe984f5c98f30', 'ut7', NULL, '13987666666', 'member', '132222222222222', 0.00, 0, 1, 0, 2, 2, 2, 1, 1330409680, 1, 1, '58.246.139.98', 1330408776),
(9, 'ut8@1.com', 'af75699691b3aae1169fe984f5c98f30', 'ut8', NULL, '13876567890', 'member', '999999999999999', 0.00, 0, 1, 0, 2, 2, 2, 1, 1330409688, 1, 1, '58.246.139.98', 1330408841),
(10, 'ut9@1.com', 'af75699691b3aae1169fe984f5c98f30', 'ut9', NULL, '13989878909', 'member', '888888888888888', 0.00, 0, 1, 0, 2, 2, 2, 1, 1330409696, 1, 1, '58.246.139.98', 1330408904),
(11, 'ut10@1.com', 'af75699691b3aae1169fe984f5c98f30', 'ut10', NULL, '13989898909', 'member', '777777777777777', 0.00, 0, 1, 0, 2, 2, 2, 1, 1330409703, 1, 1, '58.246.139.98', 1330408968),
(12, 'u11@1.com', 'af75699691b3aae1169fe984f5c98f30', 'ut11', NULL, '13987878909', 'member', '098765666666666', 0.00, 0, 1, 0, 2, 2, 2, 1, 1330409712, 1, 1, '58.246.139.98', 1330409034),
(13, 'ut12@1.com', 'af75699691b3aae1169fe984f5c98f30', 'ut12', NULL, '13987878798', 'member', '666666666666666', 0.00, 0, 1, 0, 2, 2, 2, 1, 1330409724, 1, 1, '58.246.139.98', 1330409122),
(14, 'ut13@1.com', 'af75699691b3aae1169fe984f5c98f30', 'ut13', NULL, '13987876540', 'member', '123232321222222', 0.00, 0, 1, 0, 2, 2, 2, 1, 1330409844, 1, 1, '58.246.139.98', 1330409778),
(15, 'ut14@1.com', 'af75699691b3aae1169fe984f5c98f30', 'ut14', NULL, '13876767656', 'member', '143234544444445', 0.00, 0, 1, 0, 2, 2, 2, 1, 1330443368, 1, 1, '58.246.139.98', 1330409911),
(16, 'yaping4155@163.com', '4c16fc5a84cf62c6e4f5031522edd187', '白亚萍', NULL, '15936297202', 'member', '410181198508233523', 0.00, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, '111.161.64.190', 1331263818),
(17, 'yaoyao@chinawinhr.com.cm', 'a387773b2600d7e417b5c8faec6467df', '姚瑶', NULL, '13810857566', 'member', '110101198205270025', 0.00, 0, 1, 0, 1, 0, 0, 0, 0, 0, 1, '111.161.64.190', 1331264865),
(18, 'cuijiao@yahoo.com.cn', '25d55ad283aa400af464c76d713c07ad', NULL, NULL, '13661322333', 'member', '110108198504213687', 0.00, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, '111.161.64.190', 1331278372);

-- --------------------------------------------------------

--
-- Table structure for table `zp_user_account`
--

DROP TABLE IF EXISTS `zp_user_account`;
CREATE TABLE IF NOT EXISTS `zp_user_account` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL DEFAULT '0',
  `xid` int(11) NOT NULL DEFAULT '0',
  `eid` int(11) NOT NULL DEFAULT '0',
  `money` smallint(4) NOT NULL DEFAULT '0',
  `doact` tinyint(2) NOT NULL DEFAULT '0',
  `aclog` varchar(254) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `createdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `orderid` (`xid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=15 ;

--
-- Dumping data for table `zp_user_account`
--

INSERT INTO `zp_user_account` (`id`, `uid`, `xid`, `eid`, `money`, `doact`, `aclog`, `status`, `createdate`) VALUES
(1, 2, 3, 2, 100, 1, 'ct 录用了 您的朋友：ut2@1.com；职位为：ct职位1', 1, '2012-02-28 13:52:03'),
(2, 2, 5, 2, 100, 1, 'ct 录用了 您的朋友：ut4@1.com；职位为：ct职位1', 1, '2012-02-28 14:13:29'),
(3, 2, 7, 2, 100, 1, 'ct 录用了 您的朋友：ut6@1.com；职位为：ct职位1', 1, '2012-02-28 14:14:31'),
(4, 2, 8, 2, 100, 1, 'ct 录用了 您的朋友：ut7@1.com；职位为：ct职位1', 1, '2012-02-28 14:14:40'),
(5, 2, 9, 2, 100, 1, 'ct 录用了 您的朋友：ut8@1.com；职位为：ct职位1', 1, '2012-02-28 14:14:48'),
(6, 2, 10, 2, 100, 1, 'ct 录用了 您的朋友：ut9@1.com；职位为：ct职位1', 1, '2012-02-28 14:14:56'),
(7, 2, 11, 2, 100, 1, 'ct 录用了 您的朋友：ut10@1.com；职位为：ct职位1', 1, '2012-02-28 14:15:03'),
(8, 2, 12, 2, 100, 1, 'ct 录用了 您的朋友：u11@1.com；职位为：ct职位1', 1, '2012-02-28 14:15:12'),
(9, 2, 13, 2, 100, 1, 'ct 录用了 您的朋友：ut12@1.com；职位为：ct职位1', 1, '2012-02-28 14:15:24'),
(10, 2, 14, 2, 100, 1, 'ct 录用了 您的朋友：ut13@1.com；职位为：ct职位1', 1, '2012-02-28 14:17:24'),
(11, 2, 15, 2, 100, 1, 'ct 录用了 您的朋友：ut14@1.com；职位为：ct职位1', 1, '2012-02-28 23:36:08'),
(12, 2, 0, 0, 1100, -1, '申请领款“&yen;110元”', 0, '2012-02-29 17:23:22'),
(13, 2, 0, 0, 1100, 1, '驳回申领款项“&yen;1100元”', 0, '2012-02-29 17:23:22'),
(14, 2, 0, 0, 1100, -1, '申请领款“&yen;110元”', 2, '2012-02-29 18:21:17');

-- --------------------------------------------------------

--
-- Table structure for table `zp_user_bank`
--

DROP TABLE IF EXISTS `zp_user_bank`;
CREATE TABLE IF NOT EXISTS `zp_user_bank` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL DEFAULT '0',
  `type` enum('bank','alipay') NOT NULL DEFAULT 'bank',
  `bank_name` varchar(254) NOT NULL,
  `bank_kaihu` varchar(254) NOT NULL DEFAULT '',
  `card_user` varchar(254) NOT NULL,
  `card_number` varchar(254) NOT NULL,
  `createdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `zp_user_bank`
--

INSERT INTO `zp_user_bank` (`id`, `uid`, `type`, `bank_name`, `bank_kaihu`, `card_user`, `card_number`, `createdate`) VALUES
(1, 2, 'bank', '工商银行', '工商银行开户', '工商银行持有人', '8888888888888888', '2012-02-28 23:37:09');

-- --------------------------------------------------------

--
-- Table structure for table `zp_user_point`
--

DROP TABLE IF EXISTS `zp_user_point`;
CREATE TABLE IF NOT EXISTS `zp_user_point` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL DEFAULT '0',
  `points` int(10) NOT NULL DEFAULT '0',
  `doact` tinyint(2) NOT NULL DEFAULT '0',
  `aclog` varchar(254) DEFAULT NULL,
  `createdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `zp_user_point`
--


SET FOREIGN_KEY_CHECKS=1;

COMMIT;
