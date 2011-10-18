-- MySQL dump 10.13  Distrib 5.5.12, for osx10.6 (i386)
--
-- Host: localhost    Database: shiyishi
-- ------------------------------------------------------
-- Server version	5.5.12

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `zp_admin`
--

DROP TABLE IF EXISTS `zp_admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zp_admin` (
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
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `zp_admin_duty`
--

DROP TABLE IF EXISTS `zp_admin_duty`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zp_admin_duty` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `duty_name` varchar(50) NOT NULL,
  `duty_link` varchar(50) NOT NULL,
  `parent_id` smallint(6) unsigned NOT NULL DEFAULT '1',
  `order_id` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `purview` text,
  PRIMARY KEY (`id`),
  KEY `parent` (`parent_id`),
  KEY `orderid` (`order_id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `zp_admin_log`
--

DROP TABLE IF EXISTS `zp_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zp_admin_log` (
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
) ENGINE=MyISAM AUTO_INCREMENT=361 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `zp_admin_log_ext`
--

DROP TABLE IF EXISTS `zp_admin_log_ext`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zp_admin_log_ext` (
  `id` int(11) unsigned NOT NULL,
  `requestvar` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `zp_admin_menu`
--

DROP TABLE IF EXISTS `zp_admin_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zp_admin_menu` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `menu_name` varchar(50) NOT NULL,
  `menu_link` varchar(255) DEFAULT '',
  `parent_id` smallint(6) unsigned NOT NULL DEFAULT '0',
  `order_id` int(8) unsigned NOT NULL DEFAULT '0',
  `has_im` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `parent` (`parent_id`),
  KEY `orderid` (`order_id`)
) ENGINE=MyISAM AUTO_INCREMENT=112 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `zp_admit`
--

DROP TABLE IF EXISTS `zp_admit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zp_admit` (
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `zp_ads`
--

DROP TABLE IF EXISTS `zp_ads`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zp_ads` (
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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `zp_app_person_interview`
--

DROP TABLE IF EXISTS `zp_app_person_interview`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zp_app_person_interview` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `aid` int(11) NOT NULL,
  `starttime` int(11) NOT NULL,
  `endtime` int(11) NOT NULL,
  `status` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `aid` (`aid`),
  KEY `status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=85 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `zp_app_video_interview`
--

DROP TABLE IF EXISTS `zp_app_video_interview`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zp_app_video_interview` (
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
) ENGINE=MyISAM AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `zp_app_video_interview_mans`
--

DROP TABLE IF EXISTS `zp_app_video_interview_mans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zp_app_video_interview_mans` (
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
) ENGINE=MyISAM AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `zp_area`
--

DROP TABLE IF EXISTS `zp_area`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zp_area` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `area_name` varchar(250) NOT NULL,
  `area_en` varchar(250) NOT NULL,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `order_id` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `type` tinyint(1) DEFAULT '0' COMMENT '1大城市，2小城市',
  PRIMARY KEY (`id`),
  KEY `parent_id` (`parent_id`),
  KEY `order_id` (`order_id`)
) ENGINE=MyISAM AUTO_INCREMENT=424 DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `zp_buy_recode`
--

DROP TABLE IF EXISTS `zp_buy_recode`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zp_buy_recode` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cid` int(11) NOT NULL COMMENT '公司id',
  `cname` int(11) NOT NULL COMMENT '公司名称',
  `uids` text CHARACTER SET ucs2 NOT NULL COMMENT '购买简历数据的序列化数组',
  `price` float NOT NULL COMMENT '交易金额',
  `ispay` int(11) NOT NULL COMMENT '是否付费',
  `datetime` int(11) NOT NULL COMMENT '购买时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `cid` (`cid`,`ispay`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `zp_chargecard`
--

DROP TABLE IF EXISTS `zp_chargecard`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zp_chargecard` (
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
) ENGINE=MyISAM DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC COMMENT='充值卡';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `zp_comment`
--

DROP TABLE IF EXISTS `zp_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zp_comment` (
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
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='演出评价';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `zp_config`
--

DROP TABLE IF EXISTS `zp_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zp_config` (
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
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `zp_contract`
--

DROP TABLE IF EXISTS `zp_contract`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zp_contract` (
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
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `zp_departments`
--

DROP TABLE IF EXISTS `zp_departments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zp_departments` (
  `id` int(11) NOT NULL,
  `cid` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `zp_dustrytype`
--

DROP TABLE IF EXISTS `zp_dustrytype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zp_dustrytype` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `thename` varchar(250) NOT NULL,
  `enname` varchar(250) NOT NULL,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `order_id` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `createdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `parent_id` (`parent_id`),
  KEY `order_id` (`order_id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `zp_e_user`
--

DROP TABLE IF EXISTS `zp_e_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zp_e_user` (
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
) ENGINE=MyISAM AUTO_INCREMENT=43 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `zp_enrolllog`
--

DROP TABLE IF EXISTS `zp_enrolllog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zp_enrolllog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `eid` int(11) NOT NULL DEFAULT '0',
  `jobid` int(11) NOT NULL DEFAULT '0',
  `uid` int(11) NOT NULL DEFAULT '0',
  `usercard` varchar(250) NOT NULL COMMENT '身份证',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `createdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `eid` (`eid`)
) ENGINE=MyISAM AUTO_INCREMENT=45 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `zp_faq`
--

DROP TABLE IF EXISTS `zp_faq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zp_faq` (
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
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `zp_faq_cat`
--

DROP TABLE IF EXISTS `zp_faq_cat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zp_faq_cat` (
  `id` int(8) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `order_id` int(8) NOT NULL DEFAULT '0',
  `createdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `zp_files`
--

DROP TABLE IF EXISTS `zp_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zp_files` (
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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `zp_friendlinks`
--

DROP TABLE IF EXISTS `zp_friendlinks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zp_friendlinks` (
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
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `zp_funtype`
--

DROP TABLE IF EXISTS `zp_funtype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zp_funtype` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `thename` varchar(250) NOT NULL,
  `enname` varchar(250) NOT NULL,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `order_id` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `createdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `parent_id` (`parent_id`),
  KEY `order_id` (`order_id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `zp_home_hdp`
--

DROP TABLE IF EXISTS `zp_home_hdp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zp_home_hdp` (
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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `zp_job_category`
--

DROP TABLE IF EXISTS `zp_job_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zp_job_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rid` int(11) NOT NULL COMMENT '根节点id',
  `pid` int(11) NOT NULL COMMENT '父分类id',
  `level` int(11) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 NOT NULL COMMENT '职务分类名称',
  PRIMARY KEY (`id`),
  KEY `rid` (`rid`,`pid`),
  KEY `level` (`level`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `zp_jobs`
--

DROP TABLE IF EXISTS `zp_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zp_jobs` (
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
) ENGINE=MyISAM AUTO_INCREMENT=47 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `zp_jobs_template`
--

DROP TABLE IF EXISTS `zp_jobs_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zp_jobs_template` (
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
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `zp_leader`
--

DROP TABLE IF EXISTS `zp_leader`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zp_leader` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `eid` int(11) NOT NULL DEFAULT '0',
  `roomid` int(11) NOT NULL DEFAULT '0',
  `room` varchar(250) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `startdate` int(10) NOT NULL DEFAULT '0',
  `enddate` int(10) NOT NULL DEFAULT '0',
  `passwd` varchar(250) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `zp_mailconfig`
--

DROP TABLE IF EXISTS `zp_mailconfig`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zp_mailconfig` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `m_key` varchar(250) NOT NULL,
  `m_value` varchar(250) NOT NULL,
  `m_type` enum('local','smtp') NOT NULL DEFAULT 'local',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `zp_mailtask`
--

DROP TABLE IF EXISTS `zp_mailtask`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zp_mailtask` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `taskname` varchar(250) NOT NULL,
  `templateid` int(11) NOT NULL DEFAULT '0',
  `usertype` varchar(255) NOT NULL DEFAULT 'person,company',
  `sendfrequency` int(11) NOT NULL DEFAULT '0' COMMENT '发送频率 天为单位',
  `status` enum('show','hide') NOT NULL DEFAULT 'show',
  `action` enum('auto','reg','act','invite','inviteleader','find') NOT NULL DEFAULT 'auto' COMMENT '发送行为 auto自动，reg注册时发送',
  `createdate` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `zp_mailtemplate`
--

DROP TABLE IF EXISTS `zp_mailtemplate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zp_mailtemplate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(250) NOT NULL,
  `mailsubject` varchar(250) NOT NULL,
  `mailcontent` text NOT NULL,
  `status` enum('show','hide') NOT NULL DEFAULT 'show',
  `createdate` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `zp_major`
--

DROP TABLE IF EXISTS `zp_major`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zp_major` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `thename` varchar(250) NOT NULL,
  `enname` varchar(250) NOT NULL,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `order_id` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `createdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `parent_id` (`parent_id`),
  KEY `order_id` (`order_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `zp_myjob_int`
--

DROP TABLE IF EXISTS `zp_myjob_int`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zp_myjob_int` (
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
) ENGINE=MyISAM AUTO_INCREMENT=140 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `zp_myjob_pos`
--

DROP TABLE IF EXISTS `zp_myjob_pos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zp_myjob_pos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) unsigned NOT NULL DEFAULT '0',
  `eid` int(11) unsigned NOT NULL DEFAULT '0',
  `jobid` int(11) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1有效0删除',
  `job_expiry_date` int(10) NOT NULL DEFAULT '0',
  `apply_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=55 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `zp_myjob_rviewd`
--

DROP TABLE IF EXISTS `zp_myjob_rviewd`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zp_myjob_rviewd` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) unsigned NOT NULL DEFAULT '0',
  `eid` int(11) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1有效0删除',
  `viewd_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=711 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `zp_news`
--

DROP TABLE IF EXISTS `zp_news`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zp_news` (
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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `zp_news_cat`
--

DROP TABLE IF EXISTS `zp_news_cat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zp_news_cat` (
  `id` int(8) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `order_id` int(8) NOT NULL DEFAULT '0',
  `createdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `zp_online_resume`
--

DROP TABLE IF EXISTS `zp_online_resume`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zp_online_resume` (
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
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `zp_p_user`
--

DROP TABLE IF EXISTS `zp_p_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zp_p_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8 NOT NULL,
  `password` varchar(255) CHARACTER SET utf8 NOT NULL,
  `email` varchar(255) CHARACTER SET utf8 NOT NULL,
  `createtime` int(11) NOT NULL,
  `lasttime` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `zp_pages`
--

DROP TABLE IF EXISTS `zp_pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zp_pages` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `pagename` varchar(50) NOT NULL,
  `pagetitle` varchar(254) NOT NULL,
  `content` text NOT NULL,
  `status` enum('show','hide') NOT NULL DEFAULT 'show',
  `template` varchar(254) NOT NULL,
  `createdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `status` (`status`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `zp_purview`
--

DROP TABLE IF EXISTS `zp_purview`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zp_purview` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `purview_name` varchar(50) NOT NULL DEFAULT '',
  `purview_link` varchar(255) NOT NULL DEFAULT '',
  `parent_id` smallint(6) unsigned NOT NULL DEFAULT '0',
  `order_id` int(8) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `parent` (`parent_id`),
  KEY `orderid` (`order_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `zp_relink`
--

DROP TABLE IF EXISTS `zp_relink`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zp_relink` (
  `id` int(11) NOT NULL,
  `title` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `url` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `img` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `orid` int(11) NOT NULL,
  `createtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `orid` (`orid`)
) ENGINE=MyISAM AUTO_INCREMENT=44 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `zp_resume`
--

DROP TABLE IF EXISTS `zp_resume`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zp_resume` (
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
  PRIMARY KEY (`id`),
  UNIQUE KEY `uid` (`uid`)
) ENGINE=MyISAM AUTO_INCREMENT=49 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `zp_resume_box`
--

DROP TABLE IF EXISTS `zp_resume_box`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zp_resume_box` (
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
) ENGINE=MyISAM AUTO_INCREMENT=53 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `zp_resume_buy`
--

DROP TABLE IF EXISTS `zp_resume_buy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zp_resume_buy` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cid` int(11) NOT NULL COMMENT '公司id',
  `rid` int(11) NOT NULL COMMENT '简历id',
  `istext` int(11) NOT NULL COMMENT '是否购买文字简历',
  `isvideo` int(11) NOT NULL COMMENT '是否购买视频简历',
  `buytime` int(11) NOT NULL COMMENT '购买时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `cid` (`cid`,`rid`,`istext`,`isvideo`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `zp_resume_ctf`
--

DROP TABLE IF EXISTS `zp_resume_ctf`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zp_resume_ctf` (
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
) ENGINE=MyISAM AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `zp_resume_download`
--

DROP TABLE IF EXISTS `zp_resume_download`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zp_resume_download` (
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
) ENGINE=MyISAM AUTO_INCREMENT=59 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `zp_resume_edu`
--

DROP TABLE IF EXISTS `zp_resume_edu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zp_resume_edu` (
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
) ENGINE=MyISAM AUTO_INCREMENT=41 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `zp_resume_it`
--

DROP TABLE IF EXISTS `zp_resume_it`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zp_resume_it` (
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
) ENGINE=MyISAM AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `zp_resume_lang`
--

DROP TABLE IF EXISTS `zp_resume_lang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zp_resume_lang` (
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
) ENGINE=MyISAM AUTO_INCREMENT=50 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `zp_resume_lock`
--

DROP TABLE IF EXISTS `zp_resume_lock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zp_resume_lock` (
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `zp_resume_price`
--

DROP TABLE IF EXISTS `zp_resume_price`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zp_resume_price` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `jid` int(11) NOT NULL COMMENT '简历类别id',
  `t_price` float NOT NULL COMMENT '文字简历价格',
  `v_price` float NOT NULL COMMENT '视频简历价格',
  PRIMARY KEY (`id`),
  UNIQUE KEY `jid` (`jid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `zp_resume_tmp`
--

DROP TABLE IF EXISTS `zp_resume_tmp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zp_resume_tmp` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cid` int(11) NOT NULL,
  `rid` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `createdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `cid` (`cid`,`rid`),
  KEY `status` (`status`)
) ENGINE=MyISAM AUTO_INCREMENT=65 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `zp_resume_vod`
--

DROP TABLE IF EXISTS `zp_resume_vod`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zp_resume_vod` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) unsigned NOT NULL DEFAULT '0',
  `vodurl` varchar(255) NOT NULL,
  `vodimg` varchar(255) NOT NULL,
  `views` int(11) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `modifydate` int(10) unsigned NOT NULL DEFAULT '0',
  `createdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=40 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `zp_resume_work`
--

DROP TABLE IF EXISTS `zp_resume_work`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zp_resume_work` (
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
) ENGINE=MyISAM AUTO_INCREMENT=47 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `zp_subcompany`
--

DROP TABLE IF EXISTS `zp_subcompany`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zp_subcompany` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cid` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `createdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `cid` (`cid`,`name`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `zp_user`
--

DROP TABLE IF EXISTS `zp_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zp_user` (
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
) ENGINE=MyISAM AUTO_INCREMENT=100 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `zp_user_account`
--

DROP TABLE IF EXISTS `zp_user_account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zp_user_account` (
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
) ENGINE=MyISAM AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `zp_user_bank`
--

DROP TABLE IF EXISTS `zp_user_bank`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zp_user_bank` (
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
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `zp_user_point`
--

DROP TABLE IF EXISTS `zp_user_point`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zp_user_point` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL DEFAULT '0',
  `points` int(10) NOT NULL DEFAULT '0',
  `doact` tinyint(2) NOT NULL DEFAULT '0',
  `aclog` varchar(254) DEFAULT NULL,
  `createdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping routines for database 'shiyishi'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2011-10-18 16:41:04
