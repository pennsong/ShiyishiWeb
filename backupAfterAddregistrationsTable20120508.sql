-- phpMyAdmin SQL Dump
-- version 3.1.2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: May 08, 2012 at 02:12 PM
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
-- Table structure for table `registrations`
--

DROP TABLE IF EXISTS `registrations`;
CREATE TABLE IF NOT EXISTS `registrations` (
  `userId` int(11) NOT NULL,
  `userName` varchar(15) NOT NULL,
  `userRole` varchar(15) NOT NULL,
  `identity` text NOT NULL,
  `updatetime` datetime NOT NULL,
  PRIMARY KEY (`userId`),
  KEY `registrations_updatetime` (`updatetime`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `registrations`
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
(1, 'A001', 'admin', 'admin@shiyishi.cn', 'e9205cefc6d71c930b20a5af7463e697', 'Admin', 1, NULL, 'a:5:{i:0;s:1:"1";i:1;s:1:"2";i:2;s:1:"3";i:3;s:1:"4";i:4;s:1:"6";}', '总管理员', 1, NULL, 1336396855, 0, '2010-03-20 11:28:57');

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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=82 ;

--
-- Dumping data for table `zp_admin_log`
--

INSERT INTO `zp_admin_log` (`id`, `adminid`, `adminname`, `action`, `model`, `dothing`, `logurl`, `onlineip`, `createtime`) VALUES
(1, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '58.246.139.98', '2012-03-11 18:45:55'),
(2, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '114.245.184.156', '2012-03-12 12:02:36'),
(3, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '58.246.139.98', '2012-03-12 13:13:22'),
(4, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '111.161.64.190', '2012-03-12 16:25:33'),
(5, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '111.161.64.190', '2012-03-12 16:25:33'),
(6, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '111.161.64.190', '2012-03-13 11:24:16'),
(7, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '101.80.126.167', '2012-03-13 12:21:20'),
(8, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '111.161.64.190', '2012-03-14 13:17:07'),
(9, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '111.161.64.190', '2012-03-15 13:53:25'),
(10, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '111.161.64.190', '2012-03-15 13:53:27'),
(11, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '111.161.64.190', '2012-03-15 14:41:52'),
(12, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '111.161.64.190', '2012-03-15 18:18:05'),
(13, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '111.161.64.190', '2012-03-19 12:44:04'),
(14, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '111.161.64.190', '2012-03-21 11:41:20'),
(15, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '218.79.216.209', '2012-03-21 12:30:55'),
(16, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '111.161.64.190', '2012-03-21 14:54:33'),
(17, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '218.79.216.209', '2012-03-21 15:51:16'),
(18, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '111.161.64.190', '2012-03-21 15:54:12'),
(19, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '111.161.64.190', '2012-03-23 11:30:04'),
(20, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '123.114.169.159', '2012-03-23 16:29:36'),
(21, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '58.246.139.98', '2012-03-25 14:07:58'),
(22, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '111.161.64.187', '2012-03-26 15:04:17'),
(23, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '111.161.64.187', '2012-03-27 10:33:30'),
(24, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '111.161.64.187', '2012-03-27 11:01:17'),
(25, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '101.80.106.6', '2012-03-27 11:07:52'),
(26, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '111.161.64.187', '2012-03-27 15:38:46'),
(27, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '101.80.106.6', '2012-03-27 23:14:59'),
(28, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '111.161.64.187', '2012-03-30 12:34:26'),
(29, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '116.236.241.90', '2012-03-30 15:02:42'),
(30, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '116.236.241.90', '2012-03-30 15:14:52'),
(31, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '111.161.64.187', '2012-03-30 15:47:35'),
(32, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '116.236.241.90', '2012-03-30 16:15:24'),
(33, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '111.161.64.187', '2012-04-01 19:10:47'),
(34, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '111.161.64.187', '2012-04-05 11:35:23'),
(35, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '111.161.64.187', '2012-04-05 15:57:44'),
(36, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '111.161.64.187', '2012-04-06 14:11:15'),
(37, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '111.161.64.187', '2012-04-09 11:05:41'),
(38, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '111.161.64.187', '2012-04-09 11:46:49'),
(39, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '111.161.64.187', '2012-04-09 13:26:58'),
(40, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '111.161.64.187', '2012-04-09 13:51:38'),
(41, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '58.246.139.98', '2012-04-09 14:03:18'),
(42, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '58.246.139.98', '2012-04-09 14:53:22'),
(43, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '111.161.64.187', '2012-04-09 14:55:53'),
(44, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '111.161.64.187', '2012-04-09 14:59:33'),
(45, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '111.161.64.187', '2012-04-09 16:50:51'),
(46, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '111.161.64.187', '2012-04-10 13:50:14'),
(47, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/login/login.do', '111.161.64.187', '2012-04-10 13:54:39'),
(48, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '58.246.139.98', '2012-04-10 16:47:47'),
(49, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '111.161.64.187', '2012-04-11 16:57:11'),
(50, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '111.161.64.187', '2012-04-12 13:43:23'),
(51, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '111.161.64.187', '2012-04-12 15:50:17'),
(52, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '125.39.117.49', '2012-04-12 21:36:37'),
(53, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '111.161.64.187', '2012-04-13 11:49:16'),
(54, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '111.161.64.187', '2012-04-13 16:54:39'),
(55, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '125.39.117.60', '2012-04-14 21:17:29'),
(56, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '125.39.117.60', '2012-04-14 21:33:14'),
(57, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '111.161.64.187', '2012-04-16 14:32:42'),
(58, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '111.161.64.187', '2012-04-17 09:57:22'),
(59, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '58.246.139.98', '2012-04-17 09:59:01'),
(60, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '111.161.64.187', '2012-04-17 14:37:38'),
(61, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '218.79.220.174', '2012-04-17 21:53:05'),
(62, 1, 'admin【管理员】', 'logout', 'index', 'admin【管理员】在 #TIME# 退出系统', 'http://admin.shiyishi.cn/logout.do', '218.79.220.174', '2012-04-17 22:00:46'),
(63, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/login/login.do', '218.79.220.174', '2012-04-17 22:00:51'),
(64, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '121.18.236.235', '2012-04-18 00:28:10'),
(65, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '111.161.64.187', '2012-04-20 16:06:09'),
(66, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '111.161.36.109', '2012-04-21 13:59:57'),
(67, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '58.246.139.98', '2012-04-23 18:17:43'),
(68, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '58.246.139.98', '2012-04-23 18:28:15'),
(69, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '58.246.139.98', '2012-04-23 18:30:27'),
(70, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '58.246.139.98', '2012-04-23 18:32:33'),
(71, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '58.246.139.98', '2012-04-23 18:34:33'),
(72, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '58.246.139.98', '2012-04-23 18:34:35'),
(73, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '58.246.139.98', '2012-04-23 18:34:36'),
(74, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '58.246.139.98', '2012-04-23 18:34:46'),
(75, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '58.246.139.98', '2012-04-23 18:35:09'),
(76, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '58.246.139.98', '2012-04-23 18:43:17'),
(77, 1, 'admin【管理员】', 'logout', 'index', 'admin【管理员】在 #TIME# 退出系统', 'http://admin.shiyishi.cn/logout.do', '58.246.139.98', '2012-04-23 18:46:55'),
(78, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '111.161.64.187', '2012-04-25 14:09:38'),
(79, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '101.80.120.247', '2012-04-29 00:05:11'),
(80, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '111.161.64.186', '2012-05-02 11:07:54'),
(81, 1, 'admin【管理员】', 'login', 'index', 'admin【管理员】在 #TIME# 登陆系统', 'http://admin.shiyishi.cn/index/login.do', '125.39.108.99', '2012-05-07 21:20:55');

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
(1, 'a:3:{s:8:"formhash";s:8:"5ac69aba";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(2, 'a:3:{s:8:"formhash";s:8:"7e587ef4";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(3, 'a:3:{s:8:"formhash";s:8:"b5a2ce6d";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(4, 'a:3:{s:8:"formhash";s:8:"7bfff21a";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(5, 'a:3:{s:8:"formhash";s:8:"7bfff21a";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(6, 'a:3:{s:8:"formhash";s:8:"cf693cbe";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(7, 'a:3:{s:8:"formhash";s:8:"56128565";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(8, 'a:3:{s:8:"formhash";s:8:"7ffceefd";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(9, 'a:3:{s:8:"formhash";s:8:"55fb83c3";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(10, 'a:3:{s:8:"formhash";s:8:"55fb83c3";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(11, 'a:3:{s:8:"formhash";s:8:"f55dda21";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(12, 'a:3:{s:8:"formhash";s:8:"4ceeff18";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(13, 'a:3:{s:8:"formhash";s:8:"ee2f05b3";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(14, 'a:3:{s:8:"formhash";s:8:"4fcffcf0";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(15, 'a:3:{s:8:"formhash";s:8:"a28e4bb1";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(16, 'a:3:{s:8:"formhash";s:8:"4b652a9b";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(17, 'a:3:{s:8:"formhash";s:8:"4754ad9a";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(18, 'a:3:{s:8:"formhash";s:8:"8321ce3d";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(19, 'a:3:{s:8:"formhash";s:8:"3a0eb3ff";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(20, 'a:3:{s:8:"formhash";s:8:"241affb7";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(21, 'a:3:{s:8:"formhash";s:8:"199209de";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(22, 'a:3:{s:8:"formhash";s:8:"d7463c03";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(23, 'a:3:{s:8:"formhash";s:8:"42107055";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(24, 'a:3:{s:8:"formhash";s:8:"05a18e06";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(25, 'a:3:{s:8:"formhash";s:8:"9aad3e94";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(26, 'a:3:{s:8:"formhash";s:8:"1d9cc3bd";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(27, 'a:3:{s:8:"formhash";s:8:"cf172d8d";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(28, 'a:3:{s:8:"formhash";s:8:"a29f37e3";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(29, 'a:3:{s:8:"formhash";s:8:"5216e56c";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(30, 'a:3:{s:8:"formhash";s:8:"a6703e47";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(31, 'a:3:{s:8:"formhash";s:8:"4925822c";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(32, 'a:3:{s:8:"formhash";s:8:"297af897";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(33, 'a:3:{s:8:"formhash";s:8:"cad12414";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(34, 'a:3:{s:8:"formhash";s:8:"c48d8c52";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(35, 'a:3:{s:8:"formhash";s:8:"8ffdf416";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(36, 'a:3:{s:8:"formhash";s:8:"f6983cb7";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(37, 'a:3:{s:8:"formhash";s:8:"eaf16d36";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(38, 'a:3:{s:8:"formhash";s:8:"79bd2bf6";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(39, 'a:3:{s:8:"formhash";s:8:"f5a6ddf9";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(40, 'a:3:{s:8:"formhash";s:8:"f8468194";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(41, 'a:3:{s:8:"formhash";s:8:"dc788d56";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(42, 'a:3:{s:8:"formhash";s:8:"638e78ef";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(43, 'a:3:{s:8:"formhash";s:8:"d5af70fa";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(44, 'a:3:{s:8:"formhash";s:8:"0e4c5dbf";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(45, 'a:3:{s:8:"formhash";s:8:"4c07743c";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(46, 'a:3:{s:8:"formhash";s:8:"b2145b45";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(47, 'a:3:{s:8:"formhash";s:8:"6e9a31e8";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(48, 'a:3:{s:8:"formhash";s:8:"94a580b4";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(49, 'a:3:{s:8:"formhash";s:8:"73ab5684";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(50, 'a:3:{s:8:"formhash";s:8:"c6c3466a";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(51, 'a:3:{s:8:"formhash";s:8:"c66f0607";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(52, 'a:3:{s:8:"formhash";s:8:"f61059ea";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(53, 'a:3:{s:8:"formhash";s:8:"b8e55b77";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(54, 'a:3:{s:8:"formhash";s:8:"cc3f324b";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(55, 'a:3:{s:8:"formhash";s:8:"26df5843";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(56, 'a:3:{s:8:"formhash";s:8:"d7a9e493";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(57, 'a:3:{s:8:"formhash";s:8:"86460e6e";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(58, 'a:3:{s:8:"formhash";s:8:"2d483f42";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(59, 'a:3:{s:8:"formhash";s:8:"a66d6d8b";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(60, 'a:3:{s:8:"formhash";s:8:"dc65b2dd";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(61, 'a:3:{s:8:"formhash";s:8:"962fd21c";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(62, 'a:0:{}'),
(63, 'a:3:{s:8:"formhash";s:8:"a38a33c4";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(64, 'a:3:{s:8:"formhash";s:8:"be5dbe51";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(65, 'a:3:{s:8:"formhash";s:8:"17a48910";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(66, 'a:3:{s:8:"formhash";s:8:"fcea2ee9";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(67, 'a:3:{s:8:"formhash";s:8:"a03cf41a";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(68, 'a:3:{s:8:"formhash";s:8:"5b45647b";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(69, 'a:3:{s:8:"formhash";s:8:"8f6e2ed6";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(70, 'a:3:{s:8:"formhash";s:8:"d838bb3b";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(71, 'a:3:{s:8:"formhash";s:8:"c935bf0f";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(72, 'a:3:{s:8:"formhash";s:8:"88cb0d5e";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(73, 'a:3:{s:8:"formhash";s:8:"36169fcd";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(74, 'a:3:{s:8:"formhash";s:8:"3d859c5d";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(75, 'a:3:{s:8:"formhash";s:8:"ce5055a8";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(76, 'a:3:{s:8:"formhash";s:8:"25a82964";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(77, 'a:0:{}'),
(78, 'a:3:{s:8:"formhash";s:8:"2a6e2a6d";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(79, 'a:3:{s:8:"formhash";s:8:"c8acbee9";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(80, 'a:3:{s:8:"formhash";s:8:"49e48309";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}'),
(81, 'a:3:{s:8:"formhash";s:8:"0288319a";s:10:"admin_name";s:5:"admin";s:9:"admin_pwd";s:6:"******";}');

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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=115 ;

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
(100, '企业用户', '/admin/e_user/list.do', 36, 2, 0),
(101, '合同管理', '/admin/contract/list.do', 17, 50, 0),
(102, '职位', '', 0, 3, 0),
(103, '职位管理', '', 102, 50, 0),
(106, '视频面试管理', '/admin/interview/list.do', 36, 3, 0),
(105, '职位管理', '/admin/jobs/list.do', 103, 50, 0),
(107, '视频简历审核', '/admin/videoresume.do', 65, 3, 0),
(109, '奖励申请管理', '/admin/user_apply/list.do?statusFilter=1', 36, 4, 0),
(111, '推荐企业', '/admin/relinks.do', 4, 50, 0),
(112, '奖励驳回列表', '/admin/user_apply/list.do?statusFilter=0', 36, 7, 0),
(113, '奖励发放列表', '/admin/user_apply/list.do?statusFilter=2', 36, 5, 0),
(114, '奖励已发放汇总列表', '/admin/user_apply/list.do?statusFilter=3&summary=1', 36, 6, 0);

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `zp_admit`
--


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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `zp_app_person_interview`
--

INSERT INTO `zp_app_person_interview` (`id`, `uid`, `aid`, `starttime`, `endtime`, `status`) VALUES
(1, 22, 1, 1335628800, 1335632400, 1);

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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `zp_app_video_interview`
--

INSERT INTO `zp_app_video_interview` (`id`, `cid`, `room`, `starttime`, `endtime`, `status`, `createtime`, `passtime`, `nopasstime`, `intstart`, `intend`) VALUES
(1, 4, 'room10', 1335628800, 1335632400, 1, '2012-04-29 00:04:55', '2012-04-29 00:05:21', '0000-00-00 00:00:00', 1335629126, 1335629399);

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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `zp_app_video_interview_mans`
--

INSERT INTO `zp_app_video_interview_mans` (`id`, `roomid`, `uid`, `gender`, `status`, `intdate`, `logintime`, `lastactivetime`, `intstart`, `intend`) VALUES
(1, 1, 22, 0, -1, 20120429, 1335629300, 1335629680, 1335629312, 1335629413);

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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=440 ;

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
(2, '天津', 'Tianjin', -2, 5, 1),
(427, '崇文', 'chongwen', 1, 50, -1),
(428, '宣武', 'xuanwu', 1, 50, -1),
(429, '石景山', 'shijingshan', 1, 50, -1),
(430, '通州', 'tongzhou', 1, 50, -1),
(431, '顺义', 'shunyi', 1, 50, -1),
(432, '怀柔', 'huairou', 1, 50, -1),
(433, '密云', 'miyun', 1, 50, -1),
(434, '昌平', 'changping', 1, 50, -1),
(435, '延庆', 'yanqing', 1, 50, -1),
(436, '平谷', 'pinggu', 1, 50, -1),
(437, '大兴', 'daxing', 1, 50, -1),
(438, '房山', 'fangshan', 1, 50, -1),
(439, '门头沟', 'mentougou', 1, 50, -1);

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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `zp_contract`
--

INSERT INTO `zp_contract` (`id`, `uid`, `code`, `wordall`, `word`, `videoall`, `video`, `postall`, `post`, `startdate`, `enddate`, `createdate`) VALUES
(1, 2, 'shiyishi001', 1000, 1000, 0, 0, 100, 100, 1331740800, 1339603200, '2012-03-15 14:50:46'),
(2, 6, 'shiyishi002', 2000, 1750, 0, 0, 100, 100, 1332777600, 1340726400, '2012-03-27 15:39:54'),
(3, 4, 'ct1', 1000, 980, 0, 0, 100, 100, 1325347200, 1356969600, '2012-04-09 14:54:18');

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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `zp_enrolllog`
--


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
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10 ;

--
-- Dumping data for table `zp_e_user`
--

INSERT INTO `zp_e_user` (`id`, `username`, `password`, `company`, `company_s`, `dustrytype`, `company_type`, `company_scale`, `company_properties`, `live_gnd_p`, `live_gnd_c`, `live_address`, `postcode`, `address`, `contact`, `tel`, `mobile`, `dtype`, `durl`, `email`, `logo`, `info`, `status`, `createtime`, `lasttime`, `ip`) VALUES
(1, '', '', 'hh', '', '', 0, 0, 0, 0, 0, '', '', '', 'hh', '43454543', '13987879876', 0, '', 'ssss123456ssssh@163.com', '', '', 0, 1331529289, 0, '58.246.139.98'),
(2, '柯尼卡美能达', 'f379eaf3c831b04de153469d1bec345e', '柯尼卡美能达办公系统（中国）有限公司北京分公司', '柯尼卡美能达', '3', 2, 3, 1, 1, 419, '', '100027', '北京市朝阳区新源南路1-3号平安国际金融中心写字楼A座23层', '石红', '010-64681220-010', '13901024378', 0, '', 'hong.shi@bcn.konicaminolta.cn', 'http://img.shiyishi.cn/users/2012/03/15/85d33aa0b6228426.bmp', '<p>柯尼卡与美能达于2003年8月5日实现了经营合并，由此诞生了柯尼卡美能达集团。新的企业集团，成为1兆日元的企业（八百二十亿人民币）。 <br />柯尼卡美能达办公系统（中国）有限公司是其下隶属公司之一，是日本柯尼卡美能达商用科技株式会社100%出资的，于2006年4月成立的独资公司。公司旨在将应用最尖端的光学、图像技术生产的专业级打印生产系统、数码复合机、打印机等提供给小批量印刷、办公室、SOHO等市场客户，主要业务为办公机器以及相关配件的销售、维护及技术咨询服务。总部位于上海，现有北京、广州、沈阳、西安、成都、武汉、苏州、天津8家分公司。 <br /></p>\r\n<p>北京分公司主要业务内容是：数码及模拟复印机，打印机的销售及售后服务。 </p>', 2, 1331790788, 1331790896, '111.161.64.190'),
(9, '', '', '', '', '', 0, 0, 0, 0, 0, NULL, '', '', '', '', '', 0, '', '', NULL, NULL, 1, 1336383496, 0, '123.126.50.78'),
(4, 'ct', 'f379eaf3c831b04de153469d1bec345e', 'ct', 'ct', '2', 1, 2, 1, 3, 420, '', '200001', '外滩', 'penn', '13980987876', '13909898787', 0, '', 'ssss123456ssss@163.com', '', 'ct公司', 2, 1332655811, 1332655841, '58.246.139.98'),
(8, '', '', '', '', '', 0, 0, 0, 0, 0, NULL, '', '', '', '', '', 0, '', '', NULL, NULL, 1, 1335798084, 0, '123.126.50.78'),
(6, 'ADP', 'f379eaf3c831b04de153469d1bec345e', '安德普翰人力资源服务（上海）有限公司', 'ADP', '38', 1, 3, 1, 1, 419, '', '100022', '建国门外大街甲12号新华保险大厦1401', '姚瑶', '010-51316184', '13810857566', 0, '', 'yaoyao@chinawinhr.com.cn', 'http://img.shiyishi.cn/users/2012/03/27/517195488022268c.bmp', '<p>ADP雇主服务为各个行业不同规模的机构提供薪酬管理及人力资源服务。ADP是此领域的全球最大服务提供商，为全球33个国家的585,000多名客户提供世界一流服务。在过去的60年中，我们的解决方案已帮助客户高效地管理内部业务，令其专注于核心业务的发展，全力协助达成业务目标，同时降低业务风险。<br />ADP凭借其强大的实力，在雇主服务领域独树一帜。作为一家年营业额近90亿美金的跨国公司，凭借在雇主服务领域60年的领先历史，ADP无疑是你的最佳合作伙伴。</p>', 2, 1332817237, 1332817306, '111.161.64.187'),
(7, '', '', '', '', '', 0, 0, 0, 0, 0, NULL, '', '', '', '', '', 0, '', '', NULL, NULL, 1, 1333980728, 0, '123.126.50.78');

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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=30 ;

--
-- Dumping data for table `zp_jobs`
--

INSERT INTO `zp_jobs` (`id`, `cid`, `scid`, `title`, `live_gnd_p`, `live_gnd_c`, `live_address`, `funtype_1`, `funtype_2`, `dustrytype_1`, `dustrytype_2`, `company_type`, `company_scale`, `company_properties`, `gender`, `language`, `money`, `jobterm`, `degree`, `pnum`, `work_exp`, `jtext`, `createtime`, `startdate`, `enddate`, `status`, `modifydate`) VALUES
(1, 2, 0, '高速复印机销售（北京）', 1, 419, '', 18, 22, 0, 0, 2, 3, 0, 1, 9, 10, 1, 8, 0, 4, '<p>主要职责： <br />-负责开发所属行业，区域内的客户 <br />-负责所属范围内直接用户的深度挖掘，业务推广及销售工作 <br />-根据客户实际情况制定解决方案 <br />-独立完成合同的签订、货款的回收 <br />-完成公司下达的各项业务指标 <br />-完成部门领导安排的其他工作 </p>\r\n<p>工作经验要求： <br />-印刷专业或营销专业大专以上学历 <br />-在印刷或OA行业从事销售工作3年以上 <br />-具备网络、软件应用等方面的知识 <br />-熟练使用OFFICE软件 <br />-35岁以下</p>', 1331796328, 1331740800, 1339603200, 1, 1331797445),
(2, 2, 0, '销售代表', 1, 419, NULL, 18, 19, 0, 0, 2, 3, 0, 1, 1, 10, 1, 8, 0, 4, '<p>工作内容： <br />- 直接面对终端用户进行MFP的销售 <br />- 在所负责区域内开发新客户 <br />- 回访及维护已有客户并能进行再次开发 <br />- 独立完成合同的签订、货款的回收 <br />- 能够根据客户实际情况制定解决方案 <br />- 配合上司达成团队销售目标 </p>\r\n<p>岗位要求： <br />- 外语类或计算机相关专业大专以上学历 <br />- 具备OA办公用品或电子行业直销工作经验 <br />- 能够用英语or日语进行交流，听说读写良好 <br />- 30岁以下，男女不限 </p>', 1331796434, 1331740800, 1339603200, 1, 1331796434),
(3, 2, 0, '维修工程师', 42, 16, NULL, 40, 48, 0, 0, 2, 3, 0, 1, 9, 10, 1, 8, 0, 4, '<p>主要职责： <br />-柯尼卡美能达公司销售设备的安装、调试、操作及维护； <br />-与设备相关的网络与网络设备的安装、调试及维护； <br />-熟练使用OFFICE软件，如WORD,EXCEL,POWERPOINT等 <br />-上述各类设备故障的判断、分析及故障排除； <br />-服从工作分配，并按公司、部门及组内要求正确填写相关的报告等； <br />-能与客户良好沟通并提供优质服务，积极促进KMtoKM活动 <br />-具备彩色数码短版印刷机维修服务的相关经验，优先考虑。 </p>\r\n<p>工作经验要求： <br />-在OA/机械/电子行业从事2-3年以上工作； <br />-主要需具备动手能力，机械、电子、网络基础及良好的沟通能力； <br />-机械/电子/办公设备/计算机或相关专业中专以上学历； <br />-英语水平一般；30岁以下。 </p>', 1331796585, 1331740800, 1339603200, 1, 1331796585),
(4, 2, 0, '高速复印机技术维修工程师', 42, 28, NULL, 40, 48, 0, 0, 2, 3, 0, 1, 9, 10, 1, 8, 0, 4, '<p>主要职责： <br />- 柯尼卡美能达PP设备及相关的网络与网络设备的安装、调试、操作； <br />-上述各类设备故障的判断、分析及排除； <br />- 熟练使用OFFICE软件，如word、Excel、PowerPoint等； <br />- 服从工作安排，能够适应经常或长期出差； <br />- 按要求正确填写相关的报告等； <br />- 能与客户良好沟通并提供优质服务，积极促进KM to KM的活动； <br />- 具备彩色数码短版印刷机维修服务相关经验者优先考虑。 </p>\r\n<p>工作经验要求： <br />- 在OA/机械/电子/印刷行业从事维修工作2-3年工作； <br />- 主要需具备动手能力；具备机械、电子、网络基础以及良好的沟通能力； <br />- 机械、电子、印刷、办公设备或相关专业毕业，中专以上学历； <br />- 30岁以下 <br />- 工作地点：山东省济南市 <br /></p>', 1331796689, 1331740800, 1339603200, 1, 1331796689),
(5, 2, 0, '技术服务工程师（高速复印机）', 1, 419, NULL, 40, 48, 0, 0, 2, 3, 0, 1, 9, 10, 1, 8, 0, 4, '<p>主要职责： <br />- 柯尼卡美能达PP设备及相关的网络与网络设备的安装、调试、操作； <br />-上述各类设备故障的判断、分析及排除； <br />- 熟练使用OFFICE软件，如word、Excel、PowerPoint等； <br />- 服从工作安排，能够适应经常或长期出差； <br />- 按要求正确填写相关的报告等； <br />- 能与客户良好沟通并提供优质服务，积极促进KM to KM的活动； <br />- 具备彩色数码短版印刷机维修服务相关经验者优先考虑。 </p>\r\n<p>工作经验要求： <br />- 在OA/机械/电子/印刷行业从事维修工作2-3年工作； <br />- 主要需具备动手能力；具备机械、电子、网络基础以及良好的沟通能力； <br />- 机械、电子、印刷、办公设备或相关专业毕业，中专以上学历； <br />- 30岁以下 </p>', 1331796766, 1331740800, 1339603200, 1, 1331796766),
(6, 2, 0, '销售培训师', 1, 419, NULL, 18, 34, 0, 0, 2, 3, 0, 1, 9, 10, 1, 8, 0, 4, '<p>工作经验要求： <br />１、在ＯＡ行业或Ｂ２Ｂ销售相关行业２年以上工作经验，具备大客户，解决方案等销售经验，或者一线销售支持培训的实际经验。 <br />２、优秀的表达能力和责任心，对培训有热情和兴趣。 <br />３、具备ＭＦＰ软件＼硬件＼解决方案产品知识尤佳。 <br />４、持有培训师等相关认证资格优先考虑。 </p>\r\n<p>主要职责： <br />１、针对销售员进行软件＼解决方案＼硬件产品和销售技巧方面培训。 <br />２、培训需求＼课程调研等资料收集和报告整理。 <br />３、课程开发＼教材设计及制作。 <br />４、其他培训相关的工作。 <br /></p>', 1331797070, 1331740800, 1339603200, 1, 1331797070),
(7, 2, 0, '区域销售代表', 1, 419, NULL, 18, 19, 0, 0, 2, 3, 0, 1, 9, 10, 1, 8, 0, 4, '<p>主要职责： <br />1、负责华北某市场的渠道销售和经销商管理； <br />2、协助经销商进行市场开拓和管理、大客户开发以及市场活动的开展和跟进； <br />3、收集、分析目标市场信息，制定区域销售政策； <br />4、在目标市场举办展示会、分销商会议和产品培训会； <br />5、完成公司内部工作以及协同各部门工作的开展等。 <br /></p>', 1331797157, 1331740800, 1339603200, 1, 1331797157),
(8, 2, 0, '高速复印机销售（天津）', 2, 0, '', 18, 22, 0, 0, 2, 3, 0, 1, 9, 10, 1, 8, 0, 4, '<p>主要职责： <br />-负责开发所属行业，区域内的客户 <br />-负责所属范围内直接用户的深度挖掘，业务推广及销售工作 <br />-根据客户实际情况制定解决方案 <br />-独立完成合同的签订、货款的回收 <br />-完成公司下达的各项业务指标 <br />-完成部门领导安排的其他工作 </p>\r\n<p>工作经验要求： <br />-印刷专业或营销专业大专以上学历 <br />-在印刷或OA行业从事销售工作3年以上 <br />-具备网络、软件应用等方面的知识 <br />-熟练使用OFFICE软件 <br />-35岁以下</p>', 1331797292, 1331740800, 1339603200, 1, 1331797727),
(9, 2, 0, '高速复印机销售（太原）', 34, 72, '', 18, 22, 0, 0, 2, 3, 0, 1, 9, 10, 1, 8, 0, 4, '<p>主要职责： <br />-负责开发所属行业，区域内的客户 <br />-负责所属范围内直接用户的深度挖掘，业务推广及销售工作 <br />-根据客户实际情况制定解决方案 <br />-独立完成合同的签订、货款的回收 <br />-完成公司下达的各项业务指标 <br />-完成部门领导安排的其他工作 </p>\r\n<p>工作经验要求： <br />-印刷专业或营销专业大专以上学历 <br />-在印刷或OA行业从事销售工作3年以上 <br />-具备网络、软件应用等方面的知识 <br />-熟练使用OFFICE软件 <br />-35岁以下</p>', 1331797340, 1331740800, 1339603200, 1, 1331797598),
(10, 6, 0, 'Nike耐克直营店库管（北京）', 1, 419, '', 3, 14, 0, 0, 1, 3, 0, 1, 10, 3, 1, 9, 0, 0, '<span style="color:#000000;WORD-SPACING: 0px; FONT: 12px/18px 宋体, ''Courier New''; TEXT-TRANSFORM: none; TEXT-INDENT: 0px; WHITE-SPACE: normal; LETTER-SPACING: normal; BACKGROUND-COLOR: rgb(255,255,255); orphans: 2; widows: 2; webkit-text-decorations-in-effect: none; webkit-text-size-adjust: auto; webkit-text-stroke-width: 0px"></span>\r\n<div style="FONT-SIZE: 12px; LINE-HEIGHT: 1.5">ADP人力资源服务有限公司是经上海市劳动和社会保障局、上海市人事局许可，注册成立的一家专业的人力资源服务公司专业从事人才租赁、人事外包、人才中介、培训等人力资源服务项目. ADP凭借拥有十多年人力资源专业工作经验及对不同行业人力资源管理的深入理解，坚持立足市场发展的前沿，ADP作为耐克公司的人事外包公司，现诚聘以下人才派遣至耐克全国各大门店工作.<span>&nbsp;</span><br style="FONT-SIZE: 12px" /><br style="FONT-SIZE: 12px" />职责描述<span>&nbsp;</span><br style="FONT-SIZE: 12px" /><br style="FONT-SIZE: 12px" />1.以优质服务和专业知识满足顾客需求，达成销售目标<span>&nbsp;</span><br style="FONT-SIZE: 12px" />3.协助顾客获取产品资料。<span>&nbsp;</span><br style="FONT-SIZE: 12px" />4.保持店内整洁美观、备货、协助清洁工作。<span>&nbsp;</span><br style="FONT-SIZE: 12px" />5.履行分配的其他职责，包括但不限于：处理到货、为产品标明价格或者贴标签、进行实际存货检查和进行商品美观成列。<span>&nbsp;</span><br style="FONT-SIZE: 12px" />6.确保销售流程的执行，在工作中贯彻耐克公司零售的标准、宗旨和目标。<span>&nbsp;</span><br style="FONT-SIZE: 12px" />7.根据需要，为其它部门提供支持。<span>&nbsp;</span><br style="FONT-SIZE: 12px" /><br style="FONT-SIZE: 12px" /><br style="FONT-SIZE: 12px" />职责要求<span>&nbsp;</span><br style="FONT-SIZE: 12px" /><br style="FONT-SIZE: 12px" />1.高中或中专以上学历。<span>&nbsp;</span><br style="FONT-SIZE: 12px" />2.良好的沟通、表达能力。<span>&nbsp;</span><br style="FONT-SIZE: 12px" />3.以服务为导向。<span>&nbsp;</span><br style="FONT-SIZE: 12px" />4.能适应快节奏的工作环境，工作效率高。<span>&nbsp;</span><br style="FONT-SIZE: 12px" />5.富有朝气，热爱体育。<span>&nbsp;</span><br style="FONT-SIZE: 12px" />6.能够接受排班，完成在夜间、周末和一些假期的工作。<span>&nbsp;</span><br style="FONT-SIZE: 12px" />7.有零售业或服装销售经验者优先。</div><br style="FONT-SIZE: 12px" />\r\n<div style="FONT-SIZE: 12px; LINE-HEIGHT: 1.5">工作地点：</div>\r\n<div style="FONT-SIZE: 12px; LINE-HEIGHT: 1.5">1.北京市朝阳区甘露园南里25号8号楼二层237-238-239-240-241-242-243-244号商铺<span>&nbsp;</span><br style="FONT-SIZE: 12px" />2.北京工体北路三里屯路口S8号楼8单元1&amp;2层<span>&nbsp;</span><br style="FONT-SIZE: 12px" />3.北京市朝阳区朝阳公园路6号solana购物中心1栋广场层M-7号商铺<span>&nbsp;</span><br style="FONT-SIZE: 12px" />4.北京市朝阳区来广营欧尚超市一层</div><br style="FONT-SIZE: 12px" />\r\n<div style="FONT-SIZE: 12px; LINE-HEIGHT: 1.5">薪资架构：基本工资（一般情况下，新入职员工都是II级工资1800元/月）+饭补150元/月+奖金（以550元/月为限，每月根据店铺运营情况及个人表现评定奖金金额）+年终双薪。</div>', 1332832973, 1332777600, 1364227200, 1, 1332837440),
(11, 6, 0, 'Nike耐克直营店店员（翠微店）', 1, 434, '立汤路186号龙德广场翠微百货4层', 3, 4, 0, 0, 1, 3, 0, 1, 10, 3, 1, 9, 0, 0, '<p>\r\n<table class="jobs_1" cellspacing="0" cellpadding="0" width="98%" align="center" border="0">\r\n<tbody>\r\n<tr>\r\n<td class="job_detail" style="WIDTH: 100%" colspan="6"><strong>职位职能:</strong>&nbsp;&nbsp;店员/营业员&nbsp;&nbsp; </td></tr>\r\n<tr>\r\n<td class="txt_4 wordBreakNormal job_detail " style="WIDTH: 100%" colspan="6"><strong>职位描述:</strong><br />\r\n<div style="PADDING-BOTTOM: 30px">ADP人力资源服务有限公司是经上海市劳动和社会保障局、上海市人事局许可，注册成立的一家专业的人力资源服务公司专业从事人才租赁、人事外包、人才中介、培训等人力资源服务项目. ADP凭借拥有十多年人力资源专业工作经验及对不同行业人力资源管理的深入理解，坚持立足市场发展的前沿，ADP作为耐克公司的人事外包公司，现诚聘以下人才派遣至耐克全国各大门店工作.<br /><br />职责描述<br /><br />1. 以优质服务和专业知识满足顾客需求，达成销售目标<br />3. 协助顾客获取产品资料。<br />4 保持店内整洁美观、备货、协助清洁工作。<br />5. 履行分配的其他职责，包括但不限于：处理到货、为产品标明价格或者贴标签、进行实际存货检查和进行商品美观成列。<br />6.确保销售流程的执行，在工作中贯彻耐克公司零售的标准、宗旨和目标。<br />7. 根据需要，为其它部门提供支持。<br /><br /><br />职责要求<br /><br />1.高中或中专以上学历。<br />2. 良好的沟通、表达能力。<br />3. 以服务为导向。<br />4. 能适应快节奏的工作环境，工作效率高。<br />5. 富有朝气，热爱体育。<br />6. 能够接受排班，完成在夜间、周末和一些假期的工作。<br />7. 有零售业或服装销售经验者优先。<br /><br />工作地点：北京市昌平区立汤路186号龙德广场翠微百货4层(13或5号线立水桥站下)<br /><br />薪资结构：基本工资（一般情况下，新入职员工都是II级工资1800元/月）+饭补150元/月+奖金（以550元/月为限，每月根据店铺运营情况及个人表现评定奖金金额）+年终双薪。</div></td></tr></tbody></table></p>', 1332833710, 1332777600, 1364227200, 1, 1332837568),
(12, 6, 0, 'Nike耐克直营店店员（朝阳京顺）', 1, 419, '', 3, 4, 0, 0, 1, 3, 0, 1, 10, 3, 1, 9, 0, 0, '<p>\r\n<table class="jobs_1" cellspacing="0" cellpadding="0" width="98%" align="center" border="0">\r\n<tbody>\r\n<tr>\r\n<td class="job_detail" style="WIDTH: 100%" colspan="6"><strong>职位职能:</strong>&nbsp;&nbsp;店员/营业员&nbsp;&nbsp; </td></tr>\r\n<tr>\r\n<td class="txt_4 wordBreakNormal job_detail " style="WIDTH: 100%" colspan="6"><strong>职位描述:</strong><br />\r\n<div style="PADDING-BOTTOM: 30px">ADP人力资源服务有限公司是经上海市劳动和社会保障局、上海市人事局许可，注册成立的一家专业的人力资源服务公司专业从事人才租赁、人事外包、人才中介、培训等人力资源服务项目. ADP凭借拥有十多年人力资源专业工作经验及对不同行业人力资源管理的深入理解，坚持立足市场发展的前沿，ADP作为耐克公司的人事外包公司，现诚聘以下人才派遣至耐克全国各大门店工作.<br /><br />职责描述<br /><br />1. 以优质服务和专业知识满足顾客需求，达成销售目标<br />3. 协助顾客获取产品资料。<br />4. 保持店内整洁美观、备货、协助清洁工作。<br />5. 履行分配的其他职责，包括但不限于：处理到货、为产品标明价格或者贴标签、进行实际存货检查和进行商品美观成列。<br />6. 确保销售流程的执行，在工作中贯彻耐克公司零售的标准、宗旨和目标。<br />7. 根据需要，为其它部门提供支持。<br /><br /><br />职责要求<br /><br />1. 高中或中专以上学历。<br />2. 良好的沟通、表达能力。<br />3. 以服务为导向。<br />4. 能适应快节奏的工作环境，工作效率高。<br />5. 富有朝气，热爱体育。<br />6. 能够接受排班，完成在夜间、周末和一些假期的工作。<br />7. 有零售业或服装销售经验者优先。</div></td></tr></tbody></table></p>', 1332834126, 1332777600, 1364227200, 1, 1332837587),
(13, 6, 0, 'Nike耐克直营店店员（金盏斯普瑞斯） ', 1, 419, '朝阳区金盏乡森林公园东1号斯普瑞斯奥特莱斯1-B15 1-B16商铺', 3, 4, 0, 0, 1, 3, 0, 1, 10, 3, 1, 9, 0, 0, '<p>\r\n<table class="jobs_1" cellspacing="0" cellpadding="0" width="98%" align="center" border="0">\r\n<tbody>\r\n<tr>\r\n<td class="job_detail" style="WIDTH: 100%" colspan="6"><strong></strong></td></tr>\r\n<tr>\r\n<td class="txt_4 wordBreakNormal job_detail " style="WIDTH: 100%" colspan="6">\r\n<table class="jobs_1" cellspacing="0" cellpadding="0" width="98%" align="center" border="0">\r\n<tbody>\r\n<tr>\r\n<td class="job_detail" style="WIDTH: 100%" colspan="6"><strong>职位职能:</strong>&nbsp;&nbsp;店员/营业员&nbsp;&nbsp; </td></tr>\r\n<tr>\r\n<td class="txt_4 wordBreakNormal job_detail " style="WIDTH: 100%" colspan="6"><strong>职位描述:</strong><br />\r\n<div style="PADDING-BOTTOM: 30px">\r\n<div>ADP人力资源服务有限公司是经上海市劳动和社会保障局、上海市人事局许可，注册成立的一家专业的人力资源服务公司专业从事人才租赁、人事外包、人才中介、培训等人力资源服务项目. ADP凭借拥有十多年人力资源专业工作经验及对不同行业人力资源管理的深入理解，坚持立足市场发展的前沿，ADP作为耐克公司的人事外包公司，现诚聘以下人才派遣至耐克全国各大门店工作. <br /><br />职责描述 <br /><br />1.以优质服务和专业知识满足顾客需求，达成销售目标 <br />2.协助顾客获取产品资料。 <br />3.保持店内整洁美观、备货、协助清洁工作。 <br />4.履行分配的其他职责，包括但不限于：处理到货、为产品标明价格或者贴标签、进行实际存货检查和进行商品美观成列。 <br />5.确保销售流程的执行，在工作中贯彻耐克公司零售的标准、宗旨和目标。 <br />6.根据需要，为其它部门提供支持。 <br /><br /><br />职责要求 <br /><br />1.高中或中专以上学历。 <br />2.良好的沟通、表达能力。 <br />3.以服务为导向。 <br />4.能适应快节奏的工作环境，工作效率高。 <br />5.富有朝气，热爱体育。 <br />6.能够接受排班，完成在夜间、周末和一些假期的工作。 <br />7.有零售业或服装销售经验者优先。 </div><br />\r\n<div>工作地点：北京市朝阳区金盏乡森林公园东1号斯普瑞斯奥特莱斯1-B15 1-B16商铺</div>\r\n<div>\r\n<p>薪资结构：基本工资（一般情况下，新入职员工都是II级工资1800元/月）+饭补150元/月+奖金（以550元/月为限，每月根据店铺运营情况及个人表现评定奖金金额）+年终双薪。</p></div></div></td></tr></tbody></table><br />\r\n<div style="PADDING-BOTTOM: 30px">&nbsp;</div></td></tr></tbody></table></p>', 1332835236, 1332777600, 1364227200, 1, 1332837609),
(14, 6, 0, 'Nike耐克直营店收银员（北京）', 1, 419, '', 3, 5, 0, 0, 1, 3, 0, 1, 10, 3, 1, 9, 0, 0, '<span style="color:#000000;WORD-SPACING: 0px; FONT: 12px/18px 宋体, ''Courier New''; TEXT-TRANSFORM: none; TEXT-INDENT: 0px; WHITE-SPACE: normal; LETTER-SPACING: normal; BACKGROUND-COLOR: rgb(255,255,255); orphans: 2; widows: 2; webkit-text-decorations-in-effect: none; webkit-text-size-adjust: auto; webkit-text-stroke-width: 0px"></span>\r\n<div style="FONT-SIZE: 12px; LINE-HEIGHT: 1.5">\r\n<table class="jobs_1" cellspacing="0" cellpadding="0" width="98%" align="center" border="0">\r\n<tbody>\r\n<tr>\r\n<td class="job_detail" style="WIDTH: 100%" colspan="6"><strong>职位职能:</strong>&nbsp;&nbsp;店员/营业员&nbsp;&nbsp;收银主管/收银员 </td></tr>\r\n<tr>\r\n<td class="txt_4 wordBreakNormal job_detail " style="WIDTH: 100%" colspan="6"><strong>职位描述:</strong><br />\r\n<div style="PADDING-BOTTOM: 30px">\r\n<div>ADP人力资源服务有限公司是经上海市劳动和社会保障局、上海市人事局许可，注册成立的一家专业的人力资源服务公司专业从事人才租赁、人事外包、人才中介、培训等人力资源服务项目. ADP凭借拥有十多年人力资源专业工作经验及对不同行业人力资源管理的深入理解，坚持立足市场发展的前沿，ADP作为耐克公司的人事外包公司，现诚聘以下人才派遣至耐克全国各大门店工作. <br /><br />职责描述 <br /><br />1.以优质服务和专业知识满足顾客需求，达成销售目标 <br />3.协助顾客获取产品资料。 <br />4.保持店内整洁美观、备货、协助清洁工作。 <br />5.履行分配的其他职责，包括但不限于：处理到货、为产品标明价格或者贴标签、进行实际存货检查和进行商品美观成列。 <br />6.确保销售流程的执行，在工作中贯彻耐克公司零售的标准、宗旨和目标。 <br />7.根据需要，为其它部门提供支持。 <br /><br /><br />职责要求 <br /><br />1.高中或中专以上学历。 <br />2.良好的沟通、表达能力。 <br />3.以服务为导向。 <br />4.能适应快节奏的工作环境，工作效率高。 <br />5.富有朝气，热爱体育。 <br />6.能够接受排班，完成在夜间、周末和一些假期的工作。 <br />7.有零售业或服装销售经验者优先。 </div><br />\r\n<div>工作地点：</div>\r\n<div>1.北京市朝阳区甘露园南里25号8号楼二层237-238-239-240-241-242-243-244号商铺</div>\r\n<div>2.北京工体北路三里屯路口S8号楼8单元1&amp;2层</div>\r\n<div>3.北京市朝阳区朝阳公园路6号solana购物中心1栋广场层M-7号商铺</div>\r\n<div>4.北京市朝阳区来广营欧尚超市一层</div><br />\r\n<div>薪资架构：基本工资（一般情况下，新入职员工都是II级工资1800元/月）+饭补150元/月+奖金（以550元/月为限，每月根据店铺运营情况及个人表现评定奖金金额）+年终双薪。</div></div></td></tr></tbody></table></div>', 1332835336, 1332777600, 1364227200, 1, 1332837637),
(15, 6, 0, 'Nike耐克直营店店员（亦庄万源店）', 1, 423, '丰台区东高地万源路物美1层', 3, 4, 0, 0, 1, 3, 0, 1, 10, 3, 1, 9, 0, 0, '<p>\r\n<table class="jobs_1" cellspacing="0" cellpadding="0" width="98%" align="center" border="0">\r\n<tbody>\r\n<tr>\r\n<td class="job_detail" style="WIDTH: 100%" colspan="6"><strong>位职能:</strong>&nbsp;&nbsp;店员/营业员&nbsp;&nbsp; </td></tr>\r\n<tr>\r\n<td class="txt_4 wordBreakNormal job_detail " style="WIDTH: 100%" colspan="6"><strong>职位描述:</strong><br />\r\n<div style="PADDING-BOTTOM: 30px">\r\n<div>ADP人力资源服务有限公司是经上海市劳动和社会保障局、上海市人事局许可，注册成立的一家专业的人力资源服务公司专业从事人才租赁、人事外包、人才中介、培训等人力资源服务项目. ADP凭借拥有十多年人力资源专业工作经验及对不同行业人力资源管理的深入理解，坚持立足市场发展的前沿，ADP作为耐克公司的人事外包公司，现诚聘以下人才派遣至耐克全国各大门店工作. <br /><br />职责描述 <br /><br />1.以优质服务和专业知识满足顾客需求，达成销售目标 <br />3. 协助顾客获取产品资料。 <br />4.保持店内整洁美观、备货、协助清洁工作。 <br />5.履行分配的其他职责，包括但不限于：处理到货、为产品标明价格或者贴标签、进行实际存货检查和进行商品美观成列。 <br />6.确保销售流程的执行，在工作中贯彻耐克公司零售的标准、宗旨和目标。 <br />7.根据需要，为其它部门提供支持。 <br /><br /><br />职责要求 <br /><br />1.高中或中专以上学历。 <br />2.良好的沟通、表达能力。 <br />3.以服务为导向。 <br />4.能适应快节奏的工作环境，工作效率高。 <br />5.富有朝气，热爱体育。 <br />6. 能够接受排班，完成在夜间、周末和一些假期的工作。 <br />7.有零售业或服装销售经验者优先。 </div><br />\r\n<div>工作地点：丰台区东高地万源路物美1层。乘车路线：729、997、324、运通115万源路下车，736旧宫下车往西走即是附近交通：729、997、324、运通115万源路下车，736旧宫下车往西。</div><br />\r\n<div>薪资架构：基本工资（一般情况下，新入职员工都是II级工资1800元/月）+饭补150元/月+奖金（以550元/月为限，每月根据店铺运营情况及个人表现评定奖金金额）+年终双薪。</div></div></td></tr></tbody></table></p>', 1332835459, 1332777600, 1364227200, 1, 1332837668),
(16, 6, 0, 'Nike耐克北京旗舰店I DO', 1, 422, '王府井新东安市场B1 NIKE', 3, 4, 0, 0, 1, 3, 0, 1, 10, 3, 1, 8, 0, 3, '<p>\r\n<table class="jobs_1" cellspacing="0" cellpadding="0" width="98%" align="center" border="0">\r\n<tbody>\r\n<tr>\r\n<td class="job_detail" style="WIDTH: 100%" colspan="6"><strong>职位职能:</strong>&nbsp;&nbsp;店员/营业员&nbsp;&nbsp; </td></tr>\r\n<tr>\r\n<td class="txt_4 wordBreakNormal job_detail " style="WIDTH: 100%" colspan="6"><strong>职位描述:</strong><br />\r\n<div style="PADDING-BOTTOM: 30px">\r\n<p>ADP人力资源服务有限公司是经上海市劳动和社会保障局、上海市人事局许可，注册成立的一家专业的人力资源服务公司专业从事人才租赁、人事外包、人才中介、培训等人力资源服务项目. ADP凭借拥有十多年人力资源专业工作经验及对不同行业人力资源管理的深入理解，坚持立足市场发展的前沿，ADP作为耐克公司的人事外包公司，现诚聘以下人才派遣至耐克全国各大门店工作. <br /><br />职责描述 <br />1. 协助店铺负责人达成销售业绩 <br />2. 通过向消费者提供优质服务体现耐克品牌形象 <br />3. 指导以及帮助店铺其他成员提升服务形象，以向消费者提供优质服务 <br />4. 运用专业的技能知识及良好的沟通能力，向客户送达“I DO”理念，巩固和扩大忠实消费群体 <br />5. 负责该区域日常运作 <br /><br /><br /><br />职责要求 <br /><br />1. 大专及以上学历,25~30岁左右 <br />2. 有过解决消费者投诉，随访、跟踪消费者需求等方面工作经验者尤佳 <br />3. 良好的沟通、表达能力，强烈的服务意识&nbsp;<br />4. &nbsp;能适应快节奏的工作环境；工作效率高 <br />5. 1~3年零售或餐饮业的相关工作经验 <br />6. 富有朝气，热爱体育 </p><br />\r\n<p>工作地点：北京东城区王府井新东安市场B1 NIKE(地铁王府井站下车A口出来)</p><br />\r\n<p>薪资结构：基本工资（一般情况下，新入职员工都是II级工资1800元/月）+饭补150元/月+奖金（以550元/月为限，每月根据店铺运营情况及个人表现评定奖金金额）+年终双薪。</p></div></td></tr></tbody></table></p>', 1332835616, 1332777600, 1364227200, 1, 1332838223),
(17, 6, 0, 'Nike耐克北京旗舰店店员', 1, 422, '王府井新东安市场B1 NIKE', 3, 4, 0, 0, 1, 3, 0, 1, 10, 3, 1, 9, 0, 0, '<p>\r\n<table class="jobs_1" cellspacing="0" cellpadding="0" width="98%" align="center" border="0">\r\n<tbody>\r\n<tr>\r\n<td class="job_detail" style="WIDTH: 100%" colspan="6"><strong>职位职能:</strong>&nbsp;&nbsp;店员/营业员&nbsp;&nbsp; </td></tr>\r\n<tr>\r\n<td class="txt_4 wordBreakNormal job_detail " style="WIDTH: 100%" colspan="6"><strong>职位描述:</strong><br />\r\n<div style="PADDING-BOTTOM: 30px">ADP人力资源服务有限公司是经上海市劳动和社会保障局、上海市人事局许可，注册成立的一家专业的人力资源服务公司专业从事人才租赁、人事外包、人才中介、培训等人力资源服务项目. ADP凭借拥有十多年人力资源专业工作经验及对不同行业人力资源管理的深入理解，坚持立足市场发展的前沿，ADP作为耐克公司的人事外包公司，现诚聘以下人才派遣至耐克全国各大门店工作.<br /><br />职责描述<br /><br />1. 以优质服务和专业知识满足顾客需求，达成销售目标<br />2. &nbsp;协助顾客获取产品资料。<br />3. 保持店内整洁美观、备货、协助清洁工作。<br />4. 履行分配的其他职责，包括但不限于：处理到货、为产品标明价格或者贴标签、进行实际存货检查和进行商品美观成列。<br />5. 确保销售流程的执行，在工作中贯彻耐克公司零售的标准、宗旨和目标。<br />6. 根据需要，为其它部门提供支持。<br /><br /><br />职责要求<br /><br />1. 高中或中专以上学历。<br />2. 良好的沟通、表达能力。<br />3. 以服务为导向。<br />4.&nbsp;能适应快节奏的工作环境，工作效率高。<br />5. 富有朝气，热爱体育。<br />6. 能够接受排班，完成在夜间、周末和一些假期的工作。<br />7. 有零售业或服装销售经验者优先。<br /><br />工作地点：北京东城区王府井新东安市场B1 NIKE(地铁王府井站下车A口出来)<br /><br />薪资结构：基本工资（一般情况下，新入职员工都是II级工资1800元/月）+饭补150元/月+奖金（以550元/月为限，每月根据店铺运营情况及个人表现评定奖金金额）+年终双薪。</div></td></tr></tbody></table></p>', 1332835791, 1332777600, 1364227200, 1, 1332837922),
(18, 6, 0, 'Nike耐克直营店店员（赛特店）', 1, 419, '香江北路28号赛特奥特莱斯1-046 ', 3, 4, 0, 0, 1, 3, 0, 1, 10, 3, 1, 9, 0, 0, '<p>\r\n<table class="jobs_1" cellspacing="0" cellpadding="0" width="98%" align="center" border="0">\r\n<tbody>\r\n<tr>\r\n<td class="job_detail" style="WIDTH: 100%" colspan="6"><strong>职位职能:</strong>&nbsp;&nbsp;店员/营业员&nbsp;&nbsp; </td></tr>\r\n<tr>\r\n<td class="txt_4 wordBreakNormal job_detail " style="WIDTH: 100%" colspan="6"><strong>职位描述:</strong><br />\r\n<div style="PADDING-BOTTOM: 30px">ADP人力资源服务有限公司是经上海市劳动和社会保障局、上海市人事局许可，注册成立的一家专业的人力资源服务公司专业从事人才租赁、人事外包、人才中介、培训等人力资源服务项目. ADP凭借拥有十多年人力资源专业工作经验及对不同行业人力资源管理的深入理解，坚持立足市场发展的前沿，ADP作为耐克公司的人事外包公司，现诚聘以下人才派遣至耐克全国各大门店工作.<br /><br />职责描述<br /><br />1. 以优质服务和专业知识满足顾客需求，达成销售目标<br />2.&nbsp; 协助顾客获取产品资料。<br />3. 保持店内整洁美观、备货、协助清洁工作。<br />4. 履行分配的其他职责，包括但不限于：处理到货、为产品标明价格或者贴标签、进行实际存货检查和进行商品美观成列。<br />5. 确保销售流程的执行，在工作中贯彻耐克公司零售的标准、宗旨和目标。<br />6. 根据需要，为其它部门提供支持。<br /><br /><br />职责要求<br /><br />1. 高中或中专以上学历。<br />2. 良好的沟通、表达能力。<br />3. 以服务为导向。<br />4. 能适应快节奏的工作环境，工作效率高。<br />5. 富有朝气，热爱体育。<br />6. 能够接受排班，完成在夜间、周末和一些假期的工作。<br />7. 有零售业或服装销售经验者优先。<br /><br />工作地点：朝阳区香江北路28号赛特奥特莱斯1-046 NIKE（公交线路：988（菜户营桥西-马泉营）香江北路西口站； 944（菜户营桥西-奶子房）马泉营站）地铁15号线马泉营站下车，B口出再步行3分钟左右。<br /><br />薪资结构：基本工资（一般情况下，新入职员工都是II级工资1800元/月）+饭补150元/月+奖金（以550元/月为限，每月根据店铺运营情况及个人表现评定奖金金额）+年终双薪。</div></td></tr></tbody></table></p>', 1332835962, 1332777600, 1364227200, 1, 1332837952),
(19, 6, 0, 'Nike耐克直营店店员（朝阳园店）', 1, 419, '甘露园南里25号8号楼2层237-244商铺', 3, 4, 0, 0, 1, 3, 0, 1, 10, 3, 1, 9, 0, 0, '<div style="FONT-SIZE: 12px; LINE-HEIGHT: 1.5">\r\n<table class="jobs_1" cellspacing="0" cellpadding="0" width="98%" align="center" border="0">\r\n<tbody>\r\n<tr>\r\n<td class="job_detail" style="WIDTH: 100%" colspan="6"><strong>职位职能:</strong>&nbsp;&nbsp;店员/营业员&nbsp;&nbsp; </td></tr>\r\n<tr>\r\n<td class="txt_4 wordBreakNormal job_detail " style="WIDTH: 100%" colspan="6"><strong>职位描述:</strong><br />\r\n<div style="PADDING-BOTTOM: 30px">ADP人力资源服务有限公司是经上海市劳动和社会保障局、上海市人事局许可，注册成立的一家专业的人力资源服务公司专业从事人才租赁、人事外包、人才中介、培训等人力资源服务项目. ADP凭借拥有十多年人力资源专业工作经验及对不同行业人力资源管理的深入理解，坚持立足市场发展的前沿，ADP作为耐克公司的人事外包公司，现诚聘以下人才派遣至耐克全国各大门店工作.<br /><br />职责描述<br /><br />1.以优质服务和专业知识满足顾客需求，达成销售目标<br />3. 协助顾客获取产品资料。<br />4.保持店内整洁美观、备货、协助清洁工作。<br />5.履行分配的其他职责，包括但不限于：处理到货、为产品标明价格或者贴标签、进行实际存货检查和进行商品美观成列。<br />6.确保销售流程的执行，在工作中贯彻耐克公司零售的标准、宗旨和目标。<br />7.根据需要，为其它部门提供支持。<br /><br /><br />职责要求<br /><br />1.高中或中专以上学历。<br />2.良好的沟通、表达能力。<br />3.以服务为导向。<br />4.能适应快节奏的工作环境，工作效率高。<br />5.富有朝气，热爱体育。<br />6. 能够接受排班，完成在夜间、周末和一些假期的工作。<br />7.有零售业或服装销售经验者优先。<br /><br />工作地点：北京市朝阳区甘露园南里25号8号楼2层237-244商铺（Nike工厂店）<br /><br />薪资结构：基本工资（一般情况下，新入职员工都是II级工资1800元/月）+饭补150元/月+奖金（以550元/月为限，每月根据店铺运营情况及个人表现评定奖金金额）+年终双薪。</div></td></tr></tbody></table></div>', 1332836184, 1332777600, 1364227200, 1, 1332838140),
(20, 6, 0, 'Nike耐克直营店店员（马连道店）', 1, 428, '马连道百安居3号铺nike工厂店', 3, 4, 0, 0, 1, 3, 0, 1, 10, 3, 1, 9, 0, 0, '<p>\r\n<table class="jobs_1" cellspacing="0" cellpadding="0" width="98%" align="center" border="0">\r\n<tbody>\r\n<tr>\r\n<td class="job_detail" style="WIDTH: 100%" colspan="6"><strong>职位职能:</strong>&nbsp;&nbsp;店员/营业员&nbsp;&nbsp; </td></tr>\r\n<tr>\r\n<td class="txt_4 wordBreakNormal job_detail " style="WIDTH: 100%" colspan="6"><strong>职位描述:</strong><br />\r\n<div style="PADDING-BOTTOM: 30px">ADP人力资源服务有限公司是经上海市劳动和社会保障局、上海市人事局许可，注册成立的一家专业的人力资源服务公司专业从事人才租赁、人事外包、人才中介、培训等人力资源服务项目. ADP凭借拥有十多年人力资源专业工作经验及对不同行业人力资源管理的深入理解，坚持立足市场发展的前沿，ADP作为耐克公司的人事外包公司，现诚聘以下人才派遣至耐克全国各大门店工作.<br /><br />职责描述<br /><br />1. 以优质服务和专业知识满足顾客需求，达成销售目标<br />2. 协助顾客获取产品资料。<br />3. 保持店内整洁美观、备货、协助清洁工作。<br />4. 履行分配的其他职责，包括但不限于：处理到货、为产品标明价格或者贴标签、进行实际存货检查和进行商品美观成列。<br />5. 确保销售流程的执行，在工作中贯彻耐克公司零售的标准、宗旨和目标。<br />6. 根据需要，为其它部门提供支持。<br /><br /><br />职责要求<br /><br />1. 高中或中专以上学历。<br />2.&nbsp;良好的沟通、表达能力。<br />3. 以服务为导向。<br />4. 能适应快节奏的工作环境，工作效率高。<br />5. 富有朝气，热爱体育。<br />6. 能够接受排班，完成在夜间、周末和一些假期的工作。<br />7. 有零售业或服装销售经验者优先。<br /><br />工作地点：北京市宣武区马连道百安居3号铺nike工厂店(46，609，414公共汽车湾子站下)<br /><br />薪资结构：基本工资（一般情况下，新入职员工都是II级工资1800元/月）+饭补150元/月+奖金（以550元/月为限，每月根据店铺运营情况及个人表现评定奖金金额）+年终双薪。</div></td></tr></tbody></table></p>', 1332836373, 1332777600, 1364227200, 1, 1332838251),
(21, 6, 0, 'Nike耐克直营店店员（索拉娜店） ', 1, 419, '', 3, 4, 0, 0, 1, 3, 0, 1, 10, 3, 1, 9, 0, 0, '<p>\r\n<table class="jobs_1" cellspacing="0" cellpadding="0" width="98%" align="center" border="0">\r\n<tbody>\r\n<tr>\r\n<td class="job_detail" style="WIDTH: 100%" colspan="6"><strong>职位职能:</strong>&nbsp;&nbsp;店员/营业员&nbsp;&nbsp; </td></tr>\r\n<tr>\r\n<td class="txt_4 wordBreakNormal job_detail " style="WIDTH: 100%" colspan="6"><strong>职位描述:</strong><br />\r\n<div style="PADDING-BOTTOM: 30px">ADP人力资源服务有限公司是经上海市劳动和社会保障局、上海市人事局许可，注册成立的一家专业的人力资源服务公司专业从事人才租赁、人事外包、人才中介、培训等人力资源服务项目. ADP凭借拥有十多年人力资源专业工作经验及对不同行业人力资源管理的深入理解，坚持立足市场发展的前沿，ADP作为耐克公司的人事外包公司，现诚聘以下人才派遣至耐克全国各大门店工作.<br /><br />职责描述<br /><br />1. 以优质服务和专业知识满足顾客需求，达成销售目标<br />2. 协助顾客获取产品资料。<br />3. 保持店内整洁美观、备货、协助清洁工作。<br />4. 履行分配的其他职责，包括但不限于：处理到货、为产品标明价格或者贴标签、进行实际存货检查和进行商品美观成列。<br />5.&nbsp;确保销售流程的执行，在工作中贯彻耐克公司零售的标准、宗旨和目标。<br />6'' 根据需要，为其它部门提供支持。<br /><br /><br />职责要求<br /><br />1. 高中或中专以上学历。<br />2. 良好的沟通、表达能力。<br />3. 以服务为导向。<br />4. 能适应快节奏的工作环境，工作效率高。<br />5. 富有朝气，热爱体育。<br />6. 能够接受排班，完成在夜间、周末和一些假期的工作。<br />7. 有零售业或服装销售经验者优先。</div></td></tr></tbody></table></p>', 1332836536, 1332777600, 1364227200, 1, 1332838292),
(22, 6, 0, 'Nike耐克直营店店员（三里屯店）', 1, 419, '工体北路三里屯路口S8号楼8单元一、二层，三里屯酒吧街里', 3, 4, 0, 0, 1, 3, 0, 1, 10, 3, 1, 9, 0, 0, '<div style="FONT-SIZE: 12px; LINE-HEIGHT: 1.5">\r\n<table class="jobs_1" cellspacing="0" cellpadding="0" width="98%" align="center" border="0">\r\n<tbody>\r\n<tr>\r\n<td class="job_detail" style="WIDTH: 100%" colspan="6"><strong>职位职能:</strong>&nbsp;&nbsp;店员/营业员&nbsp;&nbsp; </td></tr>\r\n<tr>\r\n<td class="txt_4 wordBreakNormal job_detail " style="WIDTH: 100%" colspan="6"><strong>职位描述:</strong><br />\r\n<div style="PADDING-BOTTOM: 30px">ADP人力资源服务有限公司是经上海市劳动和社会保障局、上海市人事局许可，注册成立的一家专业的人力资源服务公司专业从事人才租赁、人事外包、人才中介、培训等人力资源服务项目. ADP凭借拥有十多年人力资源专业工作经验及对不同行业人力资源管理的深入理解，坚持立足市场发展的前沿，ADP作为耐克公司的人事外包公司，现诚聘以下人才派遣至耐克全国各大门店工作.<br /><br />职责描述<br /><br />1. 以优质服务和专业知识满足顾客需求，达成销售目标<br />3. 协助顾客获取产品资料。<br />4. 保持店内整洁美观、备货、协助清洁工作。<br />5. 履行分配的其他职责，包括但不限于：处理到货、为产品标明价格或者贴标签、进行实际存货检查和进行商品美观成列。<br />6. 确保销售流程的执行，在工作中贯彻耐克公司零售的标准、宗旨和目标。<br />7. 根据需要，为其它部门提供支持。<br /><br /><br />职责要求<br /><br />1. 高中或中专以上学历。<br />2. 良好的沟通、表达能力。<br />3. 以服务为导向。<br />4. 能适应快节奏的工作环境，工作效率高。<br />5. 富有朝气，热爱体育。<br />6. 能够接受排班，完成在夜间、周末和一些假期的工作。<br />7. 有零售业或服装销售经验者优先。<br /><br />工作地点：工体北路三里屯路口S8号楼8单元一、二层，三里屯酒吧街里（地铁：团结湖，公车：113/728，三里屯下）<br /><br />薪资结构：基本工资（一般情况下，新入职员工都是II级工资1800元/月）+饭补150元/月+奖金（以550元/月为限，每月根据店铺运营情况及个人表现评定奖金金额）+年终双薪。</div></td></tr></tbody></table></div>', 1332836648, 1332777600, 1364227200, 1, 1332838316),
(23, 6, 0, 'Nike耐克直营店店员（建外大街店）', 1, 419, '', 3, 4, 0, 0, 1, 3, 0, 1, 10, 3, 1, 9, 0, 0, '<p>\r\n<table class="jobs_1" cellspacing="0" cellpadding="0" width="98%" align="center" border="0">\r\n<tbody>\r\n<tr>\r\n<td class="job_detail" style="WIDTH: 100%" colspan="6"><strong>职位职能:</strong>&nbsp;&nbsp;店员/营业员&nbsp;&nbsp; </td></tr>\r\n<tr>\r\n<td class="txt_4 wordBreakNormal job_detail " style="WIDTH: 100%" colspan="6"><strong>职位描述:</strong><br />\r\n<div style="PADDING-BOTTOM: 30px">ADP人力资源服务有限公司是经上海市劳动和社会保障局、上海市人事局许可，注册成立的一家专业的人力资源服务公司专业从事人才租赁、人事外包、人才中介、培训等人力资源服务项目. ADP凭借拥有十多年人力资源专业工作经验及对不同行业人力资源管理的深入理解，坚持立足市场发展的前沿，ADP作为耐克公司的人事外包公司，现诚聘以下人才派遣至耐克全国各大门店工作.<br /><br />职责描述<br /><br />1. 以优质服务和专业知识满足顾客需求，达成销售目标<br />2. 协助顾客获取产品资料。<br />3. 保持店内整洁美观、备货、协助清洁工作。<br />4. 履行分配的其他职责，包括但不限于：处理到货、为产品标明价格或者贴标签、进行实际存货检查和进行商品美观成列。<br />5. 确保销售流程的执行，在工作中贯彻耐克公司零售的标准、宗旨和目标。<br />6. 根据需要，为其它部门提供支持。<br /><br /><br />职责要求<br /><br />1. 高中或中专以上学历。<br />2. 良好的沟通、表达能力。<br />3. 以服务为导向。<br />4. 能适应快节奏的工作环境，工作效率高。<br />5. 富有朝气，热爱体育。<br />6. 能够接受排班，完成在夜间、周末和一些假期的工作。<br />7. 有零售业或服装销售经验者优先。</div></td></tr></tbody></table></p>', 1332836796, 1332777600, 1364227200, 1, 1332838368),
(24, 6, 0, 'Nike耐克直营店店员（北京太阳宫店） ', 1, 419, '京顺路111号', 3, 4, 0, 0, 1, 3, 0, 1, 10, 3, 1, 9, 0, 0, '<p>\r\n<table class="jobs_1" cellspacing="0" cellpadding="0" width="98%" align="center" border="0">\r\n<tbody>\r\n<tr>\r\n<td class="job_detail" style="WIDTH: 100%" colspan="6"><strong>职位职能:</strong>&nbsp;&nbsp;店员/营业员&nbsp;&nbsp; </td></tr>\r\n<tr>\r\n<td class="txt_4 wordBreakNormal job_detail " style="WIDTH: 100%" colspan="6"><strong>职位描述:</strong><br />\r\n<div style="PADDING-BOTTOM: 30px">ADP人力资源服务有限公司是经上海市劳动和社会保障局、上海市人事局许可，注册成立的一家专业的人力资源服务公司专业从事人才租赁、人事外包、人才中介、培训等人力资源服务项目. ADP凭借拥有十多年人力资源专业工作经验及对不同行业人力资源管理的深入理解，坚持立足市场发展的前沿，ADP作为耐克公司的人事外包公司，现诚聘以下人才派遣至耐克全国各大门店工作.<br /><br />职责描述<br /><br />1.以优质服务和专业知识满足顾客需求，达成销售目标<br />3. 协助顾客获取产品资料。<br />4.保持店内整洁美观、备货、协助清洁工作。<br />5.履行分配的其他职责，包括但不限于：处理到货、为产品标明价格或者贴标签、进行实际存货检查和进行商品美观成列。<br />6.确保销售流程的执行，在工作中贯彻耐克公司零售的标准、宗旨和目标。<br />7.根据需要，为其它部门提供支持。<br /><br /><br />职责要求<br /><br />1.高中或中专以上学历。<br />2.良好的沟通、表达能力。<br />3.以服务为导向。<br />4.能适应快节奏的工作环境，工作效率高。<br />5.富有朝气，热爱体育。<br />6. 能够接受排班，完成在夜间、周末和一些假期的工作。<br />7.有零售业或服装销售经验者优先。<br /><br />工作地点：朝阳区京顺路111号（地铁10号线太阳宫站下，公车641、967、403、131、627、401、404路四元桥西下车）<br /><br />薪资结构：基本工资（一般情况下，新入职员工都是II级工资1800元/月）+饭补150元/月+奖金（以550元/月为限，每月根据店铺运营情况及个人表现评定奖金金额）+年终双薪。</div></td></tr></tbody></table></p>', 1332836890, 1332777600, 1364227200, 1, 1332836890),
(25, 6, 0, 'Nike耐克直营店店员（甜水园京客隆店）', 1, 419, '甜水园北里16号楼4层', 3, 4, 0, 0, 1, 3, 0, 1, 10, 3, 1, 9, 0, 0, '<div style="FONT-SIZE: 12px; LINE-HEIGHT: 1.5">\r\n<table class="jobs_1" cellspacing="0" cellpadding="0" width="98%" align="center" border="0">\r\n<tbody>\r\n<tr>\r\n<td class="job_detail" style="WIDTH: 100%" colspan="6"><strong>职位职能:</strong>&nbsp;&nbsp;店员/营业员&nbsp;&nbsp; </td></tr>\r\n<tr>\r\n<td class="txt_4 wordBreakNormal job_detail " style="WIDTH: 100%" colspan="6"><strong>职位描述:</strong><br />\r\n<div style="PADDING-BOTTOM: 30px">\r\n<div>ADP人力资源服务有限公司是经上海市劳动和社会保障局、上海市人事局许可，注册成立的一家专业的人力资源服务公司专业从事人才租赁、人事外包、人才中介、培训等人力资源服务项目. ADP凭借拥有十多年人力资源专业工作经验及对不同行业人力资源管理的深入理解，坚持立足市场发展的前沿，ADP作为耐克公司的人事外包公司，现诚聘以下人才派遣至耐克全国各大门店工作. <br /><br />职责描述 <br /><br />1.以优质服务和专业知识满足顾客需求，达成销售目标 <br />3.协助顾客获取产品资料。 <br />4.保持店内整洁美观、备货、协助清洁工作。 <br />5.履行分配的其他职责，包括但不限于：处理到货、为产品标明价格或者贴标签、进行实际存货检查和进行商品美观成列。 <br />6.确保销售流程的执行，在工作中贯彻耐克公司零售的标准、宗旨和目标。 <br />7.根据需要，为其它部门提供支持。 <br /><br /><br />职责要求 <br /><br />1.高中或中专以上学历。 <br />2.良好的沟通、表达能力。 <br />3.以服务为导向。 <br />4.能适应快节奏的工作环境，工作效率高。 <br />5.富有朝气，热爱体育。 <br />6.能够接受排班，完成在夜间、周末和一些假期的工作。 <br />7.有零售业或服装销售经验者优先。 </div><br />\r\n<div>工作地点： 北京市朝阳区甜水园北里16号楼4层</div>\r\n<div>\r\n<p>薪资结构：基本工资（一般情况下，新入职员工都是II级工资1800元/月）+饭补150元/月+奖金（以550元/月为限，每月根据店铺运营情况及个人表现评定奖金金额）+年终双薪。</p></div></div></td></tr></tbody></table></div>', 1332837004, 1332777600, 1364227200, 1, 1332838415);
INSERT INTO `zp_jobs` (`id`, `cid`, `scid`, `title`, `live_gnd_p`, `live_gnd_c`, `live_address`, `funtype_1`, `funtype_2`, `dustrytype_1`, `dustrytype_2`, `company_type`, `company_scale`, `company_properties`, `gender`, `language`, `money`, `jobterm`, `degree`, `pnum`, `work_exp`, `jtext`, `createtime`, `startdate`, `enddate`, `status`, `modifydate`) VALUES
(26, 6, 0, 'Nike耐克直营店店员（蓝色港湾店）', 1, 419, '朝阳公园路6号蓝色港湾购物中心M-7NIKE专卖店', 3, 4, 0, 0, 1, 3, 0, 1, 10, 3, 1, 9, 0, 0, '<p>\r\n<table class="jobs_1" cellspacing="0" cellpadding="0" width="98%" align="center" border="0">\r\n<tbody>\r\n<tr>\r\n<td class="job_detail" style="WIDTH: 100%" colspan="6"><strong>职位职能:</strong>&nbsp;&nbsp;店员/营业员&nbsp;&nbsp; </td></tr>\r\n<tr>\r\n<td class="txt_4 wordBreakNormal job_detail " style="WIDTH: 100%" colspan="6"><strong>职位描述:</strong><br />\r\n<div style="PADDING-BOTTOM: 30px">\r\n<div>ADP人力资源服务有限公司是经上海市劳动和社会保障局、上海市人事局许可，注册成立的一家专业的人力资源服务公司专业从事人才租赁、人事外包、人才中介、培训等人力资源服务项目. ADP凭借拥有十多年人力资源专业工作经验及对不同行业人力资源管理的深入理解，坚持立足市场发展的前沿，ADP作为耐克公司的人事外包公司，现诚聘以下人才派遣至耐克全国各大门店工作. <br /><br />职责描述 <br /><br />1.以优质服务和专业知识满足顾客需求，达成销售目标 <br />3.协助顾客获取产品资料。 <br />4.保持店内整洁美观、备货、协助清洁工作。 <br />5.履行分配的其他职责，包括但不限于：处理到货、为产品标明价格或者贴标签、进行实际存货检查和进行商品美观成列。 <br />6.确保销售流程的执行，在工作中贯彻耐克公司零售的标准、宗旨和目标。 <br />7.根据需要，为其它部门提供支持。 <br /><br /><br />职责要求 <br /><br />1.高中或中专以上学历。 <br />2.良好的沟通、表达能力。 <br />3.以服务为导向。 <br />4.能适应快节奏的工作环境，工作效率高。 <br />5.富有朝气，热爱体育。 <br />6.能够接受排班，完成在夜间、周末和一些假期的工作。 <br />7.有零售业或服装销售经验者优先。 </div><br />\r\n<div>工作地点：朝阳区朝阳公园路6号蓝色港湾购物中心M-7NIKE专卖店</div>\r\n<div>\r\n<p>薪资结构：基本工资（一般情况下，新入职员工都是II级工资1800元/月）+饭补150元/月+奖金（以550元/月为限，每月根据店铺运营情况及个人表现评定奖金金额）+年终双薪。</p></div></div></td></tr></tbody></table></p>', 1332837096, 1332777600, 1364227200, 1, 1332837096),
(27, 6, 0, 'Nike耐克直营店店员（石景山万达店）', 1, 429, '石景山路乙18号院4号楼一层西侧', 3, 4, 0, 0, 1, 3, 0, 1, 10, 3, 1, 9, 0, 0, '<p>\r\n<table class="jobs_1" cellspacing="0" cellpadding="0" width="98%" align="center" border="0">\r\n<tbody>\r\n<tr>\r\n<td class="job_detail" style="WIDTH: 100%" colspan="6"><strong>职位职能:</strong>&nbsp;&nbsp;店员/营业员&nbsp;&nbsp; </td></tr>\r\n<tr>\r\n<td class="txt_4 wordBreakNormal job_detail " style="WIDTH: 100%" colspan="6"><strong>职位描述:</strong><br />\r\n<div style="PADDING-BOTTOM: 30px">\r\n<div>ADP人力资源服务有限公司是经上海市劳动和社会保障局、上海市人事局许可，注册成立的一家专业的人力资源服务公司专业从事人才租赁、人事外包、人才中介、培训等人力资源服务项目. ADP凭借拥有十多年人力资源专业工作经验及对不同行业人力资源管理的深入理解，坚持立足市场发展的前沿，ADP作为耐克公司的人事外包公司，现诚聘以下人才派遣至耐克全国各大门店工作. <br /><br />职责描述 <br /><br />1.以优质服务和专业知识满足顾客需求，达成销售目标 <br />2.协助顾客获取产品资料。 <br />3.保持店内整洁美观、备货、协助清洁工作。 <br />4.履行分配的其他职责，包括但不限于：处理到货、为产品标明价格或者贴标签、进行实际存货检查和进行商品美观成列。 <br />5.确保销售流程的执行，在工作中贯彻耐克公司零售的标准、宗旨和目标。 <br />6.根据需要，为其它部门提供支持。 <br /><br /><br />职责要求 <br /><br />1.高中或中专以上学历。 <br />2.良好的沟通、表达能力。 <br />3.以服务为导向。 <br />4.能适应快节奏的工作环境，工作效率高。 <br />5.富有朝气，热爱体育。 <br />6.能够接受排班，完成在夜间、周末和一些假期的工作。 <br />7.有零售业或服装销售经验者优先。 </div><br />\r\n<div>工作地点：北京市石景山区石景山路乙18号院4号楼一层西侧 </div>\r\n<div>薪资架构：基本工资（一般情况下，新入职员工都是II级工资1800元/月）+饭补150元/月+奖金（以550元/月为限，每月根据店铺运营情况及个人表现评定奖金金额）+年终双薪。</div></div></td></tr></tbody></table></p>', 1332837168, 1332777600, 1364227200, 1, 1332837168),
(28, 6, 0, 'Nike耐克直营店店员（香槟店）', 1, 419, NULL, 3, 4, 0, 0, 1, 3, 0, 1, 10, 3, 1, 9, 0, 0, '<p>\r\n<table class="jobs_1" cellspacing="0" cellpadding="0" width="98%" align="center" border="0">\r\n<tbody>\r\n<tr>\r\n<td class="job_detail" style="WIDTH: 100%" colspan="6"><strong>职位职能:</strong>&nbsp;&nbsp;店员/营业员&nbsp;&nbsp; </td></tr>\r\n<tr>\r\n<td class="txt_4 wordBreakNormal job_detail " style="WIDTH: 100%" colspan="6"><strong>职位描述:</strong><br />\r\n<div style="PADDING-BOTTOM: 30px">\r\n<div>ADP人力资源服务有限公司是经上海市劳动和社会保障局、上海市人事局许可，注册成立的一家专业的人力资源服务公司专业从事人才租赁、人事外包、人才中介、培训等人力资源服务项目. ADP凭借拥有十多年人力资源专业工作经验及对不同行业人力资源管理的深入理解，坚持立足市场发展的前沿，ADP作为耐克公司的人事外包公司，现诚聘以下人才派遣至耐克全国各大门店工作. <br /><br />职责描述 <br /><br />1.以优质服务和专业知识满足顾客需求，达成销售目标 <br />2. 协助顾客获取产品资料。 <br />3.保持店内整洁美观、备货、协助清洁工作。 <br />4.履行分配的其他职责，包括但不限于：处理到货、为产品标明价格或者贴标签、进行实际存货检查和进行商品美观成列。 <br />5.确保销售流程的执行，在工作中贯彻耐克公司零售的标准、宗旨和目标。 <br />6.根据需要，为其它部门提供支持。 <br /></div>\r\n<div>工作地点：北京朝阳路北五环来广营香槟路66-1号<br /><br />职责要求 <br /><br />1.高中或中专以上学历。 <br />2.良好的沟通、表达能力。 <br />3.以服务为导向。 <br />4.能适应快节奏的工作环境，工作效率高。 <br />5.富有朝气，热爱体育。 <br />6. 能够接受排班，完成在夜间、周末和一些假期的工作。 <br />7.有零售业或服装销售经验者优先。 </div><br />\r\n<div>工作地点：北京市朝阳区北五环广顺桥西北角欧尚超市一层</div>\r\n<div>薪资架构：基本工资（一般情况下，新入职员工都是II级工资1800元/月）+饭补150元/月+奖金（以550元/月为限，每月根据店铺运营情况及个人表现评定奖金金额）+年终双薪。</div></div></td></tr></tbody></table></p>', 1332837320, 1332777600, 1364227200, 1, 1332837320),
(29, 4, 0, ' ctjob', 1, 418, NULL, 3, 4, 0, 0, 1, 1, 0, 1, 9, 1, 1, 1, 0, 0, 'ctjob', 1333954303, 1333900800, 1336406400, 0, 1333954303);

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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `zp_jobs_template`
--

INSERT INTO `zp_jobs_template` (`id`, `cid`, `scid`, `title`, `live_gnd_p`, `live_gnd_c`, `live_address`, `funtype_1`, `funtype_2`, `dustrytype_1`, `dustrytype_2`, `company_type`, `company_scale`, `company_properties`, `gender`, `language`, `money`, `jobterm`, `degree`, `pnum`, `work_exp`, `jtext`, `createtime`, `startdate`, `enddate`, `modifydate`) VALUES
(1, 2, 0, '高速复印机销售', 1, 419, NULL, 18, 22, 0, 0, 2, 3, 0, 1, 9, 10, 1, 8, 0, 4, '<p>主要职责： <br />-负责开发所属行业，区域内的客户 <br />-负责所属范围内直接用户的深度挖掘，业务推广及销售工作 <br />-根据客户实际情况制定解决方案 <br />-独立完成合同的签订、货款的回收 <br />-完成公司下达的各项业务指标 <br />-完成部门领导安排的其他工作 </p>\r\n<p>工作经验要求： <br />-印刷专业或营销专业大专以上学历 <br />-在印刷或OA行业从事销售工作3年以上 <br />-具备网络、软件应用等方面的知识 <br />-熟练使用OFFICE软件 <br />-35岁以下</p>', 1331794359, 1331740800, 1339603200, 1331794359),
(2, 6, 0, 'Nike耐克直营店库管（北京）', 1, 419, NULL, 3, 14, 0, 0, 1, 3, 0, 1, 10, 3, 1, 10, 0, 0, '<span style="WORD-SPACING: 0px; FONT: 12px/18px 宋体, ''Courier New''; TEXT-TRANSFORM: none; COLOR: rgb(0,0,0); TEXT-INDENT: 0px; WHITE-SPACE: normal; LETTER-SPACING: normal; BACKGROUND-COLOR: rgb(255,255,255); orphans: 2; widows: 2; webkit-text-decorations-in-effect: none; webkit-text-size-adjust: auto; webkit-text-stroke-width: 0px">\r\n</span><div style="FONT-SIZE: 12px; LINE-HEIGHT: 1.5">ADP人力资源服务有限公司是经上海市劳动和社会保障局、上海市人事局许可，注册成立的一家专业的人力资源服务公司专业从事人才租赁、人事外包、人才中介、培训等人力资源服务项目. ADP凭借拥有十多年人力资源专业工作经验及对不同行业人力资源管理的深入理解，坚持立足市场发展的前沿，ADP作为耐克公司的人事外包公司，现诚聘以下人才派遣至耐克全国各大门店工作.<span>&nbsp;</span><br style="FONT-SIZE: 12px" /><br style="FONT-SIZE: 12px" />职责描述<span>&nbsp;</span><br style="FONT-SIZE: 12px" /><br style="FONT-SIZE: 12px" />1.以优质服务和专业知识满足顾客需求，达成销售目标<span>&nbsp;</span><br style="FONT-SIZE: 12px" />3.协助顾客获取产品资料。<span>&nbsp;</span><br style="FONT-SIZE: 12px" />4.保持店内整洁美观、备货、协助清洁工作。<span>&nbsp;</span><br style="FONT-SIZE: 12px" />5.履行分配的其他职责，包括但不限于：处理到货、为产品标明价格或者贴标签、进行实际存货检查和进行商品美观成列。<span>&nbsp;</span><br style="FONT-SIZE: 12px" />6.确保销售流程的执行，在工作中贯彻耐克公司零售的标准、宗旨和目标。<span>&nbsp;</span><br style="FONT-SIZE: 12px" />7.根据需要，为其它部门提供支持。<span>&nbsp;</span><br style="FONT-SIZE: 12px" /><br style="FONT-SIZE: 12px" /><br style="FONT-SIZE: 12px" />职责要求<span>&nbsp;</span><br style="FONT-SIZE: 12px" /><br style="FONT-SIZE: 12px" />1.高中或中专以上学历。<span>&nbsp;</span><br style="FONT-SIZE: 12px" />2.良好的沟通、表达能力。<span>&nbsp;</span><br style="FONT-SIZE: 12px" />3.以服务为导向。<span>&nbsp;</span><br style="FONT-SIZE: 12px" />4.能适应快节奏的工作环境，工作效率高。<span>&nbsp;</span><br style="FONT-SIZE: 12px" />5.富有朝气，热爱体育。<span>&nbsp;</span><br style="FONT-SIZE: 12px" />6.能够接受排班，完成在夜间、周末和一些假期的工作。<span>&nbsp;</span><br style="FONT-SIZE: 12px" />7.有零售业或服装销售经验者优先。</div><br style="FONT-SIZE: 12px" />\r\n<div style="FONT-SIZE: 12px; LINE-HEIGHT: 1.5">工作地点：</div>\r\n<div style="FONT-SIZE: 12px; LINE-HEIGHT: 1.5">1.北京市朝阳区甘露园南里25号8号楼二层237-238-239-240-241-242-243-244号商铺<span>&nbsp;</span><br style="FONT-SIZE: 12px" />2.北京工体北路三里屯路口S8号楼8单元1&amp;2层<span>&nbsp;</span><br style="FONT-SIZE: 12px" />3.北京市朝阳区朝阳公园路6号solana购物中心1栋广场层M-7号商铺<span>&nbsp;</span><br style="FONT-SIZE: 12px" />4.北京市朝阳区来广营欧尚超市一层</div><br style="FONT-SIZE: 12px" />\r\n<div style="FONT-SIZE: 12px; LINE-HEIGHT: 1.5">薪资架构：基本工资（一般情况下，新入职员工都是II级工资1800元/月）+饭补150元/月+奖金（以550元/月为限，每月根据店铺运营情况及个人表现评定奖金金额）+年终双薪。</div>', 1332832949, 1332777600, 1340640000, 1332832949);

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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `zp_mailtask`
--

INSERT INTO `zp_mailtask` (`id`, `taskname`, `templateid`, `usertype`, `sendfrequency`, `status`, `action`, `createdate`) VALUES
(1, '找回密码邮件', 2, 'common', 0, 'show', 'find', 1274429478),
(4, '注册邮件', 1, 'person,company', 0, 'show', 'reg', 1305194774),
(5, '邀请应聘者', 3, 'person,company', 0, 'show', 'invite', 1305792157),
(6, '企业注册时', 4, 'person,company', 0, 'show', 'inviteleader', 1331488006);

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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `zp_mailtemplate`
--

INSERT INTO `zp_mailtemplate` (`id`, `name`, `mailsubject`, `mailcontent`, `status`, `createdate`) VALUES
(1, '会员注册模板', '欢迎加入“视一视”', '<p></p><div style="font-family: Helvetica; white-space: normal; "><span style="font-size:x-small;color:#0000ff;"></span><div style="font-family: Helvetica; white-space: normal; "><div style="font-size:small; "><span style="font-size:x-small;color:#0000ff;">亲爱的用户：</span></div><div style="font-size:small; "><span style="font-size:x-small;color:#0000ff;">您已成功注册“视一视”网站会员，“视一视”将成为您职业生涯中寻找心怡工作的贴心伙伴。</span></div><div style="font-size:small; "><span style="font-size:x-small;color:#0000ff;">您将获得“视一视”如下服务：</span></div><ul style="font-size:small; "><li><span style="font-size:x-small;color:#0000ff;">使用您注册时的邮箱地址及密码登录，进入个人中心；</span></li><li><span style="font-size:x-small;color:#0000ff;">填写、上传文字简历及使用“视一视”专用录播工具SYSplayer录制、上传您的视频简历；</span></li><li><span style="font-size:x-small;color:#0000ff;">系统默认您的求职状态为“免打扰”，如求职，请更改您的状态为“求职”状态；</span></li><li><span style="font-size:x-small;color:#0000ff;">浏览招聘信息，自主投递职位；</span></li><li><span style="font-size:x-small;color:#0000ff;">求职信息接受本站所有招聘单位的搜索；</span></li><li><span style="font-size:x-small;color:#0000ff;">参与“推广计划”，获得“积分换现金”的推广奖励。</span></li></ul><div style="font-size:small; "><span style="font-size:x-small;color:#0000ff;">感谢您成为“视一视”会员，祝您找到称心如意的工作！</span></div><div style="font-size:small; "><span style="font-size:x-small;color:#0000ff;"></span>&nbsp;</div><div style="font-size:small; "><span style="font-size:x-small;color:#0000ff;">服务电话：010-51316183 邮箱：<a href="mailto:admin@shiyishi.cn">admin@shiyishi.cn</a></span></div><div style="font-size:small; "><span style="font-size:x-small;color:#0000ff;"></span>&nbsp;</div></div></div><p></p>', 'show', 1271602886),
(2, '会员找回密码邮件', '您使用了视一视的密码找回功能-{用户名}', '<p>Hi,{用户名}: </p>\r\n<blockquote style="MARGIN-RIGHT: 0px" dir="ltr">\r\n<p><br />您在视一视的登录密码已经重置，新密码为：</p>\r\n<blockquote style="MARGIN-RIGHT: 0px" dir="ltr">\r\n<p>请牢记：{用户密码}</p>\r\n<p><br /></p>\r\n<p align="left">任何问题欢迎您致电或邮件联系客服。<br /></p>\r\n<p align="left"><br /></p>\r\n<p align="left"><br /></p></blockquote></blockquote>', 'show', 1274413509),
(3, '邀请发送邮件通知', '{企业}邀请您参加视频面试', '<p>{姓名}：</p>\r\n<blockquote style="MARGIN-RIGHT: 0px" dir="ltr">\r\n<p>{企业}邀请您于{时间}参加在线面试 <a href="http://www.shiyishi.cn/">http://www.shiyishi.cn/</a>，请按时参加。</p></blockquote>', 'show', 1305791251),
(4, '企业注册模版', '欢迎加入“视一视”', '<div style="font-family: Helvetica; white-space: normal;font-size:small; "><span style="font-size:x-small;color:#0000ff;">亲爱的用户：</span></div><div style="font-family: Helvetica; white-space: normal;font-size:small; "><span style="font-size:x-small;color:#0000ff;"></span>&nbsp;</div><div style="font-family: Helvetica; white-space: normal;font-size:small; "><span style="font-size:x-small;color:#0000ff;">您已成功注册“视一视”网站，“视一视”将成为您满意的招聘助手。</span></div><div style="font-family: Helvetica; white-space: normal;font-size:small; "><span style="font-size:x-small;color:#0000ff;"></span>&nbsp;</div><div style="font-family: Helvetica; white-space: normal;font-size:small; "><span style="font-size:x-small;color:#0000ff;">您登录的：用户名：</span><span style="color: rgb(0, 0, 255);font-size:x-small; ">{企业注册名}</span></div><div style="font-family: Helvetica; white-space: normal;font-size:small; "><span style="font-size:x-small;color:#0000ff;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 密码：666666</span></div><div style="font-family: Helvetica; white-space: normal;font-size:small; "><span style="font-size:x-small;color:#0000ff;"></span>&nbsp;</div><div style="font-family: Helvetica; white-space: normal;font-size:small; "><span style="font-size:x-small;color:#0000ff;">请您登录后在企业中心及时修改密码，以保证您的信息安全。</span></div><div style="font-family: Helvetica; white-space: normal;font-size:small; "><span style="font-size:x-small;color:#0000ff;"></span>&nbsp;</div><div style="font-family: Helvetica; white-space: normal;font-size:small; "><span style="font-size:x-small;color:#0000ff;">非常感谢您成为“视一视”企业会员，“视一视”将竭诚为您提供满意的服务。</span></div><div style="font-family: Helvetica; white-space: normal;font-size:small; "><span style="font-size:x-small;color:#0000ff;"></span><div><span style="font-size:x-small;color:#0000ff;">服务电话：010-51316183 邮箱：<a href="mailto:admin@shiyishi.cn">admin@shiyishi.cn</a></span></div></div>', 'show', 1331487759);

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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `zp_myjob_int`
--

INSERT INTO `zp_myjob_int` (`id`, `aid`, `uid`, `gender`, `eid`, `jobid`, `isnew`, `status`, `interview_type`, `interview_date`, `interview_enddate`, `invite_date`) VALUES
(1, 1, 22, 1, 4, 29, 1, 1, 2, 1335628800, 1335632400, '2012-04-29 00:04:55');

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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=20 ;

--
-- Dumping data for table `zp_myjob_pos`
--

INSERT INTO `zp_myjob_pos` (`id`, `uid`, `eid`, `jobid`, `status`, `job_expiry_date`, `apply_date`) VALUES
(1, 12, 6, 22, 1, 1364227200, '2012-03-30 11:52:10'),
(2, 12, 6, 28, 1, 1364227200, '2012-03-30 11:53:14'),
(3, 11, 6, 22, 1, 1364227200, '2012-03-30 12:06:59'),
(4, 11, 6, 28, 1, 1364227200, '2012-03-30 12:07:09'),
(5, 10, 6, 22, 1, 1364227200, '2012-03-30 12:20:02'),
(6, 10, 6, 26, 1, 1364227200, '2012-03-30 12:20:19'),
(7, 10, 6, 15, 1, 1364227200, '2012-03-30 12:20:31'),
(8, 13, 6, 27, 1, 1364227200, '2012-04-09 10:59:36'),
(9, 16, 6, 18, 1, 1364227200, '2012-04-09 11:17:35'),
(10, 17, 6, 26, 1, 1364227200, '2012-04-09 11:49:53'),
(11, 18, 6, 19, 1, 1364227200, '2012-04-09 11:54:14'),
(12, 19, 6, 22, 1, 1364227200, '2012-04-09 11:57:43'),
(13, 20, 6, 22, 1, 1364227200, '2012-04-09 12:19:12'),
(14, 15, 6, 15, 1, 1364227200, '2012-04-09 13:44:21'),
(15, 15, 6, 20, 1, 1364227200, '2012-04-09 13:45:37'),
(16, 21, 6, 28, 1, 1364227200, '2012-04-09 14:32:46'),
(17, 22, 4, 29, 1, 1336406400, '2012-04-09 14:52:06'),
(18, 15, 6, 23, 1, 1364227200, '2012-04-13 16:25:39'),
(19, 25, 4, 29, 1, 1336406400, '2012-05-02 08:36:20');

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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=64 ;

--
-- Dumping data for table `zp_myjob_rviewd`
--

INSERT INTO `zp_myjob_rviewd` (`id`, `uid`, `eid`, `status`, `viewd_date`) VALUES
(1, 7, 2, 1, '2012-03-21 11:44:09'),
(2, 7, 2, 1, '2012-03-21 11:45:35'),
(3, 7, 2, 1, '2012-03-21 11:49:48'),
(4, 7, 2, 1, '2012-03-21 14:45:46'),
(5, 12, 6, 1, '2012-03-30 12:36:08'),
(6, 12, 6, 1, '2012-03-30 12:36:42'),
(7, 12, 6, 1, '2012-03-30 12:37:12'),
(8, 12, 6, 1, '2012-03-30 12:37:35'),
(9, 11, 6, 1, '2012-03-30 12:38:45'),
(10, 11, 6, 1, '2012-03-30 12:38:57'),
(11, 10, 6, 1, '2012-03-30 12:39:39'),
(12, 10, 6, 1, '2012-03-30 12:39:52'),
(13, 10, 6, 1, '2012-03-30 12:40:05'),
(14, 10, 6, 1, '2012-03-30 14:41:14'),
(15, 11, 6, 1, '2012-03-30 14:43:10'),
(16, 12, 6, 1, '2012-03-30 14:45:52'),
(17, 12, 6, 1, '2012-03-30 14:49:09'),
(18, 10, 4, 1, '2012-03-30 16:10:57'),
(19, 10, 4, 1, '2012-03-30 16:12:44'),
(20, 10, 4, 1, '2012-03-30 16:19:51'),
(21, 10, 4, 1, '2012-03-30 16:20:09'),
(22, 10, 4, 1, '2012-03-30 17:13:51'),
(23, 10, 2, 1, '2012-04-05 11:37:46'),
(24, 10, 2, 1, '2012-04-05 11:37:56'),
(25, 10, 6, 1, '2012-04-05 11:45:45'),
(26, 10, 6, 1, '2012-04-05 11:45:49'),
(27, 10, 6, 1, '2012-04-05 16:22:56'),
(28, 10, 6, 1, '2012-04-05 16:31:45'),
(29, 12, 6, 1, '2012-04-05 21:36:58'),
(30, 13, 6, 1, '2012-04-09 13:31:42'),
(31, 13, 6, 1, '2012-04-09 13:32:28'),
(32, 16, 6, 1, '2012-04-09 13:33:28'),
(33, 16, 6, 1, '2012-04-09 13:33:43'),
(34, 16, 6, 1, '2012-04-09 13:33:55'),
(35, 17, 6, 1, '2012-04-09 13:34:31'),
(36, 18, 6, 1, '2012-04-09 13:34:53'),
(37, 19, 6, 1, '2012-04-09 13:35:02'),
(38, 20, 6, 1, '2012-04-09 13:35:11'),
(39, 17, 6, 1, '2012-04-09 13:35:37'),
(40, 15, 6, 1, '2012-04-09 13:50:44'),
(41, 15, 6, 1, '2012-04-09 13:50:58'),
(42, 15, 6, 1, '2012-04-09 13:58:28'),
(43, 15, 6, 1, '2012-04-09 13:59:57'),
(44, 21, 4, 1, '2012-04-09 14:46:08'),
(45, 22, 4, 1, '2012-04-09 14:52:46'),
(46, 22, 4, 1, '2012-04-09 14:54:22'),
(47, 21, 6, 1, '2012-04-09 15:28:23'),
(48, 21, 6, 1, '2012-04-09 15:28:55'),
(49, 15, 6, 1, '2012-04-09 15:31:52'),
(50, 15, 6, 1, '2012-04-09 16:50:21'),
(51, 14, 6, 1, '2012-04-10 13:54:09'),
(52, 14, 6, 1, '2012-04-10 13:56:50'),
(53, 22, 6, 1, '2012-04-10 13:57:01'),
(54, 15, 6, 1, '2012-04-12 13:21:24'),
(55, 24, 6, 1, '2012-04-17 10:06:57'),
(56, 24, 6, 1, '2012-04-17 10:06:59'),
(57, 22, 6, 1, '2012-04-17 10:12:06'),
(58, 23, 6, 1, '2012-04-17 14:16:54'),
(59, 23, 6, 1, '2012-04-17 14:17:31'),
(60, 15, 6, 1, '2012-04-17 14:18:25'),
(61, 25, 4, 1, '2012-05-02 08:36:31'),
(62, 25, 4, 1, '2012-05-02 08:43:45'),
(63, 15, 6, 1, '2012-05-04 11:04:07');

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

INSERT INTO `zp_relink` (`id`, `title`, `url`, `img`, `orid`, `createtime`) VALUES
(2, NULL, NULL, NULL, 0, '2012-03-15 14:49:39'),
(6, NULL, NULL, NULL, 0, '2012-03-27 15:40:20');

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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=19 ;

--
-- Dumping data for table `zp_resume`
--

INSERT INTO `zp_resume` (`id`, `uid`, `rtype`, `uname`, `idcard`, `phone`, `email`, `gender`, `stature`, `weight`, `birth_year`, `birth_month`, `birth_day`, `degree`, `speciality`, `birth_gnd`, `live_gnd`, `live_address`, `jobterm`, `entrytime`, `funtype`, `dustrytype`, `salary`, `work_gnd`, `nowzt`, `status`, `introduction`, `interest`, `zycourse`, `views`, `modifydate`, `createdate`) VALUES
(1, 7, 'cn', '周雅荣', '111018719741212888', '13718986201', 'firefax@126.com', 2, '161', '60', 1974, 12, 1, '7', '汉语言文学', '1,', '1,421', NULL, '全职', '0', '18,36', ',', '3', '1,421', '在职', 1, '诚实，可靠，勤快，善于接受新事物，有团队精神，有耐心为客户服务，责任心强。', '拍摄DV', NULL, 0, 1332299587, '2012-03-21 11:13:07'),
(2, 6, 'cn', '耿爽', '110105198907249533', '15801395360', 'gengshuang1989@126.com', 1, '180', '80', 1989, 7, 24, '10', '计算机', '1,419', '1,419', '常营乡万象新天', '全职', '0', '3,4', ',', '8', '1,419', '离职', 1, '通过自己的努力给公司带来最大的收益', '运动，上网，看书', '无', 0, 1332300049, '2012-03-21 11:20:49'),
(3, 12, 'cn', '张宇', '110105198803040014', '15901086281', '736683676@qq.com', 1, '180', '60', 1988, 3, 4, '10', '服装设计与工艺', '1,419', '1,419', '十里堡东里111楼1212号', '全职', '0', '18,19', ',', '3', '1,419', '离职', 1, '性格开朗，有团队意识，踏实肯干，有一定销售能力', '足球', '', 0, 1333077778, '2012-03-30 10:56:42'),
(4, 11, 'cn', '吴云花', '342626199108242667', '15011103632', '1564778192@qq.com', 2, '159', '53', 1991, 8, 24, '9', '无', '39,153', '1,419', '三间房乡东柳巷208号', '全职', '0', '3,4', ',', '3', '1,419', '离职', 1, '能吃苦耐劳，踏实肯干', NULL, NULL, 0, 1333077702, '2012-03-30 11:21:42'),
(5, 10, 'cn', '姜美慧', '370923199111172525', '13121265607', 'jianghui35@yahoo.cn', 2, '162', '57', 1991, 11, 17, '9', '无', '42,190', '1,419', '十八里店乡老君堂村', '全职', '0', '3,4', ',', '3', '1,423', '离职', 1, '性格开朗。待人热情、真诚。工作认真负责。能吃苦耐劳。迅速适应新环境并融于其中。', '喜欢运动，听歌', NULL, 0, 1333078376, '2012-03-30 11:32:56'),
(6, 13, 'cn', '翟秋洋', '110107198708081216', '18610717503', 'zqy13146601483@qq.com', 1, '175', '60', 1987, 8, 8, '9', '高中', '1,429', '1,429', '衙门口上后街62号', '全职', '0', '3,4', ',', '3', '1,0', '离职', 1, '销售 肯做 记忆力好', NULL, NULL, 0, 1333938884, '2012-04-09 10:34:44'),
(7, 14, 'cn', '董浩', '110223198805100015', '13810945379', '5459949412@qq.com', 1, '177', '62', 1988, 5, 10, '9', '电子商务', '1,430', '1,430', NULL, '全职', '7', '3,4', ',', '3', '1,0', '在职', 1, '本人工作认真，勤奋，能够承受一定的工作压力。', NULL, NULL, 0, 1333939286, '2012-04-09 10:41:26'),
(8, 15, 'cn', '康晏境', '230703199112191018', '18701665446', '344151494@qq.com', 1, '188', '75', 1991, 12, 19, '8', '模具设计与制造', '38,123', '1,423', '久敬庄', '全职', '0', '3,4', ',', '2', '1,423', '离职', 1, '性格开朗，学习能力强，抗压力强。有团队合作精神', '听歌 ，跑步，训犬', '', 0, 1334306086, '2012-04-09 10:48:49'),
(9, 16, 'cn', '王宏磊', '110105198710086873', '13521887568', 'wanghl1008@126.com', 1, '172', '84', 1987, 10, 8, '9', '高中', '1,419', '1,419', '崔各庄乡善各庄周转房五排25号', '全职', '0', '3,4', ',', '3', '1,419', '离职', 1, '1.在华堂商场5年的工作经历，培养了我坚强的意志力，使我对店面销售工作有了一定的经验，能够适应轮班工作制。\r\n2适应能力强，具有突发事件的处理能力，具有吃苦耐劳的精神。\r\n3身心健康，学习勤奋，善于思考，乐于奉献，有良好的沟通能力。\r\n4工作认真踏实，具有高度责任心，团队精神及服务意识。', NULL, NULL, 0, 1333940410, '2012-04-09 11:00:10'),
(10, 17, 'cn', '王娇阳', '211002197911183827', '13520601616', 'allen79shj@sina.com', 2, '170', '58', 1979, 11, 18, '8', '国际经济与贸易', '36,102', '1,419', '宏燕路周庄嘉园', '全职', '0', '117,367', ',', '3', '1,419', '离职', 1, '本人性格开朗，具有团队精神，有较强的适应能力', '唱歌', NULL, 0, 1333942167, '2012-04-09 11:29:27'),
(11, 18, 'cn', '刘晨', '11010119850706151x', '13522432494', 'lc853176@sina.com', 1, '180', '78', 1985, 7, 6, '10', '散打', '1,422', '1,430', '西马庄园49楼451', '全职', '0', '3,4', ',', '3', '1,0', '离职', 1, '本人性格外向 喜欢与人打交道 动手能力比较差 ', '喜欢足球 篮球是北京国安和北京金隅的双料球迷 平时有空也和朋友一起打打篮球 有时间就跟朋友去工体看国安的比赛', '本人在什刹海体育运动学院 学习散打专业三年 获得武术二段证书 在校专业成绩良好', 0, 1333943826, '2012-04-09 11:49:47'),
(12, 19, 'cn', '李鹏飞', '142623198911123412', '18600132387', '872107795@qq.com', 1, '176', '75', 1989, 11, 12, '8', '数控技术', '34,80', '1,430', '马驹桥镇小张湾村', '全职', '0', '3,4', ',', '3', '1,430', '离职', 1, '乐观向上，为人诚恳，不足之处，即为会有间歇的头脑不聪明，', '喜欢读书、旅行及运动。', '专业包括数控编程，工程力学、大学英语等', 0, 1333943508, '2012-04-09 11:51:48'),
(13, 20, 'cn', '谢月英', '412725199103233486', '15010441401', 'xieyueying1991@yeah.net', 2, '160', '48', 1991, 3, 23, '11', '计算机', '43,19', '1,419', '酒仙桥', '全职', '0', '117,', ',', '1', '1,419', '离职', 1, '学习能力强，有团队精神，有两年收银经验', '画画，唱歌', '每天计算机的课程', 0, 1333944885, '2012-04-09 12:14:45'),
(14, 21, 'cn', '刘蕊', '110105199106140428', '13811674749', '284421857@qq.com', 2, '165', '60', 1991, 6, 14, '10', '导游', '1,419', '1,419', '北苑一号院', '全职', '0', '3,4', ',', '3', '1,419', '在职', 1, '本人热情开朗 有良好的口头表达能力 有良好的团队合作精神 能快速的适应工作环境 为人正直善良', '热爱运动 喜欢看书 游泳', NULL, 0, 1333952463, '2012-04-09 14:21:03'),
(15, 22, 'cn', 'pennb', '321234323433234', '13980987876', 'ssss123456ssssb@163.com', 1, '168', '70', 2012, 1, 1, '1', '信息管理', '1,', '1,', NULL, '全职', '0', '3,4', ',', '1', '1,0', '在职', 1, NULL, NULL, NULL, 0, 1333954199, '2012-04-09 14:49:59'),
(16, 23, 'cn', '李海静', '130925198705195242', '13811729002', 'haijing0519@163.com', 2, '166', '70', 1987, 5, 21, '9', '无', '33,69', '1,419', '平房乡亮马厂', '全职', '0', '3,5', ',', '3', '1,419', '离职', 1, '细心，责任感重', NULL, NULL, 0, 1334211137, '2012-04-12 14:12:17'),
(17, 24, 'cn', '尹福军', '231011198112053035', '15101094716', '595867665@qq.com', 1, '175', '65', 1981, 12, 5, '10', '中文', '38,126', '1,419', NULL, '全职', '7', ',', ',', '4', '1,427', '在职', 1, '    两年超市导购经验，三年的业务经验，本人性格开朗，比较喜欢参加集体活动。', '   集体项目，独立项目都比较喜欢，平时喜欢上网，桌球，登山。', NULL, 0, 1334212331, '2012-04-12 14:32:11'),
(18, 25, 'cn', 'pennc', '098798787676565', '13883747563', 'ssss123456ssssc@163.com', 1, '123', '123', 2012, 1, 1, '3', '123', '1,', '1,', NULL, '全职', '0', '18,20', ',', '1', '1,0', '在职', 1, '123', NULL, NULL, 0, 1335918935, '2012-05-02 08:35:35');

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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=20 ;

--
-- Dumping data for table `zp_resume_box`
--

INSERT INTO `zp_resume_box` (`id`, `cid`, `jid`, `rid`, `posttime`, `status`) VALUES
(1, 6, 22, 3, 1333079530, 1),
(2, 6, 28, 3, 1333079594, 1),
(3, 6, 22, 4, 1333080419, 1),
(4, 6, 28, 4, 1333080429, 1),
(5, 6, 22, 5, 1333081202, 1),
(6, 6, 26, 5, 1333081219, 1),
(7, 6, 15, 5, 1333081231, 1),
(8, 6, 27, 6, 1333940376, 1),
(9, 6, 18, 9, 1333941455, 1),
(10, 6, 26, 10, 1333943393, 1),
(11, 6, 19, 11, 1333943654, 1),
(12, 6, 22, 12, 1333943863, 1),
(13, 6, 22, 13, 1333945152, 1),
(14, 6, 15, 8, 1333950261, 1),
(15, 6, 20, 8, 1333950337, 1),
(16, 6, 28, 14, 1333953166, 1),
(17, 4, 29, 15, 1333954326, 1),
(18, 6, 23, 8, 1334305539, 1),
(19, 4, 29, 18, 1335918980, 1);

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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `zp_resume_ctf`
--

INSERT INTO `zp_resume_ctf` (`id`, `uid`, `rtype`, `awarddate`, `awardorg`, `ctfname`, `modifydate`, `createdate`) VALUES
(1, 6, 'cn', '2009-7-1', '学校', '毕业证', 0, '2012-03-21 11:20:49'),
(2, 19, 'cn', '2011-6-1', '四川省教育厅', '大专毕业证', 0, '2012-04-09 11:51:48'),
(3, 20, 'cn', '2009-8-8', '鹿邑教育局', '高中毕业证书', 0, '2012-04-09 12:14:45');

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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=14 ;

--
-- Dumping data for table `zp_resume_download`
--

INSERT INTO `zp_resume_download` (`id`, `cid`, `rid`, `posttime`, `status`, `rtype`) VALUES
(1, 6, 3, 1333082241, 1, 3),
(2, 6, 4, 1333082342, 1, 3),
(3, 6, 5, 1333082395, 1, 3),
(4, 6, 6, 1333949567, 1, 3),
(5, 6, 9, 1333949626, 1, 3),
(6, 6, 10, 1333949684, 1, 1),
(7, 6, 11, 1333949698, 1, 1),
(8, 6, 12, 1333949705, 1, 1),
(9, 6, 13, 1333949716, 1, 1),
(10, 6, 8, 1333956715, 1, 3),
(11, 4, 15, 1333954465, 1, 1),
(12, 6, 14, 1333956542, 1, 3),
(13, 4, 18, 1335919428, 1, 1);

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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=19 ;

--
-- Dumping data for table `zp_resume_edu`
--

INSERT INTO `zp_resume_edu` (`id`, `uid`, `rtype`, `fromdate`, `todate`, `schoolname`, `major`, `degree`, `modifydate`, `createdate`) VALUES
(1, 7, 'cn', '1995-7-1', '1999-7-1', '西安联合大学师范学院', '汉语言文学', '7', 0, '2012-03-21 11:13:07'),
(2, 6, 'cn', '2006-6-23', '2009-1-1', '中华商科', '计算机', '10', 0, '2012-03-21 11:20:49'),
(3, 12, 'cn', '2003-9-1', '2006-7-13', '北京市商业学校', '服装设计与工艺', '1', 1333077778, '2012-03-30 10:56:42'),
(4, 11, 'cn', '2004-9-1', '2007-6-1', '安徽省和县高中', '无', '9', 0, '2012-03-30 11:21:42'),
(5, 10, 'cn', '2007-9-1', '2010-6-9', '山东东平高级中学', '无', '9', 0, '2012-03-30 11:32:56'),
(6, 13, 'cn', '2003-9-1', '2005-7-1', '礼文中学', '高中', '9', 0, '2012-04-09 10:34:44'),
(7, 14, 'cn', '2003-9-1', '至今', '北京外事学校', '电子商务', '9', 0, '2012-04-09 10:41:26'),
(8, 15, 'cn', '2009-6-10', '2011-7-1', '北京电子科技职业学院', '模具设计与制造', '8', 1334306086, '2012-04-09 10:48:49'),
(9, 16, 'cn', '2003-9-1', '2006-6-1', '北京化工大学附属中学', '高中', '9', 0, '2012-04-09 11:00:10'),
(10, 17, 'cn', '2007-3-3', '2010-3-3', '首都经济贸易大学', '国际经济与贸易', '8', 0, '2012-04-09 11:29:27'),
(11, 18, 'cn', '2001-9-1', '2004-7-15', '北京市什刹海体育运动学院', '散打', '10', 1333943826, '2012-04-09 11:49:47'),
(12, 19, 'cn', '2008-9-1', '2011-7-1', '四川绵阳职业技术学院', '数控', '8', 0, '2012-04-09 11:51:48'),
(13, 20, 'cn', '2006-7-10', '2009-7-12', '鹿邑第三 高中', '计算机', '9', 0, '2012-04-09 12:14:45'),
(14, 21, 'cn', '2007-6-1', '2009-9-1', '东城区职业技术学校', '导游', '10', 0, '2012-04-09 14:21:03'),
(15, 22, 'cn', '2012-1-1', '至今', '同济', '信息管理', '1', 0, '2012-04-09 14:49:59'),
(16, 23, 'cn', '2002-9-1', '2005-6-1', '盐山中学', '无', '9', 0, '2012-04-12 14:12:17'),
(17, 24, 'cn', '2000-9-29', '2003-1-1', '牡丹江市师范学院', '中文', '8', 0, '2012-04-12 14:32:11'),
(18, 25, 'cn', '2012-1-1', '至今', '1234123', '1234', '1', 0, '2012-05-02 08:35:35');

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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `zp_resume_it`
--

INSERT INTO `zp_resume_it` (`id`, `uid`, `rtype`, `skillname`, `ability`, `usetime`, `modifydate`, `createdate`) VALUES
(1, 6, 'cn', 'NIT证书', '熟练', '6', 0, '2012-03-21 11:20:49'),
(2, 19, 'cn', '四川省二级', '一般', '6', 0, '2012-04-09 11:51:48'),
(3, 20, 'cn', '高级', '熟练', '6', 0, '2012-04-09 12:14:45');

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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=19 ;

--
-- Dumping data for table `zp_resume_lang`
--

INSERT INTO `zp_resume_lang` (`id`, `uid`, `rtype`, `language`, `rwability`, `lsability`, `modifydate`, `createdate`) VALUES
(1, 7, 'cn', '01', '较差', '熟练', 0, '2012-03-21 11:13:07'),
(2, 6, 'cn', '01', '一般', '一般', 0, '2012-03-21 11:20:49'),
(3, 12, 'cn', '01', '一般', '一般', 1333077778, '2012-03-30 10:56:42'),
(4, 11, 'cn', '01', '一般', '一般', 0, '2012-03-30 11:21:42'),
(5, 10, 'cn', '01', '一般', '较差', 0, '2012-03-30 11:32:56'),
(6, 13, 'cn', '01', '一般', '一般', 0, '2012-04-09 10:34:44'),
(7, 14, 'cn', '10', '熟练', '熟练', 0, '2012-04-09 10:41:26'),
(8, 15, 'cn', '01', '较差', '较差', 1334306086, '2012-04-09 10:48:49'),
(9, 16, 'cn', '01', '较差', '较差', 0, '2012-04-09 11:00:10'),
(10, 17, 'cn', '01', '一般', '熟练', 0, '2012-04-09 11:29:27'),
(11, 18, 'cn', '01', '熟练', '熟练', 1333943826, '2012-04-09 11:49:47'),
(12, 19, 'cn', '01', '一般', '一般', 0, '2012-04-09 11:51:48'),
(13, 20, 'cn', '01', '熟练', '熟练', 0, '2012-04-09 12:14:45'),
(14, 21, 'cn', '01', '一般', '一般', 0, '2012-04-09 14:21:03'),
(15, 22, 'cn', '01', '熟练', '熟练', 0, '2012-04-09 14:49:59'),
(16, 23, 'cn', '01', '一般', '一般', 0, '2012-04-12 14:12:17'),
(17, 24, 'cn', '10', '熟练', '熟练', 0, '2012-04-12 14:32:11'),
(18, 25, 'cn', '01', '熟练', '熟练', 0, '2012-05-02 08:35:35');

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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10 ;

--
-- Dumping data for table `zp_resume_vod`
--

INSERT INTO `zp_resume_vod` (`id`, `uid`, `vodurl`, `vodimg`, `views`, `status`, `modifydate`, `createdate`) VALUES
(1, 9, 'users/2012/03/21/2a9259d94f524048.flv', 'images/msdatu.jpg', 0, 0, 0, '2012-03-21 15:50:04'),
(2, 12, 'users/2012/03/30/eb8d2879f08a15eb.flv', 'images/msdatu.jpg', 0, 1, 0, '2012-03-30 12:35:11'),
(3, 11, 'users/2012/03/30/1a52b07c59ac07d9.flv', 'images/msdatu.jpg', 0, 1, 0, '2012-03-30 12:35:07'),
(4, 10, 'users/2012/03/30/c9251e7eac099d6c.flv', 'images/msdatu.jpg', 0, 1, 0, '2012-03-30 12:35:03'),
(5, 13, 'users/2012/04/09/5c3efbce88320264.flv', 'images/msdatu.jpg', 0, 1, 0, '2012-04-09 13:28:53'),
(6, 16, 'users/2012/04/09/5efdf82de35bd8b6.flv', 'images/msdatu.jpg', 0, 1, 0, '2012-04-09 13:28:23'),
(7, 15, 'users/2012/04/09/e44862fd98e71cc7.flv', 'images/msdatu.jpg', 0, 1, 0, '2012-04-09 15:31:12'),
(8, 22, 'users/2012/04/09/d125e4d7b878e796.flv', 'images/msdatu.jpg', 0, 0, 0, '2012-04-09 14:32:32'),
(9, 21, 'users/2012/04/09/268d46d0969f4a1a.flv', 'images/msdatu.jpg', 0, 1, 0, '2012-04-09 14:57:57');

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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=32 ;

--
-- Dumping data for table `zp_resume_work`
--

INSERT INTO `zp_resume_work` (`id`, `uid`, `rtype`, `fromdate`, `todate`, `company`, `companytype`, `position`, `income`, `responsiblity`, `modifydate`, `createdate`) VALUES
(1, 7, 'cn', '2004-5-1', '2010-10-1', '北京怡美讯科技发展公司', '8', '销售', '3', '负责通讯产品的销售，销售团队的培训。', 0, '2012-03-21 11:13:07'),
(2, 7, 'cn', '2001-3-1', '2004-4-1', '北京掌上网公司', '6', '客服主管', '3', '管理客户服务部门，解决客户的问题。', 0, '2012-03-21 11:13:07'),
(3, 7, 'cn', '2000-4-1', '2001-2-1', '八维图书网', '8', '编辑', '3', '图书内容和图象的采集，编辑，校对。', 0, '2012-03-21 11:13:07'),
(4, 7, 'cn', '1999-8-1', '2000-3-1', '中华文化信息网', '4', '编辑', '1', '网站内容和图象的采集，编辑，校对。', 0, '2012-03-21 11:13:07'),
(5, 6, 'cn', '2010-11-4', '2012-1-1', '班尼路', '1', '导购', '3', '负责店面基本销售，陈列，及库房整理', 0, '2012-03-21 11:20:49'),
(6, 12, 'cn', '2010-12-15', '2012-2-10', '安踏', '6', '导购', '3', '导购在中关村上班。因离家远所以辞职', 1333077778, '2012-03-30 10:56:42'),
(7, 11, 'cn', '2007-12-1', '2009-12-1', '可香儿', '6', '导购', '3', '在十里堡华堂可香儿做导购。因家里有事辞职', 0, '2012-03-30 11:21:42'),
(8, 11, 'cn', '2009-6-1', '2011-12-1', '奥索卡', '1', '导购', '3', '在四元桥西户外体育用品导购。', 0, '2012-03-30 11:21:42'),
(9, 10, 'cn', '2010-10-1', '2011-6-1', '中粮我买网', '5', '文员', '3', '在中粮我买网做文员，因公司搬迁之后离职。', 0, '2012-03-30 11:32:56'),
(10, 10, 'cn', '2011-7-1', '2012-2-20', '翠微嘉茂', '1', '导购', '3', '在翠微嘉茂TWICE店做导购', 0, '2012-03-30 11:32:56'),
(11, 13, 'cn', '2011-4-1', '2012-3-1', '三叶草', '1', '店员', '3', '支持店铺每日正常营运，合作销售，完成指标。', 0, '2012-04-09 10:34:44'),
(12, 13, 'cn', '2010-4-1', '2011-3-1', 'NIKE北京', '1', '店员', '2', '负责前场人员调度，销售，同时保证货品供应充足。库房到货和转货的整理，缺货的登记和公司协商补货的定量。', 0, '2012-04-09 10:34:44'),
(13, 14, 'cn', '2006-10-28', '至今', '北京家乐福有限公司', '3', '营业部门助理', '2', '本人在家乐福超市工作，主要负责文化用品的一些日常管理工作。', 0, '2012-04-09 10:41:26'),
(14, 15, 'cn', '2010-6-1', '2011-3-1', '天泽电力', '6', '数控学院', '2', '学习数控技术，自己操作机床', 1334306086, '2012-04-09 10:48:49'),
(15, 15, 'cn', '2011-3-5', '2011-8-9', '天宠缘犬行为俱乐部', '6', '训犬学徒，宠物美容', '3', '负责训练宠物，及维护店内运转', 1334306086, '2012-04-09 10:48:49'),
(16, 15, 'cn', '2011-9-1', '2012-2-1', '城誉农庄', '6', '销售代表', '3', '负责打开北京市场', 1334306086, '2012-04-09 10:48:49'),
(17, 15, 'cn', '2012-2-4', '2012-3-22', '智胜体育', '4', '促销 店员', '4', '销售店内物品', 1334306086, '2012-04-09 10:48:49'),
(18, 16, 'cn', '2006-6-1', '2011-12-1', '华堂商场望京店', '2', '营业员', '3', '1~日常负责订货，理货，销售。\r\n2~和厂家沟通退换货。\r\n3~票据的管理。', 0, '2012-04-09 11:00:10'),
(19, 17, 'cn', '2010-9-15', '2011-9-20', '北京科创照明有限公司', '6', '销售', '3', '销售水晶灯和家具', 0, '2012-04-09 11:29:27'),
(20, 18, 'cn', '2005-9-10', '2006-7-1', '浩沙体育健身俱乐部', '6', '器械教练', '2', '帮助会员使用器械 维护场地设施和卫生 销售课程和营养品', 1333943826, '2012-04-09 11:49:47'),
(21, 18, 'cn', '2008-4-1', '2010-10-1', '李宁专卖店', '6', '导购员', '2', '负责店里卫生和服装陈列 帮助顾客选择合适的服装', 1333943826, '2012-04-09 11:49:47'),
(22, 19, 'cn', '2011-1-1', '2012-1-1', '四川绵阳诺基亚销售部', '1', '促销员', '1', '负责店面手机及配件销售及促销期间店面布置。', 0, '2012-04-09 11:51:48'),
(23, 20, 'cn', '2010-5-3', '2011-9-17', '北京李宁体育用品销售有限公司', '5', '收银员', '3', '每天的收银结账，店铺的进销存统计，销售的录入，账务的统计，向区长报销售', 0, '2012-04-09 12:14:45'),
(24, 20, 'cn', '2011-9-24', '至今', '北京尚岑服饰有限公司', '4', '收银员', '3', '每天收银结账，活动统计，销售录入，店里盘点，一些杂碎事务', 0, '2012-04-09 12:14:45'),
(25, 21, 'cn', '2011-6-20', '2012-2-21', '耐克上海锐利体育用品', '2', '导购', '3', '为顾客提供良好的服务 保持店内卫生 完成店铺销售任务 做好货品陈列 完成按月盘点 保持货品整齐 ', 0, '2012-04-09 14:21:03'),
(26, 21, 'cn', '2010-2-23', '2011-5-23', '天津绫致服装有限公司VERO MODA', '1', '带班', '3', '为顾客提供良好的服务 保持店内卫生 完成店铺销售任务 完成个人销售任务 做好货品陈列 完成按月盘点 保持货品整洁 整理好店铺各项数据 ', 0, '2012-04-09 14:21:03'),
(27, 21, 'cn', '2009-9-5', '2010-1-1', 'ESPRIT创和捷商贸有限公司', '1', '导购', '3', '为顾客提供良好的服务 保持店内卫生 完成店铺销售任务', 0, '2012-04-09 14:21:03'),
(28, 22, 'cn', '2012-1-1', '至今', '待业', '1', '待业', '1', '待业', 0, '2012-04-09 14:49:59'),
(29, 23, 'cn', '2009-11-20', '2011-11-30', '扬基香氛北京贸易有限公司', '6', '职员', '5', '负责店铺销售，采购，店面系统培训', 0, '2012-04-12 14:12:17'),
(30, 24, 'cn', '2011-3-1', '至今', '北京中服布衣天下', '6', '业务员', '3', '  主要负责服装公司的面料推销，汇款，以及付货。', 0, '2012-04-12 14:32:11'),
(31, 25, 'cn', '2012-1-1', '至今', '123', '1', '123', '1', '1234', 0, '2012-05-02 08:35:35');

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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=26 ;

--
-- Dumping data for table `zp_user`
--

INSERT INTO `zp_user` (`id`, `email`, `password`, `username`, `userphoto`, `mobile`, `usertype`, `idcard`, `allmoney`, `allpoint`, `resume_txt`, `resume_vod`, `resume_status`, `puid`, `eid`, `jobid`, `edatetime`, `etimes`, `status`, `regip`, `regdate`) VALUES
(4, 'ssss123456ssssa@163.com', 'af75699691b3aae1169fe984f5c98f30', NULL, NULL, '13876765654', 'member', '009988989098787', 0.00, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '101.80.126.167', 1331612580),
(5, 'yt328864076@163.com', '821f1ae5b726a884575bb3900836f3d7', NULL, NULL, '18310213507', 'member', '231005198503115523', 0.00, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, '111.161.64.190', 1332296116),
(6, 'gengshuang1989@126.com', '5ecf430a4676fab8232f3ebda449c516', '耿爽', NULL, '15801395360', 'member', '110105198907249533', 0.00, 0, 1, 0, 1, 0, 0, 0, 0, 0, 1, '111.161.64.190', 1332297475),
(7, 'firefax@126.com', '056e88044b6e21e1e805f2e018e8ed67', '周雅荣', NULL, '13718986201', 'member', '111018719741212888', 0.00, 0, 1, 0, 1, 0, 0, 0, 0, 0, 1, '111.161.64.190', 1332298710),
(8, 'songyu@chinawinhr.com.cn', 'f379eaf3c831b04de153469d1bec345e', NULL, NULL, '13910985865', 'member', '110108197011104934', 0.00, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, '111.161.64.190', 1332305618),
(9, 'ssss123456ssss@163.com', 'af75699691b3aae1169fe984f5c98f30', NULL, NULL, '18600001234', 'member', '314218101010919', 0.00, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, '218.79.216.209', 1332315979),
(10, 'jianghui35@yahoo.cn', 'd9d249d2e5c5f6258db98e154683bca1', '姜美慧', NULL, '13121265607', 'member', '370923199111172525', 0.00, 0, 1, 1, 1, 0, 0, 0, 0, 0, 1, '111.161.64.187', 1333074781),
(11, '1564778192@qq.com', 'dcda4f0050997de52a8ccb1fbae69bc5', '吴云花', NULL, '15011103632', 'member', '342626199108242667', 0.00, 0, 1, 1, 1, 0, 0, 0, 0, 0, 1, '111.161.64.187', 1333074985),
(12, '736683676@qq.com', 'dc3d921598f0f1f627430bdc7d2822da', '张宇', NULL, '15901086281', 'member', '110105198803040014', 0.00, 0, 1, 1, 1, 0, 0, 0, 0, 0, 1, '111.161.64.187', 1333075035),
(13, 'zqy13146601483@qq.com', '61dcd1b13f5480cb80f4cf941973ee02', '翟秋洋', NULL, '18610717503', 'member', '110107198708081216', 0.00, 0, 1, 1, 1, 0, 0, 0, 0, 0, 1, '111.161.64.187', 1333938261),
(14, '5459949412@qq.com', 'e10adc3949ba59abbe56e057f20f883e', '董浩', NULL, '13810945379', 'member', '110223198805100015', 0.00, 0, 1, 0, 1, 0, 0, 0, 0, 0, 1, '111.161.64.187', 1333938547),
(15, '344151494@qq.com', 'a47cb9bd4b48e1a654da90a6e37fdd0b', '康晏境', NULL, '18701665446', 'member', '230703199112191018', 0.00, 0, 1, 1, 1, 0, 0, 0, 0, 0, 1, '111.161.64.187', 1333939039),
(16, 'wanghl1008@126.com', '5b1b68a9abf4d2cd155c81a9225fd158', '王宏磊', NULL, '13521887568', 'member', '110105198710086873', 0.00, 0, 1, 1, 1, 0, 0, 0, 0, 0, 1, '111.161.64.187', 1333939278),
(17, 'allen79shj@sina.com', '361633153a464830a1fe85dec5efab17', '王娇阳', NULL, '13520601616', 'member', '211002197911183827', 0.00, 0, 1, 0, 1, 0, 0, 0, 0, 0, 1, '111.161.64.187', 1333941176),
(18, 'lc853176@sina.com', 'a57b32cff476028f5b8cc336daf16fd4', '刘晨', NULL, '13522432494', 'member', '11010119850706151x', 0.00, 0, 1, 0, 1, 0, 0, 0, 0, 0, 1, '111.161.64.187', 1333942540),
(19, '872107795@qq.com', '39b9ad5c1812c50323ea1e414f533c17', '李鹏飞', NULL, '18600132387', 'member', '142623198911123412', 0.00, 0, 1, 0, 1, 0, 0, 0, 0, 0, 1, '111.161.64.187', 1333942546),
(20, 'xieyueying1991@yeah.net', '50896e553d20e54163bd00a963f53706', '谢月英', NULL, '15010441401', 'member', '412725199103233486', 0.00, 0, 1, 0, 1, 0, 0, 0, 0, 0, 1, '111.161.64.187', 1333944027),
(21, '284421857@qq.com', '850e414dadedfa6a50b18fe93312f02b', '刘蕊', NULL, '13811674749', 'member', '110105199106140428', 0.00, 0, 1, 1, 1, 0, 0, 0, 0, 0, 1, '111.161.64.187', 1333950780),
(22, 'ssss123456ssssb@163.com', 'af75699691b3aae1169fe984f5c98f30', 'pennb', NULL, '13980987876', 'member', '321234323433234', 0.00, 0, 1, 1, 1, 0, 0, 0, 0, 0, 1, '58.246.139.98', 1333952675),
(25, 'ssss123456ssssc@163.com', 'af75699691b3aae1169fe984f5c98f30', 'pennc', NULL, '13883747563', 'member', '098798787676565', 0.00, 0, 1, 0, 1, 0, 0, 0, 0, 0, 1, '58.246.139.98', 1335918905),
(23, 'haijing0519@163.com', '68943414f60144fb551597bbf8859841', '李海静', NULL, '13811729002', 'member', '130925198705195242', 0.00, 0, 1, 0, 1, 0, 0, 0, 0, 0, 1, '111.161.64.187', 1334210700),
(24, '595867665@qq.com', 'f379eaf3c831b04de153469d1bec345e', '尹福军', NULL, '15101094716', 'member', '231011198112053035', 0.00, 0, 1, 0, 1, 0, 0, 0, 0, 0, 1, '111.161.64.187', 1334212006);

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `zp_user_account`
--


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
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `zp_user_bank`
--


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
