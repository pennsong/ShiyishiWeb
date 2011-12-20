-- phpMyAdmin SQL Dump
-- version 3.1.2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Dec 20, 2011 at 04:42 AM
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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `zp_admin`
--

INSERT INTO `zp_admin` (`id`, `admin_number`, `admin_name`, `admin_email`, `admin_password`, `admin_realname`, `admin_zhiwu`, `admin_purview`, `admin_citys`, `admin_desc`, `admin_state`, `admin_lastloginip`, `admin_lastlogintime`, `admin_logintimes`, `admin_createtime`) VALUES
(1, 'A001', 'admin', 'admin@shiyishi.cn', 'e9205cefc6d71c930b20a5af7463e697', 'Admin', 1, NULL, 'a:5:{i:0;s:1:"1";i:1;s:1:"2";i:2;s:1:"3";i:3;s:1:"4";i:4;s:1:"6";}', '总管理员', 1, NULL, 1324027044, 0, '2010-03-20 11:28:57'),
(2, 't01', 'admint01', '123456ssss@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'admint01', 1, NULL, 'N;', NULL, 1, NULL, 1321421219, 0, '2011-10-25 18:17:14'),
(3, 't02', 'admint02', 'danieldu1018@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'danieldu', 1, NULL, 'a:26:{i:0;s:1:"1";i:1;s:1:"3";i:2;s:1:"4";i:3;s:2:"11";i:4;s:2:"17";i:5;s:1:"5";i:6;s:2:"14";i:7;s:2:"29";i:8;s:2:"26";i:9;s:2:"15";i:10;s:2:"22";i:11;s:2:"16";i:12;s:2:"28";i:13;s:2:"19";i:14;s:2:"30";i:15;s:2:"10";i:16;s:2:"20";i:17;s:1:"6";i:18;s:1:"9', NULL, 1, NULL, 0, 0, '2011-10-31 10:08:55');

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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=421 ;

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
(420, 1, 'admin【管理员】', 'logout', 'index', 'admin【管理员】在 #TIME# 退出系统', 'http://admin.shiyishi.cn/logout.do', '58.246.139.98', '2011-12-16 17:18:07');

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
(420, 'a:0:{}');

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=86 ;

--
-- Dumping data for table `zp_app_person_interview`
--

INSERT INTO `zp_app_person_interview` (`id`, `uid`, `aid`, `starttime`, `endtime`, `status`) VALUES
(4, 14, 13, 1306279800, 1306467000, 1),
(5, 12, 13, 1306279800, 1306467000, 1),
(6, 11, 13, 1306279800, 1306467000, 1),
(7, 2, 13, 1306279800, 1306467000, 1),
(8, 1, 13, 1306279800, 1306467000, 1),
(21, 2, 11, 1305252000, 1305268200, 1),
(22, 2, 12, 1305245700, 1305246600, 0),
(23, 1, 12, 1305246600, 1305249300, 0),
(24, 2, 14, 1304784000, 1304784900, 1),
(25, 1, 14, 1304784900, 1304785800, 1),
(26, 2, 15, 1304820000, 1304857800, 1),
(27, 1, 15, 1304820000, 1304857800, 1),
(28, 2, 16, 1305219600, 1307798100, 0),
(29, 1, 16, 1305219600, 1307798100, 0),
(32, 2, 18, 1305216000, 1307807100, 0),
(33, 1, 18, 1305216000, 1307807100, 0),
(34, 11, 19, 1305390600, 1305395100, 0),
(35, 2, 19, 1305390600, 1305395100, 0),
(36, 1, 19, 1305390600, 1305395100, 0),
(37, 14, 20, 1305477000, 1305565200, 0),
(38, 12, 20, 1305477000, 1305565200, 0),
(39, 11, 20, 1305477000, 1305565200, 0),
(40, 2, 20, 1305477000, 1305565200, 0),
(41, 1, 20, 1305477000, 1305565200, 0),
(42, 2, 21, 1308189600, 1308211200, 0),
(43, 1, 21, 1308189600, 1308211200, 0),
(44, 14, 22, 1305640800, 1305729000, 0),
(45, 12, 22, 1305640800, 1305729000, 0),
(46, 11, 22, 1305640800, 1305729000, 0),
(47, 2, 22, 1305640800, 1305729000, 0),
(48, 1, 22, 1305640800, 1305729000, 0),
(49, 14, 23, 1305759600, 1305845100, 0),
(50, 11, 23, 1305759600, 1305845100, 0),
(51, 2, 23, 1305759600, 1305845100, 0),
(53, 2, 17, 1305735300, 1307802600, 0),
(54, 1, 17, 1305735300, 1307802600, 0),
(55, 14, 24, 1305909900, 1306082700, 0),
(56, 11, 24, 1305909900, 1306082700, 0),
(57, 2, 24, 1305909900, 1306082700, 0),
(58, 1, 24, 1305909900, 1306082700, 0),
(59, 11, 25, 1306100700, 1306102500, 0),
(60, 11, 26, 1306037700, 1306133100, 0),
(61, 1, 26, 1306037700, 1306133100, 0),
(62, 14, 27, 1305993600, 1306845000, 0),
(63, 12, 27, 1305993600, 1306845000, 0),
(64, 11, 27, 1305993600, 1306845000, 0),
(65, 2, 27, 1305993600, 1306845000, 0),
(66, 1, 27, 1305993600, 1306845000, 0),
(67, 14, 28, 1306036800, 1306123200, 0),
(68, 12, 28, 1306036800, 1306123200, 0),
(69, 11, 28, 1306036800, 1306123200, 0),
(70, 2, 28, 1306036800, 1306123200, 0),
(71, 1, 28, 1306036800, 1306123200, 0),
(72, 14, 29, 1305993600, 1306080900, 1),
(73, 11, 29, 1305993600, 1306080900, 1),
(74, 2, 29, 1305993600, 1306080900, 1),
(75, 1, 29, 1305993600, 1306080900, 1),
(76, 36, 30, 1309528800, 1311132600, 1),
(77, 11, 30, 1309528800, 1311132600, 1),
(78, 1, 30, 1309528800, 1311132600, 1),
(79, 48, 31, 1309665600, 1309762800, 0),
(80, 33, 31, 1309665600, 1309762800, 0),
(81, 20, 31, 1309665600, 1309762800, 0),
(82, 11, 31, 1309665600, 1309762800, 0),
(83, 2, 31, 1309665600, 1309762800, 0),
(84, 1, 31, 1309665600, 1309762800, 0),
(85, 98, 32, 1318435200, 1318450500, 1);

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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=424 ;

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
(422, '东城', 'dongcheng', 1, 50, -1);

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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=25 ;

--
-- Dumping data for table `zp_contract`
--

INSERT INTO `zp_contract` (`id`, `uid`, `code`, `wordall`, `word`, `videoall`, `video`, `postall`, `post`, `startdate`, `enddate`, `createdate`) VALUES
(1, 1, 'ssssss600', 200, 200, 200, 173, 100, 100, 1234540800, 1407772800, '2011-07-07 17:24:25'),
(2, 7, '123', 200, 198, 200, 199, 0, 82, 1302710400, 1334332800, '2011-04-26 21:19:16'),
(3, 7, '11111111', 100, 97, 100, 96, 100, 100, 1299772800, 1310313600, '2011-07-07 17:16:51'),
(4, 2, 'g34g3gtg', 100, 95, 100, 95, 50, 49, 1306080000, 1308758400, '2011-04-25 18:49:41'),
(5, 2, 'ht1002', 1000, 998, 1000, 999, 2000, 2000, 1304179200, 1335801600, '2011-05-07 21:55:40'),
(6, 1, 'SYS000024325', 99, 74, 99, 76, 100, 100, 1305907200, 1337529600, '2011-07-11 17:15:16'),
(7, 15, '12312312313', 0, 0, 0, 0, 0, 0, 1308499200, 1340121600, '2011-06-20 10:30:10'),
(8, 1, 'SYS201107020001', 200, 194, 200, 194, 100, 100, 1309536000, 1372694400, '2011-07-11 16:50:13'),
(9, 12, 'SYS00000102', 100, 76, 100, 77, 100, 100, 1310054400, 1341676800, '2011-07-27 15:12:16'),
(10, 1, 'SYS00015421', 99, 99, 99, 99, 100, 100, 1310054400, 1341763200, '2011-07-08 10:59:57'),
(11, 27, '465', 10, 8, 10, 9, 100, 100, 1310486400, 1311696000, '2011-07-13 15:26:50'),
(12, 27, '456', 200, 195, 200, 198, 100, 100, 1311696000, 1314374400, '2011-07-27 12:34:02'),
(13, 31, '110', 100, 99, 100, 99, 100, 100, 1312819200, 1315497600, '2011-08-09 18:19:18'),
(14, 15, '111', 100, 100, 100, 100, 100, 100, 1316016000, 1318608000, '2011-09-15 15:33:21'),
(15, 38, '123', 100, 99, 100, 100, 100, 100, 1316102400, 1317398400, '2011-09-17 01:32:34'),
(16, 36, 'en001', 50, 45, 50, 46, 100, 100, 1315843200, 1378828800, '2011-09-20 14:01:54'),
(17, 40, '001', 100, 98, 100, 99, 100, 100, 1316534400, 1316620800, '2011-09-21 16:30:03'),
(18, 46, 'nike001', 200, 200, 200, 200, 100, 100, 1318262400, 1349884800, '2011-10-11 15:35:02'),
(19, 41, 'daniel001', 200, 196, 200, 197, 100, 100, 1318176000, 1319990400, '2011-10-12 14:39:46'),
(20, 38, 'songcompany', 200, 185, 200, 199, 100, 100, 1318262400, 1351699200, '2011-10-12 19:36:22'),
(21, 47, 'tc00001', 200, 199, 200, 199, 100, 100, 1318867200, 1325260800, '2011-10-18 18:16:45'),
(22, 53, 'qiyetest1', 100, 99, 100, 99, 100, 100, 1319990400, 1354032000, '2011-11-10 15:54:13'),
(23, 54, 't01-1', 1000, 960, 0, 0, 100, 100, 1321200000, 1323792000, '2011-11-14 14:08:09'),
(24, 55, 't01-2', 5000, 4970, 0, 0, 100, 100, 1321200000, 1323792000, '2011-11-14 14:08:56');

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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=13 ;

--
-- Dumping data for table `zp_dustrytype`
--

INSERT INTO `zp_dustrytype` (`id`, `thename`, `enname`, `parent_id`, `order_id`, `createdate`) VALUES
(1, '计算机/互联网/通信/电子', '', 0, 1, '2011-03-28 17:44:48'),
(2, '计算机软件', '', 1, 1, '2011-03-28 17:45:06'),
(3, '会计/金融/银行/保险', '', 0, 2, '2011-03-28 17:47:03'),
(4, '会计/审计', '', 3, 1, '2011-03-28 17:47:18'),
(9, '煤炭行业', 'meitan', 0, 0, '2011-07-03 19:50:04'),
(7, '人力资源', 'HR', 0, 0, '2011-05-22 14:33:36'),
(8, '社保专员', 'sp', 7, 0, '2011-05-22 14:34:44'),
(10, '煤炭二级', '123', 9, 0, '2011-07-03 19:50:26'),
(11, '消费品', 'consumption', 0, 0, '2011-10-11 15:45:54'),
(12, '导购', 'athelete', 11, 0, '2011-10-11 16:12:16');

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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=39 ;

--
-- Dumping data for table `zp_enrolllog`
--

INSERT INTO `zp_enrolllog` (`id`, `eid`, `jobid`, `uid`, `usercard`, `status`, `createdate`) VALUES
(1, 11, 0, 50, '370809198512231862', 0, '2011-07-01 15:54:40'),
(2, 11, 0, 49, '370809198512231861', 0, '2011-07-01 15:54:44'),
(3, 11, 0, 12, '110108197011104934', 0, '2011-07-01 16:46:12'),
(4, 11, 0, 11, '370802198512219513', 0, '2011-07-01 16:46:15'),
(5, 11, 0, 1, '362523198411214411', 0, '2011-07-01 16:46:18'),
(6, 11, 0, 50, '370809198512231862', 0, '2011-07-01 16:46:41'),
(7, 11, 0, 50, '370809198512231862', 0, '2011-07-02 19:18:36'),
(8, 11, 0, 49, '370809198512231861', 0, '2011-07-02 22:07:50'),
(9, 11, 0, 11, '370802198512219513', 0, '2011-07-02 22:08:19'),
(10, 11, 0, 36, '37080919851223186X', 0, '2011-07-02 22:08:25'),
(11, 11, 0, 48, '370802198512219511', 0, '2011-07-03 19:53:46'),
(12, 1, 21, 43, '362523198411214411', 1, '2011-07-07 16:47:13'),
(13, 27, 0, 69, '110106198205210949', 1, '2011-07-13 15:40:13'),
(14, 1, 21, 39, '370809198512231865', 1, '2011-07-26 18:36:46'),
(15, 1, 21, 36, '37080919851223186X', 1, '2011-07-26 18:52:49'),
(16, 12, 25, 11, '370802198512219513', 1, '2011-07-26 23:51:28'),
(17, 27, 32, 68, '110108197011104938', 0, '2011-07-27 12:37:05'),
(18, 12, 31, 48, '370802198512219511', 1, '2011-07-27 13:27:01'),
(19, 27, 32, 24, 'xxxxxxxxxxxxxxxx', 1, '2011-07-27 14:35:26'),
(20, 12, 31, 50, '370809198512231862', 0, '2011-07-27 15:13:35'),
(21, 12, 31, 49, '370809198512231861', 1, '2011-07-27 15:26:19'),
(22, 12, 31, 72, '37080219251221951X', 1, '2011-07-27 16:28:00'),
(23, 27, 32, 73, '110106198205210947', 0, '2011-08-09 14:50:14'),
(24, 27, 32, 73, '110106198205210947', 0, '2011-08-09 17:55:00'),
(25, 27, 32, 73, '110106198205210947', 0, '2011-08-09 17:58:22'),
(26, 27, 32, 68, '110108197011104938', 0, '2011-08-09 18:13:17'),
(27, 27, 32, 77, '110106198205210939', 1, '2011-08-22 11:08:52'),
(28, 40, 35, 97, '110106198205210960', 0, '2011-09-21 17:18:35'),
(29, 38, 39, 98, '110105197301119449', 1, '2011-10-12 19:36:45'),
(30, 38, 39, 101, '989898989898989', 0, '2011-10-12 19:44:55'),
(31, 41, 36, 99, '322222222222222222', 1, '2011-10-13 17:52:34'),
(32, 41, 38, 103, '311111222222222222', 1, '2011-10-18 16:03:56'),
(33, 47, 40, 107, '310111111111111112', 0, '2011-10-18 18:32:10'),
(34, 54, 44, 130, '110108197012304946', 1, '2011-11-16 14:25:20'),
(35, 55, 46, 132, '110108197012304948', 0, '2011-11-16 14:43:01'),
(36, 0, 46, 132, '110108197012304948', 1, '2011-11-16 16:10:54'),
(37, 54, 44, 126, '110108197012304942', 1, '2011-12-03 23:46:22'),
(38, 38, 42, 141, '878987899998787', 1, '2011-12-16 17:21:09');

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
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=58 ;

--
-- Dumping data for table `zp_e_user`
--

INSERT INTO `zp_e_user` (`id`, `username`, `password`, `company`, `company_s`, `dustrytype`, `company_type`, `company_scale`, `company_properties`, `live_gnd_p`, `live_gnd_c`, `live_address`, `postcode`, `address`, `contact`, `tel`, `mobile`, `dtype`, `durl`, `email`, `logo`, `info`, `status`, `createtime`, `lasttime`, `ip`) VALUES
(1, '123', '202cb962ac59075b964b07152d234b70', 'xyz', '1234hrjigoumain', '3', 2, 2, 2, 1, 421, '', '100085', '地方sgs地方地方sgs地方地方sgs地方地方sgs地方地方sgs地方地方sgs地方地方sgs地方', '萨达', '58901234', '', 0, 'users/2011/04/12/6579ad0ee4998128.jpg', 'sdfsdf@163.com', 'http://img.channelwin.info/users/2011/04/13/8c501ed65f2b238c_192_60.gif', '1地方sgs地方地方sgs地方地方sgs地方地方sgs地方地方sgs地方地方sgs地方地方sgs地方地方sgs地方地方sgs地方地方sgs地方地方sgs地方地方sgs地方地方sgs地方地方sgs地方地方sgs地方地方sgs地方地方sgs地方地方sgs地方地方sgs地方地方sgs地方地方sgs地方地方sgs地方地方sgs地方地方sgs地方地方sgs地方地方sgs地方地方sgs地方地方sgs地方123', 0, 1234567890, 1302621980, '127.0.0.1'),
(22, 'sousou', 'f379eaf3c831b04de153469d1bec345e', '搜搜', '', '', 0, 0, 0, 0, 0, NULL, '', '', '搜搜', '010-15231254', '13134567812', 0, '', 'asdasd@12212.com', '', '', 0, 1310029871, 1310097374, '114.247.42.60'),
(3, '2345', 'e3ceb5881a0a1fdaad01296d7554868d', '哇哈哈', '', '', 0, 0, 0, 0, 0, NULL, '', '', '哇哈哈', '010-58683214', '13811058238', 1, '', '5454545@163.com', '', '', 0, 1302361616, 1302621908, '123.103.6.11'),
(4, '', '', 'aaaaa', '', '', 0, 0, 0, 0, 0, NULL, '', '', 'aaaa', '010-89738888-101', '15901281136', 0, 'users/2011/04/12/', 'arlicn9@126.com', '', '', 0, 1302623402, 1305796641, '117.79.232.153'),
(5, 'aaaa', '0b4e7a0e5fe84ad35fb5f95b9ceeac79', 'aaaaa', 'aaa', '1', 1, 1, 0, 1, 421, NULL, '100085', '地方公司的风格地方个地方时公司的飞', 'aaaaa', '010-89738888', '13810888888', 1, '', 'sdfsdf@163.com', NULL, '第三方刚斯蒂芬告诉对方告诉对方告诉对方个第三方刚斯蒂芬告诉对方告诉对方告诉对方个第三方刚斯蒂芬告诉对方告诉对方告诉对方个第三方刚斯蒂芬告诉对方告诉对方告诉对方个第三方刚斯蒂芬告诉对方告诉对方告诉对方个第三方刚斯蒂芬告诉对方告诉对方告诉对方个第三方刚斯蒂芬告诉对方告诉对方告诉对方个第三方刚斯蒂芬告诉对方告诉对方告诉对方个第三方刚斯蒂芬告诉对方告诉对方告诉对方个第三方刚斯蒂芬告诉对方告诉对方告诉对方个', 0, 1302623588, 1302623644, '117.79.83.161'),
(6, 'bbbbbb', '875f26fdb1cecf20ceb4ca028263dec6', '地对地导弹', '', '', 0, 0, 0, 0, 0, NULL, '', '', '地对地导弹', '010-89738888', '13810888888', 0, 'users/2011/04/12/6579ad0ee4998128.jpg', 'sdfsdssdf@163.com', '', '', 0, 1302623783, 1305796873, '117.79.83.161'),
(7, 'jiadaoyun8', '21232f297a57a5a743894a0e4a801fc3', '小马的公司', '', '', 0, 0, 0, 0, 0, NULL, '', '', '小马', '12312323', '13439904554', 0, 'users/2011/04/13/', 'asdasd@1256.com', '', '', 0, 1302659224, 1302747388, '114.249.223.233'),
(8, '1231231', '4297f44b13955235245b2497399d7a93', '123456ssss', '', '', 0, 0, 0, 0, 0, NULL, '', '', '123456ssss', '138000000', '13800000000', 0, '/users/2011/04/26/4b388685f8c2e6e2_80_80.PNG', '123456ssss@gmail.com', '', '', 0, 1303801156, 1305432228, '222.71.24.17'),
(17, '华夏', 'f379eaf3c831b04de153469d1bec345e', '华夏', '', '', 0, 0, 0, 0, 0, NULL, '', '', '1213', '122-51214214', '13111111111', 0, '', '3123@1.com', '', '', 0, 1308552692, 1308552711, '1.202.198.123'),
(10, '', '', 'fesatgrew', '', '', 0, 0, 0, 0, 0, NULL, '', '', 'freafe', '12344554', '13111111111', 0, '', 'ewaf@q.cm', '', '', 0, 1305385567, 0, '222.128.169.5'),
(11, '', '', '搜狐', '搜狐', '7', 1, 5, 1, 1, 418, NULL, '100084', '北京市海淀区中关村东路1号搜狐网络大厦', '小马', '010-62977545', '13439904554', 0, '/users/2011/05/21/9d26ec0ec8d855cc_80_80.gif', 'jiadaoyun@126.com', 'http://img.shiyishi.cn/users/2011/07/02/330b9db298f72905_192_60.jpg', '非常好的大公司！', 0, 1305954946, 1310097076, '114.249.231.125'),
(12, 'xinlang', '96e79218965eb72c92a549dd5a330112', '新浪', '新浪', '7', 1, 3, 1, 1, 418, '', '100084', '中关村', '小马', '010-62977545', '13439904554', 0, '/users/2011/05/21/621db30fc2d5aa33_80_80.gif', 'jiadaoyun@163.com', 'http://img.shiyishi.cn/users/2011/07/27/eec93ee8f3e27c1f_192_60.jpg', '海景房济公活佛<br />', 0, 1305955109, 1309587276, '114.249.231.125'),
(18, '3M3M', 'f379eaf3c831b04de153469d1bec345e', 'ssss123456ssss2', '', '', 0, 0, 0, 0, 0, NULL, '', '', 'ssss123456ssss2', '12345678901', '13800000000', 1, '', 'ssss123456ssss2@sohu.com', '', '', 0, 1308903393, 1310022218, '58.246.139.98'),
(14, '51job', '4297f44b13955235245b2497399d7a93', '51job', '', '', 0, 0, 0, 0, 0, NULL, '', '', '小贾', '010-62977545', '13439904554', 0, '/users/2011/05/26/8e984c88ecee185a_80_80.jpg', '8wy493717@163.com', '', '', 0, 1306395333, 1306395373, '114.249.227.80'),
(15, '华章', '96e79218965eb72c92a549dd5a330112', '华章', '', '', 0, 0, 0, 0, 0, NULL, '', '', '宋煜', '51316189', '13910985865', 0, '', 'songyu@chinawinhr.com', '', '', 0, 1308468000, 1308469053, '119.57.31.104'),
(16, '', '', '小强', '', '', 0, 0, 0, 0, 0, NULL, '', '', '123', '010-22222222', '13439904559', 1, '', 'asdasd@1212.com', '', '', 0, 1308536533, 1308536562, '1.202.198.123'),
(19, 'sadasd', 'f379eaf3c831b04de153469d1bec345e', 'ssss123456ssss3', '', '', 0, 0, 0, 0, 0, NULL, '', '', 'ssss123456ssss2', '12345678901', '13800000000', 0, '/users/2011/06/24/1cd4f0190c6b7d95_80_80.png', 'ssss123456ssss3@sohu.com', '', '', 0, 1308903660, 1310022174, '58.246.139.98'),
(20, '1111', 'f379eaf3c831b04de153469d1bec345e', '1111', '', '', 0, 0, 0, 0, 0, NULL, '', '', '1111', '88888888', '13111111111', 0, '', '1212@1.cn', '', '', 0, 1309604797, 1309604817, '114.249.235.107'),
(21, '华章1', 'f379eaf3c831b04de153469d1bec345e', '北京华章', '', '', 0, 0, 0, 0, 0, NULL, '', '', '宋玉', '51316189', '13910986865', 0, '', 'songyu@chinawinhr.com.cn', '', '', 0, 1309686502, 1309686914, '114.245.191.57'),
(23, 'soso', 'f379eaf3c831b04de153469d1bec345e', '搜搜', '', '', 0, 0, 0, 0, 0, NULL, '', '', '搜搜', '010-15231254', '13134567812', 0, '', 'asdasd@12212.com', '', '', 0, 1310030033, 1310030071, '114.247.42.60'),
(24, '搜索', 'f379eaf3c831b04de153469d1bec345e', '搜索', '', '', 0, 0, 0, 0, 0, NULL, '', '', '搜索', '010-99999999', '13313434541', 0, '', 'ss@ss.com', '', '', 0, 1310092952, 1310092966, '114.247.42.60'),
(26, '', '', '', '', '', 0, 0, 0, 0, 0, NULL, '', '', '', '', '', 0, '', '', NULL, NULL, 0, 1310105772, 0, '123.126.50.81'),
(27, '华章3', '21218cca77804d2ba1922c33e0151105', '华章3', '华章', '7', 4, 3, 1, 1, 418, '', '100022', '关东店南街2号', '宋玉', '51316189', '13910986865', 0, '', 'songyu@126.net', 'http://img.shiyishi.cn/users/2011/07/27/4b3ea4b0443876ad_192_60.jpg', '不错', 0, 1310538798, 1310538923, '119.57.31.110'),
(28, '', '', '', '', '', 0, 0, 0, 0, 0, NULL, '', '', '', '', '', 0, '', '', NULL, NULL, 0, 1310603517, 0, '220.181.125.45'),
(29, '', '', '', '', '', 0, 0, 0, 0, 0, NULL, '', '', '', '', '', 0, '', '', NULL, NULL, 0, 1311454077, 0, '220.181.125.45'),
(30, '', '', '', '', '', 0, 0, 0, 0, 0, NULL, '', '', '', '', '', 0, '', '', NULL, NULL, 0, 1312073636, 0, '220.181.125.45'),
(31, '华章4', 'f379eaf3c831b04de153469d1bec345e', '华章4', '华章4', '7', 6, 2, 2, 1, 418, '', '100022', '关东店南街2号', '宋玉', '51316189', '13910985865', 0, '', 'songyu@163.com', 'http://img.shiyishi.cn/users/2011/08/09/54757152b86130f0_192_60.jpg', '专业人力资源公司<br />', 0, 1312867139, 1312867249, '119.57.31.110'),
(32, '', '', '', '', '', 0, 0, 0, 0, 0, NULL, '', '', '', '', '', 0, '', '', NULL, NULL, 0, 1313564512, 0, '220.181.125.45'),
(33, '', '', '', '', '', 0, 0, 0, 0, 0, NULL, '', '', '', '', '', 0, '', '', NULL, NULL, 0, 1314713663, 0, '58.30.239.130'),
(34, '', '', '', '', '', 0, 0, 0, 0, 0, NULL, '', '', '', '', '', 0, '', '', NULL, NULL, 0, 1315388086, 0, '220.181.125.45'),
(35, '', '', '', '', '', 0, 0, 0, 0, 0, NULL, '', '', '', '', '', 0, '', '', NULL, NULL, 1, 1315965264, 0, '58.30.239.130'),
(36, 'en', 'f379eaf3c831b04de153469d1bec345e', 'enterprisetest', '1', '9', 1, 1, 2, 1, 418, '', '200001', '1', 'test', '021-12345678', '13000000009', 0, '', 'ssss123456ssss@163.com', '', '1', 2, 1316068487, 1316068978, '58.246.139.98'),
(37, '华章5', 'f379eaf3c831b04de153469d1bec345e', '华章', '', '', 0, 0, 0, 0, 0, '', '', '', 'david', '51316189', '13333333333', 0, '', 'david@126.net', '', '', 2, 1316071800, 1316071848, '119.57.31.110'),
(38, 'songcompany', 'f379eaf3c831b04de153469d1bec345e', 'songcompany', '123', '7', 2, 1, 1, 1, 418, '', '200001', '123', 'song', '12345678', '13100000000', 0, '', 'ssss123456ssssa@163.com', 'http://img.shiyishi.cn/users/2011/10/10/93d29c363b755983_192_60.png', '123', 2, 1316194094, 1316194136, '114.94.205.144'),
(39, '华章6', 'f379eaf3c831b04de153469d1bec345e', '华章', '', '', 0, 0, 0, 0, 0, '', '', '', 'david', '51316189', '13333333333', 0, '', 'david@126.com', '', '', 1, 1316507851, 1316507879, '119.57.31.110'),
(40, '视一视', 'f379eaf3c831b04de153469d1bec345e', '视一视招聘网', '视一视', '7', 6, 2, 2, 1, 418, '', '100022', '北京朝阳区关东店南街2号旺座中心0615', 'david', '51316189', '13910585865', 0, '', 'songyu@chianwinhr.com.cn', 'http://img.shiyishi.cn/users/2011/09/21/ffa86f97b434f3bd_192_60.jpg', '&nbsp; \r\n<div class="O" v:shape="_x0000_s1026">\r\n<div><strong>北京华章人力资源顾问有限公司是2006年经北京市工商行政管理局批准，北京市劳动和社会保障局、北京市人事局特许经营，注册成立的一家专业的人力资源服务公司，专业从事劳务派遣、人事外包、人才中介、人才租赁、法律咨询、培训等人力资源服务项目。 </strong></div>\r\n<div></div></div>', 2, 1316584945, 1316584996, '119.57.31.110'),
(41, 'danieldu1018', 'e72d179ef06090edd513664c7ad2309b', '丹你', '丹你', '1', 9, 2, 2, 31, 11, '', '200000', '111111', 'danieldu', '31268010', '13764504506', 0, '', 'danieldu1018@gmail.com', 'http://img.shiyishi.cn/users/2011/09/21/7187fa2be3f93124_192_60.png', '1111', 2, 1316586149, 1316658659, '58.246.139.98'),
(42, '', '', 'channelwin daniel', '', '', 0, 0, 0, 0, 0, NULL, '', '', 'daniel', '44433333', '13111111111', 0, '', 'danieldu1018@sina.com', NULL, NULL, 1, 1316658564, 0, '58.246.139.98'),
(43, '', '', '', '', '', 0, 0, 0, 0, 0, NULL, '', '', '', '', '', 0, '', '', NULL, NULL, 1, 1316968209, 0, '58.30.239.130'),
(44, '', '', '', '', '', 0, 0, 0, 0, 0, NULL, '', '', '', '', '', 0, '', '', NULL, NULL, 1, 1317204095, 0, '220.181.125.45'),
(45, '', '', '', '', '', 0, 0, 0, 0, 0, NULL, '', '', '', '', '', 0, '', '', NULL, NULL, 1, 1318063721, 0, '58.30.239.130'),
(46, 'nike', 'f379eaf3c831b04de153469d1bec345e', 'Nike中国', '', '11', 1, 4, 1, 1, 419, '', '100020', '北京市朝阳区关东店南街2号旺座中心东塔0615', '崔姣', '51316183', '13552586651', 0, '', 'cuijiao@chinawinhr.com.cn', '', '<p>耐克（NIKE）体育（中国）有限公司总部位于美国俄勒冈州，是世界领先体育用品公司之一，NIKE品牌家喻户晓。NIKE在全球拥有23,000名员工，随着NIKE在中国业务的快速增长，诚邀人才加入NIKE团队，并为您提供在NIKE大家庭的职业发展机会。目前，现委托北京华章人力资源顾问有限公司为NIKE代理招聘导购，欢迎有意者前来垂询。</p>', 2, 1318318362, 1318318421, '119.57.31.110'),
(47, 'testcompany10', 'e10adc3949ba59abbe56e057f20f883e', '测试公司10', '测试公司10', '7', 1, 1, 1, 3, 420, '', '200000', '11111', '丹尼尔', '50777777', '13000000001', 0, '', 'testcompany10@1.com', '', '11111', 2, 1318932874, 1318932953, '58.246.139.98'),
(48, '', '', '', '', '', 0, 0, 0, 0, 0, NULL, '', '', '', '', '', 0, '', '', NULL, NULL, 1, 1319022343, 0, '220.181.125.45'),
(49, '', '', 'ddddd', '', '', 0, 0, 0, 0, 0, NULL, '', '', 'ddddd', '010-89738888-101', '13810888888', 0, '', 'dongqistar@gmail.com', NULL, NULL, 1, 1319045609, 0, '58.24.159.204'),
(50, 'testcompany001', 'f379eaf3c831b04de153469d1bec345e', 'testcompany001', '', '', 0, 0, 0, 0, 0, '', '', '', 'daniel du', '55555555', '13764504506', 0, '', 'testcompany001@sina.com', '', '', 2, 1319185383, 1319440936, '58.246.139.98'),
(51, 't01company', 'f379eaf3c831b04de153469d1bec345e', 't01company@1.com', '', '', 0, 0, 0, 0, 0, '', '', '', 'aad', '13876565765', '13877777765', 0, '', 't01company@1.com', '', '', 2, 1319537663, 1319538001, '58.246.139.98'),
(52, '', '', '', '', '', 0, 0, 0, 0, 0, NULL, '', '', '', '', '', 0, '', '', NULL, NULL, 1, 1320173747, 0, '220.181.125.45'),
(53, 'qiyetest1', 'f379eaf3c831b04de153469d1bec345e', 'qiyetest1', 'qiyetest1', '7', 1, 1, 1, 54, 351, '', '200001', 'qiyetest1', 'qiyetest1', '29384758', '13876565454', 0, '', 'qiyetest1@1.com', '', 'qiyetest1', 2, 1320911516, 1320911558, '58.246.139.98'),
(54, 't01c01', 'f379eaf3c831b04de153469d1bec345e', 'to1c01', 't01c01', '7', 1, 3, 2, 1, 418, '', '100020', '朝阳区关东店南街2号旺座中心0615', 'songyu', '51316189', '13010985865', 0, '', 'songyu@126.com', 'http://img.shiyishi.cn/users/2011/11/14/f03e638f1be159fc_192_60.jpg', '&nbsp; \r\n<div class="O" v:shape="_x0000_s1026">\r\n<div><strong>北京华章人力资源顾问有限公司是2006年经北京市工商行政管理局批准，北京市劳动和社会保障局、北京市人事局特许经营，注册成立的一家专业的人力资源服务公司，专业从事劳务派遣、人事外包、人才中介、人才租赁、法律咨询、培训等人力资源服务项目。 </strong></div>\r\n<div></div></div>', 2, 1321250163, 1321250426, '111.161.64.190'),
(55, 't01c02', 'f379eaf3c831b04de153469d1bec345e', 'to1c02', 't01c02', '11', 3, 4, 1, 1, 418, '', '100088', '中关村大街88号', 'songyu', '51316189', '13910985865', 0, '', 'songyu@136.com', 'http://img.shiyishi.cn/users/2011/11/14/f2e25efb916d94b7_192_60.jpg', '<p><strong>北京华章人力资源顾问有限公司是2006年经北京市工商行政管理局批准，北京市劳动和社会保障局、北京市人事局特许经营，注册成立的一家专业的人力资源服务公司，专业从事劳务派遣、人事外包、人才中介、人才租赁、法律咨询、培训等人力资源服务项目。</strong></p>\r\n<p><strong>公司服务客户均为外资企业，目前业务拓展北京、天津、上海、南京地区，公司下设天津办事处、南京分公司。</strong></p>', 2, 1321250211, 1321250462, '111.161.64.190'),
(56, '', '', '', '', '', 0, 0, 0, 0, 0, NULL, '', '', '', '', '', 0, '', '', NULL, NULL, 1, 1322401013, 0, '220.181.125.45'),
(57, '', '', '', '', '', 0, 0, 0, 0, 0, NULL, '', '', '', '', '', 0, '', '', NULL, NULL, 1, 1323552854, 0, '220.181.125.45');

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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=14 ;

--
-- Dumping data for table `zp_funtype`
--

INSERT INTO `zp_funtype` (`id`, `thename`, `enname`, `parent_id`, `order_id`, `createdate`) VALUES
(9, 'test', 'athelete', 9, 0, '2011-10-11 16:10:48'),
(10, '服装导购', 'athelete', 0, 0, '2011-10-11 16:23:18'),
(7, '社保专员', 'hr', 0, 0, '2011-09-21 14:19:55'),
(8, '测试职位', 'test', 7, 0, '2011-09-21 14:23:58'),
(11, 'test', 'test', 10, 0, '2011-10-11 16:23:51'),
(12, '职位属性测试', 'zhiweishuxinceshi', 0, 5, '2011-10-20 20:24:08'),
(13, '职位分类测试', 'zhiweifengleizs', 12, 6, '2011-10-20 20:24:28');

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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=52 ;

--
-- Dumping data for table `zp_jobs`
--

INSERT INTO `zp_jobs` (`id`, `cid`, `scid`, `title`, `live_gnd_p`, `live_gnd_c`, `live_address`, `funtype_1`, `funtype_2`, `dustrytype_1`, `dustrytype_2`, `company_type`, `company_scale`, `company_properties`, `gender`, `language`, `money`, `jobterm`, `degree`, `pnum`, `work_exp`, `jtext`, `createtime`, `startdate`, `enddate`, `status`, `modifydate`) VALUES
(35, 40, 0, '人事专员', 1, 419, '关东店南街2号旺座中心0615', 7, 8, 7, 8, 1, 2, 0, 3, 5, 4, 2, 4, 2, 3, '<p>职位描述：</p>\r\n<p>1，&nbsp; 负责派遣员工入、离职管理，办理录用、退工手续；</p>\r\n<p>2，&nbsp; 负责派遣员工薪资、社保、公积金核算；</p>\r\n<p>3，&nbsp; 负责与客户结算费用；</p>\r\n<p>4，&nbsp; 接受客户和派遣员工的咨询并解答；</p>\r\n<p>5，&nbsp; 代表公司全面为客户提供人事外包服务。</p>\r\n<p>职位要求：</p>\r\n<p>1，&nbsp; 大专以上学历；</p>\r\n<p>2，&nbsp; 熟练使用excel、powerpoint、word办公软件；</p>\r\n<p>3，&nbsp; 熟悉国家劳动关系方面的法律、法规以及社保、公积金相关政策；</p>\r\n<p>4，&nbsp; 相关工作经验2年以上，人力资源外包公司工作经验者优先；</p>\r\n<p>5，&nbsp; 工作态度认真仔细，团队协作精神，较高的服务意识。</p>\r\n<p>职位待遇：</p>\r\n<p>1，&nbsp; 月薪：2000元—3000元（较高水平者另议）；</p>\r\n<p>2，&nbsp; 5险1金，商业保险；</p>\r\n<p>3，&nbsp; 交通、通讯补贴。</p>\r\n<p>联系方式：</p>\r\n<p>请应聘者把简历发入以下邮箱：</p>\r\n<p>zhaopin@chinawinhr.com.cn</p>', 1316586324, 1316534400, 1319040000, 1, 1316587209),
(36, 41, 0, 'it', 3, 420, '', 7, 8, 1, 2, 2, 3, 0, 1, 8, 3, 1, 3, 1, 0, '', 1316586743, 1316534400, 1319990400, 1, 1319190420),
(37, 46, 0, '耐克北京香槟换季优惠店导购', 1, 419, '来广营欧尚超市一层', 10, 11, 11, 12, 1, 4, 0, 1, 9, 3, 1, 7, 0, 0, '<p><strong>招聘相关信息如下：</strong></p>\r\n<p><strong>1、 职位：导购、收银员、陈列、库管</strong></p>\r\n<p><strong>2、 性别：男女不限；</strong></p>\r\n<p><strong>3、 年龄：18-26周岁；</strong></p>\r\n<p><strong>4、 学历：高中及以上，具有一定英语沟通能力者优先；</strong></p>\r\n<p><strong>5、 工作经验： 应届毕业生（已拿到毕业证）均可，有肯德基、麦当劳、相关工作经验者优先，不收实习生。</strong></p>\r\n<p jquery1318321055531="71"><strong>6、 招聘人数：若干名</strong></p><strong>\r\n</strong><p><strong>7、 薪资待遇：底薪+餐补+固定团队奖金（视每月销售额/个人表现等，按月支付）+年终双薪，签订正规的劳动合同，缴纳五险一金（含试用期） </strong></p>\r\n<p><strong>平均每周40个工作小时，按月累计工时，超时算加班费</strong></p>\r\n<p><strong>倒班+轮休</strong></p>\r\n<p><strong>8、 联系电话： 51316184、51316183，联系人：郑小姐、崔小姐</strong></p>\r\n<p><strong>9、 简历请发至邮箱：zhengyanyan@chinawinhr.com.cn； cuijiao@chinawinhr.com.cn；</strong></p>', 1318321568, 1318262400, 1320854400, 1, 1318321568),
(38, 41, 0, '测试职位123', 31, 147, '111111122', 7, 8, 9, 10, 2, 2, 0, 1, 13, 3, 1, 4, 0, 0, '', 1318401136, 1318348800, 1325174400, 0, 1323852515),
(39, 38, 0, '123', 3, 420, '', 7, 8, 9, 10, 1, 1, 0, 3, 5, 2, 1, 4, 2, 4, '2', 1318419210, 1318348800, 1320940800, 1, 1318419288),
(40, 47, 0, 'A10测试职位', 3, 420, '111', 7, 8, 7, 8, 1, 1, 0, 1, 2, 2, 1, 4, 0, 0, '', 1318933112, 1318867200, 1321459200, 1, 1318933112),
(41, 38, 8, 'subtest', 1, 418, NULL, 7, 8, 7, 8, 2, 2, 0, 1, 5, 1, 1, 4, 3, 1, 'dd', 1319013842, 1318953600, 1321545600, 1, 1319013842),
(42, 38, 0, 'abc', 1, 418, NULL, 12, 13, 0, 0, 1, 1, 0, 1, 1, 1, 1, 5, 0, 0, '', 1319113525, 1319040000, 1321632000, 1, 1319113525),
(43, 53, 0, 'qiyetest1pos1', 47, 24, NULL, 7, 8, 0, 0, 1, 2, 0, 1, 2, 2, 1, 5, 3, 1, 'qiyetest1pos1', 1320911780, 1320854400, 1323360000, 1, 1320911780),
(44, 54, 0, 't0101', 1, 419, '关东店南街2号旺座中心东塔0615室', 7, 8, 0, 0, 1, 3, 0, 1, 9, 4, 1, 5, 0, 0, '<p>职位描述：</p>\r\n<p>1，&nbsp; 负责派遣员工入、离职管理，办理录用、退工手续；</p>\r\n<p>2，&nbsp; 负责派遣员工薪资、社保、公积金核算；</p>\r\n<p>3，&nbsp; 负责与客户结算费用；</p>\r\n<p>4，&nbsp; 接受客户和派遣员工的咨询并解答；</p>\r\n<p>5，&nbsp; 代表公司全面为客户提供人事外包服务。</p>\r\n<p>职位要求：</p>\r\n<p>1，&nbsp; 大专以上学历；</p>\r\n<p>2，&nbsp; 熟练使用excel、powerpoint、word办公软件；</p>\r\n<p>3，&nbsp; 熟悉国家劳动关系方面的法律、法规以及社保、公积金相关政策；</p>\r\n<p>4，&nbsp; 相关工作经验2年以上，人力资源外包公司工作经验者优先；</p>\r\n<p>5，&nbsp; 工作态度认真仔细，团队协作精神，较高的服务意识。</p>\r\n<p>职位待遇：</p>\r\n<p>1，&nbsp;&nbsp;&nbsp; 5险1金，商业保险；</p>\r\n<p>2，&nbsp; 交通、通讯补贴。</p>', 1321252161, 1321200000, 1323705600, 1, 1321252161),
(45, 54, 0, 't0102', 1, 419, '关东店南街2号旺座中心东塔0615室', 7, 8, 0, 0, 1, 3, 0, 1, 9, 4, 1, 5, 0, 0, '<p>职位描述：</p>\r\n<p>1，&nbsp; 负责派遣员工入、离职管理，办理录用、退工手续；</p>\r\n<p>2，&nbsp; 负责派遣员工薪资、社保、公积金核算；</p>\r\n<p>3，&nbsp; 负责与客户结算费用；</p>\r\n<p>4，&nbsp; 接受客户和派遣员工的咨询并解答；</p>\r\n<p>5，&nbsp; 代表公司全面为客户提供人事外包服务。</p>\r\n<p>职位要求：</p>\r\n<p>1，&nbsp; 大专以上学历；</p>\r\n<p>2，&nbsp; 熟练使用excel、powerpoint、word办公软件；</p>\r\n<p>3，&nbsp; 熟悉国家劳动关系方面的法律、法规以及社保、公积金相关政策；</p>\r\n<p>4，&nbsp; 相关工作经验2年以上，人力资源外包公司工作经验者优先；</p>\r\n<p>5，&nbsp; 工作态度认真仔细，团队协作精神，较高的服务意识。</p>\r\n<p>职位待遇：</p>\r\n<p>1，&nbsp;&nbsp; 5险1金，商业保险；</p>\r\n<p>2，&nbsp; 交通、通讯补贴。</p>', 1321252800, 1321200000, 1323705600, 1, 1321252800),
(46, 55, 0, 't0103', 1, 418, '中关村大街88号', 7, 8, 0, 0, 1, 4, 0, 1, 9, 4, 1, 5, 0, 0, '<p>职位描述：</p>\r\n<p>1，&nbsp; 负责派遣员工入、离职管理，办理录用、退工手续；</p>\r\n<p>2，&nbsp; 负责派遣员工薪资、社保、公积金核算；</p>\r\n<p>3，&nbsp; 负责与客户结算费用；</p>\r\n<p>4，&nbsp; 接受客户和派遣员工的咨询并解答；</p>\r\n<p>5，&nbsp; 代表公司全面为客户提供人事外包服务。</p>\r\n<p>职位要求：</p>\r\n<p>1，&nbsp; 大专以上学历；</p>\r\n<p>2，&nbsp; 熟练使用excel、powerpoint、word办公软件；</p>\r\n<p>3，&nbsp; 熟悉国家劳动关系方面的法律、法规以及社保、公积金相关政策；</p>\r\n<p>4，&nbsp; 相关工作经验2年以上，人力资源外包公司工作经验者优先；</p>\r\n<p>5，&nbsp; 工作态度认真仔细，团队协作精神，较高的服务意识。</p>\r\n<p>职位待遇：</p>\r\n<p>1&nbsp; 5险1金，商业保险；</p>\r\n<p>2&nbsp; 交通、通讯补贴。</p>', 1321253527, 1321200000, 1323705600, 1, 1321254157),
(47, 55, 0, 't0104', 1, 418, '中关村大街88号', 7, 8, 0, 0, 1, 4, 0, 1, 9, 4, 1, 5, 0, 0, '<p>职位描述：</p>\r\n<p>1，&nbsp; 负责派遣员工入、离职管理，办理录用、退工手续；</p>\r\n<p>2，&nbsp; 负责派遣员工薪资、社保、公积金核算；</p>\r\n<p>3，&nbsp; 负责与客户结算费用；</p>\r\n<p>4，&nbsp; 接受客户和派遣员工的咨询并解答；</p>\r\n<p>5，&nbsp; 代表公司全面为客户提供人事外包服务。</p>\r\n<p>职位要求：</p>\r\n<p>1，&nbsp; 大专以上学历；</p>\r\n<p>2，&nbsp; 熟练使用excel、powerpoint、word办公软件；</p>\r\n<p>3，&nbsp; 熟悉国家劳动关系方面的法律、法规以及社保、公积金相关政策；</p>\r\n<p>4，&nbsp; 相关工作经验2年以上，人力资源外包公司工作经验者优先；</p>\r\n<p>5，&nbsp; 工作态度认真仔细，团队协作精神，较高的服务意识。</p>\r\n<p>职位待遇：</p>\r\n<p>1，&nbsp; 5险1金，商业保险；</p>\r\n<p>2，&nbsp; 交通、通讯补贴。</p>', 1321253922, 1321200000, 1323705600, 1, 1321253922),
(48, 38, 8, 'ttt', 33, 61, NULL, 10, 11, 0, 0, 2, 1, 0, 1, 1, 2, 1, 3, 0, 0, 'ddd', 1322926260, 1322841600, 1325433600, 1, 1322926260),
(49, 41, 9, '1111', 3, 420, '', 7, 8, 0, 0, 3, 2, 0, 2, 5, 2, 2, 1, 0, 0, '', 1323055627, 1323014400, 1320336000, 1, 1323852662),
(50, 54, 0, 't0102', 1, 419, '关东店南街2号旺座中心东塔0615室', 7, 8, 0, 0, 1, 3, 0, 1, 9, 4, 1, 4, 0, 0, '<p>职位描述：</p>\r\n<p>1，&nbsp; 负责派遣员工入、离职管理，办理录用、退工手续；</p>\r\n<p>2，&nbsp; 负责派遣员工薪资、社保、公积金核算；</p>\r\n<p>3，&nbsp; 负责与客户结算费用；</p>\r\n<p>4，&nbsp; 接受客户和派遣员工的咨询并解答；</p>\r\n<p>5，&nbsp; 代表公司全面为客户提供人事外包服务。</p>\r\n<p>职位要求：</p>\r\n<p>1，&nbsp; 大专以上学历；</p>\r\n<p>2，&nbsp; 熟练使用excel、powerpoint、word办公软件；</p>\r\n<p>3，&nbsp; 熟悉国家劳动关系方面的法律、法规以及社保、公积金相关政策；</p>\r\n<p>4，&nbsp; 相关工作经验2年以上，人力资源外包公司工作经验者优先；</p>\r\n<p>5，&nbsp; 工作态度认真仔细，团队协作精神，较高的服务意识。</p>\r\n<p>职位待遇：</p>\r\n<p>1，&nbsp;&nbsp;&nbsp; 5险1金，商业保险；</p>\r\n<p>2，&nbsp; 交通、通讯补贴。</p>', 1323055781, 1321200000, 1323705600, 1, 1323055781),
(51, 54, 10, 't0102', 1, 419, '关东店南街2号旺座中心东塔0615室', 7, 8, 0, 0, 1, 3, 0, 1, 9, 4, 1, 4, 0, 0, '<p>职位描述：</p>\r\n<p>1，&nbsp; 负责派遣员工入、离职管理，办理录用、退工手续；</p>\r\n<p>2，&nbsp; 负责派遣员工薪资、社保、公积金核算；</p>\r\n<p>3，&nbsp; 负责与客户结算费用；</p>\r\n<p>4，&nbsp; 接受客户和派遣员工的咨询并解答；</p>\r\n<p>5，&nbsp; 代表公司全面为客户提供人事外包服务。</p>\r\n<p>职位要求：</p>\r\n<p>1，&nbsp; 大专以上学历；</p>\r\n<p>2，&nbsp; 熟练使用excel、powerpoint、word办公软件；</p>\r\n<p>3，&nbsp; 熟悉国家劳动关系方面的法律、法规以及社保、公积金相关政策；</p>\r\n<p>4，&nbsp; 相关工作经验2年以上，人力资源外包公司工作经验者优先；</p>\r\n<p>5，&nbsp; 工作态度认真仔细，团队协作精神，较高的服务意识。</p>\r\n<p>职位待遇：</p>\r\n<p>1，&nbsp;&nbsp;&nbsp; 5险1金，商业保险；</p>\r\n<p>2，&nbsp; 交通、通讯补贴。</p>', 1323055795, 1321200000, 1323705600, 1, 1323055795);

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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10 ;

--
-- Dumping data for table `zp_jobs_template`
--

INSERT INTO `zp_jobs_template` (`id`, `cid`, `scid`, `title`, `live_gnd_p`, `live_gnd_c`, `live_address`, `funtype_1`, `funtype_2`, `dustrytype_1`, `dustrytype_2`, `company_type`, `company_scale`, `company_properties`, `gender`, `language`, `money`, `jobterm`, `degree`, `pnum`, `work_exp`, `jtext`, `createtime`, `startdate`, `enddate`, `modifydate`) VALUES
(1, 1, 0, '地发生地方', 31, 11, NULL, 1, 2, 0, 0, 0, 0, 0, 0, 0, 4, 1, 3, 56, 6, '撒地方暗示法阿什地方阿斯顿发生地方阿斯顿法萨芬阿斯顿发生阿什阿什发生阿斯顿发生地方阿什阿什阿斯顿发生阿什阿斯顿阿什法萨芬阿斯顿发生地方阿什发生的阿斯顿阿斯顿', 1301642965, 0, 0, 0),
(2, 1, 3, '地发生地方1', 1, 421, NULL, 1, 4, 3, 4, 0, 0, 0, 0, 0, 9, 1, 3, 56, 6, '撒地方暗示法阿什地方阿斯顿发生地方阿斯顿法萨芬阿斯顿发生阿什阿什发生阿斯顿发生地方阿什阿什阿斯顿发生阿什阿斯顿阿什法萨芬阿斯顿发生地方阿什发生的阿斯顿阿斯顿', 0, 0, 0, 0),
(3, 1, 3, '发范甘迪1', 1, 421, NULL, 3, 4, 1, 2, 0, 0, 0, 0, 0, 7, 1, 4, 2, 4, '所的发生地方斯蒂芬斯蒂芬斯蒂芬所的发生地方斯蒂芬斯蒂芬斯蒂芬所的发生地方斯蒂芬斯蒂芬斯蒂芬所的发生地方斯蒂芬斯蒂芬斯蒂芬所的发生地方斯蒂芬斯蒂芬斯蒂芬所的发生地方斯蒂芬斯蒂芬斯蒂芬所的发生地方斯蒂芬斯蒂芬斯蒂芬所的发生地方斯蒂芬斯蒂芬斯蒂芬所的发生地方斯蒂芬斯蒂芬斯蒂芬所的发生地方斯蒂芬斯蒂芬斯蒂芬所的发生地方斯蒂芬斯蒂芬斯蒂芬', 0, 2011, 2011, 1302277361),
(4, 1, 3, '3333', 1, 418, NULL, 1, 2, 3, 4, 2, 2, 2, 1, 1, 5, 1, 5, 0, 0, '地方公司的风格地方官第三方广东省法国斯蒂芬', 0, 1306771200, 1325260800, 1302366141),
(5, 7, 4, '高级程序员', 1, 418, NULL, 1, 2, 1, 2, 2, 1, 2, 1, 5, 1, 1, 3, 40, 3, '好！', 1304142213, 1304092800, 1306252800, 1304142213),
(6, 15, 6, 'sfasf ', 3, 420, NULL, 3, 4, 3, 4, 2, 4, 0, 1, 11, 7, 1, 1, 1, 5, 'good<br />', 1308537446, 1308499200, 1311091200, 1308537446),
(7, 54, 0, 't0102', 1, 419, '关东店南街2号旺座中心东塔0615室', 7, 8, 0, 0, 1, 3, 0, 1, 9, 4, 1, 4, 0, 0, '<p>职位描述：</p>\r\n<p>1，&nbsp; 负责派遣员工入、离职管理，办理录用、退工手续；</p>\r\n<p>2，&nbsp; 负责派遣员工薪资、社保、公积金核算；</p>\r\n<p>3，&nbsp; 负责与客户结算费用；</p>\r\n<p>4，&nbsp; 接受客户和派遣员工的咨询并解答；</p>\r\n<p>5，&nbsp; 代表公司全面为客户提供人事外包服务。</p>\r\n<p>职位要求：</p>\r\n<p>1，&nbsp; 大专以上学历；</p>\r\n<p>2，&nbsp; 熟练使用excel、powerpoint、word办公软件；</p>\r\n<p>3，&nbsp; 熟悉国家劳动关系方面的法律、法规以及社保、公积金相关政策；</p>\r\n<p>4，&nbsp; 相关工作经验2年以上，人力资源外包公司工作经验者优先；</p>\r\n<p>5，&nbsp; 工作态度认真仔细，团队协作精神，较高的服务意识。</p>\r\n<p>职位待遇：</p>\r\n<p>1，&nbsp;&nbsp;&nbsp; 5险1金，商业保险；</p>\r\n<p>2，&nbsp; 交通、通讯补贴。</p>', 1321252456, 1321200000, 1323705600, 1321252456),
(8, 38, 8, 'ttt', 33, 61, NULL, 10, 11, 0, 0, 2, 1, 0, 1, 1, 2, 1, 3, 0, 0, 'ddd', 1322926253, 1322841600, 1325433600, 1322926253),
(9, 41, 9, '1111', 3, 420, NULL, 7, 8, 0, 0, 3, 2, 0, 2, 5, 2, 2, 1, 0, 0, '', 1323055612, 1323014400, 1325606400, 1323055612);

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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `zp_leader`
--

INSERT INTO `zp_leader` (`id`, `eid`, `roomid`, `room`, `phone`, `startdate`, `enddate`, `passwd`) VALUES
(1, 2, 14, 'room10', '15901281147', 1304776800, 1304787600, '182436'),
(8, 1, 15, 'room9', '13899667788', 1304820000, 1304857800, '546379');

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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `zp_major`
--

INSERT INTO `zp_major` (`id`, `thename`, `enname`, `parent_id`, `order_id`, `createdate`) VALUES
(1, '管理科学与工程类', 'guanlikexue', 0, 1, '2011-03-29 18:04:44'),
(2, '管理科学', 'guanlikexue', 1, 1, '2011-03-29 18:05:31');

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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=141 ;

--
-- Dumping data for table `zp_myjob_int`
--

INSERT INTO `zp_myjob_int` (`id`, `aid`, `uid`, `gender`, `eid`, `jobid`, `isnew`, `status`, `interview_type`, `interview_date`, `interview_enddate`, `invite_date`) VALUES
(87, 18, 1, 1, 1, 5, 1, 0, 2, 1305288000, 1307887100, '2011-05-12 17:58:52'),
(86, 18, 2, 1, 1, 5, 1, 1, 2, 1305288000, 1307887100, '2011-05-12 17:58:52'),
(109, 17, 1, 1, 1, 5, 1, 0, 2, 1305735300, 1307802600, '2011-05-18 13:49:39'),
(108, 17, 2, 1, 1, 5, 1, 1, 2, 1305735300, 1307802600, '2011-05-18 13:49:39'),
(83, 16, 1, 1, 1, 5, 1, 0, 2, 1305291600, 1307878100, '2011-05-12 17:41:34'),
(82, 16, 2, 1, 1, 5, 1, 1, 2, 1305291600, 1307878100, '2011-05-12 17:41:34'),
(81, 15, 1, 1, 1, 5, 1, 0, 2, 1304892000, 1304937800, '2011-05-08 09:56:53'),
(80, 15, 2, 1, 1, 5, 1, 1, 2, 1304892000, 1304937800, '2011-05-08 09:56:53'),
(79, 14, 1, 1, 2, 0, 1, 0, 2, 1304848800, 1304867600, '2011-05-07 21:58:09'),
(78, 14, 2, 1, 2, 0, 1, 1, 2, 1304848800, 1304867600, '2011-05-07 21:58:09'),
(58, 13, 14, 1, 7, 10, 1, 1, 2, 1304848800, 1306547000, '2011-05-06 22:10:46'),
(76, 12, 2, 1, 1, 5, 1, 1, 2, 1305317700, 1305329300, '2011-05-07 01:01:24'),
(77, 12, 1, 1, 1, 5, 1, 0, 2, 1305317700, 1305329300, '2011-05-07 01:01:24'),
(75, 11, 2, 1, 1, 5, 1, 1, 2, 1305315000, 1305348200, '2011-05-06 22:53:43'),
(59, 13, 12, 1, 7, 10, 1, 1, 2, 1304848800, 1306547000, '2011-05-06 22:10:46'),
(60, 13, 11, 1, 7, 10, 1, 1, 2, 1304848800, 1306547000, '2011-05-06 22:10:46'),
(61, 13, 2, 1, 7, 10, 1, 1, 2, 1304848800, 1306547000, '2011-05-06 22:10:46'),
(62, 13, 1, 1, 7, 10, 1, 0, 2, 1304848800, 1306547000, '2011-05-06 22:10:46'),
(88, 19, 11, 1, 2, 0, 1, 1, 2, 1305559800, 1305572300, '2011-05-14 00:17:12'),
(89, 19, 2, 1, 2, 0, 1, 1, 2, 1305559800, 1305572300, '2011-05-14 00:17:12'),
(90, 19, 1, 1, 2, 0, 1, 0, 2, 1305559800, 1305572300, '2011-05-14 00:17:12'),
(91, 20, 14, 1, 7, 10, 1, 1, 2, 1305316800, 1305497600, '2011-05-14 00:33:31'),
(92, 20, 12, 1, 7, 10, 1, 1, 2, 1305316800, 1305497600, '2011-05-14 00:33:31'),
(93, 20, 11, 1, 7, 10, 1, 1, 2, 1305316800, 1305497600, '2011-05-14 00:33:31'),
(94, 20, 2, 1, 7, 10, 1, 1, 2, 1305316800, 1305497600, '2011-05-14 00:33:31'),
(95, 20, 1, 1, 7, 10, 1, 0, 2, 1305316800, 1305497600, '2011-05-14 00:33:31'),
(96, 21, 2, 1, 1, 5, 1, 1, 2, 1308189600, 1308211200, '2011-05-16 15:45:26'),
(97, 21, 1, 1, 1, 5, 1, 0, 2, 1308189600, 1308211200, '2011-05-16 15:45:26'),
(98, 22, 14, 1, 7, 10, 1, -1, 2, 1305640800, 1305729000, '2011-05-16 22:20:57'),
(99, 22, 12, 1, 7, 10, 1, -1, 2, 1305640800, 1305729000, '2011-05-16 22:20:57'),
(100, 22, 11, 1, 7, 10, 1, -1, 2, 1305640800, 1305729000, '2011-05-16 22:20:57'),
(101, 22, 2, 1, 7, 10, 1, -1, 2, 1305640800, 1305729000, '2011-05-16 22:20:57'),
(102, 22, 1, 1, 7, 10, 1, -1, 2, 1305640800, 1305729000, '2011-05-16 22:20:57'),
(103, 23, 14, 1, 7, 10, 1, 1, 2, 1305759600, 1305845100, '2011-05-18 11:54:46'),
(104, 23, 11, 1, 7, 10, 1, 1, 2, 1305759600, 1305845100, '2011-05-18 11:54:46'),
(105, 23, 2, 1, 7, 10, 1, 1, 2, 1305759600, 1305845100, '2011-05-18 11:54:46'),
(106, 23, 0, 1, 7, 10, 1, 1, 2, 1305759600, 1305845100, '2011-05-18 11:54:46'),
(110, 24, 14, 1, 7, 10, 1, 1, 2, 1305909900, 1306082700, '2011-05-18 14:12:08'),
(111, 24, 11, 1, 7, 10, 1, 1, 2, 1305909900, 1306082700, '2011-05-18 14:12:08'),
(112, 24, 2, 1, 7, 10, 1, 1, 2, 1305909900, 1306082700, '2011-05-18 14:12:08'),
(113, 24, 1, 1, 7, 10, 1, 0, 2, 1305909900, 1306082700, '2011-05-18 14:12:08'),
(114, 25, 11, 1, 7, 10, 1, 1, 2, 1306100700, 1306102500, '2011-05-18 17:14:53'),
(115, 26, 11, 1, 2, 0, 1, -1, 2, 1306037700, 1306133100, '2011-05-21 13:36:04'),
(116, 26, 1, 1, 2, 0, 1, -1, 2, 1306037700, 1306133100, '2011-05-21 13:36:04'),
(117, 27, 14, 1, 7, 5, 1, -1, 2, 1305993600, 1306845000, '2011-05-21 16:17:28'),
(118, 27, 12, 1, 7, 5, 1, -1, 2, 1305993600, 1306845000, '2011-05-21 16:17:28'),
(119, 27, 11, 1, 7, 5, 1, -1, 2, 1305993600, 1306845000, '2011-05-21 16:17:29'),
(120, 27, 2, 1, 7, 5, 1, -1, 2, 1305993600, 1306845000, '2011-05-21 16:17:29'),
(121, 27, 1, 1, 7, 5, 1, -1, 2, 1305993600, 1306845000, '2011-05-21 16:17:29'),
(122, 28, 14, 1, 11, 12, 1, -1, 2, 1306036800, 1306123200, '2011-05-21 22:23:35'),
(123, 28, 12, 1, 11, 12, 1, -1, 2, 1306036800, 1306123200, '2011-05-21 22:23:35'),
(124, 28, 11, 1, 11, 12, 1, -1, 2, 1306036800, 1306123200, '2011-05-21 22:23:35'),
(125, 28, 2, 1, 11, 12, 1, -1, 2, 1306036800, 1306123200, '2011-05-21 22:23:35'),
(126, 28, 1, 1, 11, 12, 1, -1, 2, 1306036800, 1306123200, '2011-05-21 22:23:35'),
(127, 29, 14, 1, 11, 12, 1, 1, 2, 1305993600, 1306080900, '2011-05-22 00:03:37'),
(128, 29, 11, 1, 11, 12, 1, 1, 2, 1305993600, 1306080900, '2011-05-22 00:03:37'),
(129, 29, 2, 1, 11, 12, 1, 1, 2, 1305993600, 1306080900, '2011-05-22 00:03:37'),
(130, 29, 1, 1, 11, 12, 1, 0, 2, 1305993600, 1306080900, '2011-05-22 00:03:37'),
(131, 30, 36, 1, 11, 18, 1, -1, 2, 1309528800, 1311132600, '2011-07-01 21:57:44'),
(132, 30, 11, 1, 11, 18, 1, -1, 2, 1309528800, 1311132600, '2011-07-01 21:57:44'),
(133, 30, 1, 1, 11, 18, 1, 1, 2, 1309528800, 1311132600, '2011-07-01 21:57:44'),
(134, 31, 48, 1, 12, 25, 1, -1, 2, 1309665600, 1309762800, '2011-07-02 15:44:29'),
(135, 31, 33, 1, 12, 25, 1, -1, 2, 1309665600, 1309762800, '2011-07-02 15:44:29'),
(136, 31, 20, 1, 12, 25, 1, -1, 2, 1309665600, 1309762800, '2011-07-02 15:44:29'),
(137, 31, 11, 1, 12, 25, 1, -1, 2, 1309665600, 1309762800, '2011-07-02 15:44:29'),
(138, 31, 2, 1, 12, 25, 1, -1, 2, 1309665600, 1309762800, '2011-07-02 15:44:29'),
(139, 31, 1, 1, 12, 25, 1, -1, 2, 1309665600, 1309762800, '2011-07-02 15:44:29'),
(140, 32, 98, 2, 41, 36, 1, 1, 2, 1318435200, 1318450500, '2011-10-12 14:44:28');

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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=66 ;

--
-- Dumping data for table `zp_myjob_pos`
--

INSERT INTO `zp_myjob_pos` (`id`, `uid`, `eid`, `jobid`, `status`, `job_expiry_date`, `apply_date`) VALUES
(1, 1, 1, 3, 1, 1304006400, '2011-04-05 01:35:39'),
(2, 1, 1, 2, 1, 1301740190, '2011-04-05 01:35:51'),
(3, 10, 1, 3, 1, 1304006400, '2011-04-13 10:37:59'),
(4, 11, 1, 5, 1, 1306771200, '2011-04-26 21:48:37'),
(5, 11, 1, 3, 1, 1297008000, '2011-04-26 21:48:40'),
(6, 11, 1, 2, 1, 1301740190, '2011-04-26 21:48:42'),
(7, 11, 7, 9, 1, 1306339200, '2011-04-26 23:41:04'),
(8, 1, 7, 10, 1, 1306684800, '2011-04-30 13:45:25'),
(9, 14, 7, 10, 1, 1306684800, '2011-04-30 13:53:37'),
(10, 32, 7, 10, 1, 1306684800, '2011-05-21 11:24:05'),
(11, 33, 7, 11, 1, 1308585600, '2011-05-21 22:39:32'),
(12, 33, 11, 12, 1, 1308585600, '2011-05-21 22:39:35'),
(13, 34, 7, 11, 1, 1308585600, '2011-05-21 23:40:40'),
(14, 34, 7, 9, 1, 1306339200, '2011-05-21 23:41:36'),
(15, 35, 7, 6, 1, 1306339200, '2011-05-21 23:55:12'),
(16, 35, 1, 2, 1, 1301740190, '2011-05-21 23:55:30'),
(17, 36, 11, 12, 1, 1308585600, '2011-05-22 15:01:12'),
(18, 39, 11, 15, 1, 1308758400, '2011-05-24 18:24:41'),
(19, 48, 11, 18, 1, 1309968000, '2011-06-08 22:08:07'),
(20, 49, 11, 17, 1, 1308844800, '2011-06-08 22:23:30'),
(21, 50, 11, 17, 1, 1308844800, '2011-06-08 22:32:26'),
(22, 52, 11, 17, 1, 1308844800, '2011-06-18 13:24:15'),
(23, 54, 11, 18, 1, 1309968000, '2011-06-19 15:05:37'),
(24, 54, 11, 17, 1, 1308844800, '2011-06-19 15:06:25'),
(25, 54, 2, 13, 1, 1308672000, '2011-06-19 15:06:54'),
(26, 54, 11, 15, 1, 1308758400, '2011-06-19 15:08:31'),
(27, 48, 12, 25, 1, 1312214400, '2011-07-02 14:24:21'),
(28, 1, 12, 25, 1, 1312214400, '2011-07-02 15:58:46'),
(29, 48, 11, 26, 1, 1312214400, '2011-07-03 19:54:37'),
(30, 65, 23, 28, 1, 1312646400, '2011-07-08 10:30:35'),
(31, 24, 12, 25, 1, 1312214400, '2011-07-13 13:48:56'),
(32, 68, 27, 30, 1, 1313164800, '2011-07-13 15:13:14'),
(33, 69, 27, 30, 1, 1313164800, '2011-07-13 15:37:19'),
(34, 77, 27, 32, 1, 1314288000, '2011-08-22 11:06:25'),
(35, 73, 27, 32, 1, 1314288000, '2011-08-29 10:11:58'),
(36, 92, 41, 36, 0, 1319040000, '2011-09-21 14:36:25'),
(37, 95, 40, 35, 1, 1319040000, '2011-09-21 14:47:58'),
(38, 92, 40, 35, 1, 1319040000, '2011-10-09 15:58:58'),
(39, 95, 41, 36, 1, 1319040000, '2011-10-10 16:50:28'),
(40, 92, 41, 38, 1, 1320940800, '2011-10-12 14:33:06'),
(41, 101, 38, 39, 1, 1320940800, '2011-10-12 19:44:09'),
(42, 99, 41, 38, 1, 1320940800, '2011-10-13 17:50:25'),
(43, 99, 41, 36, 1, 1319040000, '2011-10-13 17:50:31'),
(44, 103, 41, 38, 1, 1320940800, '2011-10-18 16:00:23'),
(45, 107, 47, 40, 1, 1321459200, '2011-10-18 18:30:47'),
(46, 124, 53, 43, 1, 1323360000, '2011-11-10 16:05:05'),
(47, 125, 38, 42, 1, 1321632000, '2011-11-13 00:17:48'),
(48, 95, 54, 45, 1, 1323705600, '2011-11-14 15:37:58'),
(49, 95, 55, 47, 1, 1323705600, '2011-11-14 15:39:14'),
(50, 95, 53, 43, 1, 1323360000, '2011-11-15 10:59:34'),
(51, 126, 54, 44, 1, 1323705600, '2011-11-16 11:37:54'),
(52, 130, 54, 44, 1, 1323705600, '2011-11-16 11:39:24'),
(53, 134, 54, 44, 1, 1323705600, '2011-11-16 11:39:49'),
(54, 127, 54, 45, 1, 1323705600, '2011-11-16 11:40:30'),
(55, 131, 54, 45, 1, 1323705600, '2011-11-16 11:40:56'),
(56, 135, 54, 45, 1, 1323705600, '2011-11-16 11:41:19'),
(57, 128, 55, 46, 1, 1323705600, '2011-11-16 11:42:17'),
(58, 132, 55, 46, 1, 1323705600, '2011-11-16 11:42:38'),
(59, 136, 55, 46, 1, 1323705600, '2011-11-16 11:43:04'),
(60, 129, 55, 47, 1, 1323705600, '2011-11-16 11:43:28'),
(61, 133, 55, 47, 1, 1323705600, '2011-11-16 11:43:48'),
(62, 137, 55, 47, 1, 1323705600, '2011-11-16 11:44:06'),
(63, 112, 55, 47, 1, 1323705600, '2011-12-03 18:51:09'),
(64, 112, 54, 45, 1, 1323705600, '2011-12-03 23:40:08'),
(65, 141, 38, 48, 1, 1325433600, '2011-12-16 17:20:25');

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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=828 ;

--
-- Dumping data for table `zp_myjob_rviewd`
--

INSERT INTO `zp_myjob_rviewd` (`id`, `uid`, `eid`, `status`, `viewd_date`) VALUES
(1, 2, 7, 1, '2011-04-14 17:10:26'),
(2, 0, 7, 1, '2011-04-14 17:10:45'),
(3, 1, 7, 1, '2011-04-14 17:10:49'),
(4, 2, 7, 1, '2011-04-14 17:11:45'),
(5, 1, 7, 1, '2011-04-14 17:24:54'),
(6, 1, 7, 1, '2011-04-14 17:25:48'),
(7, 1, 2, 1, '2011-04-15 16:55:49'),
(8, 1, 2, 1, '2011-04-15 17:41:43'),
(9, 1, 2, 1, '2011-04-15 17:41:45'),
(10, 1, 2, 1, '2011-04-15 17:45:29'),
(11, 1, 2, 1, '2011-04-15 17:47:17'),
(12, 1, 2, 1, '2011-04-15 17:51:36'),
(13, 1, 2, 1, '2011-04-15 17:53:02'),
(14, 1, 2, 1, '2011-04-15 18:20:01'),
(15, 1, 2, 1, '2011-04-15 18:27:01'),
(16, 1, 2, 1, '2011-04-15 18:28:30'),
(17, 1, 2, 1, '2011-04-15 18:42:28'),
(18, 11, 2, 1, '2011-04-18 11:03:14'),
(19, 1, 2, 1, '2011-04-18 11:04:36'),
(20, 1, 7, 1, '2011-04-18 11:45:50'),
(21, 1, 2, 1, '2011-04-18 12:52:21'),
(22, 1, 2, 1, '2011-04-18 12:53:33'),
(23, 1, 2, 1, '2011-04-18 13:04:48'),
(24, 1, 1, 1, '2011-04-18 16:54:41'),
(25, 1, 1, 1, '2011-04-18 16:55:50'),
(26, 1, 1, 1, '2011-04-18 16:56:08'),
(27, 1, 1, 1, '2011-04-18 16:56:40'),
(28, 1, 1, 1, '2011-04-18 17:05:10'),
(29, 2, 7, 1, '2011-04-18 18:12:18'),
(30, 2, 7, 1, '2011-04-18 18:12:25'),
(31, 1, 1, 1, '2011-04-19 01:54:02'),
(32, 1, 1, 1, '2011-04-19 01:55:22'),
(33, 1, 1, 1, '2011-04-19 01:56:42'),
(34, 1, 1, 1, '2011-04-19 01:57:09'),
(35, 1, 1, 1, '2011-04-19 01:57:09'),
(36, 1, 1, 1, '2011-04-19 01:57:53'),
(37, 1, 1, 1, '2011-04-19 01:58:13'),
(38, 1, 1, 1, '2011-04-19 02:01:59'),
(39, 1, 1, 1, '2011-04-19 02:02:56'),
(40, 1, 1, 1, '2011-04-19 02:07:52'),
(41, 1, 1, 1, '2011-04-19 02:12:00'),
(42, 1, 1, 1, '2011-04-19 02:12:03'),
(43, 1, 1, 1, '2011-04-19 02:14:13'),
(44, 1, 1, 1, '2011-04-19 02:14:15'),
(45, 1, 1, 1, '2011-04-19 02:14:15'),
(46, 1, 1, 1, '2011-04-19 02:14:59'),
(47, 1, 1, 1, '2011-04-19 02:15:00'),
(48, 1, 1, 1, '2011-04-19 02:15:01'),
(49, 1, 1, 1, '2011-04-19 02:15:01'),
(50, 1, 1, 1, '2011-04-19 02:15:01'),
(51, 1, 1, 1, '2011-04-19 02:15:01'),
(52, 1, 1, 1, '2011-04-19 02:15:01'),
(53, 1, 1, 1, '2011-04-19 02:15:01'),
(54, 1, 1, 1, '2011-04-19 02:15:18'),
(55, 1, 1, 1, '2011-04-19 02:15:19'),
(56, 1, 1, 1, '2011-04-19 02:15:29'),
(57, 1, 1, 1, '2011-04-19 02:15:30'),
(58, 1, 1, 1, '2011-04-19 02:17:05'),
(59, 1, 1, 1, '2011-04-19 02:17:35'),
(60, 1, 1, 1, '2011-04-19 02:17:36'),
(61, 1, 1, 1, '2011-04-19 02:18:17'),
(62, 1, 1, 1, '2011-04-19 02:18:34'),
(63, 1, 1, 1, '2011-04-19 02:19:19'),
(64, 1, 1, 1, '2011-04-19 02:19:34'),
(65, 1, 1, 1, '2011-04-19 02:44:07'),
(66, 1, 1, 1, '2011-04-19 02:45:06'),
(67, 1, 1, 1, '2011-04-19 02:45:07'),
(68, 1, 1, 1, '2011-04-19 02:45:08'),
(69, 1, 1, 1, '2011-04-19 02:45:19'),
(70, 1, 1, 1, '2011-04-19 03:02:01'),
(71, 1, 1, 1, '2011-04-19 03:02:18'),
(72, 2, 7, 1, '2011-04-19 10:02:21'),
(73, 1, 7, 1, '2011-04-19 10:09:42'),
(74, 1, 2, 1, '2011-04-19 10:52:58'),
(75, 1, 2, 1, '2011-04-19 10:57:26'),
(76, 1, 2, 1, '2011-04-19 10:59:27'),
(77, 1, 2, 1, '2011-04-19 11:03:55'),
(78, 1, 2, 1, '2011-04-19 11:07:06'),
(79, 1, 1, 1, '2011-04-19 11:33:03'),
(80, 1, 2, 1, '2011-04-20 18:57:59'),
(81, 1, 2, 1, '2011-04-20 18:59:55'),
(82, 1, 1, 1, '2011-04-21 13:34:58'),
(83, 1, 2, 1, '2011-04-21 18:28:08'),
(84, 1, 2, 1, '2011-04-21 18:28:12'),
(85, 1, 1, 1, '2011-04-22 15:49:21'),
(86, 1, 1, 1, '2011-04-22 15:58:05'),
(87, 1, 1, 1, '2011-04-22 16:03:40'),
(88, 1, 1, 1, '2011-04-22 16:05:08'),
(89, 1, 7, 1, '2011-04-23 14:39:10'),
(90, 1, 1, 1, '2011-04-24 03:05:31'),
(91, 2, 1, 1, '2011-04-24 03:14:11'),
(92, 2, 1, 1, '2011-04-24 03:14:40'),
(93, 2, 1, 1, '2011-04-24 03:14:49'),
(94, 2, 1, 1, '2011-04-24 03:15:57'),
(95, 2, 1, 1, '2011-04-24 03:17:13'),
(96, 2, 1, 1, '2011-04-24 03:45:49'),
(97, 2, 2, 1, '2011-04-26 11:56:20'),
(98, 1, 2, 1, '2011-04-26 12:05:38'),
(99, 1, 2, 1, '2011-04-26 12:09:35'),
(100, 1, 2, 1, '2011-04-26 12:11:00'),
(101, 1, 2, 1, '2011-04-26 12:50:04'),
(102, 11, 7, 1, '2011-04-26 23:41:15'),
(103, 11, 7, 1, '2011-04-26 23:41:25'),
(104, 11, 7, 1, '2011-04-26 23:43:32'),
(105, 12, 7, 1, '2011-04-26 23:43:43'),
(106, 2, 1, 1, '2011-04-26 23:44:40'),
(107, 2, 7, 1, '2011-04-26 23:45:08'),
(108, 11, 7, 1, '2011-04-30 13:44:05'),
(109, 11, 7, 1, '2011-04-30 13:45:33'),
(110, 1, 7, 1, '2011-04-30 13:45:37'),
(111, 14, 7, 1, '2011-04-30 13:54:32'),
(112, 14, 7, 1, '2011-04-30 14:07:29'),
(113, 1, 7, 1, '2011-04-30 14:40:18'),
(114, 1, 1, 1, '2011-05-03 15:39:17'),
(115, 11, 7, 1, '2011-05-06 21:53:58'),
(116, 11, 7, 1, '2011-05-06 21:59:36'),
(117, 1, 1, 1, '2011-05-06 23:09:09'),
(118, 11, 1, 1, '2011-05-06 23:19:39'),
(119, 11, 1, 1, '2011-05-07 00:19:27'),
(120, 1, 1, 1, '2011-05-07 00:22:15'),
(121, 11, 1, 1, '2011-05-07 00:22:39'),
(122, 11, 1, 1, '2011-05-07 00:25:40'),
(123, 11, 1, 1, '2011-05-07 00:26:54'),
(124, 11, 1, 1, '2011-05-07 00:26:59'),
(125, 11, 1, 1, '2011-05-07 00:27:38'),
(126, 11, 1, 1, '2011-05-07 00:29:01'),
(127, 1, 1, 1, '2011-05-07 00:43:55'),
(128, 1, 1, 1, '2011-05-07 00:43:57'),
(129, 11, 1, 1, '2011-05-07 00:44:04'),
(130, 11, 1, 1, '2011-05-07 00:44:54'),
(131, 11, 1, 1, '2011-05-07 00:47:06'),
(132, 11, 1, 1, '2011-05-07 00:47:51'),
(133, 11, 1, 1, '2011-05-07 00:47:55'),
(134, 11, 1, 1, '2011-05-07 00:48:54'),
(135, 11, 1, 1, '2011-05-07 00:48:55'),
(136, 11, 1, 1, '2011-05-07 00:48:57'),
(137, 11, 1, 1, '2011-05-07 00:48:58'),
(138, 11, 1, 1, '2011-05-07 00:48:58'),
(139, 11, 1, 1, '2011-05-07 00:48:58'),
(140, 11, 1, 1, '2011-05-07 00:48:58'),
(141, 11, 1, 1, '2011-05-07 00:48:59'),
(142, 11, 1, 1, '2011-05-07 00:50:00'),
(143, 11, 1, 1, '2011-05-07 00:51:03'),
(144, 11, 1, 1, '2011-05-07 00:54:15'),
(145, 1, 2, 1, '2011-05-07 21:56:34'),
(146, 1, 7, 1, '2011-05-08 14:24:19'),
(147, 12, 7, 1, '2011-05-08 14:34:08'),
(148, 2, 7, 1, '2011-05-08 14:34:17'),
(149, 11, 7, 1, '2011-05-08 14:34:24'),
(150, 14, 7, 1, '2011-05-08 14:34:39'),
(151, 1, 7, 1, '2011-05-08 14:34:43'),
(152, 12, 7, 1, '2011-05-08 14:57:40'),
(153, 1, 1, 1, '2011-05-12 22:57:49'),
(154, 1, 7, 1, '2011-05-13 23:24:53'),
(155, 11, 2, 1, '2011-05-13 23:53:52'),
(156, 1, 7, 1, '2011-05-14 22:42:48'),
(157, 1, 2, 1, '2011-05-16 23:17:46'),
(158, 2, 2, 1, '2011-05-16 23:17:49'),
(159, 12, 1, 1, '2011-05-21 23:25:26'),
(160, 36, 11, 1, '2011-05-22 15:01:59'),
(161, 36, 11, 1, '2011-05-22 15:17:18'),
(162, 36, 11, 1, '2011-05-22 15:17:26'),
(163, 34, 11, 1, '2011-05-22 15:19:30'),
(164, 36, 11, 1, '2011-05-22 15:24:59'),
(165, 36, 11, 1, '2011-05-22 15:25:41'),
(166, 33, 11, 1, '2011-05-22 15:29:00'),
(167, 36, 11, 1, '2011-05-22 15:29:22'),
(168, 36, 11, 1, '2011-05-22 15:30:51'),
(169, 36, 11, 1, '2011-05-22 15:37:55'),
(170, 1, 7, 1, '2011-05-22 23:46:28'),
(171, 36, 1, 1, '2011-05-23 15:20:08'),
(172, 36, 1, 1, '2011-05-23 18:52:48'),
(173, 36, 1, 1, '2011-05-23 19:05:34'),
(174, 36, 1, 1, '2011-05-23 19:06:05'),
(175, 1, 1, 1, '2011-05-23 19:12:03'),
(176, 1, 1, 1, '2011-05-23 19:12:24'),
(177, 36, 11, 1, '2011-05-23 22:08:37'),
(178, 36, 11, 1, '2011-05-23 22:09:27'),
(179, 12, 11, 1, '2011-05-23 22:09:32'),
(180, 36, 11, 1, '2011-05-23 22:09:37'),
(181, 35, 11, 1, '2011-05-23 22:09:40'),
(182, 35, 11, 1, '2011-05-23 22:11:11'),
(183, 36, 11, 1, '2011-05-23 22:12:30'),
(184, 36, 11, 1, '2011-05-23 22:14:23'),
(185, 36, 1, 1, '2011-05-23 22:14:37'),
(186, 36, 11, 1, '2011-05-23 22:14:46'),
(187, 36, 11, 1, '2011-05-23 22:14:59'),
(188, 36, 11, 1, '2011-05-23 22:15:40'),
(189, 36, 11, 1, '2011-05-23 22:16:45'),
(190, 35, 11, 1, '2011-05-23 22:16:47'),
(191, 35, 1, 1, '2011-05-23 22:16:52'),
(192, 35, 11, 1, '2011-05-23 22:18:40'),
(193, 36, 11, 1, '2011-05-23 22:18:49'),
(194, 1, 11, 1, '2011-05-23 22:19:03'),
(195, 11, 11, 1, '2011-05-23 22:19:37'),
(196, 36, 11, 1, '2011-05-23 22:19:42'),
(197, 12, 11, 1, '2011-05-23 22:20:21'),
(198, 36, 11, 1, '2011-05-23 22:22:21'),
(199, 11, 11, 1, '2011-05-23 22:25:19'),
(200, 20, 11, 1, '2011-05-23 22:25:21'),
(201, 36, 11, 1, '2011-05-23 22:25:31'),
(202, 12, 11, 1, '2011-05-23 22:27:09'),
(203, 35, 1, 1, '2011-05-23 22:28:21'),
(204, 11, 1, 1, '2011-05-23 23:59:50'),
(205, 36, 1, 1, '2011-05-24 00:00:27'),
(206, 36, 1, 1, '2011-05-24 00:00:44'),
(207, 36, 1, 1, '2011-05-24 00:02:01'),
(208, 36, 1, 1, '2011-05-24 00:02:03'),
(209, 36, 1, 1, '2011-05-24 00:02:10'),
(210, 36, 1, 1, '2011-05-24 00:03:24'),
(211, 36, 1, 1, '2011-05-24 00:03:28'),
(212, 36, 1, 1, '2011-05-24 00:03:28'),
(213, 36, 1, 1, '2011-05-24 00:03:28'),
(214, 36, 1, 1, '2011-05-24 00:07:49'),
(215, 36, 1, 1, '2011-05-24 00:08:00'),
(216, 36, 1, 1, '2011-05-24 00:08:03'),
(217, 36, 1, 1, '2011-05-24 00:08:18'),
(218, 1, 1, 1, '2011-05-24 00:09:14'),
(219, 1, 1, 1, '2011-05-24 00:09:38'),
(220, 36, 1, 1, '2011-05-24 00:09:46'),
(221, 36, 1, 1, '2011-05-24 00:09:48'),
(222, 36, 1, 1, '2011-05-24 00:22:11'),
(223, 36, 1, 1, '2011-05-24 00:22:31'),
(224, 2, 11, 1, '2011-05-24 12:13:08'),
(225, 11, 11, 1, '2011-05-24 12:13:30'),
(226, 2, 11, 1, '2011-05-24 12:13:58'),
(227, 12, 11, 1, '2011-05-24 12:14:09'),
(228, 11, 11, 1, '2011-05-24 12:14:13'),
(229, 12, 11, 1, '2011-05-24 12:14:33'),
(230, 36, 11, 1, '2011-05-24 12:16:29'),
(231, 36, 11, 1, '2011-05-24 12:17:09'),
(232, 35, 11, 1, '2011-05-24 12:17:12'),
(233, 34, 11, 1, '2011-05-24 12:17:15'),
(234, 35, 1, 1, '2011-05-24 16:41:59'),
(235, 14, 1, 1, '2011-05-24 17:33:39'),
(236, 14, 1, 1, '2011-05-24 17:34:47'),
(237, 36, 11, 1, '2011-05-24 18:26:23'),
(238, 1, 2, 1, '2011-05-24 18:42:59'),
(239, 1, 2, 1, '2011-05-24 18:43:08'),
(240, 1, 11, 1, '2011-05-24 20:45:25'),
(241, 39, 11, 1, '2011-05-24 20:46:09'),
(242, 43, 2, 1, '2011-06-05 17:47:05'),
(243, 43, 2, 1, '2011-06-05 17:47:49'),
(244, 2, 1, 1, '2011-06-07 10:23:49'),
(245, 1, 1, 1, '2011-06-26 21:56:58'),
(246, 36, 1, 1, '2011-06-26 22:01:35'),
(247, 36, 1, 1, '2011-06-26 22:01:40'),
(248, 36, 1, 1, '2011-06-26 22:08:39'),
(249, 33, 11, 1, '2011-07-01 15:45:45'),
(250, 50, 11, 1, '2011-07-01 15:46:49'),
(251, 48, 11, 1, '2011-07-01 15:47:05'),
(252, 48, 11, 1, '2011-07-01 16:06:26'),
(253, 12, 11, 1, '2011-07-01 16:06:30'),
(254, 49, 11, 1, '2011-07-01 16:06:34'),
(255, 1, 11, 1, '2011-07-01 16:09:42'),
(256, 36, 1, 1, '2011-07-01 16:10:21'),
(257, 2, 1, 1, '2011-07-01 16:11:05'),
(258, 2, 1, 1, '2011-07-01 16:13:40'),
(259, 2, 1, 1, '2011-07-01 16:14:21'),
(260, 2, 1, 1, '2011-07-01 16:14:22'),
(261, 2, 1, 1, '2011-07-01 16:14:38'),
(262, 2, 1, 1, '2011-07-01 16:14:40'),
(263, 2, 1, 1, '2011-07-01 16:14:40'),
(264, 2, 1, 1, '2011-07-01 16:14:40'),
(265, 2, 1, 1, '2011-07-01 16:14:41'),
(266, 2, 1, 1, '2011-07-01 16:14:41'),
(267, 2, 1, 1, '2011-07-01 16:14:41'),
(268, 2, 1, 1, '2011-07-01 16:14:41'),
(269, 2, 1, 1, '2011-07-01 16:14:41'),
(270, 2, 1, 1, '2011-07-01 16:14:41'),
(271, 2, 1, 1, '2011-07-01 16:14:44'),
(272, 48, 11, 1, '2011-07-01 16:16:14'),
(273, 48, 11, 1, '2011-07-01 16:16:16'),
(274, 48, 11, 1, '2011-07-01 16:16:17'),
(275, 48, 11, 1, '2011-07-01 16:16:17'),
(276, 48, 11, 1, '2011-07-01 16:18:15'),
(277, 48, 11, 1, '2011-07-01 16:18:39'),
(278, 2, 1, 1, '2011-07-01 16:20:30'),
(279, 2, 1, 1, '2011-07-01 16:20:31'),
(280, 2, 1, 1, '2011-07-01 16:20:32'),
(281, 2, 1, 1, '2011-07-01 16:20:32'),
(282, 2, 1, 1, '2011-07-01 16:20:32'),
(283, 2, 1, 1, '2011-07-01 16:20:32'),
(284, 2, 1, 1, '2011-07-01 16:20:32'),
(285, 2, 1, 1, '2011-07-01 16:20:32'),
(286, 2, 1, 1, '2011-07-01 16:20:32'),
(287, 2, 1, 1, '2011-07-01 16:20:32'),
(288, 2, 1, 1, '2011-07-01 16:20:32'),
(289, 2, 1, 1, '2011-07-01 16:20:32'),
(290, 2, 1, 1, '2011-07-01 16:20:33'),
(291, 2, 1, 1, '2011-07-01 16:20:34'),
(292, 2, 1, 1, '2011-07-01 16:20:34'),
(293, 2, 1, 1, '2011-07-01 16:20:34'),
(294, 2, 1, 1, '2011-07-01 16:20:34'),
(295, 48, 11, 1, '2011-07-01 16:21:24'),
(296, 2, 1, 1, '2011-07-01 16:22:00'),
(297, 2, 1, 1, '2011-07-01 16:22:29'),
(298, 2, 1, 1, '2011-07-01 16:22:31'),
(299, 2, 1, 1, '2011-07-01 16:22:32'),
(300, 2, 1, 1, '2011-07-01 16:22:32'),
(301, 2, 1, 1, '2011-07-01 16:22:33'),
(302, 2, 1, 1, '2011-07-01 16:22:33'),
(303, 2, 1, 1, '2011-07-01 16:24:44'),
(304, 2, 1, 1, '2011-07-01 16:24:46'),
(305, 2, 1, 1, '2011-07-01 16:24:47'),
(306, 2, 1, 1, '2011-07-01 16:25:09'),
(307, 2, 1, 1, '2011-07-01 16:25:10'),
(308, 2, 1, 1, '2011-07-01 16:25:11'),
(309, 2, 1, 1, '2011-07-01 16:25:11'),
(310, 2, 1, 1, '2011-07-01 16:25:11'),
(311, 2, 1, 1, '2011-07-01 16:25:11'),
(312, 2, 1, 1, '2011-07-01 16:25:11'),
(313, 2, 1, 1, '2011-07-01 16:25:12'),
(314, 2, 1, 1, '2011-07-01 16:25:12'),
(315, 2, 1, 1, '2011-07-01 16:25:12'),
(316, 2, 1, 1, '2011-07-01 16:25:12'),
(317, 2, 1, 1, '2011-07-01 16:25:12'),
(318, 2, 1, 1, '2011-07-01 16:25:12'),
(319, 2, 1, 1, '2011-07-01 16:25:12'),
(320, 2, 1, 1, '2011-07-01 16:25:12'),
(321, 2, 1, 1, '2011-07-01 16:25:12'),
(322, 2, 1, 1, '2011-07-01 16:25:12'),
(323, 2, 1, 1, '2011-07-01 16:25:12'),
(324, 2, 1, 1, '2011-07-01 16:25:36'),
(325, 2, 1, 1, '2011-07-01 16:26:02'),
(326, 2, 1, 1, '2011-07-01 16:26:03'),
(327, 2, 1, 1, '2011-07-01 16:26:18'),
(328, 2, 1, 1, '2011-07-01 16:26:20'),
(329, 2, 1, 1, '2011-07-01 16:26:31'),
(330, 48, 11, 1, '2011-07-01 16:26:54'),
(331, 2, 1, 1, '2011-07-01 16:29:24'),
(332, 2, 1, 1, '2011-07-01 16:29:26'),
(333, 2, 1, 1, '2011-07-01 16:29:26'),
(334, 2, 1, 1, '2011-07-01 16:29:26'),
(335, 48, 1, 1, '2011-07-01 16:42:35'),
(336, 48, 1, 1, '2011-07-01 16:43:55'),
(337, 48, 1, 1, '2011-07-01 16:43:56'),
(338, 48, 1, 1, '2011-07-01 16:43:57'),
(339, 48, 1, 1, '2011-07-01 16:43:57'),
(340, 48, 1, 1, '2011-07-01 16:43:58'),
(341, 48, 1, 1, '2011-07-01 16:44:00'),
(342, 48, 1, 1, '2011-07-01 16:44:01'),
(343, 48, 1, 1, '2011-07-01 16:44:01'),
(344, 48, 1, 1, '2011-07-01 16:44:01'),
(345, 48, 1, 1, '2011-07-01 16:44:01'),
(346, 48, 1, 1, '2011-07-01 16:44:01'),
(347, 48, 1, 1, '2011-07-01 16:44:02'),
(348, 48, 1, 1, '2011-07-01 16:44:02'),
(349, 48, 1, 1, '2011-07-01 16:44:02'),
(350, 48, 1, 1, '2011-07-01 16:44:02'),
(351, 48, 1, 1, '2011-07-01 16:44:02'),
(352, 48, 1, 1, '2011-07-01 16:44:02'),
(353, 48, 1, 1, '2011-07-01 16:44:02'),
(354, 48, 1, 1, '2011-07-01 16:44:02'),
(355, 48, 1, 1, '2011-07-01 16:44:02'),
(356, 48, 1, 1, '2011-07-01 16:44:02'),
(357, 48, 1, 1, '2011-07-01 16:44:02'),
(358, 48, 1, 1, '2011-07-01 16:44:02'),
(359, 48, 1, 1, '2011-07-01 16:44:02'),
(360, 48, 1, 1, '2011-07-01 16:44:02'),
(361, 48, 1, 1, '2011-07-01 16:44:04'),
(362, 48, 1, 1, '2011-07-01 16:44:04'),
(363, 48, 1, 1, '2011-07-01 16:44:04'),
(364, 48, 1, 1, '2011-07-01 16:44:04'),
(365, 48, 1, 1, '2011-07-01 16:44:04'),
(366, 48, 1, 1, '2011-07-01 16:44:04'),
(367, 48, 1, 1, '2011-07-01 16:44:05'),
(368, 48, 1, 1, '2011-07-01 16:44:05'),
(369, 48, 1, 1, '2011-07-01 16:44:08'),
(370, 48, 1, 1, '2011-07-01 16:44:08'),
(371, 48, 1, 1, '2011-07-01 16:44:08'),
(372, 48, 1, 1, '2011-07-01 16:44:08'),
(373, 48, 1, 1, '2011-07-01 16:44:09'),
(374, 48, 1, 1, '2011-07-01 16:44:09'),
(375, 48, 1, 1, '2011-07-01 16:44:09'),
(376, 48, 1, 1, '2011-07-01 16:44:09'),
(377, 48, 1, 1, '2011-07-01 16:44:10'),
(378, 48, 1, 1, '2011-07-01 16:44:10'),
(379, 48, 1, 1, '2011-07-01 16:44:10'),
(380, 48, 1, 1, '2011-07-01 16:44:10'),
(381, 48, 1, 1, '2011-07-01 16:44:10'),
(382, 48, 1, 1, '2011-07-01 16:44:10'),
(383, 48, 1, 1, '2011-07-01 16:44:10'),
(384, 48, 1, 1, '2011-07-01 16:44:10'),
(385, 48, 1, 1, '2011-07-01 16:44:10'),
(386, 33, 2, 1, '2011-07-01 21:55:16'),
(387, 20, 2, 1, '2011-07-01 21:55:37'),
(388, 1, 2, 1, '2011-07-01 21:55:57'),
(389, 63, 11, 1, '2011-07-03 17:31:04'),
(390, 63, 11, 1, '2011-07-03 17:36:06'),
(391, 63, 11, 1, '2011-07-03 17:36:31'),
(392, 63, 21, 1, '2011-07-03 19:14:13'),
(393, 63, 12, 1, '2011-07-05 18:38:06'),
(394, 48, 12, 1, '2011-07-05 18:38:17'),
(395, 63, 12, 1, '2011-07-05 18:38:21'),
(396, 2, 12, 1, '2011-07-05 18:38:24'),
(397, 2, 12, 1, '2011-07-05 18:41:33'),
(398, 2, 12, 1, '2011-07-05 18:41:38'),
(399, 2, 12, 1, '2011-07-05 18:46:29'),
(400, 2, 12, 1, '2011-07-05 18:47:05'),
(401, 2, 12, 1, '2011-07-05 18:49:54'),
(402, 2, 12, 1, '2011-07-05 18:50:27'),
(403, 2, 12, 1, '2011-07-05 18:50:56'),
(404, 2, 12, 1, '2011-07-05 18:51:06'),
(405, 2, 12, 1, '2011-07-05 18:51:18'),
(406, 2, 12, 1, '2011-07-05 18:51:27'),
(407, 2, 12, 1, '2011-07-05 18:51:42'),
(408, 1, 12, 1, '2011-07-05 19:00:09'),
(409, 48, 12, 1, '2011-07-05 19:00:12'),
(410, 11, 12, 1, '2011-07-05 19:00:16'),
(411, 2, 12, 1, '2011-07-05 19:00:22'),
(412, 36, 1, 1, '2011-07-05 23:18:57'),
(413, 36, 1, 1, '2011-07-05 23:20:54'),
(414, 36, 1, 1, '2011-07-05 23:25:32'),
(415, 36, 1, 1, '2011-07-05 23:26:06'),
(416, 36, 1, 1, '2011-07-05 23:26:47'),
(417, 36, 1, 1, '2011-07-05 23:26:49'),
(418, 36, 1, 1, '2011-07-05 23:27:57'),
(419, 36, 1, 1, '2011-07-05 23:27:58'),
(420, 36, 1, 1, '2011-07-05 23:29:16'),
(421, 36, 1, 1, '2011-07-05 23:29:20'),
(422, 36, 1, 1, '2011-07-05 23:29:21'),
(423, 36, 1, 1, '2011-07-05 23:32:32'),
(424, 36, 1, 1, '2011-07-05 23:32:35'),
(425, 36, 1, 1, '2011-07-05 23:32:50'),
(426, 11, 12, 1, '2011-07-06 09:51:41'),
(427, 20, 12, 1, '2011-07-06 09:51:45'),
(428, 20, 12, 1, '2011-07-06 10:41:13'),
(429, 1, 12, 1, '2011-07-06 10:41:26'),
(430, 1, 12, 1, '2011-07-06 10:41:28'),
(431, 1, 12, 1, '2011-07-06 10:41:28'),
(432, 1, 12, 1, '2011-07-06 10:41:30'),
(433, 1, 12, 1, '2011-07-06 10:41:31'),
(434, 1, 12, 1, '2011-07-06 10:42:52'),
(435, 1, 12, 1, '2011-07-06 10:43:07'),
(436, 1, 1, 1, '2011-07-07 16:47:01'),
(437, 33, 1, 1, '2011-07-07 17:12:26'),
(438, 33, 23, 1, '2011-07-07 17:46:59'),
(439, 62, 23, 1, '2011-07-08 10:29:52'),
(440, 65, 23, 1, '2011-07-08 10:30:46'),
(441, 65, 23, 1, '2011-07-08 10:41:31'),
(442, 65, 24, 1, '2011-07-08 10:54:16'),
(443, 65, 24, 1, '2011-07-08 10:55:02'),
(444, 65, 23, 1, '2011-07-08 10:59:24'),
(445, 62, 23, 1, '2011-07-08 11:01:09'),
(446, 56, 23, 1, '2011-07-08 11:01:13'),
(447, 54, 23, 1, '2011-07-08 11:01:17'),
(448, 52, 23, 1, '2011-07-08 11:01:21'),
(449, 39, 23, 1, '2011-07-08 11:01:24'),
(450, 65, 24, 1, '2011-07-08 13:25:16'),
(451, 65, 21, 1, '2011-07-11 11:33:09'),
(452, 65, 21, 1, '2011-07-11 11:33:41'),
(453, 20, 12, 1, '2011-07-11 14:16:49'),
(454, 32, 12, 1, '2011-07-11 14:16:57'),
(455, 32, 12, 1, '2011-07-11 14:18:36'),
(456, 65, 21, 1, '2011-07-11 16:10:04'),
(457, 65, 21, 1, '2011-07-11 16:11:20'),
(458, 34, 12, 1, '2011-07-11 16:28:08'),
(459, 65, 21, 1, '2011-07-11 16:34:19'),
(460, 65, 21, 1, '2011-07-11 16:45:40'),
(461, 34, 12, 1, '2011-07-11 16:48:59'),
(462, 34, 12, 1, '2011-07-11 16:49:11'),
(463, 34, 12, 1, '2011-07-11 16:49:40'),
(464, 34, 12, 1, '2011-07-11 16:50:15'),
(465, 34, 12, 1, '2011-07-11 16:50:17'),
(466, 34, 12, 1, '2011-07-11 16:51:15'),
(467, 34, 12, 1, '2011-07-11 16:51:26'),
(468, 34, 12, 1, '2011-07-11 16:57:42'),
(469, 34, 12, 1, '2011-07-11 16:58:03'),
(470, 34, 12, 1, '2011-07-11 16:59:09'),
(471, 34, 12, 1, '2011-07-11 16:59:33'),
(472, 34, 12, 1, '2011-07-11 17:09:25'),
(473, 34, 12, 1, '2011-07-11 17:09:47'),
(474, 65, 21, 1, '2011-07-11 17:13:06'),
(475, 34, 12, 1, '2011-07-11 17:13:08'),
(476, 34, 12, 1, '2011-07-11 17:14:09'),
(477, 34, 12, 1, '2011-07-11 17:15:13'),
(478, 34, 12, 1, '2011-07-11 17:15:17'),
(479, 65, 21, 1, '2011-07-11 17:27:56'),
(480, 62, 21, 1, '2011-07-11 17:51:08'),
(481, 65, 21, 1, '2011-07-11 17:51:39'),
(482, 34, 12, 1, '2011-07-11 17:54:02'),
(483, 65, 12, 1, '2011-07-11 17:56:26'),
(484, 62, 12, 1, '2011-07-11 17:56:30'),
(485, 65, 21, 1, '2011-07-11 17:56:55'),
(486, 56, 21, 1, '2011-07-11 17:58:14'),
(487, 34, 12, 1, '2011-07-11 17:58:28'),
(488, 65, 21, 1, '2011-07-11 17:58:34'),
(489, 34, 12, 1, '2011-07-11 17:58:44'),
(490, 34, 12, 1, '2011-07-11 18:01:12'),
(491, 65, 21, 1, '2011-07-11 18:01:33'),
(492, 34, 12, 1, '2011-07-11 18:04:30'),
(493, 65, 21, 1, '2011-07-11 18:04:49'),
(494, 34, 12, 1, '2011-07-11 18:08:15'),
(495, 34, 12, 1, '2011-07-11 18:09:06'),
(496, 65, 21, 1, '2011-07-11 18:10:00'),
(497, 24, 27, 1, '2011-07-13 14:55:41'),
(498, 24, 27, 1, '2011-07-13 14:57:10'),
(499, 68, 27, 1, '2011-07-13 15:13:39'),
(500, 68, 27, 1, '2011-07-13 15:15:57'),
(501, 68, 27, 1, '2011-07-13 15:16:34'),
(502, 68, 27, 1, '2011-07-13 15:27:23'),
(503, 68, 27, 1, '2011-07-13 15:27:39'),
(504, 68, 27, 1, '2011-07-13 15:27:56'),
(505, 68, 27, 1, '2011-07-13 15:28:07'),
(506, 69, 27, 1, '2011-07-13 15:38:53'),
(507, 69, 27, 1, '2011-07-13 15:39:19'),
(508, 69, 27, 1, '2011-07-13 15:39:34'),
(509, 68, 1, 1, '2011-07-26 17:23:53'),
(510, 39, 1, 1, '2011-07-26 17:24:17'),
(511, 39, 1, 1, '2011-07-26 17:24:35'),
(512, 1, 1, 1, '2011-07-26 17:27:25'),
(513, 52, 1, 1, '2011-07-26 17:27:47'),
(514, 1, 1, 1, '2011-07-26 17:31:01'),
(515, 1, 1, 1, '2011-07-26 17:31:14'),
(516, 1, 1, 1, '2011-07-26 17:36:16'),
(517, 1, 1, 1, '2011-07-26 17:36:17'),
(518, 1, 1, 1, '2011-07-26 17:36:18'),
(519, 1, 1, 1, '2011-07-26 17:36:18'),
(520, 1, 1, 1, '2011-07-26 17:36:19'),
(521, 1, 1, 1, '2011-07-26 17:36:19'),
(522, 1, 1, 1, '2011-07-26 17:36:19'),
(523, 1, 1, 1, '2011-07-26 17:36:20'),
(524, 1, 1, 1, '2011-07-26 17:36:20'),
(525, 1, 1, 1, '2011-07-26 17:36:21'),
(526, 1, 1, 1, '2011-07-26 17:36:46'),
(527, 1, 1, 1, '2011-07-26 17:37:18'),
(528, 1, 1, 1, '2011-07-26 17:39:35'),
(529, 48, 12, 1, '2011-07-26 23:48:59'),
(530, 11, 12, 1, '2011-07-27 09:42:52'),
(531, 48, 12, 1, '2011-07-27 09:45:23'),
(532, 48, 12, 1, '2011-07-27 10:13:27'),
(533, 68, 27, 1, '2011-07-27 11:23:32'),
(534, 24, 27, 1, '2011-07-27 12:11:57'),
(535, 24, 27, 1, '2011-07-27 12:12:03'),
(536, 24, 27, 1, '2011-07-27 12:16:35'),
(537, 65, 27, 1, '2011-07-27 12:16:56'),
(538, 68, 27, 1, '2011-07-27 12:17:50'),
(539, 68, 27, 1, '2011-07-27 12:31:18'),
(540, 68, 27, 1, '2011-07-27 12:36:18'),
(541, 68, 27, 1, '2011-07-27 12:37:21'),
(542, 69, 27, 1, '2011-07-27 12:38:48'),
(543, 24, 27, 1, '2011-07-27 14:34:49'),
(544, 24, 27, 1, '2011-07-27 14:35:07'),
(545, 24, 27, 1, '2011-07-27 14:38:03'),
(546, 54, 27, 1, '2011-07-27 15:25:28'),
(547, 54, 27, 1, '2011-07-27 15:26:11'),
(548, 68, 27, 1, '2011-07-27 15:26:38'),
(549, 65, 31, 1, '2011-08-09 14:27:16'),
(550, 73, 27, 1, '2011-08-09 14:33:52'),
(551, 73, 27, 1, '2011-08-09 14:34:24'),
(552, 73, 12, 1, '2011-08-09 14:35:59'),
(553, 73, 27, 1, '2011-08-09 14:39:41'),
(554, 73, 27, 1, '2011-08-09 14:40:26'),
(555, 73, 27, 1, '2011-08-09 14:40:59'),
(556, 73, 12, 1, '2011-08-09 14:41:50'),
(557, 73, 27, 1, '2011-08-09 14:42:15'),
(558, 73, 12, 1, '2011-08-09 14:47:29'),
(559, 32, 12, 1, '2011-08-09 16:05:20'),
(560, 75, 1, 1, '2011-08-09 16:07:08'),
(561, 75, 1, 1, '2011-08-09 16:07:49'),
(562, 75, 1, 1, '2011-08-09 16:07:51'),
(563, 75, 27, 1, '2011-08-09 16:23:19'),
(564, 75, 27, 1, '2011-08-09 16:25:19'),
(565, 75, 27, 1, '2011-08-09 16:28:00'),
(566, 73, 27, 1, '2011-08-09 16:31:09'),
(567, 75, 27, 1, '2011-08-09 16:31:16'),
(568, 75, 12, 1, '2011-08-09 16:46:49'),
(569, 33, 12, 1, '2011-08-09 16:46:57'),
(570, 52, 12, 1, '2011-08-09 16:47:02'),
(571, 75, 12, 1, '2011-08-09 17:04:34'),
(572, 54, 12, 1, '2011-08-09 17:15:40'),
(573, 62, 12, 1, '2011-08-09 17:15:42'),
(574, 62, 12, 1, '2011-08-09 17:15:45'),
(575, 62, 12, 1, '2011-08-09 17:15:45'),
(576, 62, 12, 1, '2011-08-09 17:16:00'),
(577, 75, 12, 1, '2011-08-09 17:18:06'),
(578, 32, 12, 1, '2011-08-09 17:18:14'),
(579, 33, 12, 1, '2011-08-09 17:18:18'),
(580, 34, 12, 1, '2011-08-09 17:18:20'),
(581, 34, 12, 1, '2011-08-09 17:18:23'),
(582, 34, 12, 1, '2011-08-09 17:18:26'),
(583, 35, 12, 1, '2011-08-09 17:18:29'),
(584, 50, 12, 1, '2011-08-09 17:18:31'),
(585, 56, 12, 1, '2011-08-09 17:18:33'),
(586, 56, 12, 1, '2011-08-09 17:18:46'),
(587, 50, 12, 1, '2011-08-09 17:18:56'),
(588, 75, 27, 1, '2011-08-09 17:52:43'),
(589, 65, 27, 1, '2011-08-09 17:52:49'),
(590, 73, 27, 1, '2011-08-09 17:53:43'),
(591, 75, 27, 1, '2011-08-09 17:53:56'),
(592, 73, 27, 1, '2011-08-09 17:54:11'),
(593, 73, 27, 1, '2011-08-09 17:54:21'),
(594, 73, 27, 1, '2011-08-09 18:00:49'),
(595, 73, 27, 1, '2011-08-09 18:01:38'),
(596, 68, 27, 1, '2011-08-09 18:09:16'),
(597, 68, 27, 1, '2011-08-09 18:16:51'),
(598, 68, 31, 1, '2011-08-09 18:19:42'),
(599, 68, 27, 1, '2011-08-11 15:08:24'),
(600, 68, 27, 1, '2011-08-11 15:09:26'),
(601, 68, 27, 1, '2011-08-12 14:02:09'),
(602, 68, 27, 1, '2011-08-12 14:05:18'),
(603, 68, 27, 1, '2011-08-12 14:05:26'),
(604, 68, 27, 1, '2011-08-15 13:31:11'),
(605, 68, 27, 1, '2011-08-15 13:57:45'),
(606, 68, 27, 1, '2011-08-15 13:58:17'),
(607, 68, 27, 1, '2011-08-15 14:02:29'),
(608, 68, 27, 1, '2011-08-15 14:02:56'),
(609, 35, 1, 1, '2011-08-16 11:38:35'),
(610, 68, 27, 1, '2011-08-16 21:03:08'),
(611, 68, 27, 1, '2011-08-16 21:03:12'),
(612, 14, 1, 1, '2011-08-16 21:56:36'),
(613, 56, 1, 1, '2011-08-16 22:32:15'),
(614, 76, 27, 1, '2011-08-22 10:54:43'),
(615, 77, 27, 1, '2011-08-22 10:56:05'),
(616, 76, 27, 1, '2011-08-22 10:56:43'),
(617, 77, 27, 1, '2011-08-22 10:56:46'),
(618, 77, 27, 1, '2011-08-22 10:59:21'),
(619, 77, 27, 1, '2011-08-22 10:59:55'),
(620, 77, 27, 1, '2011-08-22 11:01:47'),
(621, 77, 27, 1, '2011-08-22 11:02:52'),
(622, 77, 27, 1, '2011-08-22 11:07:43'),
(623, 77, 27, 1, '2011-08-22 11:31:15'),
(624, 77, 27, 1, '2011-08-22 12:14:37'),
(625, 76, 12, 1, '2011-08-22 12:15:34'),
(626, 76, 12, 1, '2011-08-22 12:15:46'),
(627, 77, 27, 1, '2011-08-22 15:13:10'),
(628, 76, 27, 1, '2011-08-29 10:10:31'),
(629, 81, 36, 1, '2011-09-15 14:52:00'),
(630, 81, 36, 1, '2011-09-15 14:53:25'),
(631, 81, 37, 1, '2011-09-15 15:32:19'),
(632, 81, 37, 1, '2011-09-15 15:33:30'),
(633, 81, 38, 1, '2011-09-17 01:30:56'),
(634, 81, 38, 1, '2011-09-17 01:30:58'),
(635, 81, 38, 1, '2011-09-17 01:32:44'),
(636, 81, 38, 1, '2011-09-17 01:33:03'),
(637, 81, 38, 1, '2011-09-17 01:33:48'),
(638, 89, 38, 1, '2011-09-17 01:34:10'),
(639, 81, 38, 1, '2011-09-17 01:34:45'),
(640, 81, 38, 1, '2011-09-17 01:38:41'),
(641, 81, 38, 1, '2011-09-17 01:40:11'),
(642, 89, 38, 1, '2011-09-17 01:40:27'),
(643, 81, 38, 1, '2011-09-17 01:43:43'),
(644, 81, 38, 1, '2011-09-17 01:46:14'),
(645, 81, 36, 1, '2011-09-20 14:02:12'),
(646, 89, 36, 1, '2011-09-20 14:03:16'),
(647, 82, 36, 1, '2011-09-20 14:07:32'),
(648, 82, 36, 1, '2011-09-20 14:39:39'),
(649, 89, 36, 1, '2011-09-20 14:39:51'),
(650, 89, 36, 1, '2011-09-20 14:40:07'),
(651, 82, 36, 1, '2011-09-20 14:40:22'),
(652, 82, 36, 1, '2011-09-20 14:40:24'),
(653, 82, 36, 1, '2011-09-20 14:40:33'),
(654, 81, 36, 1, '2011-09-20 14:41:40'),
(655, 93, 36, 1, '2011-09-20 14:43:53'),
(656, 93, 36, 1, '2011-09-20 14:44:10'),
(657, 93, 36, 1, '2011-09-20 14:44:14'),
(658, 93, 36, 1, '2011-09-20 14:45:18'),
(659, 82, 36, 1, '2011-09-20 14:45:37'),
(660, 81, 36, 1, '2011-09-20 14:45:43'),
(661, 81, 36, 1, '2011-09-20 14:45:57'),
(662, 93, 36, 1, '2011-09-20 14:51:47'),
(663, 94, 36, 1, '2011-09-20 16:48:53'),
(664, 94, 36, 1, '2011-09-20 16:51:32'),
(665, 81, 36, 1, '2011-09-20 16:51:56'),
(666, 81, 36, 1, '2011-09-20 16:53:18'),
(667, 89, 36, 1, '2011-09-20 16:53:38'),
(668, 89, 36, 1, '2011-09-20 16:53:48'),
(669, 89, 36, 1, '2011-09-20 16:54:09'),
(670, 94, 40, 1, '2011-09-21 14:11:02'),
(671, 92, 41, 1, '2011-09-21 14:37:00'),
(672, 95, 40, 1, '2011-09-21 15:05:26'),
(673, 95, 40, 1, '2011-09-21 15:11:06'),
(674, 95, 40, 1, '2011-09-21 15:18:23'),
(675, 95, 40, 1, '2011-09-21 15:37:49'),
(676, 95, 40, 1, '2011-09-21 16:28:50'),
(677, 95, 40, 1, '2011-09-21 16:30:37'),
(678, 95, 40, 1, '2011-09-21 16:31:16'),
(679, 95, 40, 1, '2011-09-21 16:31:49'),
(680, 97, 40, 1, '2011-09-21 17:15:13'),
(681, 97, 40, 1, '2011-09-21 17:15:31'),
(682, 97, 40, 1, '2011-09-21 17:15:45'),
(683, 92, 40, 1, '2011-10-10 17:08:37'),
(684, 95, 40, 1, '2011-10-11 15:37:44'),
(685, 97, 40, 1, '2011-10-11 16:49:18'),
(686, 92, 41, 1, '2011-10-12 14:33:42'),
(687, 98, 41, 1, '2011-10-12 14:43:34'),
(688, 92, 41, 1, '2011-10-12 15:25:06'),
(689, 98, 38, 1, '2011-10-12 19:31:49'),
(690, 98, 38, 1, '2011-10-12 19:35:20'),
(691, 98, 38, 1, '2011-10-12 19:35:24'),
(692, 98, 38, 1, '2011-10-12 19:36:30'),
(693, 92, 38, 1, '2011-10-12 19:36:57'),
(694, 92, 38, 1, '2011-10-12 19:37:10'),
(695, 89, 38, 1, '2011-10-12 19:37:50'),
(696, 95, 38, 1, '2011-10-12 19:39:52'),
(697, 101, 38, 1, '2011-10-12 19:44:43'),
(698, 92, 40, 1, '2011-10-13 10:50:55'),
(699, 107, 40, 1, '2011-10-20 16:21:13'),
(700, 92, 40, 1, '2011-10-20 16:21:34'),
(701, 94, 40, 1, '2011-10-20 16:21:45'),
(702, 93, 40, 1, '2011-10-20 16:21:54'),
(703, 82, 40, 1, '2011-10-20 16:22:05'),
(704, 92, 40, 1, '2011-10-20 16:22:47'),
(705, 95, 40, 1, '2011-10-20 16:23:17'),
(706, 97, 40, 1, '2011-10-20 16:23:44'),
(707, 107, 38, 1, '2011-10-21 17:45:22'),
(708, 107, 38, 1, '2011-10-21 17:45:43'),
(709, 92, 40, 1, '2011-10-24 13:22:26'),
(710, 93, 40, 1, '2011-10-24 13:24:49'),
(711, 107, 40, 1, '2011-10-24 13:44:37'),
(712, 94, 40, 1, '2011-10-24 13:44:47'),
(713, 107, 38, 1, '2011-11-02 15:40:33'),
(714, 124, 53, 1, '2011-11-10 16:06:34'),
(715, 124, 53, 1, '2011-11-10 16:07:08'),
(716, 124, 53, 1, '2011-11-10 16:07:16'),
(717, 124, 53, 1, '2011-11-10 16:08:16'),
(718, 124, 53, 1, '2011-11-10 16:09:01'),
(719, 124, 53, 1, '2011-11-10 16:17:26'),
(720, 103, 41, 1, '2011-11-10 16:24:25'),
(721, 107, 38, 1, '2011-11-13 00:16:11'),
(722, 98, 38, 1, '2011-11-13 00:16:18'),
(723, 95, 38, 1, '2011-11-13 00:16:29'),
(724, 107, 38, 1, '2011-11-13 00:16:37'),
(725, 125, 38, 1, '2011-11-13 00:18:19'),
(726, 107, 38, 1, '2011-11-13 00:18:39'),
(727, 107, 38, 1, '2011-11-13 00:19:37'),
(728, 107, 38, 1, '2011-11-13 00:22:24'),
(729, 125, 38, 1, '2011-11-13 00:22:35'),
(730, 107, 38, 1, '2011-11-13 00:36:15'),
(731, 125, 38, 1, '2011-11-13 00:41:23'),
(732, 125, 54, 1, '2011-11-15 15:03:59'),
(733, 126, 54, 1, '2011-11-15 15:06:30'),
(734, 125, 54, 1, '2011-11-15 15:10:48'),
(735, 126, 54, 1, '2011-11-15 15:14:20'),
(736, 126, 54, 1, '2011-11-15 16:14:43'),
(737, 125, 54, 1, '2011-11-15 16:14:57'),
(738, 95, 54, 1, '2011-11-15 16:15:56'),
(739, 95, 54, 1, '2011-11-15 16:16:28'),
(740, 126, 54, 1, '2011-11-15 16:19:15'),
(741, 126, 54, 1, '2011-11-16 11:02:13'),
(742, 95, 54, 1, '2011-11-16 11:03:37'),
(743, 95, 54, 1, '2011-11-16 11:04:09'),
(744, 126, 54, 1, '2011-11-16 11:06:29'),
(745, 126, 54, 1, '2011-11-16 11:25:11'),
(746, 137, 54, 1, '2011-11-16 11:25:50'),
(747, 135, 54, 1, '2011-11-16 11:56:09'),
(748, 131, 54, 1, '2011-11-16 11:56:46'),
(749, 127, 54, 1, '2011-11-16 11:56:50'),
(750, 134, 54, 1, '2011-11-16 11:56:54'),
(751, 130, 54, 1, '2011-11-16 11:56:59'),
(752, 126, 54, 1, '2011-11-16 11:57:04'),
(753, 135, 54, 1, '2011-11-16 11:57:20'),
(754, 131, 54, 1, '2011-11-16 11:57:23'),
(755, 127, 54, 1, '2011-11-16 11:57:27'),
(756, 126, 54, 1, '2011-11-16 11:58:09'),
(757, 130, 54, 1, '2011-11-16 11:58:13'),
(758, 134, 54, 1, '2011-11-16 11:58:17'),
(759, 127, 54, 1, '2011-11-16 11:58:20'),
(760, 131, 54, 1, '2011-11-16 11:58:24'),
(761, 135, 54, 1, '2011-11-16 11:58:27'),
(762, 137, 55, 1, '2011-11-16 11:59:52'),
(763, 133, 55, 1, '2011-11-16 11:59:55'),
(764, 129, 55, 1, '2011-11-16 11:59:59'),
(765, 136, 55, 1, '2011-11-16 12:00:03'),
(766, 132, 55, 1, '2011-11-16 12:00:06'),
(767, 128, 55, 1, '2011-11-16 12:00:10'),
(768, 126, 54, 1, '2011-11-16 12:07:31'),
(769, 130, 54, 1, '2011-11-16 12:07:37'),
(770, 134, 54, 1, '2011-11-16 12:07:40'),
(771, 127, 54, 1, '2011-11-16 12:07:43'),
(772, 131, 54, 1, '2011-11-16 12:07:47'),
(773, 135, 54, 1, '2011-11-16 12:07:50'),
(774, 128, 55, 1, '2011-11-16 12:08:11'),
(775, 132, 55, 1, '2011-11-16 12:08:14'),
(776, 136, 55, 1, '2011-11-16 12:08:19'),
(777, 129, 55, 1, '2011-11-16 12:08:22'),
(778, 133, 55, 1, '2011-11-16 12:08:25'),
(779, 137, 55, 1, '2011-11-16 12:08:27'),
(780, 126, 54, 1, '2011-11-16 13:31:36'),
(781, 126, 54, 1, '2011-11-16 13:41:12'),
(782, 130, 54, 1, '2011-11-16 13:41:56'),
(783, 130, 54, 1, '2011-11-16 13:43:14'),
(784, 126, 54, 1, '2011-11-16 13:43:31'),
(785, 130, 54, 1, '2011-11-16 13:44:34'),
(786, 134, 54, 1, '2011-11-16 13:45:09'),
(787, 132, 55, 1, '2011-11-16 14:38:06'),
(788, 132, 55, 1, '2011-11-16 14:38:37'),
(789, 132, 55, 1, '2011-11-16 14:38:51'),
(790, 132, 55, 1, '2011-11-16 14:39:23'),
(791, 132, 55, 1, '2011-11-16 14:40:38'),
(792, 134, 54, 1, '2011-11-16 15:17:59'),
(793, 131, 54, 1, '2011-11-16 15:18:14'),
(794, 134, 54, 1, '2011-11-16 15:18:45'),
(795, 134, 54, 1, '2011-11-16 16:15:58'),
(796, 127, 54, 1, '2011-11-16 16:16:08'),
(797, 107, 38, 1, '2011-11-24 22:26:23'),
(798, 126, 38, 1, '2011-12-03 16:26:41'),
(799, 126, 38, 1, '2011-12-03 16:28:12'),
(800, 126, 38, 1, '2011-12-03 16:29:18'),
(801, 126, 38, 1, '2011-12-03 17:31:48'),
(802, 134, 54, 1, '2011-12-03 18:48:02'),
(803, 128, 54, 1, '2011-12-03 23:41:04'),
(804, 130, 54, 1, '2011-12-03 23:45:54'),
(805, 130, 54, 1, '2011-12-03 23:46:00'),
(806, 125, 38, 1, '2011-12-03 23:49:55'),
(807, 134, 54, 1, '2011-12-05 17:55:15'),
(808, 112, 38, 1, '2011-12-06 22:40:37'),
(809, 137, 38, 1, '2011-12-06 22:41:56'),
(810, 136, 38, 1, '2011-12-06 22:42:05'),
(811, 134, 38, 1, '2011-12-06 22:42:07'),
(812, 129, 38, 1, '2011-12-06 22:42:13'),
(813, 127, 38, 1, '2011-12-06 22:42:17'),
(814, 128, 38, 1, '2011-12-06 22:42:22'),
(815, 131, 38, 1, '2011-12-06 22:42:26'),
(816, 133, 38, 1, '2011-12-06 22:42:30'),
(817, 134, 38, 1, '2011-12-06 22:42:33'),
(818, 126, 54, 1, '2011-12-06 22:44:01'),
(819, 137, 54, 1, '2011-12-06 22:45:55'),
(820, 133, 54, 1, '2011-12-06 22:46:00'),
(821, 135, 54, 1, '2011-12-06 22:46:09'),
(822, 135, 54, 1, '2011-12-06 22:47:01'),
(823, 135, 54, 1, '2011-12-06 22:50:10'),
(824, 134, 54, 1, '2011-12-08 02:09:32'),
(825, 126, 54, 1, '2011-12-10 15:12:12'),
(826, 135, 41, 1, '2011-12-14 16:53:58'),
(827, 141, 38, 1, '2011-12-16 17:20:53');

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
) ENGINE=MyISAM  DEFAULT CHARSET=latin1;

--
-- Dumping data for table `zp_relink`
--

INSERT INTO `zp_relink` (`id`, `title`, `url`, `img`, `orid`, `createtime`) VALUES
(54, NULL, NULL, NULL, 0, '2011-11-14 15:28:52'),
(55, NULL, NULL, NULL, 0, '2011-11-14 15:31:13'),
(38, NULL, NULL, NULL, 2, '2011-10-12 19:30:46'),
(39, NULL, NULL, NULL, 8, '2011-10-12 19:38:54'),
(49, NULL, NULL, NULL, 0, '2011-10-20 01:42:02');

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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=88 ;

--
-- Dumping data for table `zp_resume`
--

INSERT INTO `zp_resume` (`id`, `uid`, `rtype`, `uname`, `idcard`, `phone`, `email`, `gender`, `stature`, `weight`, `birth_year`, `birth_month`, `birth_day`, `degree`, `speciality`, `birth_gnd`, `live_gnd`, `live_address`, `jobterm`, `entrytime`, `funtype`, `dustrytype`, `salary`, `work_gnd`, `nowzt`, `status`, `introduction`, `interest`, `zycourse`, `views`, `modifydate`, `createdate`) VALUES
(1, 1, 'cn', '尧国利', '362523198411214411', '18601362361', 'arlicn@126.com', 1, '170', '60', 1984, 11, 11, '4', '1,2', '1,419', '1,419', '北京市朝阳区和平西街18号', '全职', '14', '1,2', '1,2', '6', '1,419', '在职', 1, '5年软件开发经验', '各种爱好', '很多课程', 0, 1311670733, '2011-03-31 13:07:09'),
(2, 2, 'cn', '陈国良', '511324198808080018', '13811058234', 'cc@163.com', 1, '183', '75', 1988, 8, 8, '1', '计算机专业', '1,418', '1,421', NULL, '兼职', '14', '3,4', '3,4', '9', '1,418', '离职', 1, '3年销售经验、5年软件开发经验', '广泛', '很多', 0, 1309096557, '2011-04-04 12:02:04'),
(3, 11, 'cn', '贾道允', '370802198512219513', '13439904554', 'jiadaoyun@163.com', 1, NULL, NULL, 1995, 12, 21, '5', '1,2', '42,189', '1,0', NULL, '全职', '0', '1,2', '1,2', '6', '1,0', '在职', 1, '乐观！专业！具有团队合作精神！', '', '', 0, 1303823040, '2011-04-13 17:14:02'),
(4, 12, 'cn', '宋煜', '110108197011104934', '13910985865', 'songyu@chinawinhr.com.cn', 1, NULL, NULL, 1970, 11, 10, '4', '1,2', '1,0', '1,0', NULL, '全职', '7', '1,2', '1,2', '1', '1,0', '离职', 1, NULL, NULL, NULL, 0, 0, '2011-04-26 11:53:41'),
(5, 14, 'cn', '小马', '370802198512219513', '13810888881', '8wy493717@163.com', 1, NULL, NULL, 1989, 4, 1, '3', '1,2', '1,418', '1,418', NULL, '全职', '14', '1,2', '1,2', '2', '1,418', '在职', 1, '好！', '上网', '计算机', 0, 1304142806, '2011-04-30 13:53:26'),
(6, 17, 'cn', '小马王', '370802198512219511', '13439904552', 'jiadaoyun876@126.com', 1, NULL, NULL, 2011, 1, 1, '3', '1,2', '1,418', '1,418', NULL, '全职', '0', '3,4', '3,4', '4', '1,418', '在职', 0, '不错', '上网', '计算机', 0, 1304834668, '2011-05-08 14:04:28'),
(7, 32, 'cn', '无忌', '370809198512231865', '13134321231', '123123123@123.com', 1, NULL, NULL, 1985, 1, 1, '10', '1,2', '1,419', '1,418', NULL, '全职', '30', '1,2', '1,2', '5', '1,418', '在职', 0, '不错', '上网', '计算机', 0, 1305948184, '2011-05-21 11:23:04'),
(8, 20, 'cn', '无忌', '370809198512231865', '13439904558', '123123@123.om', 1, NULL, NULL, 1985, 2, 19, '5', '1,2', '1,418', '1,418', NULL, '全职', '0', '1,2', '1,2', '2', '1,418', '在职', 1, '不错，很上进！', '上网', '计算机', 0, 1305988072, '2011-05-21 22:27:52'),
(9, 33, 'cn', '王语嫣', '370809198512231865', '13439901111', 'geren@126.com', 1, NULL, NULL, 2011, 1, 1, '4', '1,2', '1,418', '1,418', NULL, '全职', '7', '1,2', '1,2', '5', '1,0', '在职', 0, '乐观', '上网', '计算机', 0, 1305988674, '2011-05-21 22:37:54'),
(10, 34, 'cn', '李明', '362523198411214410', '13810056749', 'arrfd@dd.com', 1, NULL, NULL, 1987, 1, 1, '4', '1,2', '1,418', '1,419', NULL, '兼职', '0', '1,2', '1,2', '2', '1,418', '在职', 1, '发生大幅度是', '发生大幅度', '反对法 ', 0, 1305992332, '2011-05-21 23:38:52'),
(11, 35, 'cn', '张无忌', '370809198512231865', '13343428761', 'geren2@126.com', 1, NULL, NULL, 2002, 2, 2, '5', '1,2', '1,418', '1,418', NULL, '全职', '0', '1,2', '1,2', '3', '1,418', '在职', 1, '很好', '上网', '计算机', 0, 1305993248, '2011-05-21 23:54:08'),
(12, 36, 'cn', '贾道允测试', '37080919851223186X', '13434343432', 'jiadaoyun123@126.com', 1, NULL, NULL, 1996, 1, 1, '1', '1,2', '1,418', '1,418', NULL, '全职', '0', '5,', '7,8', '4', '1,0', '在职', 1, '不错，乐观', '上网，编程', '计算机科学与技术', 0, 1306046811, '2011-05-22 14:46:51'),
(13, 37, 'cn', '阿萨德', '370802198512219513', '13433333333', '123123@123123.com', 1, '185', '80', 2011, 1, 1, '0', ',', '1,0', '1,0', NULL, '全职', '0', '1,', '7,', '1', '1,0', '在职', 0, '阿时的撒旦', NULL, NULL, 0, 1306222165, '2011-05-24 15:29:25'),
(14, 39, 'cn', '十点多', '370809198512231865', '13434343437', 'asdasd@asd.com', 1, '185', '80', 2011, 1, 1, '9', '1,2', '1,418', '1,419', NULL, '全职', '0', '1,2', '1,2', '1', '1,418', '在职', 1, NULL, NULL, NULL, 0, 1306232610, '2011-05-24 18:23:30'),
(15, 43, 'cn', '李明', '362523198411214410', '13810056747', 'test06041@126.com', 1, '168', '67', 1987, 1, 1, '4', '1,2', '1,418', '1,418', NULL, '全职', '0', '1,2', '1,2', '5', '1,418', '在职', 1, '非常好', '很多', '很懂', 0, 1307243291, '2011-06-05 11:08:11'),
(16, 48, 'cn', '推广测试', '370802198512219511', '13433323330', 'tuiguangzhuti@126.com', 1, '180', '80', 1986, 1, 1, '4', '计算机专业', '1,418', '1,418', '上地树村1', '全职', '0', '1,2', '7,8', '1', '1,0', '在职', 1, '不错', '上网', '计算机科学与技术', 0, 1311732848, '2011-06-08 22:06:19'),
(17, 49, 'cn', '推广下线', '370809198512231861', '13211111111', 'tui1@126.com', 1, '185', '90', 1993, 1, 1, '5', '1,2', '1,418', '1,418', NULL, '全职', '0', '1,2', '7,8', '1', '1,418', '在职', 1, '很不错的人哦', '打篮球', '工程设计', 0, 1307542693, '2011-06-08 22:18:13'),
(18, 50, 'cn', '推广下线2', '370809198512231862', '13134321230', 'tui2@126.com', 1, '175', '70', 1993, 1, 1, '5', '1,2', '1,418', '1,418', NULL, '全职', '0', '1,2', '1,2', '3', '1,418', '在职', 1, '好孩子', '乒乓球', 'MBA', 0, 1307543393, '2011-06-08 22:29:53'),
(19, 52, 'cn', '测试A', '37080219851221951X', '13439904559', 'ceshi@ceshi.com', 1, '180', '95', 2011, 1, 1, '5', '1,2', '1,418', '1,418', NULL, '全职', '0', '1,2', '1,2', '1', '1,0', '在职', 1, '按时打算的', '阿萨德', '阿萨德', 0, 1308275740, '2011-06-17 09:55:40'),
(20, 53, 'cn', '科骏达', '511324198108080018', '13811058288', 'bbbb@163.com', 1, '183', '75', 1995, 1, 1, '4', '1,2', '1,421', '1,421', NULL, '全职', '0', '3,4', '3,4', '1', '1,421', '在职', 0, NULL, NULL, NULL, 0, 1308367314, '2011-06-18 11:21:54'),
(21, 54, 'cn', '宋煜', '110108197011104935', '13910985867', 'songyu@hotmail.com', 1, '170', '60', 1970, 11, 10, '4', '1,2', '1,418', '1,418', NULL, '全职', '0', '1,2', '7,8', '1', '1,0', '离职', 1, '不错', '', '', 0, 1308465941, '2011-06-19 14:45:27'),
(22, 55, 'cn', '宋玉', '110108197111104934', '13533333333', 'sinmon@163.com', 1, '175', '60', 2011, 1, 1, '4', '1,2', '1,418', '1,418', NULL, '全职', '0', '1,2', '7,8', '1', '1,418', '在职', 0, NULL, NULL, NULL, 0, 1308466282, '2011-06-19 14:51:22'),
(23, 56, 'cn', '郑妍岩', '110106198205210948', '18801012196', 'zhengyanyan@chinawinhr.com.cn', 2, '165', '60', 1982, 5, 21, '4', '1,2', '1,419', '1,419', NULL, '全职', '0', '3,4', '7,8', '5', '1,419', '在职', 1, NULL, NULL, NULL, 0, 1308586015, '2011-06-21 00:06:55'),
(24, 62, 'cn', 'ssss123456ssss1', '320421198801010919', '18602103868', 'ssss123456ssss1@sohu.com', 1, '12', '1', 1992, 1, 1, '5', '1,2', '1,418', '1,419', NULL, '全职', '0', '1,2', '7,8', '1', '1,418', '在职', 1, 'ssss123456ssss1', NULL, NULL, 0, 1308903141, '2011-06-24 16:12:21'),
(25, 63, 'cn', '宋玉', '110108197011104936', '13333333333', 'david@126.net', 1, '170', '60', 1970, 1, 1, '4', '贸易经济', '1,418', '1,418', NULL, '全职', '0', '3,4', '1,2', '1', '1,0', '离职', 0, '等和v粉嫩就赶快nds ', NULL, NULL, 0, 1309683177, '2011-07-03 16:52:57'),
(26, 65, 'cn', '王鑫', '37080219851221952X', '13615478120', 'asdasd@1212.com', 1, '180', '82', 2011, 1, 1, '5', '计算机', '1,418', '1,418', NULL, '全职', '0', '1,2', '7,8', '1', '1,0', '在职', 1, '不错', NULL, NULL, 0, 1310033721, '2011-07-07 18:15:21'),
(27, 24, 'cn', 'xxxxx', 'xxxxxxxxxxxxxxxx', '13552586651', 'cuijiaonihao@163.com', 2, '110', '110', 2011, 1, 1, '5', 'agagag', '1,419', '56,373', NULL, '全职', '0', '1,2', '7,8', '1', '1,418', '离职', 1, 'aha hahh', 'aaaaaaaa', 'aaaaaaaaaa', 0, 1310534257, '2011-07-13 13:17:37'),
(28, 68, 'cn', '王菲', '110108197011104938', '13910585865', 'david@163.com', 2, '165', '50', 1970, 1, 1, '4', '人力资源', '1,418', '1,418', '关东店南街2号', '全职', '0', '1,2', '7,8', '2', '1,418', '离职', 1, '不错', '足球', '', 0, 1311736910, '2011-07-13 14:11:35'),
(29, 69, 'cn', '妍岩', '110106198205210948', '13599999999', 'yanyan@126.com', 1, '165', '60', 2011, 1, 1, '4', '人力资源', '1,418', '1,418', NULL, '全职', '0', '1,2', '7,8', '2', '1,418', '离职', 1, '\r\n', '', '', 0, 1310552218, '2011-07-13 15:35:24'),
(30, 71, 'cn', '测试3', '370802198512212510', '13333333231', 'aaa11a@aaaa.com', 1, '132', '132', 2011, 1, 1, '5', '123', '1,418', '1,418', NULL, '全职', '7', '1,2', '7,8', '2', '1,418', '在职', 0, '阿萨德', '', '', 0, 1310911742, '2011-07-17 18:51:46'),
(31, 72, 'cn', '推广下线3', '37080219251221951X', '13439904553', 'tui3@126.com', 1, '150', '62', 2011, 1, 1, '4', '111', '1,418', '1,418', '111', '全职', '0', '1,2', '7,8', '2', '1,0', '在职', 1, 'asdasd', NULL, NULL, 0, 1311755259, '2011-07-27 16:27:39'),
(32, 73, 'cn', '宋玉', '110106198205210947', '13910986865', 'songyu@631.com', 1, '170', '60', 1970, 1, 1, '5', '人力资源', '1,418', '1,419', '关东店南街2号', '全职', '0', '1,2', '7,8', '1', '1,418', '离职', 1, '不错', NULL, NULL, 0, 1312870501, '2011-08-09 14:15:01'),
(33, 75, 'cn', '小马测试', '37081219851221953X', '13439904557', '111111@jjjj.com', 1, '185', '90', 1985, 1, 1, '5', '计算机', '1,418', '1,418', '上地', '全职', '0', '1,2', '7,8', '9', '1,418', '在职', 1, '很好的一个人', NULL, NULL, 0, 1312877031, '2011-08-09 16:03:51'),
(34, 76, 'cn', 'simon', '110106198205210950', '13910986868', 'simon@163.com', 1, '175', '50', 1982, 1, 1, '4', '人力资源', '1,419', '1,419', '关东店南街2号', '全职', '0', '1,2', '7,8', '2', '1,419', '在职', 1, '不错', '足球', '计算机', 0, 1313981372, '2011-08-22 10:49:32'),
(35, 77, 'cn', 'jimi', '110106198205210939', '13333333334', 'jimi@126.com', 1, '170', '50', 1985, 1, 1, '5', '人力资源', '1,418', '1,419', '关东店南街3号', '全职', '0', '1,2', '7,8', '3', '1,419', '在职', 1, '很好', NULL, NULL, 0, 1313981626, '2011-08-22 10:53:46'),
(36, 78, 'cn', '1111', '321010234567676', '13810888888', 'ssss123456ssssa@163.com', 1, '111', '1', 2011, 1, 1, '0', '11', '1,', '33,61', '111', '全职', '0', '1,2', '7,8', '1', '1,419', '在职', 0, '1', NULL, NULL, 0, 1315393670, '2011-09-07 19:07:50'),
(37, 79, 'cn', 'david', '110106198205210947', '13910985865', 'songyu@163.com', 1, NULL, NULL, 2011, 1, 1, '0', '', '1,', '1,', NULL, '全职', '0', '6,', '7,', '1', '1,0', '在职', 0, '1111', NULL, NULL, 0, 1315547234, '2011-09-09 13:47:14'),
(38, 89, 'cn', 'david', '110106198205210939', '13333333333', 'david@332.com', 1, '111', '111', 1984, 1, 1, '4', 'hr', '1,418', '1,419', '关东店南街3号', '全职', '0', '6,', '7,8', '1', '1,418', '在职', 1, 'fdsvfdf', NULL, NULL, 0, 1316053793, '2011-09-15 10:29:53'),
(39, 81, 'cn', 'songtest', '111111111111111', '13000000000', '123456ssss@sohu.com', 1, '111', '11', 2011, 1, 2, '5', '111', '1,419', '1,419', '', '全职', '0', '12,13', ',', '1', '1,0', '在职', 1, '111', '', '', 0, 1319190205, '2011-09-15 14:51:43'),
(51, 109, 'cn', 'utest50', '989898989898909', '13768676756', 'utest50@1.com', 1, '123', '123', 2011, 1, 1, '4', '123', '1,', '1,', '', '全职', '0', '7,8', '7,8', '1', '1,0', '在职', 0, '123', '', '', 0, 1319181882, '2011-10-21 15:10:09'),
(40, 82, 'cn', 'songresume', '111111111111111111', '13000000001', '123456ssss1@sohu.com', 1, '11', '11', 2011, 1, 1, '5', '1', '1,418', '1,418', NULL, '全职', '0', '6,', '7,8', '2', '1,418', '在职', 1, '1', NULL, NULL, 0, 1316498756, '2011-09-20 14:05:56'),
(41, 93, 'cn', '1111', '000000000000001', '13800000001', 'u@1.com', 1, '11', '11', 2011, 1, 1, '5', '1', '1,418', '1,418', NULL, '全职', '0', '6,', '7,8', '2', '1,418', '在职', 1, '1', NULL, NULL, 0, 1316500996, '2011-09-20 14:43:16'),
(42, 94, 'cn', '1111111111111111', '999999999999999', '13111111111', 'songtest@g.com', 1, '111', '111', 2011, 1, 1, '5', '1', '1,418', '1,418', '11', '全职', '0', '6,', '7,8', '1', '1,0', '在职', 1, '1', NULL, NULL, 0, 1316508316, '2011-09-20 16:45:16'),
(43, 95, 'cn', '宋煜', '110108197011104934', '13910985865', 'songyu@126.com', 1, '170', '60', 1970, 11, 10, '4', '贸易经济', '1,418', '1,419', '太阳宫', '全职', '0', '7,8', '7,8', '2', '1,419', '离职', 1, '不错', '足球', '社保、劳资', 0, 1316589484, '2011-09-21 13:53:32'),
(44, 92, 'cn', '杜家', '310115198410180411', '13764504506', 'ugilove@sina.com', 1, '111', '111', 2010, 3, 4, '4', '111', '1,418', '1,418', '111', '全职', '0', '7,8', ',', '3', '56,373', '在职', 1, '1111', '', '', 0, 1322459930, '2011-09-21 14:35:58'),
(45, 97, 'cn', '宋玉', '110106198205210960', '13910986868', 'songyu1@126.com', 1, '170', '60', 1975, 1, 1, '5', '外贸', '1,418', '1,418', '永定路', '全职', '0', '7,8', '1,2', '1', '1,418', '离职', 1, '很好', NULL, NULL, 0, 1316595591, '2011-09-21 16:59:51'),
(46, 98, 'cn', '申扬', '110105197301119449', '13901212873', 'konzopp@hotmail.com', 2, '168', '58', 1973, 1, 11, '5', '管理', '1,419', '1,419', '', '全职', '14', '7,8', '7,8', '6', '1,419', '离职', 1, '3年人行管理\r\n', '旅游，音乐', '经济管理', 0, 1317721721, '2011-10-04 17:15:02'),
(47, 101, 'cn', '5555', '989898989898989', '13788888888', 'songtest2@1.com', 1, '55', '55', 2011, 1, 1, '9', '55', '1,', '1,', NULL, '全职', '0', '7,8', '7,8', '1', '1,0', '在职', 1, '55', NULL, NULL, 0, 1318419826, '2011-10-12 19:43:46'),
(48, 99, 'cn', '丹尼尔', '322222222222222222', '13501637645', 'danieldu1018@gmail.com', 1, '170', '11', 2011, 1, 1, '5', '11', '1,418', '1,419', '111', '全职', '0', '7,8', '7,8', '1', '1,419', '在职', 1, NULL, NULL, NULL, 0, 1318499397, '2011-10-13 17:49:57'),
(49, 103, 'cn', '1111', '311111222222222222', '13765544445', 'danieldu@1.com', 1, '111', '111', 2011, 1, 1, '5', '111', '1,418', '1,418', '1111', '全职', '7', '7,8', '9,10', '1', '1,418', '在职', 1, NULL, NULL, NULL, 0, 1318923189, '2011-10-18 15:33:09'),
(50, 107, 'cn', 'test', '310111111111111112', '13700000001', 'a10test@2.com', 1, '111', '11', 2011, 1, 1, '4', 'dd', '1,', '1,', NULL, '全职', '0', '10,11', '9,10', '1', '1,0', '在职', 1, 'dd', NULL, NULL, 0, 1318933665, '2011-10-18 18:27:45'),
(52, 110, 'cn', 'test', '987678767656545', '13867654543', 'utest100@1.com', 1, '123', '123', 2011, 1, 1, '4', '最高专业', '1,418', '1,418', '123', '全职', '0', '7,8', ',', '1', '1,0', '在职', 0, '123', '', '', 0, 1322458761, '2011-10-21 15:53:40'),
(53, 81, 'en', 'songuser', '111111111111111', '13000000000', '123456ssss@sohu.com', 1, '123', '123', 2011, 1, 1, '5', '', '1,0', '1,0', '123', 'full-time', '0', '12,13', ',', '1', '1,0', 'in service', 1, '123', NULL, NULL, 0, 1319190275, '2011-10-21 17:44:35'),
(54, 115, 'cn', 'ssssss', '138108888881381661', '13810888882', 'a@gmail.com', 1, '11', '11', 2011, 1, 1, '10', 'dddd', '1,418', '1,421', 'ddd', '全职', '0', '10,11', ',', '4', '1,418', '在职', 0, 'test test', NULL, NULL, 0, 1319652350, '2011-10-27 02:05:50'),
(55, 116, 'cn', 'dddd', '138108888881381662', '13810888883', 'a1@gmail.com', 1, '11', '11', 2011, 1, 1, '4', 'dddd', '1,422', '44,10', 'ddd', '全职', '0', ',', ',', '1', '1,0', '在职', 1, 'test', 'test test', 'ssdd', 0, 1319652741, '2011-10-27 02:09:41'),
(56, 117, 'cn', '11111111', '555555555555555555', '13144455555', 'testdemo001@1.com', 1, '111', '1', 2011, 1, 1, '4', '111111111111', '48,289', '51,18', '111111111', '全职', '0', '10,11', ',', '1', '1,0', '在职', 0, NULL, NULL, NULL, 0, 1319788940, '2011-10-28 16:02:20'),
(57, 118, 'cn', 'dddd2', '443202010100243242', '13810888884', 'aa@gmail.com', 1, '11', '11', 2011, 1, 1, '0', 'dddd', '3,420', '3,420', NULL, '全职', '0', ',', ',', '1', '1,0', '在职', 0, 'ttt', 'tt', 'tt', 0, 1319936908, '2011-10-30 09:08:28'),
(58, 118, 'en', 'ttttt', '443202010100243242', '13810888884', 'aa@gmail.com', 1, '11', '11', 2011, 1, 1, '5', '', '1,0', '1,0', 'ttt', 'full-time', '0', ',', ',', '1', '1,0', 'in service', 0, 'tt', 'tt', 'tt', 0, 1319937282, '2011-10-30 09:14:42'),
(59, 119, 'en', '12213', '333333333333333334', '13222233333', 'testdemo002@1.com', 1, '11', '11', 2011, 1, 1, '5', '', '1,0', '1,0', '11111', 'full-time', '0', '7,8', ',', '1', '1,0', 'in service', 0, NULL, NULL, NULL, 0, 1320035601, '2011-10-31 12:33:21'),
(60, 120, 'cn', '测1号', '312222222222222222', '13222222222', 't01a05personal@1.com', 1, '180', '70', 1988, 1, 1, '4', '计算机', '1,418', '1,419', '朝阳大道', '全职', '0', '7,8', ',', '4', '1,418', '在职', 0, NULL, NULL, NULL, 0, 1320048204, '2011-10-31 16:03:24'),
(61, 120, 'en', 'test1', '312222222222222222', '13222222222', 't01a05personal@1.com', 1, '180', '70', 1988, 1, 1, '4', '', '1,418', '1,419', 'No.300 Chaoyang Ave.', 'full-time', '0', '7,8', ',', '4', '1,418', 'in service', 0, NULL, NULL, NULL, 0, 1320048654, '2011-10-31 16:10:54'),
(62, 124, 'cn', 'ytest01', '878876676576565', '13987676545', 'yonghutest1@1.com', 1, '123', '12', 2011, 1, 1, '5', '123', '1,', '1,', NULL, '全职', '0', ',', ',', '1', '1,0', '在职', 1, '123', NULL, NULL, 0, 1320911959, '2011-11-10 15:59:19'),
(63, 125, 'cn', '12345', '987876545676565', '13987876545', 'utest1001@1.com', 1, '123', '123', 2011, 1, 1, '0', '123', '1,418', '1,418', NULL, '全职', '0', '10,11', ',', '1', '1,0', '在职', 1, '123', NULL, NULL, 0, 1321114661, '2011-11-13 00:17:41'),
(64, 126, 'cn', '测2号01', '110108197012304942', '13911111111', 't01p01@1.com', 1, '180', '70', 1988, 1, 1, '4', '计算机', '1,418', '1,418', '朝阳大道300号', '全职', '0', '7,8', ',', '4', '1,418', '离职', 1, 'good\r\n', '足球', '计算机原理、经济学、软件开发', 0, 1323182394, '2011-11-15 14:54:39'),
(65, 127, 'cn', '测2号02', '110108197012304943', '13911111112', 't01p02@1.com', 1, '180', '70', 1988, 1, 1, '4', '计算机', '1,418', '1,419', '朝阳大道300号', '全职', '0', '7,8', ',', '4', '1,418', '在职', 1, '', '', '', 0, 1321344721, '2011-11-15 15:37:26'),
(66, 127, 'en', 'test202', '110108197012304943', '13911111112', 't01p02@1.com', 1, '180', '70', 1988, 1, 1, '4', '', '1,418', '1,419', 'No.300 Chaoyang Ave.', 'full-time', '0', '7,8', ',', '4', '1,418', 'in service', 1, '', '', '', 0, 1321344793, '2011-11-15 15:42:16'),
(67, 128, 'cn', '测2号03', '110108197012304944', '13911111113', 't01p03@1.com', 1, '180', '70', 1988, 1, 1, '4', '计算机', '1,418', '1,419', '朝阳大道300号', '全职', '0', '7,8', ',', '4', '1,418', '在职', 1, '', '', '', 0, 1321344859, '2011-11-15 15:46:36'),
(68, 128, 'en', 'test203', '110108197012304944', '13911111113', 't01p03@1.com', 1, '180', '70', 1988, 1, 1, '4', '', '1,418', '1,419', 'No.300 Chaoyang Ave.', 'full-time', '0', '7,8', ',', '4', '1,418', 'in service', 1, '', '', '', 0, 1321344895, '2011-11-15 15:57:05'),
(69, 129, 'cn', '测2号04', '110108197012304945', '13911111114', 't01p04@1.com', 1, '180', '70', 1988, 1, 1, '4', '计算机', '1,418', '1,419', '朝阳大道300号', '全职', '0', '7,8', ',', '4', '1,418', '在职', 1, NULL, NULL, NULL, 0, 1321344236, '2011-11-15 16:03:56'),
(70, 129, 'en', 'test204', '110108197012304945', '13911111114', 't01p04@1.com', 1, '180', '70', 1988, 1, 1, '4', '', '1,418', '1,419', 'No.300 Chaoyang Ave.', 'full-time', '0', '7,8', ',', '4', '1,418', 'in service', 1, NULL, NULL, NULL, 0, 1321344628, '2011-11-15 16:10:28'),
(71, 130, 'cn', '测2号05', '110108197012304946', '13911111115', 't01p05@1.com', 1, '180', '70', 1988, 1, 1, '4', '计算机', '1,418', '1,419', '朝阳大道300号', '全职', '0', '7,8', ',', '4', '1,418', '在职', 1, NULL, NULL, NULL, 0, 1321345057, '2011-11-15 16:17:37'),
(72, 131, 'cn', '测2号06', '110108197012304947', '13911111116', 't01p06@1.com', 1, '180', '70', 1988, 1, 1, '4', '计算机', '1,418', '1,419', '朝阳大道300号', '全职', '0', '7,8', ',', '4', '1,418', '在职', 1, '', '', '', 0, 1321345285, '2011-11-15 16:19:59'),
(73, 132, 'cn', '测2号07', '110108197012304948', '13911111117', 't01p07@1.com', 1, '180', '70', 1988, 1, 1, '4', '计算机', '1,418', '1,418', '朝阳大道300号', '全职', '0', '7,8', ',', '4', '1,418', '离职', 1, '不错', NULL, NULL, 0, 1321346555, '2011-11-15 16:42:35'),
(74, 132, 'en', 'test207', '110108197012304948', '13911111117', 't01p07@1.com', 1, '180', '70', 1988, 1, 1, '4', '', '1,418', '1,419', 'No.300 Chaoyang Ave.', 'full-time', '0', '7,8', ',', '4', '1,418', 'in service', 1, NULL, NULL, NULL, 0, 1321348171, '2011-11-15 17:09:31'),
(75, 133, 'cn', '测2号07', '110108197012304949', '13911111118', 't01p08@1.com', 1, '180', '70', 1988, 1, 1, '4', '计算机', '1,418', '1,419', '朝阳大道300号', '全职', '0', '7,8', ',', '4', '1,418', '在职', 1, NULL, NULL, NULL, 0, 1321348348, '2011-11-15 17:12:28'),
(76, 133, 'en', 'test208', '110108197012304949', '13911111118', 't01p08@1.com', 1, '180', '70', 1988, 1, 1, '4', '', '1,418', '1,419', 'No.300 Chaoyang Ave.', 'full-time', '0', '7,8', ',', '4', '1,418', 'in service', 1, NULL, NULL, NULL, 0, 1321348486, '2011-11-15 17:14:46'),
(77, 134, 'cn', '测2号09', '130634198607283126', '13552586651', 't01p09@1.com', 1, '180', '70', 1988, 1, 1, '4', '计算机', '1,418', '1,419', '朝阳大道300号', '全职', '0', '7,8', ',', '4', '1,418', '在职', 1, NULL, NULL, NULL, 0, 1321348642, '2011-11-15 17:17:22'),
(78, 134, 'en', 'test209', '130634198607283126', '13552586651', 't01p09@1.com', 1, '180', '70', 1988, 1, 1, '4', '', '1,418', '1,419', 'No.300 Chaoyang Ave.', 'full-time', '0', '7,8', ',', '4', '1,418', 'in service', 1, NULL, NULL, NULL, 0, 1321348776, '2011-11-15 17:19:36'),
(79, 135, 'cn', '测2号10', '130634198607283125', '13552586652', 't01p10@1.com', 1, '180', '70', 1988, 1, 1, '4', '计算机', '1,418', '1,419', '朝阳大道300号', '全职', '0', '7,8', ',', '4', '1,418', '在职', 1, '', '', '', 0, 1323182816, '2011-11-15 17:22:10'),
(80, 135, 'en', 'test210', '130634198607283125', '13552586652', 't01p10@1.com', 1, '180', '70', 1988, 1, 1, '4', '', '1,418', '1,419', 'No.300 Chaoyang Ave.', 'full-time', '0', '7,8', ',', '4', '1,418', 'in service', 1, NULL, NULL, NULL, 0, 1321349094, '2011-11-15 17:24:54'),
(81, 136, 'cn', '测2号11', '130634198607283124', '13552586653', 't01p11@1.com', 1, '180', '70', 1988, 1, 1, '4', '计算机', '1,418', '1,419', '朝阳大道300号', '全职', '0', '7,8', ',', '4', '1,418', '在职', 1, NULL, NULL, NULL, 0, 1321349242, '2011-11-15 17:27:22'),
(82, 137, 'cn', '测2号12', '130634198607283123', '13552586654', 't01p12@1.com', 1, '180', '70', 1988, 1, 1, '4', '计算机', '1,418', '1,419', '朝阳大道300号', '全职', '0', '7,8', ',', '4', '1,418', '在职', 1, NULL, NULL, NULL, 0, 1321349374, '2011-11-15 17:29:34'),
(83, 126, 'en', 'test201', '110108197012304942', '13911111111', 't01p01@1.com', 1, '180', '70', 1988, 1, 1, '4', '', '1,418', '1,418', 'No.300 Chaoyang Ave.', 'full-time', '0', '7,8', ',', '4', '1,418', 'dimission', 0, 'good', NULL, NULL, 0, 1321412420, '2011-11-16 11:00:20'),
(84, 92, 'en', '1111', '310115198410180411', '13764504506', 'ugilove@sina.com', 1, '111', '111', 2011, 1, 1, '4', '', '1,418', '1,418', '11111', 'full-time', '14', '7,8', ',', '3', '1,419', 'in service', 0, '111', '', '', 0, 1322460778, '2011-11-28 14:10:44'),
(85, 138, 'cn', '123456', '344444555555555555', '13244455555', 'ugilove1@sina.com', 1, '111', '11', 2011, 1, 1, '5', '111', '1,418', '1,419', '111', '全职', '0', '7,8', ',', '3', '1,0', '在职', 0, '111', NULL, NULL, 0, 1322462189, '2011-11-28 14:36:29'),
(86, 112, 'cn', '1234', '989999999999999', '13876765456', 'utest101@1.com', 1, '123', '123', 2011, 1, 1, '5', '1234', '1,', '1,', '', '全职', '0', ',', ',', '1', '1,0', '在职', 1, '1234', '', '', 0, 1322926779, '2011-12-02 17:11:59'),
(87, 141, 'cn', '1234', '878987899998787', '13898909898', 'utestf1@1.com', 1, '123', '12', 2011, 1, 1, '0', '123', '1,418', '1,418', NULL, '全职', '0', '10,11', ',', '1', '1,0', '在职', 1, '123', NULL, NULL, 0, 1324027207, '2011-12-16 17:20:07');

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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=64 ;

--
-- Dumping data for table `zp_resume_box`
--

INSERT INTO `zp_resume_box` (`id`, `cid`, `jid`, `rid`, `posttime`, `status`) VALUES
(1, 1, 1, 1, 1300080956, 1),
(2, 1, 5, 3, 1303825717, 1),
(3, 1, 3, 3, 1303825720, 1),
(4, 1, 2, 3, 1303825722, 1),
(5, 7, 9, 3, 1303832464, 1),
(6, 7, 10, 1, 1304142325, 1),
(7, 7, 10, 5, 1304142817, 1),
(8, 7, 10, 7, 1305948245, 1),
(9, 7, 11, 9, 1305988772, 1),
(10, 11, 12, 9, 1305988775, 1),
(11, 7, 11, 10, 1305992440, 1),
(12, 7, 9, 10, 1305992496, 1),
(13, 7, 6, 11, 1305993312, 1),
(14, 1, 2, 11, 1305993330, 1),
(15, 11, 12, 12, 1306047672, 1),
(16, 11, 15, 14, 1306232681, 1),
(17, 11, 18, 16, 1307542087, 1),
(18, 11, 17, 17, 1307543010, 1),
(19, 11, 17, 18, 1307543546, 1),
(20, 11, 17, 19, 1308374655, 1),
(21, 11, 18, 21, 1308467137, 1),
(22, 11, 17, 21, 1308467185, 1),
(23, 2, 13, 21, 1308467214, 1),
(24, 11, 15, 21, 1308467311, 1),
(25, 12, 25, 16, 1309587861, 1),
(26, 12, 25, 1, 1309593526, 1),
(27, 11, 26, 16, 1309694077, 1),
(28, 23, 28, 26, 1310092235, 1),
(29, 12, 25, 27, 1310536136, 1),
(30, 27, 30, 28, 1310541194, 1),
(31, 27, 30, 29, 1310542639, 1),
(32, 27, 32, 35, 1313982385, 1),
(33, 27, 32, 32, 1314583918, 1),
(34, 41, 36, 44, 1316586985, 1),
(35, 40, 35, 43, 1316587678, 0),
(36, 40, 35, 44, 1318147138, 1),
(37, 41, 36, 43, 1318236628, 0),
(38, 41, 38, 44, 1318401186, 1),
(39, 38, 39, 47, 1318419849, 1),
(40, 41, 38, 48, 1318499425, 1),
(41, 41, 36, 48, 1318499431, 1),
(42, 41, 38, 49, 1318924823, 1),
(43, 47, 40, 50, 1318933847, 1),
(44, 53, 43, 62, 1320912305, 1),
(45, 38, 42, 63, 1321114668, 1),
(46, 54, 45, 43, 1321256278, 0),
(47, 55, 47, 43, 1321256354, 0),
(48, 53, 43, 43, 1321325974, 0),
(49, 54, 44, 64, 1321414674, 1),
(50, 54, 44, 71, 1321414764, 1),
(51, 54, 44, 77, 1321414789, 1),
(52, 54, 45, 65, 1321414830, 1),
(53, 54, 45, 72, 1321414856, 1),
(54, 54, 45, 79, 1321414879, 1),
(55, 55, 46, 67, 1321414937, 1),
(56, 55, 46, 73, 1321414958, 1),
(57, 55, 46, 81, 1321414984, 1),
(58, 55, 47, 69, 1321415008, 1),
(59, 55, 47, 75, 1321415028, 1),
(60, 55, 47, 82, 1321415046, 1),
(61, 55, 47, 86, 1322909469, 1),
(62, 54, 45, 86, 1322926808, 1),
(63, 38, 48, 87, 1324027225, 1);

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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=26 ;

--
-- Dumping data for table `zp_resume_ctf`
--

INSERT INTO `zp_resume_ctf` (`id`, `uid`, `rtype`, `awarddate`, `awardorg`, `ctfname`, `modifydate`, `createdate`) VALUES
(1, 1, 'cn', '2004-1-1', '教育部', '英语四级', 1311670733, '2011-03-31 13:07:09'),
(2, 2, 'cn', '2006-1-1', '国家商务部', '高级电子商务师', 1309096558, '2011-04-04 12:02:04'),
(3, 14, 'cn', '1982-3-29', '北大', '高级程序员证书', 0, '2011-04-30 13:53:26'),
(4, 14, 'cn', '2008-4-26', '清华', 'EMBA', 0, '2011-04-30 13:53:26'),
(5, 17, 'cn', '2011-1-1', '北大', '本科', 0, '2011-05-08 14:04:28'),
(6, 32, 'cn', '2011-1-1', '清华', '本科', 0, '2011-05-21 11:23:04'),
(7, 20, 'cn', '2007-1-1', '北大', '毕业证书', 0, '2011-05-21 22:27:52'),
(8, 33, 'cn', '2011-1-1', '哈弗', '毕业证书', 0, '2011-05-21 22:37:54'),
(9, 34, 'cn', '2008-1-1', '发大水发大水', '发生大幅', 0, '2011-05-21 23:38:52'),
(10, 35, 'cn', '2003-1-1', '哈弗', '毕业证书', 0, '2011-05-21 23:54:08'),
(11, 36, 'cn', '2002-1-1', '北大', '毕业证书', 0, '2011-05-22 14:46:51'),
(12, 36, 'cn', '2008-1-1', '哈弗', '毕业证书', 0, '2011-05-22 14:46:51'),
(13, 48, 'cn', '2011-1-1', '北大', '毕业证书', 1311732848, '2011-06-08 22:06:19'),
(14, 49, 'cn', '2006-1-1', '清华', '毕业证书', 0, '2011-06-08 22:18:13'),
(15, 50, 'cn', '2003-1-1', '人大', '硕士学位', 0, '2011-06-08 22:29:53'),
(16, 52, 'cn', '2011-1-1', '阿萨德', '说的', 0, '2011-06-17 09:55:40'),
(17, 56, 'cn', '2004-3-1', '劳动和社会保障部', '人力资源管理助师资格', 0, '2011-06-21 00:06:55'),
(18, 65, 'cn', '2011-1-1', '阿萨德阿斯', '说的阿斯', 0, '2011-07-07 18:15:21'),
(19, 24, 'cn', '2011-1-1', 'ggggg', 'ggggg', 0, '2011-07-13 13:17:37'),
(20, 68, 'cn', '2011-1-1', '社保局', '社保局', 1311736910, '2011-07-13 14:11:35'),
(21, 71, 'cn', '2011-1-1', '123123123', '123123', 1310911742, '2011-07-17 18:51:46'),
(22, 95, 'cn', '2000-1-1', '劳动局', '人力资源师', 1316589484, '2011-09-21 13:53:32'),
(23, 95, 'cn', '2011-1-1', '人事局', '会计师', 1316589484, '2011-09-21 13:53:32'),
(24, 126, 'cn', '2011-1-1', '劳动局', '人力师', 1323182394, '2011-11-15 14:54:39'),
(25, 133, 'en', '2011-1-1', 'test university08', 'test08', 0, '2011-11-15 17:14:46');

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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=72 ;

--
-- Dumping data for table `zp_resume_download`
--

INSERT INTO `zp_resume_download` (`id`, `cid`, `rid`, `posttime`, `status`, `rtype`) VALUES
(1, 11, 12, 1306210591, 1, 3),
(2, 11, 11, 1306160321, 1, 1),
(3, 11, 8, 1309590696, 1, 3),
(4, 11, 3, 1309590696, 1, 3),
(5, 11, 4, 1306160423, 1, 3),
(6, 1, 12, 1306166434, 1, 1),
(7, 11, 10, 1306210639, 1, 3),
(8, 2, 1, 1306233782, 1, 3),
(9, 2, 15, 1307267238, 1, 3),
(10, 11, 16, 1307543522, 1, 3),
(11, 11, 17, 1307543522, 1, 3),
(12, 11, 18, 1307543559, 1, 3),
(13, 2, 9, 1309528522, 1, 1),
(14, 2, 8, 1309528540, 1, 3),
(15, 12, 2, 1309592440, 1, 3),
(16, 12, 1, 1309592440, 1, 3),
(17, 12, 7, 1312871740, 1, 3),
(18, 12, 8, 1309592441, 1, 3),
(19, 12, 3, 1309592441, 1, 3),
(20, 11, 2, 1309590696, 1, 3),
(21, 12, 16, 1309592440, 1, 3),
(22, 11, 25, 1309685800, 1, 3),
(23, 1, 1, 1310028424, 1, 3),
(24, 24, 26, 1310093704, 1, 3),
(25, 27, 28, 1310542106, 1, 3),
(26, 27, 29, 1310542761, 1, 1),
(27, 1, 14, 1311672266, 1, 3),
(28, 27, 27, 1311748500, 1, 1),
(29, 12, 26, 1312871740, 1, 3),
(30, 12, 21, 1312871740, 1, 3),
(31, 12, 18, 1312871740, 1, 3),
(32, 12, 17, 1311751571, 1, 3),
(33, 12, 11, 1312871740, 1, 3),
(34, 12, 10, 1312871740, 1, 3),
(35, 12, 9, 1312871740, 1, 3),
(36, 27, 21, 1311751559, 1, 1),
(37, 12, 31, 1311755273, 1, 3),
(38, 12, 32, 1312871740, 1, 3),
(39, 27, 32, 1312872140, 1, 3),
(40, 12, 33, 1312878475, 1, 3),
(41, 27, 33, 1312878498, 1, 1),
(42, 12, 24, 1312881356, 1, 1),
(43, 31, 28, 1312885187, 1, 3),
(44, 1, 7, 1313466012, 1, 3),
(45, 1, 11, 1313502956, 1, 3),
(46, 1, 5, 1313503033, 1, 1),
(47, 1, 23, 1313505201, 1, 3),
(48, 27, 35, 1313982470, 1, 3),
(49, 38, 39, 1316194377, 0, 1),
(50, 36, 39, 1316508800, 1, 3),
(51, 36, 40, 1316500838, 0, 1),
(52, 36, 38, 1316508821, 1, 1),
(53, 36, 41, 1316501513, 1, 3),
(54, 36, 42, 1316508543, 1, 3),
(55, 40, 43, 1316593935, 1, 3),
(56, 40, 45, 1316596536, 1, 1),
(57, 41, 46, 1318401818, 1, 1),
(58, 38, 46, 1318419393, 1, 1),
(59, 38, 44, 1318419420, 1, 1),
(60, 38, 43, 1318419600, 1, 3),
(61, 38, 47, 1318419888, 1, 1),
(62, 41, 48, 1318499532, 1, 3),
(63, 41, 49, 1318924871, 1, 3),
(64, 41, 44, 1318929305, 1, 3),
(65, 47, 50, 1318933909, 1, 3),
(66, 38, 50, 1319190335, 1, 1),
(67, 53, 62, 1320912499, 1, 3),
(68, 54, 64, 1321422153, 1, 3),
(69, 54, 71, 1321422197, 1, 1),
(70, 55, 73, 1321425641, 1, 3),
(71, 38, 87, 1324027257, 1, 1);

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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=70 ;

--
-- Dumping data for table `zp_resume_edu`
--

INSERT INTO `zp_resume_edu` (`id`, `uid`, `rtype`, `fromdate`, `todate`, `schoolname`, `major`, `degree`, `modifydate`, `createdate`) VALUES
(1, 1, 'cn', '2002-9-1', '2006-7-1', '北京化工大学', '1,2', '4', 1311670733, '2011-03-31 13:07:09'),
(2, 2, 'cn', '1999-9-1', '2006-7-1', '清华', '韦尔奇', '1', 1309096558, '2011-04-04 12:02:04'),
(3, 14, 'cn', '1986-4-27', '至今', '北大', '1,2', '10', 0, '2011-04-30 13:53:26'),
(4, 14, 'cn', '1980-3-1', '至今', '清华', '1,2', '11', 0, '2011-04-30 13:53:26'),
(5, 14, 'cn', '2011-1-1', '至今', '人大', ',2', '10', 0, '2011-04-30 13:53:26'),
(6, 17, 'cn', '2003-4-1', '至今', '北大', '1,2', '10', 0, '2011-05-08 14:04:28'),
(7, 32, 'cn', '2011-1-1', '至今', '清华', '1,2', '5', 0, '2011-05-21 11:23:04'),
(8, 20, 'cn', '2002-1-1', '至今', '北大', '1,2', '5', 0, '2011-05-21 22:27:52'),
(9, 33, 'cn', '2005-1-1', '至今', '哈弗', '1,2', '11', 0, '2011-05-21 22:37:54'),
(10, 34, 'cn', '2007-1-1', '至今', '发生的发生地方', '1,2', '4', 0, '2011-05-21 23:38:52'),
(11, 35, 'cn', '2011-1-1', '至今', '哈弗', '1,2', '3', 0, '2011-05-21 23:54:08'),
(12, 36, 'cn', '1999-1-1', '至今', '北大', '1,2', '3', 0, '2011-05-22 14:46:51'),
(13, 36, 'cn', '2002-1-1', '至今', '哈弗', '1,2', '1', 0, '2011-05-22 14:46:51'),
(14, 39, 'cn', '2011-1-1', '至今', '北大', '1,2', '5', 0, '2011-05-24 18:23:30'),
(15, 43, 'cn', '2003-1-1', '2007-1-1', '清华大学', '1,2', '4', 0, '2011-06-05 11:08:11'),
(16, 48, 'cn', '2000-1-1', '至今', '北大', '计算机', '3', 1311732848, '2011-06-08 22:06:19'),
(17, 49, 'cn', '1999-1-1', '至今', '清华', '1,2', '4', 0, '2011-06-08 22:18:13'),
(18, 50, 'cn', '2000-1-1', '至今', '人大', '1,2', '3', 0, '2011-06-08 22:29:53'),
(19, 52, 'cn', '2011-1-1', '至今', '阿萨德', '1,2', '5', 0, '2011-06-17 09:55:40'),
(20, 53, 'cn', '2008-9-1', '至今', '北京大学', '1,2', '4', 0, '2011-06-18 11:21:54'),
(21, 54, 'cn', '2011-1-1', '至今', '经济学院', '1,2', '4', 1308465941, '2011-06-19 14:45:27'),
(22, 56, 'cn', '2008-9-1', '2011-7-1', '首都经济贸易大学', '1,2', '4', 0, '2011-06-21 00:06:55'),
(23, 62, 'cn', '2011-1-1', '至今', 'ssss123456ssss1', '1,2', '5', 0, '2011-06-24 16:12:21'),
(24, 2, 'cn', '2011-1-1', '至今', '似懂非懂', '随碟附送', '5', 0, '2011-06-26 21:55:58'),
(25, 63, 'cn', '2011-1-1', '至今', '北京经济学院', '贸易经济', '4', 0, '2011-07-03 16:52:57'),
(26, 65, 'cn', '2011-1-1', '至今', '按时打算', '按时打算的', '5', 0, '2011-07-07 18:15:21'),
(69, 141, 'cn', '2011-1-1', '至今', '1234', '1234', '1', 0, '2011-12-16 17:20:07'),
(28, 68, 'cn', '2011-1-1', '至今', '经济学院', '贸易经济', '4', 1311736910, '2011-07-13 14:11:35'),
(29, 69, 'cn', '2011-1-1', '至今', 'xxxxxxxx', 'xxxx', '5', 1310552218, '2011-07-13 15:35:24'),
(30, 71, 'cn', '2011-1-1', '至今', '123123123', '123', '5', 1310911742, '2011-07-17 18:51:46'),
(31, 72, 'cn', '2011-1-1', '至今', 'asdasdasd', 'asd', '5', 0, '2011-07-27 16:27:39'),
(32, 73, 'cn', '2011-1-1', '至今', '学院', '人事', '5', 0, '2011-08-09 14:15:01'),
(33, 75, 'cn', '2003-1-1', '至今', '计算机培训', '计算机', '5', 0, '2011-08-09 16:03:51'),
(34, 76, 'cn', '1996-1-1', '2000-1-1', '计算机学院', '计算机', '4', 0, '2011-08-22 10:49:32'),
(35, 77, 'cn', '2011-1-1', '至今', '社保学院', '社保', '5', 0, '2011-08-22 10:53:46'),
(36, 78, 'cn', '2011-1-1', '至今', '111111', '111', '5', 0, '2011-09-07 19:07:50'),
(37, 79, 'cn', '2011-1-1', '至今', '1111', '11111', '5', 0, '2011-09-09 13:47:14'),
(38, 89, 'cn', '2011-1-1', '至今', '清华', 'hr', '4', 0, '2011-09-15 10:29:53'),
(39, 81, 'cn', '2011-1-1', '至今', '111111111111', '1', '5', 1319180800, '2011-09-15 14:51:43'),
(40, 82, 'cn', '2011-1-1', '至今', '11111111', '11111111111', '5', 0, '2011-09-20 14:05:56'),
(41, 93, 'cn', '2011-1-1', '至今', '1', '1', '5', 0, '2011-09-20 14:43:16'),
(42, 94, 'cn', '2011-1-1', '至今', '11111', '111111', '5', 0, '2011-09-20 16:45:16'),
(43, 95, 'cn', '1989-1-1', '1992-1-1', '北京经济学院', '贸易经济', '4', 1316589484, '2011-09-21 13:53:32'),
(44, 92, 'cn', '2011-1-1', '至今', '11111', '111111', '5', 0, '2011-09-21 14:35:59'),
(45, 97, 'cn', '2011-1-1', '至今', '计算机学院', '计算机', '5', 0, '2011-09-21 16:59:51'),
(46, 98, 'cn', '1994-1-1', '至今', '联大', '管理', '5', 1317721721, '2011-10-04 17:15:02'),
(47, 99, 'cn', '2011-1-1', '至今', '111111', '1111', '5', 0, '2011-10-13 17:49:57'),
(48, 103, 'cn', '2011-1-1', '至今', '111111', '111111', '5', 0, '2011-10-18 15:33:09'),
(49, 109, 'cn', '2011-1-1', '至今', '123', '123', '5', 1319181882, '2011-10-21 15:10:09'),
(50, 110, 'cn', '2011-1-1', 'Now-1-1', '123123', '', '5', 0, '2011-10-21 15:53:40'),
(51, 81, 'en', '2011-1-1', 'Now-1-1', '123123', '', '5', 0, '2011-10-21 17:44:35'),
(52, 118, 'en', '2011-1-1', 'Now-1-1', 'tttt', '', '5', 0, '2011-10-30 09:14:42'),
(53, 119, 'en', '2011-1-1', 'Now-1-1', '111111', '', '5', 0, '2011-10-31 12:33:21'),
(54, 120, 'en', '2005-1-1', '2008-12-31', 'test university', '', '4', 0, '2011-10-31 16:10:54'),
(55, 127, 'en', '2005-1-1', '2008-12-31', 'test university02', '', '4', 1321344793, '2011-11-15 15:42:16'),
(56, 128, 'en', '2005-1-1', '2008-12-31', 'test university03', '', '4', 1321344895, '2011-11-15 15:57:05'),
(57, 129, 'en', '2006-1-1', '2008-12-31', 'test university04', '', '4', 0, '2011-11-15 16:10:28'),
(58, 132, 'en', '2005-1-1', '2008-12-31', 'test university07', '', '4', 0, '2011-11-15 17:09:31'),
(59, 133, 'en', '2005-1-1', '2008-12-31', 'test university08', '', '5', 0, '2011-11-15 17:14:46'),
(60, 134, 'en', '2005-1-1', '2008-12-31', 'test university09', '', '4', 0, '2011-11-15 17:19:36'),
(61, 135, 'en', '2005-1-1', '2008-12-31', 'test university10', '', '4', 0, '2011-11-15 17:24:54'),
(62, 126, 'en', '2005-1-1', '2008-1-1', 'test university', '', '5', 0, '2011-11-16 11:00:20'),
(63, 92, 'en', '2011-1-1', 'Now-1-1', 'dsfdsfs', '', '3', 1322460778, '2011-11-28 14:10:44'),
(64, 92, 'en', '2011-1-1', 'Now-1-1', 'test uuuu01', '', '3', 1322460778, '2011-11-28 14:11:40'),
(65, 112, 'cn', '2009-1-1', '2010-1-1', '次高学历', '次高学历专业', '4', 0, '2011-12-03 23:39:39'),
(66, 112, 'cn', '2011-1-1', '至今', '最高学历', '最高学历专业', '1', 0, '2011-12-03 23:39:39'),
(67, 126, 'cn', '2011-1-1', '至今', '测试大学', '测试专业', '1', 1323182394, '2011-12-05 17:44:12'),
(68, 135, 'cn', '2011-1-1', '至今', 'dddd', 'dddd', '1', 1323182816, '2011-12-06 22:45:40');

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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=25 ;

--
-- Dumping data for table `zp_resume_it`
--

INSERT INTO `zp_resume_it` (`id`, `uid`, `rtype`, `skillname`, `ability`, `usetime`, `modifydate`, `createdate`) VALUES
(1, 1, 'cn', 'PHP', '熟练', '60', 1311670733, '2011-03-31 13:07:09'),
(2, 2, 'cn', 'C语言', '熟练', '36', 1309096558, '2011-04-04 12:02:04'),
(3, 11, 'cn', '网页前台开发', '熟练', '50', 1303823040, '2011-04-13 17:14:02'),
(4, 14, 'cn', '编程', '熟练', '60', 0, '2011-04-30 13:53:26'),
(5, 17, 'cn', '互联网', '熟练', '6', 0, '2011-05-08 14:04:28'),
(6, 32, 'cn', '操作', '熟练', '6', 0, '2011-05-21 11:23:04'),
(7, 20, 'cn', '计算机', '熟练', '61', 0, '2011-05-21 22:27:52'),
(8, 33, 'cn', '计算机', '熟练', '64', 0, '2011-05-21 22:37:54'),
(9, 34, 'cn', '发生大幅', '熟练', '6', 0, '2011-05-21 23:38:52'),
(10, 35, 'cn', '计算机', '熟练', '67', 0, '2011-05-21 23:54:08'),
(11, 36, 'cn', '操作', '熟练', '12', 0, '2011-05-22 14:46:51'),
(12, 36, 'cn', '掌管', '熟练', '13', 0, '2011-05-22 14:46:51'),
(13, 48, 'cn', '计算机', '熟练', '12', 1311732848, '2011-06-08 22:06:19'),
(14, 49, 'cn', '操作', '熟练', '66', 0, '2011-06-08 22:18:13'),
(15, 50, 'cn', 'C++', '熟练', '62', 0, '2011-06-08 22:29:53'),
(16, 52, 'cn', '阿萨德', '熟练', '65', 0, '2011-06-17 09:55:40'),
(17, 54, 'cn', 'office', '熟练', '12', 1308465941, '2011-06-19 14:45:27'),
(18, 65, 'cn', '按时打算', '熟练', '6', 0, '2011-07-07 18:15:21'),
(19, 24, 'cn', 'aaaaaaaaaa', '熟练', '6', 0, '2011-07-13 13:17:37'),
(20, 68, 'cn', 'ecel', '熟练', '6', 1311736910, '2011-07-13 14:11:35'),
(21, 76, 'cn', 'office', '熟练', '6', 0, '2011-08-22 10:49:32'),
(22, 95, 'cn', 'office', '熟练', '12', 1316589484, '2011-09-21 13:53:32'),
(23, 118, 'en', 'tt', 'proficient', '6', 0, '2011-10-30 09:14:42'),
(24, 126, 'cn', 'excel', '熟练', '10', 1323182394, '2011-11-15 14:54:39');

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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=89 ;

--
-- Dumping data for table `zp_resume_lang`
--

INSERT INTO `zp_resume_lang` (`id`, `uid`, `rtype`, `language`, `rwability`, `lsability`, `modifydate`, `createdate`) VALUES
(1, 1, 'cn', '01', '熟练', '熟练', 1311670733, '2011-03-31 13:07:09'),
(2, 2, 'cn', '01', '熟练', '熟练', 1309096558, '2011-04-04 12:02:04'),
(3, 11, 'cn', '01', '熟练', '熟练', 1303823040, '2011-04-13 17:14:02'),
(4, 12, 'cn', '01', '熟练', '熟练', 0, '2011-04-26 11:53:41'),
(5, 14, 'cn', '01', '一般', '熟练', 0, '2011-04-30 13:53:26'),
(6, 14, 'cn', '15', '熟练', '熟练', 0, '2011-04-30 13:53:26'),
(7, 17, 'cn', '01', '熟练', '熟练', 0, '2011-05-08 14:04:28'),
(8, 32, 'cn', '01', '熟练', '熟练', 0, '2011-05-21 11:23:04'),
(9, 20, 'cn', '01', '熟练', '熟练', 0, '2011-05-21 22:27:52'),
(10, 33, 'cn', '01', '熟练', '熟练', 0, '2011-05-21 22:37:54'),
(11, 34, 'cn', '01', '熟练', '熟练', 0, '2011-05-21 23:38:52'),
(12, 35, 'cn', '01', '熟练', '熟练', 0, '2011-05-21 23:54:08'),
(13, 36, 'cn', '01', '熟练', '熟练', 0, '2011-05-22 14:46:51'),
(14, 36, 'cn', '05', '熟练', '熟练', 0, '2011-05-22 14:46:51'),
(15, 37, 'cn', '01', '熟练', '熟练', 0, '2011-05-24 15:29:25'),
(16, 39, 'cn', '01', '熟练', '熟练', 0, '2011-05-24 18:23:30'),
(17, 43, 'cn', '01', '熟练', '熟练', 0, '2011-06-05 11:08:11'),
(18, 48, 'cn', '01', '熟练', '熟练', 1311732848, '2011-06-08 22:06:19'),
(19, 49, 'cn', '01', '熟练', '熟练', 0, '2011-06-08 22:18:13'),
(20, 50, 'cn', '01', '熟练', '熟练', 0, '2011-06-08 22:29:53'),
(21, 52, 'cn', '01', '熟练', '熟练', 0, '2011-06-17 09:55:40'),
(22, 53, 'cn', '01', '熟练', '熟练', 0, '2011-06-18 11:21:54'),
(23, 54, 'cn', '01', '熟练', '熟练', 1308465941, '2011-06-19 14:45:27'),
(24, 56, 'cn', '01', '熟练', '熟练', 0, '2011-06-21 00:06:55'),
(25, 62, 'cn', '01', '熟练', '熟练', 0, '2011-06-24 16:12:21'),
(26, 63, 'cn', '01', '熟练', '熟练', 0, '2011-07-03 16:52:57'),
(27, 65, 'cn', '01', '熟练', '熟练', 0, '2011-07-07 18:15:21'),
(28, 24, 'cn', '01', '一般', '一般', 0, '2011-07-13 13:17:37'),
(29, 68, 'cn', '01', '熟练', '熟练', 1311736910, '2011-07-13 14:11:35'),
(30, 69, 'cn', '01', '熟练', '熟练', 1310552218, '2011-07-13 15:35:24'),
(31, 71, 'cn', '01', '熟练', '熟练', 1310911742, '2011-07-17 18:51:46'),
(32, 72, 'cn', '01', '熟练', '熟练', 0, '2011-07-27 16:27:39'),
(33, 73, 'cn', '01', '熟练', '熟练', 0, '2011-08-09 14:15:01'),
(34, 75, 'cn', '01', '熟练', '熟练', 0, '2011-08-09 16:03:51'),
(35, 76, 'cn', '01', '熟练', '熟练', 0, '2011-08-22 10:49:32'),
(36, 77, 'cn', '01', '熟练', '熟练', 0, '2011-08-22 10:53:46'),
(37, 78, 'cn', '01', '熟练', '熟练', 0, '2011-09-07 19:07:50'),
(38, 79, 'cn', '01', '熟练', '熟练', 0, '2011-09-09 13:47:14'),
(39, 89, 'cn', '01', '熟练', '熟练', 0, '2011-09-15 10:29:53'),
(40, 81, 'cn', '01', '熟练', '熟练', 1319190205, '2011-09-15 14:51:43'),
(41, 82, 'cn', '01', '熟练', '熟练', 0, '2011-09-20 14:05:56'),
(42, 93, 'cn', '01', '熟练', '熟练', 0, '2011-09-20 14:43:16'),
(43, 94, 'cn', '01', '熟练', '熟练', 0, '2011-09-20 16:45:16'),
(44, 95, 'cn', '01', '熟练', '熟练', 1316589484, '2011-09-21 13:53:32'),
(45, 92, 'cn', '01', '熟练', '熟练', 1322459930, '2011-09-21 14:35:59'),
(46, 97, 'cn', '01', '熟练', '熟练', 0, '2011-09-21 16:59:51'),
(47, 98, 'cn', '01', '一般', '一般', 1317721721, '2011-10-04 17:15:02'),
(48, 101, 'cn', '01', '熟练', '熟练', 0, '2011-10-12 19:43:46'),
(49, 99, 'cn', '01', '熟练', '熟练', 0, '2011-10-13 17:49:57'),
(50, 103, 'cn', '01', '熟练', '熟练', 0, '2011-10-18 15:33:09'),
(51, 107, 'cn', '01', '熟练', '熟练', 0, '2011-10-18 18:27:45'),
(52, 109, 'cn', '01', '熟练', '熟练', 1319181882, '2011-10-21 15:10:09'),
(53, 110, 'cn', '01', '熟练', '熟练', 1322458761, '2011-10-21 15:53:40'),
(54, 81, 'en', '01', 'proficient', 'proficient', 0, '2011-10-21 17:44:35'),
(55, 115, 'cn', '01', '熟练', '熟练', 0, '2011-10-27 02:05:50'),
(56, 116, 'cn', '01', '熟练', '熟练', 1319652741, '2011-10-27 02:09:41'),
(57, 117, 'cn', '01', '熟练', '熟练', 0, '2011-10-28 16:02:20'),
(58, 118, 'cn', '01', '熟练', '熟练', 0, '2011-10-30 09:08:28'),
(59, 118, 'en', '01', 'proficient', 'proficient', 0, '2011-10-30 09:14:42'),
(60, 119, 'en', '01', 'proficient', 'proficient', 0, '2011-10-31 12:33:21'),
(61, 120, 'cn', '01', '熟练', '熟练', 0, '2011-10-31 16:03:24'),
(62, 120, 'en', '01', 'proficient', 'proficient', 0, '2011-10-31 16:10:54'),
(63, 124, 'cn', '01', '熟练', '熟练', 0, '2011-11-10 15:59:19'),
(64, 125, 'cn', '01', '熟练', '熟练', 0, '2011-11-13 00:17:41'),
(65, 126, 'cn', '01', '熟练', '熟练', 1323182394, '2011-11-15 14:54:39'),
(66, 127, 'cn', '01', '熟练', '熟练', 1321344721, '2011-11-15 15:37:26'),
(67, 127, 'en', '01', 'proficient', 'proficient', 1321344793, '2011-11-15 15:42:16'),
(68, 128, 'cn', '01', '熟练', '熟练', 1321344859, '2011-11-15 15:46:36'),
(69, 128, 'en', '01', 'proficient', 'proficient', 1321344895, '2011-11-15 15:57:05'),
(70, 129, 'cn', '01', '熟练', '熟练', 0, '2011-11-15 16:03:56'),
(71, 129, 'en', '01', 'proficient', 'proficient', 0, '2011-11-15 16:10:28'),
(72, 130, 'cn', '01', '熟练', '熟练', 0, '2011-11-15 16:17:37'),
(73, 131, 'cn', '01', '熟练', '熟练', 1321345285, '2011-11-15 16:19:59'),
(74, 132, 'cn', '01', '熟练', '熟练', 0, '2011-11-15 16:42:35'),
(75, 132, 'en', '01', 'proficient', 'proficient', 0, '2011-11-15 17:09:31'),
(76, 133, 'cn', '01', '熟练', '熟练', 0, '2011-11-15 17:12:28'),
(77, 133, 'en', '01', 'proficient', 'proficient', 0, '2011-11-15 17:14:46'),
(78, 134, 'cn', '01', '熟练', '熟练', 0, '2011-11-15 17:17:22'),
(79, 134, 'en', '01', 'proficient', 'proficient', 0, '2011-11-15 17:19:36'),
(80, 135, 'cn', '01', '熟练', '熟练', 1323182816, '2011-11-15 17:22:10'),
(81, 135, 'en', '01', 'proficient', 'proficient', 0, '2011-11-15 17:24:54'),
(82, 136, 'cn', '01', '熟练', '熟练', 0, '2011-11-15 17:27:22'),
(83, 137, 'cn', '01', '熟练', '熟练', 0, '2011-11-15 17:29:34'),
(84, 126, 'en', '01', 'proficient', 'proficient', 0, '2011-11-16 11:00:20'),
(85, 92, 'en', '01', 'proficient', 'proficient', 1322460778, '2011-11-28 14:10:44'),
(86, 138, 'cn', '01', '熟练', '熟练', 0, '2011-11-28 14:36:29'),
(87, 112, 'cn', '01', '熟练', '熟练', 1322926779, '2011-12-02 17:11:59'),
(88, 141, 'cn', '01', '熟练', '熟练', 0, '2011-12-16 17:20:07');

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `zp_resume_lock`
--

INSERT INTO `zp_resume_lock` (`id`, `cid`, `uid`, `rid`, `createtime`, `starttime`, `endtime`) VALUES
(1, 1, 36, 12, '2011-06-07 01:49:13', 1307382553, 1309974553);

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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=83 ;

--
-- Dumping data for table `zp_resume_tmp`
--

INSERT INTO `zp_resume_tmp` (`id`, `cid`, `rid`, `status`, `createdate`) VALUES
(1, 1, 1, 0, '2011-05-23 18:09:33'),
(2, 1, 11, 0, '2011-08-16 21:55:56'),
(3, 1, 5, 0, '2011-05-24 17:38:33'),
(4, 11, 14, 1, '2011-05-24 20:46:11'),
(5, 11, 25, 1, '2011-07-03 17:35:06'),
(6, 27, 28, 0, '2011-07-13 15:16:18'),
(7, 0, 0, 1, '2011-08-16 22:28:58'),
(8, 0, 0, 1, '2011-08-16 22:28:58'),
(9, 0, 0, 1, '2011-08-16 22:28:58'),
(10, 0, 0, 1, '2011-08-16 22:32:02'),
(11, 0, 0, 1, '2011-08-16 22:32:02'),
(12, 0, 0, 1, '2011-08-16 22:32:02'),
(13, 1, 23, 0, '2011-08-16 22:33:21'),
(14, 0, 0, 1, '2011-08-16 22:33:10'),
(15, 0, 0, 1, '2011-08-16 22:33:10'),
(16, 0, 0, 1, '2011-08-16 22:33:10'),
(17, 0, 0, 1, '2011-08-16 22:33:33'),
(18, 0, 0, 1, '2011-08-16 22:33:33'),
(19, 0, 0, 1, '2011-08-16 22:33:33'),
(20, 27, 35, 0, '2011-08-22 11:00:11'),
(21, 0, 0, 1, '2011-08-22 11:00:15'),
(22, 0, 0, 1, '2011-08-22 11:00:15'),
(23, 0, 0, 1, '2011-08-22 11:00:15'),
(24, 0, 0, 1, '2011-08-22 11:00:15'),
(25, 0, 0, 1, '2011-08-22 11:00:15'),
(26, 0, 0, 1, '2011-08-22 11:00:15'),
(27, 0, 0, 1, '2011-08-22 11:00:15'),
(28, 0, 0, 1, '2011-08-22 11:00:15'),
(29, 0, 0, 1, '2011-08-22 11:00:15'),
(30, 0, 0, 1, '2011-08-22 11:00:15'),
(31, 0, 0, 1, '2011-08-22 11:01:10'),
(32, 0, 0, 1, '2011-08-22 11:01:10'),
(33, 0, 0, 1, '2011-08-22 11:01:10'),
(34, 0, 0, 1, '2011-08-22 11:01:10'),
(35, 0, 0, 1, '2011-08-22 11:01:10'),
(36, 0, 0, 1, '2011-08-22 11:34:18'),
(37, 0, 0, 1, '2011-08-22 11:34:18'),
(38, 0, 0, 1, '2011-08-22 11:34:18'),
(39, 0, 0, 1, '2011-08-22 11:34:18'),
(40, 0, 0, 1, '2011-08-22 11:34:18'),
(41, 0, 0, 1, '2011-08-22 12:14:27'),
(42, 0, 0, 1, '2011-08-22 12:14:27'),
(43, 0, 0, 1, '2011-08-22 12:14:27'),
(44, 0, 0, 1, '2011-08-22 12:14:27'),
(45, 0, 0, 1, '2011-08-22 12:14:27'),
(46, 12, 34, 1, '2011-08-22 12:15:38'),
(47, 0, 0, 1, '2011-08-22 12:15:40'),
(48, 0, 0, 1, '2011-08-22 12:15:40'),
(49, 0, 0, 1, '2011-08-22 12:15:40'),
(50, 0, 0, 1, '2011-08-22 12:15:40'),
(51, 0, 0, 1, '2011-08-22 12:15:40'),
(52, 0, 0, 1, '2011-08-22 12:15:40'),
(53, 0, 0, 1, '2011-08-22 12:15:40'),
(54, 0, 0, 1, '2011-08-22 12:15:40'),
(55, 0, 0, 1, '2011-08-22 12:15:40'),
(56, 0, 0, 1, '2011-08-22 12:15:40'),
(57, 0, 0, 1, '2011-08-22 12:15:40'),
(58, 0, 0, 1, '2011-08-22 12:15:40'),
(59, 0, 0, 1, '2011-08-22 12:15:40'),
(60, 0, 0, 1, '2011-08-22 12:15:40'),
(61, 0, 0, 1, '2011-08-22 12:15:40'),
(62, 0, 0, 1, '2011-08-22 12:15:40'),
(63, 0, 0, 1, '2011-08-22 12:15:40'),
(64, 40, 45, 0, '2011-09-21 17:15:21'),
(65, 0, 0, 1, '2011-09-21 17:15:23'),
(66, 0, 0, 1, '2011-09-21 17:17:46'),
(67, 0, 0, 1, '2011-09-21 17:18:18'),
(68, 54, 77, 1, '2011-11-16 13:45:11'),
(69, 0, 0, 1, '2011-11-16 13:45:14'),
(70, 0, 0, 1, '2011-11-16 13:45:14'),
(71, 0, 0, 1, '2011-11-16 13:54:07'),
(72, 0, 0, 1, '2011-11-16 13:54:07'),
(73, 55, 73, 0, '2011-11-16 14:38:43'),
(74, 0, 0, 1, '2011-12-03 23:44:18'),
(75, 0, 0, 1, '2011-12-03 23:44:18'),
(76, 0, 0, 1, '2011-12-04 02:11:57'),
(77, 0, 0, 1, '2011-12-04 02:11:57'),
(78, 0, 0, 1, '2011-12-04 02:11:57'),
(79, 0, 0, 1, '2011-12-04 02:11:57'),
(80, 0, 0, 1, '2011-12-04 02:11:57'),
(81, 0, 0, 1, '2011-12-08 02:10:27'),
(82, 0, 0, 1, '2011-12-08 02:10:27');

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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=54 ;

--
-- Dumping data for table `zp_resume_vod`
--

INSERT INTO `zp_resume_vod` (`id`, `uid`, `vodurl`, `vodimg`, `views`, `status`, `modifydate`, `createdate`) VALUES
(1, 1, 'users/2011/05/12/52ed4241e257f2f5.flv', 'images/msdatu.jpg', 0, 1, 0, '2011-07-07 17:08:28'),
(2, 11, 'users/2011/04/19/b369545d2b5e2e48.flv', 'images/msdatu.jpg', 0, 1, 0, '2011-07-07 17:08:28'),
(3, 18, 'users/2011/05/13/9bdfb72fdd5d7cfb.flv', 'images/msdatu.jpg', 0, 1, 0, '2011-07-07 17:08:28'),
(4, 21, 'users/2011/05/13/3b7cd14e91b8a727.flv', 'images/msdatu.jpg', 0, 1, 0, '2011-07-07 17:08:28'),
(5, 2, 'users/2011/05/14/83594ccefa151c01.flv', 'images/msdatu.jpg', 0, 1, 0, '2011-07-07 17:08:28'),
(6, 25, 'users/2011/05/16/f3239076a12afd97.flv', 'images/msdatu.jpg', 0, 1, 0, '2011-07-07 17:08:28'),
(7, 26, 'users/2011/05/16/844ee9d8797e7846.flv', 'images/msdatu.jpg', 0, 1, 0, '2011-07-07 17:08:28'),
(8, 28, 'users/2011/05/20/68076ced84008822.flv', 'images/msdatu.jpg', 0, 1, 0, '2011-07-07 17:08:28'),
(9, 30, 'users/2011/05/20/c9a89ebf6056f683.flv', 'images/msdatu.jpg', 0, 1, 0, '2011-07-07 17:08:28'),
(10, 31, 'users/2011/05/20/61eca6195656f087.flv', 'images/msdatu.jpg', 0, 1, 0, '2011-07-07 17:08:28'),
(11, 20, 'users/2011/05/21/367f4ecdb2a5d92b.flv', 'images/msdatu.jpg', 0, 1, 0, '2011-07-07 17:08:28'),
(12, 32, 'users/2011/05/21/22ca7c1b1cea3833.flv', 'images/msdatu.jpg', 0, 1, 0, '2011-07-07 17:08:28'),
(13, 33, 'users/2011/05/21/44dd35cf885697bf.flv', 'images/msdatu.jpg', 0, 1, 0, '2011-07-07 17:08:28'),
(14, 34, 'users/2011/05/21/fac09b2821e8ac79.flv', 'images/msdatu.jpg', 0, 1, 0, '2011-07-07 17:08:28'),
(15, 35, 'users/2011/05/21/de7d872c28326ac4.flv', 'images/msdatu.jpg', 0, 1, 0, '2011-07-07 17:08:28'),
(16, 36, 'users/2011/05/22/fd1770b4ace3411b.flv', 'images/msdatu.jpg', 0, 1, 0, '2011-07-07 17:08:28'),
(17, 39, 'users/2011/05/24/2b97400487843ea8.flv', 'images/msdatu.jpg', 0, 1, 0, '2011-07-07 17:08:28'),
(18, 43, 'users/2011/06/05/b936cbbadbc82581.flv', 'images/msdatu.jpg', 0, 1, 0, '2011-07-07 17:08:28'),
(19, 48, 'users/2011/06/08/2219734de596d8c2.flv', 'images/msdatu.jpg', 0, 1, 0, '2011-07-07 17:08:28'),
(20, 49, 'users/2011/06/08/3c14b482691f5693.flv', 'images/msdatu.jpg', 0, 1, 0, '2011-07-07 17:08:28'),
(21, 50, 'users/2011/06/08/8cd8b9c16fa5c434.flv', 'images/msdatu.jpg', 0, 1, 0, '2011-07-07 17:08:28'),
(22, 63, 'users/2011/07/03/807570bcf1d198eb.flv', 'images/msdatu.jpg', 0, 1, 0, '2011-07-07 17:08:28'),
(23, 65, 'users/2011/07/08/f3f898716ebc4186.flv', 'images/msdatu.jpg', 0, 1, 0, '2011-07-08 11:05:42'),
(24, 66, 'users/2011/07/08/e61d7d5f5eab4c13.flv', 'images/msdatu.jpg', 0, 1, 0, '2011-07-08 12:57:12'),
(25, 67, 'users/2011/07/08/0d498e3bb51c3fae.flv', 'images/msdatu.jpg', 0, 1, 0, '2011-09-20 16:52:51'),
(26, 68, 'users/2011/08/09/91a01dfb5583c5f5.flv', 'images/msdatu.jpg', 0, 1, 0, '2011-08-12 14:06:18'),
(27, 27, 'users/2011/07/18/30b796027cd84b8e.flv', 'images/msdatu.jpg', 0, 1, 0, '2011-09-20 16:52:51'),
(28, 73, 'users/2011/08/29/eba7262683401c2b.flv', 'images/msdatu.jpg', 0, 1, 0, '2011-09-20 16:52:51'),
(30, 81, 'users/2011/11/10/e66098e077716cac.flv', 'images/msdatu.jpg', 0, 0, 0, '2011-11-10 17:32:05'),
(29, 77, 'users/2011/08/22/4d8c481fa639a34f.flv', 'images/msdatu.jpg', 0, 1, 0, '2011-08-22 11:30:08'),
(34, 82, 'users/2011/09/20/6fdf4e27d355c96c.flv', 'images/msdatu.jpg', 0, 1, 0, '2011-09-20 16:52:51'),
(35, 88, 'users/2011/09/14/1a545a6d6b5087f7.flv', 'images/msdatu.jpg', 0, 1, 0, '2011-09-20 16:52:51'),
(37, 93, 'users/2011/09/20/dda34dd9ef31300c.flv', 'images/msdatu.jpg', 0, 1, 0, '2011-09-20 14:51:35'),
(36, 89, 'users/2011/09/15/c0036b5f13b5d6a6.flv', 'images/msdatu.jpg', 0, 1, 0, '2011-09-20 16:52:47'),
(38, 94, 'users/2011/09/20/c2475e1737f1faec.flv', 'images/msdatu.jpg', 0, 1, 0, '2011-09-20 16:47:23'),
(39, 95, 'users/2011/09/21/d6c248473423b62f.flv', 'images/msdatu.jpg', 0, 1, 0, '2011-09-21 16:31:02'),
(40, 98, 'users/2011/10/04/694b69d4663dcb4c.xls', 'images/msdatu.jpg', 0, 0, 0, '2011-10-04 17:18:41'),
(41, 92, 'users/2011/10/11/30d3e53a84cfd84a.flv', 'images/msdatu.jpg', 0, 1, 0, '2011-10-31 11:04:53'),
(42, 108, 'users/2011/10/20/f14a9fa96ff04fe1.flv', 'images/msdatu.jpg', 0, 0, 0, '2011-10-20 01:31:03'),
(43, 119, 'users/2011/10/31/17790b72275d9810.flv', 'images/msdatu.jpg', 0, 0, 0, '2011-10-31 14:11:00'),
(44, 120, 'users/2011/10/31/dfe8fff9edd47f71.flv', 'images/msdatu.jpg', 0, 1, 0, '2011-10-31 16:13:52'),
(45, 124, 'users/2011/11/10/24178e9200ef7b0e.flv', 'images/msdatu.jpg', 0, 1, 0, '2011-11-10 16:08:00'),
(46, 125, 'users/2011/11/13/911f4951132def74.flv', 'images/msdatu.jpg', 0, 0, 0, '2011-11-13 00:18:07'),
(47, 126, 'users/2011/12/02/d102042db64af4c2.flv', 'images/msdatu.jpg', 0, 1, 0, '2011-12-10 15:15:15'),
(48, 127, 'users/2011/11/15/96fbe2b97e38ac88.flv', 'images/msdatu.jpg', 0, 1, 0, '2011-11-16 12:06:29'),
(49, 132, 'users/2011/11/15/89fd901a4f9f0476.flv', 'images/msdatu.jpg', 0, 1, 0, '2011-11-16 12:06:59'),
(50, 133, 'users/2011/11/15/b35cdbe9e41bb4da.flv', 'images/msdatu.jpg', 0, 1, 0, '2011-11-16 12:07:10'),
(51, 112, 'users/2011/12/16/24147c48cb511162.flv', 'images/msdatu.jpg', 0, 1, 0, '2011-12-16 15:18:36'),
(52, 110, 'users/2011/12/03/9122057033175a18.en', 'images/msdatu.jpg', 0, 0, 0, '2011-12-03 16:45:12'),
(53, 139, 'users/2011/12/06/7ad0c1a73cf4b331.flv', 'images/msdatu.jpg', 0, 0, 0, '2011-12-06 14:33:47');

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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=86 ;

--
-- Dumping data for table `zp_resume_work`
--

INSERT INTO `zp_resume_work` (`id`, `uid`, `rtype`, `fromdate`, `todate`, `company`, `companytype`, `position`, `income`, `responsiblity`, `modifydate`, `createdate`) VALUES
(7, 32, 'cn', '2011-1-1', '至今', '新浪', '5', '工程师', '3', '很好', 0, '2011-05-21 11:23:04'),
(6, 17, 'cn', '2011-1-1', '至今', '既往', '2', '美工', '4', '设计', 0, '2011-05-08 14:04:28'),
(3, 1, 'cn', '2011-1-1', '至今', '新浪', '1', 'PHP工程师', '7', '写代码', 1311670733, '2011-03-31 16:28:32'),
(4, 2, 'cn', '2006-1-1', '至今', 'IBM公司', '1', '市场总监', '9', '123456778', 1309096557, '2011-04-04 12:02:04'),
(5, 14, 'cn', '2006-1-1', '至今', '结网', '3', '程序', '9', '好！', 0, '2011-04-30 13:53:26'),
(8, 20, 'cn', '2005-1-1', '至今', '搜狐', '2', '搜狐经理', '3', '人事管理', 0, '2011-05-21 22:27:52'),
(9, 33, 'cn', '2011-4-1', '至今', '百度', '1', '百度CEO', '3', '掌管百度一切事物', 0, '2011-05-21 22:37:54'),
(10, 34, 'cn', '2010-1-1', '至今', '发大水发大水', '1', '发的', '1', '发生大幅度是否', 0, '2011-05-21 23:38:52'),
(11, 35, 'cn', '2011-1-1', '至今', 'google', '1', '总管', '5', '不错', 0, '2011-05-21 23:54:08'),
(12, 36, 'cn', '2002-1-1', '至今', '百度', '2', '工程师', '5', '工程', 0, '2011-05-22 14:46:51'),
(13, 36, 'cn', '2006-1-1', '至今', '搜狐', '5', '计算机', '3', '网管', 0, '2011-05-22 14:46:51'),
(14, 43, 'cn', '2009-1-1', '至今', '新浪', '3', 'PHP工程师', '5', '发生大幅是的', 0, '2011-06-05 11:08:11'),
(15, 48, 'cn', '2005-1-1', '至今', '搜狐', '1', '研究员', '9', '研究seo', 1311732848, '2011-06-08 22:06:19'),
(16, 49, 'cn', '2005-1-1', '至今', '新浪', '1', '设计师', '1', '设计网页', 0, '2011-06-08 22:18:13'),
(17, 50, 'cn', '2007-1-1', '至今', '易登', '11', '产品员', '2', '负责产品的设计讨论和制作流程', 0, '2011-06-08 22:29:53'),
(18, 52, 'cn', '2011-1-1', '至今', '按时打算', '1', '按时打算', '1', '阿萨德', 0, '2011-06-17 09:55:40'),
(19, 54, 'cn', '1992-1-1', '2011-1-1', '华章', '6', '经理', '4', '不错', 1308465941, '2011-06-19 14:45:27'),
(20, 62, 'cn', '2011-1-1', '至今', 'ssss123456ssss1', '1', 'ssss123456ssss1', '1', 'ssss123456ssss1', 0, '2011-06-24 16:12:21'),
(21, 2, 'cn', '2011-1-1', '至今', 'asdasd', '1', 'asdasd', '1', '123132', 1309096557, '2011-06-26 19:12:12'),
(22, 63, 'cn', '2011-1-1', '至今', '北京华章', '2', '经历', '1', '核对数据风nhk电脑的空间', 0, '2011-07-03 16:52:57'),
(23, 65, 'cn', '2011-1-1', '至今', '按时打算', '1', '按时打算', '1', '按时打算的', 0, '2011-07-07 18:15:21'),
(24, 24, 'cn', '2011-1-1', '至今', 'aagg', '1', 'ggg', '1', 'ggggggggggg', 0, '2011-07-13 13:17:37'),
(25, 68, 'cn', '2011-1-1', '至今', '北京华章', '6', '社保', '2', '社保', 1311736910, '2011-07-13 14:11:35'),
(26, 69, 'cn', '2011-7-1', '至今', '无', '1', '无', '1', '社保', 1310552218, '2011-07-13 15:35:24'),
(27, 71, 'cn', '2011-1-1', '至今', '123', '1', '123', '1', '123', 1310911742, '2011-07-17 18:51:46'),
(28, 72, 'cn', '2011-1-1', '至今', 'asdasd', '1', 'asd', '1', 'asdasd', 0, '2011-07-27 16:27:39'),
(29, 73, 'cn', '2011-1-1', '至今', '华章', '1', '人事专员', '1', '社保', 0, '2011-08-09 14:15:01'),
(30, 75, 'cn', '2008-1-1', '至今', '名企', '1', '设计', '7', '设计', 0, '2011-08-09 16:03:51'),
(31, 76, 'cn', '2000-1-1', '至今', '华章', '1', '社保', '1', '社保', 0, '2011-08-22 10:49:32'),
(32, 77, 'cn', '2011-1-1', '至今', '搜狐', '1', '社保', '1', '人事', 0, '2011-08-22 10:53:46'),
(33, 78, 'cn', '2011-1-1', '至今', '1111', '1', '1111', '1', '111', 0, '2011-09-07 19:07:50'),
(34, 78, 'cn', '2011-1-1', '至今', '111111', '1', '', '1', '111', 0, '2011-09-07 19:07:50'),
(35, 79, 'cn', '2011-1-1', '至今', '11111', '1', '1111', '1', '111111', 0, '2011-09-09 13:47:14'),
(36, 89, 'cn', '2007-1-1', '至今', '华章', '1', '社保', '1', 'dvdvffbvf', 0, '2011-09-15 10:29:53'),
(37, 81, 'cn', '2011-1-1', '至今', '1111111111', '1', '1111111111111', '1', '1', 1319190205, '2011-09-15 14:51:43'),
(38, 82, 'cn', '2011-1-1', '至今', '1111111111', '1', '1111111111111', '1', '1', 0, '2011-09-20 14:05:56'),
(39, 93, 'cn', '2011-1-1', '至今', '1', '1', '1', '1', '1', 0, '2011-09-20 14:43:16'),
(40, 94, 'cn', '2011-1-1', '至今', '1111', '1', '111111', '1', '1', 0, '2011-09-20 16:45:16'),
(41, 95, 'cn', '2000-1-1', '至今', '北京华章人力资源顾问有限公司', '6', '经理', '2', '人力资源', 1316589484, '2011-09-21 13:53:32'),
(42, 92, 'cn', '2011-1-1', '至今', '1111112', '4', '11111112', '4', '11111111', 1322459930, '2011-09-21 14:35:58'),
(43, 97, 'cn', '2011-1-1', '至今', '无', '1', '无', '1', '无', 0, '2011-09-21 16:59:51'),
(44, 98, 'cn', '2010-1-1', '至今', '中联', '6', '人事主管', '5', '日常行政和公司人事协调工作', 1317721721, '2011-10-04 17:15:02'),
(45, 101, 'cn', '2011-1-1', '至今', '55', '1', '55', '1', '55', 0, '2011-10-12 19:43:46'),
(46, 99, 'cn', '2011-1-1', '至今', '111', '1', '111', '1', '11', 0, '2011-10-13 17:49:57'),
(47, 103, 'cn', '2011-1-1', '至今', '1111', '1', '1111', '1', '111111', 0, '2011-10-18 15:33:09'),
(48, 107, 'cn', '2011-1-1', '至今', 'dd', '1', 'dd', '1', 'dd', 0, '2011-10-18 18:27:45'),
(49, 109, 'cn', '2011-1-1', '至今', '123', '1', '123', '1', '123', 1319181882, '2011-10-21 15:10:09'),
(50, 110, 'cn', '2011-1-1', '至今', '123123', '1', '123123', '1', '13', 1322458761, '2011-10-21 15:53:40'),
(51, 81, 'en', '2011-1-1', 'Now-1-1', '123123', '1', '123123', '1', '123', 0, '2011-10-21 17:44:35'),
(52, 115, 'cn', '2011-1-1', '至今', 'dddd', '1', 'ddddd', '1', 'ttsss', 0, '2011-10-27 02:05:50'),
(53, 116, 'cn', '2011-1-1', '至今', 'dddd', '1', 'ddddd', '1', 'test', 1319652741, '2011-10-27 02:09:41'),
(54, 117, 'cn', '2011-1-1', '至今', '1111111', '1', '111111', '1', '111111', 0, '2011-10-28 16:02:20'),
(55, 118, 'en', '2011-1-1', 'Now-1-1', 'tttt', '1', 'tttt', '1', 'tt', 0, '2011-10-30 09:14:42'),
(56, 119, 'en', '2011-1-1', 'Now-1-1', '111111', '1', '1111', '1', '', 0, '2011-10-31 12:33:21'),
(57, 120, 'cn', '2009-1-1', '至今', '测试单位', '1', '测试职位', '4', '进行测试相关的工作', 0, '2011-10-31 16:03:24'),
(58, 120, 'en', '2009-1-1', 'Now-1-1', 'Test company', '1', 'Test Position', '4', 'QA', 0, '2011-10-31 16:10:54'),
(59, 124, 'cn', '2011-1-1', '至今', '123', '1', '123', '1', '123', 0, '2011-11-10 15:59:19'),
(60, 125, 'cn', '2011-1-1', '至今', '123', '1', '123', '1', '123', 0, '2011-11-13 00:17:41'),
(61, 126, 'cn', '1996-1-1', '2000-1-1', '测试单位', '1', '测试职位', '4', '进行测试相关工作', 1323182394, '2011-11-15 14:54:39'),
(62, 126, 'cn', '2000-1-1', '至今', '美孚', '1', '库管', '4', '测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试', 1323182394, '2011-11-15 14:54:39'),
(63, 127, 'cn', '2009-1-1', '至今', '测试单位', '1', '测试职位', '4', '进行测试相关工作', 1321344721, '2011-11-15 15:37:26'),
(64, 127, 'en', '2009-1-1', 'Now-1-1', 'Test company', '1', 'Test Position', '4', 'QA', 1321344793, '2011-11-15 15:42:16'),
(65, 128, 'cn', '2009-1-1', '至今', '测试单位', '1', '测试职位', '4', '进行测试相关工作', 1321344859, '2011-11-15 15:46:36'),
(66, 128, 'en', '2009-1-1', 'Now-1-1', 'Test company', '1', 'Test Position', '4', 'QA', 1321344895, '2011-11-15 15:57:05'),
(67, 129, 'cn', '2009-1-1', '至今', '测试单位', '1', '测试职位', '4', '进行测试相关工作', 0, '2011-11-15 16:03:56'),
(68, 129, 'en', '2009-1-1', 'Now-1-1', 'Test company', '1', 'Test Position', '4', 'QA', 0, '2011-11-15 16:10:28'),
(69, 130, 'cn', '2009-1-1', '至今', '测试单位', '1', '测试职位', '4', '进行测试相关工作', 0, '2011-11-15 16:17:37'),
(70, 131, 'cn', '2009-1-1', '至今', '测试单位', '1', '测试职位', '4', '进行测试相关工作', 1321345285, '2011-11-15 16:19:59'),
(71, 132, 'cn', '2009-1-1', '至今', '测试单位', '1', '测试职位', '4', '进行测试相关工作\r\n', 0, '2011-11-15 16:42:35'),
(72, 132, 'en', '2009-1-1', 'Now-1-1', 'Test company', '1', 'Test Position', '4', 'QA', 0, '2011-11-15 17:09:31'),
(73, 133, 'cn', '2009-1-1', '至今', '测试单位', '1', '测试职位', '4', '进行测试相关工作', 0, '2011-11-15 17:12:28'),
(74, 133, 'en', '2009-1-1', 'Now-1-1', 'Test company', '1', 'Test Position', '4', 'QA', 0, '2011-11-15 17:14:46'),
(75, 134, 'cn', '2009-1-1', '至今', '测试单位', '1', '测试职位', '4', '进行测试相关工作', 0, '2011-11-15 17:17:22'),
(76, 134, 'en', '2009-1-1', 'Now-1-1', 'Test company', '1', 'Test Position', '4', 'QA', 0, '2011-11-15 17:19:36'),
(77, 135, 'cn', '2009-1-1', '至今', '测试单位', '1', '测试职位', '4', '进行测试相关工作======', 1323182816, '2011-11-15 17:22:10'),
(78, 135, 'en', '2009-1-1', 'Now-1-1', 'Test company', '1', 'Test Position', '1', 'QA', 0, '2011-11-15 17:24:54'),
(79, 136, 'cn', '2009-1-1', '至今', '测试单位', '1', '测试职位', '4', '进行测试相关工作', 0, '2011-11-15 17:27:22'),
(80, 137, 'cn', '2009-1-1', '至今', '测试单位', '1', '测试职位', '4', '进行测试相关工作', 0, '2011-11-15 17:29:34'),
(81, 126, 'en', '2011-1-1', 'Now-1-1', 'Test company', '1', 'Test Position', '4', 'Responsible for providing friendly, fast and accurate processing on customer transaction and managing all aspects of store operations including customer service and administration.  Motivates and trains staff in store operations to ensure superior customer service. Ensures profitability through correct use of store systems/processes.  Manage overall store when fulfilling the roles of manager on duty or sales leader. Maintain and improve good relationship with government entities and neighboring communities.', 0, '2011-11-16 11:00:20'),
(82, 92, 'en', '2011-1-1', 'Now-1-1', '11111111', '1', '111111', '1', '1111', 1322460778, '2011-11-28 14:10:44'),
(83, 138, 'cn', '2011-1-1', '至今', '111', '1', '11', '1', '111', 0, '2011-11-28 14:36:29'),
(84, 112, 'cn', '2011-1-1', '至今', 'ddd', '1', 'ddd', '1', 'ddd1234', 1322926779, '2011-12-02 17:11:59'),
(85, 141, 'cn', '2011-1-1', '至今', '1234', '1', '1234', '1', '1234', 0, '2011-12-16 17:20:07');

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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=13 ;

--
-- Dumping data for table `zp_subcompany`
--

INSERT INTO `zp_subcompany` (`id`, `cid`, `name`, `createdate`) VALUES
(2, 1, '发鼎折覆餗', '0000-00-00 00:00:00'),
(3, 1, '斯蒂芬', '2011-04-05 07:37:59'),
(4, 7, '技术部', '2011-04-26 17:42:41'),
(5, 11, '技术部', '2011-05-21 13:23:51'),
(6, 15, '管理', '2011-06-19 16:14:07'),
(7, 11, '客服部', '2011-07-02 22:53:05'),
(8, 38, 'subsong2', '0000-00-00 00:00:00'),
(9, 41, '123', '2011-12-05 11:20:00'),
(10, 54, 't01c01beijing office', '2011-12-05 11:20:20'),
(11, 38, 'subsong3', '2011-12-06 23:25:06'),
(12, 38, '123', '2011-12-06 23:26:09');

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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=142 ;

--
-- Dumping data for table `zp_user`
--

INSERT INTO `zp_user` (`id`, `email`, `password`, `username`, `userphoto`, `mobile`, `usertype`, `idcard`, `allmoney`, `allpoint`, `resume_txt`, `resume_vod`, `resume_status`, `puid`, `eid`, `jobid`, `edatetime`, `etimes`, `status`, `regip`, `regdate`) VALUES
(81, '123456ssss@sohu.com', 'af75699691b3aae1169fe984f5c98f30', 'songtest', NULL, '13000000000', 'member', '111111111111111', 0.00, 0, 3, 1, 0, 0, 0, 0, 0, 0, 1, '58.246.139.98', 1315898424),
(82, '123456ssss1@sohu.com', 'af75699691b3aae1169fe984f5c98f30', 'songresume', NULL, '13000000001', 'member', '111111111111111111', 0.00, 0, 1, 1, 1, 0, 0, 0, 0, 0, 1, '58.246.139.98', 1315898998),
(83, '123456ssssabc@sohu.com', 'af75699691b3aae1169fe984f5c98f30', NULL, NULL, '13000000002', 'member', '222222222222222', 0.00, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, '58.246.139.98', 1315905178),
(84, '123456sss1@sohu.com', 'af75699691b3aae1169fe984f5c98f30', NULL, NULL, '13900000000', 'member', '222222222222222220', 0.00, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, '58.246.139.98', 1315905262),
(85, NULL, NULL, NULL, NULL, NULL, 'member', '', 0.00, 0, 0, 1, 0, 0, 0, 0, 0, 0, -1, '0.0.0.0', 0),
(86, NULL, NULL, NULL, NULL, NULL, 'member', '', 0.00, 0, 0, 1, 0, 0, 0, 0, 0, 0, -1, '0.0.0.0', 0),
(87, '12345678@163.com', 'af75699691b3aae1169fe984f5c98f30', NULL, NULL, '13800000004', 'member', '111111100000000', 0.00, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, '58.246.139.98', 1315994736),
(88, '123456@163.com', 'af75699691b3aae1169fe984f5c98f30', NULL, NULL, '13900000001', 'member', '000000000000000', 0.00, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, '58.246.139.98', 1315997740),
(89, 'david@332.com', '96e79218965eb72c92a549dd5a330112', 'david', NULL, '13333333333', 'member', '110106198205210939', 0.00, 0, 1, 1, 1, 0, 0, 0, 0, 0, 1, '119.57.31.110', 1316053657),
(90, 'swordguard@163.com', '21218cca77804d2ba1922c33e0151105', NULL, NULL, '13501659577', 'member', '321181198104156516', 0.00, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, '114.84.238.46', 1316256596),
(91, '1@1.com', 'af75699691b3aae1169fe984f5c98f30', NULL, NULL, '13000000010', 'member', '111111111111110', 0.00, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, '173.224.214.52', 1316273941),
(92, 'ugilove@sina.com', 'e72d179ef06090edd513664c7ad2309b', '杜家', NULL, '13764504506', 'member', '310115198410180411', 0.00, 0, 3, 1, 0, 0, 0, 0, 0, 0, 1, '58.246.139.98', 1316420210),
(93, 'u@1.com', 'af75699691b3aae1169fe984f5c98f30', '1111', NULL, '13800000001', 'member', '000000000000001', 0.00, 0, 1, 1, 1, 0, 0, 0, 0, 0, 1, '58.246.139.98', 1316500955),
(94, 'songtest@g.com', 'af75699691b3aae1169fe984f5c98f30', '1111111111111111', NULL, '13111111111', 'member', '999999999999999', 0.00, 0, 1, 1, 1, 0, 0, 0, 0, 0, 1, '58.246.139.98', 1316508121),
(95, 'songyu@126.com', '96e79218965eb72c92a549dd5a330112', '宋煜', NULL, '13910985865', 'member', '110108197011104934', 0.00, 0, 1, 1, 1, 0, 0, 0, 0, 0, 1, '119.57.31.110', 1316584022),
(96, 'danieldu1018@163.com', 'e10adc3949ba59abbe56e057f20f883e', NULL, NULL, '13501637646', 'member', '310111111111111111', 0.00, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, '58.246.139.98', 1316594272),
(97, 'songyu1@126.com', '96e79218965eb72c92a549dd5a330112', '宋玉', '', '13910986868', 'member', '110106198205210960', 0.00, 0, 1, 0, 0, 95, 40, 35, 1316596715, 1, 1, '119.57.31.110', 1316595429),
(98, 'konzopp@hotmail.com', '6ee992cf2ac45276ca187ddace9d6209', '申扬', NULL, '13901212873', 'member', '110105197301119449', 0.00, 0, 1, 1, 2, 0, 38, 39, 1318419405, 0, 1, '122.96.48.33', 1317718896),
(99, 'danieldu1018@gmail.com', 'e72d179ef06090edd513664c7ad2309b', '丹尼尔', '', '13501637645', 'member', '322222222222222222', 0.00, 0, 1, 0, 0, 92, 41, 36, 1318499554, 1, 1, '58.246.139.98', 1318321394),
(100, 'songtest1@1.com', 'af75699691b3aae1169fe984f5c98f30', NULL, NULL, '13877665555', 'member', '1123123123122222', 0.00, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, '58.246.139.98', 1318419675),
(101, 'songtest2@1.com', 'af75699691b3aae1169fe984f5c98f30', '5555', '', '13788888888', 'member', '989898989898989', 0.00, 0, 1, 0, 0, 100, 0, 0, 0, 0, 1, '58.246.139.98', 1318419742),
(102, 'etest20@1.com', 'af75699691b3aae1169fe984f5c98f30', NULL, NULL, '13899999999', 'member', '988888888888888', 0.00, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, '58.246.139.98', 1318505766),
(103, 'danieldu@1.com', 'e72d179ef06090edd513664c7ad2309b', '1111', NULL, '13765544445', 'member', '311111222222222222', 0.00, 0, 1, 0, 2, 92, 41, 38, 1318925036, 1, 1, '58.246.139.98', 1318923023),
(104, 'testtest11@1.com', 'e72d179ef06090edd513664c7ad2309b', NULL, NULL, '13533322222', 'member', '333333333333333333', 0.00, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, '58.246.139.98', 1318927163),
(105, 'testtest22@1.com', 'e72d179ef06090edd513664c7ad2309b', NULL, NULL, '13144422222', 'member', '333222333333333333', 0.00, 0, 0, 0, 0, 104, 0, 0, 0, 0, 1, '58.246.139.98', 1318927258),
(106, 'a10test@1.com', 'e10adc3949ba59abbe56e057f20f883e', NULL, NULL, '13700000003', 'member', '310114111111114444', 0.00, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, '58.246.139.98', 1318932804),
(107, 'a10test@2.com', 'e10adc3949ba59abbe56e057f20f883e', 'test', '', '13700000001', 'member', '310111111111111112', 0.00, 0, 1, 0, 1, 106, 0, 0, 0, 0, 1, '58.246.139.98', 1318933320),
(108, 'dongqistar@gmail.com', '96e79218965eb72c92a549dd5a330112', NULL, NULL, '13810888888', 'member', '443202010100243241', 0.00, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, '58.24.159.204', 1319045424),
(109, 'utest50@1.com', 'af75699691b3aae1169fe984f5c98f30', 'utest50', NULL, '13768676756', 'member', '989898989898909', 0.00, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, '58.246.139.98', 1319180902),
(110, 'utest100@1.com', 'af75699691b3aae1169fe984f5c98f30', 'test', NULL, '13867654543', 'member', '987678767656545', 0.00, 0, 1, 1, 0, 0, 0, 0, 0, 0, 1, '58.246.139.98', 1319183493),
(111, '123@1.111', 'e10adc3949ba59abbe56e057f20f883e', NULL, NULL, '13455554444', 'member', '344333444444444444', 0.00, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, '58.246.139.98', 1319441225),
(112, 'utest101@1.com', 'af75699691b3aae1169fe984f5c98f30', '1234', NULL, '13876765456', 'member', '989999999999999', 0.00, 0, 1, 1, 1, 0, 0, 0, 0, 0, 1, '58.246.139.98', 1319624301),
(113, 'utest102@1.com', 'af75699691b3aae1169fe984f5c98f30', NULL, NULL, '13876767656', 'member', '098989999999999', 0.00, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, '58.246.139.98', 1319624418),
(114, 'dongqistar@gmai.com', '96e79218965eb72c92a549dd5a330112', NULL, NULL, '13810888881', 'member', '138108888881381666', 0.00, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, '58.24.159.204', 1319652094),
(115, 'a@gmail.com', '96e79218965eb72c92a549dd5a330112', 'ssssss', NULL, '13810888882', 'member', '138108888881381661', 0.00, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, '58.24.159.204', 1319652189),
(116, 'a1@gmail.com', '96e79218965eb72c92a549dd5a330112', 'dddd', NULL, '13810888883', 'member', '138108888881381662', 0.00, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, '58.24.159.204', 1319652421),
(117, 'testdemo001@1.com', 'e10adc3949ba59abbe56e057f20f883e', '11111111', NULL, '13144455555', 'member', '555555555555555555', 0.00, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, '58.246.139.98', 1319788707),
(118, 'aa@gmail.com', '96e79218965eb72c92a549dd5a330112', 'dddd2', NULL, '13810888884', 'member', '443202010100243242', 0.00, 0, 3, 0, 0, 0, 0, 0, 0, 0, 1, '58.24.159.204', 1319936426),
(119, 'testdemo002@1.com', 'e10adc3949ba59abbe56e057f20f883e', NULL, NULL, '13222233333', 'member', '333333333333333334', 0.00, 0, 2, 1, 0, 0, 0, 0, 0, 0, 1, '58.246.139.98', 1320035539),
(120, 't01a05personal@1.com', 'e10adc3949ba59abbe56e057f20f883e', '测1号', NULL, '13222222222', 'member', '312222222222222222', 0.00, 0, 3, 1, 0, 0, 0, 0, 0, 0, 1, '58.246.139.98', 1320048076),
(121, 't11a5personal@1.com', 'af75699691b3aae1169fe984f5c98f30', NULL, NULL, '13912837465', 'member', '877678767888987', 0.00, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, '58.246.139.98', 1320843426),
(122, 't12a5personal@1.com', 'af75699691b3aae1169fe984f5c98f30', NULL, NULL, '13876765654', 'member', '787876656788766', 0.00, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, '58.246.139.98', 1320843629),
(123, 'wezz1981@hotmail.com', '334a823d03ce9577bc33c738a713ddad', NULL, NULL, '18616861071', 'member', '310107198603103725', 0.00, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, '10.94.4.126', 1320909653),
(124, 'yonghutest1@1.com', 'af75699691b3aae1169fe984f5c98f30', 'ytest01', NULL, '13987676545', 'member', '878876676576565', 0.00, 0, 1, 1, 1, 0, 0, 0, 0, 0, 1, '58.246.139.98', 1320911898),
(125, 'utest1001@1.com', 'af75699691b3aae1169fe984f5c98f30', '12345', NULL, '13987876545', 'member', '987876545676565', 0.00, 0, 1, 1, 1, 0, 0, 0, 0, 0, 1, '218.79.187.210', 1321114638),
(126, 't01p01@1.com', '96e79218965eb72c92a549dd5a330112', '测2号01', '', '13911111111', 'member', '110108197012304942', 0.00, 0, 3, 1, 0, 0, 54, 44, 1322927182, 0, 1, '111.161.64.190', 1321338922),
(127, 't01p02@1.com', '96e79218965eb72c92a549dd5a330112', '测2号02', NULL, '13911111112', 'member', '110108197012304943', 0.00, 0, 3, 1, 1, 0, 0, 0, 0, 0, 1, '111.161.64.190', 1321339006),
(128, 't01p03@1.com', '96e79218965eb72c92a549dd5a330112', '测2号03', NULL, '13911111113', 'member', '110108197012304944', 0.00, 0, 3, 0, 1, 0, 0, 0, 0, 0, 1, '111.161.64.190', 1321339071),
(129, 't01p04@1.com', '96e79218965eb72c92a549dd5a330112', '测2号04', NULL, '13911111114', 'member', '110108197012304945', 0.00, 0, 3, 0, 1, 0, 0, 0, 0, 0, 1, '111.161.64.190', 1321339110),
(130, 't01p05@1.com', '96e79218965eb72c92a549dd5a330112', '测2号05', NULL, '13911111115', 'member', '110108197012304946', 0.00, 0, 1, 0, 2, 0, 54, 44, 1321424720, 0, 1, '111.161.64.190', 1321339162),
(131, 't01p06@1.com', '96e79218965eb72c92a549dd5a330112', '测2号06', NULL, '13911111116', 'member', '110108197012304947', 0.00, 0, 1, 0, 1, 0, 0, 0, 0, 0, 1, '111.161.64.190', 1321339210),
(132, 't01p07@1.com', '96e79218965eb72c92a549dd5a330112', '测2号07', '', '13911111117', 'member', '110108197012304948', 0.00, 0, 3, 1, 0, 126, 0, 46, 1321431054, 0, 1, '111.161.64.190', 1321346043),
(133, 't01p08@1.com', '96e79218965eb72c92a549dd5a330112', '测2号07', NULL, '13911111118', 'member', '110108197012304949', 0.00, 0, 3, 1, 1, 127, 0, 0, 0, 0, 1, '111.161.64.190', 1321347156),
(134, 't01p09@1.com', '96e79218965eb72c92a549dd5a330112', '测2号09', NULL, '13552586651', 'member', '130634198607283126', 0.00, 0, 3, 0, 1, 128, 0, 0, 0, 0, 1, '111.161.64.190', 1321347464),
(135, 't01p10@1.com', '96e79218965eb72c92a549dd5a330112', '测2号10', NULL, '13552586652', 'member', '130634198607283125', 0.00, 0, 3, 0, 1, 129, 0, 0, 0, 0, 1, '111.161.64.190', 1321347657),
(136, 't01p11@1.com', '96e79218965eb72c92a549dd5a330112', '测2号11', NULL, '13552586653', 'member', '130634198607283124', 0.00, 0, 1, 0, 1, 130, 0, 0, 0, 0, 1, '111.161.64.190', 1321347749),
(137, 't01p12@1.com', '96e79218965eb72c92a549dd5a330112', '测2号12', NULL, '13552586654', 'member', '130634198607283123', 0.00, 0, 1, 0, 1, 131, 0, 0, 0, 0, 1, '111.161.64.190', 1321347827),
(138, 'ugilove1@sina.com', 'e72d179ef06090edd513664c7ad2309b', '123456', NULL, '13244455555', 'member', '344444555555555555', 0.00, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, '58.246.139.98', 1322462121),
(139, 'utest3000@1.com', 'af75699691b3aae1169fe984f5c98f30', NULL, NULL, '13987878767', 'member', '798767656567654', 0.00, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, '58.246.139.98', 1323153172),
(140, 'utest3001@1.com', 'af75699691b3aae1169fe984f5c98f30', NULL, NULL, '13987876765', 'member', '787676545454565', 0.00, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, '218.79.219.159', 1323181907),
(141, 'utestf1@1.com', 'af75699691b3aae1169fe984f5c98f30', '1234', NULL, '13898909898', 'member', '878987899998787', 0.00, 0, 1, 0, 2, 112, 38, 42, 1324027269, 0, 1, '58.246.139.98', 1324027171);

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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=33 ;

--
-- Dumping data for table `zp_user_account`
--

INSERT INTO `zp_user_account` (`id`, `uid`, `xid`, `eid`, `money`, `doact`, `aclog`, `status`, `createdate`) VALUES
(1, 48, 50, 11, 100, 1, '搜狐 录用了 您的下线：tui2@126.com', 0, '2011-07-01 15:55:16'),
(2, 48, 49, 11, 100, 1, '搜狐 录用了 您的下线：tui1@126.com', 0, '2011-07-01 16:47:37'),
(3, 48, 50, 11, 100, -1, '搜狐 录用您的下线：tui2@126.com被驳回', 0, '2011-07-01 15:55:16'),
(4, 48, 50, 11, 100, 1, '搜狐 录用了 您的下线：tui2@126.com', 0, '2011-07-02 15:13:17'),
(5, 48, 49, 11, 100, -1, '搜狐 录用您的下线：tui1@126.com被驳回', 0, '2011-07-01 16:47:37'),
(6, 48, 50, 11, 100, -1, '搜狐 录用您的下线：tui2@126.com被驳回', 0, '2011-07-02 15:13:17'),
(7, 48, 50, 11, 100, 1, '搜狐 录用了 您的下线：tui2@126.com', 0, '2011-07-08 11:16:55'),
(8, 48, 49, 11, 100, 1, '搜狐 录用了 您的下线：tui1@126.com', 0, '2011-07-08 11:16:59'),
(9, 48, 0, 0, 200, -1, '申请领款“&yen;20元”', 0, '2011-07-02 22:18:41'),
(10, 48, 0, 0, 200, 1, '驳回申领款项“&yen;200.00元”', 0, '2011-07-02 22:18:41'),
(11, 48, 50, 11, 100, -1, '搜狐 录用您的下线：tui2@126.com被驳回', 0, '2011-07-08 11:16:55'),
(12, 48, 49, 11, 100, -1, '搜狐 录用您的下线：tui1@126.com被驳回', 0, '2011-07-08 11:16:59'),
(13, 68, 69, 27, 100, 1, '华章3 录用了 您的下线：yanyan@126.com', 1, '2011-07-13 15:40:13'),
(14, 48, 50, 12, 100, 1, '新浪 录用了 您的下线：tui2@126.com', 0, '2011-07-27 16:24:15'),
(15, 48, 49, 12, 100, 1, '新浪 录用了 您的朋友：tui1@126.com', 1, '2011-07-27 15:26:19'),
(16, 48, 50, 12, 100, -1, '新浪 录用您的朋友：tui2@126.com被驳回', 0, '2011-07-27 16:24:15'),
(17, 48, 72, 12, 100, 1, '新浪 录用了 您的朋友：tui3@126.com；职位为：研究员', 1, '2011-07-27 16:28:00'),
(18, 76, 77, 27, 100, 1, '华章3 录用了 您的朋友：jimi@126.com；职位为：人事专员', 1, '2011-08-22 11:08:52'),
(19, 95, 97, 40, 100, 1, '视一视招聘网 录用了 您的朋友：songyu1@126.com；职位为：人事专员', 0, '2011-09-21 17:24:28'),
(20, 95, 97, 40, 100, -1, '视一视招聘网 录用您的朋友：songyu1@126.com被驳回', 0, '2011-09-21 17:24:28'),
(21, 100, 101, 38, 100, 1, 'songcompany 录用了 您的朋友：songtest2@1.com；职位为：123', 0, '2011-10-12 19:46:33'),
(22, 100, 101, 38, 100, -1, 'songcompany 录用您的朋友：songtest2@1.com被驳回', 0, '2011-10-12 19:46:33'),
(23, 92, 99, 41, 100, 1, '丹你 录用了 您的朋友：danieldu1018@gmail.com；职位为：it', 1, '2011-10-13 17:52:34'),
(24, 92, 0, 0, 100, -1, '申请领款“&yen;10元”', 2, '2011-10-13 17:56:12'),
(25, 92, 0, 0, 0, -1, '申请领款“&yen;0元”', 1, '2011-10-13 17:57:27'),
(26, 92, 103, 41, 100, 1, '丹你 录用了 您的朋友：danieldu@1.com；职位为：测试职位123', 1, '2011-10-18 16:03:56'),
(27, 106, 107, 47, 100, 1, '测试公司10 录用了 您的朋友：a10test@2.com；职位为：A10测试职位', 0, '2011-10-18 18:37:38'),
(28, 106, 107, 47, 100, -1, '测试公司10 录用您的朋友：a10test@2.com被驳回', 0, '2011-10-18 18:37:38'),
(29, 126, 132, 55, 100, 1, 'to1c02 录用了 您的朋友：t01p07@1.com；职位为：t0103', 0, '2011-11-16 15:05:53'),
(30, 126, 132, 55, 100, -1, 'to1c02 录用您的朋友：t01p07@1.com被驳回', 0, '2011-11-16 15:05:53'),
(31, 126, 132, 0, 100, 1, ' 录用了 您的朋友：t01p07@1.com；职位为：t0103', 1, '2011-11-16 16:10:54'),
(32, 112, 141, 38, 100, 1, 'songcompany 录用了 您的朋友：utestf1@1.com；职位为：abc', 1, '2011-12-16 17:21:09');

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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `zp_user_bank`
--

INSERT INTO `zp_user_bank` (`id`, `uid`, `type`, `bank_name`, `bank_kaihu`, `card_user`, `card_number`, `createdate`) VALUES
(1, 1, 'bank', '中国工商银行', '北京中关村分行', '李明', '9558820200007950987', '2011-06-05 17:43:48'),
(2, 2, 'bank', '招商银行', '北京海淀支行', '国良', '12345678912345678', '2011-06-27 22:36:46'),
(3, 48, 'bank', '工商银行', '上地', '贾道允', '95588202000119511', '2011-07-02 19:15:26'),
(4, 92, 'bank', '111', '111', '发生的佛', '1111111111111111', '2011-10-09 15:18:29');

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
