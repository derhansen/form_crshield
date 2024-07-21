-- MySQL dump 10.13  Distrib 5.7.44, for osx10.17 (x86_64)
--
-- Host: 127.0.0.1    Database: typo3_formcrshield_acceptance_v13
-- ------------------------------------------------------
-- Server version	8.0.31

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
-- Table structure for table `backend_layout`
--

DROP TABLE IF EXISTS `backend_layout`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `backend_layout` (
  `uid` int unsigned NOT NULL AUTO_INCREMENT,
  `pid` int unsigned NOT NULL DEFAULT '0',
  `tstamp` int unsigned NOT NULL DEFAULT '0',
  `crdate` int unsigned NOT NULL DEFAULT '0',
  `deleted` smallint unsigned NOT NULL DEFAULT '0',
  `hidden` smallint unsigned NOT NULL DEFAULT '0',
  `sorting` int NOT NULL DEFAULT '0',
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `t3ver_oid` int unsigned NOT NULL DEFAULT '0',
  `t3ver_wsid` int unsigned NOT NULL DEFAULT '0',
  `t3ver_state` smallint NOT NULL DEFAULT '0',
  `t3ver_stage` int NOT NULL DEFAULT '0',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `config` longtext COLLATE utf8mb4_unicode_ci DEFAULT (NULL),
  `icon` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`uid`),
  KEY `parent` (`pid`,`deleted`,`hidden`),
  KEY `t3ver_oid` (`t3ver_oid`,`t3ver_wsid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `be_groups`
--

DROP TABLE IF EXISTS `be_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `be_groups` (
  `uid` int unsigned NOT NULL AUTO_INCREMENT,
  `pid` int unsigned NOT NULL DEFAULT '0',
  `tstamp` int unsigned NOT NULL DEFAULT '0',
  `crdate` int unsigned NOT NULL DEFAULT '0',
  `deleted` smallint unsigned NOT NULL DEFAULT '0',
  `hidden` smallint unsigned NOT NULL DEFAULT '0',
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `non_exclude_fields` longtext COLLATE utf8mb4_unicode_ci DEFAULT (NULL),
  `explicit_allowdeny` longtext COLLATE utf8mb4_unicode_ci DEFAULT (NULL),
  `allowed_languages` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `custom_options` longtext COLLATE utf8mb4_unicode_ci DEFAULT (NULL),
  `db_mountpoints` longtext COLLATE utf8mb4_unicode_ci DEFAULT (NULL),
  `pagetypes_select` longtext COLLATE utf8mb4_unicode_ci DEFAULT (NULL),
  `tables_select` longtext COLLATE utf8mb4_unicode_ci DEFAULT (NULL),
  `tables_modify` longtext COLLATE utf8mb4_unicode_ci DEFAULT (NULL),
  `groupMods` longtext COLLATE utf8mb4_unicode_ci DEFAULT (NULL),
  `mfa_providers` longtext COLLATE utf8mb4_unicode_ci DEFAULT (NULL),
  `file_mountpoints` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `file_permissions` longtext COLLATE utf8mb4_unicode_ci DEFAULT (NULL),
  `TSconfig` longtext COLLATE utf8mb4_unicode_ci DEFAULT (NULL),
  `subgroup` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `workspace_perms` smallint unsigned NOT NULL DEFAULT '0',
  `category_perms` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`uid`),
  KEY `parent` (`pid`,`deleted`,`hidden`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `be_sessions`
--

DROP TABLE IF EXISTS `be_sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `be_sessions` (
  `ses_id` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `ses_iplock` varchar(39) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `ses_userid` int unsigned NOT NULL DEFAULT '0',
  `ses_tstamp` int unsigned NOT NULL DEFAULT '0',
  `ses_data` longblob,
  PRIMARY KEY (`ses_id`),
  KEY `ses_tstamp` (`ses_tstamp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `be_users`
--

DROP TABLE IF EXISTS `be_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `be_users` (
  `uid` int unsigned NOT NULL AUTO_INCREMENT,
  `pid` int unsigned NOT NULL DEFAULT '0',
  `tstamp` int unsigned NOT NULL DEFAULT '0',
  `crdate` int unsigned NOT NULL DEFAULT '0',
  `deleted` smallint unsigned NOT NULL DEFAULT '0',
  `disable` smallint unsigned NOT NULL DEFAULT '0',
  `starttime` int unsigned NOT NULL DEFAULT '0',
  `endtime` int unsigned NOT NULL DEFAULT '0',
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `avatar` int unsigned NOT NULL DEFAULT '0',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `admin` smallint unsigned NOT NULL DEFAULT '0',
  `usergroup` varchar(512) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `lang` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'default',
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `db_mountpoints` longtext COLLATE utf8mb4_unicode_ci DEFAULT (NULL),
  `options` smallint unsigned NOT NULL DEFAULT '3',
  `realName` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `userMods` longtext COLLATE utf8mb4_unicode_ci DEFAULT (NULL),
  `allowed_languages` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `uc` mediumblob,
  `file_mountpoints` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `file_permissions` longtext COLLATE utf8mb4_unicode_ci DEFAULT (NULL),
  `workspace_perms` smallint unsigned NOT NULL DEFAULT '1',
  `TSconfig` longtext COLLATE utf8mb4_unicode_ci DEFAULT (NULL),
  `lastlogin` bigint NOT NULL DEFAULT '0',
  `workspace_id` int NOT NULL DEFAULT '0',
  `mfa` mediumblob,
  `category_perms` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `password_reset_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`uid`),
  KEY `username` (`username`),
  KEY `parent` (`pid`,`deleted`,`disable`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cache_hash`
--

DROP TABLE IF EXISTS `cache_hash`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cache_hash` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `identifier` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `expires` int unsigned NOT NULL DEFAULT '0',
  `content` longblob,
  PRIMARY KEY (`id`),
  KEY `cache_id` (`identifier`(180),`expires`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cache_hash_tags`
--

DROP TABLE IF EXISTS `cache_hash_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cache_hash_tags` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `identifier` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `tag` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `cache_id` (`identifier`(191)),
  KEY `cache_tag` (`tag`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cache_imagesizes`
--

DROP TABLE IF EXISTS `cache_imagesizes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cache_imagesizes` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `identifier` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `expires` int unsigned NOT NULL DEFAULT '0',
  `content` longblob,
  PRIMARY KEY (`id`),
  KEY `cache_id` (`identifier`(180),`expires`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cache_imagesizes_tags`
--

DROP TABLE IF EXISTS `cache_imagesizes_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cache_imagesizes_tags` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `identifier` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `tag` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `cache_id` (`identifier`(191)),
  KEY `cache_tag` (`tag`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cache_pages`
--

DROP TABLE IF EXISTS `cache_pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cache_pages` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `identifier` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `expires` int unsigned NOT NULL DEFAULT '0',
  `content` longblob,
  PRIMARY KEY (`id`),
  KEY `cache_id` (`identifier`(180),`expires`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cache_pages_tags`
--

DROP TABLE IF EXISTS `cache_pages_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cache_pages_tags` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `identifier` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `tag` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `cache_id` (`identifier`(191)),
  KEY `cache_tag` (`tag`(191))
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cache_rootline`
--

DROP TABLE IF EXISTS `cache_rootline`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cache_rootline` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `identifier` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `expires` int unsigned NOT NULL DEFAULT '0',
  `content` longblob,
  PRIMARY KEY (`id`),
  KEY `cache_id` (`identifier`(180),`expires`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cache_rootline_tags`
--

DROP TABLE IF EXISTS `cache_rootline_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cache_rootline_tags` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `identifier` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `tag` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `cache_id` (`identifier`(191)),
  KEY `cache_tag` (`tag`(191))
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fe_groups`
--

DROP TABLE IF EXISTS `fe_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fe_groups` (
  `uid` int unsigned NOT NULL AUTO_INCREMENT,
  `pid` int unsigned NOT NULL DEFAULT '0',
  `tstamp` int unsigned NOT NULL DEFAULT '0',
  `crdate` int unsigned NOT NULL DEFAULT '0',
  `deleted` smallint unsigned NOT NULL DEFAULT '0',
  `hidden` smallint unsigned NOT NULL DEFAULT '0',
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `subgroup` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  PRIMARY KEY (`uid`),
  KEY `parent` (`pid`,`deleted`,`hidden`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fe_sessions`
--

DROP TABLE IF EXISTS `fe_sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fe_sessions` (
  `ses_id` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `ses_iplock` varchar(39) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `ses_userid` int unsigned NOT NULL DEFAULT '0',
  `ses_tstamp` int unsigned NOT NULL DEFAULT '0',
  `ses_data` mediumblob,
  `ses_permanent` smallint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`ses_id`),
  KEY `ses_tstamp` (`ses_tstamp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fe_users`
--

DROP TABLE IF EXISTS `fe_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fe_users` (
  `uid` int unsigned NOT NULL AUTO_INCREMENT,
  `pid` int unsigned NOT NULL DEFAULT '0',
  `tstamp` int unsigned NOT NULL DEFAULT '0',
  `crdate` int unsigned NOT NULL DEFAULT '0',
  `deleted` smallint unsigned NOT NULL DEFAULT '0',
  `disable` smallint unsigned NOT NULL DEFAULT '0',
  `starttime` int unsigned NOT NULL DEFAULT '0',
  `endtime` int unsigned NOT NULL DEFAULT '0',
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `tx_extbase_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `usergroup` varchar(512) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `name` varchar(160) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `first_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `middle_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `last_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `address` longtext COLLATE utf8mb4_unicode_ci DEFAULT (NULL),
  `telephone` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `fax` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `uc` blob,
  `title` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `zip` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `city` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `country` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `www` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `company` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `image` int unsigned NOT NULL DEFAULT '0',
  `lastlogin` bigint NOT NULL DEFAULT '0',
  `is_online` int unsigned NOT NULL DEFAULT '0',
  `mfa` mediumblob,
  PRIMARY KEY (`uid`),
  KEY `parent` (`pid`,`username`(100)),
  KEY `username` (`username`(100)),
  KEY `is_online` (`is_online`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pages`
--

DROP TABLE IF EXISTS `pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pages` (
  `uid` int unsigned NOT NULL AUTO_INCREMENT,
  `pid` int unsigned NOT NULL DEFAULT '0',
  `tstamp` int unsigned NOT NULL DEFAULT '0',
  `crdate` int unsigned NOT NULL DEFAULT '0',
  `deleted` smallint unsigned NOT NULL DEFAULT '0',
  `hidden` smallint unsigned NOT NULL DEFAULT '0',
  `starttime` int unsigned NOT NULL DEFAULT '0',
  `endtime` int unsigned NOT NULL DEFAULT '0',
  `fe_group` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `sorting` int NOT NULL DEFAULT '0',
  `rowDescription` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `editlock` smallint unsigned NOT NULL DEFAULT '0',
  `sys_language_uid` int NOT NULL DEFAULT '0',
  `l10n_parent` int unsigned NOT NULL DEFAULT '0',
  `l10n_source` int unsigned NOT NULL DEFAULT '0',
  `l10n_state` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `l10n_diffsource` mediumblob,
  `t3ver_oid` int unsigned NOT NULL DEFAULT '0',
  `t3ver_wsid` int unsigned NOT NULL DEFAULT '0',
  `t3ver_state` smallint NOT NULL DEFAULT '0',
  `t3ver_stage` int NOT NULL DEFAULT '0',
  `perms_userid` int unsigned NOT NULL DEFAULT '0',
  `perms_groupid` int unsigned NOT NULL DEFAULT '0',
  `perms_user` smallint unsigned NOT NULL DEFAULT '0',
  `perms_group` smallint unsigned NOT NULL DEFAULT '0',
  `perms_everybody` smallint unsigned NOT NULL DEFAULT '0',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `slug` text COLLATE utf8mb4_unicode_ci DEFAULT (NULL),
  `doktype` int unsigned NOT NULL DEFAULT '0',
  `TSconfig` longtext COLLATE utf8mb4_unicode_ci DEFAULT (NULL),
  `is_siteroot` smallint unsigned NOT NULL DEFAULT '0',
  `php_tree_stop` smallint unsigned NOT NULL DEFAULT '0',
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `shortcut` int unsigned NOT NULL DEFAULT '0',
  `shortcut_mode` int unsigned NOT NULL DEFAULT '0',
  `subtitle` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `layout` int unsigned NOT NULL DEFAULT '0',
  `target` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `media` int unsigned NOT NULL DEFAULT '0',
  `lastUpdated` bigint NOT NULL DEFAULT '0',
  `keywords` longtext COLLATE utf8mb4_unicode_ci DEFAULT (NULL),
  `cache_timeout` int unsigned NOT NULL DEFAULT '0',
  `cache_tags` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `newUntil` bigint NOT NULL DEFAULT '0',
  `description` longtext COLLATE utf8mb4_unicode_ci DEFAULT (NULL),
  `no_search` smallint unsigned NOT NULL DEFAULT '0',
  `SYS_LASTCHANGED` int unsigned NOT NULL DEFAULT '0',
  `abstract` longtext COLLATE utf8mb4_unicode_ci DEFAULT (NULL),
  `module` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `extendToSubpages` smallint unsigned NOT NULL DEFAULT '0',
  `author` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `author_email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `nav_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `nav_hide` smallint unsigned NOT NULL DEFAULT '0',
  `content_from_pid` int unsigned NOT NULL DEFAULT '0',
  `mount_pid` int unsigned NOT NULL DEFAULT '0',
  `mount_pid_ol` smallint NOT NULL DEFAULT '0',
  `l18n_cfg` smallint unsigned NOT NULL DEFAULT '0',
  `backend_layout` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `backend_layout_next_level` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `tsconfig_includes` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `categories` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`uid`),
  KEY `determineSiteRoot` (`is_siteroot`),
  KEY `language_identifier` (`l10n_parent`,`sys_language_uid`),
  KEY `slug` (`slug`(127)),
  KEY `parent` (`pid`,`deleted`,`hidden`),
  KEY `translation_source` (`l10n_source`),
  KEY `t3ver_oid` (`t3ver_oid`,`t3ver_wsid`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sys_be_shortcuts`
--

DROP TABLE IF EXISTS `sys_be_shortcuts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_be_shortcuts` (
  `uid` int unsigned NOT NULL AUTO_INCREMENT,
  `userid` int unsigned NOT NULL DEFAULT '0',
  `route` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `arguments` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `sorting` int NOT NULL DEFAULT '0',
  `sc_group` smallint NOT NULL DEFAULT '0',
  PRIMARY KEY (`uid`),
  KEY `event` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sys_category`
--

DROP TABLE IF EXISTS `sys_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_category` (
  `uid` int unsigned NOT NULL AUTO_INCREMENT,
  `pid` int unsigned NOT NULL DEFAULT '0',
  `tstamp` int unsigned NOT NULL DEFAULT '0',
  `crdate` int unsigned NOT NULL DEFAULT '0',
  `deleted` smallint unsigned NOT NULL DEFAULT '0',
  `hidden` smallint unsigned NOT NULL DEFAULT '0',
  `starttime` int unsigned NOT NULL DEFAULT '0',
  `endtime` int unsigned NOT NULL DEFAULT '0',
  `sorting` int NOT NULL DEFAULT '0',
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `sys_language_uid` int NOT NULL DEFAULT '0',
  `l10n_parent` int unsigned NOT NULL DEFAULT '0',
  `l10n_state` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `l10n_diffsource` mediumblob,
  `t3ver_oid` int unsigned NOT NULL DEFAULT '0',
  `t3ver_wsid` int unsigned NOT NULL DEFAULT '0',
  `t3ver_state` smallint NOT NULL DEFAULT '0',
  `t3ver_stage` int NOT NULL DEFAULT '0',
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `items` int NOT NULL DEFAULT '0',
  `parent` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`uid`),
  KEY `category_parent` (`parent`),
  KEY `category_list` (`pid`,`deleted`,`sys_language_uid`),
  KEY `parent` (`pid`,`deleted`,`hidden`),
  KEY `t3ver_oid` (`t3ver_oid`,`t3ver_wsid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sys_category_record_mm`
--

DROP TABLE IF EXISTS `sys_category_record_mm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_category_record_mm` (
  `uid_local` int unsigned NOT NULL DEFAULT '0',
  `uid_foreign` int unsigned NOT NULL DEFAULT '0',
  `sorting` int unsigned NOT NULL DEFAULT '0',
  `sorting_foreign` int unsigned NOT NULL DEFAULT '0',
  `tablenames` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `fieldname` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`uid_local`,`uid_foreign`,`tablenames`,`fieldname`),
  KEY `uid_local` (`uid_local`),
  KEY `uid_foreign` (`uid_foreign`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sys_csp_resolution`
--

DROP TABLE IF EXISTS `sys_csp_resolution`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_csp_resolution` (
  `summary` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created` int unsigned NOT NULL,
  `scope` varchar(264) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mutation_identifier` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `mutation_collection` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `meta` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`summary`),
  KEY `created` (`created`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sys_file`
--

DROP TABLE IF EXISTS `sys_file`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_file` (
  `uid` int unsigned NOT NULL AUTO_INCREMENT,
  `pid` int unsigned NOT NULL DEFAULT '0',
  `tstamp` int unsigned NOT NULL DEFAULT '0',
  `last_indexed` int NOT NULL DEFAULT '0',
  `missing` smallint unsigned NOT NULL DEFAULT '0',
  `storage` int unsigned NOT NULL DEFAULT '0',
  `type` int unsigned NOT NULL DEFAULT '0',
  `metadata` int unsigned NOT NULL DEFAULT '0',
  `identifier` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `identifier_hash` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `folder_hash` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `extension` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `mime_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `name` tinytext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `sha1` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `size` int NOT NULL DEFAULT '0',
  `creation_date` int NOT NULL DEFAULT '0',
  `modification_date` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`uid`),
  KEY `sel01` (`storage`,`identifier_hash`),
  KEY `folder` (`storage`,`folder_hash`),
  KEY `tstamp` (`tstamp`),
  KEY `lastindex` (`last_indexed`),
  KEY `sha1` (`sha1`),
  KEY `parent` (`pid`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sys_file_collection`
--

DROP TABLE IF EXISTS `sys_file_collection`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_file_collection` (
  `uid` int unsigned NOT NULL AUTO_INCREMENT,
  `pid` int unsigned NOT NULL DEFAULT '0',
  `tstamp` int unsigned NOT NULL DEFAULT '0',
  `crdate` int unsigned NOT NULL DEFAULT '0',
  `deleted` smallint unsigned NOT NULL DEFAULT '0',
  `hidden` smallint unsigned NOT NULL DEFAULT '0',
  `starttime` int unsigned NOT NULL DEFAULT '0',
  `endtime` int unsigned NOT NULL DEFAULT '0',
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `sys_language_uid` int NOT NULL DEFAULT '0',
  `l10n_parent` int unsigned NOT NULL DEFAULT '0',
  `l10n_state` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `l10n_diffsource` mediumblob,
  `t3ver_oid` int unsigned NOT NULL DEFAULT '0',
  `t3ver_wsid` int unsigned NOT NULL DEFAULT '0',
  `t3ver_state` smallint NOT NULL DEFAULT '0',
  `t3ver_stage` int NOT NULL DEFAULT '0',
  `title` tinytext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `type` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'static',
  `files` int unsigned NOT NULL DEFAULT '0',
  `recursive` smallint unsigned NOT NULL DEFAULT '0',
  `category` int unsigned NOT NULL DEFAULT '0',
  `folder_identifier` longtext COLLATE utf8mb4_unicode_ci DEFAULT (NULL),
  PRIMARY KEY (`uid`),
  KEY `parent` (`pid`,`deleted`,`hidden`),
  KEY `t3ver_oid` (`t3ver_oid`,`t3ver_wsid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sys_file_metadata`
--

DROP TABLE IF EXISTS `sys_file_metadata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_file_metadata` (
  `uid` int unsigned NOT NULL AUTO_INCREMENT,
  `pid` int unsigned NOT NULL DEFAULT '0',
  `tstamp` int unsigned NOT NULL DEFAULT '0',
  `crdate` int unsigned NOT NULL DEFAULT '0',
  `sys_language_uid` int NOT NULL DEFAULT '0',
  `l10n_parent` int unsigned NOT NULL DEFAULT '0',
  `l10n_state` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `l10n_diffsource` mediumblob,
  `t3ver_oid` int unsigned NOT NULL DEFAULT '0',
  `t3ver_wsid` int unsigned NOT NULL DEFAULT '0',
  `t3ver_state` smallint NOT NULL DEFAULT '0',
  `t3ver_stage` int NOT NULL DEFAULT '0',
  `file` int unsigned NOT NULL DEFAULT '0',
  `title` tinytext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `width` int NOT NULL DEFAULT '0',
  `height` int NOT NULL DEFAULT '0',
  `description` longtext COLLATE utf8mb4_unicode_ci DEFAULT (NULL),
  `alternative` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `categories` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`uid`),
  KEY `file` (`file`),
  KEY `fal_filelist` (`l10n_parent`,`sys_language_uid`),
  KEY `parent` (`pid`),
  KEY `t3ver_oid` (`t3ver_oid`,`t3ver_wsid`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sys_file_processedfile`
--

DROP TABLE IF EXISTS `sys_file_processedfile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_file_processedfile` (
  `uid` int NOT NULL AUTO_INCREMENT,
  `tstamp` int NOT NULL DEFAULT '0',
  `crdate` int NOT NULL DEFAULT '0',
  `storage` int NOT NULL DEFAULT '0',
  `original` int NOT NULL DEFAULT '0',
  `identifier` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `name` tinytext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `processing_url` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `configuration` blob,
  `configurationsha1` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `originalfilesha1` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `task_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `checksum` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `width` int DEFAULT '0',
  `height` int DEFAULT '0',
  PRIMARY KEY (`uid`),
  KEY `combined_1` (`original`,`task_type`(100),`configurationsha1`),
  KEY `identifier` (`storage`,`identifier`(180))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sys_file_reference`
--

DROP TABLE IF EXISTS `sys_file_reference`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_file_reference` (
  `uid` int unsigned NOT NULL AUTO_INCREMENT,
  `pid` int unsigned NOT NULL DEFAULT '0',
  `tstamp` int unsigned NOT NULL DEFAULT '0',
  `crdate` int unsigned NOT NULL DEFAULT '0',
  `deleted` smallint unsigned NOT NULL DEFAULT '0',
  `hidden` smallint unsigned NOT NULL DEFAULT '0',
  `sys_language_uid` int NOT NULL DEFAULT '0',
  `l10n_parent` int unsigned NOT NULL DEFAULT '0',
  `l10n_state` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `l10n_diffsource` mediumblob,
  `t3ver_oid` int unsigned NOT NULL DEFAULT '0',
  `t3ver_wsid` int unsigned NOT NULL DEFAULT '0',
  `t3ver_state` smallint NOT NULL DEFAULT '0',
  `t3ver_stage` int NOT NULL DEFAULT '0',
  `uid_local` int NOT NULL DEFAULT '0',
  `uid_foreign` int NOT NULL DEFAULT '0',
  `tablenames` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `fieldname` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `sorting_foreign` int NOT NULL DEFAULT '0',
  `title` tinytext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `description` longtext COLLATE utf8mb4_unicode_ci DEFAULT (NULL),
  `alternative` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `link` text COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT (_utf8mb4''),
  `crop` longtext COLLATE utf8mb4_unicode_ci DEFAULT (NULL),
  `autoplay` smallint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`uid`),
  KEY `tablenames_fieldname` (`tablenames`(32),`fieldname`(12)),
  KEY `deleted` (`deleted`),
  KEY `uid_local` (`uid_local`),
  KEY `uid_foreign` (`uid_foreign`),
  KEY `combined_1` (`l10n_parent`,`t3ver_oid`,`t3ver_wsid`,`t3ver_state`,`deleted`),
  KEY `parent` (`pid`,`deleted`,`hidden`),
  KEY `t3ver_oid` (`t3ver_oid`,`t3ver_wsid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sys_file_storage`
--

DROP TABLE IF EXISTS `sys_file_storage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_file_storage` (
  `uid` int unsigned NOT NULL AUTO_INCREMENT,
  `pid` int unsigned NOT NULL DEFAULT '0',
  `tstamp` int unsigned NOT NULL DEFAULT '0',
  `crdate` int unsigned NOT NULL DEFAULT '0',
  `deleted` smallint unsigned NOT NULL DEFAULT '0',
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `driver` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `configuration` longtext COLLATE utf8mb4_unicode_ci DEFAULT (NULL),
  `is_default` smallint unsigned NOT NULL DEFAULT '0',
  `is_browsable` smallint unsigned NOT NULL DEFAULT '1',
  `is_public` smallint NOT NULL DEFAULT '0',
  `is_writable` smallint unsigned NOT NULL DEFAULT '1',
  `is_online` smallint unsigned NOT NULL DEFAULT '1',
  `auto_extract_metadata` smallint unsigned NOT NULL DEFAULT '1',
  `processingfolder` tinytext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`uid`),
  KEY `parent` (`pid`,`deleted`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sys_filemounts`
--

DROP TABLE IF EXISTS `sys_filemounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_filemounts` (
  `uid` int unsigned NOT NULL AUTO_INCREMENT,
  `pid` int unsigned NOT NULL DEFAULT '0',
  `tstamp` int unsigned NOT NULL DEFAULT '0',
  `deleted` smallint unsigned NOT NULL DEFAULT '0',
  `hidden` smallint unsigned NOT NULL DEFAULT '0',
  `sorting` int NOT NULL DEFAULT '0',
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `read_only` smallint unsigned NOT NULL DEFAULT '0',
  `identifier` longtext COLLATE utf8mb4_unicode_ci DEFAULT (NULL),
  PRIMARY KEY (`uid`),
  KEY `parent` (`pid`,`deleted`,`hidden`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sys_history`
--

DROP TABLE IF EXISTS `sys_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_history` (
  `uid` int unsigned NOT NULL AUTO_INCREMENT,
  `tstamp` int unsigned NOT NULL DEFAULT '0',
  `actiontype` smallint NOT NULL DEFAULT '0',
  `usertype` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'BE',
  `userid` int unsigned DEFAULT NULL,
  `originaluserid` int unsigned DEFAULT NULL,
  `recuid` int NOT NULL DEFAULT '0',
  `tablename` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `history_data` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `workspace` int DEFAULT '0',
  `correlation_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`uid`),
  KEY `recordident_1` (`tablename`(100),`recuid`),
  KEY `recordident_2` (`tablename`(100),`tstamp`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sys_http_report`
--

DROP TABLE IF EXISTS `sys_http_report`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_http_report` (
  `uuid` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` smallint unsigned NOT NULL DEFAULT '0',
  `created` int unsigned NOT NULL,
  `changed` int unsigned NOT NULL,
  `type` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `scope` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `request_time` bigint unsigned NOT NULL,
  `meta` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `details` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `summary` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`uuid`),
  KEY `type_scope` (`type`,`scope`),
  KEY `created` (`created`),
  KEY `changed` (`changed`),
  KEY `request_time` (`request_time`),
  KEY `summary_created` (`summary`,`created`),
  KEY `all_conditions` (`type`,`status`,`scope`,`summary`,`request_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sys_lockedrecords`
--

DROP TABLE IF EXISTS `sys_lockedrecords`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_lockedrecords` (
  `uid` int unsigned NOT NULL AUTO_INCREMENT,
  `userid` int unsigned NOT NULL DEFAULT '0',
  `tstamp` int unsigned NOT NULL DEFAULT '0',
  `record_table` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `record_uid` int NOT NULL DEFAULT '0',
  `record_pid` int NOT NULL DEFAULT '0',
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `feuserid` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`uid`),
  KEY `event` (`userid`,`tstamp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sys_log`
--

DROP TABLE IF EXISTS `sys_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_log` (
  `uid` int unsigned NOT NULL AUTO_INCREMENT,
  `tstamp` int unsigned NOT NULL DEFAULT '0',
  `userid` int unsigned NOT NULL DEFAULT '0',
  `action` smallint unsigned NOT NULL DEFAULT '0',
  `recuid` int unsigned NOT NULL DEFAULT '0',
  `tablename` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `recpid` int NOT NULL DEFAULT '0',
  `error` smallint unsigned NOT NULL DEFAULT '0',
  `details` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `type` smallint unsigned NOT NULL DEFAULT '0',
  `channel` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'default',
  `details_nr` smallint NOT NULL DEFAULT '0',
  `IP` varchar(39) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `log_data` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `event_pid` int NOT NULL DEFAULT '-1',
  `workspace` int NOT NULL DEFAULT '0',
  `NEWid` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `request_id` varchar(13) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `time_micro` double NOT NULL DEFAULT '0',
  `component` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `level` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'info',
  `message` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `data` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`uid`),
  KEY `event` (`userid`,`event_pid`),
  KEY `recuidIdx` (`recuid`),
  KEY `user_auth` (`type`,`action`,`tstamp`),
  KEY `request` (`request_id`),
  KEY `combined_1` (`tstamp`,`type`,`userid`),
  KEY `errorcount` (`tstamp`,`error`),
  KEY `index_channel` (`channel`),
  KEY `index_level` (`level`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sys_messenger_messages`
--

DROP TABLE IF EXISTS `sys_messenger_messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_messenger_messages` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `body` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `headers` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue_name` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `available_at` datetime NOT NULL,
  `delivered_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `queue_name` (`queue_name`),
  KEY `available_at` (`available_at`),
  KEY `delivered_at` (`delivered_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sys_news`
--

DROP TABLE IF EXISTS `sys_news`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_news` (
  `uid` int unsigned NOT NULL AUTO_INCREMENT,
  `pid` int unsigned NOT NULL DEFAULT '0',
  `tstamp` int unsigned NOT NULL DEFAULT '0',
  `crdate` int unsigned NOT NULL DEFAULT '0',
  `deleted` smallint unsigned NOT NULL DEFAULT '0',
  `hidden` smallint unsigned NOT NULL DEFAULT '0',
  `starttime` int unsigned NOT NULL DEFAULT '0',
  `endtime` int unsigned NOT NULL DEFAULT '0',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `content` longtext COLLATE utf8mb4_unicode_ci DEFAULT (NULL),
  PRIMARY KEY (`uid`),
  KEY `parent` (`pid`,`deleted`,`hidden`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sys_refindex`
--

DROP TABLE IF EXISTS `sys_refindex`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_refindex` (
  `hash` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `tablename` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `recuid` int unsigned NOT NULL DEFAULT '0',
  `field` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `flexpointer` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `softref_key` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `softref_id` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `sorting` int NOT NULL DEFAULT '0',
  `workspace` int unsigned NOT NULL DEFAULT '0',
  `ref_table` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `ref_uid` int NOT NULL DEFAULT '0',
  `ref_string` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `hidden` smallint unsigned NOT NULL DEFAULT '0',
  `starttime` int unsigned NOT NULL DEFAULT '0',
  `endtime` int unsigned NOT NULL DEFAULT '2147483647',
  `t3ver_state` int unsigned NOT NULL DEFAULT '0',
  `ref_field` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `ref_hidden` smallint unsigned NOT NULL DEFAULT '0',
  `ref_starttime` int unsigned NOT NULL DEFAULT '0',
  `ref_endtime` int unsigned NOT NULL DEFAULT '2147483647',
  `ref_t3ver_state` int unsigned NOT NULL DEFAULT '0',
  `ref_sorting` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`hash`),
  KEY `lookup_string` (`ref_string`(191)),
  KEY `lookup_ref` (`ref_table`,`ref_uid`,`tablename`,`workspace`,`t3ver_state`,`hidden`,`starttime`,`endtime`),
  KEY `lookup_rec` (`tablename`,`recuid`,`field`,`workspace`,`ref_t3ver_state`,`ref_hidden`,`ref_starttime`,`ref_endtime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sys_registry`
--

DROP TABLE IF EXISTS `sys_registry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_registry` (
  `uid` int unsigned NOT NULL AUTO_INCREMENT,
  `entry_namespace` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `entry_key` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `entry_value` mediumblob,
  PRIMARY KEY (`uid`),
  UNIQUE KEY `entry_identifier` (`entry_namespace`,`entry_key`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sys_template`
--

DROP TABLE IF EXISTS `sys_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_template` (
  `uid` int unsigned NOT NULL AUTO_INCREMENT,
  `pid` int unsigned NOT NULL DEFAULT '0',
  `tstamp` int unsigned NOT NULL DEFAULT '0',
  `crdate` int unsigned NOT NULL DEFAULT '0',
  `deleted` smallint unsigned NOT NULL DEFAULT '0',
  `hidden` smallint unsigned NOT NULL DEFAULT '0',
  `starttime` int unsigned NOT NULL DEFAULT '0',
  `endtime` int unsigned NOT NULL DEFAULT '0',
  `sorting` int NOT NULL DEFAULT '0',
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `root` smallint unsigned NOT NULL DEFAULT '0',
  `clear` smallint unsigned NOT NULL DEFAULT '0',
  `include_static_file` longtext COLLATE utf8mb4_unicode_ci DEFAULT (NULL),
  `constants` longtext COLLATE utf8mb4_unicode_ci DEFAULT (NULL),
  `config` longtext COLLATE utf8mb4_unicode_ci DEFAULT (NULL),
  `basedOn` longtext COLLATE utf8mb4_unicode_ci DEFAULT (NULL),
  `includeStaticAfterBasedOn` smallint unsigned NOT NULL DEFAULT '0',
  `static_file_mode` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`uid`),
  KEY `roottemplate` (`deleted`,`hidden`,`root`),
  KEY `parent` (`pid`,`deleted`,`hidden`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tt_content`
--

DROP TABLE IF EXISTS `tt_content`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tt_content` (
  `uid` int unsigned NOT NULL AUTO_INCREMENT,
  `rowDescription` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `pid` int unsigned NOT NULL DEFAULT '0',
  `tstamp` int unsigned NOT NULL DEFAULT '0',
  `crdate` int unsigned NOT NULL DEFAULT '0',
  `deleted` smallint unsigned NOT NULL DEFAULT '0',
  `hidden` smallint unsigned NOT NULL DEFAULT '0',
  `starttime` int unsigned NOT NULL DEFAULT '0',
  `endtime` int unsigned NOT NULL DEFAULT '0',
  `fe_group` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `sorting` int NOT NULL DEFAULT '0',
  `editlock` smallint unsigned NOT NULL DEFAULT '0',
  `sys_language_uid` int NOT NULL DEFAULT '0',
  `l18n_parent` int unsigned NOT NULL DEFAULT '0',
  `l10n_source` int unsigned NOT NULL DEFAULT '0',
  `l10n_state` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `l18n_diffsource` mediumblob,
  `t3ver_oid` int unsigned NOT NULL DEFAULT '0',
  `t3ver_wsid` int unsigned NOT NULL DEFAULT '0',
  `t3ver_state` smallint NOT NULL DEFAULT '0',
  `t3ver_stage` int NOT NULL DEFAULT '0',
  `CType` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `header` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `header_position` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `bodytext` longtext COLLATE utf8mb4_unicode_ci DEFAULT (NULL),
  `bullets_type` int unsigned NOT NULL DEFAULT '0',
  `uploads_description` smallint unsigned NOT NULL DEFAULT '0',
  `uploads_type` int unsigned NOT NULL DEFAULT '0',
  `assets` int unsigned NOT NULL DEFAULT '0',
  `image` int unsigned NOT NULL DEFAULT '0',
  `imagewidth` int unsigned NOT NULL DEFAULT '0',
  `imageorient` int unsigned NOT NULL DEFAULT '0',
  `imagecols` int unsigned NOT NULL DEFAULT '0',
  `imageborder` smallint unsigned NOT NULL DEFAULT '0',
  `media` int unsigned NOT NULL DEFAULT '0',
  `layout` int unsigned NOT NULL DEFAULT '0',
  `frame_class` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'default',
  `cols` int unsigned NOT NULL DEFAULT '0',
  `space_before_class` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `space_after_class` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `records` longtext COLLATE utf8mb4_unicode_ci DEFAULT (NULL),
  `pages` longtext COLLATE utf8mb4_unicode_ci DEFAULT (NULL),
  `colPos` int unsigned NOT NULL DEFAULT '0',
  `subheader` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `header_link` text COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT (_utf8mb4''),
  `image_zoom` smallint unsigned NOT NULL DEFAULT '0',
  `header_layout` int unsigned NOT NULL DEFAULT '0',
  `list_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `sectionIndex` smallint unsigned NOT NULL DEFAULT '1',
  `linkToTop` smallint unsigned NOT NULL DEFAULT '0',
  `file_collections` longtext COLLATE utf8mb4_unicode_ci DEFAULT (NULL),
  `filelink_size` smallint unsigned NOT NULL DEFAULT '0',
  `filelink_sorting` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `filelink_sorting_direction` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `target` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `date` bigint NOT NULL DEFAULT '0',
  `recursive` int unsigned NOT NULL DEFAULT '0',
  `imageheight` int unsigned NOT NULL DEFAULT '0',
  `pi_flexform` longtext COLLATE utf8mb4_unicode_ci DEFAULT (NULL),
  `accessibility_title` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `accessibility_bypass` smallint unsigned NOT NULL DEFAULT '0',
  `accessibility_bypass_text` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `category_field` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `table_class` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `table_caption` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `table_delimiter` int unsigned NOT NULL DEFAULT '0',
  `table_enclosure` int unsigned NOT NULL DEFAULT '0',
  `table_header_position` int unsigned NOT NULL DEFAULT '0',
  `table_tfoot` smallint unsigned NOT NULL DEFAULT '0',
  `categories` int unsigned NOT NULL DEFAULT '0',
  `selected_categories` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`uid`),
  KEY `parent` (`pid`,`sorting`),
  KEY `t3ver_oid` (`t3ver_oid`,`t3ver_wsid`),
  KEY `language` (`l18n_parent`,`sys_language_uid`),
  KEY `translation_source` (`l10n_source`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tx_extensionmanager_domain_model_extension`
--

DROP TABLE IF EXISTS `tx_extensionmanager_domain_model_extension`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tx_extensionmanager_domain_model_extension` (
  `uid` int unsigned NOT NULL AUTO_INCREMENT,
  `pid` int unsigned NOT NULL DEFAULT '0',
  `extension_key` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `remote` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'ter',
  `version` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `alldownloadcounter` int unsigned NOT NULL DEFAULT '0',
  `downloadcounter` int unsigned NOT NULL DEFAULT '0',
  `title` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `description` longtext COLLATE utf8mb4_unicode_ci DEFAULT (NULL),
  `state` int unsigned NOT NULL DEFAULT '0',
  `review_state` int NOT NULL DEFAULT '0',
  `category` int unsigned NOT NULL DEFAULT '0',
  `last_updated` bigint NOT NULL DEFAULT '0',
  `serialized_dependencies` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `author_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `author_email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `ownerusername` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `md5hash` varchar(35) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `update_comment` longtext COLLATE utf8mb4_unicode_ci DEFAULT (NULL),
  `authorcompany` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `integer_version` int NOT NULL DEFAULT '0',
  `current_version` smallint unsigned NOT NULL DEFAULT '0',
  `lastreviewedversion` int NOT NULL DEFAULT '0',
  `documentation_link` varchar(2048) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `distribution_image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `distribution_welcome_image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`uid`),
  UNIQUE KEY `versionextrepo` (`extension_key`,`version`,`remote`),
  KEY `index_extrepo` (`extension_key`,`remote`),
  KEY `index_versionrepo` (`integer_version`,`remote`,`extension_key`),
  KEY `index_currentversions` (`current_version`,`review_state`),
  KEY `parent` (`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-07-21 13:44:21
-- MySQL dump 10.13  Distrib 5.7.44, for osx10.17 (x86_64)
--
-- Host: 127.0.0.1    Database: typo3_formcrshield_acceptance_v13
-- ------------------------------------------------------
-- Server version	8.0.31

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
-- Dumping data for table `backend_layout`
--

LOCK TABLES `backend_layout` WRITE;
/*!40000 ALTER TABLE `backend_layout` DISABLE KEYS */;
/*!40000 ALTER TABLE `backend_layout` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `be_groups`
--

LOCK TABLES `be_groups` WRITE;
/*!40000 ALTER TABLE `be_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `be_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `be_sessions`
--

LOCK TABLES `be_sessions` WRITE;
/*!40000 ALTER TABLE `be_sessions` DISABLE KEYS */;
INSERT INTO `be_sessions` VALUES ('240091c757da594e3933f906d6542e883485da96a28b9626f28150a10bbb683c','[DISABLED]',1,1721561608,_binary 'a:1:{s:26:\"formProtectionSessionToken\";s:64:\"cffba6cb3fc5e8eeac56abfd06875767ec96839114fc1ff721b0b1e885ffd8e0\";}'),('c695244c3e09cfd6f602f7a183f9c97b1220f3de91a43cdfc911a83c01c8705a','[DISABLED]',1,1705136101,_binary 'a:2:{s:26:\"formProtectionSessionToken\";s:64:\"17e7f65fe5196ea59d864a73727aa98376b8b3e1ed7b6e1931e6fbe79a42abac\";s:29:\"extFormProtectionSessionToken\";s:64:\"b7b653cc25658f26a6f15bc79b10ee1e59c77b96166fef74e07bbe6ecfc1c85f\";}');
/*!40000 ALTER TABLE `be_sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `be_users`
--

LOCK TABLES `be_users` WRITE;
/*!40000 ALTER TABLE `be_users` DISABLE KEYS */;
INSERT INTO `be_users` VALUES (1,0,1667048107,1667048107,0,0,0,0,NULL,'admin',0,'$2y$12$r.AERNKN21sXh.34pkRh2.O3Lt2h93BHjvV..QBGRkTG286swXXQC',1,NULL,'default','',NULL,0,'',NULL,'',_binary 'a:11:{s:14:\"interfaceSetup\";s:0:\"\";s:10:\"moduleData\";a:6:{s:10:\"web_layout\";a:3:{s:8:\"function\";s:1:\"1\";s:8:\"language\";s:1:\"0\";s:19:\"constant_editor_cat\";N;}s:57:\"TYPO3\\CMS\\Backend\\Utility\\BackendUtility::getUpdateSignal\";a:0:{}s:9:\"file_list\";a:3:{s:8:\"function\";N;s:8:\"language\";N;s:19:\"constant_editor_cat\";N;}s:10:\"FormEngine\";a:2:{i:0;a:0:{}i:1;s:32:\"af6a208f792a83220f87a953a62a081a\";}s:16:\"opendocs::recent\";a:8:{s:32:\"af6a208f792a83220f87a953a62a081a\";a:5:{i:0;s:0:\"\";i:1;a:5:{s:4:\"edit\";a:1:{s:10:\"tt_content\";a:1:{i:6;s:4:\"edit\";}}s:7:\"defVals\";N;s:12:\"overrideVals\";N;s:11:\"columnsOnly\";N;s:6:\"noView\";N;}i:2;s:33:\"&edit%5Btt_content%5D%5B6%5D=edit\";i:3;a:5:{s:5:\"table\";s:10:\"tt_content\";s:3:\"uid\";i:6;s:3:\"pid\";i:6;s:3:\"cmd\";s:4:\"edit\";s:12:\"deleteAccess\";b:1;}i:4;s:76:\"/typo3/module/web/layout?token=2c2e8fc295ec0a3797993fd0df0c224e8a805e7e&id=6\";}s:32:\"494c59ed0b451cdb0042831766e2d4b1\";a:4:{i:0;s:9:\"Root Page\";i:1;a:5:{s:4:\"edit\";a:1:{s:10:\"tt_content\";a:1:{i:5;s:4:\"edit\";}}s:7:\"defVals\";N;s:12:\"overrideVals\";N;s:11:\"columnsOnly\";N;s:6:\"noView\";N;}i:2;s:33:\"&edit%5Btt_content%5D%5B5%5D=edit\";i:3;a:5:{s:5:\"table\";s:10:\"tt_content\";s:3:\"uid\";i:5;s:3:\"pid\";i:1;s:3:\"cmd\";s:4:\"edit\";s:12:\"deleteAccess\";b:1;}}s:32:\"a3b9454ecc0d182884b26f9c529ddb87\";a:4:{i:0;s:0:\"\";i:1;a:5:{s:4:\"edit\";a:1:{s:10:\"tt_content\";a:1:{i:4;s:4:\"edit\";}}s:7:\"defVals\";N;s:12:\"overrideVals\";N;s:11:\"columnsOnly\";N;s:6:\"noView\";N;}i:2;s:33:\"&edit%5Btt_content%5D%5B4%5D=edit\";i:3;a:5:{s:5:\"table\";s:10:\"tt_content\";s:3:\"uid\";i:4;s:3:\"pid\";i:5;s:3:\"cmd\";s:4:\"edit\";s:12:\"deleteAccess\";b:1;}}s:32:\"3af505b920348c1a79bf62ea28cbec90\";a:4:{i:0;s:31:\"Multiple step form with summary\";i:1;a:5:{s:4:\"edit\";a:1:{s:5:\"pages\";a:1:{i:5;s:4:\"edit\";}}s:7:\"defVals\";N;s:12:\"overrideVals\";N;s:11:\"columnsOnly\";N;s:6:\"noView\";N;}i:2;s:28:\"&edit%5Bpages%5D%5B5%5D=edit\";i:3;a:5:{s:5:\"table\";s:5:\"pages\";s:3:\"uid\";i:5;s:3:\"pid\";i:1;s:3:\"cmd\";s:4:\"edit\";s:12:\"deleteAccess\";b:1;}}s:32:\"581106f297d9eed8dec1190ee4d6b04d\";a:4:{i:0;s:0:\"\";i:1;a:5:{s:4:\"edit\";a:1:{s:10:\"tt_content\";a:1:{i:3;s:4:\"edit\";}}s:7:\"defVals\";N;s:12:\"overrideVals\";N;s:11:\"columnsOnly\";N;s:6:\"noView\";N;}i:2;s:33:\"&edit%5Btt_content%5D%5B3%5D=edit\";i:3;a:5:{s:5:\"table\";s:10:\"tt_content\";s:3:\"uid\";i:3;s:3:\"pid\";i:4;s:3:\"cmd\";s:4:\"edit\";s:12:\"deleteAccess\";b:1;}}s:32:\"deac478137dd48a97e299bd046412e21\";a:4:{i:0;s:0:\"\";i:1;a:5:{s:4:\"edit\";a:1:{s:10:\"tt_content\";a:1:{i:2;s:4:\"edit\";}}s:7:\"defVals\";N;s:12:\"overrideVals\";N;s:11:\"columnsOnly\";N;s:6:\"noView\";N;}i:2;s:33:\"&edit%5Btt_content%5D%5B2%5D=edit\";i:3;a:5:{s:5:\"table\";s:10:\"tt_content\";s:3:\"uid\";i:2;s:3:\"pid\";i:3;s:3:\"cmd\";s:4:\"edit\";s:12:\"deleteAccess\";b:1;}}s:32:\"86205c5935270b8ee413592ec1b62292\";a:4:{i:0;s:8:\"NEW SITE\";i:1;a:5:{s:4:\"edit\";a:1:{s:12:\"sys_template\";a:1:{i:1;s:4:\"edit\";}}s:7:\"defVals\";N;s:12:\"overrideVals\";N;s:11:\"columnsOnly\";N;s:6:\"noView\";N;}i:2;s:35:\"&edit%5Bsys_template%5D%5B1%5D=edit\";i:3;a:5:{s:5:\"table\";s:12:\"sys_template\";s:3:\"uid\";i:1;s:3:\"pid\";i:1;s:3:\"cmd\";s:4:\"edit\";s:12:\"deleteAccess\";b:1;}}s:32:\"c312013d83c1a6ad7fec8b36a37ba3c8\";a:4:{i:0;s:0:\"\";i:1;a:5:{s:4:\"edit\";a:1:{s:10:\"tt_content\";a:1:{i:1;s:4:\"edit\";}}s:7:\"defVals\";N;s:12:\"overrideVals\";N;s:11:\"columnsOnly\";N;s:6:\"noView\";N;}i:2;s:33:\"&edit%5Btt_content%5D%5B1%5D=edit\";i:3;a:5:{s:5:\"table\";s:10:\"tt_content\";s:3:\"uid\";i:1;s:3:\"pid\";i:2;s:3:\"cmd\";s:4:\"edit\";s:12:\"deleteAccess\";b:1;}}}s:6:\"web_ts\";a:3:{s:8:\"function\";s:85:\"TYPO3\\CMS\\Tstemplate\\Controller\\TypoScriptTemplateInformationModuleFunctionController\";s:8:\"language\";N;s:19:\"constant_editor_cat\";s:0:\"\";}}s:14:\"emailMeAtLogin\";i:0;s:8:\"titleLen\";i:50;s:8:\"edit_RTE\";s:1:\"1\";s:20:\"edit_docModuleUpload\";s:1:\"1\";s:25:\"resizeTextareas_MaxHeight\";i:500;s:4:\"lang\";s:7:\"default\";s:19:\"firstLoginTimeStamp\";i:1667048114;s:15:\"moduleSessionID\";a:6:{s:10:\"web_layout\";s:40:\"b14f7133d536d772ff4ad4e6e27abd7adf80913c\";s:57:\"TYPO3\\CMS\\Backend\\Utility\\BackendUtility::getUpdateSignal\";s:40:\"b39defca66536dd127d84b6f95308ece423511e8\";s:9:\"file_list\";s:40:\"b14f7133d536d772ff4ad4e6e27abd7adf80913c\";s:10:\"FormEngine\";s:40:\"b39defca66536dd127d84b6f95308ece423511e8\";s:16:\"opendocs::recent\";s:40:\"b39defca66536dd127d84b6f95308ece423511e8\";s:6:\"web_ts\";s:40:\"b14f7133d536d772ff4ad4e6e27abd7adf80913c\";}s:17:\"BackendComponents\";a:1:{s:6:\"States\";a:1:{s:8:\"Pagetree\";a:1:{s:9:\"stateHash\";a:3:{s:3:\"0_0\";s:1:\"1\";s:3:\"0_1\";s:1:\"1\";s:3:\"0_4\";s:1:\"1\";}}}}}',NULL,NULL,1,NULL,1721561583,0,NULL,NULL,'');
/*!40000 ALTER TABLE `be_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `cache_hash`
--

LOCK TABLES `cache_hash` WRITE;
/*!40000 ALTER TABLE `cache_hash` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache_hash` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `cache_hash_tags`
--

LOCK TABLES `cache_hash_tags` WRITE;
/*!40000 ALTER TABLE `cache_hash_tags` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache_hash_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `cache_imagesizes`
--

LOCK TABLES `cache_imagesizes` WRITE;
/*!40000 ALTER TABLE `cache_imagesizes` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache_imagesizes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `cache_imagesizes_tags`
--

LOCK TABLES `cache_imagesizes_tags` WRITE;
/*!40000 ALTER TABLE `cache_imagesizes_tags` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache_imagesizes_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `cache_pages`
--

LOCK TABLES `cache_pages` WRITE;
/*!40000 ALTER TABLE `cache_pages` DISABLE KEYS */;
INSERT INTO `cache_pages` VALUES (1,'1_1af8c169161e4bb0d3230b94baa6317b3318b6f3',1705222421,_binary 'xœ­V\Ûn\ã6}®¿‚Ñ»#K¶7‰/)o²H»›5b÷¡@\0–F7²(”/(ò\ï!%\Ûq¶]tQ=\è2œ\ë™\á¡ø\àbğ—Æ›Wò%D\"ñ†b­$–…\Âxø„ı\ŞÀ}ü:™ÿ9½c™Y\å×­=XÎ‹\åØƒ\Â#ğ\äº\Õ\Z­Àpg\\i0c¯2iû’–\Ï\Úm\Öúe	\Í6°\Ğ\Â\0\Ã\×Rn@A\Â;†Î¿vY›‰B—B‰b\ÉJe\ÌH¦\Ñœ¡¹\ÕA;\ÎRÀd	Ó²R1°‰K™}\á–³¢\×{\ÅW°‘\ê\n#x\ïX¬€ñw®KPlöÂ¹\Ê\ä7Æ‹„\å\"†B\ãzU$¸ö\éñÿ\ÓôóùQ\èX–;%–™aÁ\Õ\Õe;\ì„=&\ÓSg\ç\ìn‹\éh!\ÌVÁ‘*›„b\n\Ğ$6b…l\nP\Z\Ã<©T+n\Ğ\Î\æCPbQ9AôM©¾ov¥\ìKµô[\í6ÂÀar¸~’ÒŒ|÷^7£@\Æ\Ş07Ry¬\î\î\ØsEM¾\Ì<\æ[\'õ5ò]7G™\ìp\á\å\î\Í5JÄš‰d\ì\Å}ô—s­\Ç^Jp3{o\'ò*7õfmr‰9I\Îw²2\í;¹~,p\é´~\Úò\Í\Ò\È\åõ6\ï;¯3\Ê\ÂŒ\ïF­aSÎ·6~tO\Ëú\ç…ùv\íkjú9¤şw\Ğ`9òq¢ˆ?t¬Di˜Vñ\Øsc\ãšú°5>m(V:\'ş¸¯ıiµÀ}\ëÿ\Æ\×|f­ı{Ôœ¨™U<ÿ¦\r.:ı \Û\ïôp\àF¾qm\İM8\"F´fù.\Ø\Ó\ßÇ–D! ¡Hi¸\'7\Çmd\ÒAg%\Üpo\È!1\ë\ë(K’X®\r®\Ù\Îi{N•\\‹„¶=­5+ˆ¥J¢K´¨)T¿\í®}\Æ]û<‘\n§\Ã\ç\'k;=\r\à\r__]]fa®Á\èR\0¬mµ)‚É”ÜŸGi\î%R\á\İ6†’8\è!½‰\é9á…¹jA¾†Ä‚0ğ:‰L\Ë\Z1Œ]$‹Gˆ¡\à‹n*#‰\ä\â	¡6É\á\×^9BZ•\'\ÆHñˆ@G\È\È\Û7‘\ÍÙ¼B\"=\ÔC–úE”İ¨eE‡>X¢N\à‰e\è\İ\äùM\éFE?·p¬\Ø\í7)?\"k\é’Ç\ì=\â\İòøŠ\ãúk\0øBc\âS©°9#\Ê‹v\êÀ\Û\Ò$}”±©\'sö\ÜÉ›¼½£¡±€½\é\ÕŸ›\r‘Q\â\Şû\é\ZºWøşYML1\èP;mô.Zº¿†\Î\Ğ~U‡ôjºkP‘<h\Ğ6qÂ>’Tlw#F\àÍ»”¬ß‚¯£ıRj¯ üH„»\Ï2Gd\"Iğo¥ /©Œ«}\Ø\êwr,¹¤!‹–JV\åqS\Ğ\Ğ	Ÿ\Ì\å¬Z‚ú\ÈG\"_\\\ZÔ¦Y\Ãd:F;I$Š8¯²¬ñ:¢?$e‹\ŞºÂh¢#\Èi’ö\ÂHæœ\Æ{\á&3rD&å°†|_\Ä+\Í*Õ»\Åÿ-—=\Ñd†½0px\ÄgU6+A÷C\'¬s±t7\çK}4¬‰‡$\n\Èÿ\ß>/ø'),(2,'2_68cd619a38fae14ac3e3d5fa6ce4e15a7dd1a42e',1705222423,_binary 'xœ\ÍX\ës\â8ÿ|ù+4¾\Úı°uC\Â{+“\×2³!/ò ;S.Ù–AÄ¶¼²L€­ü\ï×’l0„\Ì\îL\í^SEp«»\Õı\ë‡\Ô\à\ÖA\ë>Œ‰M=£M[Õ¶¢¸,$¼Yµ}³et\Ş_\rG—\'h\"Â ·×‘ÿP€£q\× ‘!	{½½½NHF\îó„ˆ®‘\n¿Ô\Ë\ïJ%´÷¯\á„&\è™8	Á×˜=N<\ä,(¿°P	\Ñ(‰)§\ÑÅ„\ÅA‚¡Ô‘w ®x@#Ÿ‚XL\"”°”»i“\Ñ9ÀP~=\å8$ÏŒ?R*(‚r9ÁB\ïø	\'1\á\è\æ	c>aS„#\Ô%Q\ëi\äÁ\Ú\Ù\à¶|vù\ëû\Â\Ö.‹œ\'™\Íf£T­Tkˆù\Û\ÊŞ£“9˜“PµœÄ€YL\åˆq#\Ï\á	lÓ|\ÆC,@N\Ù#Á©“j‚\0ôEœ´\Êe±ˆ™õñqy¯T\ØxAE@z74” I-²&e1‰\0Œ®1&°Œ(r\×Ğ¾\ß¨¬teO§¬ƒ\Úq˜·€şÌŸGgˆz]\Ã5A_€“¤køu¤>Kñq\Zˆ\ì\rŒ&%i™-?üUtôj€,¥\nd\Úzşœ M\ÛûnÉ¿.¿·\"oÒ‘^!¹\ÒÏ®‚\ã4\Æ\\”%½\äa\r‘˜0À+f‰0r‰\n˜b±+#\İ5Êš¬\ĞúY\Ì\í×¨ıPÿ ™¨w!õ\ä\â8Œ\Ûoq«TbA@¸”8…\ÕS®2ÀSb\î/8™t+Íº\ï\Õ,\ìøûVøu‹\Ô+–÷š³\ï’o˜©	\Ğ\ë\Ğ(N\ÒnO¨\çAG\È\Òm§1¿•|ùÍ¶5ù\Å@3¤ 4\\²\åÅÑ»\Ó\àj¸¸Wsøpò8sCÓ½>kŠ\Ñ}>œ~4\è:v\î\ï\Üë°¹p\î•\Ñ\ÃuĞŸ²\ÅE$–Ó¾yAû‡Ÿ\Æ’\ÑÃ r},İ³ù„\Ü\ß=İF·AúxvW\ëOE|1=<p—l~¾dôğˆ>*}ç—»À]ôFCö:›şU·‹-\ì7¤Ö¬\âz\Í\'\Ä÷\ZM\ëÀj\Ô\Z^£\ê˜®…+\Íf¥\"K\é›q±mÁ\Ó\Ú\Ó%‡\Ö\Æ%\É\Z•?~ü=e¢]\ÄNSZÙŠ s±¢™ÿ\Ñ_\\^ò)	¼-rp™\Òğ\Ó\ã\Ã\ÅÔ‹>\Ö&÷[Ë¶í¦œCs¸„^š¯½¼\ì\×\ë^³n6M·¹_¯k57üf\Õq,Ë“Y\ã[~\İu±\ê#²ÌÍ’*Tª˜Iµw#H¦\Ú+\Öv]*^\Ùjò#½s–Æ…f±Ù˜\ì`ƒ_Q\Ù7‹®¤q3zCø¿\×Ib\årœüR8ŸŒ\ŞO²\\\\Y)Ú±o\ÑBù­Növs\É%ß®°q®O5ôRVÂ¯G\îC–kò\í[*PK¯SM\Å\ï\ë&¿ı’Å½ğU?;\"›ùSÁ\\&\r°9óı\æyl|w›\É5¬\İ<ºÏƒaq>½Zœ[Ïµ\Ñrğ4Xj\çË«\Ú\ã4x\Z…\ç°ş8L?g§O£\åm}\ŞV/gÚ¯\îo\çşñy7?6wxø¦—\Û­ŸS\\\ÒnC<%;Px-•ˆE@\ÔyB\åa\Ğ\ÂNÂ‚T6\n1Ó¨UAò¯\Ôl6I\Øô°C\áj3\ï\ZßŸ.\ÛV|Y\ç\Ëî“´Xú\ĞJvòo–8¼Ó±ºe\ìEEˆJ‚±ÀÁp—ª\Æg¯½5)t\Ó\ÈØ·;\È\×|¥²\Ø!V:Q ¢$uBº]÷\Âp•¬(¤Š˜S\×\"H¦\æ›\Î\ĞB\Ã^g¸ùS\äs£6z\ÛÚ²6w·’¼%nÓ¿\Ò	:eio;;\ÖlúU:µ.¨½¿t/\ËYÿ”ñû$óN\ÖI\\Nc4wá’¦n\áĞ”ı2_™m»<™\È.S¾&z0IÊ—©cEù#\á%]–—¯#~£\ßO“ŸÍƒJİ´\ê•\Z\\~U\Å\ÔSp}ó†óQN]r3\Í\Õt6„\\‘¤j­¥JX1µW³—½¤HD°;!¶ºƒ¶q«*¿}¥È§cIQ£ \ÙÔ³\àP\rp™QON%r\İ\ÌFEN\\Æ½5©£Üª\ïjšø\Ó\Ä\ç#\Æ\É\ç\Ë\\\á\çk%{¹½\Ñ~y\Ñ~A¢ƒNˆ\ÚÀ’€o\á\Ì]o(wÎ¥§&µ“¹Kb\Ù&úş¡j/G8ˆA0ƒST‚\Ğ2*°|©‚\É\à…{V\ä\êU\ĞL\"\ì\ä:µœÁ\Ü#‰\ÚQ@°œG3-¦‚ Mc€öğa‚E}\ÙU7v4}6S˜ó\ÖşH\É\ä‰\Æ\Çz2:\ä\ãTÎª\ÉZx\ê-ƒ#@\ï0N”I§2U’~ô­znò\0\ÚT£K¼•FH2˜\à~_°*\0N	0ü’Ÿ*›ey<)FX\ËL:fj‘4°\Ù\Ğ?x¯ˆf­4\n°X}{6\è\\(Ì±9˜«]\Ş\â\í8c\âW\Z‘,ª´U‘_”5h\Ğ?rT\Ú\ê-\Õof[iÖŒp›­9d\Ùh\âsR š9U\r-9!r\Ó\0k0\Ã\Ğz¡\áÙ«¥3\à‰GqÕ¨\à\\#²;NF\0]°%‚†«mdü½\"¥!“\Î\Ö\'[!H \È$¼!ƒ/‘L\n:<ö¤£ªÑa»\É{\Ã@ŠH4Å¦‘¤”dx\ĞÄ–?\èp\åô\n\Ğ*S\Ø\Èef­ˆ6\\c3ºLwGgª­1°\åajdöÜ‰©øu,ÍXVÿ\îX¾J³ÿƒ˜\æ\Õÿ?\rj\åŸ	ªlH\Ò\áyã²^…\ÕjµVµ4`\0\n\ã|Å´ö+j¥™iC<N²†³K\"\Ñ÷\ìª\Ôÿ_ğA\ï'),(3,'2_5ef6365230763499c653425c0c83e707bc25fb6a',1705222424,_binary 'xœ\í<is7–óuõ+:\ÌÌ—\ÔJdó)Z)™’by$Y%Ò³³5b\İ 	«\Ù\à\0İ’˜\Äÿ}\ß\Ã\Ñ\r²Áø\Èfk¶J®Š\Í\Æ;ğğğ.\\!ƒ\Ş\à	\Õ\ÖdA§,®°AóDµD<\Íhš\Õ\à+\ìv»ƒ\Úğ»ów£\É\ß]\Ël•œñŸ !\é\âU¦5l $>=8®hF‚hI„¤Ù«Z\Íü\İ\áapğ“%“ÁI–\Ñ\0~®ù4f›\0˜¿k‡K\åš	–.‚5\å\ë„$°£\ß¹\Â:\Ì¥_\Ó4<\rFZ\ä\à†¤0œş¼dEŸ¸x\0¦,c$I6A$(\Ét%rME0~ D,ùÇ€¤q°ˆ¦\ày\Z\ì§\Û÷õŸî®œ®#¾\Ş¶XfA\Ø\ï6\ÍvÀ\ç»Ì‚‹gG2‚´‚:d€œ-) @e\ìò”R!¡›«t\ÎÅŠd@§\äÁ‰l–\ë†´Ÿ­\å ^\Ï6k\Ş:\âbQ?8<µh\rÿı÷“«\ÉõE»\Õ =õ[a/\î\Æ\Íu:³N\Øè†­y§\Ï\0/@:Kts19ûRš‚h4O¯¯^¿¶3¤»º]¿?ÿj95\éõ\Õ\íS¤o¿MØ·\ß,\ë\Ûoõ\Í\Å\Ùù\ÅıùÙ—\ÏÉ°®\İo8\ãñ8ğGÿmÿcö°øU-\nkA”)_\Õ\æ\èúû0¦s’\'™ùó¢‡h‰Sük^ø‘†&d\Ãó\ì°~\ìüù|ƒ\í\à›)¿œş hF\Å^\İN¦\ã\Ñı\Õ\İ\ä(\î6ıvu›1mS:\Â\æ<5h§\Ûl7\ÚqG{\Ô>’\ÏP\ë0e§»ö;½|÷nrqÿ\ífü{ 5#½¦ú:›\Ö\Æ¶)Gå¢°HM°Plj¶µŒ>g\n\é¤H<:\ï IHH´¤Ó˜d¤vBm\Ìz]\Åh\ÎØ¢ò`\Ø×‰pÂ²„\Ş	ş\Èb\ÉM4\â\".›\Â bWmøVi\â\Ã\èfüa\Äıpg~¸W´w»\ÔN>}\Ò\ãÊ§0Œ‘Tu\Ğ\Â`l«Ç¨\ì{È–‚?!Ÿ[]rHS\Ï]c~¸šŸEøïˆ¤\ÙkzO%Oi¬”0¨5 \'ø\Ñ‘aXL‚#\İS973M\É,¡gy\Æ1E#\Ô\Ú(¡“±\á*•ƒJó5¨ú˜CúFW-Ÿ·zm\Î!\Ó\æ\ä\Êñ ¥|`\ësl\Î\Ä\"\ÇD-KJÀ\éjl‘‚öÎ’\äB‰t\ÉhË«ô5u[+ò-%¹&—\\¼&\ÑM\İñ™Á\ï3%3h™À \"€ŸÑ’\Îy”™kº*Š+a\Û1\Z¥°­¹úzkĞ¶0f+¬|0öZe½\ìÃ\î\ç\Ù5K©™U6h\à%M8\è\n¯q¢¾rı(\îYë‘Š)/1\Ğmt\ã“tZC\Û*3˜~\Û‘Y\Ñ@!÷ FMóM\É\ã´\0öŠÆŒ8M\à:§XĞ°dq•¥i\0^Ğ¥\È2¶*º\í\áü\Çn\Ë1\Z\İt!x¾v\'	¸Q¬\Æ\â	\ç3Ô¤tx\ÄüAÏª\ÖN\Û\ØÆ†[$œL\ê–)K£$‘ş\Ö\èƒ\É)V³B\rºP\è\n<3›:*G\Ë*\Z§<±\íh\î3m©S­ƒi\n\ÂNúH“bŸqu.Ã­¹lşo\Ïe\Å\Ìş\r\æ\Ôzÿÿ\é¤6ş˜I5ñ*`	¶\Î\Êğ\ÑR€/-YÜ”£*¾Ã–\Ñ.E0P\Z\'½4ŠÆ±Nò+€Hq\éV}5­À\\Rq™§‘Š½=7¸]è¼¥ƒ\ÜkĞ™\ÌYŠ<U¡	ez7û¨»[ \ÉwƒN\Û\åp)TV?˜U`\Ã\Êhû\ë\â’‚¤qT\Ì\âÿ‚®\Ş	<Au\í®õ\n„yˆ®•\Ò|\Éùƒ±dU\ÜC\á¼\ÂR\0Š\Óû„r!\Ìj\Ï8‡¤˜\ÚL\èA<2.A„ k¬$Vñ^%‰	YH\ã# *›^{U¤*\'\Óc)\Ñ6\ĞW¨;\è“\é¢\Òc\×Õ‘\Z\à‚f0ƒ„\0£9&e£Hõ\Û\ÚO\×|Wˆp_aŸ&˜—L[@õ\ë¸øª(\ÍW÷üÉ£\Ä7ú\Ş1h4¦9ü\Î/	;¥Aœ¡wú\àdk*ú%¬*@O	p5¿X­³\Í5Tc·ùÊŒ.)¿\ÂcZ…ô\Ê\æ·y’TD\èYˆO§Ls­ ?\Õk° ?•ù¨’}#<.¾|6	\Ü-c*\rğõò\Ü¯\á™y¬~_\ÕYj;Q\ÄB°\ä¢ÿÊ™\ĞUö¶˜ıX\á\ÜBmUûkÏ¹w˜\îz\nµ…ä³‡HBHzôÙƒ†ThT	§\Â \Ìp\åWk’-‹<aQ¼a\é\Í\ä\æZaˆª2\Ğ\ãJ¸Od¹N˜\'p6Q‹\ëjû•7°¢T‚qÁF$‰üı–pŸ\á‚\Ñ\Ú6Dñ…–¾£^_K³G’T»\êY¯—%‘\Ë\Êttt»/¸\n\\\ØUû\è\Zˆ\×t \Ú\Í  ©\íC¯¢\èóš¤1†¿¢JøA\Ñ\ãO]d\ØQ\rqª¸×¥œ–°h°\Ä*›\ÙF_\à¼\à\Ğ,¿-ƒ~\Ù\äw\'¥Œ\Æ\çFzŒ¼[…(\í€\Ïi!5WU\×V\í^Û‚¢h\çgGÿô\Íùl“Q\ésñj8Ÿ9¹_{(\Ä	(\\e¡^‹\âSo$ø\Z\İ\Ò\n	Ÿ†³…\ì™W¶~‹d5°W%¦\çgGÿôû>yz/’‹4\â±Gó8\Ã.†·\î\Â\ÕüxM#F’ny\ØôªXV¸\ÏDU/\àao\É#\Ñõú\ßH’{$kvöc{Ë‘˜ç³„¾PôU\â*ÂWEƒ®=1·…\Í^Cóö\Ò5\0\ï<ÀX\ÈZ\â\ŞBU3`Gt…Ø£\Û~	ô™KS*l*\r?™ŸhG\Ì\Ì\nhs—4t{2\í«(Mm8\ÚSU*0—\Ù~ú\æ‚o\Ğ(\éY\Â¶š!ö7\ÊV\0}”x\ê“0O\åŒ\ßù\Ù\Ñ?½:HùŠ(Ÿ\êCè³Ÿ\'Ö»¦\Ùg¸‚p\Ê-÷³_~úª6˜ˆ5-\áv\İo`¾M\Ö~ª\íU\Ë?ª–·4\ä¸\è¤ñx_e‰Ë‡mß”ò<\Û\ël@)•—ë¶t^Â½.Fú%+ \ï*\Íö¢¶Ô”\Ì\Ùóˆ¯VŞµi{\Ã+–\n\Äk\Şñ]¯bÔ²~œq±»\\\ËbÿF\å/ê± ¡³|Q\í¼k ¾iT\0«\ÊjN,À{i÷\Ìc\Ã\ï\Ğ~r\Ö\íd\Ğkš­Agc5.ø\Ó9•*ûÀl!³?W\î\"6õ\Ø2™‘\ÕZ\Ñv»½Fû¸\İ5$±\Ù!´\ã¾5¦	Tñ²m‹\Ş\ÄE¦¬„\ìt5&Y–ğ\è¡ØƒC#\Û\È)nl\äx‘!\ß\Ş\ãL\Â\ãt\nu‘2I·¹‘Nõ\ÕwŸT7\ë\r\Ñ\Û»w:…\Ä\Â\å\Û1|c6Ÿ[&x\"\í¿\ÔF\êl\nñŸµˆ\'`iú7\Ğ\â\îUù\Û\ì\rn5»15SªQ\é}‹¢¿nX³\é<¡\ÏjcV5¸\Ì\Ô\Ş\İTó\êu<2Q@÷´“9š­fªœ[\ëh\î\Ğñ„O d\Ó»\Z\×B\ê\É\×Å¼«O;\åZ<;\Û\ZdgT«†¼\0}S#ÊC\Û\'›\r\×F÷Vó\Â\İÿÙ³EŒ\ÕCp\n\Ìt–öŠF±;‰%ôı:\Şdjc\í\Ö»Y€ÿÈ©İªVrõñt-\á$–\Ó\Øõ\Ür\ËÙ‚]2L{R\ÒL:a+g`*e`\Ã‹qI_jAµ¢\ÆK\é›V°_iCD:\ãz»µ\è\Çlı‚l\ïû#k6r¨#@|m?\r¥«\æ\ê(º7ğ\Ø\íV\à\Ğ\'µfC¿£O\ÏÌ—:ùU^\éÄ¨|V\Îp°\åt\Äjrú3\ç«B\ì\Ö`Ç­O\ÊÓŠ¾\Ş\çš\î\â’\Öuµò\0©ô7\'\Î\ÍY\ê\à`4Š\ÆX´4I¦R\å\Ím\r°±´\è½\éCDš¹ƒˆÉˆÍœ¶bG P\"\Ğ\åB²GZ±­%Å‹On³¼0pö¡mø\ãó*	ñtš§¯j\áQ£¨5\ÃKfú@?\0_Mc’ğ”¾ªm`JƒO†“\Ö%0Ã©o¤1+–—S†rIi0Tñ«š<¿¸Ü¹¹2´¡\Ì\â$U…§v\Ş\nF4C•\É#\çDı\n\â_\Æ\0Mx\È‹G\\ZªŸpPWa|B]Tƒ™­Ku\î†\ÍG\ê¯\rY%Ãº\"ö\ÈUW‚\íªnG\åh¢®Ta´T\×j\Z\Ö]\ÖL\"Gl\Æ–m*~xò±1Û¬•–\'`>ø43\'\Îº‰ø›iq¤\à¸`†ü\Õ\Ğ* Ä„\Ç[‚u3&l…\'xÊ¥š\í- LT\Âe.\nKmU¸“,B6w\ÎuµY\ä+\'‚KŠ>J\ã©¾5\çôú\áOŠ™\r&Y6u/\\\î\ì\ãô/Ÿô˜\Í\É\ßHòWº±>\\6\ætúÀâ‰\ì\Ç’,\nsƒ¡o\ØÀSö:\í¤o!Şª\rE7,\ë2\ÊmnC‹‹%/%\êK‰úR¢¾”¨/%\êK‰úR¢¾”¨/%\ê¿‰ú…%#`6sI£‡;Og$>\×\×\îô3VD[Š‰W¶ù58ò{‘¸z:Ş†Nv\İõ\ï\"\\Ÿ;5ññ=•*b\ß\ZA¥m6|\ßpş Oœ’º©‹q\è\ïjµÀ\ÓX&ma*FH8Ş› \"›p\Ü¿²—\Òj\'3­Ğ\â„w\ä4`\â\Ü>\Ä §$\ák}‰M¹Bˆ¶+\ç½Q<½\ÖwÍ…İ¦\Â1\ÉŞ–+/™6ı.\è\ì\â\ï“Á\Ü`\Ô\í dı.Ÿ%,ª—4u\Ãmj‘>Â€?™\Èi\Ó\0^|;2·»Û·§\ÊS¤¯_ôö8{4\ëøsı\'ce\É$y£LûÜ¬Œz¶0.Á´w1Bó„\Í^gæ°¿\r]ñ £h+_­x<jAš—³\Â},t„¬››\êÏŠ?R<ü|-(y şÕ„B\ìS\İ\Ì\n÷\×@WJ\á?ÿö‚\Û\Şò‡\Ş*\ÆZ®jq\Úú\â\Ò®MLÊƒ’”\àÄ¿´Ú•\Û\æ\×d?«·dúJ[õÔ¡¯Œ\É;,\ÑSb‚òÈœº—ğ\Ş\Ü^Y½5\ãP„·a\ÅFS\ÚÕ‰j\é˜Z\\\ív\æ­\Æ\r¤O•Šø¨,\Ï\é \nª¨¤gú“ª›>J4vY\\”\Å)V&\é)r‰ú7\í“\ÈHŒ¢²y¼7jÖªs\ëH¿Ÿ\ë–9F[»\è’\Õ1Jœ\ìĞ¨ú\è»TW3»&%IbO\nm\Ã[	\Ï\êö2\ZÏ¨00\ÕÃ¬(ñr\Õ\È\Üt‚‘ıjO’\äO¬\n<uJ0}+°¼\Ú\ã3-G\\J\\p²õC\ÊW<Î“\Â-t\\œeú£3—&\ÍÀl*C/\æT»t!\×l\æn4K\ìmªP\Ê\ê®\Û‹\Ï\Üm\ï\éK_cj¯¾ˆğ\Òy¼Šl\ÇC:\"©JdöÊ¸P\Ñ\ç\ïKu/fVdY(\ïOø\â,…\ì\ë¶N\åM­Q!¾Ÿ\Õ÷ƒ‹‘·qf ¦\æ\à\Ô\Z¿\É\rm\èı\åe\íğ²V?™j\ØE“\Í:…\æ\ÛMœ\Ä\Ã\Ã7\ç\Ó\Ï\åº\Ã\ÃÓ‚\Û|+‡U¸]~9·cc\Ğ\æ>¦\ç¡j8ıuX\×?l…f5\Ò\×bõ\Îk\í_k§\Æ\Ü\Ñ\"]®;Ï½-è¥¼K¤Ÿ€\Û\å§q\Ë°‡\Ø,cOAıÔ–•\æâ†­\èdgé‰—Ù—°\è‹r+3¾ù\Z\âb¦8y¥k†\ã_\Â?\Ë\Ú_š–†ñ1†‹+\å6Û®dƒ\È.¬¯\"F…\"Ô»\"£rƒ¶\İÔ—§¶UT5øÿ\ÇOmJ‚b\Åc\ê<[`ã³•}¶`€Y·¥¡¬\ß–\âs£¥¹,©.,\ê{\Ûoå¹Y\İ\îh–°Ğ¢¿YaŒtÄª[Ù *¾·ÌŠ”\Óqz/\\M)\İqK\éû}hX»c% \\$”öF\åvõ\Ú\ÒaŠ{%JÖ½›\r›À®M\åxMf4‘\Ûk \ÆNN/\á\Ø\ìkøú(ko],o!õru¨a§õ†\ßıc„/’ÿñ\Æz³Vƒ¸Qÿ\áŸÿ<…¶a\İ\â\Ö\ì²\Ø\äa)«¼1œ\Êl1w‡µş_\ØP_hõN\'šH÷ª£\Û81wÆuò\Ç\ÂŠ\ÇPöA³JS\×*\Ş¦ .?y«.7_H\ÖÀı¡ò!”«C\Ã\Ê\Ù\Ãn¿\İi„\İvhŠ#D\Å1\Æ÷E\Âg$9“’-Ò¢L)Ú¥ğÚ®R™‰\Ü\î%¾\Ú\×]CÔ¿\Ñ\n\Öo½º\Î+69\á×œ\Ä\rZ\ìo°¿LT=…óô\É>\äÕ¹\æb\ĞjUNú`jµºn\Ç&Q²^\'›[(²\é–f®Ï™ª\í.t»)WE5\îFÚõ½°\Òç¦ÿp/¨ù­\Ë-Q\ê@\İ\\…\ÂLdÛ‹\",ö°\ÃkØ/\æg%^P¨™HÆ…SŸ˜y\Şş\ÃôM\Çtl\ã›\ÌgwU)UÁß®.R­ ?a—,úº¡ÃŸb+PªwxjÛ™—;\0a««6\0“\Ğ57¬ô\Ü\ĞQc‚.:\Æ}I/\İ\Ø.OŒ¸z¥§Z@œTö\Zf³\ÙV\Û\Û\'œ\0ñ\nb+Ú…AQ4ë­«x\ÚDöÿ¥÷0¨'),(4,'3_358013bd2180e794e2980752e0ece3d758da253a',1705222428,_binary 'xœ\ÍX\ës\â8ÿ|ù+4¾\Úı°u0&ó\ÚÊ“av<˜d’)—lË Ä¶¼²L€­ü\ï×’l ÏÛ»:RE\ìVw«õë‡ºÁ­F\ë¾ŒO‰K£M[v[Q|–’\Ş\ìİš\Ó2:\ïÆ‡“\ë\Óc4q\Ô\Û\é\È(\ÂÉ´kÄ‚ƒ\Ş\ÎN\'&#†yFD\×\ÈEh6\åò;\ÓD;ÿ˜\Ìh†î‰—QA<¦\ìp o‰@ù\ØF&¢I–RN“)J	K#‚C¨#\ï@\\ñ€F!\'±”$(c9÷	:\Ô&£!N\à8±|<\á8&÷ŒßR*(¢%ò9ÁB\ïø\ÎR\Â\Ñ\Å\Æ|\ÆnNQŸ$¬\çI\0kıÑ§Jÿô\×÷[[û,]r:	d9NÓ¬Uku\ÄÂ§\ÊŞ£\ã˜“Q–€µœl‰³˜\Ê\' \â:‡ƒ\Ü\'„g°\Í 	±\09et§^®	\ĞiÖªT\Ä2eö{Æ§•\Ó\ØxAEDz4– I-èŠ\Êò8\Æ|Ù©\èõ\ÂA	 \Ó5¦¶Å‚q\ï\Zú ‡\ÃU”\â\âÓ©hw<,aÁG—ŸN@\çˆ]Ã¯¾gY\×¥ú6\â<\Åœ€˜\ÒLW~…kW\é\Õ/Y.\Ì*„zòùs‚6m\ç»%¿]~gM~\nHGy€$¾<g×ˆ\á\à4\Å\\T$\İ°ÀO\Ì\à•²L\n¹LyO²H\ß®3N\ì\Ë\è\ZÍ¡€3%Y0ı,\îs4\Ø=Ğ’?\ìu!>\å\â8NÛ¯q«xcQD¸”8\Õ®\"#PbşœÍº8\ÄV\r;{¡\×tj~\İj„~³&6&»»\Ş?_;D\ÄH¯C“4H#3£A\0¤ˆ\È\íú\í}_s\İL@:5\ĞG9\ÈOVl50zyMV#ÿ¬jM>\ß\Ìı\Øò\Ïû¸¾Šò\Ï\'-/9O½«Kÿ<v–\Ş\å¨zıù<\ZÜ²\å8«ñ\íÀ\Z\ÓÁş/Óƒ\ìúó¨zŞV~1#W—wŸú\'\ÉÍ§(¿\é_\Ö·\"\ß\î7ü[WŒ\î²ı¥\ïf\æ}¸Œü\å q=a÷ \Ó	Ïº]l\ã\Ği’ºSÃ»õ0h:v\ÃnÖ›A³4,\ß\ÆUÇ©Ve\âıeˆ\\Wğ<ƒ\ÊvÊ¡*rAI¶A\åÏ™h¿£^lL\çû‹dYP­\éAÂ´}n†”DÁ²\ëú9\çPMN¡—k¤\é5\ZM¿Q³›:;\Ø\Ûk\î\áºT-\ÛPJ÷\ê{¤¡\nO§\"#\åqn¥›J±Y­w!H\n•©\Ö\Û\Ê\Ä\Ç\ìŠS£‰sÁ|&1\0JyPH.N±©AxyN\ŞLFs#˜‰eDTşR™d-\ìe,\Êi#`Ò¤UEò\Ït‡\Äm	\ìQ¸W]Ã´ŒÂ¹\Ø\ïŒşÒ¯\n±¢j½\0şV\å¹,Ë²|L9\ËÓ­û¸˜G\Ø#\Ñ#~E1\ä\Õò:6:LŒ\Şş\ït²\'¥\nN~\Ï)\ÜõF\ï§NE.\Èf¡¢t¾`Â¶±\ÊyO.‚\×ks\á\ër»­K}\êr4‹J÷¶«‹\ãü\ç®ÒŠ6¹ñØ«yı¥È­GıyÁõ/F>Ã·]\æµñw\Ô\èR\Ù\æğÃ‰?š–\ÃÛ³\åø\Ãb6œœ­†·\Ó\å¸?š\İ\Ü\í\Ñ\êz5\ê\ï‡ñ\ål|5´\Çıs:\\]ƒ\ÌA<¾ú´­N¢ğh\Ø-;”\"òŸ7#…\Ãõ˜½\ÔKtü8)\àNUÿU°o+òDb\n\Æ\"C\ÇÁ#Á(^{/†®\ĞiV°?Í¹·=¾V¹Hk(‘ñøüPk)hÛ–CR6\åTº¦ôm–{1ıŞ°~T\é7†0Û >\Ê\ê¬\Íx\ÙÎ²<sÌ†\ái¬w*\à£\ŞSwo\Øô«4öQp|C;W²ş)\ã÷I–¹\Ú\É|NS@‡û\ĞĞ©NŠQXÄ”Ù®Ï³™Ì˜\Ê9\Ñ\ÃMV9\Í=M*ñ_(\éŠ\ì\Íù…b|›ıl5ª»–½[­C\Ï¨*¦\ê\Ûu\Ã·¤œ\Ü\äHgY\ë	o1 IµzK•7\Å\Ô^\Ïoz|“\"UÁşŒ¸ªum\ãVM{JQH§’¢\ÆI\Ë\Ñó\äDNĞ‹\Ìi \'¹n\ã&\'>\ãÁ†\Ô‰‚QnU‡w5„|!\ä\Ë!\ã\ä\Ëi©ğË¹’=}º\Ñ~x\Ğ\ç‚\0†cx8#j[n\0g‹\çşfC¹ƒ˜qv/õŒ˜8a0\í/|’Ê¼„ûª^\âD\é‚h·‡¡eTa\'x¨\Ép,\nøz\'…G\r4“{Ù‡Š+\ç8ÿP¢v,g\ÚB‹¥ Hó\à„=B˜‚A\Ñ@6v4CXs˜7ç‘’\ÙMô@µÏ§¹œw³$ğ\ì¶:M\0½ı(:V&\ÈP\É\É\Ùf´wK“Gî>	\Ö\Z!\È`€¸ƒöËª\0hvÀğSNBªl”\å5£ay!#éˆ©ùG\ÒÀfCÿ¸<#Zõ­ Q€=ò\Õ_Ğ¯\Í\Â%²\ë-¿I\0áŒ‰_iB\n\ÓVU>(;mP§B©¶\Õ[®ß¬¶\ÚJ\Øs\Â]¶\á	¥‰÷\Ù\Õ*©j®)\É\à\"Q\Ú	fƒ†\Ö¥\Ğ]/hwLŠ·H§z¢.5¡¸\Ô\è‚-¹4^oÛ‘lSš2]}‰m¹´ùsG0a¹\'aÍ¶t\ìNû[£!zQV‘‘iŠK?\Ê)?*ğ ™+.\â\ê\Ğk@c\ÈY\ánA.cnMt¡±+\è2<Ã®\ÆÀ•÷¦‘9t³\å!¤\âç¾´ù\Òş»}ùv\Ìı8¸,ÿSWÿ;–uKx‘\Â4 ¬—Wf­V«×š\Z0\0\Åi¹b\Ù{Uµ\âW\ßO³¢.­Á’H×–úÿ\rgÿÀ'),(5,'6_69399195db903f2a0b302d475b28b3717198b4b8',1705222438,_binary 'xœ\İYmSÛ¸ş|ùª\ï\ì~\ØY7~É›C\Â\r¦»\n)-´lË‰À±¼²	;ı\ï÷H¶\'\r”\í\Ğ;;f‚}t\Şôœ£#\éwZ¿Rø\Ò<!.\r´]\Úi\î*Š\ÏbAb¡Á[Ã®¡û\â\à¤?¾<=DS1‹övºòŠp<\éi$\Ö$\à`og§;##ŠyJDO\ËD¨·\åğ]G;ÿOiŠîˆ—RA<&\ìp o@ù‰tD\ã4¡œ\Æ”–D	†RPG^€¸\â9ŒBNb	‰Q\Ê2\î\Ô\Ï]F\Ç8†\é\Ì\ä\ã\Ç3r\Çø\r(¥‚\â(Z Ÿ,r‹¿\ã4!\ß`Ì§\ì\Z\á8@õIœ\Âx06½«\rNÿxY1\í³dÁ\éd*\é8m\İ2¬:bá¦²—\èpî¤”\Å\à-\'1`SB9\âD|Aoa\"w1\á)˜\Æ!\ã3,@Nù#Á©—\å\è‹$\í\Ôjb‘0û%\ã“Ú®\ì\0¼ \"\"{\ç„\ßJ?h@\Ğh tukùhp\éiF±`\\CE¼{Z>\Íşñ¹†jJmñ\é\Öòøv=,`\0Á\'ÿ.?İ€\Ş\"\Zô4¿	ú\"œ¦=-”@\ê[Hˆ³Ho\à?\Ñ\åT]ù.•FxÁ2¡8h\ãómB\î\Ú\ÎwK>]~gI\Ş¤+g…H\ì\Ëyö´Lœ&˜‹š¤\ë¬!ˆÄ”^	K…¦KU\ìd\èV‘\ÓM\ìË§V\Ëô8ô\Û%\Ëob\î~\r\åOW¹\ÜOƒ¤¦üÏ’İ‡¸Uª±(\"\\JÁ\èWi(1ÿ5N§=§\ÙB¿eX¡\Ù6\Ãf½\Õ\n-\Z†\ÑnÔ±×¶şûÀ s ?öº4N2rT¦4 vÙ¸Õ­\Û\Õ}şèº©€uüYC€C\â\ã{v2fô\â(z;¾ùo\rsü\áğ\êÖŸ™ş\ÙÀ—\ï£\ì\Ã\ÑÓ‹\Ï\ïı…6s\Ş\ÅÈ¸üp\r¯\Ù\â$÷\'\×Có„÷Ÿ¼J/?ŒŒ³At\ï\æSòş\â\æ\İ\à(¾zeWƒ‹úğZ$\'\×û-ÿÍ\ï\İ\ï³ı+¥\ïjê½¾ˆüÅ°u9fw \Ó	\ßöz\ØÆ¡\Ó&u\ÇÂzHH´»e·\ë\í m-Ó·±\á8†!\×\Ü\ßF\Èu\ÏR(i§\Ê!”¤+TşúùÏŒ‰\İ\í(\æc‚G\å¨?%ş\Ç\æºY~4UŸ\Í	x\Öoy\ç\Ã:,\ÌbÀ\çzHIl]\×\Ï8‡\Òr\nE¹ûò¥avè„¦\Ñj8gaŸ4š-Ü²=³\Ùp\êN3$†g{–£ªP·&Sg}AVÖZoSk\ï\\Ê”µWY–›«Zñ\ÊBU(¹\'œeI¥Ô¬—µ{$Z\ãW\rÁóCKV\ß\0S\Û;–TRvºi‚\ãR)\'fvAm\ï—nM\Èm´¦¬lqª\ê~+¥Öjùp[–\ê\'z¿f.\Õ#\n\ë¶¾Y©\ÛR\ÏÀX±\Ò[÷Œ¥\çª>FWë­²‚Ÿ/ø\\ø´Œ\ä³xõqå—©Òƒ¸¨¤3\Ë\ä\ÛÊ²™«µ8ÿ™\É`~;şF˜\Ì&\ë	a²ş}a²5L\Ö“ı„0\Ùÿ¾0\Ù\Ï\Z&û‡‡©ş„0ÕŸ=L•±Ç¯\ß/\Ï=;\åmd\ã8SÁg‚ùl\×e_\Ò\à\îÀ)\Öó½ \åyìª¡W%S±ˆˆºP9\ÚÁ^Ê¢L]4\Ã|Bã\äŸ\î8™\íB4±G\á\Ò<\ïi«J)\È\\|_\\W|^†q;[!`aø\èD\Ë\ãªö§R\×*ó\Çş\İh<\\_¿½?y=Ÿ^\Î\Ş\Ğ\Ë\ë£\é\Õû·öñ\àğşò~:½\Z\ï\×G7W\ãhvùşr~l½»\r\ŞLOCûdpt÷\ÊKx1ù¯\ï\ÛÅº\Î/z\é¶\ër7\Æ\ë\Õ\Ş\éDù^°Wy\"\Öc‘‡¹†\à2(±(^Wº7òósÁ¾y˜~<\í—*«\ç\á¥NCú 4óftóÀ¹&\ìeB°ª8’*N!Qe„5\ßyÛ¬\Übª§ª‡’Ÿseòa¿k¹\ãŸ\í…\é‘JÑ­Ap÷6ód½VuUb-«\Ğ\ê(Y¿\Éø}’e¥\ë¦>§	„œû=-\ïqù,k\Êm\×\ç\éT.µ\Ú\É\Û~i\í4ó\"\ê\×\Ş\à[|®¤k²u\Ñ\ç\çŠñ\åuú›\Ù2\Z¦\İ0\êp7\0TÓ\êi\å\Í,¸4Ê¦lvš\æ²÷9†¬‘$«\ŞQeL1\í.;›ycSŠ ‚arU[gw,\ÙVm*E!HŠj´šN\Şi\ËN\\\Öo!\ÍxúR›E#–Ÿñ`EjƒDÁ(M\Õ\á]5\è>õ\Ï?õ\'ŸNK…ŸÎ”\ì\é¦m÷Ë—|^ò0\r§D°¥˜\Û\ì\Ö_”Ä”³;©g\Ä\Ä\Ë\â\àp\î“D.…a¸¯\nM\Ç\â‘!ˆn\á\Ú*A\èhX‚\\†iÁ‘\Ä~nI\áafc/\"ûP¨e‡\Ó\ïK\ÔúÁ²\Û[h1\ä\0i–\0œ`#$\\*\ZÊe\Í ,2N\Ò\Õ|¤dzC“ƒ¼Ù¸\Ï\'™\ì§+I\àit4:‰½ı(:T.\ÉTI‡ñ+Re´¥\Ë#(°\Z},5B’½\Âş\r‰«ó/\0€?\å$¤\Êg@Y\îNŠ†\ç2“˜\ê\rJ\Zø¬\åm÷\à+¢Y¯$l-V?`ş\à\Âö.q‰\ë\Ò\à\ØÁ	Î˜øƒÆ¤ˆ5\íòAùhƒ²ü‡cW½eù›¹«	Ôºl\Å!SN¼K+T³¤ª¦_I†ğˆ\ÒK€\é\Ü\Ğr½P\İ\åP$p\ÏH@q…k4\ï4—\ZP\n\è“\\:[šmÉ¬ª”¶LE7\ßù*¡mDşŒ\ìÔ´¢#`7y¬s4d0\ÏËŠ1’\âÀ#Òœ\â\ÒØ²@Ê\n<h\ê\ÊQ¸šô\Ğ¬W\áV —ù¶$º,*\érxyşº9®\Ülİˆ\ÜÂµ œ\Ä©ø\ëXšk±l>w,Ë¸@x\Ëòğ¯ñc\â++–œğ<¡<÷^n––e\Õ\ív˜\0€fI9b\ÚMC8Å¦7Æ“´¨HK°$\ÃÀmJıÿ\ï©hd'),(6,'6_870cfb5400ccd0b9c34b519340730e81400a1e01',1705222442,_binary 'xœ\í<is7–óuõ+f\æKj%Ş§h¥dJŠ\å‘d•H\Ï\Î\ÖxŠvƒ$¬fƒ4%1‰şû¾‡«A6\Ë\Îfk§J®Š\Í\Æ;ğğğ.\\!ıNÿ	•WdN\',.³~ûXµD<\Íhš•\á«\Ön·û\åÁwg†\ãÿ¾=/-²err0ÀJ	I\ço\Ê4-c%ñ\ÉÁÁ`I3RŠDHš½)¯³\ÙaÁ\ß–şc¼`²ôH§’e´?Wü‘\n\Z—¦›0ÿ\Ğ(–X*WL°t^ZQ¾Jh)\ã%	\ì\èw@®p€”f‚\Ò_Ñ´$ùZD´4\Ô\"—®I\n\ÃY\â\ÏA–ô‘‹{`\Ê2F’dSŠ%™\îñ¯D®¨(\î	ş¹DÒ¸”°ˆ¦\à\ë4\ØO7+?\İ^y]G|µl¾\ÈJµ^¯{X¯Ö›%>\ÛevT:q$\ã)H+¨G\ÈÙ‚2QH¢Œ=À@S*$ts™Î¸X’\è”<8‚M×º!\íg+Ù¯T²ÍŠ7¸˜WA\íZ\Ã\ßÿıør|u\Ş\êv›³˜Fˆö¢N7®ö:\ív·Û©·iDº½ğJHg‰®\ÏÇ§/¥qD\Ã\Ñhruùvôµ!\İ\å\Íğ\ê\ã\ÙWË©I¯.o^L\éH\ß›°\ï¿Y\Ö÷\ß,\ê»óÓ³ó»³Ó—\ÏÉ ¢\İo0\åñ8•\àş\Ûş\Ä\ì¡\Ä\â7\å¨].E	‘òMy†şQR\ÆtF\ÖIf¾À¼\è!Z\âÿš9?\ÒĞ„lø:;¬‚_—vş|¹A‹vğÍ”/§?pÍ¨\ØË›ñd4¼»¼µk”v\êQ»7)™\ÍZ^TmÎ¢^³\Ú\ê6¢vM{\Ô>’/P*0e\'»ö;¹øğa|~÷\ífü{ 5#½¦ú:›\Ö\Æ¶)Gå¢šKMc°Plª7û\åŒ>e\n\é\Ø%w¤\n$$Z\ĞIL2R>&ı&f½¶b4cslQy°\ÖÓ‰pÌ²„\Ş\nşÀb\É¯™<)h\ÄEœ7u\Â bWMøVi\â\Óğzôi\Èıtk~ºS´·»”ŸŸõ¸²§	cJ$U4°\Ûò!\Ê;\Ä²…\à\È\ç†g\Ò\ÔùSDW˜.g§ş;$iö–\ŞQÉ“\Z+%ô\ËU\è	~\ÔAd“ \ÃH÷TG\Îu\àLS2M\è\é:ã˜€¢!jm˜P‚\É\Øp©)•ƒJ\×+P\'ô1ƒô\rŒ.![>mõÚœA¦]C’\ËÇƒ”ò­\Ît°9ó5&j™SN«_fó´wš$\çJ¤F“X^¦o©\ØhY‘o (\É‰h\ì8^pñ–D÷4õ\Ço@¦¿tÆ”Ì eƒVˆ\0~BK:\ãQf,d.\ëª(.4Öš\Ñ(…m\Í\Õ\×[ŒDQñ€\Å´•şF«‚À\ê\ÕuøtBp]±”š¹fı*şP26€™®ûª\Ç\êk­¿jÇª£¬l\'<\Ç@gÒ\Òk­\ÙV™Q\Øf˜\ÌJ	jº1ÊšoJ&d4	\ØK\Z3\â5\êLc9BÃ‚\Å1Ô›¦xA—\"\Ë\Ø\Òu\ÛA«ˆı–.š\âd.øz\åOp£X£\Åc>ZOQ©\Ò\ãó{=\×Z8™#1np2©[&,’uŒô7FLN°\Æj\ĞN¡Kğ\×l\â©\í\Í5Nxb\Û\Ñ	¦\Ú~\'Z“„$ô&n\ÏÈ¸8—µ­¹lÿo\Ï\åoY\Üÿƒ\éµ\á\áÿt~«\Ìüš€¥H0Š[ey|i(ÀKk\Z?§\à¨\Üw­aô„kŒ¤\Æ_!‚.m]%\ë9s@¤¸ğ\ËÂ²V\àZRq±N#œ;~ô;×‰MGÁ· 3™	²:<k¥P¦\ÓÏº»Z4ù¡\ßjú.„Jûñ\'³\ÌlX:m\İQ\\³A5ª“Yü_\Ğ\Õ¡¢+¨®\ÙV A€ğQ)\ÍÀœ\ßKV…\ÃT\Ö; ¬ \Ê0½ùp-„Y.\ã)\ç5S›*ˆG\Æ%ˆdc•\Ä*!¨,2&si|Teóo§ˆT\ädz\Ì%\Ú\æQóÁ\êúd:/´\Ã\Øuù¤8§\ÙL\Æ ! \Äh†Y\Û(Rı¶ö\Ó6\ß\"\ÜxØ§É®ƒÉ´¿º\î«@ t½¼\ã%Ö°²£=ƒFcšÁ\ï\Ìó’Z+70‡¢á¡@ÜƒlME/‡\è(.g\ç\ËU¶¹‚r\íf½4£Kò¯Z7€V`½²\Ù\Í:I\n\"t,$¤S¦¹ˆº¦zt¦R U²o„]÷²I\àni<Sii@¨\ç–\r\Ï\Ìcñ«ë¾Š³\Ôô¢H(„`õEÿµfB—\á\Ûbör`sµU\ì¯a<\ç\Îcº\ë](\ÔR\È\"	!\é!d\ZR Qe\'¬¬œ;@˜\áÊ¯V$[¸<aQ‚a\é\İøúJaˆ¢2\Ğ\ãrxHd¹JX p\ÖQ‹«Šÿe0°¢T‚qÁ†$‰\Âı\æğ\áŠ\Ò\Ú6Dñ¹–¾¥A_K³’»\êXP¨—‘‹\Ât´t{(¸\n\\ùûhH\Ğt \ÚM! ©ıÅ ¢\èÓŠ¤1†‘°¢røA\Ñ\ãO]d\ØQqª¸×¥œ–\Ğ5Xb•\Ílc(‚p\æ8\ÔóoË —7…\İIi#£ñ™‘#\ïV£¥¹9-¤\æ¢êšª=h[P\íüléŸ¡9Ÿn2*ƒs® A\r¯§^\î\×\nq\nW\é\ÔkQB\ê_¡[Z!\á\Óp¶=ó\ÊV\ï`0£ªª\Ät\áıl\éŸa\ß\'ErF<hg\Ø\Ç\Ö]¸\Ü­h\ÄH2\Äİ£\0›N«À\n7¢¨\ê<\ì=y º^‡\Õ\Ñ: Y½µ;X\Ä|=M\è[E_!N \"<xQ4\è:s\Ø4´`/m\ÎŒ…¬$n35vtO7°Pˆº\í\åÀ)±4¥Â¦b\Ğğ£ù‰v\ä`Á`\æ õ]ÒšÜ“1\èp_Eij\ÃáªR¹\Ìö\Ó×·BƒFIO6·\Õ±¿Q6Q\â±P\Â5–7~\ïgKÿ\ê \åc(¢Bª¯ùÀı<´\Ş6\Í!\ëÀ„WnùŸ½ü3TµÁD¬¨K„\Ûu¿…R4Y…©:´oTğ¨\ZÁÒã¢“Æ£}•%.¶qBS\Ê\×\Ù^p°=\0¥Tv–¯\Ûv\Òyº4\Z\éKV@>\Şeš\íEm¨)™±§!_.ƒk\Ó\æFP,ˆ	\çş¼\'\âûAÅ¨eı(\ãbw¹VË‹ı[U¸¨Ç‚†N\×ób\çm	M£XUs¢\ï¥\İ3U¼Cû\ì­\ÛI¿S7»„Ş¾ j\\ğ\Ç3*Uö1[xf.\ßPl\ë±e2#Ë•\Ú1\ëT[µF«\Ñ\êhH$b³Y\è \æ\"AL¨6\â?d½‰‹LYƒŒ\ÚÖ˜4fYÂ£{·‡F¶‘\Ü\ØX\ãM‡õövgR\ë¦¨‹”Iú\Í\Õt¢\ïø[¦ºY\ï\Ş\Ûm\Ô	, \æ>ß–\á³\Ù\Ì2Á]1Àş¥<T‡W0ˆÿ,G<KÓ¿ñw¯ò\ßfop«	Ü©™RJ\ï[ıuv>\Ç›\Ìú„%¬nğy«­¼‰:6\Äxœ2™R@´“Ä­fª|]i\î Ç˜¡‚\Ó» eÖ¶ 1œ¨OkZ<;ù\Zd\'Xk40õS#Ê=CÛ³M¿k|«y\î\ïŒ\íY$†â¡¹‰f.róEÙ\Ó\ÚE77™\Úg»1±oºNÀ\ä\Ä\î\\+¹zx\Z—p\ËI\ì;r¾mÁ>fA)i&½°¥70•A°\á‘Å¸\ÂÏµ ZQ\ã¹\ÃôL+˜³bX÷Q§\\ï¾º~\ÌI€dû\0\é|{´DšXlû©Ú ]4WOÑ~Àn·\âˆ>\Ù5ûû-}\Äf¾\ÔI±rR/d9\×òz©õ·|ĞƒXMN~\æ|\é\Änôw¼ü8?¼\è\ém¯\É\îq#®p}WË–ró\ÂŞŒ% F£h\ìùECCd\"U\Z\İ&\Ñ\0Z]\ïõ\0œ\Ğ\Ì=D\ÌD\Ìiæµ¹\r§D [\ÉhÁ¶/Jù\Í~ğBfUhüø´LJxš\Í\Ó7\å\ÚQµ\\RK*†—\Òô€øj\Z“„§ôMySZúñ\ä`0n\\\03\Ü‘ú\Ë\0“d~™e ”f%†*~S–g\ç;7]6”Yœ¤ˆ£ğ\ÔFœcD3T™<òN\à/!şe\ĞD€\\±xÀ%¡eñ ú©õ+*Ì€O¨‹m0³©N\ä Œ\Ñww„XG²L\Å& aE‰¸3¼ŠŸ§“ŠRŠ\ÑWE+lPñUY6ÑˆDX5±)KX¶)œ\â‘\È6\Æt³R™…\à“\Ì9xG\ï&öo&\î¬Ás\Æ¯ƒA\ÃAˆ	”7&\ëf¨X\Øö”sÕ›[@˜²„Ëµp6[wB¹—6B6óu\ê2—\Ë%Eo¥ñ\Äß˜³ü?ığ\'\ÅÌ†•,›øW5w6xú—g=fsxò7’ü•n¬7\çk:¹gñ\çDö\â{\É?»Š\İ`\èû\n6\å½ö\ÛvÒ·o\ÔN£ u}„Ö·¡\îJ\Êk\íúZ»¾Ö®¯µ\ëk\íúZ»¾Ö®¯µ\ëk\íúo\\»¾°–\Ì:b.ht\Ë\âÉ”\Ägú¢>•\ÆR©ek\"ñ8¿—ş(_O\İm\èx×¡Qÿ>\ÂÕ™W,\ï\ßQ©b÷\Ñ”\àf‹ø\ç÷ú\ìÀ«µ\ëºJ‡ş.—s¼ƒõ\Ó¦b„!…\ãM*²1\Ç\íóK{­|<\Õ\n\í(Nx«N\Æ\Ş}EwJ¾\Ò\×\ŞT¸sB4}9\ït°\âé•¾]hnû\Ö\ÉMö~]~yÁ´\é·Ag\ç÷g£b%+·\ëiÂ¢JNS1\Ü&ù\è3ø\Ù\ÄP›ğr\áÇ›¡¹\ß\ØŞ¾\ß8QB ‘ı¢7\ÔÙƒY° À_z;\àœ4•%“\ä2\í3³0\ê\ÙÂ¸\0\Ó\ŞÅ¨™WqöJ\á(3\×š\Õ\Ş \ï·ÔŠm%\âË•\0G-HsEs\ê\Ü\ÇB‡\èÈº¹®n-ù\Å\ãÒ·‚’{	\ê_\ér•¨n¦\Î=Á5Ğ•Rø/À¿¹…\àw ƒ÷Š±VÁ˜\ëZœ¦¾\ê§4†‹“ü 8%8ñúf\áû\Ù\Ï*@\ë(r\Õë‰2&K\ì±DOEˆ	\ÊCsNŸ\Ã;[p{\ÉõÆŒ@ŞŸMi—-ª=¦#jqµÛ™\ç×HU^rñQY:\ìATQI\Ïô³ª >K4v\é®Ö¶k\Æ\ä1QEB.0Bÿ¦\İcŠ‘BT67M\Í\"vf\é÷s\İr#o%i«]¼zF‰“]3*ƒ~#ú!Ue\Ö\Ô.VI’Ø³E›\ãğÃ“º\ïŒ\Æ3t¦z˜º2¯c\r\Í\İ(Ù¯ö\ìInğŒ\Ë\á©;S‚\é{„ùeğ_l9Š\àR\âJ”\í¬$R¾\äñ:qn¡“\àü4\Ó\ï\"½¹4ifSº›S\í\Òm„\\±©¿/RÏ±·!¨B)w8¨\Ûq;,^~1¾£oŒ¨½7\ë(\á#òp\Ù|\'|DR•\Ó\ì}s¡\Ñ\ß\êR\Í\Ô%\\¨\"oOøü4…D¹\Å\\«ğb\×h_\ç\ê\Ë\ÅN	Mœ$¨‹©9uµ~`\ÒDz}·û¼\Û\Õ²ªv%e\Ó|³“xxø\îlò¥´wxx\â¸Í¶\ÒY\Û\ÅË¹um›\Ë@˜©ª\á\ä\×AEÿ°\Åš\ÕP\Ç^‹\r\Ô;oÁ-ŸsG‹ô¹\î<&·X —ü\"’~`n×¤\ÆA,À`Si!\è{*UNl…\É`.®Ù’wÖ£x~+Áhme\Æe\\!\Â\'oa\ÙpüK\íÏ²ü—úŸ¥a\Ü\Å\Èq©\ÜfÛ•l<Ù…õTğ(P\ÔôV\É0\ß\Ämv\0õõ!oU\rş\ßø!\ïAN\à?¦ä³µ6¾y\ÙWkö\0˜[%\Ê\Ê5a)¾9Z˜›–ê¶£¾ôı^Şšk\ÙÍ–f	k.ú›\Å\ÆPG¬Š•\r\n\ä;\ËÌ¥œ–\×\ÃĞ½Ÿ5UuË¯ª\ïö¡aEğ‘P\Úk•\æ\Õ[N)n (Y÷2¬Wm»2E\ä™\ÒDn/‡;\é=O„#³\Ù\ê#/\Ãu\İ\ä\ŞT\ê•\ë@\ÃN*?¾û\Ç\ß;ÿ\ãŒõf\Ùq£ò\Ã?ÿymƒŠ\Å-\Û²\É\ÃRyc8•\Ùb\îkıÖ° ¾\Ğ\ê½N4‘î£¦\'`l£\Ä\\8÷–ÌŸ1¸—Tö¹´JS\×*>\n¦ ®Dy£\"7\ß_\ÑÀı¡ò!”\ËC\Ã*\Ûk\í^³U­µ›5S!‚tGA\ß\ç	Ÿ’\äTJ6O]™’¯¹s\áµ]¦2k»u\èª}µÙ»‚¨­¬Šµ½\'prÌ¯8‰=\Z´\Ø\ß`‘¨z\n\ç\é\Ù>Ö¹\æ¼\ßh\ÖPúdjµ>ºn\Ë&Q²Z%›¨·\é;–f¾Ï™ª\í\Ît»q‚«ú\Z·	#m\Èú_­\Ğçµ¦ÿtÏ©ù­\Ë-‘\ë@]{…\ÂLd\Û\ë#,ö°\Ã;Ü­ó³\Ï)\ÔL$\ãÂ«O\Ì<oÿŸgz¦\ãtl\ã›\\Oo‹RªÚ¿Y\\¯ZA\Â.YôuC‡?nWPªG|j/š\ç›µF[\í(&5\ßHü°\ÒñCGŒeº\è·(ƒt£8?Š0\â\êí”z¥qR\Ú\Íz½\ŞlÖƒ§ íª‚Ø—va\àŠÆ®\Ş¹Œ\'¸7÷ü?7\'Y'),(7,'3_658fb09c5e00040d00ca934d7afc1558ab619507',1705222604,_binary 'xœ\í<is7–óuô+:\ÌÌ—\ÔH¼O\ÑJÉ”\Ë#\É*‘­ñ\ìIX\Í\è–\Ä$ú\ïûn\rÆ²³\ÙÚ­’«b³ñ<<¼WÈ ;øE\Â_•5Y\Ğ)‹*\Çl\Ğ<V-!ORš¤øªw:Aeø\İÙ‡\Ñ\ä?oÏƒeºŠO†øO“dñ¦B“\n6PW4%A¸$B\ÒôM%K\ç‡=wxüy²d2x¤3\ÉR\ZÀ\Ï5¤‚FÁl\0ó\Í\à0`‰\\3Á’E°¦|\Ó \åvô; W8@G‚¹ 4\àkš’g\"¤ÁH‹\\“†³ÂŸ‚¬\è#÷À”¥Œ\Äñ&%©\îñ\ïD®©\Æ÷„ˆ%ÿ$\nb\ÒD<K\"€ıtó±ú\Ó\íÕ‘\Óu\È\×Á\Ë4¨÷û½\ÃF­\Ñ\nø|—\ÙQpş\âH\ÆVP‡\Ó%e\"HÂ”=À@*$ts™Ì¹X‘\è”<8‚\Í2İ‚öÓµT«\éfÍ›G\\,ª‡‡ ö­\á\ï¿ÿ~r9¹:\ï\ÍÃ°Õ¢½N³FI·\×j\æœ\Òn¯1oô\Za³x\ÒY¢\ëó\É\éKir¢\Ñx<½º|;ş\ÚÎ\îòftõñ\ì«\åÔ¤W—7/¦\ÌI\ß›°\ï¿Y\Ö÷\ß,\ê»óÓ³ó»³Ó—\ÏÉ°ª\İo8\ã\Ñ8ğGÿmÿ#ö°\èM%lT‚0&R¾©\Ì\Ñ?õ÷aD\ç$‹Só\æE\Ñ§ø\×<÷#\rÉ†g\éa\rü:\Øùó\å-\ÚÁ7S¾œş oF\Å^\ŞL¦\ã\Ñ\İ\å\í\ä¨ßœõ›µ¨_oö;Q{Nša­\Ñ\ì´h“’\éÌºÚ£şğ‘|rX…);Ùµ\ß\éÅ‡“ó»o7\ã\ß\Ã\0­ù\é5\Õ\×Ù´6f°mL9*\Õó\Ô4Å¦FkPI\éSªóÄ£ó’Ô€„„K:HJ*\Çd\ĞÂ¬\×QŒ\æl-*\Öû:NX\Z\Ó[ÁX„!\áu“\'\r¹ˆŠ¦PD\ìª\ß*M|\Z]?¸ Ÿn-\ÃOwŠöv·ƒ\Êñó³Wú4…aÌˆ¤ªƒ&v\0c[=„E‡\ØCºüù\Üğô‚Cš:\n\é\Zó\Ã\åü4\ÄG$I\ß\Ò;*yü@#¥„A¥=Áˆ\Ãbt\ê\ZÈ¹œiBf1=\ÍR	(¡\ÖF1%˜Œ\r—ºR9¨4[ƒ:¡9¤o`t	\Ùòi«\'\Ğ\æ2mI®R\Ê{¶>\ÓÁ\æT,2LÔ² œö \Â	h\ï4Ï•HŒÆ‘¼L\ŞR±Ù¶\"\ß@P’k\Ò(\çxÁ\Å[\Ş\Ó\Ä¿Q\0™IüV\Ğ9S2ƒ–	Z!ø	-éŒ‡©±0¹¢«¢¨\ÔXo9F£¶5W_o\rÚ \Çl…•\Æ\Ş\à‘¥\Ë@f««Ù¼\Ë€ ‚óôŠ%\Ô\Ì7\Ôğ‡’³	\ìt\íW;V_™şª«®\Ò\æS^` C\é\ÆG\é´\Öm«LÁ0l3LQj\å1\ï@ŒŠæ›‡i2\Ú\ìqšÀOu¶±¡aÉ¢jN\Ó\0¼ K‘¦l•w\ÛEËˆÜ–š\ãt!x¶v§¸Q¬Ó¢	g3T«txDü^Ï·\ÖN\è\ØF$œT\ê–)K\Â8‹ş\Æ\èƒ\É)Ö¹B\r:W\è\n|6:*G›\Ë§<¶\í\è3m\ÃS­ƒi\ÂNcú@\ã|\ÏÈ¸<—õ­¹lşO\Ï\åo\Û\Üÿ	¶A\âu†k\Ì›°H0[§E”i*ÀK+7³\à¨ò\ïz\Ó\è	W,O\ÇB]\Ù4º³ËHq\á‡­ÀLRq‘%¡\n\Ñ]7\ëô¦c\á[Ğ™LYˆ,Qq\neú0û¬»k5@“\í–\Ë\áB¨\ä}2‹=À†\Ôö\×Å•\ÄR\ã¨:™Fÿ]}*Æ‚\êZ\ê\æ \È„C*¥ø’ó{cÉª|¸ƒúz„\Ô\Z¦÷	eB˜E30q¹3±	Óƒxd\\‚A6\ÖXI¤Ò‚\Ê%²\ÆG@U6w\ËHeN¦\ÇB¢mu\\¢n£O&‹R;Œ]Qj€šNÀd|Œæ˜»\"\Õok?ó]\"\Â\í‡}š\ì\å0/™¶€òW/ÿ*‘(\ÉVwüÑ£\Ä:\Öwô£c\ĞhLsø:^RoAS@\"\ß1\èƒ;­©\è°²\0]%À\åü|µN7WP´\İd+3º¸øª÷<h%f\Ğ+›\ßdq\\¡k!>2ÍµD\Ô\ËA~ª·`A÷~*òQ\ÅûF\ØË¿|6	\Ü-c*m\rğõò\Ü¯\á™y,õò¯ò,µœ(\â!X\ÑÿÊ˜\Ğ\Åø¶˜ıX\â\ÜDm•ûk\ZÏ¹s˜\îz\nµ…ä³‡PBHzğÙƒ†”hT\é	\ë«\Ü \Ìp\åWk’.ó<aQ¼a\é\İ\äúJaˆ²2\Ğ\ã\n¸Od¹™\'p6P‹\ë–\0+o`E©ã‚Húû-\à>\Ãu¥µmˆ\â-}[¼¾–¤$.wÕµ _/K\"—¥\éh\ëv_p¸ş+÷\Ñ1¯\é@´›A@S»Œ^EÑ§5I\"#~Eğ=	‚\Z£ÇŸºÈ°¢\âTq\'R®K9-a\Ş`‰U6³¾ÀyÎ¡Q|[ı¢\É\ïNJ)ÎŒôy·\ZsQZ;\0Ÿ\ÓBj.«®¥Ú½¶E\Ñ\ÎÏ¶ş\é›ó\Ù&¥\Ò;\ç\n\â\Õp6sr¿öPˆP¸\Ê\\½Å§\ŞPğ5º¥>\rg\Ù3¯lı\Ö\Ò3ª9`¯JL\ÎÏ¶ş\é÷}òøQ\Ä\çI\È#\æq†]oİ…‹şñš†Œ\Ä#\ÜCò°é–±J¬paDU/\àa\ï\É\Ñõú?Hœy$k´÷c{Ë‘ˆg³˜¾Pô•\â*Â—Eƒ®=1·‰\Í^Cóö\Ò1\0\ï<ÀX\ÈZ\âFCY3`G÷t…È£\Û~ô™K*l*\r?šŸhG9\Ì\Ìrhc—´\î÷d:\ÚWQš\Úp´§ªT`.\Óıô-ß Q\ÒÓ˜-l5C\ìo”-ú(ñp(f\Z\Ë¿ó³­zuğ	Q>\Õ\×] \Ï~=Z\ï˜fŸu\à\n\Â)·\Ü\Ï~ñ\é«\Ú`\"\Ö4O„\Ûu¿ùR4Yû©º´oTMÿ¨š\ŞÒã¢“F\ã}•%.¶q|SÊ³t¯\ä°=\0¥TzV¬\Ûv\Òy÷º4\Z\éKV@.\Şe’\îEmª)™³§_­¼k\Ó\Ö†W,ˆ	\êş¼\'\â»^Å¨eı8\åbw¹V/Šı[•¿¨Ç‚†Î²E¹óø¦Q¬*\Ë91\ï¥\İ35¼Cû\ì¬\ÛÉ \Û0û„fg°a4.ø\ã•*ûÀl!³?Wl)6õ\ØR™’\ÕZ\í˜u:\İZ«×©›m»PDf»\ĞBj}-jDc¨6¢?d½‰‹TYŒ§\İÑ˜4bi\Ì\Ãû|l#§¸±‘\á}‡l{\Ã3®÷’)\ÔE\Ê$\İ\æZ2\Õ7\ÜMSİ¬wGo\íF\ê—o\Ûğ\Ø|n™\àÁ´ÿR©#,\Ä\ß*!Á\Òôo<\È\Åİ«\â·\Ù\Üjwcj¦T£\ÒûDİ°f\ÓyLŸ°f\Õ\r.3µw7U§ÁºA¢Lg\Ğ=\ídf«™*\çÖ§?š;t<\á(\Ù4Â®Æµzò5F>\ï\ê\ÓN¹\ÏÎ¶\Ù\Õ*ƒ!/@\ßÔˆ²cÀ\Ğöl³\á\ï\Úõ\Şj^¸›\á#{‰ñ¢|VnB™\Î\Â^\Ñ(v\'±€öĞ¯£Mª6\ÖnL°›e1øœÚ­j%W\ábN\"9\\\Ï-¶œ-\Ø%Ã´\'%M¥3¶r¦R6<²—ô…T+j¼ğ¾iû•y4±¨3®·[ó~\Ì\Ö.\Èö¾?Ò¹öh#‡:)4Á\×öS³Qºl®¢»\İn} k6ô\Ûú\\\Í|©b\å•NŒ\Êf\å\é¬¶œÎXMN\æ|•‹\İ\ì¸õqqZ\Ñ\×û\\\Ó\İSF\\Òº®Vœ&ş\æÄ¹9‹AŒF\Ñ\Ø‹¦† \ÉTª¼¹M¢6–\æ½7<`ˆhB3w19± ©Ó–\ï\äJºLHö@K¶µ¤x?\Êmvƒ\ÎPo¢ıø´Šƒ<\Ä\æÉ›Jı¨V	\Ô\ZŠ\á]4}\î€¯&‰yB\ßT60¥Á\'\ÃIó˜\áÎ‡\ÔW†˜‹;,C¹¤4\rªøME_\ì\\p\ÚPfq\â2\ÂS;o9#š¢\Ê\ä‘sğ~	ñ/e€&<\äŠ\Å®-‹\ÕO}PUa|B\İgƒ™­Ju‡\ÍxgN\àğûhCVñ°ªøxD¬*_,»İ£¾€AM°>~¹Üµ¯“bXµjv¦¦ª\æ\ÆL[U\ÏÛ°\ê\Îh\ÅEbµ\Æf,f\é¦t‰G1\Û³\ÍZÅ…\âH\ÎŸ¦\æ¨\Ã9ø7)h3\Í\Ï8œ˜\âÅ„rLj\æb\âõ\É	º*%¶\Â#E\å\ã\Ö,\'\æ2¹\ë4òJ\Å\É^\n!;‡”ºü\Í¨“R$Å A£©¾1·şôÃŸ3\İ\Òt\ê^\İ\ÙX\"0\è_õ˜Í¡\Í?Hüwº±A¥h\Ì\èôEŸcÙ\î%ÿœ¯†¾-a#a\Ñ\ë a\'}ñF\ípºyB\×u^hcš_ˆy­™_k\æ×šùµf~­™_k\æ×šùµf~­™_kæ¯®™_X\Ãf1—4¼¿e\ÑtF¢3}1QŸ\Âc‰Ö¶µ‘x÷_Adù(bWO½m\èd7® ş]„«3§H\ß!¾£R¥£1(ıÍ–ø;\Î\ïõY‰S\ã7ô\ê\0ú»\\-ğ\æ9\Öm[˜ŠF67K¨H\'.íµ½\ÊñL+´«8\á-B\r˜8÷31\ê*IøZ_óSQ7¢\å\Êy§c&O®ômJs¿¹¡pLŠ´÷	‹£\×¦M¿:;ÿ\çd07U;(Y½\Íf1«M\Õp›Z\ä£\Ï0\àg\Êm^\ÂË”oF\æ>ggû>\çTy\n|ú‹>@`f¡„\é\ÅD\î¤Q¤,™\Ä\ï”iŸ™ŒQ\Ï\Æ˜ö.Fİ¼´W(Ç©¹ÑªuñúÂ ­VBh+!_­x<jAš+©³\Ü},t„¬›\ê\Ô\nb\"¿”\ÜKPÿjB!«nf¹{‚k +%ğŸ‡kÁ\íŸK@\ïc­‚	\×µ8-}µQiK&CLp\â?š­Òµı+²ŸÕ£<ıµ¶z3\ÒW\Æd‰–\è©1Ayd\î%ğ\î\Ü^\ê½1\ãPˆ÷…\ÅFS\Ú\å’j\è˜Z\\\ív\æ\Ñ\Ë5\äs•óø¨,O2!\nª¨¤gúYrŸ%\Z»Ì¯w\ê\Æ\ä1_†B.1Bÿ¦\İc‰±BT67k\Í\âyn\é÷s\İr#gk‹)]C;F‰“]7*ƒ~Cú!Q\Õ\Ş\Ì.’IÛ³T›\ãğ\ŞÆ“ºß\Æ3\Ê\rLõ0Ë«Y¼~62wÁ`d¿Ú³6¹Á3½O\İLß›,.¿Gø^f\ËQ—WÀlgA“ğ²8w§©~\r\êÌ¥I30›\Ê\Ğó9\Õ.\İA\È›¹û1{‚*”r‡ƒº\r¸\Ã\âktõ¹1µ7…ó§YxÇŠ<\\†6£\ã™&‘Te5{\Ã^¨PôÏ¥ºF4\ËS.”³·‚\Ç|qš@ªóUe»ôR\Ù\è_%\ë\ëÔ¹\ZZ8MP Ss\Îl=Á$Šôşú^ùx¯¬¢\Õ\ì’Î¦ \\ó­N\â\áá»³\é—\ß\á\áI\Îm¾•\ĞJ\Ü.^Î­g¬\Û\\\Â\\=T\r\'¿«ú‡-§Ğ¬F:úZl \Şyÿk\åÄ˜;Z¤\Ëu\ç½\Å½W¯ô\Ãz»86b™\0ö›‚¥ s\ì)¨\Ø\Z“Á\\\\³\ì,Œñ\îÿ–¤afeÆ—tC\\ª\Â\Çoa\Åpükı/²ò\×\Æ_¤a\Ü\Ã\Øq©\ÜfÛ•lDÙ…õUø(Q\ÔõÍ¨\Ø>nuõõsU\rşÿñæƒ‚ _ş˜¢\ÏV\Ûø\Êg_µ-\Ø`Vm(«×„%øú\åhiî–ªûúšû{yk.¢·Úš%¬º\èo–#±ªV6(‘\ï,³<å´Fù»aSW·İºún\ZòX	¥½V‰^½au˜\âN’u/\ÃF\Í&°+SF^‘\åö‚Èƒ±“\à‹D86;¾>ŠB\\WNù;R½vj\Ø\ÉAõ‡\áwÿ\Z\á;\ïı€±\Ş,\Ü nTø÷¿O mXµ¸»F6yX\Ê2o§2\İ@\Ì\İa­ÿ\"¶\ÔZ½Ó‰&\Ò}\Ô\ÕÁŒm›+öÎ¢ùsnù\Û1ûL\\¥)\Èk1SP×¢¼Y•‰\ïÎ¿h`\ÈşPùÊˆÕ¡aµ\íõN¿Õ®\Õ;­º)A\æ‡P\ß1Ÿ‘øTJ¶Hò2¥Xu\Âk;ºLd*2»‡™\×ûj\×y\rQÿZ+X?\ë8ş\ä„_q94h±¿Áş\"Võ\ÎÓ³}­s\Íù \Ù,­¢ô\É\Ôjtİ¶M¢d½77Pq\Ów,I]Ÿ3U\Û]0\èv“®*lÜ¯µ!\ë\'õRŸ×šş\Óy´ \æ·.·D¡u\Ñ\n3‘n¯°p\Ø\Ão­·_\Ì\ÏJ¼ P3‘”§>1ó¼ı\Üé›\è\Ø\Æ7™\Ín\ËRª\ê¿U^±ZA\Â.YøuC‡?ù¾ T\ÏÕ¦8/¶ê¸§l6+Ğµ\n#q\ÃJ\×\re0–!\è¢cÜ¤ôÒ}\à\âLÄˆ«7Tº\ê]\n\ÄIe‘õn­\İh4:µ\Öñ\îù+@@ü†‚Ø·va=½rM›\Èş¿—•'),(8,'4_1e6d72b315f14dbd080e4e3f214f6d10ffd46adb',1705222604,_binary 'xœ\ÍX\ës\â¶ÿ|óWh}§ıĞ¹,6&\áM\'›W\Ù’M\Ø$¤»\ã‘m”Ø–+\Ë\Ò\Éÿ~$ \İî¶½s\É±\ÎK¿ó¸\İhÿÂ—‘\à)q¨oth»\ŞQÅ‚\ÄÂ€7»\ŞB÷\Íñù\Ñxrq‚f\"\nû{]ù…8ö’@°\ß\ß\Û\ëFD`\ä\Í0O‰\è™*M¹ü¦RA{ÿ\Z\ÏhŠ\æ\ÄM© 6\'œø\È]\"P~n£\n¢qšPN\ã)JKB‚C)¨#o@\\ñ€F\'±„\Ä(e÷:\Ò.£!a;‘|<\å8\"s\Æ@)‡\áyœ`¡-şŒÓ„ptõ€1Ÿ±{„c…\Ô#q\n\ëY\ì\Ã\Ú\Ù\ècõ\ìâ—·%\ÓK–œNgY­V³R3kuÄ‚Meo\Ñ\É\ÜI)‹Á[NJbÀ,f„r\Ä	ˆx‚>\ÂF\æ1\á)˜\Ä\ã §ü‘\à\Ô\Í4A\0ú\"I\ÛÕªX&\Ì~\Ëø´ºW©\0\ì\0¼ \"$ıa\n*aKITÖ­\ê•<41`\Ò3¦bÁ¸òX÷½Å£á•ªJeş\éVul».ó—°€à£¿‹O×§ˆú=Ã³A_ˆÓ´g|¤¾+>	0ø•¿\ï¤\"=s\äW°\n’^\rñ’e¢bBÒ Ï—	Úµ½o–üóò{+ò& ]¹+DbO\î³gD* ˜‹ª¤W|,° 3x%,†B.\Ê\ã&Ã¦I\ìÉ°÷Œj±X‘«\nº\Å\ÂÙ†ğ»ıwZ\æ»ı\ã¤£\\üGI\ç5n•^,	—§°z\ÊU:øJ\Ìû	§³90]¿iÛ¾\íùVÓ¶Zn`™-»v\à\ÔÙ·ş½\Ãw\ÈÈ‰~—\ÆI&FbF}zE;]úu[\Õ\ç_\'P³Ÿ\rôˆ\ÃD\ÇO\ì\é|\Ì\èõiøaü4ò>˜\Öøö\ä\îÑ‹,\ïò¬%&7av{ú\Şr\ã\ËÄ½¹ö.£\ÖÒ½™“\Û\ËppÏ–\ç±x:¿X\çtpøóô]:¹™—g\á“w¶˜‘›ë‡g§ñ\İ\Ç0»;»®\îEr~\Øğ\Øbø\Ä\è\á;¼Sú\îf\îO×¡·4&c6­\àC¯‡m´š¤Şª\áız@H\à7[v\ÃnÖ›~³\æ7,\Ï\Æf«eš²Æ¾\Z\Ç<hü­J\Ò5*¿ÿ[\ÆDgAMo\ç\ë‚,D\Å\Êi\Öô\ÃYvg\Ş\Îqr¹Ÿ.\îñƒ\Ç+%¡¿Av/\ãº\Çô\Üb\íù\Ù÷m\Ò\Ä9h`;°Zd¿‰\Ò8ğL¯Q\ìfÃ´›\Íf«QS¦[•™ò²\æJ\å¥JjV\ë_Á~ \Õú¥\Ê\Û,\\\Å+{QÑƒ\äş§œeI©›¼\ì\\!vIø‚_Q\Ù:wUeE\ãgô\Çğ¯›&8.¤9ù-£pšıºU¹ ÃªR·\Ãz\ÙO•\r\ïõ”§Ma®d¸Ğ§ú~%/\î\×úK±“<ÿ\ä\Û\××¦Ö±NB\Ñ?vÿõ—<Jú³#\Ö%p&˜\Ç\"pL€Û™}”S\\\Ñõ{\ãy’]Ò©X†Dµj*[k»)3A:(\Â|Jã¶‰\ä_¥\Õj‘¨pb—\Â\åa\Ñ3ş*¸\Û\Ş|^\ã»–° xu\ÃE]±GzÖ™0{ó\Ñx°\ŞO\æ£\Ûy}x34\'\ãû\çÇƒ§»\ãû|üÁ¼‹†O“±O‡g§\á$z?k“›ywüñ	Ö¬\àx\Ø+.#ù¦·\ïy\Î\ëƒ/\İum\è\ÆøeK€w:U—¬œ½¬\ÈqE0º.GP?‡üµ¿³z¥€n29ûf\Çù\ãô_©,÷’•N\Ë\Ô\Ù\Ş\ÔJ\nî†‚•å”M8…\ì\\aM37¢ß/úû:¶\ĞşF\à–ºcv«Úƒ\İ.p+&k†Íš\ïV!<ı\ÍH¯\Ùô«ôğE^ü‰K[ÁúE\Æo“,zV7õ8M\0\îÁ\İM\İÔ¡U@L¹\íx<\Éb©^=¼¤Õ‹Ì…Ñ£ú?\â+%]•—±#~¥\ßŞ§?Z\rsß²¬:ŒS€ªb\ê«Û¹¾–\Ã\Ù(\'39²Y\Öj‚Cø%©Vo«&¤˜:«ùLgR\Ä\ìÍˆ£.¨Ü®\É\áğ@)\n\èTRÔ¸hµô¼8–3\\C©/\'¹n\å\ã$\'\ãşš\Ô‰œQšªÃ»\Z5>Á¨ñ\éˆqò\é¢Pø\éR\É^l\Z0:\Ï\Ïz_»°\r§D°¥\Ø[ô\è­\rJb\Æ\Ù\\\ê1q\Ê`š;Yx$‘%?U«8Â±xGd\ÂG8;%m\ÃKğP—a[<ö´%…G\r4“»!9„+\ç4\ïH¢v,g\Ö\\‹¥ H³\àL¹ h Ï…–\0\Í\0\ÒfÁõ~¤dú@“c=6òi&\ç\Ùt-	<ûmƒNc@\ï0O”K§2U\ÒAü”\íı\Â\åT:T£Gü•FH2˜\à¾_ò*\0\Î9pü‚“€*Ÿey®(FX^\ÈL:fjÊ‘4ğ\Ù\Ğ?ø[D«^J\ZØ‹X}}6€JÛuLWÆ¾À\n+œ1ñIc\Ú6\åƒò\ÍEúg³£\Ş2ıfu”a?\î°5‡,\"Mœ§%ªUP\ÕS!,¢ğ\à¹7­ÚŸ³Z\Ê\îˆø—HP›zV.4!?¾s\è“\\\Z­\Ì6d6øeJS¦ £Ï¬R\È@‘?aøcv•¹Ğ´¤\Ãg:\Æ\Z\rÄ«¢SŒ¤8ğˆTS\Z{a\æKùQMùW›^\ZA\n§¹Ì³Ñ«lN—\É\ï\ê¼u4<&<\ÂÕ½\ØÄ³T¼K\ëE,\ëw,_Ë¶ÿƒ\Ğ-\á\Z[óŸ‰­\ìRrÃ‹&\å½< kµÚY×€	\0(JŠ8:kfluĞñ4Í»\Ğ\n,‰\ÄÀw\êRÿ\Èñg\Ğ'),(9,'4_8285e8dcaf554d1329a6d3524c73610c2ea2b78d',1705222605,_binary 'xœ\í<is7–óuô+:\ÌÌ—\ÔÈ¼Q´R2%\ÅòH²J¤ggk<\Å»AV³\ÑtKbÿ÷}G7\Èc\Ù\Ùl\íV\ÉU±\ÙxŞ…+d\Øş\"\á¯ZJ–tÆ¢\Ú1vUKÈ“Œ&Y\r¾š½^oX}wö~<ı\Ï\Ûó`•­ã“ƒş\Ä$Y¾®Ñ¤†\r”D\'£5\ÍH®ˆ4{]Ë³\Å\á\0Á\ß®˜\é\\²Œğ3\åT\Ğ(˜o`ş¾,‘),Y)\åiLƒŒ\Ø\Ñ\ï€\\\á\0	‚Ò€§4	$\ÏEHƒ±9¸&	g?/Y\ÓG.\î)\Ë‰\ãM\nJ2\İ\ãß‰L©&÷„ˆÿ$\nb\ÒD<O\"€ıtó¡ş\Ó\í\Õ+§ë§Á–«,h\r[V\'\à‹]f¯‚ó\'G2€´‚:d€œ­( @f\ìò˜P!¡›\ËdÁÅšd@§\äÁ‰l\ë†´Ÿ¥rX¯g›”·_q±¬‚\Ú´†¿ÿşû\é\åôêœ¶ûƒF/j…ƒF¸ \í\é7A»Ñœµ=\Ú¼\0\é,\Ñõùôô¹4\Ñx2™]]¾™|mgHwy3¾úpö\ÕrjÒ«Ë›gS¤\ï¾M\Øw\ß,\ë»oõ\íù\é\Ùù\İ\Ù\éó\çdT\×\î7šóhœø£ÿ¶F{Xôº¶kA)_\×\èúû0¢’Ç™ùó¢‡h‰3ükQø‘†\Æd\Ãó\ì°~\ìüùrƒ\í\à›)ŸOP4£b/o¦³\Éø\îòvúª;?\"­°\ÑÎ \Û\ï\ÓF+juQ½´9ˆ:\Î@{\Ô>’/P\ê0e\'»ö;»xÿ~z~÷\ífü{ 5#½¦ú:›\Ö\Æ¶)G\å¢f‘š¦`¡\Ø\Ô\êk}\Ê\Òq‘xt\ŞA’pEg\ÉH\í˜;˜õzŠÑ‚-±E\åÁ\æ‘N„S–\ÅôVğaHFx\Ó\äIAC.¢²i\0»\êÀ·J\Ç×“c.\è\Ç[\Ëğã¢½\İ\í vüù³Wö4ƒaÌ‰¤ªƒ6v\0c[?„e‡\ØC¶üù\Üğ\ì‚Cš:\niŠù\árq\Z\â¿c’do\è•<~ ‘RÂ°Ö€\àGD†a1	:uO-\ä\Ü\Î4!ó˜\æ\ÇQk\ã˜LÆ†KS©Tš§ N\èc\é]B¶|\Ú\ê	´¹€L›C’+Çƒ”ò¥g:ØœŠe‰Z–”€\Ó\Ö\Ø2\í\Æñ¹\é‚\Ñ8’—\É\ê\"¶»V\äJ2%!\n\\¼!\á=M\Üñ¹Áo]0%3h™À \"€ŸĞ’\Îx˜™kº*Š*Íc4Ja[sõõ\Ö\0,\î\Z”Ã°öiJÁV§Eg_@ˆ\à<»b	5sÌ†\rü¡dk#]\ï5\ÕW®¿šÇª“¬ı@ÅŒ—\èDºñQ:­M\Û*30\ÛÓ’Y	A=w FMóM\ÈÃ¬\0\röšFŒ8M\à›:\ÃXĞ°bQu¦i\0^Ğ¥\È2¶.º\í£5Dn\Ë\0Mp¶<O\İ)nk³h\Ê\'ù*¿\×s¬µ“8±‘\â\É\'“ºeÆ’0\Î#¤¿1ú`r†µ­Pƒ.º?\Íf\Ê\ÑÎŠ\Æm;\Zÿ\\\Û\íL\ë`–€°³˜>Ğ¸\Ägd\\\Ë\æ\Ö\\vş§\çrŸµı˜ZşW\ç¶ñ\ÇÌ­	RP®€“P°4+cJ[[Ç¸yGU|7\ÛFO¸>Á\èi|õ\ÂL(\ÚH\Z\çKV\0‘\â\Â-kZ¹¤\â\"OBûn\Ä;\×\ÉLG¾7 3™	’ˆ<Q\nez?ÿ¤»\ë`ö}?\ìv\\B¥ú\è£Y\Ú6,—¶¿\î(®\Ó r\Zo@\Õ\É,ú\è\ê½PT\×\é)P¿\0Aì‡R)\ÍÀWœ\ßKV\Å\ÂT\Ó; ”*\Óû”s!\Ì\Ï9‡L™\Øô\èA|e\\‚A6\ÖXI¤’€\ÊS²”\ÆG@U6\çö«HUN¦\ÇR¢mM\\¡\î¢O&\ËJ;Œ]—Lj€KšMÁd|Œ˜©\"\Õok?=ó]!\ÂÍ†}š0/™¶€\ê× øª(\É\×wüÑ£\Ä&Vsôƒc\ĞhLø9^\Ò\ì–\áR@\Ú\Ş1\èƒ;­©8*aUúJ€\Ë\Åù:\Í6WP¢\İ\äk3º¸üj<hf\Ğ+[\Ü\äq\\¡o!>2ÍµB4(@~ª7`A÷~*òQ\ÅûF8(¾|6	\Ü-c*]\rğõò\Ü¯\á™y¬~\rŠ¯\ê,uœ(\â!Xy\ÑÿÊ™Ğ¥÷¶˜G%°Â¹Úªö\×6s\ç0\İõ.j\Ég¡„ô\à³\r©Ğ¨rVS…;@˜\áÊ¯R’­Š<aQ¼a\é\íôúJaˆª2\Ğ\ãJ¸Od™\Æ\Ì8[¨\Å4†‚\í\r¬(•`\\°1‰C¿%\Ügc¸Š´¶\rQ|©¥\ïj€\××’\ì\ÄÕ®ú\ä\ëeE\äª2]\İ\î®W{\Õ>z\â5ˆvshjOÑ«(ú”’$\Â0\âWT	ß“ ¨1zü©‹›!ª!Nw\"ãº”\Ó\r–Xe3\Û\è‹\à\0\\Z\å·epT6ù\İIi#£Ñ™‘#\ïVc!Jg\àsZH\ÍU\ÕuT»×¶ (\Úù\Ù\Õ?}s>\ßdTz\ç\\A¼\Z\Î\çN\î\×\nq\nWY¨×¢ø\Ô\n¢[Z!\á\Óp¶=ó\ÊÒ·°rö˜Q\Ã{Ubºp~võO¿\ï“\Ç\">OBy43\ìbx\ë.\\\âOR\Z2q\Ç\ÈÃ¦_Åª°\Â\Í\'ªz{Gˆ®\×ÿA\â\Ü#Y«»\Û[D<Ÿ\Çô€¢¯\'P¼*\Ztí‰¹mlö\Zš·—x\ç\ÆBR‰[UÍ€\İ\Ó\r,\"nJ Ï”X’PaS1hø\ÑüD;*`\Ş`V@[»¤M¸\'c\Ğñ¾Š\ÒÔ†\ã=U¥s™\í§om!ø’\Æli«b£l\ĞG‰GA1ó\ÔX\ÎøŸ]ıÓ«ƒ„O¡ˆò©¾\é}öó\è\Ñz\Ï4û¬WN¹\å~•Ÿ¾ª\r&\"¥E\"Ü®û\rÌ—¢I\ê§\ê[Ğ¾Qµı£j{KC‹N\ZMöU–¸|\Ø\ÆñM)Ï³½PÀöx\0”R\ÙY¹n\ÛI\ç%\Ü\ë\Òh¤\ÏY¹x—I¶µ­¦dÁ\Æ|½ö®M;;^±T &x†ûóˆ\ïbx£–õ“Œ‹\İ\åZ³,öoaTş¢\Z:Ï—\Õ\Î{\â›F°ª¬\æ\Ä¼—v\Ï<6ğ\ígg\İN†ı–\Ù!4{‚m£qÁÏ¨T\Ùf9˜ı¹r3±£Ç–ÉŒ¬Sµc\Ö\ëõA¿\ÛÕPDf£°€˜\Ë¡Úˆş\İ[ô&.2e=2jOcÒˆe1\ï‹=84²œ\á\ÆF·ò\í­Î¸9HfP)“t›\ÉL\ß\'p·Ku³\Ş½9¶[¨3X@,]¾]\Ã7b‹…e‚\Ç\ĞşKm¬¬`«…<KÓ¿ñ\Øw¯\Ê\ßfop«	Ü©™RJ\ï[ıuC\Êf‹˜>©Y\Õ\à2S{w3uö«Ô™\ÉlN\İ\ÓNh¶š©rn}Ö£¹C\ÇS>…’M#\ìj\\©\'_có®>\í”kñ\ìlkQ­2òôM(;mŸm6ü]û\İ[\ÍKw|l1^TO\ÆM(0\ÓY\Ú+\Z\Å\î$–\Ğúu´\É\Ô\ÆÚ	vó<ÿ‘3»U­\ä:\Â#·˜“H\Î\"\×s\Ë-gv\É0\íII3\é„­©”\r,\Â%}©ÕŠ\Z/=\äÈ´‚ı*†-u\ÎõvkÑ\Ùú/\Ù\Ş÷G:\×m\äP\ç‚&ø\Ú~\Z6JW\Í\ÕQt\è±Û­À¡oÍ†~WŸ¥™/u¬¼Ò‰Qù¼:\Í\á–\Ó9«\É\ÙÏœ¯±\Û\Ã·>.O+ô>\×l÷L—´®«•\çH¥¿9qnÁbP£Q4öÀ¢­!H2“*on“h€¥E\ï-\"š\Ğ\ÌDLD,i\æ´;….’=ĞŠm­(Ş†r›\İ\à…3Ô†¶ÑO\ë8xÀ#k¼®5_5jZC1¼y¦Oùğ\Õ$\"1O\è\ë\Ú¦4øñ\ä`4m_\03\Üùúš\Ê³byce$W”fC¿®É³ó‹\ë,#\Ê,N\\\ÅQxj\ç­`D3T™|\å³_Bü\Ë 	¹bñ€k@\Ë\âAõ\Ó\ÖU˜ŸP·\×`f\ëksü†§o|¥şÚu<ª+\é\êJ¼g‹m·§/ S\Ğ,Ÿ/r\ã\ë¤Õ­†Y©«i13V\×S6ª»“Y3ñ„X¨±9‹Y¶©>\â)\Ì6\Æ|“ªP\Æù\à³Ìœr8\'ü&ûlf\Åñ†2¼P\rG\íBL¨¾1\é@7C‘\Ä\Öxš¨Ü»\Õ\Ù‚\Ñ\Ä\\\æ¢ğšV\ÑQ%™8‰K!d\ç|RW¾E\ît²‰¤/h4sÁ7\æ\êÀŸ~ø“bf[–\Í\Ü¡;{Jı\Ëg=fs^óÿnl<)s:»gÑ§XE÷’*	C_‹°A°\ìuØ¶“¾…x£67\İ¡K:/´µ\r-n¾¼”\Ë/\åòK¹üR.¿”\Ë/\åòK¹üR.¿”\Ë/\åò×”\Ë\Ï,_³…˜+\Z\Şß²h6\'Ñ™¾¨\ÏŞ±:\ëÚ²ˆH¼\ßÎ¯ ¨|±«§Á6tºRPÿ.\ÂÕ™SŸ\ï\ßQ©²Ç\ÑTıf#ü-\ç÷ú„\Ä)\ï[za\0ı]®—x»K¶-L\Åƒ\Z\Çû$TdS‡—ö²^\íx®\ÚWœğ\î L[™p•$<Õ—ûTÀ-„\è¸r\Ş\épÉ“+}‡\Ò\Ügn)“\í-\ÂòÀõ‚i\Ó\ï\Î\Îÿ9.F\İJ\Öoóy\Ì\ÂzIS7\Üfù\Õ\'ğg\ÅmJ\Â+”n\Æ\ægoû\çLy\nTú‹>6`f„\éUD\á¤Q¤,™\Äo•iŸ™µ‹Q\Ï\Æ˜ö.FÓ¼÷³\'\'™¹\Ñiô`‚A<µB[	ù:\àñ¨i.¢\Î÷±\Ğ1:²nn©»Okˆ‰x(üFPr/Aı\ë)]§±\êf^¸\'¸ºRÿyøw¶\Ü.ğItğN1\Ö*˜r=P‹\Ó\Ñ\Z•\Æpd\Ò/”\Ç\'şı°İ©\\Í¿B ûY=¼\ÓPf«w!GÊ˜,±\Ã=!&(\Ím„\Şß‚Û«¼7f|\0\nñ–°\ØhJ»RR\íP‹«\İ\Î<l¹†T®2c•¥\ãù%DA•ôLV5\Ü\'‰\Æ.‹Ä½¦1yL•¡+ŒĞ¿i÷˜D\Æb¢•\Í\ã}Z³n^XGúı\\·\Ü\ÈY¼\Ú:J—ÏQ\âd7Ê ß¾OT¡7·\ëc\Çö\Õ\æ8¼­ñ¤nu£ñŒS=Ì‹B/\Í\r0Ù¯ö„Mnğ$¯ÀS7\ÃÓ·%\Ë+\ï¾‰\ÙrÁ¥\Ä\Å/\ÛY\Ë$|Í£<.\ÜB\'Á\åi¦_|:si\ÒÌ¦2ôbNµK÷r\Å\æ\îVL«\ÄŞ† \n¥\Ü\á \î\0\î°x\Ş\Õÿ¾¾7¡öfpñğ\n\ïT‘‡\Ë\Ğ\ær<\Ã$’ª|fo\Ô„ş¹R×†\æE²…\ZöVğ˜/OH’a±”\ìV\Ş!M\â›c}}ºP@\'ªrjÎ•­˜Ñ\Ş_^#ÿ¯‘õ3³†]\Ç\Ù\äSh¾\Ó\ÂI<<|{6ûR\Ê;<<)¸-¶RY…\Û\Åó¹\rŒ]›\ëN˜¥Gª\á\ä\×Q]ÿ°…š\ÕX\Ç]‹\r\Ô;/\Ü­sG‹t¹\î<‘·X —òª•~6oW\Ä\ÆA,ÀaS°t=õ[]2˜‹k¶¦Ó\Õ0\Şõ_Á:4Ì­\ÌøNn„\ëS˜\âøµ\"¬mşE\Öş\Úú‹4Œ5.•\Ûl»’%»°#8*M½Q3.÷Œ;}@}y\\EUƒÿü<ù $(>¦Ü³u6¾\ê\ÙWgö\0˜u[!\Êú5a	¾vyµ2wI\Õ}N}­ı¼5\Ï;]\Í\Ö[ô7±Xu+\Çw–Y‘rºN\ã\âU°©¨»nE}·\rKx,„‹„\Ò^«¯^¨:LqûFÉº—a«aØ•) ¯Èœ\Ær{)\äÁ\ØI\íe\"œ˜=_e	®k¦\âÅ¨^µ4\ì\ä ş\Ã\è»ñ÷¿~ÀXo–l7\ê?üû\ß\'\Ğ6ª[Üš]›<,e•7†S™m \æ\î°\Öÿ¿\Û\ê­\Ş\éD\é>š\ê4\Æ6‰Í•zg¹ü©0†â­˜}®\Òäµ˜Š‚©\0¨«PŞ®Ë\ÄW\å_40d¨‡|e\Äú\Ğ0„ªö\Çf\ï¨\Óm4{¦)A\'Oß—1Ÿ“øTJ¶LŠ2¥\\o—\Âk;ºLd&r»qYTúj«9…¨­¬Ÿ\ÂõœG~rÊ¯8‰\Z´\Ø\ß`«z\n\ç\é³}ü¬s\Íù°İ®¬Ÿô\Ñ\ÔjCtİ®M¢$M\ã\Í\r\Ô\Úô-K2\×\çL\ÕvG—º\İ‚«\Ú\Z7)Cm\Èú	c³\Òçµ¦ÿx-©ù­\Ë-Q\ê@]\ì…\ÂLd\Ûk#,ö°\Ã[\ê\İgó³/)\ÔL$\ãÂ©O\Ì<oÿÿtL\Çtl\ã›\Ì\ç·U)U\İß©®U­ ?a—,üº¡ÃŸbGPªgŠj\'œ—\ÍvO\í(&M\×HÜ°\ÒwCGŒeº\è·\'½t¸<1\âê­”¾z‡qRYd³\ß\è¶Z­^\Ã­:‡®\0ñ[\nb\ßrÚ…AQ4ô\Èe4\ë ûÿ—‹€›'),(10,'5_8a0dd8e8763b3863fad477ef5a6ba2b643ab9831',1705222605,_binary 'xœ\åX[sÛ¶~>şÏ´ÃˆÉº«\ãøV¥µ\ìØŠ«\Ép@a“‚–\åÿûY\0¤$_’8múTyF&»‹Å·\ì\n÷Ú½?ø2r<\'\r>\íµúŠ°LLğ\æn[n\Ï¼\Ú;Ş^\ì£X¤\Éhk ÿ¡gó¡A2CG[[ƒ”Œ‚ó‚ˆ¡QŠ\È\ì\È\åW¦‰¶ş3i\Ä/¨ s¶ œ„\È_\"P~\ì\"Ñ¬\È)§\Ù\å„\å	A‚¡Ô‘W ®x@£ˆ‚XN2T°’\íj“\Ñ\Î\à8©|<\à8%Æ¯A)\'\Éœ`¡wü9\á\è\ì\Zc³+„³%4 Y\ëe\Â\Ú\á\ä}\ãğ\ä·\×[,_r:²»İ\éXN±è±²\×hÿ\Ì)(\ËÀZN6Ä€YÄ„r\Ä	ˆ‚\ŞÀA\ál3\Î\"\ÆS,@N\Ù#Á©_j‚\0ôE^ô\Z\r±Ì™ûšñyc\Ë4v\0^P‘\ÑQ™*a+É‘T†TÄ¨(\Óóå ¡\Ù*?e\0\ĞĞ˜\Ø\Æ\rT9~h\èó\î¨¡ôWŸAC;z\à³p	>ú»şBzƒh84‚&\èKpQHz©o3$#«781¥™üŠVÓ«	^²R˜Dzôù:A›¶õ—%_.¿µ\"?d <@²@sh¤\Ê;˜‹†¤›!\Ø@\à‰˜^9+„¡K+\'JJF\éÁÊ&€ŠC£Qó™’Q¡hJV³\âıY\ÜzO¡ı¡õF+ø¡µ7„˜•‹?\â4\ï[\Å KÂ¥\Ä¬p&¡~ÁE<t­&iG‡n·\ÓrËœ&¶£m\ßuœ \Ûtÿû\å3A@AØŒ4\ËK4X1\rC¨-U>k\İ\ï_\Ôú\éw\Ï+¤û\'\İ\à¤-\Ó;vw<eôü y7½›\ï,{úav¤vpz\Ø—Iù\á\à­\íg§¹qœ¦İ¥>±.?œ&\ã+¶<\Î\Ä\İñ\Õ\Ø>¦\ã_\çoŠ\Ë\ëô0¹ocrq~ışğ ›½O\Ê\Ù\áys|%òã«vp\Çn\î\İ\Ùe;3¥oû¿œ\'ÁrÜ¾œ²\è\ìF\ï†C\ì\â¨\Û!Í®ƒ[Íˆ(\ìtİ¶\ÛivÂ¶\íÀ\ÅV·kY2#¿(\Ï¼”\ÂU“JŠ5*şøG\ÉDÿ‹`j–^\Åz\æo°ŠdÿO?r+Lû1\àfDI>\"{^Pr•\æŠu½v\ïAd·Z;´\ÚV\Øl;\Û¢ö¶»F\ílw\0\Çn«¢4hÈy˜Ÿ©¨\Ò/vFgp\Z¨Z\Îh#K²+N\r(.X\n ÀEòSlj^^’d©Y\Éb™•\ÛT\æ\\ûKJAúø\æ4\ëYHş™\İn—¤}	\ìS¸zn‡†i•%°+\r”-ŸhUQ{ı­ªw]µeA™sV\æõ÷a­O°O’üŠbÈ›\çk\éx1FSø¿5(rœÕŠ8ù£¤\Ğ£Ÿ\r¹ ‹†\ÒüŒ!›&+/>º->_À+§\×\Ûml\\\ëS7¨YUÀ—¸½:\Ô÷òœV·\ÎÔµ?{¨Ï¿T	³ñ¨?\ÏÃ³\éÀ¢\è%\Ô)o|¿:^«\\q4\r“\éxytu¹˜|¸½]\Í\â\ÙU°8º˜Ä“»Yt÷\È»G{\×öñ\Å\Ûx­\çd\ZÆ“\éÜM\ç\Î\åUœF{GÃº½©ò\âi\'S‚¾2‹\ç\Z‘A†¦¼Ó¹\ê\á*öME¾\ÈLÁX\âch· ¨$$\Õ\ë\èÙ–:	+ö\Çùe\ï¯Tn&\ØJ\'\Êd„>=\ÔJ\nZOÁ6å”\Í9•®©=\\”~Jÿ^ ?¸\Ön†ò0U7;hhc·¶.OÜ³fxıƒxjô\Ø\ék6ı*}\"/\èkÖ¯2ş5\É:{EÀi\èğ\0ºA5@©Š\Z€˜2\ÛxË¼iœ=&“Ò‡!§ñ\ß\à3%İ\İ.?SŒ¯¯ŠŸ\í¶Õ²\İm»	ƒ ª˜Fªõ\×=?\\¦r”Ã¡m¯f\Å)D‚$9Í*{Š©¿šõ (E,ÁAL<\ÕıöqÏ‘c\è¶RÑ¹¤¨Á\Ô\î\ê\Ét*\èZnh(g$¹nWƒ+\'\ã\áš\Ô‰ŠQnÕ„w5\Ç|„9\æ\ã.\ã\ä\ãI­ğã©’=y¼Ñ¿¿\×\ç‚0†cø¸ jWn\0gKo‚õ†rs¶z&L0˜÷o’\Ë\ìG;ªj\ì\âL¼!\Ò\É\r\Ü-„aÁNğ\à€\Ép,\nz\'…‡šI†ı„\ì@\r–a°+Q\ÛM–\Óq¥\ÅV¤ep\Â\ÌÓ h,{ˆ;šŒ¾%L\ëóH\É\âš\æ{z&\Û\áóRN\Î\ÅZxZ=ƒ\Î3@o\'Iö•I2TŠqö†l2º­\Ú\ä	$=dc@Â•F2;®ahØ°ª\0z\"0ü„“ˆ*›eyñ(FX¾•‘´\Ç\Ô%i`³¡¦Ÿ\í\æF\Ğ(Àø\êÛ£\Æ~eª®^\íü-r`gLüF3RyŸö,ù ¬vA«şi\Æê«·R¿\Ù}µ£po÷ØšC¦—&.Š\rª]S\Õ<T“Áa¢6€;3­\n£·Zª°î”„o kõˆ^kBu\İW\Ğ[r!hºÚ¶-\ã$Ü¤tdpzúb\Ûp&h#òg”p\Ê\ÎJ_¢[l\èÙµö¾FCº÷¬®!)<¢\ĞfAR†R~R\áAOş\ÅÕ¡W€¦Á\ÂÛ€\\F\àŠ\èAX\ÑeZø:¢=\'\ïR/!7\ĞÿÖ‡¸—ŠŸú\Ò~\à\Ë\Ö÷ö\å‹B\ï_\êg\ëŸñ³¬eò¼·9\Ì\Êzy:³mµ4^ğIóz.XÇª¯®\Ã)U­Za%‘‡^K\êÿ?£T¨E'),(11,'5_c20f3afa6b3c8a08486a619356bcca8e5f2d14b9',1705222605,_binary 'xœ\í<Ys¹\Ñy~Å˜›¼lE\â}ŠÖ–LIk9’¬\é$_\Å)8’°†˜‘\Ä\İõO7®e\ï·©\ÈUks\Ğ\Z¾p-t?Kø«²&:eQ\å˜\r\ÚÇª%\äIJ“´_õN§3¨_½Mş\ïö<X¦«ø\ä`ˆÿ1I¯+4©`%\Ñ\ÉÁÁpES„K\"$M_W²t~\ØCğ«\Ã\Ã\à\à“%“Á#I–\Ò\0~®ù#4\nf›\0˜¿o‡K\äš	–,‚5\å\ë˜)$°£¯€\\\á\0	\æ‚Ò€¯iH‰#-rpM\Î\n^²¢\\\ÜS–2Ç› ”¤ºÇ¿¹¦\"\ß\"–üS@’(ˆYH	ğ,‰\0ö\ãÍ‡ê·WGN\×!_o[,Ó \Ş\ï÷µF+\àó]fGÁùˆ#O@ZA2@N—”‰@P 	Sö\0yL¨\Ğ\Íe2\çbER Sò\àD6\ËtC\n\ÚO\×rP­¦›5oq±¨‚\Ú´†¿û\î»\É\å\ä\ê¼]oõZa§\İo\×:akõ\"R\ëögı9mD­^cx\ÒY¢\ëó\É\ésir¢\Ñx<½º|3ş\ÚÎ\îòftõ\á\ì«\åÔ¤W—7Ï¦\ÌI\ß}›°\ï¾Y\Öw\ß,\ê\ÛóÓ³ó»³\Ó\ç\ÏÉ°ª\İo8\ã\Ñ8ğGÿmÿ#ö°\èu%lU‚0&R¾®\Ì\Ñ?õ÷aD\ç$‹Só\æE\Ñ§ø\×<÷#\rÉ†g\éa\rü:\Øùó\å-\ÚÁ7S>Ÿş oF\Å^\ŞL¦\ã\Ñ\İ\å\í\ä¨\Ñ\ë‡óZ4\'\ÍZ»=o\Í\æ\İ™7»óz»\Ş\í÷ûM\íQ¿ûH¾@9¬Â”\ì\Ú\ïô\âıû\Éùİ·›ñoa€\Öüôš\ê\ëlZ3\Ø6¦•‹\êyjš€…bS£5¨¤ô)UH\Çy\â\ÑyIj@B\Â%F$%•c2ha\Ö\ë(Fs¶À•\ë}\',\é­\à,ÂŒğºÉ“‚†\\DES(\"vÕ‚o•&>®\ÇG\\Ğ·–\á\Ç;E{»\ÛA\åøóg=®ôi\nÃ˜IUM\ì\0Æ¶z‹±‡t)ø#ò¹\á\é‡4uş\Ò5\æ‡\ËùiˆÿH’¾¡wTòøFJ	ƒJ\rz‚\r†\Å$\è0\Ô=5s8Ó„\Ìbzš¥P8B­bJ0.u¥rPi¶uBsH\ßÀ\è²\å\ÓVO \Í9d\Ú’\\1¤”÷l}¦ƒÍ©Xd˜¨eA	8\íA…-\Ğ\ŞiŸ+‘.#y™¼¡.b³mE¾ $\×$¤Q\Îñ‚‹7$¼§‰;~£\02“ ø­ s¦d-´BğZ\ÒSca sEWEQ©±\ŞrŒF)lk®¾\Ş\Z`X \ì5(‡a\íÓ´0,]2[­ˆ\ØX\ç=\rˆ%8O¯XB\Í\ì³A\r(©›ÀUW‚µcõ•\é¯ú±\ê1m>P1\åº—n|”Nkİ¶\Ê\Ì\Ä6Ã„¥V\\P\ÜˆQ\Ñ|ò0\ÍAF·€½¢#Nx­\Î=–#4,YAj\Z€t)Ò”­òn»h\'‘\Û\ÒC\ãœ.\Ï\Ö\îd7ŠU[4\á\ãl†Ú•ˆ\ß\ë\Ù\×\ÚÀ\é\Ûrƒä€“J\İ2eIg\Ò\ß}09ÅªW¨A\ç\n]§SG\åhy\ã”Ç¶\İb¦-zªu0M@\ØiLhœ\â32.\Ïe}k.\Ûÿ\ßsù,\Óû\ç\Ú\ï3\Ï&”AQŒCÁ\Öiyš\nğ\Üj\Ç\Í68ªü»\Ş4z\ÂU\ÆX\ã·[W6µ®\ãlÁr R\\¸cE+0“T\\dI¨Œ¥\ë\Æ\Åsòt||:“© \ë\Ã‘%*Z¡L\ïgŸtw­\è÷ı \İr9\\UD\Í°aQµıuGq5ñ\ÕxªN¦\Ñß¡«÷B\Å]P]«£@\İsH¥4_r~oY•wPsï€°Š€ú\Ãô>\á£L³\Æ3\Î!Ÿ&6‰zŒG!\È\Æ\Z+‰TªPùeBÒ¸¨\Êf\æn©\Ì\ÉôXH´Í£\î‚K\Ômt\ÉdQj‡±\ë\ÂJ\rpA\Ó	˜ŒAB€\Ñó¹Q¤úm\í§c¾KD¸%±O“½\æ%\ÓPş\ê\å_%2\0%\Ù\ê?z”XÇš~p\Zi¿S\ÇK\ê\í\ÂÀ t\nH\î;†}p²5ıV «¸œŸ¯\Ö\é\æ\n\n¹›leF_õ­\Äzeó›,K\"t-Ä§S¦¹–ˆz9\ÈOõ,\è\ŞO¥@>ªx\ß{ù—\Ï&»¥qL¥­¾~@[\â5<3\å¯^şU¥–E|!«0ú\ïŒ	] o‹\Ù/€%\ÎM\ÔV¹¿¦ñœ;‡\é®w¡P[H>{%„¤Ÿ=hH‰FÕ¡°\æ\Ê\İ\ÂW~µ&\é2\Ï\Å–\ŞN®¯†(+=®€ûD–\ë˜ygµ¸aY°òV”J0.ØˆÄ¡¿\ß\î³1\\kZÛ†(¾\ĞÒ·5À\ëkIú@\ârW]òõ²$rYš¶n÷Wk\ÂrñšD»4µó\èU}Z“$\Â0\âWTß“ ¨1zü©‹›!\Ê!N\Õv\"åº’\Ó\æ\r–Xe3\Û\è‹\à\0œ\ç\ZÅ·e\Ğ/šüî¤´‘\Ò\è\ÌH‘w«1¥µğ9-¤\æ²\êZª\İk[P\íülëŸ¾9ŸmR*½s® ^\rg3\'÷k…8…«\Ì\ÕkQ|\ê\r_£[Z!\á\Óp¶=ó\Ê\Öoa}\í1£šöª\Ät\áül\ëŸ~\ß\'D|„<òhg\Ø\Åğ\Ö]¸0^Ó‘x„ûJ6\İ2V‰nQQ\Õx\Ø;ò@t½ş7g\É\Z\íı\Ø\Şr$\â\Ù,¦o}¥8Šp\àeÑ kO\Ìmb³\×Ğ¼½tÀ;0²–¸\İP\Ö\Ø\Ñ=\İÀB!ò\è¶_\0}¦Ä’„\n›ŠAÃ\æ\'\ÚQó³\Ú\Ø%­»À=ƒöU”¦6\í©*˜\Ët?}cÁ7h”ô4f[\ÍûeË>J<0Š™§\Ær\Æ\ïül\ëŸ^$|E”Oõuè³ŸG\Ö;¦\Ùg¸‚p\Ê-÷³_|úª6˜ˆ5\Í\áv\İo`¾M\Ö~ª®\íU\Ó?ª¦·4\ä¸\è¤\Ñx_e‰Ë‡mß”ò,\İ\ë9l@)•ë¶t^À½.Fúœ‹w™¤{Q›jJ\æ\ìi\ÄW+\ïÚ´µƒ\áKb‚\'½?\í‰ø.†W1jY?N¹\Ø]®Õ‹bÿF\å/ê± ¡³lQ\î¼c ¾iT\0«\ÊrN\ÌÁ{i÷\Ìc\Í\ï\Ğ~v\Ö\íd\Ğm˜\İB³?\Ø2\ZüñŒJ•}`¶ƒ\Ù@+6\Ûzl©L\Éj­v\Ì:n­\Õ\ë5:\ZŠ\Èl\Z\æs\Å ¢1T\Ñ\ï²Ã‡\Ş\ÄEª¬‡AF\íhL\Z±4\æ\á}¾‡F¶‘S\Ü\Ø\ÈğD¶½\í\×{\É\ê\"e’ns-™\ê[\îÖ©n\Ö{¤7\Çv;u\nˆ…Ë·møFl>·Lğ0\Ú®ŒÔ±\â/•\Ç`iú7\î\â\îUñ\Û\ì\rn5»15SªQ\é}‹¢¿nX³\é<¦OX³\ê—™Ú»›ªbİ NV¦3\n\èv2‡@³\ÕL•s\ë!\Í:ğ	”l\ZaW\ãZH=ù\Z#Ÿwõi§\\‹gg[ƒ\ìŒj•Á ojD\Ù1`hûl³\áo\Úû\Şj^¸[\â#{,‰ñ¢|~nB™\Î\Â^\Ñ(v\'±€öĞ¯£Mª6\ÖnL°›e1øœÚ­j%W\æbN\"9\\\Ï-¶œ-\Ø%Ã´\'%M¥3¶r¦R6<²—ô…T+j¼ğ¾iûU.\êŒ\ë\íÖ¼³óŸ²½\ít®=\ÚÈ¡NMğµı\Ôl”.›«£\è\îÀc·[Còš\rı¶>d3_\ê\ĞXy¥£²Yy:\ëƒ-§s V“ÓŸ8_\åb7;n}\\söõ>\×t÷\ä—´®«gJ…¿9qn\ÎbP£Q4öÀ¢©!H2•*on“h€¥y\ï\r\"š\Ğ\ÌDLD,h\ê´\å;¹.’=Ğ’m-)Ş™r›\İ\à…3\ÔExZ\ÅÁló\äu¥~T«j\r\Åğ~š¾€¯&‰yB_W60¥Á\'\ÃIó˜\áÎ‡Ô—Y†˜‹{-C¹¤4\rªøuE_\ì\\z\ÚPfq\â2\ÂS;o9#š¢\Ê\ä‘s	ñ/e€&<\äŠ\Å®-‹\ÕO}PUa|B\İqƒ™­®\ÌQ\Ä!\Ï\á\Ì1\Ü~m\È*V7 U%\é³G`wª/ P¬’Ÿ/}\í\ë¤V­²	ªª2“WÕ³7¬ºóZ1¡‘„X³±‹Yº)C\â\Ì6\Æl³VÑ¡8˜óÁ§©9ğp®˜D´™\æ\'NdHñ\ÊB925s1Qû\Æd\İõ[\áÁ¢òôFkös™‰Ü\ZyG¥¼\â\ä0…Î£J]\çi\ÔI,’b\è \Ñ\Ôß˜øşŠ™qi:u¯\îl/ôÏŸõ˜\Í\Ñ\Í\ßHüWº±¡¥h\Ì\èôEŸbÙ\î%ÿ”¯†¾Ga\ãa\Ñ\ë e\'}ñF\ísº\ÙBWw^hcš_•y©œ_*\ç—\Êù¥r~©œ_*\ç—\Êù¥r~©œ_*\ço¬œŸY\Éf1—4¼¿e\ÑtF¢3}IQŸ\Èc¡Ö¶‘x7_A|ù bWO½m\èd7º ş]„«3§T\ß!¾£R%’£1X\0˜\íñ·œ\ß\ës§\Òo\è5ôw¹Z\à\Ít¬Ş¶0#Œoo™P‘N8\\\Ú+|•\ã™VhWq\Â…\Z0q\îjb\ìU’ğµ¾ò§bo.DË•óNGN\\é›•\æ\ÆsC\á˜Di\ïÇ°L›~tvş\É`n0ªvP²z›\ÍbVšª\á6µ\ÈGŸ`ÀŸM@·\Ù	/V~¸™»í»S\å)²\ê\Ïú0=˜\å\nü¥¹“F‘²d¿U¦}f–1F=[`Ú»uóV\Ğ^§§\æjD«\Ö\0ñ\Ôzm%ä«µ\0G-Hs=u–»…Ğ‘usCİˆZALÄ£\â7‚’{	\ê_M\èj«nf¹{‚k +%ğŸ‡kÁ\íŸS@\ïc­‚	\×µ8-}\ÍQi—L&C¥Lp\â\ßš­Òµş+²ŸÔ£=ı·zS\ÒW\Æd‰–\è©1Ayd\î(ğ\î\Ü^ğ½1\ãPˆw‡\ÅFS\ÚE“j\è˜Z\\\ív\æQ\Ì5du•$óø¨,O5!\nª¨¤gú³*\ç>I4v™_+\îÔ\Éc\Ö…\\b„şU»\Ç$2c…¨loÙš%ô\Ü:\Òo\çº\åF\Î:Ö–Tº’vŒ\'»nTı†ô}¢j¾™]*“8¶\çª6\Ç\á\'u\×g”˜\êa–×´xmd\î…Á\È~±\çnrƒ\ç{9º/&˜¾CYÜƒğ=Í–£.%®ƒ\ÙÎ²&\á+eq\î:	.NSıZÔ™K“f`6•¡\çsª]ºƒ+6swe\Zö6U(\åu3p‡\Å7<\è\êkscj/\ç/¸ğ\Úy¸mb\ÇcN\"©JnöÒ½P\éKu³h–g^¨moù\â4Œ\æK\Ìv\éA³Q+>^\Ö7¬sm´p¶ Z§\æ\è\Ù:„\Éx%ı\åYó\ïğ¬Y¿W«\Ùõ\ÍD¹\æ\Õ\ê\å\Õ\á\áÛ³\é—ò\ß\á\áI\Îm¾•\×J\Ü.Ï­gŒ\ÜÜˆÂ”=T\r\'¿«ú‡­ªĞ¬F:[l \Şy*ÿK\åÄ˜;Z¤\Ëuç­½\Å½·±ôû{»R6b™\0ö›‚¥ s\ì)¨\ØR“Á\\\\³ì¬’ñ9ÀÖ§afe\ÆwC\\·\ÂÇ¯a\ÅpüsıO²ò\çÆŸ¤a\Ü\Ãr©\ÜfÛ•l`Ù…õU)Q\ÔõÎ¨\ØKnuõ\åsU\rş¿øóAA¯‚L\íg‹n|ø³¯\è\ì0«¶\\”\Õk\Â|s´4\×MÕ•O}óı¼5w\Ó[m\Í_ôW«‘XU+T\Êw–Yr\ÚN£üy±)¯\Ûny}·\r\ëy¬„‹„\Ò^«|¯º:Lq[GÉº—a£fØ•©&¯ÈŒ\Ær{]\äÁ\Ø\ÉóE\"›\r_E=®¨ü©^\Â5\ì\ä úığ\Õ?GøüŸ\ßc¬7\ë7ˆ\Õ\ïÿõ¯hV-n\Å.•M–²\ÌÃ©L7swX\ëÿñˆ\í\0õ…V\ït¢‰tuuJc\Ç\æÖ½³vş”CşœÌ¾&Wi\nòZL\ÅÁT\0\Ô%)oV\åF\âóô/\Z²?\ÔC>„2buhB‰ûC½\ÓoµkõN«nŠ#Dù‰\Æ÷E\Ìg$>•’-’¼L)ß…ğÚ.™Š\Ình\æe¿Ú‚^CÔ¿\Ö\nÖ¯\å:\Î;@9\áWœD\rZì¯°¿ˆU=…óôÙ¾¢Ö¹\æ|\Ğl–Súhjµºn\Û&Q²^Ç›(¼\é[–¤®Ï™ª\í.t»\ÉW…6n^†Úõ+\Çz©\ÏkMÿñ<ZPó[—[¢Ğºû…™H·JX8\ìa‡\Ù\Û\Ï\æg%^P¨™HÊ…SŸ˜y\ŞşóôM\Çtl\ã›\Ìf·e)\Õ\" U^¸ZA\Ä.YøuC‡?ùö T/\Õ9/v\êÍ\ÚPLê®‘¸a¥ë†2\Ët\Ñ1\îUz\é\Æ>pq@b\Ä\Õû*]õTâ¤²\Èz·\Ön4\ZZù0  ~£f\ŞJ‡\Å\ÓK§h\ì\é\í\Ëh\ÚFöÿì´¤\å'),(12,'1_868a5659e30a57cb',1721648599,_binary 'xœ­T[o\Ú0~¿\Âõ{j’B\Øk«nk‹\n{˜„„Lr nƒ\ÙŠªş÷Ç…•®[¥jyHbŸ\Ûwn;ñ£‰[1-ù¦\"£]‡\İ\ê&UÒ‚´Oa\Ôl\Æ49úr3ÿ‘\Ü.‹~-qRp¹\èQ\Ô]\0\Ïú5‚O²\ËIšsmÀö\è\ÊÎƒ6jÔ’£  µO\ã\\²™ş–j\Z22\ÛpsB\"¤)…rAJPe\Ä*b\Ğ¡y¥ƒvœ\Ì5\0Q%Hb\ÔJ§@6¹\âSZº\ßsÍ—°Qú\n+xQlIª[ñ7%h2º\ç\\\ç\êp™‘B¤ \r\ÊW2C\Ù\Åõv1ü~ü\"tªÊ­‹Ü’°\ÓiQ=j5\íì˜œ= #”D´\Z^˜¡²\ÍAh¢MR+Ö˜\ÈF‚6\æRÎ•^r‹v\×-f+a±¶41cv[ª“c¥¬X\ßZb…- «”M˜ÿ¯ùfH,B.\0#p«4%\Ï\r\îQŸ\Ó\àj\ä:´\æÛ™\ÌT¶Ek«\ï$k\"²M›\è­\à\Æô\è\ÜÕšT\ï ƒ9_öù„P!p.±<ş¦\à[µ²Aö\ÜVŞ½ğpj¶<%\×!W:o;ÿS\'É£]1\ŞH\Ì5†q2mXı\Ö}\Ö\ßÿ8ûö\írúX¥ş{\Ñß±LN”c	“jQZbtÚ£~\ÆqX\ç,s{1Mµ\É»¿ö†\rW3\\Zö•¯ù¨²f\ç¨9Ğ£Jñø\Î|[õf«uÕ‘‰\æCT+\Ãü„c\Å¯U„\îùoŒcë®¢FL­\à”º{jó\ÌVqdL/¯\ÇB¦><\íò¸?>¡\äôP2E//¤\rO¾c·«\æ\àd¡£\åF;ö»9Áİœ”†\Ép§9¹…T\éljµ\Øn=º1£İ§Š\È\á‰LE\í­(<m´›ª!,k,_–;Ió4\n+I³wH\Æ|aÑˆ¸‚¶\Çz™MCôşô\Üü¡…'),(13,'2_b483c1c60649b2af',1721648600,_binary 'xœis\Ú8ôóò+T\ï´v\Öñ\Å}uÒP\Ú%\ä g\Ûad[%\Ære9:ù\ïû$s—¤mÌŒ±Ş¥wKW+\ÕIµT\Õb<$\êk5Zµk\n\â±HHh°ròv±ª\Õß´zı›“C4ã°™«\Ë?\âh\Ø\ĞH¤I\0Á~3‡à©‰À\Èa\Ñ\ĞR\èe \È\Õ\ß\è:\Êı\Õ\Ñ=7¡‚ øŒ\Ù#\á\ÄG\îÁ=\éˆFIL9†(&,	% ¼vE|œ\Äb¡„¥\Ü#\è Suq&\å\ç\Çcò\Èø=¥‚\â0œ\",²?\ã$&\ßc\ÌG\ì\á\ÈG!õH”\0>|Àµ/Œö\É{k[{,r:	dU*e\İ6\í<bÁ¶°=t8u\Ê\"Ğ–“56 #B9\âX<AÀÇˆğ¶\éD\ãc,€O\é#ƒÁ©›f\0qR51™³\Çø\Ğ\È\é:ø7WT„¤yN\Ç\ÒgRH\İ\È@¹,&ø¢¡\r	l„\ã\ZšÇ¹¡e¦t\Ïe –O\İÈ¢Zw™?„Œnö^<uŸ> \ê74\Ïi!N’†H—#õ\Ö}\à4óhLt©\×@¾‚eh2lˆ§,º©57¶P›ş©–{5\ç\ïó\ç–\àm‡Ô¥UˆD´³¡Áp\Zc.	\×},°† #şŠY\"4\å¹D…K‘€±\'\Ã\ÜĞŒ¬¼õ^L?{\ím\áCFü¶\Ğj@\ŞI\ä;<k\ÏQ«<baH¸\ä8\ìWñ÷›÷\'£†Y*U\nŸw°	\n)˜N€‹n\Ş-z\ä\ï\ru!5 šu\ZÅ©@™\Ù#\êû\Ğ\æÉ¶S™/\ëB¾}ùMC8L©?c³^Ÿ\ÑË£ğ´?;öNM«}xû\à-\ï¬]7Waz}ô\Ér£³Ø½ºô\ÎÆ•©{yl\Ş\\Ÿ…;6\íEbÖ»\ëX=\Ú\Ùÿ<ü\Ü\\›g\íp\æµ\'#ruy\Ñ>Šn/\Âô¶}™\ïÜ‰¸w·_òflÒ1ºÀöo•¼Û‘ûñ2ô¦\ÒMŸ=‚\ÌJp\Úhb[A©BÊ¾SŠ¤\\0+…J\Ù`]*¸b;v—ˆ£!\ã\Ïı2&Ğ›N8ô5.(IV^ùñ\î{\ÊDm\İw¤:\Ç2K˜õoö\áq= $ô·À\'\ì\Ó\ìj:x)\ç\ĞN .pOO\ÅJ©TÊ—p¹\ì˜N\Ş2¢\í<\Ë	œ °‹°E³\ìEi34\r™›•´V4ªPFvó\\ú‹\İ\\«§\írT´²\Ã,:‹4z\ÈY\Z¯õˆ\Í~b—„ô\n¢\Év¸Ykz\æ.­Ù‡ÿ\\=‰q´\à\ã\ä{J\áLÒšÿ\Ô\r‰§—¡\í\Øw]Cğ­ö|O™\ç\Çb»µòT\×\ç•ûs¿X\Ø0O1¹ú“\ÂË¸W¦\â÷²\Ê\Ï/\æq_ûÌ‘ÛSÁ<&°9‚.\ÒW{uwYHX™\Ù\í{\Ónÿ\Æ\ìµn»óÇ³\ÓI÷n?ß•\ëö¡Ù»º\Éw\í\ÃB¯ut\ßm\ÚÇ³.´|\Û:4oÇ§v·ušZİ†r\×nŸµr^w\Ğ\è9\Åzf\r\ØÁS²\Ãø%q\"¦!Q‡•¿Šİ„…© 54\Æ|H£ª‰\äO¯T*d\\_a—\Â\åe\Ò\Ğ^ŸóÍ¿­’b÷)¹şÙ”\ì:Á\ëŞ¬cXÓ¡º\å\Ì\É\×¹\"\Òc¡‹\á–©/u/›;O2daN¾\İ&^\Î\â¥\Èõ6°”‰\"ğJRwL·‹{ƒ\îh‚­³#)\"\æ¢4]\Äa.\æ\ÎÇµ®¼Jc\ëU\äs®6z^[#Sw·E\ßÛ†¿P\îuB\Ú\ÜÎY¶”F­ª&÷[w®\é/	_Ç¹hWõ\Ä\ã4†@s.`\êz\r70 øJ\íÇ“‘l%\Æ\É&\Ä8I]˜ŒOøŸ+nC^¬ø¹\"Ü»K\Ş[%³P*9¶	CxU©Ûº‘İª\á”#•œµ,k9zõ!W$\È\ÎWU\å*¢\ÚrªÊ†*\ÉbWµ\ÎqŸF^¶½V\ÃU³ú\ã	0\ÅM\Ì@\Öÿ\n›\Ïæ¾¾œ°7\"gÉ‰0_®fóÀW˜¾0N¾,(¿q¹†{\Ê…)i¡ı\Ú\ì¡Õ\Ô,I&0Ë‘DN—VÉ¶Šùr\Ñ4\Ôp\ï\ÇL¡h\Û\nS/Húx˜Ìµ¢U‰(g:wü\rÒŸş˜9Dp'),(14,'2_8a67418632745451',1721648600,_binary 'xœ\íko\ÛÈ±_\ë_Á\Ó]¿•%\ê-\Åö!‘\í‹S¿`)}\0„¹’6¦¸,wi[w\Í\ï\Ì>HJ\\%NZÀ¢;3»³ó\Ş\Éh8úMŒú£ZB–t\Æ\Â\Ú6j½Q-%e\r\Şü^o8ªıpz3şóö\Ì[\Éutrp„ÿy‰—\Ç5\Z×°’ğ\äÀƒ¿£5•\ÄV$T\×2¹¨\0\ã\à\è‡z\İ;ø\ãtÅ„÷D\ç‚I\êÁcÂŸhJCo¾ñ`€›¶W÷X,–²x\é%”\'õ$÷ôG\0r…t\Ä[¤”z<¡±\'x–\Ôk¶½+Ã”\Öøx’5}\â\ét\Ê$#Q´ñ‚”©Gü+	M½\É!\éŠòHzh,\0\Å!À~¹ş\Øø\åöò°4tÀ“MÊ–+\éù\Ã\á \Şj¶:_\ìvv\è=;‚ñ¸Mi‰åŠ²\ÔK)’=\ÂDbš\n\æ\"^ğtM$\Ğ)~P)›gºA‚d\"F†\Ü$¼}\È\Óe\ã ^ùjÿø\ãÓ‹\é\åY«\İ#\ábô{\ß_\ĞV§Cš½yŸû½m¶z€\ç!™%º:›¾})MN4Lf—\ï&\ß:\Ò]\\/?~3Ÿšôò\âúÅ”9\é‡\ïcö\Ãwóú\á»Y}ööô\ì\îô\í\Ëur\Ô\Ğx4\ç\ázBOÔ¿ö\ï(dk_ó‚ˆq\\[ {x\ê·\Ò\É\"i\ŞÀºh\rq†?‹Ü44\"\Éz³v²5„\Zô«\ršµƒ\ï¦|9ıAŞŒ‚½¸\Î&ã»‹\Û\éaH@Š½yg\Ğ\'-:Ÿ7ı\é/\ßôƒn4;Ú¡ş\ë3ù\n\åQTv²k¿³ó››\é\Ù\İ÷›ñ\ï\é\0­ù;\é5Õ·Ù´6f°m\Ì:*ùyvš‚…bS«3ªIú,Ò›<ñè¼ƒ$­Q\rT\Ï\â`¤,¬FF>¦¾N[^jH\×VtŠ…Eş\îC?Ô†úkp\ÎÁqMÈ±Q¶d9)\Î\Ën…ƒQ-4=\Ï\â\0_Û‡UÆ¹_M\î!•Ì‰ ÷c\ÒûwœK!S’\ÔO\Ò,®½ù¬yº™\Ò\Ãù]H\Ù7£n§\Ü\Ãyª\ÄŞ›,	Øy¶\ß\î(¦<š\Ö í«™\è„ÿCİ¤\0Q¢\ë(P¿ÿ‚\Î\Ï\áùş…B\'ºœf2q¡ó1û•†\n\rY\ï‚ \í3L! ÁŠ\ŞAX3]q®$\åTlÆšòq–¦†\n¸šsQ+\Óh:\ÍX$M\ÉF9ğ†·P5Œq\Ì)Y\nl\ï\áô±QHı*Rµ\'3bÁ\Ñv~\\¡†g¬©*\í0÷Hb&¸¤r\nöf\à\êhÁh\ZAªgk|=ó^!\Â\ÂoŸ$9\ÌI¦õ]}\äo2\0\Å\Ùú?9„RJRú±\ä\rh‰c:v\"ıŞ‹Mğ\íB\Òô[-8\ä4MYH+Š°*û}\Åş\Å\âl\È\Í%ò:[\ÙDÅ›?p U:ƒQ\Ù\â:‹¢\n}qi„\é^+Dƒ\ä¦zö÷\à¦R U´o†ƒü\Íe\ÑĞ»¥)ZW\\\ã\0?·\Äi¶&FU\ßù[•\ì%\ÑñK\ì\ì™™\Üo;)ıW\Æ`eS\ã°\0V\Øj£¨«&\Õ6N{W\êt×±ı\Î’Ë˜3|t“†Th†¸@„Œš{\"D8®¤“¹\Êó›EqF\Ä÷Ó«K…‘V…\Î^À],‹$b˜\İB)&	\ÔJ\Ï9n’2²1‰÷¸\Üe XIX\Ç\0£Xj\î»\Z\àt\ÔX>’¨:Tß‚\\£¬ˆXU\Ô\Ñ\Õí®¸rX—V\Ç\èˆ\Ót \Ğ\Î!–ªe¥SPô9¥&\Æ · \nø\ÜD\Ñ\ã£.lrª\ÆÇ¡š©\ä’\ÕP\Ş`‰U\"µ®\äÀE\ŞC«x·‹&·;)i€ÿ\Z\î1lo5\æ¬tv\0.§…ª *ºjw\Ús;]ı\è\Òù|#©p\ê\\Aœ\Îæ¥²C{(\Ä	Hƒ\"¯Eq‰7Hy‚ni™„WÓ³…\ì\Ñ+K\ŞC\î0£f	\ì‰¢ô\ØÕn\ß\'O\Ó\è,x\è<j¸Œ\á,ùpÁ0Ih\0EÀW\rnúU¬JW¸\0¡jğ°\ä‘\èu\Æ\ßH”98ku÷c;+¡góˆ¾K¡Ş¬\Ä	D	^e\r†v\Ä\Ü66;\r\Í9J\Ï\0œz€¹D\\²\Øa‡`Gtœ\Ğ!\Ûat™‹cš\Ú<~2hG9\Ì\Ìrhk—\Ô/÷d:\ŞWÌš²t¼§ U`.\ä~ú\Ö‚k\Ò\È\éÛˆ-m)D\ì3ò–]”¸1GVšé±«2ˆù*0—\èı2\Ğe?O©÷L³\Ë:pñRª\ÕÊ¯\Ã\â\ÕUò\"š\'\Â\í%‡¹R4I\ÜT}\Ú7«¶{V\íª‰\ãb™†“}e©\ß\İ\Åq©”Cu¹\Ïr\Ø€RJKÆt^À.Fúµ\ÅN¡ŒwË½¨m¥’{óõÚ¹,\î\ì`8\ÙR˜\à¢\í\×=¿Œ\áŒ\ÚQ˜H¨\æL\í–B¿ıûÖ’_\\`!D\çÙ²\Êt\Ï@\\\êW\0«‚j.\ÍÁ{i÷\è¿Y\ï\Ğ~.m5Q_í’`2}8\äM¥ü\é”\n•µ`\ê\Øti\ÒJRœ#ÁÜ¤d(\Ú^¯\ß\ì:C_C‚Td0Ô¬†4‚*Eõ\ÒÔ¸+†4¶\rª\Ê ©ÔµŸn\ëc\Z\n\Ë-t¶„’8)1ˆ^\ÈS©¬˜\ìö4&\r™Œxğ`‰±61Ã½˜ÇŒ\0š\Æ}\"Ï R\ê-77\ã™>ŠÊ››¶Yª\é^\ÏQ=„l±°\è ¼.´ÿV«mM`÷/µ€G·\\\èg\Ü\Ü\Ç}¹\ây¦÷à·šÀ!™Ò‰jTŞ¢€ü 6[Dô«Z\İP\îL\íJ\Î\Ô	n	,²fsµ\n®¶ô‡­fª|\â\"\é³\éò)u\ZaW¶šI­f‘kX½Z\åjö¬^5\È\êN‹¦¼„%5¬\ì˜*´}¶ù²ı\\ó’b›¶ñIl«[·\Z\r:š—y3hpl·¥q{§z~bœŞ¨³°L4Š]%\Ğzp¸‘j\×\ïÚ„\Ãy§ˆ™T\Z¾`fYqŠYXöQn\à2&F! ³\ÒDØº41•T°á‰…¸\è/¤ ZQ\â…/M+Ø¯°Á Gs½‘œ³\r’#\ÆKC”\í\Ñ\ÆuTeb¸§i¤\î0×’ û#‡\İn…ˆ8W\ëµ\æ\Ï\Ç\Í[od½²²yUşh\Ë\éJ+\ÉÙ¯œ¯s¶Û£·.ú\Ç-4£­¢\\ğ–\İÌ„g…n}­\Í,Qp0®Œµ5IfBe\Õm\r°3½\å\0C4Ku\ç%DL$]RYj\Ë÷ò	]–\nöH+vµ¢x\\^n..šCh;úùyy\àŒxşr\\ó›5O­°^O\Ğ\ç@øi’ˆ\Çô¸¶uz?ŸM\Û\ç\Ğ\î‹sws_q¦y$V”J¡ˆk\âô\ì|\çÀóÈ†1‹UqÚ—\Ë;¢E&\äY@…\Ğˆ}’Z\ê W]<\â\n\Ñvñ¨\ÆñG\rbÀ\Ôõ\ĞlC°u¡\í¯\ÕÏ†¬££†\"vğ\ÕPŒ\íLªagU’DC‰\ÂH©¡\Åt\Ô(°f\â	*›³ˆ\É\ÍLBx.[.\Élc\Ì7‰rA­d\\»\à3i<¬¨\í7³ü¬£\ä~’\Ì#‡û·s1¡\Ñ\æd\İ\å[3©C”\ß\êlAQYš[j+¨¼K‰B!\È\ç²OK¹ª½E¥\á¬¾\Æ\Ê\"\ÛşüÕ™\r$R\Î\ÊWuvvyLú·\Ïz\Î\æğ\æo$ú+\İX.\Z3:{`\á§H\ÃÁ?\åe»Á¸S\ÑbÔ‘o•¾…x­¶\Ë!YKNhkŠl·\Ì)\ëk!úZˆ¾¢¯…\èk!úZˆ¾¢¯…\èk!ú?Qˆ¾°0\Ìb®hğp\Ë\ÂÙœ„§ü\ã‡>g¾6Qƒwùø%8ñ*œ\"\ÕBwh*§7š/\ìVl\í\Í\\3\ÚWE1Ş›Ó€©I&¾	\0’\'úb›\n¶*\Æ\îTm\ä\Şi\×\çñ%}¤‘•C»¥pL”·»\ÂÅ¡\İ9\Ó&\Õ)ıc:ZŒ\ÌC\ÕS¢q›\Í#4\nš†\émf‘?`?›ˆd\Ã+^üx=Àg=‘ò\rÆ™²@)\á7½…\ÌMU\ívenüa¨,„D\ï•ÉœšjÛˆg\ãLf\Ã7Ÿ\ØKƒi\Ò\Û\í|\Úú!&óu’‚\'¡„¹„9\Ï\Í\ÒB\Ç\è óÜœÁ”\Ğôbø\ç \ël!”I²\æôƒ\0}­õÔ¦\\OÀ\â`v\çA\åİŒ\Ú[\Ô\ËK²_\Õ|ı%_g3Ta‰\Õ+mİ„°\Æ\æTº€÷·\àö*êµ™€\Å2\İh\Êkã›ª=¤ZrlÓ—\\¯ µ¨H\Çe­xBy¬\Ö\ÖgUO|h°\"¿\0\Ûó\Ùb\èR±\Â\èõE\Û\Å\0;N\'\nQ\Ù-\Ş5«µ…u†\ß\ß\ë–+”–L6¯\ëR®dX¨Xßˆ\Æ\r\èM¬\n¹]•‘(²\'i6ş\ã©ıse!EC\çÆ¤F˜\çE^>\Z››@0³\Û±Á“™O\İJ™¾rg†P\ç>‹\Âì”±§\\@¥Â–l§®ùš‡ŠpWbPÒ¿•úã’.Mm*£\Îuªİ²‡K6/o\0´\n\ìmŠPˆ\Ô]°.0ó\ØŠÓ˜¨\ä\î\Ùò¯ÎÇ‹`«\è\Â,\Ñm\Ê#¾|Côò5I·òM‘Í¥,†jšs@k«&w`\ä\×ˆş©lÎ³\ÚJ¹\ä;-\ÔW½şştöµôR¯Ÿ\ä½-¶\ÒF¥·ó—÷60ög®§`F<R\r\'ÿ>j\èc‡hLe¬/\Õ,Ì³¸ê¢¿^³e]Á*º³\ÔÁ»\Û+Xd™4¤m4c\\|€¢cEXóV)]\×ş\äÿ$jjı$¼Æ‰ñğO\âB\Ùv\É1;…c\îÂ†\Ê+¾^‹m¿NP_¿û©¢ª\Éÿ÷sP\ä6…°±\Çø‰Ç¾\Â3e€Ù˜\ZÑ¸\",Æ¯W\æ‚^«i\Ã\í¥)K.ÉœFb»Hv`\ì$Œ\"lOÌ‚r\Û`1hœDæ¦«õ\'t‰¼\È?=JUQ¨h\á+¢\éÇ”)o\ÓA«!6¿ø\Åıbeı\×u\åX‡t±®›¡\Êø\Ù\ïCğmv†º\"Æ&@ùş3lËˆ\ÏIô–€\Ë8OGF2[\Ü_©\Ô}™fvc#¯¼\Ô6T\ã\nS{al\Ê?\ZS~\ÉIX¢ÁBşİŸG\ê§:a‡6·Aù]©gto\Ò\ïµßµÙ–$I´¹†Ú‡¾gqQ]«\í0I \Ì\İ\Ñ%¬\Ö\ÒMÎ¸ªup#\Ğ& ?‰ò+c^iúû³pIÍ³N«i!u\áp*·kUL{º\ÃÛ£\İ÷g9^RÈDò´”‡Œ·?wš=\Ø.\ÓE6¿­r©\ê°Nu\í`ı‡dÁ·Mşò\İ¡¾\\R;e¼X\\ùm\Ü#\ÕK?ô­\ÂH\ÊN×·ùÁ	\ÆL&7\àVŠ“n\â›¤†]\è;z8\Å,¬¾Œ*¾°T\Äsk1\ïõ\ŞAş\"~dfó²Raj#§\ÏP\Õ\é]\n¿\ßò{A¯i–s¥€t{­V\Ó\æAñAW©h/\ÂY\×\Øÿ€„r '),(15,'3_291bce1e98df7dd4',1721648605,_binary 'xœ­W[s\â6~.¿B\ëNûĞ©\×\Ø@À\Ü:\Ûd“²-MœlHw‡‘e+k[®$‡ÀNş{l „…´İ©™1–\ÎEGß¹H·\İö\Ùn¶\Ï\è”F‡µkb†ğT\ÑT0ª5ZN\Û\è¾:{“ó·(RIÜ¯tõŠq:\ë45ô\ÅA¿‚\à\é&TaD\",$U=#W¡\ÙJ÷•i¢\Êw^\Ä$šS_2E|f|N\r¿@°À¸†L\ÄR™1Á\Ò\Ê(\ÏbŠGô\ÑW ^ğ€F¡ ñŒ¦Hò\\ŠK³\Ñ§°¥D\nœ\Ğ9ŸA)S\ÇñA±*WüËŒ\ntùcñ;„\Ó\0ÅŒ\ĞT=O ®¬³ó?^o-Mx¶l)d»n\ËtªNñpW\ÙkôöÌ‘Œ§`­ [bÀ¬\"\ÊDˆb÷°‘yJ…„ei\ÈE‚\Èöhg\æ\ç\å„¨L¶-K-2^{\Í\ÅÌª˜&\à[\é*¦bÚ¿d‰\ÆL+As¦\"$ó$ÁbÑµJz¥tP\nÀôŒ…U±\â\Â@+§÷ŒrŸ\Ç\ÃK\íµ\ÍÓµJw},€ ]]¾\×O7`÷ˆ=ƒ8 -\ÆRöŒPãŠ·\Ğ\ç±ZÀ|jj#§únüTRc¼\à¹2«Fÿ\ÙÅ¢ÿ8QšVùf\É/_\ÙL\ï\Ò-ğ§)\Ñû\ì	lœeX(KÏ›V\Ø@\à‡ˆ^—\Ê(“…\ï4‹ö\Ü\Êq&À‰‰vÏ°J8Só˜+¦_\Ô\Ãôk4hüZJş\Ğ8\éApj\â8\É:‡¸‹`\ãqL…–8\ê©(\â\"(\Ä\ÈoXF=b\ÛÁ\îQ\è·\\‡\Ô\ífHZM\Üô1­a\Úhø\ß\ÚD\ÄH¿\Ë\Ò,W¨D&bA\0%d{\íúó€¾ON§RA.2\Ğ=s÷–|9ö8»>\ß{\Ëy_µ½›··÷$±\ÉÅ™«&\âü\æô\í§™ÿ\áš\\$\îÂ¿U\'7ñ\à/Æ©Z\ïö˜\r\Şü>ûUNnFÕ‹³xI\Î\"ú\áúó\Õ\Ùiz{\ç·g\×õÁ\Ê\Æwošd\É†K\Î\Şó7·…¾\Û\Èÿ\í:&‹As\âñ9\èt\Ã÷½¥6]\Ú\njğˆ¶\ZU·á¶‚\Æ\ÍVˆ]§\æ4p“\Ödıwˆ¦S%r	e\í\\@IŠQù„Ê—ÿÊ¹\ê€±$¶WLŠ>(\Ó^\Í\Ù?—ù¤:¿x{şNØƒdqC”\'£l‡‡3d4v¦§S’…\åjòšöøx\ä»-¢¨f\×\Üf£j×	|ß­­š}To5a–\ìk0 ö\è°y[¹W\ä[\äô/Í L9ı­´\Ü\Í\ê‚WªuÒ‰4<Ï¶J\Íó²cŸ\Æ\Ïø‹C—Øƒ)k–8\Z}ş+]™\át­BĞ¿rG\Ñÿ©ki‚>­B\ç¶-‚b§$®R«Z/·µğZ_qH˜«œ±­·³ŠH=úÆ”-=\Åf\á\à—7rx°\nŒ­\Ïò\Ù\ãú-Dp®8\á\Ú>\ìm¨¸‚a³\Ì<Ø£\È\é\Ëø\Ğ\"\Õ\"¦E…gº·±/yœ+\ÚA 7ci»Šô\Ït]—&€û®=\ã{¯UŸ ß‹\Ô^”x¾À:ıÿ£®¯•=…\É\Ğ#‹¡7©O&ó\ÑÍ¼~\ëİ²‰7œ½\ëx’¼_\î&ó¡wµ{Œ¯\ã\Ñ\İ\Õ|t|j\Êrò0Z\ë\áÉ°Wì½²ÿŒ\ßNµòØ”û\î\İ?/0f³\âÂ¶b\ßV\ä«\ÔTœ\Ç>†;¤™c5\ì\ïMr-P¤ûnuz976*·K\ÎF\'Ju0}½©\Ü3ß–CZ6L»f\í[™û	ûÖ˜|v <9J\ålƒŒ\ÑE¼4c¿\ë¢ù•cv«B\×õw\İı\ÄVµ±Ï‚\ã_\\×¬ÿ\Èøm’\ëªÖ•D°\Ğ.\Å\Õ\Êvhb…\ÙS\"d¤3Æº e7$­óÜ‡^\Æz‡\ïñe!m\éûÜ±¸,_\ß\É_\ìfµ\ÑlÖœ*4h€jÁTtVyÉ‡\ÃT·{º´\íM[\èA\è)§\Ş.jSÁ\Ô\Ùt|eÃ§E qŒ<–’ry£ƒ\Û\Õö—G =§LuP>Q\ëeO\ê\év\å“ˆjš­»\Õz«]¶\'¡=ùx\Ìıx¾\æüxA	Áf¡{\Ü\Ú\ÔC}‘\Ñy,š^ú\0M\'•º\r¶›¾ƒU ¶*¸e&Ùš\Ò8rœ‚\â$\Ú<\Ï\ä\ÊDÖ®¡Un`Lk ıño®Fq'),(16,'3_dd7a6fe31259c838',1721648609,_binary 'xœ\í;is\Û8²ûõùWp4»_¶¬Óºbg*‘í‰³¾\ÊRö½­r•\n\"!	1EpĞ¶f6ÿ}»q”%N¦ö\ÃVYUqHt7\Ğ\è\Éh8ú]ú£ZJ–tÆ¢\Ú6\ê¼\Ñ-!OMT\r\ŞZ½\ŞpT;ş\éôf<ı\Ç\íY°R\ëø\íÁ1ş\Ä$Y\ÔhR\ÃJ¢·ü\×T‘ \\!©:©ejQ\0\ÆÁñOõzpğ?\Ó“ÁK¦h\0)¢‚FÁ|À\07 °D¦L°d¤”§1\r$ôGrt$XJ\Ò$<!\rÆ†\í\àŠ$0¥5>²¦O\\<@§L1Ç› ”(3\âßˆL©&„ˆÿ$\nb\ÒD<K\"€ızı©ñ\ë\í\åaiè§Á–+´†\ÃA½\İlw¾\Ø\í\ì08{v$\ã	p+h‰ÕŠ2\n$¡b0‘§„\n	\Ã\\$.\ÖD\æ•!\Ø<3\r\n4 R9j4\Ô&\åC.–ƒz\äküó\Ï?O/¦—gó\í£~o0h\Òh\Ğ\êD‹\ÖQ»G´\×\êõ\ç\í\àHæˆ®Î¦\ï^J“\'“\Ù\å\Åû\É÷†t\×\ã\ËO§\ßÍ§!½¼¸~1eNúñÇ˜ıøÃ¼~üaV?œ½;=»;}÷r7Œ\Ïy´\Ğ\Í_÷;\ØcÀ¢“ZØ®aL¤<©-\Ğ=ı·\Ñ\Ébe\ßÀºh\rq†¹hL6<Sõf\í\í\Öz\Ğo6\Ö~˜ò\åôy3\nö\âz:›Œ\ï.n§‡óp\Ñë†´I‡mJ;Qt\İa?\êtÈ¢·\Ğ\È8\Ô|&ß <n€\Ê\Ş\î\Ú\ï\ìü\æfzv÷\ãfüG:@kşAzCõ}6mŒl³NG­<;MÁB±©\İ\Õ}V\Z\éMxL\ŞA’ö¨ªgI8	K!«‘QS_·£/µ	¤\ëh:\Í\Â\"oA?Ô…úkp\ÎÁq4MÈ±q¶d9)\Î\Ën…ƒQ-“TœgIˆ¯\È\Ã:\ãÜ¯&÷J\æD\Òû1ôş=\çJ*A\Òú[‘%µ7_O7ó\Ïf¸nRö\Í\è¨[\î\á\\h±E÷6K6d\í·;Š)Š\Z¤}=3T\ÑÿÁP7 Zt]\r\ê÷_\Ğù\Ù#<ß¿§B\è\Äôƒ\Ó\ÃL&/L>f¿\ÑH£!\ëG H÷SI¸¢wÖ¬@WœkIµ\0*¶cMù8\ÂRWs\ÎcJm\ZM/\â¡‹A6¦È—(º…ªaŒcN\ÉRb{§…ˆF\êW‘ª=\Ù¶ûh•ÁjxÆšª\Òsˆ\"v‚Kª¦`o	¾ŒÆ‘¤~v\Æ×³\ï\",üöIrÃ¼dF\ßÕ·AşV!P’­\ïø“Gˆ ¥T\ĞO%o@K\\X\Óq\é÷^l‚\ïŠŠ\ïµ@\à?R!XD+Š°*û}\Íş\Å\âlª\Í%“\ê:[[\Ù\Ä\Å[k\àA«t£²\Åu\Çú\â\Ó3½Vˆ9\ÈOõ\ì\ïÁO¥A>ªx\ßù›Ï¢¡wGS2´#ğü\Ü¯\Ù\ÚU}\äoU²—DÇ¯°³g\Zfj¿\íúÏŒ	\ZU\ç8,€¶:(\êªIu¬\ÓŞ•:\İu\ìVw\ÉgL¡„>úŒ\É@*4C\\ BF\Í=\"\×\ÒI‰Z\åùÍ¡x#\â‡\éÕ¥\ÆUa ³p\Ë2™\'f·QŠiLB½\Òó›\n\Æ“8ô[À}Š•„s0Š¥\áş\È\0¼š¨GW‡\ê;o”‘«Š:L»/®\ë\Ò\ê=ñš\Ú9\ÄR½¬ô\nŠ>§°\Ô\Ä\äTß“›¨5z|4Å‘KN\Õø8\Ô3U\\±¢\Z\Ê±N¤®Ñ—<\0¸\È{hï®ƒa\Ñ\äw\'-\rğ\ßS\Ë=†\í­Æœ•\îÀ\ç´PTE\×\Õ\í^Û‚bn\çñ\È<út>\ß(*½:\×¯„³y©\ì0\nqÒ \Ì\Å\ëP|\â\rO\Ñ-“ğj{v=ze\é¨\Ã=f\Ô,½\"±C”Ì£\ß÷\É\Ó\'Ÿ%!<’G\r—1¼%.&)\r¡\ãªÁ\ÓM¿ŠU\é\n Tö‘<³\Îø;‰3g\í£ı\Ø\ŞJ(\â\Ù<¦\ïÔ›•8‚(Á«¬ÁĞ˜\ÛÁf¯¡yG\éY€W0’\ÊK–x\ì\ì\èn`yd;,€>SbIB…\Ë\ã \á\'ûˆv”Ã¼Á,‡¶wI[e\àŒA\ÇûŠY[–÷´\ZÌ¥\ÚO\ß\ŞBğM\Z9}³¥+…ˆ{F\Şr wc\æ)\ĞJó/=™G¯>…\n\Ì\'úVè³Ÿ\'\Ô{¶\Ùg¸x)\Õj\å\×añ\ê+ù@)\Í\áö’\Ã\Â|)š¤~ª¾\í›U\Ç?«NU‚€\Äq±L£É¾²´u´‹\ãS)‡\êrŸ\ä°=\0¥”:-–Œ;é¼€{]\Zô[‹/œB\ï\"Q{Q;Z%ö<\æ\ëµwY\Ü\İÁğ²¥1ÁE\Ûo{\"~\Ã+½£0QP\Í[™º-…~ç­%¿ºÀBˆÎ³e•é…øÔ¯N\Õ\\šƒ÷\Ò\î\Ñ³Ş¡ıR\Új £¾\Ş%Ád\æp¨m5%ø\Ó)•:kÁÔ±\èÒ¦•´8G‚¹)©\È:Å†V¯\×ov½V\Ó@BaŠ\Æ\Ò\ZV#\ZC•¢{±¸+E4q\rº\Ê B™\ÚÏ´õ1\rE\åˆ:[BIœ–D/\äBi«ƒùõ&˜Šyø\àˆ±69Ã½˜Ç¬\0š\Ö}\â\Ö ™A=¥\Õ[nn&3s•77]³\ÒÓ½¶£{ˆ\Øb\á\ĞAxG\Ğş{m¬·5\İÿ­…<¾\å\Ò<\ã\æ>\î\Ë\Ï3³¿\ÕÉ´Nt£–ğ\äÓ²\Ù\"¦\ÏXÕš†rgzWr¦OLƒLa‘5›\ëUpµ ?l5S\íIDŸm\ï0ğ”O¡¨3»²5L\Z5Œ\\\Ãú\Õ)×°\çôj@NwFd0\å%,\é¨ee\ÇT¡\í‹Ë—G\àš—\ÛtOr[İ¦\Õj\ĞÓ¼Ì›Aƒc·-\Û;\Õó\ëôV…e¢Q\ì*±€Ğƒ£Ò»~\×6Î³<EÎ”\Ğò3\ËÒ˜“HÎ¢²Zp»\0—\É01J	•&\ÂÖ¥‰é¤‚\rO,\ÂE!İŠ/|ah[Á~e7êœ›\ä|œ5h”±–X\Z¢l.F\è£*\Ã\İ8M+u¹–\İy\ìv+D\à\\W¬×†C<·o½‘ó\ÊR4\Ê\æUu¶F[NW‚8I\Î~\ã|³\İ\í¸u\Ñ?n¡Ym½\à‚·\ìfHºóµR4[°DÁÁ`Lº²V\Ô1$™IU·IÀE\Ì|ô¶\ÑL˜\ÎKˆ˜ˆXRUj\Ë÷ò	]&${¤»ZQ<./7—j§Cÿò¼pF<9©µ›µ@¯°^O0\ç@øi‘˜\'ô¤¶u¿¼=8vÎ¡3\Ü‘ö\î\æ¾\âLóX®(UCŸ\Ô\ä\é\ÙùÎ\ç±c\'®\âh<½/—wDŠL¦È³„\n#¤û4\á!\×]<\â\n\Ñuñ¨\Çi\Z:Ä€?\è\ë\r Ù†d\ë4F\Û_?1µ’\ÙzM\Ä\æ\ß7d7t?š\Çóî¶¿\Ïad¬_\Îwóû¸8n81—T\ÓĞº±jk½7\Ê\Z­Ù€HÂJ\É\æ,fj3S/Ê®„gD\ÛóMªc‚±:\\¯û\à3e\Ï`œK\ê­~6³üğ¥™Çx\Ô\É!\Ä\ÆjW$˜f¨‡Øš)3[\í\î,\'\æ2¹\ë´ó*Ù¤”¹4‚Zp®\Ê¾”<K\éDR\Z4š•Á\×X*B¨ı\Ó_ÿ¤;s‘M©Yù\î\ĞÎ¶Iÿş\Å\ÌÙ&ı\Ä£TŠÆŒ\ÎXô9–\Ã\èAò\Ïù:\Âb\Ü\é\í\"a1\ê¨í”¾…x­÷?\Ë9\ÂTo^h{Šl·\í±\ïkeüZ¿VÆ¯•ñkeüZ¿VÆ¯•ñkeüZû*\ãVª€\ÙF\Ì\rnY4›“\è”?`@3\'ñ\×6lƒ`ğ¶#¿„¨rG¥\ïÃƒÇˆ\ã­\r*Ô”\ãVü…Û¬®½™FûºJÇ›…0µÙ­e£\0¥â©¹ú§£™+Ó±{\r\Õ[\İw&ñ\ä’>\Ò\ØÉ¡\Ó\Ö86\í¸}ó\âXóœ“\ê\Ïş:ZXŒ\ÌCx²q›\Íc6\nš†\ím\æ?ƒ`¿\Ø\é\â=^°üt=À3‘òÏ™¶@9\êw³\É\Î\í2ş\Öı\Ó\Üø£H[‰?h“9µ\å¿\Ï\Æ9˜\Ì.F\Ë~\\\á®UN”½j\Ğ\éñÀi\Ô1·,ñ¸¯S„Röš\ê<7K£ƒ\ÌssSB\ÓK\àŸ‡®»…P&\È\Z‚\ÔG	úZ›©M¹™€\ÃÁrƒ‡•w3\êl]•\ÒWP/\È~\Ó_)˜¨Aû8›¡6G¬ i\â\n9„Ø€5¶\çö¼¿w—u¯\í\\\0ò,Qbc(¯­o\êöˆNh\Éa°\Í\\¾‚\\§SG;´µ\âID\í±F[_tóY¢Á\ÊüŠp¯e\ÍsI(\ä\n£\×Wm\ìXL4¢¶[¼1k—\ç¼\×-W(­\á\\¡ajË’a¡b[Vd0nHo]	\Í\İ2‘Ä±;ktñ\ï5<‡q©eœ“aWyx=kl\ïJÁ\Ìş\åÎ”\äÏ®r<}‡J0s)\Ñ¡O\Æ…\Ùic\\B\éÄ–l§\ĞOøšGŠp—†°\Æx§\Ì\ç1%]\Ú\Ú\ÔF\ëÔ¸e!—l^Ş‘h\Ø\Û¡”;=\è\Ûr;]`\æq	%7\Ñ\ÕF€:°\ŞlÁa5µ \áVIˆ)Êµ[Ác¾|—@*ó\ÓQ\å,—XYµ&µÇ¦\Îpml\î‚4_¿·ú|o¥S7z\Òj+/\ä’\ï¶Q_õú‡\ÓÙ·rM½ş6\ïm±•C*½¿¼·5F{›\Ó\ã±nxû¯\ã†y°vˆ\ÆT\Æ\Úù°\ÏaÁ<‹›A\æc?W\Ó0\Ø[\Ó\é\ÎB¯º¯`	fÊ’vĞŒqizˆO4a-X	º8©ı¥õgYûKû\Ï2h¼µ\îşY^h\Û.yi·ğ\Ò]\ØP»d…¢eö\ÆÅ¦d·¨¯ŸIUQõ\äÿ‹?“:(òr›B†\Ø\ãªPü\"f_*\Ø#`6¦–D6®KğcÃ•½\Ï\Ønºp{ik”K2§±Ü®˜=;Ù£\Û»d\Ü6X`\Z\'±½\ìü	]\"¯ò/u€R—:\ZAøŠ©ø$˜v!ğ6´\Zr#ñ)X‰Ğ¯–\Øİ”‘uH\ëº\íJ_Z}¾\Í\î°İ³‰d¾;\Õ\Û2\æs¿ƒõ\à2\ÉÓ‘•\Ì÷W:_$R‰\Ìm»\äe˜\Ş$K!p\\a5b1ŒMù7Vr\Ê/9‰J4X\Õ¥ûóXĞƒ\á\Ôd\ï\È\å\Ö3¨\Å+\Å-‚\îmú¡ö\\¶%i\Zo®¡¢XR”\Úz³Nswt	K7\Ìò–q]ø\àKhLÀ|AÖªŒye\è\ïÏ¢%µ\Ï&­ŠBú~\"$`¡¶WL{º\ÃË¶G/\î\Ïq¼¤‰â¢”‡¬·¿ÚØ­\Ùe6¿­r©‹²nu!\áı‡d\á÷M~ùV†\Ôz\é}<^¬´Z¸\rf×\è[…‘”®\ïò£Œ™Lmb:Á}/\İ\Ä.¶p-»&\ÑwÍ¢pŠYXHV|8¨ˆ\ç\ÖaŞ›„üDü\È\ì\Ö\ê\×\ËMcñôJ<³\Ñ\ê·[=w®´}£^»­!\î<ó1\\©˜	\\D³®¾ÿ\r†d\Ñ0'),(17,'4_327c2af004b59b7f',1721648609,_binary 'xœ¥is\Ú8ôóò+T\ïl?\ì¬c›\Û`\è\ä.\íiâ¦¦\ÃÈ¶\"\Ære9	tò\ß÷I	\Ù^f\ÆXz‡Ş­÷p\Ãn|Kµ†–\à1\Ñ@k\ÒF¹©v|\rV¥r¹\ÚĞœWGıCwpvŒ&bµüC\Ç-Äš\Ü 8h<ÎŒŒü	\æ)--¡^Œ‚óJ\×Q\áwBStG¼”\n‚\à3aw„“\0ysôKHG4N\Êi<F	aID`(~\ä+ \Ã(\ä„ –¥,\ã>A‡¹Ø¨‹cPi&?O8‘;\Æo€)G\Ñùœ`‘Ÿø§	\á\è\âc>aS„\ã\0E\Ô\'q\nğ,\0v\Úûhœı»·q´Ï’9§\ã‰@–m\×õ¢Y,#>e¶‡\ïAœ”²¤\ådƒÅ„P8_\Ğ[P\ä.&<…c:q\Èø SòHgp\êeù†\0ˆ$m†˜\'¬´\Çø\Ø(\è:Ø·\à*\"\Ò\îf‘ \Òj© 	’¼#‡r\×\Ä`’–6&pŒkh\éî––kxØ½şZ?‘;\×ñX0€trş^=N@o\rZš_nNÓ–J\Ë#õ\Öbj¹Á‰.\å\Z\ÉW¸öPğœeB7µö\Ö\ê\Ğ\ïn\ä¢~™ò\Ç\é\ë\í§q¤VˆÄ¾Ô³¥Í”;0†\Ü\×,°†ÀöJX*4e¹\Ù\Òk\Òi\n,‰}\éó–f¬€º„*Ó½÷£\ç&ü«r\ÓüU9jA,J\àk<Kš/a«\ØbQD¸¤8\è	WÁ(2ÿ-N\'-R5½ ^*%?°\ê%\ËöBË´K\ÅjP-R±ş\Ü!;D\ÄDÛ¡q’	”[bBƒ\0Š\Å2şvŠôù9«/ŸG£T@\Â~\Ñ\Ğ-2 ul\Ñw½<‰>¸‹ÿÁ´Ü«\ã\á­?³üóS[>E\Ù\Õ\É;Ë‹\Ï\ïÓ¥>³\ç\Şe\Ï\\G)›÷c±\èO;VŸvöß\ÒÁU\Ï<?ş\éı„|º¼ùxz?F\Ùğô²Ü™Š¤?İ¯ùv\ß]0º\Èö‡Š\ßpâ½½Œüy§6p\Ùğ´\Ã­!E+¬Ù¤”*a•\Ô+¦]±\ëA\ëZ=\Äv±T¬\à\Z\ï\Z?o\ÑHğLœq¨{\\P’>Z\å\Û\ë¯\Í\ç\Ì÷KøA„o\'\Ë-\ëŸüC{¡[O6}®‡”DÁ“\í\Ñ\È\Ï8‡rq5v{x¨‡\Ïó@³†C\\©›6ñ¬À¯‘r©D¼JÅ¬Öˆ%õ†Š\"ƒc;\Í62JeÑ¤Ø¾\0 ø\ÛÉ¶®0s+\âL0Ÿ\Í@s\ÆPZBqŠõÜ²`S‘—’M_¤b•—T\æQ{)‹2Ašh†ù˜\Æ\rÉŸn\Û6™55$°Gáš¸oi:¨–{RZó\ç£\\	ğE™gY…vè›¿U¹]•YI>\æ,K6\n\ævq°G¢-|µ£É»a§-òp\Ğ\Ú.üœ4ÁñŠš“¯…\ÛZkÿ\í \ïuC±\Ûqú¦œ\ÊIOjú\Ëev\é\Ó\Õq¯ø©‹M_Ö¯½º\Ô\ä·“óxÌ³G½(şË‹e\äo|\æ\Ï_\ïŒk†/*»JX\í7\ë\íŠÏ£\Ê]×Ÿwİ\Ù?\Z\Üõ¯\îioz\\\Zº\Ã\Ù`z\rÜƒ›\ît\\\ê\İXı£wtxÚ©ô]s\èö&\İEo:XŒ­®MÃ£nK™®°ûš\İ–üKwµ\0NŒ·c\Öt¬º¥%ú&#OÄº`,ò0´9(\Ò\Ëe{g˜J‚<›–\èOS\ëÿı¼f¹™4k(–ø\\©54y‚m\Ò!I›p\n\Åg¾rkšy3úq¼U¸}y\Ş±T·\è¹»E\\eü3Ÿ<\"<\rn\Ç\0÷´Ÿzú-_J	·\â\â\Z°\êwr•œN\êsš€u¸}˜j¹¡\æ„XL‰=òy:‘\Ébœ“|\nI³Ìƒ\Âx‡oñ…¢6dcu\È/\â\Ş4}c\Õ\ÌJ­V*š0U’\ê\à¼Å†KOYrş²¬õ8\æ‚û\åV±\ÜP¥L!5×“V>hI’bC\ëô\\\ZûùñZ7\ÌÆ·€T·!#\Ğr>ºrX8\Äş„H˜%§\Är½‘\×0\\2N®\ÏV˜\×\ç\Äg<X¯¡7¹¥09)Q€\îù<¢5Ô˜I\îa\Ì#©<­ZÑª–\ëU\Ó*R@\Ë7KVJµXTŒ!sñ8]\nG&\0\ê¹\è`T\îÿ\ìüd±'),(18,'4_a0675acbbc656b28',1721648613,_binary 'xœ\íio\Û8v¿n~…Æ³ûe±\ï³I­“L\ÓÉ…\Ø\İ`Pm³‘E­H%ñ\Ìô¿\ï{<$Ù¢Û´ƒı°@Ô•ø\Ş#\ß\ÍCd<\Zÿ&Æƒq-!K:ga\í\rwß¨–€Ç’Æ²o­~4®ıpz3™ıûö\Ì[\Éutrp„ÿy‰—\Ç5\Z×°’ğ\äÀƒ¿£5•\ÄV$T\×2¹¨\ã\à\è‡z\İ;øólÅ„÷D}Á$õ\à1\áO4¥¡\ço<\à¦\ã\Õ=‹„¥,^z	\åID=\É=ı\Ñ€\\\á\0ñ)¥Oh\ì	¥õ&šm\ïŠ\Ä0¥5>§dMŸxú\02\ÉHm¼ ¥D\ê!\"¡©7} $]ñO‰C/bÀ³8\Ø\Ï\×?\ß^–†x²I\Ùr%½\Öh4¬·›\í®\Ç»zg\ÏÀ`<nSZ\"d¹¢,õR\n$d0‘§˜¦†¹ˆ<]	tŠTF\ÊüL7HĞ€LÄ¸Ñ›„wyºl\Ô\ë _-\àüqv1»<G½a;6»~\Øk|\Z:½f{A\Âas\Ñ\î¶[€\ç!™%º:›½})MN4™N\ç—\ï¦\ß:\Ò]\\O.?~3Ÿšôò\âúÅ”9\é‡\ïcö\Ãwóú\á»Y}ööô\ì\îô\í\Ëur\Ô\Ğx\äóp=¡\'\ê_ûw²G…Çµ Só‚ˆq\\[ {x\ê·\Ò\É\"i\ŞÀºh\rq?‹Ü44\"\Éz³v²5„\Zô«\ršµƒ\ï¦|9ıAŞŒ‚½¸Í§“»‹\Û\Ùa³İ„À6ôI0\"a¿=u:\í~\Ğê·ƒşˆú!\Ñõ?Ÿ\ÉW(\Z ²“]ûŸ\ß\Ü\Ì\Î\î¾ßŒÿHh\Í\ßI¯©¾Í¦µ1ƒmc\ÖQé¨•g§X(6µ»ãš¤\ÏR!½\É\Î;H\Ò\×@õ,¦A\Ê\Èjd\Ü\Â\Ô\×\í(ÀKm\é:ŠN±°\È\ß[\Ğµ¡ş\Z\ÜG¤sp\Å@rl”-YDŠó²[a\ãp\\\ËMÏ³8À\×\äa•q\î\'W\Ó{H%>ô~\ÂSzÿs)dJ’úIšÅµ7Ÿ5O7ş\'=\\·)ûf\Ü\ë–{8O•\Ø\Â{“%2\Ïö\ÛÅ”G\Ó\Z¤}53\á?a¨› Jt]\Z^\Ğù\Ù#<ß¿£B\èT÷ƒ\Ó\ÃL&.t>f¿\ÒP¡!\ë=¤}†)$X\Ñ;kF +Î•¤Z\0›±f|’¥©¡®|\Î#Jbe\ZM\'\â¡‹¤)\Ù\è\"^\Âğª†	9#K\í}œ>\"\niPEªödF,8\Ú\î£UW¨\ákªJ;\Ì=$’˜	.©œ½$¸:Z0\Z…F\ê\Ù\Z_ß¼Wˆ°ğ\Û\'\Éas’i}Wß†ù[…@q¶¾\ãO!‚”’”~,yZ\âÂ˜È ÿb|»4ıVù#MSÒŠ\"G¬\Êş@±±8[\'rsÉ„¼\Î\ÖF6Qñ\Ö\Z:\Ğ*Á¨lqEQ………¸4\Ât¯¢arS½û{pS)‹*\Ú7\Ãaş\æ²h\è\İÒ”­§®q€Ÿ[\â4[£ªo\Ãü­Jö’\èø¥\0vöLƒLî·”ş\'c°²©\ÎqT\0+luP\ÔU“\ê§½+uº\ëØ­\î’Ë˜3|t“†ThF¸@„Œš{\"D8®¤“¹\Êó›EqF\Ä÷³«K…‘V…\Î^À],‹$b˜\İF)&	\ÔJ\Ï9n’2²	‰÷¸\Üe XIX\Ç\0£Xj\î{\Z\àt\ÔX>’¨:\ÔÀ‚\\£¬ˆXU\Ô\Ñ\Óí®¸rX—V\Ç\èˆ\Ót \ĞúKÕ²\Ò)(úœÀRc[P|On¢\Æ\èñQG69U\ã\ãH\ÍTrÉŠj(o°\Ä*‘\ÚFWò\0\à\"\ï¡]¼\ÛFE“Û”4ÀO\r÷¶·\ZsVº;\0—\ÓBUP]Wµ;mŠ¹Ç~t\é\Ü\ßH*œ:W§„3¿Tvh…8iP\ä\âµ(.ñ)O\Ğ--“ğjz¶=ze\É{¨\Ãf\Ô,\"1C”{ú\Ñ\íû\ä\éc\Z\Å’G\r—1œ%.¦	\r ˜\àªÁ\ÑÍ ŠU\é\n Tö<½\Îø‰2g\í\Ş~lg%òÌ\è»\ê\ÍJœ@A”\àU\Ö`hG\Ì\í`³\ÓĞœ£ô\rÀ©˜I\Ä%‹vvô@7°À	²@—)±8¦©\Í\ã \á\'óˆv”ÃœÁ,‡¶wI[e\àŒA\'ûŠYS–Nö´\nÌ…\ÜO\ß\ŞBpM\Z9}±¥-…ˆ}F\Şr ‹w#\æ(\ĞJó/=öô£S1ŸA\æ}«t\ÙÏ“C\ê}\Ó\ì²\\¼”jµò\ë¨xu•| ˆ„\æ‰p{\Éa`®M7\ÕÀ‚öÍª\ãU§*A@\â¸X¦\át_Y\Ú\ê\í\â¸TÊ¡º\Ü\ç9l@)%O‹%\ãN:/\àN—F#ı\Ú\â§PÆ»ˆ\å^ÔRÉ‚=Oøz\í\\ww0œl©@Lp\Ñöëˆ_\Æp\nF\í(L%TóF¦vKa\Ğùck\É/.°¢~¶¬2\İ7—úÀª šKsğ^\Ú=úo–À;´ŸK[\rd<P»d ˜LuŒ¦RştJ…\ÊZ0u\ìº4i%)Î‘`nRH²N°¡\Õ\ïš\İ\á \×Ó \ÕEc	bÎB\ZA•¢zij\ÜC\Z\ÛUeT\ê\ÚO·\r0\r…\åˆ:_BIœ”D/\ä©TV\Ç ÷5&\r™Œxğ`‰±61Ç½˜ÇŒ\0š\Æ}¢\Ö0C=¥\Ô[nn\Æs}•77m³TÓ½6£z\Ùba\ÑAx=hÿ­6QÛšÀ\î\ßkn¹\ĞÏ¸¹ûr\Åó\\\ïÁo5C2¥Õ¨$¼EùA7$l¾ˆ\è3Vµº¡Ü™Ú•œ«\İ Xd\Í}µ\n®¶ô‡­fª|\â\"\é³\éñu\ZaW¶šI­f‘kX½Z\åjö¬^5\È\êN‹¦¼„%5¬\ì˜*´}¶ù²ó\\ó’b›¶ñIl«[·\Z\r:š—y3hpb·¥q{§z~bœŞ¨³°L4Š]%\Ğ!zp¸‘j\×\ïÚ„C?‹ÀS\Ä\\ª\r_0³,‰8	\Å<,û¨·p™£\ĞYi\"l]š˜J*\Øğ\ÄB\\ôRP­(ñ\ÂF¦\ìWu\Ø.£ú\\o$\ç\ã¬Aƒ¤Äˆ±\Ä\Òe{´1BU™n\Çi\Z©;Ìµ$\èÁ\Øa·[!\"\ÎU\Åz­9\Äóqó\Ö[¯,E£Ì¯ª³5\Şrº\ÄJrş+\ç\ëœ\í\ÎxÇ­‹şq\Íh«\è¼e7\Ã@jÑ­¯•¢Ù‚E \n£Ó•±¢† \É\\¨¬ºM¢6bæ£·`ˆf©î¼„ˆ)€¤K*Kmù~A>A \ËRÁiÅ®V\Ë\Ë\Í\åÀ…\Ú\é@\Û\ÑO\Ï\ë\Èg\Äó—\ãZ\ë°Yó\Ô\n‹\áõ}äŸ\Æ!‰xLkP§÷\Ó\ÉÁÑ¬sá¾ˆ0w0÷gšGbE©ôŠø¸&N\Ï\Îw<l³8QG\á©}¹¼#*Qd\â0AT½€\Ø\' ¥r\Õ\Å#®mjœÖ¸¡Bøƒº\Ş\0šm¬Á1XQ\è6A\à¡úÙut\ÔP]8¸k(ö^Ì¶\İù>‡AAB°p~9\Ë\Ío\ã\â¨a%\\\ÒJC©\Åh¬¡Uv\Ô(+³fb!	*óY\Ä\äf.!U”½‡¶1üM¢Â68\\ª»\àsi_¬7ª]•y6óüÜ¥\n$ñ#G(\ê\äbÂ´­t3”BlÍ¤—­vwFq‘¥¹×´ó*‰¤”´‚\\p.Ë±½”7K™DPŒ4œ—Á\×X%B”ı\Ó\ßş¤:³AM\Êyù\Ú\ĞÎIÿöY\Ï\Ù$ıƒD¿Ğ\'EcF\ç,ü‰Qø ø§|	a0\îTt¶A°uÜ±J\ßB¼V[Ÿ\åô 7\'´½\rE¶\Û\æ\Ä÷µ(~-Š_‹\â×¢øµ(~-Š_‹\â×¢øµ(~-ŠwŠ\â©€\ÙF\Ì\rnY8÷Ix\Ê0–\éó÷k±A0xÇ‘_B@¹£B…v„\áqc\Èñ®M\åŒ\ãü…İ¢®½ñ5£U \ã}B\r˜™\Ä\Ö2€BòD_øS\ÌV\èØ½‚ª\r\î;†x|Iid\å\Ği+“q\ìnyq˜yÎ´IõAŠgÿš£óPµh\Üf~Ä‚FA\Ó0½\Í-ò\á\'\ìgm¨\Çk•¯\'\0ø¬\'R¾\Ù9WH =ı¦·\ÖÙ£Ya \Ã_»uš*!\Ñ{e2§¦ò7\â\Ù\Â8“\Ù\Åh™O*\ìeÊ©4:wô\İJ<d\ç\ë$OB)s9\Õ\Ï\Í\ÒB\'\è ~n\Î`Jhz1üs\Ğu·Ê¤\0YCú @_k=µ\×°8Xiğ€ ònÆ­R\ê\â\é%Ù¯\ê\Ûı\å\ç\0g3Ra‰\ÕÁ3m\r‡°&æ´¾€¶\àöŠîµ™€\Å2\İh\Êkã›ª=¤SZrlÓ—¯ Í©¬‘\Çe­x¾By¬\Ö\ÖgU\Û|h°\"¿\Üo³\Å4¤b…\Ñë‹¶‹v’N¢²[¼\'kV\ë¼\×-W(-\ßl¡\ËÊ’a¡b[Fd0n@obUùv…H¢È0\Úø·ƒ(ƒT†2ÉI\à\ç^Êš˜R0³\ß\íI’\Ø\à‰U§nN¥L_E4C¨ó°Eav\Ê\ØS. jbK¶S\ã\Ç|\Í\ÃE\è\çU!,/\ŞJıQLI—&ƒ6•Q\ç:\Õn\ÙG\È%óË›\í{‚\"b§uGn§\Ì<6¢\r^™B\Ã\ÃJÃ³\Ş,\"ÁVˆ\Éj´Û”G|ù6†$\äË¤^\å“+›RY&5Ç¤\ÖdMT\î‚_¿¯ú|_¥’6ú\Ğj+#\ä’\ï¶Q_õúû\Óù×²L½~’÷¶\Ø\Ê•\Ş\Î_\Ş\ÛĞ˜¡¹½ƒ‰ñH5œü~\Ô\Ğ\ÆÑ˜\ÊX;òY,˜gqH\Üg«»bk:\ÛY}\á\Õö¬{‚L\Z\Òš1®‡@Ñ±\"¬y«”.kmıE\Ôş\Úş‹ğ\Z\'\Æ\Ñ?‰e\Û%ÿ\ìş¹)g¬P´ô¦À¤Ø‰\ì\0õõ³¨*ªšüÿñgQA^h\ÓuA\ì±õ\'~³¯şL\Ù#`6f†D4®‹ñ\ãÃ•¹¿\Øn\Úp{iª“K\â\ÓHl\×\ÊŒ¼Q„\í©Y,n,0\Ó\È\\¶ş„.‘\×ù—9@©\n |E4ı˜2\åB\àm:h5\ÄF\àQ°¡_,0°ÿº. \ë.\Öu\Ó#?µ|›\İQ»oR6\"ˆ|K\ë¶e\Ä}½…•\à2\ÎÓ‘‘\Ì÷W*ƒ_\ÄB¦™\İk\É0µ3–@\à¸\Â:Ä”`›òoªÄŒ_r–h°ÿB÷\ç‘ú€Ã©\ÎÛ¡Í­gP…W\ÊZİ›ô;F\í÷l¶%Im®¡¢\ïY\\\Ùj‡Nswt	‹¶t“3®J\ÜW	´	\è/\ÆZ•1¯4ııY¸¤\æY§Õ´º	8•\Û%+&ˆ=\İ\á\å\ÚŞ‹û³/)\äF\"yZ\ÊCF\Ï\Û_ƒ\ÌÀlW\ë\"óo«\\ªr¬[]BXF\Æ!YğmS‡¿|C¨»\Ô\æ/\ÖX­n\Û\ê úVa$e§X‡ü\àc&“›ˆNqG\ÅI7u‹}[Ã®Nô]½œaV +â¹µ˜÷z!?2³Ÿº¯\ĞÔ¶NŸ¡¸\Ó{­A»\Õ\ïû­Î›İ£\'€ôúí¶‚\ØO\íôgo¥Jd¨Y¿\ç]\\qÿ4«À©'),(19,'5_d97b739857fac45a',1721648614,_binary 'xœ­W[s\Ú8~^~…\ê\í\ÃÎº¾\0\áf\è¤I“¦] 7-´F¶e¬Ä¶\\YN€Nşû\É@¥i¶»f\ÆX:}\ç\"\Ünµ¿\å\íF[\Ëğ”Lh uh»\ŞQ3>KI…£\êm¶5\ç\Ù\áğÀ¾F‘H\â^Å‘(\Æé´«‘T“½\n‚\ÇIˆÀÈ0Ï‰\èj…õ&pTœgº*¿¹\Í\Ñ-ñr*‚ÏŒ\İN\ä\Í,0¬\"\Ñ4\Ï(§\ée„e1A‚¡ô‘g ®x@£‚XFR”³‚û”f£>NaK‰ü<\â8!·Œ_ƒR*(\ã9ò9Á¢\\ñ\Î3\Â\Ñ\Å5\Æ<bW§Š©O\Ò\èE\Z\0\íxğ\Ş8>ıû\Å\Æ\Ò>\Ë\æœN#¬V«©Û¦]C,\ÜVö½99e)X\ËÉ†0‹ˆP8_\Ğ\Ø\ÈmJxËœ¤!\ã	 §\ì‘\Î\à\Ô+\Ê	Y\Ş61\ÏXõ\ãS£¢\ë€o\ÅTÄ¤\×/bA%j¹ ’º\Ğ-Ê‹$Á|\î%[¥ôS\nøtµ)Å±`\\CK\ßwµr»ı\é¼õ\ã¥§s H—\ï\Õ\ãôÑ «ù5\Ğ\ã<\ïj¡tRo= !—#\ØÑ¥‘ù\n\×\î*©1³B\è¦\Ö{°„Zô§¥i•_–|º|e=½\rˆ£ğ\'©/÷\Ù\Õ\åÌ…!\çõ\0¬!ğC\Ä\0¯Œ\åBS\È%KJJFé¿¥ût\0û2ºš±\â\Ó%£BQ—¬ú’÷¥˜M¾‡öú«RÁõ\Ã.¬$>\ÇI\Öù·\n@Ç„K‰# q$ó\ß\à<\êV\Í\Zi„\ÕV³nû¦\Ú5l…{^Õ¶ıV­úû\ã{‚€‚°\é94\Í\nJ°\"\ZP\\–!ºÓºOjıòi2\É\äú\r\İ\à¸\0-\î‚-†.£—Gñ™»øg¦\å~|=¾ñ\Ë??n‰Ñ‡¸øxô\Öò\Òó\Ìûp\éŸ\'­¹w90G\Ï\ã“+6¦b1¼:±†ôdÿ\İôU>ú80Ï\ã…<‹È‡\Ë\ë÷\ÇG\éø}\\Œ/k\'W\"^\í7ü›õŒ\î°ı±\Ò7¼7—±??iŒ\\v:[\áY·Kˆm…i\Õz¸Gšu³Uo5ƒÆfˆ[vÕ®\ã©j\Èø÷@M&‚€RpÊ¡drAI~Ê·\ç_&:‚Y²´—¬‚Ì„n-ç¬¿\Ê\ïğ­Yg³Wxk\Ş\çzHIlMO&~Á9ÔšS¨\Ö+\Ú\İ]“xMŒÃ˜!ı*©\Ú\rˆ);À&i\ÚÕ4\Ì&ñ½Ğ’0@9’aó0G7\ÒQ¥`d÷.`GP¹\ì\ŞF¦n\'ºâ•µkU³d:M9+²\êó°\Ò\Å\Ø#ñ~5£Éªû“,\ÖKµÿ\'\ÏpºR\Ä\É×‚Â‘¨õştI‡§¡4\ï0d\Ód[µò\Ç\åkC«\å6^\éS§‡¾\Ìÿ\'”¦Õ¦–q)Gÿ)}Ku÷qª\\şø¦~<X†\Ê\Ægù\ì†\rtp!˜\Ï°Q€\ë‡\"\Ì)\Ö\ËÌƒ\İñ‚<Ÿ\rù\\\Ìc¢Š>•Å¸½œÅ… ¼Sš¶M$z«\Õ\"I \Å…É¬«ı\0¯\íùr\íNDv¢Á\Âğ)›^¥¿öÿ\Õõ•\Êû\Ğ\è»ş¼\ï\Ì\á\áh6x3£ƒ¤o÷GµqrŒ÷­¾;‹ñ\Õğğz>Zœ-úöûùÀ\İ7\î\Ûh\ì^\×GÉ™ö»\n‡\Ê\î\Ã3\Õ\Ê#4\ßu1qRü°ˆÀ˜NÕ…nÉ¾©\È©.‹=—/H3	\Ér\ØÛ™\äR ,KKö\í\Zõx>¬Un–œµN”Êú~Sk)¸‡\n¶)‡¤lÆ©t\Í\Ê\Ãy\á%ô¿E\æƒ\Ã\á\Ş\ÍP0`¡º\Û:Fi\ÌnkW¥ó;÷\Ü3l\×\Ç\0Oõ¶~\ÏV¥±B\ä	7\Ä\ëOMrUÏœ\Ü\ç4t¸·C\Õ @ñ\r@L™=ñyÉ¼1\ÎI\Ù3\å\Æi\áA\Çc¼\Å7øBIò†wÀ/ã‹«ü¥\Õ0\ëF\Õ6¡T“\ê7Œ²€ƒU6…²[´¬uó\èB$\È)»\ÖVuJ1u\Ö}a\ÙJ»­\\šú\åòZ·\Íö·; \ì=¤Ldh\ŞSke\ç\ê\Ên\æ\0û‘4Kö´µf»\ì^>C÷òù€qòùt\ÅùùœøŒ\ë1\\‡n(ôyª\×\ë\Ò=i;\Õ!“t¨$—=³Õ°­½ZsÏª\n0YÀ•3\ÉV”úm+J‘Vºxš/-¥m\Ír\'Á¤\Ú\ïş4İ°\ë'),(20,'5_7d594376c50f9749',1721648618,_binary 'xœ\í;is\Û8²ûõùWp4»_¶¬ûŒ©D¶\'\Îú*[\Ù÷¶\ÊU*ˆ„$\ÄÁ%@Ûš\Ùü÷\í\ÆAB\"”8™\Ú[eU\Å!\Ñ\İ@£o$\ã\Ñøw1Œk)Y\Ò‹joØ¸÷Fµ„<‘4‘5xkõû£q\íè§“\ë\Éô7§ÁJ®\ã·Gø_“dy\\£I\r(‰\Şğ;ZSI‚pE2A\åq-—‹ú0~ª×ƒƒÿ™®˜\è\\0IxLù\Íh\Ì7p\İ	\êKD\Ê2–,ƒ”ò4¦ä€ş\èO@®p€‹ŒÒ€§4	Ï³\ÍvpI˜\Ò\Z\Ï2²¦O<{€N™d$7A˜Q\"õˆ#\"¥Yp÷@H¶\âŸ’DA\ÌBš€\çI°_¯>5~½¹8t†yº\É\Ør%ƒ\Öh4¬·›\ínÀ»§\ÏÀ`<n3\ê²\\Q–’P²G˜\ÈSB3Ãœ\'­‰:\Å*#có\\7HĞ€LÅ¸Ñ›”wy¶l\Ô\ë _-\àŸşyz>½8†‹\Ñ0\Zö¢N¿\Ù!£Q¯;£¨†\á¼5;€ ™%º<¾{)MA4¹»›]œ¿¿û\ŞÁ\îüjrñ\é\ä»ùÔ¤\çW/¦,H?ş³˜×?\Ì\ê‡\Ów\'§·\'\ï^®“£†öÀ£96\Ğz¢şkG{Xt\\»µ Œ‰ÇµºG ş\Ö#º y,\ÍX­£!\ÎğÏ¢p#\rÉ†\ç²Ş¬½\İ\ZB\rú\Í\Í\ÚÁS¾œş hFÁ_Mgw“\Ûó›\éa·3\êƒA7š·£>m÷‡=\Ò\ë\r£Á¼\ÕjµC\íPÿñ™|ƒò¨*{»k¿³³\ë\ë\é\éí›ñ\é\0­ù\é5\Õ÷Ù´6f°m\Ì:*µŠ\ì4Å¦vw\\“ôY*¤7E\â\ÑyI\Ú\ã\Z¨%\á]˜±²\Z·0õu;\nğR›@º¢S,,Š÷ôCm¨¿÷ÀQ\éG1Ğ„\çKV\0‘\â\Ìu+lk¹ \ÙY„øÚ<¬2\Îı\äò\îRÉœz?\á½Ï¹2#iım–\'µ7_4O\×ó\Ïz¸n¤t=\îu\İ\Î2%¶\è\ŞdIÀ†Ì³ıvK1\åÑ¬i_\ÍD\'dô0\Ôu%º®\r/\èüô\ï\ßS!ôN÷ƒ\Ó\ÃL&\Îu>f¿\ÑH¡!\ë=¤}†ª#$\áŠ\ŞBX3]q®$\Õ¨ØŒ5\å“<\Ëp5\ç<¦$Q¦\Ñô\"š±H–‘.r\à%Šn j˜\à˜S²\Ø\Ş\Ç\éc!¢U¤jOfÄ’£\í>Z.¸B\r\ÏXSU\Úa\î‘\ÄLpI\å\ì\Í !À\×Ñ‚\Ñ82‚T\Ï\Öøú\æ½B„…\ß>I˜—L\ë»ú6,\Ş*d\0Jòõ-ò¤”fô“\ã\rh‰c:v\"ƒş‹Mğ\İB\Ò\ì{-8\ä4\ËXD+Š•°*û\Åşù\ât\Ê\Íò*_\Ù\Ä\å[k\èA«t£²\ÅU\Ç\â\ÓÓ½Vˆ†\ÈOõ\ì\ïÁO¥@>ªx\ß‡Å›Ï¢¡wK\ãZO|\ã\0?7\Äk¶&FUß†\Å[•\ì%\Ññk\ìô™†¹\Üo;ıg\Î`eS\ã¨V\Øê ¨«&\Õ1N{\ëtº\ëØ­\î’Ï˜B3|ô“†ThF¸@„ŒZx\"D8®¤“¹*ò›EñF\Ä\Ó\Ë…‘U…\Î^\Â},‹4f˜\İF)¦1	\ÕJ\Ï;nš1±	‰Cÿ¸%\Üg XIX\Ç\0£Xj\î{\Z\àu\ÔD>’¸:\ÔÀ‚|£¬ˆXU\Ô\Ñ\Óí¾¸qX—V\Ç\èˆ\×t \Ğ\Î!–ªe¥WPô9…¥&\Æ ¿ Jø\ÜD\Ñ\ã£.lrª\ÆÇ‘š©ä’•\ÕP\Ñ`‰U\"µ¾\äÀE\ÑC»|·Œ\Ê&¿;)i€ÿ\î1lo5¬tw\0>§…ª *º®j÷\Ús;=ı\è\Óù|#©ğ\ê\\A¼\Î\çNÙ¡=\â¤AQˆ×¢ø\Äf<E·´LÂ«\é\ÙBöè•¥ ÷˜Q\Ó{Eb†p{ú\Ñ\ïû\ä\éSŸ&!<’G\r»Ş’w)\r¡˜\àªÁ\ÓÍ ŠU\é\n Tö‘<½\Îø;‰sg\í\Ş~lo%ñ|\Ó÷Ô›•8‚p\àU\Ö`hO\Ì\í`³\×Ğ¼£ô\rÀ«˜I\ÅK<vvô@7°À‰<²•@Ÿ)±$¡™\Í\ã \á\'óˆvTÀ¼Á¬€¶wI[.pOÆ “}Å¬)K\'{\nZ\æB\î§oo!ø&œ¾‹\ÙÒ–B\Ä>#o\ĞG‰»1óh\ÎüÇ~ô\Ê \áS¨À|¢o¹@Ÿı<y¤\Ş7\Í>\ëÀÅ‹S«¹¯£ò\ÕWò\"RZ$\Â\í%‡ùR4IıT\Ú7«Vª‰\ãb™Fwû\Ê\ÒVoÇ§R\Õ\å>(`{<\0J)yR.w\Òy	÷º4\Z\é·_8\ï<‘{Q;J%ö<\á\ëµwY\Ü\İÁğ²¥1ÁE\Ûo{\"¾‹\áŒ\ÚQ¸“P\Í™\Ú-…Aç­%¿ºÀBˆ\Îóe•é¾øÔ¯\0V\Õ\\Z€÷\Ò\î\Ñ\Ó\ï\Ğ~q¶\Z\Èx v\É@0¹>\ê\ZMeü\é„\n•µ`\ê\Øti\ÒJZ#ÁÜ¤dbC«\ß4»\Ãa»¯!a¦‹FbÎ\"\ZC•¢zij\Ü‹\"š\ØUeL\ê\ÚO·\r0\rEnD-¡$N\Ñy&•\Õ1\È\Ä}I#&c>Xb¬\r\ÄF\Ìp/&\Ç\Ã1#€¦qŸ¸5LfPO)õº\Í\Íd¦¢Š\æ¦m–jºW\ÆsT[,,:¯\í¿\×&j[\Øı\ßZ\È\ã.ô3n\î\ã¾\\ù<\Ó{ğ[M\àL\éD5*	oQ@~\Ğ\r)›-búŒU­np;S»’3uB D\n‹¬\Ù\\­‚«\íıa«™*Ÿ8O\"úlz‡§|\nEFØ•­fR«Yc\ZV¯V¹š=«W\r²º\Ó\"ƒ)/aIG\r+;¦\nm_l¾\ì<\×\ÜQl\Ó6>‰mu\ëV£AOó²h\rN\ì¶4n\ïT\ÏOŒ\Óu––‰F±«\Ä:D6R\íú]™p8\Ïcğ1“j@\Ã\Ì,OcN\"1‹\\5\àv	v\É01\n9akgb*©`\Ã‹p\Ñ_JAµ¢\ÄK_™V°_\Õa\ÛEs½‘\\Œ³\r‡c‰\Î®=\Ú¡ªL·\ã4\Ô=\æ\êz0ö\Ø\íVˆÈ€sU±^iñ|Ü¼õ\Ç\Ö+h”Ï«\êl·œÎXI\Î~\ã|]°\İ\ï¸u\Ù?n¡m•½\à‚\×u3¤\İúš\Í,Qp0®Œu4IfBe\Õm\r°³½\íC4\Ët\ç\"¦\0’-©tÚŠı‚b‚@—g‚=ÒŠ]­(—»\Ín\àB\ítAG¿<¯\ã\0œ\Ï_k­\Ãf-P+,†\×ô9P\0~šD$\æ	=®m@Á/o¦3\è÷E„¹»€¹¯<\Ó<+JeÀP\Ä\Ç5qrz¶s\àydÃ˜Å‰«8\nO\í\ËQ‰\"‡)ò, \Â\é9\Ä>\É\0-ó«.q…h»xT\ã´\Æ\rbÀ\Ôõ\Ğlc\rÁÒ˜B·)Ÿ˜\\‰|½&\Ù\æ\ß7d5ToFŠ\Ó\ÏÀn‚ŸÁø ,XC¿œû\æ÷qqÔ°\Âv\ÔP\Z2\Êkh\í5\\½\ÖLX$aH…`s3¹™I\È\Z®C\áI\Ñ6\Æ|“ªÈ mW\í>øLš“\ë˜jCG%¡Í¬8‚q¢‚$ó\Ø•:„˜ˆmK\İU[3©#g«\İ\İ‚ı\Ä\\\äY\á@\íb JNqò—BÎ¥\æ\ê$A1t\Ğhæ‚¯°`„€û§¿şIufã›”3÷\Ñ\Î\æIÿşE\ÏÙœ)ı\Ä£Z\ÊÆœ\ÎXô9£\èAğ\Ï\Åj\Â`Üª@m\ãa9\ê¸k•¾…x¥vA\İL¡k8/´½\rE¶\Û\æğ÷µ>~­_\ë\ã\×úøµ>~­_\ë\ã\×úøµ>~­÷\×\Ç/¬W³˜+\Z>Ü°h6\'\Ñ	À°¦O\å¯LğÁ\à\ÍG~±\å–\n\å†‡\Ç4“S\Ûò\çv\ãºöf®¨ZojÀ\Ôä¸–‰i\0’§ú\Z Ši¶X\Ç\îTm{\ß\êˆÄ“úHc+‡N[\á˜\äc÷\Ğ\Ë#\Î3¦MªR<ıÿ\éxa0\Z0U\æ‰\ÆM>Y\Ø(i\Z¦·™E>ü‚ıb¥úx\Ùò\Ó\Õ\0_ôD\Üû3e2\Õ\ïzÃ=š\Å2ü­»¨…ñG‘²P&sbF<[g`2»-ó¡…½by\'ÍµƒN·‰\×\Æ}\ã\Şù:\ÍÀ“P\n\Â\\Yfi¡tya\Î`Jhz	üó\Ğu·\\R€¬!H} ¯µÚ”\ë	X,:xHPy\×À®{P¢®£^ ı¦¾X\Ğ/P‰p6#e–XG\ÓÄ–s1kb\ÎğKø`n/\î^™¹\0(\äy\"³¦¼2¾©\Ú#zG‡Á6}%ø2J E\ìPÖŠ§~!”\Çjm}Qe\Îg+Š\ë\Âx©V™-f”0+Œ^_µ]°“\ìN!*»\ÅÛ³f¹°\Îğ\Ç{\İrg%g\Ë\r]a:†…Šm‘Á¸!½NT=4·‹E\Çö\Ü\Ñ\Æ¼\ãğ\Æ9¤20”IaLj„yQ\ë\áU­‰¹73û—=_<\Ç*ğ\Ô}ªŒ\éŠfuJ¶(\ÍN{\ÆPl\Év\Êı„¯y”£\çE+wR*\ã\èÒ„`Ğ¦2\êB§\Ú-û¹`sw_¢]boCP„B\ìô n\Î\ít™\Ç&\ĞL\ã\Ò\Ôª:À²#0u‡QØ‚<‡[õ!f¨\İn2ó\å»2BX,Ÿz•¯²l~e	Ôœ¤Zû5!ºÜ¼~‚õøKept¨\ÕVz($¯\nñŸ\êõ\'³o¥œzım\Ñ\Ûb+•Tz;{yoCc“\æ‚f\É#\Õğö_G\rı`\ì\É\Å\Úù\Ö\ÏbÁ<\Ë\ËBúû?[\Ú0\Ø%[\Ó\éÎªo¿¯`=\æÒvĞŒqzˆa-Xetq\\ûK\ëÏ¢ö—öŸE\Ğxk¼ş³8W¶\í8k·t\Ö]\ØHyf…¢¥7&\åew\0¨¯_NUQ\Õ\äÿ‹¿œ:(	Šª›®\Ób-Fñ#™}\Åh\Æ³15$¢qIX‚\ß®\Ì\ÇvÓ†\ÛSª\\9\Åv\á\ìÁ\ØI\"eØ¾3+\ÇmƒÆ ñ.6w…­?¡K…AññPª*CE#_1\Í>eL¹x›Z\r±ø\Í,H\èW«\rì¿®«\É:¤‹u\İô•\Ç/­\ßfw\Ô\î›ü¢\Ø*\Ç\"nó9‰\ßÁ²p™\é\ÈHf‹ûK•\Î\Ï!³\Ü\îÁÕ˜\Ú1K!p\\bQb\ê1ŒM\ÅgWb\Ê/8‰\Z,\î¿\ÒıY¬¾ñÁpª“xds\ë\é¸Ó©Ô¸º7\éwŒ\Ú\ï\ÙlK\Ò4\Ş\\A=D?°¤¬¸\ÕÎ$\æn\éVp˜\å\r\ãªşÁı–P›€ş¨¬UóR\ÓßŸFKjuZ\ÍJ¨+‹€3¹]¿b‚\Ø\ÓŞ¿í½¸?\Ëñ’Bn$’gN2z\Şş`|d``»tùü¦Ê¥ªÍº\Õõ„eôW’…\ß7uø;\ZB}û¥6õx¹\àjup;W/Ñ·J#qn`ò£Œ™Lnbz‡\Û+^º;¸\Ü\Ï5\ì\êD\ß\Õk\Ã)faõmYù\â°\"‹y¯÷Šwñ#3û¬/ª:µ\á\Óg¨ôônFk\Ğnõ»\Ã~køf÷|\n ½~»­ ö\Ó<ı™œS–õ<Î£Y\×\âÿ²“×ƒ'),(21,'6_c26259705a63f18b',1721648618,_binary 'xœ\İX\ésÛ¶ÿ\\ı;Í‡7ex\è>;©+nŸ$²9\Éh@”`S‚¶\äŒÿ÷·\0uW²]3ó¦\ÔEb,ö·Xb×ªµ\ïI­\\3b<¢C\æuV+\Õõá‘¤‘4à­˜Ï»5£ñ\æ°w\Ğœ|@c9	[¹†úC!FMƒF†\Z \Øo\å\\	•‘1	•M#•Y\\\ãi¢\ÜOı1K\Ğõ&)‚Ç˜\ßQA}\ä\ÍL\Ğ\Ë#±(‰™`\ÑÅ”\Ç!E’£ô\Ñ7 ®y@£@PŠxL#”ğTŠ2³QG°¤‰z<xBï¸¸¥L2†3D\Å2›ñOœ\ÄT óŒÅ˜_#ù(d„F	\Ğ\Ó\ÈZ»{aµOşûnmj\Â\ã™`£±DNµZ1]\Û- l+{‡>LÁœ„ñ¬tM˜\å˜2\"\Ù-,\ä.¢\"i£€‹	– §\íQ`\æ¥Ù€dœ\Ô,K\Îb\Ç\Å\ÈÊ™&ø7×L†´uNÅ­2ƒù]\âùZU\ÃÊ¨¹\Ü\Ò4F\æÄ’\Í!o\Z\Ù*:\ç\n³\åÕ°2€÷g@P@g÷\Å\Õğ\Ù-b~\Ó %\Ğ\â$i\Zò>\ÒwÓ§NC9ã©©\Ö9T·`‰RF\rñŒ§Ò´\Ö\Æz\Ò\'2\Ór/–|¾|n9¼í†Z¢Q\ël\ZX8‹±–\Z7l Àa\ÌÁ_1O¤¡=—h\äp+\ÜLğ&&\ê©iXƒ™\0‡y»dùMN‡w\å/\Å\ß3¹_Š‡MˆKE|‹\'q}·3†T(‰# 	¾#q2nVKE? e\Û\rœŠ”\n\år\à\ÒÀ¶\íJ±€½Šûó5@\ä@|´\Z,ŠS‰2¯Œ™\ïCò˜\Ç\âN³¾\ìV÷\í\Ëp˜H\Ø\Ä\ß~HA¼\Ï\ï{}\Î.\Â\Óş}—œ\ÚNÿó‡«[2q\ÈY»*Ÿ\Âôó\Ñ\ÅŞ§Kr6©Î¼Ë®=ø|_óY/’÷½\ëc§Ç\ßÿ9ú=|\î\Úg\íğ´§cú\éò\æ¢}]]„\éUû²p|-\ã\Şõû2¹\ç\Ó\Î=g\ïøû+­\ïj\ì}¼\É\ì¸<\èó;\ĞY\rN›MJ]\'(Wi\Å\Ïƒ­\íj±Zñx/W\\uón—i\Ş@\Ö?÷\Ğp(Eš@>;…d4Yy\åûÛ¿R.ë»½˜\Ñjs£dLÉÇ§¦3\'~q~Õ¿o¿f7\çn\è¥s¢3$\Â\rı­\áá¤B@R9l¼ =<”ó¥‚CˆWu\ì’[®\â‚N(V<L|R°ıj9°ıÀ.””7 ï¨°\ÙÜŒkûNïµ±\Û:—4†\å¶Ö¶\äöÖ¼*I-’“ÚŠ#Á\Óx-\Íl¦´{4\Ü\à\×#‚\ç}\Û\Õ\Ür¤\Ñ\ê¨´\É5’G¥‚ş•2øü­ÿ4,EPJKÏ²Ã¨uó³8Yh\İÊ”û“\×2M?\Óú\é3d¬˜\ëoN\Ö\êv\äò=>\Ö\ì/ğô\Î\ï\År\×\Ê<[“®ö\Ú\Ú\î}¾Á\æ¹MK$_Åª/+»½‘öúE³¾,\Ûñ¸\"\è\Íùÿ\Î\ÓÁğ`r~8L\î3`rÿ}0¹¯\n“û\Ãa\Ê?¦ü¿¦ü«Â”ÿ\á0S\á\ÕaZ£=^><)¾8÷\ä•\È\Öqf\Í\ï8•œğ	\Ô\ÉĞ f›\Ùw\Ü*RúX‰a.¤9©.I˜¢Ô°—ğ0•´&XŒXT³‘ú™\Õj•N\ê€\"öT\ÉÓ¦±Ê’N\å\ËğÌ¬ø¶„n÷\Òw.›Á£\\QW8,t­¢­\Ó\'³N`÷\Ó\Ş\Ç\é¤\Û>½»jŸ®&\Ón¿\ãô\Ú\Ünû\êf\Ğï²®;p÷g¬s\Ø)vÇ“Î§‹|÷ú¢všz\å¹\İ%\èú\Ö\Ï\n»dWyÜˆğf†€w6Ò¶\Ï\Ù\×y22%ç¡‡… øS¾˜¿®todg\æ9ûöúñP_ª\\?/u¢B%©7aÛ‡\Ì\ra/•’¯‹#¥\"‚t¶@x®\æ…\Õ\åZ\å²~’\Úo”º\Îõ”û\í¶2\Ã÷%œ\İ\É\è‘\ìĞ°\0\Ü\Övœlæ§†n9lD\Õ3Z\Ö\'_&¹\Èn„\ä‚4¬¡ExX\Ú\ì!\ÉXm5\ëŒf=¾\Ä:I½\ë|‹Ïµ´¥Z\â\\3¾»N~s\Êv±\\Î»v\ÅhW5“\îYYó\n\nE\Õ\ÄT\İM\ÇY6;û5j\È-\Ôt\n\ÓLõe3kc*·fwû,\"\ÙôF\×\ì\Ú÷ ”6)C•W\ÔB\Öi\í«6\Ü†Ï–¢9ª[¨Ô²¶\Û×ƒ\Îù\×.\è×“\ç\×3J¸ğ—\ïP\å\ßB¼\nm*˜²»\Ûg\Ôt#—Nc¨.\Õ\ÚuÊ®S*TJN$ÁR™H<‰”b\Éu5¥\nQ\Æõñ(™\Èj6*™ù\Çş°\Úş\n\ÍnI'),(22,'6_fe60276bbd382bfb',1721648623,_binary 'xœ\í;ks\Û8’ûõü+8š\İ/[kK¢ŞŠ©D¶\'\ÎúU–2wW\å*DBbŠ\àm\Ílşûu\ãAB\"”8™Úª»*»›Dw~\ãA2ÿ\ÃŞ°–‘²¸ö†\r»oTK\ÄSISYƒ·f·;Ö:½Mşûö,X\ÊUòö\àÿ	I\'5šÖ°’ø\íA\0?\Ç+*I-I.¨<©­\åü°\Ç?ÿ1Y2<Ñ™`’ğ˜ñ\'š\Ó8˜m\à¦,\ËYº2Ê³„’ú£?¹\Â:\ÌsJ\Ñ4|G4i¶ƒ+’Â”Vøx“}\âùt\Ê$#I²	¢œ©Gü\'Íƒñ!ù’H\Z	‹h*\0¾Nc€ızı©ş\ë\í\å‘3tÄ³M\ÎK4ƒşa\Ø\ÛŸ\ïvvœ=;‚ñ¸Í©C\ÈrIY\äH\"\Éa\"O)\Ís‘\Îy¾\"\è?¨Œœ\ÍÖºA‚d&†õº\Üd¼u\ÄóEı\àğ\ä«üó\Ï?O.&—gQ§ßŠ	\íwgq¯\ÓDı&	#\Zöb:\íYğ$³DWg“w/¥)ˆF\ãñôò\âıø{Cº‹\ë\Ñ\å§\Ó\ï\æS“^^\\¿˜² ıøc\Ì~üa^?ş0«\ÎŞİ¾{¹N\ë\Úg<\Ş@O\è‰ú·ı9\ÙcÀ\â“ZÔ­QB„8©\Í\Ñ=õû0¦s²N¤yë¢‡hˆSü5/\ÜHC²\ákyØ¨½\İ\ZB\rú\Í\Í\ÚÁS¾œş hFÁ^\\O¦\ã\Ñ\İ\Å\í\äh\Ö	ûsÿ\é\Òv“ôC\Ú\ë·\ç­F/$´=\ïi‡ú·\Ï\ä”\ÇuP\Ù\Û]û\ß\ÜL\Î\î~ÜŒÿLh\Í?H¯©¾Ï¦µ1ƒmc\ÖQ\é¨Yd§	X(6…\íaM\Òg©\Ş‰G\ç$	‡5P=K£q”³²\Z61õµ[\nğR›@º–¢S,Ì‹÷&ôCm¨¿÷ÀQ\éG1Ğ€›¬¬\0\"Å¹\ëV\Ø\Ø\ÖÖ‚\æ\ç\ë4\Â\×\äa•q\îGW\ã{H%3\"\èıˆ\çôş=\çRÈœd‡oóuZ{óEót3û¬‡²o†¶\Û\Ãy®\Äß›,	Øy¶\ß\î(¦<š\× í«™è„Œÿ†º\É¢D\×V ^\ïŸ=\Âóı{\n!„u?8=\Ìd\âB\çcö;\Z²\ŞA\Úg˜BD¢%½ƒ°fº\ä\\Iª	0P±k\ÂG\ë<7TÀÕŒó„’T™FÃ‹xd\Æ\"yN6ºÈ—8¾…ªa„cN\ÈB`{§…ˆB\êU‘ª=™K¶ûhº\à\n5<cMUi‡¹\ÇD3Á•°7ƒ„\0_GsF“\ØR=[\ã\ëš÷\n~û$\Ù/`^2­\ï\ê[¿x«(]¯\îø“Gˆ ¥,§Ÿo@KœÓ±\éu_l‚\ï\æ’\æ\ßkÀ!¤y\ÎbZQä „U\Ù\ï)ö/\æg«Ln.™\×ë•‘MR¾5û´Jg0*›_¯“¤\ÂB\ÏB|\Zaº\×\nQ¿\0ù©Şƒı=ø©\ÈG•\ì›a¿xóY4ôniC\ëh€o\à\ç–x\Í\ÖÄ¨\ê[¿x«’½$:~-€=\Óh-÷\ÛNNÿg\Í`eS\ã V\Øj¡¨«&\Õ2N{\çtº\ë\Ø\Íö’Ï˜\"3|ô“†Th¸@„ŒZx\"D8®¤“¹,ò›EñF\Ä“«K…‘W…\Î^\Â},‹,a˜¢³„Dj¥\ç7\Ë\ÏÙˆ$‘\Ü\î3P¬$¬c€Q,4÷\rğ:j*IRªgA¾Q–D,+\ê\è\èv_\\\Ï9¬K«ct\r\Äk:hgKÕ²\Ò+(úœÁRc_P%|On¢\Æ\èñQG69U\ã\ã@\ÍTr\É\Êj¨h°\Ä*‘\ÚF_ò\0\à¼\è!,\ßmƒ²\É\ïNJ\Zà¿§†{\Û[+\í€\Ïi¡*¨Š®­Ú½¶\Å\Ü\ÎcG?út>\ÛH*¼:W¯„\×3§\ì\Ğ\nqÒ (\ÄkQ|\âr¡[Z&\á\Õôl!{ôÊ²P‡{Ì¨á€½\"1C8ı\è÷}òô)O\ÎÒˆ\ÇÉ£†]oÉ‡†qF#(F¸jğtÓ«bUº\ÂU£€‡}$D¯3~#\É\Ú\ÃY\ØÙí­„b¾%ô}õf%N  x•5\Ús[\Ø\ì54\ï(]ğ\ê\æB2q\ÉR‚=\Ğ\r,pbl%\ĞgJ,Minó8Hø\É<¢0o0+ \á.i\Ó\î\Ét´¯˜5e\éhOA«À\\\Èıô\á‚o\Ò\Èé»„-l)D\ì3òV\0}”¸˜0O\æ\Ì\ßy\ì\èG¯R>\n\Ì\'ú¦ô\ÙÏ“G\ê]\Ó\ì³\\¼8µšû:(_}%(\"£E\"\Ü^r˜/E“\ÌOÕ³ }³jùgÕªJ8.–i<\ŞW–6;»8>•r¨.÷y@\Û\ãPJ\É\ÓrÉ¸“\ÎK¸×¥\ÑH¿µø\Â)¸x©Ü‹\ÚR*™³\ç_­¼\Ë\âö†—-ˆ	.\Ú~\ßñ]¯`Ô\ÂXB5odj·z­?·–ü\êb\0!:[/ªLw\rÄ§~°*¨\æ\Ò¼—vşx‡ö‹³\Õ@†=µK‚Y—‡C¨©œ?R¡²L{€.MZ\ÉJT˜›’¬2lhö\Zf«\Ó\êô4$\Êu\Ñ\è@\Ì\ÙSL¨RT/\r»dqLSÛ ª’K]û\é¶¦¡\Øm(0§\Ó”Ä™\Ã z!Ï¥²:™¸«1i\ÌdÂ£KŒµØˆ)\îÅ¬ñp\Ì a\Ü\'iö\Ó)\ÔSJ½ns#ê£¨¢¹a›¥š\îµñ\ÕC\Ì\æs‹û}€ûGm¤¶5\İ\Ô\"\Ür¡Ÿqs÷\å\Ê\ç©Şƒ\ßj‡dJ\'ªQIx‹òƒn€\Ò\Ï\í1c\ÓyBŸ±\È\Õ\rn\ßj“rªqk®\éL-Š«\í\İc«™*¹Hcúlz>&|5F\Øµ\æYk]c\nW¯V×š=«f\r²ª\Ô	,`…G\r+;–m_lúl=\×\Ü\Ñs\Ã6>‰m\í\ëV£POó¢hE\ì.5\îöTSL0º(\rmdW§%´o¤\Ú¼6\Ñq¶NÀq\ÄTª\r_0³u–p‹iìº¬‡%\Ø%\Ã<)t\æL„­œ‰©ƒ\rO,\Æ=€R\nª%^º\ÆÀ´‚9«Cu\Æõ¾r1\Î\n4HFŒ%:C¸öhC†:¹2!İ\Ó0R÷˜«#\è\Ş\Ğc·[#\ÎU{­9\Ä\ãró\ÖZ\'u‚S\áZ\Î(\Í\á–:+\É\éïœ¯\n¶[\Ã//û\Ç5£­²\\ÿºn†qÕ¢[_s‚Ûœ% \n£³—±¢–† \ÉT¨$»M¢6€£‡0·\\w\î bF ù‚J§­\Ø>(&t\ë\\°GZ±«%\Å\Ós·\Ù\r\\\ØYÚy^%8#ÇœÔšGZ \\o+\èc¡\0ü4I\ÂSzRÛ€:ƒ_\ŞOZ\ç\Ğn“s•Say\Äy,–”Ê€¡ˆOj\âô\ì|\çüóØ†1‹“TqÚ¦+:¢E&2\äY@Á\Ñˆ}’Z\î!W]<\â‚\Ñvñ¨\Æi\ë*Ä€?¨\Û \Ù:”gJ1«kGˆu´!«ä¸®ºñpXW,\îL¯n\ç\çÈ¤®„b\äU\×;®»¢¬™HD¢ˆ\nÁf,ar3•¨]Æ³šmŒ\Ù&SÎ¨Õ\ëf|*\ÍYˆõµ¥¢\âşfZ‚8(\É,ñ‚V!&H\Úd­›¡.a+&u°j†\í- ¨,\áb6UÂ¸“2‚œs.\İ\È\êd-\'Š\ŞJ\ã©¾Æ’\rb\Ü_şşÕ™\r)RN\İ;<;\Û?&ı\Ç=gsªóIşI7Ö›\Ë\Æ5>°øs\"ñƒ\àŸ‹z\Ş`Ü©\ØhCP9\ê°k•¾…x­ö!\İà¬«(/4Ü†\"Û¡9~}­P_+\Ô\×\nõµB}­P_+\Ô\×\nõµB}­PÿoW¨/¬3D\Ì%nY<‘ø”?`$\Ñ\'\Ó\×&^‚`ğö¿w¾£BV„\áA\\\Ìñ\Í\å„\ã\Öô…İ¼­½™iF{ªZÆ›v\Z01i¥i\Â\0…ä™¾\n§Âˆ-—±{U[¿w:ğô’>\Ò\ÄÊ¡*\ï\í>ry\ÌwÎ´IuAŠgÿ5\Î\rF\æ¡\n-Q¿]\Ï\ÕKšº\émj‘>ƒ`¿˜\Ød-^8üt=À=÷\Î\ãTY \äğ‡\Ştf¦\ÜG†¿u³0ş8VB’\ÊdNMnÄ³…q&³‹\Ñ4\Øk†ci\Ş[­úÎ°¥o\âñ3_e9xJA˜k›³\Â,-t„2+\ÌL	M/…ÿºö‚K\n¤\èk¥§6\ázó<*\ïf\ØÚº:¤®d^\"ı®‚—~â¯‡³(ƒ°\Ä\êH–¦¶‚Bˆ	X#s]\Â{[p{yõ\Ú\Ì@_§2\ßh\Êkã›ª=¦c\ê8¶\ék±WdT\Ì.b‡²V<ù‚¡<Vkë‹ª,>4XQ\\™\í6\Ùbr±\Ä\èõU\Û\Å\0;\Ê\Ç\nQ\Ù-\Ş 5Ë¸¹u†?\ß\ë–+8k)›\áuQ\ç*¶iD\ãFô&U%\È\Ì.\×H’Ø³7ÿñœÿ9J\Ö1ECÆ¤F˜\å^W\Z™»C0³\Ù3±Á³œO\İ)Ê™¾¤g†P\'Eó\Òì”±\ç\\@\Í\Âl§\ÂNùŠ\Çká¬¨É ¸\'õ\ç\".Mm*£.tªİ²‹K6sw\Â{‚\"b§u{l§\Ì<6†\Ğ\İX¥ù`y>ø­HôFOsòxmUb˜P Jº\Íy\Â\ïRHQ±P\éT>H²i•¥P\âQsˆh\Í\ÖD\æ6\Èòõ\ë£\Ã\×G*q£-·²B!ùvˆú:<üp:ıV¦9<|[ô6\ß\Ê •\Ş\Î_\Ş[ß˜¢¹Û‚\ÉñX5¼ı\×q]?;Dcr±v>s³X0\ÏòŒşô\ÍV4vKÿ\É\Îú/~/a\å­¥!m¡\ãŠôœ(\ÂZ°\Ì\éü¤ö·\æ_E\ío\á_EPkœı³¸P¶\íøh»ô\Ñ]\Ø@9d…¢©—\å£rk°\İ\Ô×†ª¨jòÿ?\Z:(	Šb›®²b­Añû}5h\Î³>1$¢~EXŠŸ>-\Íí¾°a\Ãí¥©P.ÉŒ&b»^ö`\ì\ä2l\Í*s\Û`1h\'æš¬õ\'t‰¢(¾[JU\\¨h\á+¡ù§œ)o\ÓA«.6?‚uıj‘ı\ê\"ò\Ò\Å\ê\Ğô\Ç/\Í\ßF{vM\ÚFQ\ìQc\í¶HøŒ$\ï`5¸H‹td$³\Åı•\Ê\â©ù\Ú\îvE˜Ú›\Ê p\\a-b\Ê0ŒM\ÅGb\Â/9‰\Z¬\é¿\Òıy¢>oÁpªswls\ëT\â•\ÒA÷&ıQû›mI–%›k(ƒ\è––…¶\Ú#“\Â\Ü]À\Â-\ßŒ«²w6\"mú{ªfe\Ì+M/¨y\Öi5/e n\ëA\Î\åvÙŠ	bOwxõ´ó\âş,\Ç\n¹‘H;y\È\èyû[\é8€\íŠ]¬g·U.UIÖ®.#,£¿\â,ú¾©\ÃO±‘!\ÔgOjûŒ—\ë¬f7Nõ*}«4\×\éz\Ö!?zÁ˜\É\ä&¡c\ÜUñÒ}\àr\çÔ°«}[/	\'˜…\ÕgU\å\çyıŠxn-\æ½\ŞF(\ŞAÄ\Ì\ìh~­\Ø\ÔöNŸ¡À\Ó{\Í^\Ø\ì¶ûİ°õ¦r6;\İ0Tû1šş0Ì©Fúšı‹xŠû_şøz“');
/*!40000 ALTER TABLE `cache_pages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `cache_pages_tags`
--

LOCK TABLES `cache_pages_tags` WRITE;
/*!40000 ALTER TABLE `cache_pages_tags` DISABLE KEYS */;
INSERT INTO `cache_pages_tags` VALUES (1,'1_1af8c169161e4bb0d3230b94baa6317b3318b6f3','pageId_1'),(2,'2_68cd619a38fae14ac3e3d5fa6ce4e15a7dd1a42e','pageId_2'),(3,'2_5ef6365230763499c653425c0c83e707bc25fb6a','pageId_2'),(4,'3_358013bd2180e794e2980752e0ece3d758da253a','pageId_3'),(5,'6_69399195db903f2a0b302d475b28b3717198b4b8','pageId_6'),(6,'6_870cfb5400ccd0b9c34b519340730e81400a1e01','pageId_6'),(7,'3_658fb09c5e00040d00ca934d7afc1558ab619507','pageId_3'),(8,'4_1e6d72b315f14dbd080e4e3f214f6d10ffd46adb','pageId_4'),(9,'4_8285e8dcaf554d1329a6d3524c73610c2ea2b78d','pageId_4'),(10,'5_8a0dd8e8763b3863fad477ef5a6ba2b643ab9831','pageId_5'),(11,'5_c20f3afa6b3c8a08486a619356bcca8e5f2d14b9','pageId_5'),(12,'1_868a5659e30a57cb','pageId_1'),(13,'2_b483c1c60649b2af','pageId_2'),(14,'2_8a67418632745451','pageId_2'),(15,'3_291bce1e98df7dd4','pageId_3'),(16,'3_dd7a6fe31259c838','pageId_3'),(17,'4_327c2af004b59b7f','pageId_4'),(18,'4_a0675acbbc656b28','pageId_4'),(19,'5_d97b739857fac45a','pageId_5'),(20,'5_7d594376c50f9749','pageId_5'),(21,'6_c26259705a63f18b','pageId_6'),(22,'6_fe60276bbd382bfb','pageId_6');
/*!40000 ALTER TABLE `cache_pages_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `cache_rootline`
--

LOCK TABLES `cache_rootline` WRITE;
/*!40000 ALTER TABLE `cache_rootline` DISABLE KEYS */;
INSERT INTO `cache_rootline` VALUES (1,'1__0_0_0',1707728101,_binary 'xœMMr\Ã …\ï\Â	‚\Ó_ùY4\Ù3\Ä(.Œ<F¸\Ítr÷\Êqq\Ùñ>¤\'\éY\Ğğ\ãa\×Zh\ä•`jôNµ{¨¼*-\ê\ïgœıW\è]_©¢º\ĞÄ–±\àg¡ƒ\èO >ˆX­¾\Ñ\ÎfûKµVè¼­\Ğ¨`o”¹8\nøô\Îa,@¼d\ä\Ä\ì‡m\ì+(Œ®&o .hú‰òX¹kq\Ão–\Úóy´=¦\Ê\ÃÑ•o#–4\Ä\ãt\ì(^|¯\Ú\Ã\Ò.5œVb|\ìBvKÿ\á/ŸLòŒ\Ó\ã\è-ĞrdSE®›\n\Z\n…7\Ç\ÙvW\ÙÎ¬˜(Ëš€3†\íˆûıV¢’ù'),(2,'6__0_0_0',1707728101,_binary 'xœÍ‘\Ñn\Â0E\åÚ²±\Íü\í5\na!©\Z—\r!ş}nKP¦½nÓ\"9\×ö½*¸”KU	—sP-Yµ\ØXõSµ\ê\ÏO\Ø\é0±BXY$ø3Z&\Z\Ù0&ü(”\ØI¡ª@\Õ\ØIÏ¬&‹³W\ã\È\Z¦\à\Õ4Ê›“¾w\Ë5	Ñ’\É\Ğ”3\ç\Ğs\Z\"\à¬EŸ€h\É3\ï›<Bosòj‡zß…¾d\å€b|E?Xš7¡î·­\Ùc\ÌDl8ğ¹\Åä—ˆl\ê&ø\í\Õr5|—\Ñ\ä\×\Û\áÿ\ê\æE‰±³m¡÷¬\Û\Ì\Î*ƒ:¸\Ä+ñckšƒl§\'´—eµ\Ãº»G×¡ù{¾Å—|ËŸ\Î÷\Ôz<\ë„ySÿ\Ó,\Ë\ß\Éòú	Œü+\r'),(3,'2__0_0_0',1707728204,_binary 'xœÍ‘\İnƒ0…_e\Ê\0İ¯y‡^Œ\ŞGiã²¨!AÄ°UU\ß}†4(\Ón·iW‘?Ÿ\Ø>\n*¸(kU	—\0½Ñ¢\ÙR±ª¸zA›	\é#+˜•E‚\ï!£e¢a\ÂL\rY®£¤1]oñ\î\è‡ND§&¹J\ØZÄ®µQza\ÕÙ”œ¼­\Ñ%À^üõ@dºõû\'\ètNAQ¶ƒûe&\Åò²~‹w¾÷½j1d&ÚŸ\è\Üc:›ìšƒwGÓŠz;·³†B$Ò¸ƒõÜ¿½mm‚†pğ²i;?:’}v\Ã*ƒ\Ò\Û\Ä+¾\Ç^N<ŒG‡•\'´ë®³ø{¨Å—PËŸõ\Ä\ë²\Ö?ó\æş§Y–¿“\åõ—&ş'),(4,'3__0_0_0',1707728204,_binary 'xœÍ‘\İn\Â0…_\å	Ú²_ó\\\0÷QhD\ä§jB¼ûÜ– L»İ¦]Eş\ä\Û\ç(h\àj ^(hj¸F˜ƒ\èŒ‹Ušª9W\ï h~\Â^†‰U\Ì\ê*\Ãs,hi$E˜ñ3SC–\ë\Íˆµq\Å\Ù.ônv6t˜\Å\äœ\ê/b\Z\æ\ÕI>úy˜$j£\nôÂªKH”\Ç08­\ÑgÀZ¼GOd\Üc—W\èuI\Ş@\ìP\îûºA–O¨Æ—\åğƒ¸y\ÖiÛ©=\ÆBD‡#]:Ì±\Èf\İ¿3{±Xß¹‡\âD¤ñ­Mzø¿¼»d¢Œ†°Šm]HdW\ÚP›y\Ã~lU{\ä\í\äd‚ô¼¬´xBûğ\è64O¸ú’pı\Ó	sÀ«ñ¬\æ]ıO³¬\'\Ë\Û\'	À,\r'),(5,'4__0_0_0',1707728204,_binary 'xœÍ‘Mn\Â0…¯‚|‚$Ğ¿\áe\ì-ƒj\á\ØV<¦Eˆ»w’\à\ÈU·mÕ•5Ÿ\æ\çù=\r\\\r\ÔKM\r\×sÁh±\ì\ÙP¥±Zpõ‚\æg\ì¤YÅ¬®2|­3¤3~`j\Èr\Í-\Ï ^“%,\Î\"a˜|×ŠñŒSg9uò1·¨*\Ğ#«.>Q>À\à\Íh.\Ş\Å\n:\"\ÓN*@ \Ó%a)”\ÇÎ§0HQ\r/¯\Ã\â\æ­ß¤]PGŒ\Å\íOt	˜½\â%\Û\ÍŞ»ƒ9Š\åª\çŠ#‘\Æ\ím\Òıü\êî‰2\Z\Â\Î{*Ô¶>9’¡°²) ô6ó†ıØ©ı‰\Õ\É\Ñ\éX¬´xF;ytë›¿g[}É¶ş\él \ÖÃ·şA˜÷\íšeı;Y\Ş>\Ü\Ë)\Å'),(6,'5__0_0_0',1707728205,_binary 'xœ\å‘Mn\Â0…¯ùq(ıq\ÎPÀ\Ş2x\0Ç¶\âq(BÜ½RG®ºmW]Î§™73\ï)Ñˆ›¼U¢\á\â\ÅB°`4kGö¨\ÒT-©zô\ÒO¬&\Æ\ë/± <Óˆ\n!\ã%Qƒ–j’¦–÷d\ÑUD\ÕÁ÷]u1xªb\ê:\Õ_Ù´Ó©A\Îc´MJh£\nô,˜UWŸ0o#p2ZƒË€´\èœ\ÑtóI/‚\Ó%y\ì\0ò\Øû\nuNjğÔ»õ›´\ê±\Ğ\ĞşŒ\×\0\Ù7\Ò\Ønö\ŞÌ‘µ«qœz0ND\Z··Ió«/¯L”\Ñ ô\Şcql\ç“C\n[›Jo3oÈÚŸ\é:9y +-`\ç\'\îcóÏœ\ëo9ó\ß\ÎùI°õ\ã­š%ÿ›,\ïŸ].š'),(7,'1__0_0_1_1',1724153589,_binary 'xœmU\Ën\Û0üT²c\ÙeNAS´‡\"‡:=ôD\Ğ\âZ&,‰qŒ ÿŞ•HŠ”“›v¸\Üwg\ÄiI\ß$-\î9­Vô\Í\Ğ5%N\nr/iy?Yƒ·\n´*J¬±¼¦\ãª\Úw»u±ñ\'µ\ÜBvRV;<\ÙR\" y”“ú|££jke\ÃkĞ‹\ÙQr\Öh\å0½¡%\Äû¥­\ì›\Ñoµ©+\ï(\Ñ\êò¦\Ör°Ra¦\'„´­ª\Ï1h‰Å˜«a-\ï\Ç`.u[–”´eÑ³k\è\í\Ø(§ë¹¼²ˆ°aLXn&\äñ\İ\r\İ\ì0\ë\êl¯l\ä±XWø4­küW\Ï_X~\à™\Å\Æj^[o\ázQZo‰¬u\ï\ì\ìI\éü›A\Çeë‘–ûw\Ç\'\"pU.D\î\áò··\ÑõÀ\ë3†\åKŒõğjY/®Ôª·ø~\ì¨U\Ç\Æmò\rs\İ@Póúlö3@¼	IÃŒ´ •Še)f€\ëú\ä\Í\á40«ğù\Õ\à¡N	«\ÃÁó\Ø`AG\Ù0\Ù×­Ã—òğó\Ş\Ã\á\Ê]\Ï\êc°Âº\Î3A;d\Ş\ÛÉŒ+\ëWl[<«½;¸Z!Ï¼\Ã\ÑjU#{†\Å\ÆkqE\Ã;Xh”–ñú\Í^#öN<…\ìú4S\Ùş¼˜\åV{4,\ê\'p“\à\n\0\è\Î0g@\'](\×ŸšY&MFt]†ğ™ÿ\Ä\Õm`ˆ\Çq_ôõ \Ä5F\Â¿\íø„ş3N\ŞN/Sò5h@\äR(™>\Ï\Ó3}ó\Ê\ÛXlNH>ª n3ÁˆYck—„`0?¿¤T3US\ä| M¦¦\É	›ö«š Io2‚¦$3\ç}‹XÎ’H\ÙH2:-zšÉ­¸\ÕM\\®Ä¶èˆ•\îÿ\í\Ù\ï‡ıó÷_O?<\Î\Ò_­·\Û;©)vH™µ‡\à¦¤\nÂ•ù¯\èRÁ\Ò\ÑXç¬˜\Ë6#i3\Ùÿ K\éo\Ô)‡ùV¯2©6Â¬\ÑôF$S)«\Í\ía®–Y“[ú‰Nù1OÓœE!\Şyÿù\ãpD'),(8,'1__0_0_0_0',1724154199,_binary 'xœmU\Ën\Û0üT²c\ÙeNAS´‡\"‡:=ôD\Ğ\âZ&,‰qŒ ÿŞ•HŠ”“›v¸\Üwg\ÄiI\ß$-\î9­Vô\Í\Ğ5%N\nr/iy?Yƒ·\n´*J¬±¼¦\ãª\Úw»u±ñ\'µ\ÜBvRV;<\ÙR\" y”“ú|££jke\ÃkĞ‹\ÙQr\Öh\å0½¡%\Äû¥­\ì›\Ñoµ©+\ï(\Ñ\êò¦\Ör°Ra¦\'„´­ª\Ï1h‰Å˜«a-\ï\Ç`.u[–”´eÑ³k\è\í\Ø(§ë¹¼²ˆ°aLXn&\äñ\İ\r\İ\ì0\ë\êl¯l\ä±XWø4­küW\Ï_X~\à™\Å\Æj^[o\ázQZo‰¬u\ï\ì\ìI\éü›A\Çeë‘–ûw\Ç\'\"pU.D\î\áò··\ÑõÀ\ë3†\åKŒõğjY/®Ôª·ø~\ì¨U\Ç\Æmò\rs\İ@Póúlö3@¼	IÃŒ´ •Še)f€\ëú\ä\Í\á40«ğù\Õ\à¡N	«\ÃÁó\Ø`AG\Ù0\Ù×­Ã—òğó\Ş\Ã\á\Ê]\Ï\êc°Âº\Î3A;d\Ş\ÛÉŒ+\ëWl[<«½;¸Z!Ï¼\Ã\ÑjU#{†\Å\ÆkqE\Ã;Xh”–ñú\Í^#öN<…\ìú4S\Ùş¼˜\åV{4,\ê\'p“\à\n\0\è\Î0g@\'](\×ŸšY&MFt]†ğ™ÿ\Ä\Õm`ˆ\Çq_ôõ \Ä5F\Â¿\íø„ş3N\ŞN/Sò5h@\äR(™>\Ï\Ó3}ó\Ê\ÛXlNH>ª n3ÁˆYck—„`0?¿¤T3US\ä| M¦¦\É	›ö«š Io2‚¦$3\ç}‹XÎ’H\ÙH2:-zšÉ­¸\ÕM\\®Ä¶èˆ•\îÿ\í\Ù\ï‡ıó÷_O?<\Î\Ò_­·\Û;©)vH™µ‡\à¦¤\nÂ•ù¯\èRÁ\Ò\ÑXç¬˜\Ë6#i3\Ùÿ K\éo\Ô)‡ùV¯2©6Â¬\ÑôF$S)«\Í\ía®–Y“[ú‰Nù1OÓœE!\Şyÿù\ãpD'),(9,'2__0_0_0_0',1724154200,_binary 'xœ\íUMo\Ô0ı+(g›ınzª(‚\êmœ,o2›µ6‰#\Ûé²ªú\ß\í\Ä\Ù-Hˆ\Ş2o\Ï×›gM³\'‘¥\×<[\â—\ÎfYÒ‰\"¹\Ùôš¬\ÖY)Z\Ë,1\Úğº%`¹\\M\æ\ë\Ù|\å<¹*¸‘gU–Pºe\â\Î\îEQ@€«,Á[•1¢†€\áo\Ğ1²Î’°R\É\Ã\ë,Í’I\âj©ŒhJ\Êy±´¾y–(y¼+\Ñ\Z!1Ô»\na*™Â­)f£OšU¼);^óÅ“cT\é¤a-WĞ˜X\ËN\å}~\é$À†ú`¦b·\ÇÆ¶>…&dIòœ¸.˜\Ù#(&£&<\êq^õ¡^€\Ë\âAÕšu\Z\Ô0L›„Ã©§\ã \Ã¥şú\è<u{\åkt8`\ì\ÓV§pz¶\ÛÕŒ¿oD\İVğf\'Um!œ’®º2ñI¾\×\ä~Ü–9ò`N-„”q~÷›\\6;Qúş\â¥B3-()‡	\Ù\Òö-3\n\0›!\Û\à°\äV•½kLÜzôÉ»\Ñ\Ïcµ,b\ên\Û\äo@şTü$‡ÿ\í’pU‚‰a#jd b\×æ¡µkSDAp:JUh_\"¦“ó|\Ì.CÇ\É;x©\Ç55p|hŒ¨bj\çÛ€„k$\ÓÀU¾\ïb¦›oö\åfsÿ\áó\Íİ§·\ÑFÏ¯üøV\Ås\ã.ÂŠ±Oİ¨-v¯\à»Á¾—›n\Û\"!u\Ô!\Şlq|~\Z@5ñŒlü‘7~\í`\Ü\"ˆ—\éQ\r\Û)Y³ˆ\ÕW6\É1Ó§\Èd\r¡J\×\r\ËweÉº\åùba\Ş}*\ÓÅ¹“5X<«p#\âJÒ•PG`&š¼\ê\nc¦i\Z(¥0Ló\ÙF¿”\æt$Íu\Ò<YüDš\Ó\åúJ³¯ö_T\æ\Åzi¥9\èò\ÖK}’\\\Ñ\×ÀH\ç\Â@V¿dõûLV¼†\î°[…\è\Ûo\0!±Dx€\È\ç’kN\Ö=_ÀbV’ûbY\\ÁN¾Ü‰‘ôÄ²cviõªB\æX‰	òr\á¾I]\à‹\İ ¸\×|×€°™d\r\è\ÛA\ÜHzŞ’(\ëŒse\"´\çp°*YŠÆ½\î·@Qß‡~]\É>\ãõò®\ãB¥§wü\ãsş\ëox_\Æ\ëş›\ßğ\ålµš¿¾\á÷\rşò0g'),(10,'3__0_0_0_0',1724154205,_binary 'xœ\íU=o\Û0ı+\æ±\ìXv”©hŠv(:\Ô\ÉĞ‰ ¥³LD’ªkù\ï=I‰²Ó¥h\í¦{w\"\ï\ã\İ#\Ï\çù³\È\Ó;gø¥óEô¢L\îD¾¸#«sVŠV–\'F\Ştd\Ùjv³^d\ŞS¨’ˆ=\ËzVyRB\rè”™‹İ‹²„6\0·y‚§*cD\Ãß -cd\';`•’=^¯ó4Of‰\ÔR\ÑV6p™Î­\ï&O”<Üƒ.”èŒx\Õ\'w”\ÂÔ²x\n§¦˜>jVó¶\êy\ÌO>¼£Ng-ë¸‚ÖœÁZöªòKg6\Ô{aºôX)v»0¶õ94!O’—\ÄuÁ,¾‚b2\Ê`Àƒ\æ\åP\Õ+p5\Âsœ!¨F³^ƒ\Z‡i“p8õtz\éø1!õ\ÇGñŸ¯|¼û¸•\å1œ„ƒí¦š\ç8“hº\Z.vR5aöºo\Z®Ön]÷…\â×šb¯lì•½Šb-§\ä“9vŠÁ\É>l\n\Ù\îD\å;\Ù\nÍ´0 ¤gg‹\Şw\Ì(\0l“\ì‚\Ã\Ò^\Õöp¬>q\'\ê=«\è\'?Œ5²Œ©©û\íPª?™Uó£ÿ·\ë\ÃU&\n\ÂR\ä$ \â\×æ±³UF—<Áñ U©}‰˜NÁ‹=0»&\Ñ=v€\ŞÁ+=­©…\ÃckD“¦<\İ¤b+™®Šıˆ™n¾l\Ø\Ç7›‡·\Ş|zÿ\î>\Úõ,õ)ò­6Š\Æ„cŸúI[\ì\ÆÁ7ƒ\Ûı 7ı¶Cª\ê¨C¼7\Ø\â8~@\rñŒlü+;mü\ÚÁ¸_¯9\Òo5l§d\Ã\"¾\ß\Ú${t\Ä;0@&\ëhuºnY±«†Pd\î–OXóR±T:Y‹Å³\Zw%®$]Yiuf¢-ê¾„0fš¦J*\ã4_\ì\íç¢ND;°\îL´g\Ëˆvš­£hûj§š=_ff/×™\í ;XÈ¥7ú$í¢¯‘‘\Î„¬a=\È\Zö™¬x\r]°[…\è\Ûo\0!±Dx€\È\ç’kN\Ö	=_ÁbV’ûlY\\ÁN¾\\\ÄDzbÈŠÙ±\0»´U!sª\Äy¹p\ß$Œ\î\â³\İ x\Ğ|×€°™d\Ï\ë\å(n$o\É”uÆ©2:p8Xµ¬D\ë\Ş\0÷[ ¨\ïÃ°®dŸğúyñq¡?\Ó\Ó;y\Üñ\Ì\ëŸÃ‡2ş¿\á¿ø\r\Ï«\Õ\Íÿ7üÏ¾\á/\ßI:‘'),(11,'4__0_0_0_0',1724154209,_binary 'xœ\íUKo›@ş+\çD?À!§¨©\ÚC›CzZ­aŒW\í.q­(ÿ½³/X\ìôRµ•ª\æ\Æ|3\Ì{¾¥ù,fyrCó¿d>Ï£•\Ñ\r\Ë7Fê¬” ”æ‘’Š6\Ò4‹«lµ°šB”TA ™g1j²<*¡\ÆKlmw¬,¡õÀu¡W¡kÀcø´eˆ¬òh¤¼\Çğ2Oò(¬¡\äB±¶Ò†\Ë,ÕºE	~¸Y\Ö)\Æ1Ô½u%S5/ö\Şk‚\ÙÈ£$5m«V@\\ñF‡1\ê$nIG´\ê–¼Å_{X™>\è€\É\Òa%\Ûn½9\Â\Ø\Ögß„<Š^\"\Û5AxA\ìÁƒœ\æeQ\ê¸\Z\á\ÎD#I/AŒ\Ã\ÔIX\Üôt\ZtüA£óÄ¹\ì5>\Ë\\Œ}\Üğò\è=¡Fa»m\Í\Øü/}­XWÃ…T\Ğ]l¹h´‡%\ë¾2FØ„w³º\ÒVW\ŞJ\ïß«c¾\0tø°.x»e•\ë6f\È$‘L\à|œ—.t\×%\0°5¼ó\n½\ê¢\ÖÎ±\â\Èz”;\\¦¢Ÿü\ì1\Òğ2\\G\Ùo†òœÜ¦šùø¿>**P¶¥Á=¤dvŠJõ\Ø\é#*ƒ {8¸(¥+\Ó)h±¢O#ˆ£‡\æ´’ÓšZ8<¶Š\Õá¢”§·o9‘@E±1\Óõ·5ù|»~xÿ\éöşã‡»³\ËGÿt#• …²°b\ìS?i‹¾2ø®ğ¢øº\ßt¸2\è\í¶8´Ÿy@CY8#\'}\"§_Yo\n\Â\Ó\ÆõÀ¨ŠloH°\ã\×:\É\á\Ş\Ïğ:B¬ZRl«ÁwvC‹=Dü¼‡Tf\ËS%i±xR\ã}„•$™¦S»À„µEİ—\à\Çl¦© \â‚Á8\Íıœ¨“	Qû­;%\êy¼ü	Q\'\é\êµ«v\ÊÓ³\å¿À\Ó\ËUª‰\Úór\é\Í|\Z\Ö2_\ãFZ…\'#\r\ça¤á¡5¶§|»0HH0\Ëg“ğgn¤“õ|·Ò¨Ï\Ål\é\ËZL¨\'„4\é9$`›\ÖÀ*Fœ2±]\ØoCŒ6ğ\Ùmx\à|\Û\0™F\ZŸ\ÔË‘\ìH†½5¢_Y+œ2“A‡öR\Í+\Ö\Ú7Àş\æW\Ôõa8W#Ÿ\ìõò\Ê\ãA5O\ïôY\ÇWı\×\ßğ¡Œ·7ü7¿\á\é<\Ë\Ş\Şğ¿ü†¿ü\0»\ì6\r'),(12,'5__0_0_0_0',1724154214,_binary 'xœ\íV=o\Û0ı+†\æ±d[v˜)hŠvh3\Ô\éĞ‰ ¥³LX’Škù\ï=’¢D\Ù\éRŠf\Ó=\Şñ¾\ÅHB9‰oIñK‘9‰ZG·œ,o­\Ô8)F)%‘VšU\Òt5[¬W7‰;\Éd\Î4„\'«¬H”C	\Z\ì-3§»\çyµnH„·J­yC3¨óY“h´¢E÷Š\ÌH9=%¤\æuaôÒ…ÑŒ$’\âx*“¼\Ñ\\ §w\ä\\—\";øKcF-Y]´¬\0\Ú\ån\Ïb•ñ¬¦\r“P\ëX‰Vf}xñ\Ì\ÃÚ–Á8Œ—–ó\İÎ«#ŒU}ö5À4^\"W=IEÁÌƒG5Ë¡«W\àb€l!\ÈJ\ÑVzi‚p¸-\é\Ø\é``\Ğy\Ü]\è<Yu9:\Ğ÷i+ò“¿	O4–\Û\æ<Gó¯m©yS\ÂDih&;!«É‘\ëıDµU\Å\äÉ¨a\çT\Ù\Ö¿®:“©1™\Z“©1™&fÀ\ÄAŸ\Zğ©aŸ7™¨w¼\èú€Î¹¢ŠkB4%\Ø7TK\0,šhü\ÙYS†7ª=YÖŒ=F+‘‡sª\ÚmŸxw\ÎY\ÉNb°7»\Äd:PÂ‚U8¡,€\ì´1¥¿7f»òÀ\ÉNG!sÕ¥ˆ\ád,\Û5;ø1\í\ìX¡\Æ9\Õpü^k^†#”Ÿo\rf-¨&³}¯ˆ‘n~lè—»\Í\ã‡\ÏwŸ>\Ş‹¿NRw?\Û*-Y¦\İE˜1Ö©•\Å\ìüÔ¸\êb\Ón\\Tˆµ\ZK\ê\'¤P1ö\È\ÄÉ\èy\á\×\Æmƒp\éq<Ğ«¦;)*\ZLÿ	²Åƒp#’\0¤¢šP\Æ\ëšf»¢W\ÅŞ²\ì€	Q\ß\ï>”dy~HkL–¸9a&ñ\Êğ¬`\Ê\ë¬lsğm¶\İ\ÔP\Éa\è\æ‹ñ~\É\àñˆÁıÔ3ø|¶ü\rƒ\Ç\éú­<Y¦ÿ\0ƒ/×©¡p\Ï;˜\ÈUGuö\ÓR˜ı\Z&\Òxb°R¿V\ê÷\ÙJ\á\Z:e·\nÁw·	)¢\ìğ¹ üš[\él<_ÁÂ©´\Ç\Ë\âvô\å4F\ÔB†t¬°«g+™\ØB]¸oKŒ\Îñ\ÅnX¸\ç|W\0¿™V\ZÛ«\\Kú¹µ¢Y\'œ3“EûöR)\n^»7À™ù\í\êĞ¯«•\Ï\æú?yÿq¡¿Ù§wô\Æ\ã\×ş†÷i¼¿\áù\rO\ç\î\çıı\r\Ã7ü\å´\Æ?ı'),(13,'6__0_0_0_0',1724154218,_binary 'xœ\íUMoœ0ı+\çD6À\Æ9EM\ÕªºI¥,/Ì²Ö²\Ù&\é*\Ê\ï\Ø\Æ`vsª\ÚJUsc\Ï×›gFRò\ÂIr\ÃH_Š,H\Ôó*º\á$¿±V\ç¬­œDZi¶\ï,P\ÄY²\È\Òl\áNJY1\r³“O\nUĞ€{K\ì|·¼ª õÀ5‰ğV©5ßƒ\Çğ7h«Y’h´–¢\ÇğŠ$$Š#ç¨„Ô¼­\ãò\Úd\\‘HŠ\ç;P¥\ä\æCİ»+ \âº\å\Îßš`6\ê h\ÃÚºg5Ğ¡x{†1š$ni\Ç$´úV¢—\å˜_{X\Û>˜€I6`\ßl¼;\Â\Ø\Ö\ßE¯‘\ë‚^<¤\"\È öà³š\ç\å\Ğ!\Ôp=Á)\Î\ä^\Ñ^œ†i’p¸\í\é<\èôƒA\Ép}\àoğ´jt8`\ì\ÃZThl·­9\Å4V \Ñ\ål\Å+8û\Æ\Z„±³Q¦š¾¶˜×¥²X4\\<\Í<\rŸ\ÄN:ğ…\àTV¥h7¼º™rE\× …˜\æf\n\ŞvTK\0l‘\èü¡¼l\Ì\åXy\änT[$U\Ù\Ï~öİ‹*¤¥\ê\×c™\Ã\rÈª†\Äô¿Y&kĞ¶g|dd¹Å”~\ì\Ì2UA…¬\ÔP\"¦S²rÔ¬H\Ço8`µš\×\Ô\Âóc«y¦:\Ş¤a+¨&\Ë\íèˆ™®¾¯\è—\Û\ÕÃ‡Ï·÷Ÿ>\Ş{¾\È\nw?[+-Y©\İEX1ö©Ÿµ\ÅlüĞ¸\ÙbÕ¯;¤©\n:\Äz-ıSR\Ø3\Î\È\äÉ\èq\ã—\Æİ‚pÅ‘UÓ{\Zpı\Ú$\Ù\ãA\Èÿ4\0©h‚!4É²¥\å¦]‘·kV\î° \ê\ç=¦’fÇ‡´\Å\âiƒ{V’FV)oË¦¯À\ÙNSC-$‡iš¯&ú©`\'3Áö¬›;Ï‹øj¹ˆ³Áv\'I¾üƒ‚=T;\×\ë4ûô:[\æF°½\î`!çƒ°\ÙO«\\ökb¤;ğ\Â`­q=¬5î³µ\Â5t\În‚\ïa,J\Ä\0Xò¹$üš[ëˆo`!+\íñÉ²¸‚|9™ô„k‡\ì\Ò\ZUÅšs%¶\Ğ \î\Û\n£|²5\ß5Ào¦µ¦§õ|’7’‘·\Öô”uÆ±2Ytä°·\ZQóÖ½\î7OÑ¡\ãºZûˆ\×ÿ\Ékı\Õ>½³§\ï¼üõ7|,\ãı\rÿo¸‘ş|QW\ïoø\ß}\Ã_\Êf8²');
/*!40000 ALTER TABLE `cache_rootline` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `cache_rootline_tags`
--

LOCK TABLES `cache_rootline_tags` WRITE;
/*!40000 ALTER TABLE `cache_rootline_tags` DISABLE KEYS */;
INSERT INTO `cache_rootline_tags` VALUES (1,'1__0_0_0','pageId_1'),(2,'6__0_0_0','pageId_6'),(3,'6__0_0_0','pageId_1'),(4,'2__0_0_0','pageId_2'),(5,'2__0_0_0','pageId_1'),(6,'3__0_0_0','pageId_3'),(7,'3__0_0_0','pageId_1'),(8,'4__0_0_0','pageId_4'),(9,'4__0_0_0','pageId_1'),(10,'5__0_0_0','pageId_5'),(11,'5__0_0_0','pageId_1'),(12,'1__0_0_1_1','pageId_1'),(13,'1__0_0_0_0','pageId_1'),(14,'2__0_0_0_0','pageId_2'),(15,'2__0_0_0_0','pageId_1'),(16,'3__0_0_0_0','pageId_3'),(17,'3__0_0_0_0','pageId_1'),(18,'4__0_0_0_0','pageId_4'),(19,'4__0_0_0_0','pageId_1'),(20,'5__0_0_0_0','pageId_5'),(21,'5__0_0_0_0','pageId_1'),(22,'6__0_0_0_0','pageId_6'),(23,'6__0_0_0_0','pageId_1');
/*!40000 ALTER TABLE `cache_rootline_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `fe_groups`
--

LOCK TABLES `fe_groups` WRITE;
/*!40000 ALTER TABLE `fe_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `fe_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `fe_sessions`
--

LOCK TABLES `fe_sessions` WRITE;
/*!40000 ALTER TABLE `fe_sessions` DISABLE KEYS */;
INSERT INTO `fe_sessions` VALUES ('07d270e00d98f2ff8fea91fab8eb2990da5af3ace3893932b5859a91c44bdb81','[DISABLED]',0,1721562227,_binary 'a:1:{s:50:\"tx_form_honeypot_name_serverSideValidation-6page-1\";s:20:\"bLsDWqERaCdc2M8NG4tF\";}',0),('0e43a7cdc9cff2c651309edda71fe5613ea4b8b418009fdcef0efec226c8d5de','[DISABLED]',0,1721562249,_binary 'a:2:{s:57:\"tx_form_honeypot_name_multiplestepformwithsummary-4page-2\";s:23:\"NLKAJeihM9XxCVkRWvsTr3q\";s:64:\"tx_form_honeypot_name_multiplestepformwithsummary-4summarypage-1\";s:6:\"g8DqbH\";}',0),('2e08c7b8c168a3b3c9d127a2dc15edf39efd980293586a26acd622b6b26bcfcc','[DISABLED]',0,1721562248,_binary 'a:1:{s:40:\"tx_form_honeypot_name_simpleform-1page-1\";s:7:\"w4VBmRv\";}',0),('76ddb73b3049b53b65bd6f8c8d95184ea0179a7eed71eccfcece7a404ae7f418','[DISABLED]',0,1721562209,_binary 'a:2:{s:51:\"tx_form_honeypot_name_simpleformwithsummary-2page-1\";s:21:\"uY0wREPJr1ImyvXctTshp\";s:58:\"tx_form_honeypot_name_simpleformwithsummary-2summarypage-1\";s:25:\"m9Di8AyOK610fG2qpvrbSkCca\";}',0),('7e4234ba7a225c8dab42ceed44a27c2e2a0dd25124bc30099ca574d26c4e6bcc','[DISABLED]',0,1721562218,_binary 'a:2:{s:57:\"tx_form_honeypot_name_multiplestepformwithsummary-4page-1\";s:9:\"bDJ05oxBa\";s:57:\"tx_form_honeypot_name_multiplestepformwithsummary-4page-2\";s:14:\"p1J2IiNPoqCxZ7\";}',0),('7fd3cad3013a004449557f3f672608a5231354ffadc37ef46000d93ed4254733','[DISABLED]',0,1721562200,_binary 'a:1:{s:40:\"tx_form_honeypot_name_simpleform-1page-1\";s:8:\"5abGEpit\";}',0),('87dfe07a655523f33cc9ce7f83b2cd5c0648aefc27f1ced59cb3d80d3dd2a452','[DISABLED]',0,1721562248,_binary 'a:1:{s:58:\"tx_form_honeypot_name_simpleformwithsummary-2summarypage-1\";s:26:\"vJ8ZUIGWEb1fMBlHFSenoa6rhk\";}',0),('a91b64722383b86235dbf5bcdbd8950099c3e03c13872102f9098d824d754cc3','[DISABLED]',0,1721562249,_binary 'a:1:{s:46:\"tx_form_honeypot_name_multiplestepform-3page-2\";s:25:\"FeU3B8qumhXSxoEQ9TwL5AlCv\";}',0),('ad17f3b0e0102ba8ab19e5b0b6e4fab2b7828b7c6d9c70d5b7915fd367ba4322','[DISABLED]',0,1721562249,_binary 'a:1:{s:50:\"tx_form_honeypot_name_serverSideValidation-6page-1\";s:17:\"cMUYFnZfVj9NSmziv\";}',0),('cc39b5739707691f3c51b0928796801d93bb8c620da57dd9a61d6bb35053a05c','[DISABLED]',0,1721562223,_binary 'a:1:{s:50:\"tx_form_honeypot_name_serverSideValidation-6page-1\";s:6:\"kS2lbu\";}',0),('d3d5b01f926b9257e5ab2d7b00b1911b8908c354f38301139c383239aa46c5ea','[DISABLED]',0,1721562214,_binary 'a:2:{s:46:\"tx_form_honeypot_name_multiplestepform-3page-1\";s:5:\"Blavh\";s:46:\"tx_form_honeypot_name_multiplestepform-3page-2\";s:19:\"KLvqMxplsfyWRaG1UQ7\";}',0),('ed7a3887c8235345abd7cc983d48ee7b1624718873e72060a6cc5006ed455d1a','[DISABLED]',0,1721562249,_binary 'a:1:{s:50:\"tx_form_honeypot_name_serverSideValidation-6page-1\";s:18:\"7JoYba2rLgtBWdmHNi\";}',0);
/*!40000 ALTER TABLE `fe_sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `fe_users`
--

LOCK TABLES `fe_users` WRITE;
/*!40000 ALTER TABLE `fe_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `fe_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `pages`
--

LOCK TABLES `pages` WRITE;
/*!40000 ALTER TABLE `pages` DISABLE KEYS */;
INSERT INTO `pages` VALUES (1,0,1667048305,1667048168,0,0,0,0,'',256,NULL,0,0,0,0,NULL,_binary '{\"doktype\":\"\",\"title\":\"\",\"slug\":\"\",\"nav_title\":\"\",\"subtitle\":\"\",\"abstract\":\"\",\"keywords\":\"\",\"description\":\"\",\"author\":\"\",\"author_email\":\"\",\"lastUpdated\":\"\",\"layout\":\"\",\"newUntil\":\"\",\"backend_layout\":\"\",\"backend_layout_next_level\":\"\",\"content_from_pid\":\"\",\"target\":\"\",\"cache_timeout\":\"\",\"cache_tags\":\"\",\"is_siteroot\":\"\",\"no_search\":\"\",\"php_tree_stop\":\"\",\"module\":\"\",\"media\":\"\",\"tsconfig_includes\":\"\",\"TSconfig\":\"\",\"l18n_cfg\":\"\",\"hidden\":\"\",\"nav_hide\":\"\",\"starttime\":\"\",\"endtime\":\"\",\"extendToSubpages\":\"\",\"fe_group\":\"\",\"fe_login_mode\":\"\",\"editlock\":\"\",\"categories\":\"\",\"rowDescription\":\"\"}',0,0,0,0,1,0,31,27,0,'Root','/',1,NULL,1,0,'',0,0,'',0,'',0,0,NULL,0,'',0,NULL,0,1667063774,NULL,'',0,'','','',0,0,0,0,0,'','',NULL,0),(2,1,1667048347,1667048345,0,0,0,0,'0',256,NULL,0,0,0,0,NULL,_binary '{\"hidden\":\"\"}',0,0,0,0,1,0,31,27,0,'Simple form','/simple-form',1,NULL,0,0,'',0,0,'',0,'',0,0,NULL,0,'',0,NULL,0,1667048491,NULL,'',0,'','','',0,0,0,0,0,'','',NULL,0),(3,1,1667048361,1667048357,0,0,0,0,'0',512,NULL,0,0,0,0,NULL,_binary '{\"hidden\":\"\"}',0,0,0,0,1,0,31,27,0,'Simple form with summary','/simple-form-with-summary',1,NULL,0,0,'',0,0,'',0,'',0,0,NULL,0,'',0,NULL,0,1667048610,NULL,'',0,'','','',0,0,0,0,0,'','',NULL,0),(4,1,1667048784,1667048370,0,0,0,0,'0',576,NULL,0,0,0,0,NULL,_binary '{\"hidden\":\"\"}',0,0,0,0,1,0,31,27,0,'Multiple step form','/multiple-step-form',1,NULL,0,0,'',0,0,'',0,'',0,0,NULL,0,'',0,NULL,0,1667048784,NULL,'',0,'','','',0,0,0,0,0,'','',NULL,0),(5,1,1667048792,1667048774,0,0,0,0,'',640,NULL,0,0,0,0,NULL,_binary '{\"hidden\":\"\"}',0,0,0,0,1,0,31,27,0,'Multiple step form with summary','/multiple-step-form-with-summary',1,NULL,0,0,'',0,0,'',0,'',0,0,NULL,0,'',0,NULL,0,1667048826,NULL,'',0,'','','',0,0,0,0,0,'','',NULL,0),(6,1,1705135253,1705135250,0,0,0,0,'0',896,NULL,0,0,0,0,NULL,_binary '{\"hidden\":\"\"}',0,0,0,0,1,0,31,27,0,'Server Side Validation','/server-side-validation',1,NULL,0,0,'',0,0,'',0,'',0,0,NULL,0,'',0,NULL,0,1705135357,NULL,'',0,'','','',0,0,0,0,0,'','',NULL,0);
/*!40000 ALTER TABLE `pages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `sys_be_shortcuts`
--

LOCK TABLES `sys_be_shortcuts` WRITE;
/*!40000 ALTER TABLE `sys_be_shortcuts` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_be_shortcuts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `sys_category`
--

LOCK TABLES `sys_category` WRITE;
/*!40000 ALTER TABLE `sys_category` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `sys_category_record_mm`
--

LOCK TABLES `sys_category_record_mm` WRITE;
/*!40000 ALTER TABLE `sys_category_record_mm` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_category_record_mm` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `sys_csp_resolution`
--

LOCK TABLES `sys_csp_resolution` WRITE;
/*!40000 ALTER TABLE `sys_csp_resolution` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_csp_resolution` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `sys_file`
--

LOCK TABLES `sys_file` WRITE;
/*!40000 ALTER TABLE `sys_file` DISABLE KEYS */;
INSERT INTO `sys_file` VALUES (1,0,1667048681,0,0,1,1,0,'/form_definitions/simpleform.form.yaml','55f74855168b598f9b858cdae7df8e7624321b2a','c62e3e70a526a59f0f0b7687864947eab72d7d3f','yaml','text/plain','simpleform.form.yaml','b05b486e096744a286073a6365e6c6dbf21f2f69',674,1667048681,1667048681),(2,0,1667048688,0,0,1,1,0,'/form_definitions/simpleformwithsummary.form.yaml','7f6155cd7b266536b4bdf629eb2b501af272e6d7','c62e3e70a526a59f0f0b7687864947eab72d7d3f','yaml','text/plain','simpleformwithsummary.form.yaml','7d75de0ea2b9dd5b569d045440cceb5934ab9606',880,1667048688,1667048688),(3,0,1667048739,0,0,1,1,0,'/form_definitions/multiplestepform.form.yaml','dc8f3fd0703d1177ef09859cdb865dc7567b39e7','c62e3e70a526a59f0f0b7687864947eab72d7d3f','yaml','text/plain','multiplestepform.form.yaml','c983fe7f4d987451e92074cc12525c6cae58a57c',961,1667048739,1667048739),(4,0,1667048815,0,0,1,1,0,'/form_definitions/multiplestepformwithsummary.form.yaml','33e5f23eceb5e6281d1796b72490dfe680f98e49','c62e3e70a526a59f0f0b7687864947eab72d7d3f','yaml','text/plain','multiplestepformwithsummary.form.yaml','47ca678ee3bf95ebb7c5f35f8f13eee4feb891c6',1167,1667048815,1667048815),(5,0,1705135687,0,0,1,1,0,'/form_definitions/serversidevalidation.form.yaml','191c7235c48a53d06d0e0ddf0bd780d1146a1b10','c62e3e70a526a59f0f0b7687864947eab72d7d3f','yaml','text/plain','serversidevalidation.form.yaml','090f3152376b1359cacbb72e8e66e038b720e9f4',1051,1705135687,1705135687);
/*!40000 ALTER TABLE `sys_file` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `sys_file_collection`
--

LOCK TABLES `sys_file_collection` WRITE;
/*!40000 ALTER TABLE `sys_file_collection` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_file_collection` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `sys_file_metadata`
--

LOCK TABLES `sys_file_metadata` WRITE;
/*!40000 ALTER TABLE `sys_file_metadata` DISABLE KEYS */;
INSERT INTO `sys_file_metadata` VALUES (1,0,1667048681,1667048401,0,0,NULL,'',0,0,0,0,1,NULL,0,0,NULL,NULL,0),(2,0,1667048688,1667048593,0,0,NULL,'',0,0,0,0,2,NULL,0,0,NULL,NULL,0),(3,0,1667048739,1667048718,0,0,NULL,'',0,0,0,0,3,NULL,0,0,NULL,NULL,0),(4,0,1667048815,1667048809,0,0,NULL,'',0,0,0,0,4,NULL,0,0,NULL,NULL,0),(5,0,1705135687,1705135270,0,0,NULL,'',0,0,0,0,5,NULL,0,0,NULL,NULL,0);
/*!40000 ALTER TABLE `sys_file_metadata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `sys_file_processedfile`
--

LOCK TABLES `sys_file_processedfile` WRITE;
/*!40000 ALTER TABLE `sys_file_processedfile` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_file_processedfile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `sys_file_reference`
--

LOCK TABLES `sys_file_reference` WRITE;
/*!40000 ALTER TABLE `sys_file_reference` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_file_reference` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `sys_file_storage`
--

LOCK TABLES `sys_file_storage` WRITE;
/*!40000 ALTER TABLE `sys_file_storage` DISABLE KEYS */;
INSERT INTO `sys_file_storage` VALUES (1,0,1667048203,1667048203,0,'This is the local fileadmin/ directory. This storage mount has been created automatically by TYPO3.','fileadmin','Local','<?xml version=\"1.0\" encoding=\"utf-8\" standalone=\"yes\" ?>\n<T3FlexForms>\n    <data>\n        <sheet index=\"sDEF\">\n            <language index=\"lDEF\">\n                <field index=\"basePath\">\n                    <value index=\"vDEF\">fileadmin/</value>\n                </field>\n                <field index=\"pathType\">\n                    <value index=\"vDEF\">relative</value>\n                </field>\n                <field index=\"caseSensitive\">\n                    <value index=\"vDEF\"></value>\n                </field>\n            </language>\n        </sheet>\n    </data>\n</T3FlexForms>',1,1,1,1,1,1,NULL);
/*!40000 ALTER TABLE `sys_file_storage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `sys_filemounts`
--

LOCK TABLES `sys_filemounts` WRITE;
/*!40000 ALTER TABLE `sys_filemounts` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_filemounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `sys_history`
--

LOCK TABLES `sys_history` WRITE;
/*!40000 ALTER TABLE `sys_history` DISABLE KEYS */;
INSERT INTO `sys_history` VALUES (1,1667048168,1,'BE',1,0,1,'pages','{\"uid\":1,\"pid\":0,\"tstamp\":1667048168,\"crdate\":1667048168,\"cruser_id\":1,\"deleted\":0,\"hidden\":1,\"starttime\":0,\"endtime\":0,\"fe_group\":\"0\",\"sorting\":256,\"rowDescription\":null,\"editlock\":0,\"sys_language_uid\":0,\"l10n_parent\":0,\"l10n_source\":0,\"l10n_state\":null,\"t3_origuid\":0,\"l10n_diffsource\":\"\",\"t3ver_oid\":0,\"t3ver_wsid\":0,\"t3ver_state\":0,\"t3ver_stage\":0,\"perms_userid\":1,\"perms_groupid\":0,\"perms_user\":31,\"perms_group\":27,\"perms_everybody\":0,\"title\":\"Root\",\"slug\":\"\\/\",\"doktype\":1,\"TSconfig\":null,\"is_siteroot\":0,\"php_tree_stop\":0,\"url\":\"\",\"shortcut\":0,\"shortcut_mode\":0,\"subtitle\":\"\",\"layout\":0,\"target\":\"\",\"media\":0,\"lastUpdated\":0,\"keywords\":null,\"cache_timeout\":0,\"cache_tags\":\"\",\"newUntil\":0,\"description\":null,\"no_search\":0,\"SYS_LASTCHANGED\":0,\"abstract\":null,\"module\":\"\",\"extendToSubpages\":0,\"author\":\"\",\"author_email\":\"\",\"nav_title\":\"\",\"nav_hide\":0,\"content_from_pid\":0,\"mount_pid\":0,\"mount_pid_ol\":0,\"l18n_cfg\":0,\"fe_login_mode\":0,\"backend_layout\":\"\",\"backend_layout_next_level\":\"\",\"tsconfig_includes\":null,\"categories\":0}',0,'0400$e93ec53131be780b4498c704c8f924d0:e175f7045d7ccbfb26ffcf279422c2e5'),(2,1667048168,2,'BE',1,0,1,'pages','{\"oldRecord\":{\"l10n_diffsource\":\"\"},\"newRecord\":{\"l10n_diffsource\":\"{\\\"slug\\\":\\\"\\\"}\"}}',0,'0400$b5de05e1c4e54e10e9f159b102c055c7:e175f7045d7ccbfb26ffcf279422c2e5'),(3,1667048170,2,'BE',1,0,1,'pages','{\"oldRecord\":{\"hidden\":1,\"l10n_diffsource\":\"{\\\"slug\\\":\\\"\\\"}\"},\"newRecord\":{\"hidden\":\"0\",\"l10n_diffsource\":\"{\\\"hidden\\\":\\\"\\\"}\"}}',0,'0400$ab0881a44d7ac72c6e0f86e5b1e288a1:e175f7045d7ccbfb26ffcf279422c2e5'),(4,1667048215,2,'BE',1,0,1,'pages','{\"oldRecord\":{\"is_siteroot\":0,\"fe_group\":\"0\",\"l10n_diffsource\":\"{\\\"hidden\\\":\\\"\\\"}\"},\"newRecord\":{\"is_siteroot\":\"1\",\"fe_group\":\"\",\"l10n_diffsource\":\"{\\\"doktype\\\":\\\"\\\",\\\"title\\\":\\\"\\\",\\\"slug\\\":\\\"\\\",\\\"nav_title\\\":\\\"\\\",\\\"subtitle\\\":\\\"\\\",\\\"abstract\\\":\\\"\\\",\\\"keywords\\\":\\\"\\\",\\\"description\\\":\\\"\\\",\\\"author\\\":\\\"\\\",\\\"author_email\\\":\\\"\\\",\\\"lastUpdated\\\":\\\"\\\",\\\"layout\\\":\\\"\\\",\\\"newUntil\\\":\\\"\\\",\\\"backend_layout\\\":\\\"\\\",\\\"backend_layout_next_level\\\":\\\"\\\",\\\"content_from_pid\\\":\\\"\\\",\\\"target\\\":\\\"\\\",\\\"cache_timeout\\\":\\\"\\\",\\\"cache_tags\\\":\\\"\\\",\\\"is_siteroot\\\":\\\"\\\",\\\"no_search\\\":\\\"\\\",\\\"php_tree_stop\\\":\\\"\\\",\\\"module\\\":\\\"\\\",\\\"media\\\":\\\"\\\",\\\"tsconfig_includes\\\":\\\"\\\",\\\"TSconfig\\\":\\\"\\\",\\\"l18n_cfg\\\":\\\"\\\",\\\"hidden\\\":\\\"\\\",\\\"nav_hide\\\":\\\"\\\",\\\"starttime\\\":\\\"\\\",\\\"endtime\\\":\\\"\\\",\\\"extendToSubpages\\\":\\\"\\\",\\\"fe_group\\\":\\\"\\\",\\\"fe_login_mode\\\":\\\"\\\",\\\"editlock\\\":\\\"\\\",\\\"categories\\\":\\\"\\\",\\\"rowDescription\\\":\\\"\\\"}\"}}',0,'0400$ad1136cfbb428a0dfb937776c364021e:e175f7045d7ccbfb26ffcf279422c2e5'),(5,1667048285,1,'BE',1,0,1,'sys_template','{\"uid\":1,\"pid\":1,\"tstamp\":1667048285,\"crdate\":1667048285,\"cruser_id\":1,\"deleted\":0,\"hidden\":0,\"starttime\":0,\"endtime\":0,\"sorting\":256,\"description\":null,\"t3_origuid\":0,\"t3ver_oid\":0,\"t3ver_wsid\":0,\"t3ver_state\":0,\"t3ver_stage\":0,\"title\":\"NEW SITE\",\"root\":1,\"clear\":3,\"include_static_file\":null,\"constants\":null,\"config\":\"\\n# Default PAGE object:\\npage = PAGE\\npage.10 = TEXT\\npage.10.value = HELLO WORLD!\\n\",\"basedOn\":\"\",\"includeStaticAfterBasedOn\":0,\"static_file_mode\":0}',0,'0400$41f16d2b5c964553d3bd6ab64b9065a2:35af6288617af54964e77af08c30949a'),(6,1667048291,2,'BE',1,0,1,'sys_template','{\"oldRecord\":{\"config\":\"\\n# Default PAGE object:\\npage = PAGE\\npage.10 = TEXT\\npage.10.value = HELLO WORLD!\\n\"},\"newRecord\":{\"config\":\"page = PAGE\\r\\npage.10 < styles.content.get\"}}',0,'0400$78e938512657f5f6737bb0754554c836:35af6288617af54964e77af08c30949a'),(7,1667048345,1,'BE',1,0,2,'pages','{\"uid\":2,\"pid\":1,\"tstamp\":1667048345,\"crdate\":1667048345,\"cruser_id\":1,\"deleted\":0,\"hidden\":1,\"starttime\":0,\"endtime\":0,\"fe_group\":\"0\",\"sorting\":256,\"rowDescription\":null,\"editlock\":0,\"sys_language_uid\":0,\"l10n_parent\":0,\"l10n_source\":0,\"l10n_state\":null,\"t3_origuid\":0,\"l10n_diffsource\":\"\",\"t3ver_oid\":0,\"t3ver_wsid\":0,\"t3ver_state\":0,\"t3ver_stage\":0,\"perms_userid\":1,\"perms_groupid\":0,\"perms_user\":31,\"perms_group\":27,\"perms_everybody\":0,\"title\":\"Simple form\",\"slug\":\"\\/simple-form\",\"doktype\":1,\"TSconfig\":null,\"is_siteroot\":0,\"php_tree_stop\":0,\"url\":\"\",\"shortcut\":0,\"shortcut_mode\":0,\"subtitle\":\"\",\"layout\":0,\"target\":\"\",\"media\":0,\"lastUpdated\":0,\"keywords\":null,\"cache_timeout\":0,\"cache_tags\":\"\",\"newUntil\":0,\"description\":null,\"no_search\":0,\"SYS_LASTCHANGED\":0,\"abstract\":null,\"module\":\"\",\"extendToSubpages\":0,\"author\":\"\",\"author_email\":\"\",\"nav_title\":\"\",\"nav_hide\":0,\"content_from_pid\":0,\"mount_pid\":0,\"mount_pid_ol\":0,\"l18n_cfg\":0,\"fe_login_mode\":0,\"backend_layout\":\"\",\"backend_layout_next_level\":\"\",\"tsconfig_includes\":null,\"categories\":0}',0,'0400$e798038bcc99f15adb7228239fff79d5:f11830df10b4b0bca2db34810c2241b3'),(8,1667048347,2,'BE',1,0,2,'pages','{\"oldRecord\":{\"hidden\":1,\"l10n_diffsource\":\"\"},\"newRecord\":{\"hidden\":\"0\",\"l10n_diffsource\":\"{\\\"hidden\\\":\\\"\\\"}\"}}',0,'0400$759942b6bffe7ac221348fd17ae28248:f11830df10b4b0bca2db34810c2241b3'),(9,1667048357,1,'BE',1,0,3,'pages','{\"uid\":3,\"pid\":1,\"tstamp\":1667048357,\"crdate\":1667048357,\"cruser_id\":1,\"deleted\":0,\"hidden\":1,\"starttime\":0,\"endtime\":0,\"fe_group\":\"0\",\"sorting\":512,\"rowDescription\":null,\"editlock\":0,\"sys_language_uid\":0,\"l10n_parent\":0,\"l10n_source\":0,\"l10n_state\":null,\"t3_origuid\":0,\"l10n_diffsource\":\"\",\"t3ver_oid\":0,\"t3ver_wsid\":0,\"t3ver_state\":0,\"t3ver_stage\":0,\"perms_userid\":1,\"perms_groupid\":0,\"perms_user\":31,\"perms_group\":27,\"perms_everybody\":0,\"title\":\"Simple form with summary\",\"slug\":\"\\/simple-form-with-summary\",\"doktype\":1,\"TSconfig\":null,\"is_siteroot\":0,\"php_tree_stop\":0,\"url\":\"\",\"shortcut\":0,\"shortcut_mode\":0,\"subtitle\":\"\",\"layout\":0,\"target\":\"\",\"media\":0,\"lastUpdated\":0,\"keywords\":null,\"cache_timeout\":0,\"cache_tags\":\"\",\"newUntil\":0,\"description\":null,\"no_search\":0,\"SYS_LASTCHANGED\":0,\"abstract\":null,\"module\":\"\",\"extendToSubpages\":0,\"author\":\"\",\"author_email\":\"\",\"nav_title\":\"\",\"nav_hide\":0,\"content_from_pid\":0,\"mount_pid\":0,\"mount_pid_ol\":0,\"l18n_cfg\":0,\"fe_login_mode\":0,\"backend_layout\":\"\",\"backend_layout_next_level\":\"\",\"tsconfig_includes\":null,\"categories\":0}',0,'0400$534de08b77d1d1f2a3ac6b7ed16107f3:fe15eeb7d49e64e2cea91ab53fcf0db1'),(10,1667048361,2,'BE',1,0,3,'pages','{\"oldRecord\":{\"hidden\":1,\"l10n_diffsource\":\"\"},\"newRecord\":{\"hidden\":\"0\",\"l10n_diffsource\":\"{\\\"hidden\\\":\\\"\\\"}\"}}',0,'0400$fe9dd37d76f3967467d04ca482576dcd:fe15eeb7d49e64e2cea91ab53fcf0db1'),(11,1667048370,1,'BE',1,0,4,'pages','{\"uid\":4,\"pid\":1,\"tstamp\":1667048370,\"crdate\":1667048370,\"cruser_id\":1,\"deleted\":0,\"hidden\":1,\"starttime\":0,\"endtime\":0,\"fe_group\":\"0\",\"sorting\":768,\"rowDescription\":null,\"editlock\":0,\"sys_language_uid\":0,\"l10n_parent\":0,\"l10n_source\":0,\"l10n_state\":null,\"t3_origuid\":0,\"l10n_diffsource\":\"\",\"t3ver_oid\":0,\"t3ver_wsid\":0,\"t3ver_state\":0,\"t3ver_stage\":0,\"perms_userid\":1,\"perms_groupid\":0,\"perms_user\":31,\"perms_group\":27,\"perms_everybody\":0,\"title\":\"Multiple step form\",\"slug\":\"\\/multiple-step-form\",\"doktype\":1,\"TSconfig\":null,\"is_siteroot\":0,\"php_tree_stop\":0,\"url\":\"\",\"shortcut\":0,\"shortcut_mode\":0,\"subtitle\":\"\",\"layout\":0,\"target\":\"\",\"media\":0,\"lastUpdated\":0,\"keywords\":null,\"cache_timeout\":0,\"cache_tags\":\"\",\"newUntil\":0,\"description\":null,\"no_search\":0,\"SYS_LASTCHANGED\":0,\"abstract\":null,\"module\":\"\",\"extendToSubpages\":0,\"author\":\"\",\"author_email\":\"\",\"nav_title\":\"\",\"nav_hide\":0,\"content_from_pid\":0,\"mount_pid\":0,\"mount_pid_ol\":0,\"l18n_cfg\":0,\"fe_login_mode\":0,\"backend_layout\":\"\",\"backend_layout_next_level\":\"\",\"tsconfig_includes\":null,\"categories\":0}',0,'0400$c28c66344fdbcb27affba9404c2c4a37:412add0b3eb6ec8f1cb6710aea92e21e'),(12,1667048373,2,'BE',1,0,4,'pages','{\"oldRecord\":{\"hidden\":1,\"l10n_diffsource\":\"\"},\"newRecord\":{\"hidden\":\"0\",\"l10n_diffsource\":\"{\\\"hidden\\\":\\\"\\\"}\"}}',0,'0400$aad470b0de96bd56df08bf67a5d9e339:412add0b3eb6ec8f1cb6710aea92e21e'),(13,1667048489,1,'BE',1,0,1,'tt_content','{\"uid\":1,\"rowDescription\":\"\",\"pid\":2,\"tstamp\":1667048489,\"crdate\":1667048489,\"cruser_id\":1,\"deleted\":0,\"hidden\":0,\"starttime\":0,\"endtime\":0,\"fe_group\":\"\",\"sorting\":256,\"editlock\":0,\"sys_language_uid\":0,\"l18n_parent\":0,\"l10n_source\":0,\"l10n_state\":null,\"t3_origuid\":0,\"l18n_diffsource\":\"\",\"t3ver_oid\":0,\"t3ver_wsid\":0,\"t3ver_state\":0,\"t3ver_stage\":0,\"CType\":\"form_formframework\",\"header\":\"\",\"header_position\":\"\",\"bodytext\":null,\"bullets_type\":0,\"uploads_description\":0,\"uploads_type\":0,\"assets\":0,\"image\":0,\"imagewidth\":0,\"imageorient\":0,\"imagecols\":2,\"imageborder\":0,\"media\":0,\"layout\":0,\"frame_class\":\"default\",\"cols\":0,\"space_before_class\":\"\",\"space_after_class\":\"\",\"records\":null,\"pages\":null,\"colPos\":0,\"subheader\":\"\",\"header_link\":\"\",\"image_zoom\":0,\"header_layout\":\"0\",\"list_type\":\"\",\"sectionIndex\":1,\"linkToTop\":0,\"file_collections\":null,\"filelink_size\":0,\"filelink_sorting\":\"\",\"filelink_sorting_direction\":\"\",\"target\":\"\",\"date\":0,\"recursive\":0,\"imageheight\":0,\"pi_flexform\":\"<?xml version=\\\"1.0\\\" encoding=\\\"utf-8\\\" standalone=\\\"yes\\\" ?>\\n<T3FlexForms>\\n    <data>\\n        <sheet index=\\\"sDEF\\\">\\n            <language index=\\\"lDEF\\\">\\n                <field index=\\\"settings.persistenceIdentifier\\\">\\n                    <value index=\\\"vDEF\\\">1:\\/form_definitions\\/simpleform.form.yaml<\\/value>\\n                <\\/field>\\n            <\\/language>\\n        <\\/sheet>\\n    <\\/data>\\n<\\/T3FlexForms>\",\"accessibility_title\":\"\",\"accessibility_bypass\":0,\"accessibility_bypass_text\":\"\",\"category_field\":\"\",\"table_class\":\"\",\"table_caption\":null,\"table_delimiter\":124,\"table_enclosure\":0,\"table_header_position\":0,\"table_tfoot\":0,\"categories\":0,\"selected_categories\":null}',0,'0400$782d7ce175ee4e7f3e639e483f056e92:7fa2c035f26826fe83eeecaaeddc4d40'),(14,1667048491,2,'BE',1,0,1,'tt_content','{\"oldRecord\":{\"l18n_diffsource\":\"\"},\"newRecord\":{\"l18n_diffsource\":\"{\\\"CType\\\":\\\"\\\",\\\"colPos\\\":\\\"\\\",\\\"header\\\":\\\"\\\",\\\"header_layout\\\":\\\"\\\",\\\"header_position\\\":\\\"\\\",\\\"date\\\":\\\"\\\",\\\"header_link\\\":\\\"\\\",\\\"pi_flexform\\\":\\\"\\\",\\\"layout\\\":\\\"\\\",\\\"frame_class\\\":\\\"\\\",\\\"space_before_class\\\":\\\"\\\",\\\"space_after_class\\\":\\\"\\\",\\\"sectionIndex\\\":\\\"\\\",\\\"linkToTop\\\":\\\"\\\",\\\"sys_language_uid\\\":\\\"\\\",\\\"hidden\\\":\\\"\\\",\\\"starttime\\\":\\\"\\\",\\\"endtime\\\":\\\"\\\",\\\"fe_group\\\":\\\"\\\",\\\"editlock\\\":\\\"\\\",\\\"categories\\\":\\\"\\\",\\\"rowDescription\\\":\\\"\\\"}\"}}',0,'0400$ffb25b2f5d140b16906380542d3a008d:7fa2c035f26826fe83eeecaaeddc4d40'),(15,1667048507,2,'BE',1,0,1,'sys_template','{\"oldRecord\":{\"include_static_file\":null},\"newRecord\":{\"include_static_file\":\"EXT:form\\/Configuration\\/TypoScript\\/\"}}',0,'0400$8f9c8382734e31e2782ca941057893f4:35af6288617af54964e77af08c30949a'),(16,1667048534,2,'BE',1,0,1,'sys_template','{\"oldRecord\":{\"include_static_file\":\"EXT:form\\/Configuration\\/TypoScript\\/\"},\"newRecord\":{\"include_static_file\":\"EXT:fluid_styled_content\\/Configuration\\/TypoScript\\/,EXT:form\\/Configuration\\/TypoScript\\/\"}}',0,'0400$3774c074836f4a9535703defb99f508b:35af6288617af54964e77af08c30949a'),(17,1667048609,1,'BE',1,0,2,'tt_content','{\"uid\":2,\"rowDescription\":\"\",\"pid\":3,\"tstamp\":1667048609,\"crdate\":1667048609,\"cruser_id\":1,\"deleted\":0,\"hidden\":0,\"starttime\":0,\"endtime\":0,\"fe_group\":\"\",\"sorting\":256,\"editlock\":0,\"sys_language_uid\":0,\"l18n_parent\":0,\"l10n_source\":0,\"l10n_state\":null,\"t3_origuid\":0,\"l18n_diffsource\":\"\",\"t3ver_oid\":0,\"t3ver_wsid\":0,\"t3ver_state\":0,\"t3ver_stage\":0,\"CType\":\"form_formframework\",\"header\":\"\",\"header_position\":\"\",\"bodytext\":null,\"bullets_type\":0,\"uploads_description\":0,\"uploads_type\":0,\"assets\":0,\"image\":0,\"imagewidth\":0,\"imageorient\":0,\"imagecols\":2,\"imageborder\":0,\"media\":0,\"layout\":0,\"frame_class\":\"default\",\"cols\":0,\"space_before_class\":\"\",\"space_after_class\":\"\",\"records\":null,\"pages\":null,\"colPos\":0,\"subheader\":\"\",\"header_link\":\"\",\"image_zoom\":0,\"header_layout\":\"0\",\"list_type\":\"\",\"sectionIndex\":1,\"linkToTop\":0,\"file_collections\":null,\"filelink_size\":0,\"filelink_sorting\":\"\",\"filelink_sorting_direction\":\"\",\"target\":\"\",\"date\":0,\"recursive\":0,\"imageheight\":0,\"pi_flexform\":\"<?xml version=\\\"1.0\\\" encoding=\\\"utf-8\\\" standalone=\\\"yes\\\" ?>\\n<T3FlexForms>\\n    <data>\\n        <sheet index=\\\"sDEF\\\">\\n            <language index=\\\"lDEF\\\">\\n                <field index=\\\"settings.persistenceIdentifier\\\">\\n                    <value index=\\\"vDEF\\\">1:\\/form_definitions\\/simpleformwithsummary.form.yaml<\\/value>\\n                <\\/field>\\n            <\\/language>\\n        <\\/sheet>\\n    <\\/data>\\n<\\/T3FlexForms>\",\"accessibility_title\":\"\",\"accessibility_bypass\":0,\"accessibility_bypass_text\":\"\",\"category_field\":\"\",\"table_class\":\"\",\"table_caption\":null,\"table_delimiter\":124,\"table_enclosure\":0,\"table_header_position\":0,\"table_tfoot\":0,\"categories\":0,\"selected_categories\":null}',0,'0400$f5a9c37354529355ee82341fb3373083:01dbc21fdb1263685b9147b3b1596ea8'),(18,1667048610,2,'BE',1,0,2,'tt_content','{\"oldRecord\":{\"pi_flexform\":\"<?xml version=\\\"1.0\\\" encoding=\\\"utf-8\\\" standalone=\\\"yes\\\" ?>\\n<T3FlexForms>\\n    <data>\\n        <sheet index=\\\"sDEF\\\">\\n            <language index=\\\"lDEF\\\">\\n                <field index=\\\"settings.persistenceIdentifier\\\">\\n                    <value index=\\\"vDEF\\\">1:\\/form_definitions\\/simpleformwithsummary.form.yaml<\\/value>\\n                <\\/field>\\n            <\\/language>\\n        <\\/sheet>\\n    <\\/data>\\n<\\/T3FlexForms>\",\"l18n_diffsource\":\"\"},\"newRecord\":{\"pi_flexform\":\"<?xml version=\\\"1.0\\\" encoding=\\\"utf-8\\\" standalone=\\\"yes\\\" ?>\\n<T3FlexForms>\\n    <data>\\n        <sheet index=\\\"sDEF\\\">\\n            <language index=\\\"lDEF\\\">\\n                <field index=\\\"settings.persistenceIdentifier\\\">\\n                    <value index=\\\"vDEF\\\">1:\\/form_definitions\\/simpleformwithsummary.form.yaml<\\/value>\\n                <\\/field>\\n                <field index=\\\"settings.overrideFinishers\\\">\\n                    <value index=\\\"vDEF\\\">0<\\/value>\\n                <\\/field>\\n            <\\/language>\\n        <\\/sheet>\\n    <\\/data>\\n<\\/T3FlexForms>\",\"l18n_diffsource\":\"{\\\"CType\\\":\\\"\\\",\\\"colPos\\\":\\\"\\\",\\\"header\\\":\\\"\\\",\\\"header_layout\\\":\\\"\\\",\\\"header_position\\\":\\\"\\\",\\\"date\\\":\\\"\\\",\\\"header_link\\\":\\\"\\\",\\\"pi_flexform\\\":\\\"\\\",\\\"layout\\\":\\\"\\\",\\\"frame_class\\\":\\\"\\\",\\\"space_before_class\\\":\\\"\\\",\\\"space_after_class\\\":\\\"\\\",\\\"sectionIndex\\\":\\\"\\\",\\\"linkToTop\\\":\\\"\\\",\\\"sys_language_uid\\\":\\\"\\\",\\\"hidden\\\":\\\"\\\",\\\"starttime\\\":\\\"\\\",\\\"endtime\\\":\\\"\\\",\\\"fe_group\\\":\\\"\\\",\\\"editlock\\\":\\\"\\\",\\\"categories\\\":\\\"\\\",\\\"rowDescription\\\":\\\"\\\"}\"}}',0,'0400$7fa6fa53472bd862d83fe928682b17f4:01dbc21fdb1263685b9147b3b1596ea8'),(19,1667048754,1,'BE',1,0,3,'tt_content','{\"uid\":3,\"rowDescription\":\"\",\"pid\":4,\"tstamp\":1667048754,\"crdate\":1667048754,\"cruser_id\":1,\"deleted\":0,\"hidden\":0,\"starttime\":0,\"endtime\":0,\"fe_group\":\"\",\"sorting\":256,\"editlock\":0,\"sys_language_uid\":0,\"l18n_parent\":0,\"l10n_source\":0,\"l10n_state\":null,\"t3_origuid\":0,\"l18n_diffsource\":\"\",\"t3ver_oid\":0,\"t3ver_wsid\":0,\"t3ver_state\":0,\"t3ver_stage\":0,\"CType\":\"form_formframework\",\"header\":\"\",\"header_position\":\"\",\"bodytext\":null,\"bullets_type\":0,\"uploads_description\":0,\"uploads_type\":0,\"assets\":0,\"image\":0,\"imagewidth\":0,\"imageorient\":0,\"imagecols\":2,\"imageborder\":0,\"media\":0,\"layout\":0,\"frame_class\":\"default\",\"cols\":0,\"space_before_class\":\"\",\"space_after_class\":\"\",\"records\":null,\"pages\":null,\"colPos\":0,\"subheader\":\"\",\"header_link\":\"\",\"image_zoom\":0,\"header_layout\":\"0\",\"list_type\":\"\",\"sectionIndex\":1,\"linkToTop\":0,\"file_collections\":null,\"filelink_size\":0,\"filelink_sorting\":\"\",\"filelink_sorting_direction\":\"\",\"target\":\"\",\"date\":0,\"recursive\":0,\"imageheight\":0,\"pi_flexform\":\"<?xml version=\\\"1.0\\\" encoding=\\\"utf-8\\\" standalone=\\\"yes\\\" ?>\\n<T3FlexForms>\\n    <data>\\n        <sheet index=\\\"sDEF\\\">\\n            <language index=\\\"lDEF\\\">\\n                <field index=\\\"settings.persistenceIdentifier\\\">\\n                    <value index=\\\"vDEF\\\">1:\\/form_definitions\\/multiplestepform.form.yaml<\\/value>\\n                <\\/field>\\n            <\\/language>\\n        <\\/sheet>\\n    <\\/data>\\n<\\/T3FlexForms>\",\"accessibility_title\":\"\",\"accessibility_bypass\":0,\"accessibility_bypass_text\":\"\",\"category_field\":\"\",\"table_class\":\"\",\"table_caption\":null,\"table_delimiter\":124,\"table_enclosure\":0,\"table_header_position\":0,\"table_tfoot\":0,\"categories\":0,\"selected_categories\":null}',0,'0400$aeed84ef90e446adf82753e8583e7135:b92300cfb5d1d3645c9cb212a7f56c1f'),(20,1667048755,2,'BE',1,0,3,'tt_content','{\"oldRecord\":{\"pi_flexform\":\"<?xml version=\\\"1.0\\\" encoding=\\\"utf-8\\\" standalone=\\\"yes\\\" ?>\\n<T3FlexForms>\\n    <data>\\n        <sheet index=\\\"sDEF\\\">\\n            <language index=\\\"lDEF\\\">\\n                <field index=\\\"settings.persistenceIdentifier\\\">\\n                    <value index=\\\"vDEF\\\">1:\\/form_definitions\\/multiplestepform.form.yaml<\\/value>\\n                <\\/field>\\n            <\\/language>\\n        <\\/sheet>\\n    <\\/data>\\n<\\/T3FlexForms>\",\"l18n_diffsource\":\"\"},\"newRecord\":{\"pi_flexform\":\"<?xml version=\\\"1.0\\\" encoding=\\\"utf-8\\\" standalone=\\\"yes\\\" ?>\\n<T3FlexForms>\\n    <data>\\n        <sheet index=\\\"sDEF\\\">\\n            <language index=\\\"lDEF\\\">\\n                <field index=\\\"settings.persistenceIdentifier\\\">\\n                    <value index=\\\"vDEF\\\">1:\\/form_definitions\\/multiplestepform.form.yaml<\\/value>\\n                <\\/field>\\n                <field index=\\\"settings.overrideFinishers\\\">\\n                    <value index=\\\"vDEF\\\">0<\\/value>\\n                <\\/field>\\n            <\\/language>\\n        <\\/sheet>\\n    <\\/data>\\n<\\/T3FlexForms>\",\"l18n_diffsource\":\"{\\\"CType\\\":\\\"\\\",\\\"colPos\\\":\\\"\\\",\\\"header\\\":\\\"\\\",\\\"header_layout\\\":\\\"\\\",\\\"header_position\\\":\\\"\\\",\\\"date\\\":\\\"\\\",\\\"header_link\\\":\\\"\\\",\\\"pi_flexform\\\":\\\"\\\",\\\"layout\\\":\\\"\\\",\\\"frame_class\\\":\\\"\\\",\\\"space_before_class\\\":\\\"\\\",\\\"space_after_class\\\":\\\"\\\",\\\"sectionIndex\\\":\\\"\\\",\\\"linkToTop\\\":\\\"\\\",\\\"sys_language_uid\\\":\\\"\\\",\\\"hidden\\\":\\\"\\\",\\\"starttime\\\":\\\"\\\",\\\"endtime\\\":\\\"\\\",\\\"fe_group\\\":\\\"\\\",\\\"editlock\\\":\\\"\\\",\\\"categories\\\":\\\"\\\",\\\"rowDescription\\\":\\\"\\\"}\"}}',0,'0400$1c41074331b90797613e3f047aaeff78:b92300cfb5d1d3645c9cb212a7f56c1f'),(21,1667048774,1,'BE',1,0,5,'pages','{\"uid\":5,\"pid\":4,\"tstamp\":1667048774,\"crdate\":1667048774,\"cruser_id\":1,\"deleted\":0,\"hidden\":1,\"starttime\":0,\"endtime\":0,\"fe_group\":\"0\",\"sorting\":256,\"rowDescription\":null,\"editlock\":0,\"sys_language_uid\":0,\"l10n_parent\":0,\"l10n_source\":0,\"l10n_state\":null,\"t3_origuid\":0,\"l10n_diffsource\":\"\",\"t3ver_oid\":0,\"t3ver_wsid\":0,\"t3ver_state\":0,\"t3ver_stage\":0,\"perms_userid\":1,\"perms_groupid\":0,\"perms_user\":31,\"perms_group\":27,\"perms_everybody\":0,\"title\":\"Multiple step form with summary\",\"slug\":\"\\/multiple-step-form\\/multiple-step-form-with-summary\",\"doktype\":1,\"TSconfig\":null,\"is_siteroot\":0,\"php_tree_stop\":0,\"url\":\"\",\"shortcut\":0,\"shortcut_mode\":0,\"subtitle\":\"\",\"layout\":0,\"target\":\"\",\"media\":0,\"lastUpdated\":0,\"keywords\":null,\"cache_timeout\":0,\"cache_tags\":\"\",\"newUntil\":0,\"description\":null,\"no_search\":0,\"SYS_LASTCHANGED\":0,\"abstract\":null,\"module\":\"\",\"extendToSubpages\":0,\"author\":\"\",\"author_email\":\"\",\"nav_title\":\"\",\"nav_hide\":0,\"content_from_pid\":0,\"mount_pid\":0,\"mount_pid_ol\":0,\"l18n_cfg\":0,\"fe_login_mode\":0,\"backend_layout\":\"\",\"backend_layout_next_level\":\"\",\"tsconfig_includes\":null,\"categories\":0}',0,'0400$6565869b4bd7dc203e1ec89f8d35b1cb:7ef5a4e3e11db8ac3fea4d7a75468161'),(22,1667048781,3,'BE',1,0,5,'pages','{\"oldPageId\":4,\"newPageId\":1,\"oldData\":{\"header\":\"Multiple step form with summary\",\"pid\":4,\"event_pid\":5,\"t3ver_state\":0},\"newData\":{\"tstamp\":1667048781,\"pid\":1,\"sorting\":640}}',0,'0400$be8803059de3aab7b19508f842e9faa3:7ef5a4e3e11db8ac3fea4d7a75468161'),(23,1667048784,3,'BE',1,0,4,'pages','{\"oldPageId\":1,\"newPageId\":1,\"oldData\":{\"header\":\"Multiple step form\",\"pid\":1,\"event_pid\":4,\"t3ver_state\":0},\"newData\":{\"tstamp\":1667048784,\"pid\":1,\"sorting\":576}}',0,'0400$c9b2d1cbc8bc4e3645f0a5b65997bcc0:412add0b3eb6ec8f1cb6710aea92e21e'),(24,1667048789,2,'BE',1,0,5,'pages','{\"oldRecord\":{\"slug\":\"\\/multiple-step-form\\/multiple-step-form-with-summary\",\"fe_group\":\"0\",\"l10n_diffsource\":\"\"},\"newRecord\":{\"slug\":\"\\/multiple-step-form-with-summary\",\"fe_group\":\"\",\"l10n_diffsource\":\"{\\\"doktype\\\":\\\"\\\",\\\"title\\\":\\\"\\\",\\\"slug\\\":\\\"\\\",\\\"nav_title\\\":\\\"\\\",\\\"subtitle\\\":\\\"\\\",\\\"abstract\\\":\\\"\\\",\\\"keywords\\\":\\\"\\\",\\\"description\\\":\\\"\\\",\\\"author\\\":\\\"\\\",\\\"author_email\\\":\\\"\\\",\\\"lastUpdated\\\":\\\"\\\",\\\"layout\\\":\\\"\\\",\\\"newUntil\\\":\\\"\\\",\\\"backend_layout\\\":\\\"\\\",\\\"backend_layout_next_level\\\":\\\"\\\",\\\"content_from_pid\\\":\\\"\\\",\\\"target\\\":\\\"\\\",\\\"cache_timeout\\\":\\\"\\\",\\\"cache_tags\\\":\\\"\\\",\\\"is_siteroot\\\":\\\"\\\",\\\"no_search\\\":\\\"\\\",\\\"php_tree_stop\\\":\\\"\\\",\\\"module\\\":\\\"\\\",\\\"media\\\":\\\"\\\",\\\"tsconfig_includes\\\":\\\"\\\",\\\"TSconfig\\\":\\\"\\\",\\\"l18n_cfg\\\":\\\"\\\",\\\"hidden\\\":\\\"\\\",\\\"nav_hide\\\":\\\"\\\",\\\"starttime\\\":\\\"\\\",\\\"endtime\\\":\\\"\\\",\\\"extendToSubpages\\\":\\\"\\\",\\\"fe_group\\\":\\\"\\\",\\\"fe_login_mode\\\":\\\"\\\",\\\"editlock\\\":\\\"\\\",\\\"categories\\\":\\\"\\\",\\\"rowDescription\\\":\\\"\\\"}\"}}',0,'0400$a1f61b80df36e09bfafb41a8dedef54f:7ef5a4e3e11db8ac3fea4d7a75468161'),(25,1667048792,2,'BE',1,0,5,'pages','{\"oldRecord\":{\"hidden\":1,\"l10n_diffsource\":\"{\\\"doktype\\\":\\\"\\\",\\\"title\\\":\\\"\\\",\\\"slug\\\":\\\"\\\",\\\"nav_title\\\":\\\"\\\",\\\"subtitle\\\":\\\"\\\",\\\"abstract\\\":\\\"\\\",\\\"keywords\\\":\\\"\\\",\\\"description\\\":\\\"\\\",\\\"author\\\":\\\"\\\",\\\"author_email\\\":\\\"\\\",\\\"lastUpdated\\\":\\\"\\\",\\\"layout\\\":\\\"\\\",\\\"newUntil\\\":\\\"\\\",\\\"backend_layout\\\":\\\"\\\",\\\"backend_layout_next_level\\\":\\\"\\\",\\\"content_from_pid\\\":\\\"\\\",\\\"target\\\":\\\"\\\",\\\"cache_timeout\\\":\\\"\\\",\\\"cache_tags\\\":\\\"\\\",\\\"is_siteroot\\\":\\\"\\\",\\\"no_search\\\":\\\"\\\",\\\"php_tree_stop\\\":\\\"\\\",\\\"module\\\":\\\"\\\",\\\"media\\\":\\\"\\\",\\\"tsconfig_includes\\\":\\\"\\\",\\\"TSconfig\\\":\\\"\\\",\\\"l18n_cfg\\\":\\\"\\\",\\\"hidden\\\":\\\"\\\",\\\"nav_hide\\\":\\\"\\\",\\\"starttime\\\":\\\"\\\",\\\"endtime\\\":\\\"\\\",\\\"extendToSubpages\\\":\\\"\\\",\\\"fe_group\\\":\\\"\\\",\\\"fe_login_mode\\\":\\\"\\\",\\\"editlock\\\":\\\"\\\",\\\"categories\\\":\\\"\\\",\\\"rowDescription\\\":\\\"\\\"}\"},\"newRecord\":{\"hidden\":\"0\",\"l10n_diffsource\":\"{\\\"hidden\\\":\\\"\\\"}\"}}',0,'0400$98b639fa0840fa4ad2defea570185a69:7ef5a4e3e11db8ac3fea4d7a75468161'),(26,1667048825,1,'BE',1,0,4,'tt_content','{\"uid\":4,\"rowDescription\":\"\",\"pid\":5,\"tstamp\":1667048825,\"crdate\":1667048825,\"cruser_id\":1,\"deleted\":0,\"hidden\":0,\"starttime\":0,\"endtime\":0,\"fe_group\":\"\",\"sorting\":256,\"editlock\":0,\"sys_language_uid\":0,\"l18n_parent\":0,\"l10n_source\":0,\"l10n_state\":null,\"t3_origuid\":0,\"l18n_diffsource\":\"\",\"t3ver_oid\":0,\"t3ver_wsid\":0,\"t3ver_state\":0,\"t3ver_stage\":0,\"CType\":\"form_formframework\",\"header\":\"\",\"header_position\":\"\",\"bodytext\":null,\"bullets_type\":0,\"uploads_description\":0,\"uploads_type\":0,\"assets\":0,\"image\":0,\"imagewidth\":0,\"imageorient\":0,\"imagecols\":2,\"imageborder\":0,\"media\":0,\"layout\":0,\"frame_class\":\"default\",\"cols\":0,\"space_before_class\":\"\",\"space_after_class\":\"\",\"records\":null,\"pages\":null,\"colPos\":0,\"subheader\":\"\",\"header_link\":\"\",\"image_zoom\":0,\"header_layout\":\"0\",\"list_type\":\"\",\"sectionIndex\":1,\"linkToTop\":0,\"file_collections\":null,\"filelink_size\":0,\"filelink_sorting\":\"\",\"filelink_sorting_direction\":\"\",\"target\":\"\",\"date\":0,\"recursive\":0,\"imageheight\":0,\"pi_flexform\":\"<?xml version=\\\"1.0\\\" encoding=\\\"utf-8\\\" standalone=\\\"yes\\\" ?>\\n<T3FlexForms>\\n    <data>\\n        <sheet index=\\\"sDEF\\\">\\n            <language index=\\\"lDEF\\\">\\n                <field index=\\\"settings.persistenceIdentifier\\\">\\n                    <value index=\\\"vDEF\\\">1:\\/form_definitions\\/multiplestepformwithsummary.form.yaml<\\/value>\\n                <\\/field>\\n            <\\/language>\\n        <\\/sheet>\\n    <\\/data>\\n<\\/T3FlexForms>\",\"accessibility_title\":\"\",\"accessibility_bypass\":0,\"accessibility_bypass_text\":\"\",\"category_field\":\"\",\"table_class\":\"\",\"table_caption\":null,\"table_delimiter\":124,\"table_enclosure\":0,\"table_header_position\":0,\"table_tfoot\":0,\"categories\":0,\"selected_categories\":null}',0,'0400$75f7835179becf863a451f80e7626e81:4d391f5ef79b8d5d10dffa8a07ca167d'),(27,1667048826,2,'BE',1,0,4,'tt_content','{\"oldRecord\":{\"pi_flexform\":\"<?xml version=\\\"1.0\\\" encoding=\\\"utf-8\\\" standalone=\\\"yes\\\" ?>\\n<T3FlexForms>\\n    <data>\\n        <sheet index=\\\"sDEF\\\">\\n            <language index=\\\"lDEF\\\">\\n                <field index=\\\"settings.persistenceIdentifier\\\">\\n                    <value index=\\\"vDEF\\\">1:\\/form_definitions\\/multiplestepformwithsummary.form.yaml<\\/value>\\n                <\\/field>\\n            <\\/language>\\n        <\\/sheet>\\n    <\\/data>\\n<\\/T3FlexForms>\",\"l18n_diffsource\":\"\"},\"newRecord\":{\"pi_flexform\":\"<?xml version=\\\"1.0\\\" encoding=\\\"utf-8\\\" standalone=\\\"yes\\\" ?>\\n<T3FlexForms>\\n    <data>\\n        <sheet index=\\\"sDEF\\\">\\n            <language index=\\\"lDEF\\\">\\n                <field index=\\\"settings.persistenceIdentifier\\\">\\n                    <value index=\\\"vDEF\\\">1:\\/form_definitions\\/multiplestepformwithsummary.form.yaml<\\/value>\\n                <\\/field>\\n                <field index=\\\"settings.overrideFinishers\\\">\\n                    <value index=\\\"vDEF\\\">0<\\/value>\\n                <\\/field>\\n            <\\/language>\\n        <\\/sheet>\\n    <\\/data>\\n<\\/T3FlexForms>\",\"l18n_diffsource\":\"{\\\"CType\\\":\\\"\\\",\\\"colPos\\\":\\\"\\\",\\\"header\\\":\\\"\\\",\\\"header_layout\\\":\\\"\\\",\\\"header_position\\\":\\\"\\\",\\\"date\\\":\\\"\\\",\\\"header_link\\\":\\\"\\\",\\\"pi_flexform\\\":\\\"\\\",\\\"layout\\\":\\\"\\\",\\\"frame_class\\\":\\\"\\\",\\\"space_before_class\\\":\\\"\\\",\\\"space_after_class\\\":\\\"\\\",\\\"sectionIndex\\\":\\\"\\\",\\\"linkToTop\\\":\\\"\\\",\\\"sys_language_uid\\\":\\\"\\\",\\\"hidden\\\":\\\"\\\",\\\"starttime\\\":\\\"\\\",\\\"endtime\\\":\\\"\\\",\\\"fe_group\\\":\\\"\\\",\\\"editlock\\\":\\\"\\\",\\\"categories\\\":\\\"\\\",\\\"rowDescription\\\":\\\"\\\"}\"}}',0,'0400$3b48a3b224ab1ca8af928a6aaa8ab79a:4d391f5ef79b8d5d10dffa8a07ca167d'),(28,1667063774,1,'BE',1,0,5,'tt_content','{\"uid\":5,\"rowDescription\":\"\",\"pid\":1,\"tstamp\":1667063774,\"crdate\":1667063774,\"cruser_id\":1,\"deleted\":0,\"hidden\":0,\"starttime\":0,\"endtime\":0,\"fe_group\":\"\",\"sorting\":256,\"editlock\":0,\"sys_language_uid\":0,\"l18n_parent\":0,\"l10n_source\":0,\"l10n_state\":null,\"t3_origuid\":0,\"l18n_diffsource\":\"\",\"t3ver_oid\":0,\"t3ver_wsid\":0,\"t3ver_state\":0,\"t3ver_stage\":0,\"CType\":\"header\",\"header\":\"Root Page\",\"header_position\":\"\",\"bodytext\":null,\"bullets_type\":0,\"uploads_description\":0,\"uploads_type\":0,\"assets\":0,\"image\":0,\"imagewidth\":0,\"imageorient\":0,\"imagecols\":2,\"imageborder\":0,\"media\":0,\"layout\":0,\"frame_class\":\"default\",\"cols\":0,\"space_before_class\":\"\",\"space_after_class\":\"\",\"records\":null,\"pages\":null,\"colPos\":0,\"subheader\":\"\",\"header_link\":\"\",\"image_zoom\":0,\"header_layout\":\"0\",\"list_type\":\"\",\"sectionIndex\":1,\"linkToTop\":0,\"file_collections\":null,\"filelink_size\":0,\"filelink_sorting\":\"\",\"filelink_sorting_direction\":\"\",\"target\":\"\",\"date\":0,\"recursive\":0,\"imageheight\":0,\"pi_flexform\":null,\"accessibility_title\":\"\",\"accessibility_bypass\":0,\"accessibility_bypass_text\":\"\",\"category_field\":\"\",\"table_class\":\"\",\"table_caption\":null,\"table_delimiter\":124,\"table_enclosure\":0,\"table_header_position\":0,\"table_tfoot\":0,\"categories\":0,\"selected_categories\":null}',0,'0400$8450da87fa34eae7226a305d7a035b9a:c7626fc9bcba6f70beb6ebc085a400db'),(29,1705135250,1,'BE',1,0,6,'pages','{\"uid\":6,\"pid\":1,\"tstamp\":1705135250,\"crdate\":1705135250,\"deleted\":0,\"hidden\":1,\"starttime\":0,\"endtime\":0,\"fe_group\":\"0\",\"sorting\":896,\"rowDescription\":null,\"editlock\":0,\"sys_language_uid\":0,\"l10n_parent\":0,\"l10n_source\":0,\"l10n_state\":null,\"t3_origuid\":0,\"l10n_diffsource\":\"\",\"t3ver_oid\":0,\"t3ver_wsid\":0,\"t3ver_state\":0,\"t3ver_stage\":0,\"perms_userid\":1,\"perms_groupid\":0,\"perms_user\":31,\"perms_group\":27,\"perms_everybody\":0,\"title\":\"Server Side Validation\",\"slug\":\"\\/server-side-validation\",\"doktype\":1,\"TSconfig\":null,\"is_siteroot\":0,\"php_tree_stop\":0,\"url\":\"\",\"shortcut\":0,\"shortcut_mode\":0,\"subtitle\":\"\",\"layout\":0,\"target\":\"\",\"media\":0,\"lastUpdated\":0,\"keywords\":null,\"cache_timeout\":0,\"cache_tags\":\"\",\"newUntil\":0,\"description\":null,\"no_search\":0,\"SYS_LASTCHANGED\":0,\"abstract\":null,\"module\":\"\",\"extendToSubpages\":0,\"author\":\"\",\"author_email\":\"\",\"nav_title\":\"\",\"nav_hide\":0,\"content_from_pid\":0,\"mount_pid\":0,\"mount_pid_ol\":0,\"l18n_cfg\":0,\"backend_layout\":\"\",\"backend_layout_next_level\":\"\",\"tsconfig_includes\":null,\"categories\":0}',0,'0400$dac0346b6451601f6f69243338541191:c75354c439a48dbde16b03ac553a080d'),(30,1705135253,2,'BE',1,0,6,'pages','{\"oldRecord\":{\"hidden\":1,\"l10n_diffsource\":\"\"},\"newRecord\":{\"hidden\":\"0\",\"l10n_diffsource\":\"{\\\"hidden\\\":\\\"\\\"}\"}}',0,'0400$c86141c131504f32388affb966e69f7d:c75354c439a48dbde16b03ac553a080d'),(31,1705135356,1,'BE',1,0,6,'tt_content','{\"uid\":6,\"rowDescription\":\"\",\"pid\":6,\"tstamp\":1705135356,\"crdate\":1705135356,\"deleted\":0,\"hidden\":0,\"starttime\":0,\"endtime\":0,\"fe_group\":\"\",\"sorting\":256,\"editlock\":0,\"sys_language_uid\":0,\"l18n_parent\":0,\"l10n_source\":0,\"l10n_state\":null,\"t3_origuid\":0,\"l18n_diffsource\":\"\",\"t3ver_oid\":0,\"t3ver_wsid\":0,\"t3ver_state\":0,\"t3ver_stage\":0,\"CType\":\"form_formframework\",\"header\":\"\",\"header_position\":\"\",\"bodytext\":null,\"bullets_type\":0,\"uploads_description\":0,\"uploads_type\":0,\"assets\":0,\"image\":0,\"imagewidth\":0,\"imageorient\":0,\"imagecols\":2,\"imageborder\":0,\"media\":0,\"layout\":0,\"frame_class\":\"default\",\"cols\":0,\"space_before_class\":\"\",\"space_after_class\":\"\",\"records\":null,\"pages\":null,\"colPos\":0,\"subheader\":\"\",\"header_link\":\"\",\"image_zoom\":0,\"header_layout\":\"0\",\"list_type\":\"\",\"sectionIndex\":1,\"linkToTop\":0,\"file_collections\":null,\"filelink_size\":0,\"filelink_sorting\":\"\",\"filelink_sorting_direction\":\"\",\"target\":\"\",\"date\":0,\"recursive\":0,\"imageheight\":0,\"pi_flexform\":\"<?xml version=\\\"1.0\\\" encoding=\\\"utf-8\\\" standalone=\\\"yes\\\" ?>\\n<T3FlexForms>\\n    <data>\\n        <sheet index=\\\"sDEF\\\">\\n            <language index=\\\"lDEF\\\">\\n                <field index=\\\"settings.persistenceIdentifier\\\">\\n                    <value index=\\\"vDEF\\\">1:\\/form_definitions\\/serversidevalidation.form.yaml<\\/value>\\n                <\\/field>\\n            <\\/language>\\n        <\\/sheet>\\n    <\\/data>\\n<\\/T3FlexForms>\",\"accessibility_title\":\"\",\"accessibility_bypass\":0,\"accessibility_bypass_text\":\"\",\"category_field\":\"\",\"table_class\":\"\",\"table_caption\":null,\"table_delimiter\":124,\"table_enclosure\":0,\"table_header_position\":0,\"table_tfoot\":0,\"categories\":0,\"selected_categories\":null}',0,'0400$2a3e84e8db51cbcb75ef894ad1671a32:c0db6803ab1ec5f70c36e2a72187867b'),(32,1705135357,2,'BE',1,0,6,'tt_content','{\"oldRecord\":{\"l18n_diffsource\":\"\"},\"newRecord\":{\"l18n_diffsource\":\"{\\\"CType\\\":\\\"\\\",\\\"colPos\\\":\\\"\\\",\\\"header\\\":\\\"\\\",\\\"header_layout\\\":\\\"\\\",\\\"header_position\\\":\\\"\\\",\\\"date\\\":\\\"\\\",\\\"header_link\\\":\\\"\\\",\\\"subheader\\\":\\\"\\\",\\\"pi_flexform\\\":\\\"\\\",\\\"layout\\\":\\\"\\\",\\\"frame_class\\\":\\\"\\\",\\\"space_before_class\\\":\\\"\\\",\\\"space_after_class\\\":\\\"\\\",\\\"sectionIndex\\\":\\\"\\\",\\\"linkToTop\\\":\\\"\\\",\\\"sys_language_uid\\\":\\\"\\\",\\\"hidden\\\":\\\"\\\",\\\"starttime\\\":\\\"\\\",\\\"endtime\\\":\\\"\\\",\\\"fe_group\\\":\\\"\\\",\\\"editlock\\\":\\\"\\\",\\\"categories\\\":\\\"\\\",\\\"rowDescription\\\":\\\"\\\"}\"}}',0,'0400$7edec14faa0285ba2e8fe0004d90d8be:c0db6803ab1ec5f70c36e2a72187867b');
/*!40000 ALTER TABLE `sys_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `sys_http_report`
--

LOCK TABLES `sys_http_report` WRITE;
/*!40000 ALTER TABLE `sys_http_report` DISABLE KEYS */;
INSERT INTO `sys_http_report` VALUES ('0e887a1f-de1f-4ca4-99db-5412082d921b',0,1721561583,1721561583,'csp-report','backend',1721561583635969,'{\"addr\":\"127.0.0.0\",\"agent\":\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.15; rv:128.0) Gecko\\/20100101 Firefox\\/128.0\"}','{\"blocked-uri\":\"eval\",\"column-number\":1,\"disposition\":\"enforce\",\"document-uri\":\"http:\\/\\/form-crshield-acceptance-v13.typo3.local\\/typo3\\/main\",\"effective-directive\":\"script-src\",\"original-policy\":\"default-src \'self\'; script-src \'self\' \'nonce-vhsqlI0Im01YVl7Xk8O_61fESMaEQUy1LnkiQDw53SucNVxcRoujqQ\' \'report-sample\'; style-src \'self\' \'unsafe-inline\' \'report-sample\'; style-src-attr \'unsafe-inline\' \'report-sample\'; img-src \'self\' data: http:\\/\\/*.ytimg.com http:\\/\\/*.vimeocdn.com https:\\/\\/extensions.typo3.org; worker-src \'self\' blob:; frame-src \'self\' http:\\/\\/*.youtube-nocookie.com http:\\/\\/*.youtube.com http:\\/\\/*.vimeo.com; base-uri \'none\'; object-src \'none\'; report-uri http:\\/\\/form-crshield-acceptance-v13.typo3.local\\/typo3\\/@http-reporting?csp=report&requestTime=1721561583635969\",\"referrer\":\"http:\\/\\/form-crshield-acceptance-v13.typo3.local\\/typo3\\/\",\"script-sample\":\";(function n(e){let t=1e3,n=10;function \\u2026\",\"status-code\":200,\"violated-directive\":\"script-src\"}','3b4e8e75846238b67416529ebd97fb305538b6ad'),('13b6f46d-1530-4444-ab18-8bd6d5cca40a',0,1721561538,1721561538,'csp-report','backend',1721561537984225,'{\"addr\":\"127.0.0.0\",\"agent\":\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.15; rv:128.0) Gecko\\/20100101 Firefox\\/128.0\"}','{\"blocked-uri\":\"eval\",\"column-number\":1,\"disposition\":\"enforce\",\"document-uri\":\"http:\\/\\/form-crshield-acceptance-v13.typo3.local\\/typo3\\/login?\",\"effective-directive\":\"script-src\",\"original-policy\":\"default-src \'self\'; script-src \'self\' \'nonce-Maqcd1_E1PETn_3XhD9pm0tPcb0GFEG54x_rG28uxZGI_uyZXxDzLA\' \'report-sample\'; style-src \'self\' \'unsafe-inline\' \'report-sample\'; style-src-attr \'unsafe-inline\' \'report-sample\'; img-src \'self\' data: http:\\/\\/*.ytimg.com http:\\/\\/*.vimeocdn.com https:\\/\\/extensions.typo3.org; worker-src \'self\' blob:; frame-src \'self\' http:\\/\\/*.youtube-nocookie.com http:\\/\\/*.youtube.com http:\\/\\/*.vimeo.com; base-uri \'none\'; object-src \'none\'; report-uri http:\\/\\/form-crshield-acceptance-v13.typo3.local\\/typo3\\/@http-reporting?csp=report&requestTime=1721561537984225\",\"referrer\":\"\",\"script-sample\":\";(function n(e){let t=1e3,n=10;function \\u2026\",\"status-code\":200,\"violated-directive\":\"script-src\"}','3b4e8e75846238b67416529ebd97fb305538b6ad'),('3956b3c3-5b14-4139-ac64-77c21a9ea349',0,1721561411,1721561411,'csp-report','backend',1721561411568956,'{\"addr\":\"127.0.0.0\",\"agent\":\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.15; rv:128.0) Gecko\\/20100101 Firefox\\/128.0\"}','{\"blocked-uri\":\"eval\",\"column-number\":1,\"disposition\":\"enforce\",\"document-uri\":\"http:\\/\\/form-crshield-acceptance-v13.typo3.local\\/typo3\\/login?\",\"effective-directive\":\"script-src\",\"original-policy\":\"default-src \'self\'; script-src \'self\' \'nonce-8f4KwJ11VYEfmKUVduTQImzQs1a-kj4UetGOV34-R04ZnehBgQTbow\' \'report-sample\'; style-src \'self\' \'unsafe-inline\' \'report-sample\'; style-src-attr \'unsafe-inline\' \'report-sample\'; img-src \'self\' data: http:\\/\\/*.ytimg.com http:\\/\\/*.vimeocdn.com https:\\/\\/extensions.typo3.org; worker-src \'self\' blob:; frame-src \'self\' http:\\/\\/*.youtube-nocookie.com http:\\/\\/*.youtube.com http:\\/\\/*.vimeo.com; base-uri \'none\'; object-src \'none\'; report-uri http:\\/\\/form-crshield-acceptance-v13.typo3.local\\/typo3\\/@http-reporting?csp=report&requestTime=1721561411568956\",\"referrer\":\"\",\"script-sample\":\";(function n(e){let t=1e3,n=10;function \\u2026\",\"status-code\":200,\"violated-directive\":\"script-src\"}','3b4e8e75846238b67416529ebd97fb305538b6ad'),('69a7b6fb-727f-4439-86eb-676c502502d0',0,1721561411,1721561411,'csp-report','backend',1721561411568956,'{\"addr\":\"127.0.0.0\",\"agent\":\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.15; rv:128.0) Gecko\\/20100101 Firefox\\/128.0\"}','{\"blocked-uri\":\"eval\",\"column-number\":1,\"disposition\":\"enforce\",\"document-uri\":\"http:\\/\\/form-crshield-acceptance-v13.typo3.local\\/typo3\\/login?\",\"effective-directive\":\"script-src\",\"original-policy\":\"default-src \'self\'; script-src \'self\' \'nonce-8f4KwJ11VYEfmKUVduTQImzQs1a-kj4UetGOV34-R04ZnehBgQTbow\' \'report-sample\'; style-src \'self\' \'unsafe-inline\' \'report-sample\'; style-src-attr \'unsafe-inline\' \'report-sample\'; img-src \'self\' data: http:\\/\\/*.ytimg.com http:\\/\\/*.vimeocdn.com https:\\/\\/extensions.typo3.org; worker-src \'self\' blob:; frame-src \'self\' http:\\/\\/*.youtube-nocookie.com http:\\/\\/*.youtube.com http:\\/\\/*.vimeo.com; base-uri \'none\'; object-src \'none\'; report-uri http:\\/\\/form-crshield-acceptance-v13.typo3.local\\/typo3\\/@http-reporting?csp=report&requestTime=1721561411568956\",\"referrer\":\"\",\"script-sample\":\";(function n(e,t=!1){const o=\\\"6.0\\\";let r\\u2026\",\"status-code\":200,\"violated-directive\":\"script-src\"}','3aaa2e6dc4519be6ed0dead459b58d1d03a8c63c'),('92b714ab-543d-4cd9-a5dd-37a79c97a21d',0,1721561583,1721561583,'csp-report','backend',1721561583635969,'{\"addr\":\"127.0.0.0\",\"agent\":\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.15; rv:128.0) Gecko\\/20100101 Firefox\\/128.0\"}','{\"blocked-uri\":\"eval\",\"column-number\":1,\"disposition\":\"enforce\",\"document-uri\":\"http:\\/\\/form-crshield-acceptance-v13.typo3.local\\/typo3\\/main\",\"effective-directive\":\"script-src\",\"original-policy\":\"default-src \'self\'; script-src \'self\' \'nonce-vhsqlI0Im01YVl7Xk8O_61fESMaEQUy1LnkiQDw53SucNVxcRoujqQ\' \'report-sample\'; style-src \'self\' \'unsafe-inline\' \'report-sample\'; style-src-attr \'unsafe-inline\' \'report-sample\'; img-src \'self\' data: http:\\/\\/*.ytimg.com http:\\/\\/*.vimeocdn.com https:\\/\\/extensions.typo3.org; worker-src \'self\' blob:; frame-src \'self\' http:\\/\\/*.youtube-nocookie.com http:\\/\\/*.youtube.com http:\\/\\/*.vimeo.com; base-uri \'none\'; object-src \'none\'; report-uri http:\\/\\/form-crshield-acceptance-v13.typo3.local\\/typo3\\/@http-reporting?csp=report&requestTime=1721561583635969\",\"referrer\":\"http:\\/\\/form-crshield-acceptance-v13.typo3.local\\/typo3\\/\",\"script-sample\":\";(function n(e,t=!1){const o=\\\"6.0\\\";let r\\u2026\",\"status-code\":200,\"violated-directive\":\"script-src\"}','3aaa2e6dc4519be6ed0dead459b58d1d03a8c63c'),('9fca62cf-ef71-43a6-a6b0-263dc702a3e8',0,1721561579,1721561579,'csp-report','backend',1721561579794345,'{\"addr\":\"127.0.0.0\",\"agent\":\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.15; rv:128.0) Gecko\\/20100101 Firefox\\/128.0\"}','{\"blocked-uri\":\"eval\",\"column-number\":1,\"disposition\":\"enforce\",\"document-uri\":\"http:\\/\\/form-crshield-acceptance-v13.typo3.local\\/typo3\\/\",\"effective-directive\":\"script-src\",\"original-policy\":\"default-src \'self\'; script-src \'self\' \'nonce-39TZYFcxK8yrbX1txO48fNPx9xuUP3nMN4gWt7qs_aSwFbSIUiaIEA\' \'report-sample\'; style-src \'self\' \'unsafe-inline\' \'report-sample\'; style-src-attr \'unsafe-inline\' \'report-sample\'; img-src \'self\' data: http:\\/\\/*.ytimg.com http:\\/\\/*.vimeocdn.com https:\\/\\/extensions.typo3.org; worker-src \'self\' blob:; frame-src \'self\' http:\\/\\/*.youtube-nocookie.com http:\\/\\/*.youtube.com http:\\/\\/*.vimeo.com; base-uri \'none\'; object-src \'none\'; report-uri http:\\/\\/form-crshield-acceptance-v13.typo3.local\\/typo3\\/@http-reporting?csp=report&requestTime=1721561579794345\",\"referrer\":\"http:\\/\\/form-crshield-acceptance-v13.typo3.local\\/typo3\\/install.php\",\"script-sample\":\";(function n(e){let t=1e3,n=10;function \\u2026\",\"status-code\":200,\"violated-directive\":\"script-src\"}','3b4e8e75846238b67416529ebd97fb305538b6ad'),('a4427dc6-7399-4343-8f88-66283c950961',0,1721561579,1721561579,'csp-report','backend',1721561579794345,'{\"addr\":\"127.0.0.0\",\"agent\":\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.15; rv:128.0) Gecko\\/20100101 Firefox\\/128.0\"}','{\"blocked-uri\":\"eval\",\"column-number\":1,\"disposition\":\"enforce\",\"document-uri\":\"http:\\/\\/form-crshield-acceptance-v13.typo3.local\\/typo3\\/\",\"effective-directive\":\"script-src\",\"original-policy\":\"default-src \'self\'; script-src \'self\' \'nonce-39TZYFcxK8yrbX1txO48fNPx9xuUP3nMN4gWt7qs_aSwFbSIUiaIEA\' \'report-sample\'; style-src \'self\' \'unsafe-inline\' \'report-sample\'; style-src-attr \'unsafe-inline\' \'report-sample\'; img-src \'self\' data: http:\\/\\/*.ytimg.com http:\\/\\/*.vimeocdn.com https:\\/\\/extensions.typo3.org; worker-src \'self\' blob:; frame-src \'self\' http:\\/\\/*.youtube-nocookie.com http:\\/\\/*.youtube.com http:\\/\\/*.vimeo.com; base-uri \'none\'; object-src \'none\'; report-uri http:\\/\\/form-crshield-acceptance-v13.typo3.local\\/typo3\\/@http-reporting?csp=report&requestTime=1721561579794345\",\"referrer\":\"http:\\/\\/form-crshield-acceptance-v13.typo3.local\\/typo3\\/install.php\",\"script-sample\":\";(function n(e,t=!1){const o=\\\"6.0\\\";let r\\u2026\",\"status-code\":200,\"violated-directive\":\"script-src\"}','3aaa2e6dc4519be6ed0dead459b58d1d03a8c63c'),('a4809a34-6813-4036-87dd-d103aa775f7e',0,1721561404,1721561404,'csp-report','backend',1721561403628621,'{\"addr\":\"127.0.0.0\",\"agent\":\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.15; rv:128.0) Gecko\\/20100101 Firefox\\/128.0\"}','{\"blocked-uri\":\"eval\",\"column-number\":1,\"disposition\":\"enforce\",\"document-uri\":\"http:\\/\\/form-crshield-acceptance-v13.typo3.local\\/typo3\\/\",\"effective-directive\":\"script-src\",\"original-policy\":\"default-src \'self\'; script-src \'self\' \'nonce-mtr7NjlZoAeiPKS8R-TWU37lYjK_fnK5yn1EJpjffW6TGVeSZrtGog\' \'report-sample\'; style-src \'self\' \'unsafe-inline\' \'report-sample\'; style-src-attr \'unsafe-inline\' \'report-sample\'; img-src \'self\' data: http:\\/\\/*.ytimg.com http:\\/\\/*.vimeocdn.com https:\\/\\/extensions.typo3.org; worker-src \'self\' blob:; frame-src \'self\' http:\\/\\/*.youtube-nocookie.com http:\\/\\/*.youtube.com http:\\/\\/*.vimeo.com; base-uri \'none\'; object-src \'none\'; report-uri http:\\/\\/form-crshield-acceptance-v13.typo3.local\\/typo3\\/@http-reporting?csp=report&requestTime=1721561403628621\",\"referrer\":\"\",\"script-sample\":\";(function n(e){let t=1e3,n=10;function \\u2026\",\"status-code\":200,\"violated-directive\":\"script-src\"}','3b4e8e75846238b67416529ebd97fb305538b6ad'),('c90f2c94-41a2-424a-85bd-570a9e07debf',0,1721561538,1721561538,'csp-report','backend',1721561537984225,'{\"addr\":\"127.0.0.0\",\"agent\":\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.15; rv:128.0) Gecko\\/20100101 Firefox\\/128.0\"}','{\"blocked-uri\":\"eval\",\"column-number\":1,\"disposition\":\"enforce\",\"document-uri\":\"http:\\/\\/form-crshield-acceptance-v13.typo3.local\\/typo3\\/login?\",\"effective-directive\":\"script-src\",\"original-policy\":\"default-src \'self\'; script-src \'self\' \'nonce-Maqcd1_E1PETn_3XhD9pm0tPcb0GFEG54x_rG28uxZGI_uyZXxDzLA\' \'report-sample\'; style-src \'self\' \'unsafe-inline\' \'report-sample\'; style-src-attr \'unsafe-inline\' \'report-sample\'; img-src \'self\' data: http:\\/\\/*.ytimg.com http:\\/\\/*.vimeocdn.com https:\\/\\/extensions.typo3.org; worker-src \'self\' blob:; frame-src \'self\' http:\\/\\/*.youtube-nocookie.com http:\\/\\/*.youtube.com http:\\/\\/*.vimeo.com; base-uri \'none\'; object-src \'none\'; report-uri http:\\/\\/form-crshield-acceptance-v13.typo3.local\\/typo3\\/@http-reporting?csp=report&requestTime=1721561537984225\",\"referrer\":\"\",\"script-sample\":\";(function n(e,t=!1){const o=\\\"6.0\\\";let r\\u2026\",\"status-code\":200,\"violated-directive\":\"script-src\"}','3aaa2e6dc4519be6ed0dead459b58d1d03a8c63c'),('f6119062-6ec1-44c7-ad78-deaef19615b1',0,1721561403,1721561403,'csp-report','backend',1721561403628621,'{\"addr\":\"127.0.0.0\",\"agent\":\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.15; rv:128.0) Gecko\\/20100101 Firefox\\/128.0\"}','{\"blocked-uri\":\"eval\",\"column-number\":1,\"disposition\":\"enforce\",\"document-uri\":\"http:\\/\\/form-crshield-acceptance-v13.typo3.local\\/typo3\\/\",\"effective-directive\":\"script-src\",\"original-policy\":\"default-src \'self\'; script-src \'self\' \'nonce-mtr7NjlZoAeiPKS8R-TWU37lYjK_fnK5yn1EJpjffW6TGVeSZrtGog\' \'report-sample\'; style-src \'self\' \'unsafe-inline\' \'report-sample\'; style-src-attr \'unsafe-inline\' \'report-sample\'; img-src \'self\' data: http:\\/\\/*.ytimg.com http:\\/\\/*.vimeocdn.com https:\\/\\/extensions.typo3.org; worker-src \'self\' blob:; frame-src \'self\' http:\\/\\/*.youtube-nocookie.com http:\\/\\/*.youtube.com http:\\/\\/*.vimeo.com; base-uri \'none\'; object-src \'none\'; report-uri http:\\/\\/form-crshield-acceptance-v13.typo3.local\\/typo3\\/@http-reporting?csp=report&requestTime=1721561403628621\",\"referrer\":\"\",\"script-sample\":\";(function n(e,t=!1){const o=\\\"6.0\\\";let r\\u2026\",\"status-code\":200,\"violated-directive\":\"script-src\"}','3aaa2e6dc4519be6ed0dead459b58d1d03a8c63c');
/*!40000 ALTER TABLE `sys_http_report` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `sys_lockedrecords`
--

LOCK TABLES `sys_lockedrecords` WRITE;
/*!40000 ALTER TABLE `sys_lockedrecords` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_lockedrecords` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `sys_log`
--

LOCK TABLES `sys_log` WRITE;
/*!40000 ALTER TABLE `sys_log` DISABLE KEYS */;
INSERT INTO `sys_log` VALUES (1,1667048114,1,1,0,'',0,0,'User %s logged in from ###IP###',255,'user',1,'127.0.0.1','[\"admin\"]',-1,-99,'','',0,'','info',NULL,NULL),(2,1667048168,1,1,1,'pages',0,0,'Record \'%s\' (%s) was inserted on page \'%s\' (%s)',1,'content',10,'127.0.0.1','[\"Root\",\"pages:1\",\"[root-level]\",0]',0,0,'NEW_1','',0,'','info',NULL,NULL),(3,1667048168,1,1,0,'site',0,0,'Site configuration \'%s\' was automatically created for new root page (%s).',6,'site',0,'127.0.0.1','[\"autogenerated-1-c4ca4238a0b923820dcc509a6f75849b\",1]',-1,0,'','',0,'','info',NULL,NULL),(4,1667048168,1,2,1,'pages',0,0,'Record \'%s\' (%s) was updated. (Online).',1,'content',10,'127.0.0.1','{\"0\":\"Root\",\"1\":\"pages:1\",\"history\":\"2\"}',1,0,'','',0,'','info',NULL,NULL),(5,1667048170,1,2,1,'pages',0,0,'Record \'%s\' (%s) was updated. (Online).',1,'content',10,'127.0.0.1','{\"0\":\"Root\",\"1\":\"pages:1\",\"history\":\"3\"}',1,0,'','',0,'','info',NULL,NULL),(6,1667048173,1,0,0,'',0,2,'Core: Exception handler (WEB): Uncaught TYPO3 Exception: #1476107295: PHP Warning: touch(): Unable to create file /Users/derhansen/Sites/form-crshield-acceptance-v11.typo3.local/httpdocs/fileadmin/aAbB because No such file or directory in /Users/derhansen/typo3_src/11.5/typo3_src-11.5.16/typo3/sysext/core/Classes/Resource/StorageRepository.php line 312 | TYPO3\\CMS\\Core\\Error\\Exception thrown in file /Users/derhansen/typo3_src/11.5/typo3_src-11.5.16/typo3/sysext/core/Classes/Error/ErrorHandler.php in line 137. Requested URL: http://form-crshield-acceptance-v11.typo3.local/typo3/record/edit?token=--AnonymizedToken--&edit%%5Bpages%%5D%%5B1%%5D=edit&returnUrl=%%2Ftypo3%%2Fmodule%%2Fweb%%2Flayout%%3Ftoken%%3D--AnonymizedToken--%%26id%%3D1',5,'php',0,'127.0.0.1','',-1,0,'','',0,'','info',NULL,NULL),(7,1667048182,1,0,0,'',0,2,'Core: Exception handler (WEB): Uncaught TYPO3 Exception: #1476107295: PHP Warning: touch(): Unable to create file /Users/derhansen/Sites/form-crshield-acceptance-v11.typo3.local/httpdocs/fileadmin/aAbB because No such file or directory in /Users/derhansen/typo3_src/11.5/typo3_src-11.5.16/typo3/sysext/core/Classes/Resource/StorageRepository.php line 312 | TYPO3\\CMS\\Core\\Error\\Exception thrown in file /Users/derhansen/typo3_src/11.5/typo3_src-11.5.16/typo3/sysext/core/Classes/Error/ErrorHandler.php in line 137. Requested URL: http://form-crshield-acceptance-v11.typo3.local/typo3/record/edit?token=--AnonymizedToken--&edit%%5Bpages%%5D%%5B1%%5D=edit&returnUrl=%%2Ftypo3%%2Fmodule%%2Fweb%%2Flayout%%3Ftoken%%3D--AnonymizedToken--%%26id%%3D1',5,'php',0,'127.0.0.1','',-1,0,'','',0,'','info',NULL,NULL),(8,1667048184,1,0,0,'',0,2,'Core: Exception handler (WEB): Uncaught TYPO3 Exception: #1476107295: PHP Warning: touch(): Unable to create file /Users/derhansen/Sites/form-crshield-acceptance-v11.typo3.local/httpdocs/fileadmin/aAbB because No such file or directory in /Users/derhansen/typo3_src/11.5/typo3_src-11.5.16/typo3/sysext/core/Classes/Resource/StorageRepository.php line 312 | TYPO3\\CMS\\Core\\Error\\Exception thrown in file /Users/derhansen/typo3_src/11.5/typo3_src-11.5.16/typo3/sysext/core/Classes/Error/ErrorHandler.php in line 137. Requested URL: http://form-crshield-acceptance-v11.typo3.local/typo3/ajax/filestorage/tree/fetchData?token=--AnonymizedToken--',5,'php',0,'127.0.0.1','',-1,0,'','',0,'','info',NULL,NULL),(9,1667048184,1,0,0,'',0,2,'Core: Exception handler (WEB): Uncaught TYPO3 Exception: #1476107295: PHP Warning: touch(): Unable to create file /Users/derhansen/Sites/form-crshield-acceptance-v11.typo3.local/httpdocs/fileadmin/aAbB because No such file or directory in /Users/derhansen/typo3_src/11.5/typo3_src-11.5.16/typo3/sysext/core/Classes/Resource/StorageRepository.php line 312 | TYPO3\\CMS\\Core\\Error\\Exception thrown in file /Users/derhansen/typo3_src/11.5/typo3_src-11.5.16/typo3/sysext/core/Classes/Error/ErrorHandler.php in line 137. Requested URL: http://form-crshield-acceptance-v11.typo3.local/typo3/module/file/FilelistList?token=--AnonymizedToken--',5,'php',0,'127.0.0.1','',-1,0,'','',0,'','info',NULL,NULL),(10,1667048215,1,2,1,'pages',0,0,'Record \'%s\' (%s) was updated. (Online).',1,'content',10,'127.0.0.1','{\"0\":\"Root\",\"1\":\"pages:1\",\"history\":\"4\"}',1,0,'','',0,'','info',NULL,NULL),(11,1667048224,1,0,0,'',0,2,'Core: Exception handler (WEB): Uncaught TYPO3 Exception: #1294587218: No TypoScript template found! | TYPO3\\CMS\\Core\\Error\\Http\\InternalServerErrorException thrown in file /Users/derhansen/typo3_src/11.5/typo3_src-11.5.16/typo3/sysext/frontend/Classes/Controller/TypoScriptFrontendController.php in line 1909. Requested URL: http://form-crshield-acceptance-v11.typo3.local/autogenerated-1/',5,'php',0,'127.0.0.1','',-1,0,'','',0,'','info',NULL,NULL),(12,1667048285,1,1,1,'sys_template',0,0,'Record \'%s\' (%s) was inserted on page \'%s\' (%s)',1,'content',10,'127.0.0.1','[\"NEW SITE\",\"sys_template:1\",\"Root\",1]',1,0,'NEW','',0,'','info',NULL,NULL),(13,1667048291,1,2,1,'sys_template',0,0,'Record \'%s\' (%s) was updated. (Online).',1,'content',10,'127.0.0.1','{\"0\":\"NEW SITE\",\"1\":\"sys_template:1\",\"history\":\"6\"}',1,0,'','',0,'','info',NULL,NULL),(14,1667048305,1,2,1,'pages',0,0,'Record \'%s\' (%s) was updated. (Online).',1,'content',10,'127.0.0.1','{\"0\":\"Root\",\"1\":\"pages:1\",\"history\":0}',1,0,'','',0,'','info',NULL,NULL),(15,1667048325,1,3,0,'site',0,0,'Site configuration \'%s\' was renamed to \'%s\'.',6,'site',0,'127.0.0.1','[\"autogenerated-1-c4ca4238a0b923820dcc509a6f75849b\",\"form-chshield\"]',-1,0,'','',0,'','info',NULL,NULL),(16,1667048325,1,2,0,'site',0,0,'Site configuration \'%s\' was updated.',6,'site',0,'127.0.0.1','[\"form-chshield\"]',-1,0,'','',0,'','info',NULL,NULL),(17,1667048345,1,1,2,'pages',0,0,'Record \'%s\' (%s) was inserted on page \'%s\' (%s)',1,'content',10,'127.0.0.1','[\"Simple form\",\"pages:2\",\"Root\",1]',1,0,'NEW_1','',0,'','info',NULL,NULL),(18,1667048347,1,2,2,'pages',0,0,'Record \'%s\' (%s) was updated. (Online).',1,'content',10,'127.0.0.1','{\"0\":\"Simple form\",\"1\":\"pages:2\",\"history\":\"8\"}',2,0,'','',0,'','info',NULL,NULL),(19,1667048357,1,1,3,'pages',0,0,'Record \'%s\' (%s) was inserted on page \'%s\' (%s)',1,'content',10,'127.0.0.1','[\"Simple form with summary\",\"pages:3\",\"Root\",1]',1,0,'NEW_1','',0,'','info',NULL,NULL),(20,1667048361,1,2,3,'pages',0,0,'Record \'%s\' (%s) was updated. (Online).',1,'content',10,'127.0.0.1','{\"0\":\"Simple form with summary\",\"1\":\"pages:3\",\"history\":\"10\"}',3,0,'','',0,'','info',NULL,NULL),(21,1667048370,1,1,4,'pages',0,0,'Record \'%s\' (%s) was inserted on page \'%s\' (%s)',1,'content',10,'127.0.0.1','[\"Multiple step form\",\"pages:4\",\"Root\",1]',1,0,'NEW_1','',0,'','info',NULL,NULL),(22,1667048373,1,2,4,'pages',0,0,'Record \'%s\' (%s) was updated. (Online).',1,'content',10,'127.0.0.1','{\"0\":\"Multiple step form\",\"1\":\"pages:4\",\"history\":\"12\"}',4,0,'','',0,'','info',NULL,NULL),(23,1667048489,1,1,1,'tt_content',0,0,'Record \'%s\' (%s) was inserted on page \'%s\' (%s)',1,'content',10,'127.0.0.1','[\"[No title]\",\"tt_content:1\",\"Simple form\",2]',2,0,'NEW635d2425a2f40804507412','',0,'','info',NULL,NULL),(24,1667048491,1,2,1,'tt_content',0,0,'Record \'%s\' (%s) was updated. (Online).',1,'content',10,'127.0.0.1','{\"0\":\"[No title]\",\"1\":\"tt_content:1\",\"history\":\"14\"}',2,0,'','',0,'','info',NULL,NULL),(25,1667048507,1,2,1,'sys_template',0,0,'Record \'%s\' (%s) was updated. (Online).',1,'content',10,'127.0.0.1','{\"0\":\"NEW SITE\",\"1\":\"sys_template:1\",\"history\":\"15\"}',1,0,'','',0,'','info',NULL,NULL),(26,1667048534,1,2,1,'sys_template',0,0,'Record \'%s\' (%s) was updated. (Online).',1,'content',10,'127.0.0.1','{\"0\":\"NEW SITE\",\"1\":\"sys_template:1\",\"history\":\"16\"}',1,0,'','',0,'','info',NULL,NULL),(27,1667048609,1,1,2,'tt_content',0,0,'Record \'%s\' (%s) was inserted on page \'%s\' (%s)',1,'content',10,'127.0.0.1','[\"[No title]\",\"tt_content:2\",\"Simple form with summary\",3]',3,0,'NEW635d249d707c8430906761','',0,'','info',NULL,NULL),(28,1667048610,1,2,2,'tt_content',0,0,'Record \'%s\' (%s) was updated. (Online).',1,'content',10,'127.0.0.1','{\"0\":\"[No title]\",\"1\":\"tt_content:2\",\"history\":\"18\"}',3,0,'','',0,'','info',NULL,NULL),(29,1667048754,1,1,3,'tt_content',0,0,'Record \'%s\' (%s) was inserted on page \'%s\' (%s)',1,'content',10,'127.0.0.1','[\"[No title]\",\"tt_content:3\",\"Multiple step form\",4]',4,0,'NEW635d252ca5020932726892','',0,'','info',NULL,NULL),(30,1667048755,1,2,3,'tt_content',0,0,'Record \'%s\' (%s) was updated. (Online).',1,'content',10,'127.0.0.1','{\"0\":\"[No title]\",\"1\":\"tt_content:3\",\"history\":\"20\"}',4,0,'','',0,'','info',NULL,NULL),(31,1667048774,1,1,5,'pages',0,0,'Record \'%s\' (%s) was inserted on page \'%s\' (%s)',1,'content',10,'127.0.0.1','[\"Multiple step form with summary\",\"pages:5\",\"Multiple step form\",4]',4,0,'NEW_1','',0,'','info',NULL,NULL),(32,1667048781,1,4,5,'pages',0,0,'Moved record \'%s\' (%s) to page \'%s\' (%s)',1,'content',2,'127.0.0.1','[\"Multiple step form with summary\",\"pages:5\",\"Root\",1]',4,0,'','',0,'','info',NULL,NULL),(33,1667048781,1,4,5,'pages',0,0,'Moved record \'%s\' (%s) from page \'%s\' (%s)',1,'content',3,'127.0.0.1','[\"Multiple step form with summary\",\"pages:5\",\"Multiple step form\",4]',1,0,'','',0,'','info',NULL,NULL),(34,1667048784,1,4,4,'pages',0,0,'Moved record \'%s\' (%s) on page \'%s\' (%s)',1,'content',4,'127.0.0.1','[\"Multiple step form\",\"pages:4\",\"Root\",1]',1,0,'','',0,'','info',NULL,NULL),(35,1667048789,1,2,5,'pages',0,0,'Record \'%s\' (%s) was updated. (Online).',1,'content',10,'127.0.0.1','{\"0\":\"Multiple step form with summary\",\"1\":\"pages:5\",\"history\":\"24\"}',5,0,'','',0,'','info',NULL,NULL),(36,1667048792,1,2,5,'pages',0,0,'Record \'%s\' (%s) was updated. (Online).',1,'content',10,'127.0.0.1','{\"0\":\"Multiple step form with summary\",\"1\":\"pages:5\",\"history\":\"25\"}',5,0,'','',0,'','info',NULL,NULL),(37,1667048825,1,1,4,'tt_content',0,0,'Record \'%s\' (%s) was inserted on page \'%s\' (%s)',1,'content',10,'127.0.0.1','[\"[No title]\",\"tt_content:4\",\"Multiple step form with summary\",5]',5,0,'NEW635d2574487f2257624652','',0,'','info',NULL,NULL),(38,1667048826,1,2,4,'tt_content',0,0,'Record \'%s\' (%s) was updated. (Online).',1,'content',10,'127.0.0.1','{\"0\":\"[No title]\",\"1\":\"tt_content:4\",\"history\":\"27\"}',5,0,'','',0,'','info',NULL,NULL),(39,1667063774,1,1,5,'tt_content',0,0,'Record \'%s\' (%s) was inserted on page \'%s\' (%s)',1,'content',10,'127.0.0.1','[\"Root Page\",\"tt_content:5\",\"Root\",1]',1,0,'NEW635d5fdb52e50905076950','',0,'','info',NULL,NULL),(40,1682509286,1,1,0,'',0,0,'User %s logged in from ###IP###',255,'user',1,'127.0.0.1','[\"admin\"]',-1,-99,'','',0,'','info',NULL,NULL),(41,1682509297,1,2,0,'site',0,0,'Site configuration \'%s\' was updated.',6,'site',0,'127.0.0.1','[\"form-chshield\"]',-1,0,'','',0,'','info',NULL,NULL),(42,1682509424,1,0,0,'',0,2,'Core: Exception handler (WEB): Uncaught TYPO3 Exception: #1257246929: Tried resolving a template file for controller action \"Standard->index\" in format \".html\", but none of the paths contained the expected template file (/Users/derhansen/Sites/form-crshield-acceptance-v12.typo3.local/httpdocs/typo3/sysext/backend/Resources/Private/Templates/ModuleMenu/Main.html). No paths configured. | TYPO3Fluid\\Fluid\\View\\Exception\\InvalidTemplateResourceException thrown in file /Users/derhansen/typo3_src/11.5/typo3_src-11.5.24/vendor/typo3fluid/fluid/src/View/TemplatePaths.php in line 594. Requested URL: http://form-crshield-acceptance-v12.typo3.local/typo3/main?token=--AnonymizedToken--&redirect=site_configuration&redirectParams=action%%3Doverview',5,'php',0,'127.0.0.1','',-1,0,'','',0,'','info',NULL,NULL),(43,1682509486,0,0,0,'',0,2,'Core: Exception handler (WEB): Uncaught TYPO3 Exception: #1476107295: PHP Warning: rename(/Users/derhansen/Sites/form-crshield-acceptance-v12.typo3.local/httpdocs/typo3temp/var/cache/code/di/,/Users/derhansen/Sites/form-crshield-acceptance-v12.typo3.local/httpdocs/typo3temp/var/cache/code/di.remove64490eb00bfb5506401447): No such file or directory in /Users/derhansen/typo3_src/12.4/typo3_src-12.4.0/typo3/sysext/core/Classes/Cache/Backend/SimpleFileBackend.php line 314 | TYPO3\\CMS\\Core\\Error\\Exception thrown in file /Users/derhansen/typo3_src/12.4/typo3_src-12.4.0/typo3/sysext/core/Classes/Error/ErrorHandler.php in line 138. Requested URL: http://form-crshield-acceptance-v12.typo3.local/typo3/install.php?install[controller]=upgrade&install[context]=&install[action]=upgradeWizardsBlockingDatabaseAdds',5,'php',0,'127.0.0.1','',-1,0,'','',0,'','info',NULL,NULL),(44,1682509710,1,1,0,'',0,0,'User %s logged in from ###IP###',255,'user',1,'127.0.0.1','[\"admin\"]',-1,-99,'','',0,'','info',NULL,NULL),(45,1705134911,1,1,0,'',0,0,'User %s logged in from ###IP###',255,'user',1,'127.0.0.1','[\"admin\"]',-1,-99,'','',0,'','info',NULL,NULL),(46,1705135250,1,1,6,'pages',0,0,'Record \"{title}\" ({table}:{uid}) was inserted on page \"{pageTitle}\" ({pid})',1,'content',10,'127.0.0.1','{\"title\":\"Server Side Validation\",\"table\":\"pages\",\"uid\":6,\"pageTitle\":\"Root\",\"pid\":1}',1,0,'NEW_1','',0,'','info',NULL,NULL),(47,1705135253,1,2,6,'pages',0,0,'Record \"{title}\" ({table}:{uid}) was updated',1,'content',10,'127.0.0.1','{\"title\":\"Server Side Validation\",\"table\":\"pages\",\"uid\":6,\"history\":\"30\"}',6,0,'','',0,'','info',NULL,NULL),(48,1705135356,1,1,6,'tt_content',0,0,'Record \"{title}\" ({table}:{uid}) was inserted on page \"{pageTitle}\" ({pid})',1,'content',10,'127.0.0.1','{\"title\":\"[No title]\",\"table\":\"tt_content\",\"uid\":6,\"pageTitle\":\"Server Side Validation\",\"pid\":6}',6,0,'NEW65a24cf6b6129018619353','',0,'','info',NULL,NULL),(49,1705135357,1,2,6,'tt_content',0,0,'Record \"{title}\" ({table}:{uid}) was updated',1,'content',10,'127.0.0.1','{\"title\":\"[No title]\",\"table\":\"tt_content\",\"uid\":6,\"history\":\"32\"}',6,0,'','',0,'','info',NULL,NULL),(50,1705136018,1,1,0,'',0,0,'User {username} has cleared the cache (cacheCmd={command})',3,'default',0,'127.0.0.1','{\"username\":\"admin\",\"command\":\"all\"}',-1,0,'','',0,'','info',NULL,NULL),(51,1721561406,0,0,0,'',0,2,'Core: Exception handler (WEB): Uncaught TYPO3 Exception: Cannot assign null to property Doctrine\\DBAL\\Schema\\Column::$_comment of type string | TypeError thrown in file /Users/derhansen/typo3_src/13.4/typo3_src-13.2.1/typo3/sysext/core/Classes/Cache/Frontend/VariableFrontend.php in line 85. Requested URL: http://form-crshield-acceptance-v13.typo3.local/typo3/login?loginProvider=1433416747',5,'php',0,'127.0.0.1','',-1,-99,'','',0,'','error',NULL,NULL),(52,1721561583,1,1,0,'',0,0,'User %s logged in from ###IP###',255,'user',1,'127.0.0.1','[\"admin\"]',-1,-99,'','',0,'','info',NULL,NULL),(53,1721561608,1,2,0,'site',0,0,'Site configuration \'%s\' was updated.',6,'site',0,'127.0.0.1','[\"form-chshield\"]',-1,0,'','',0,'','info',NULL,NULL);
/*!40000 ALTER TABLE `sys_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `sys_messenger_messages`
--

LOCK TABLES `sys_messenger_messages` WRITE;
/*!40000 ALTER TABLE `sys_messenger_messages` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_messenger_messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `sys_news`
--

LOCK TABLES `sys_news` WRITE;
/*!40000 ALTER TABLE `sys_news` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_news` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `sys_refindex`
--

LOCK TABLES `sys_refindex` WRITE;
/*!40000 ALTER TABLE `sys_refindex` DISABLE KEYS */;
INSERT INTO `sys_refindex` VALUES ('0bf363f198352c1f251386c0a559f6ac','sys_file',3,'metadata','','','',0,0,'sys_file_metadata',3,'',0,0,2147483647,0,'',0,0,2147483647,0,0),('1c9b8784c1518ef7b22704c4fc698ca9','sys_file',2,'storage','','','',0,0,'sys_file_storage',1,'',0,0,2147483647,0,'',0,0,2147483647,0,0),('24d47b29aa969cf4db8635e76dd1c386','sys_file',3,'storage','','','',0,0,'sys_file_storage',1,'',0,0,2147483647,0,'',0,0,2147483647,0,0),('39433ea4a82060704109046e4828d3c8','sys_file',1,'storage','','','',0,0,'sys_file_storage',1,'',0,0,2147483647,0,'',0,0,2147483647,0,0),('5041e5cb9e189c2e0430a1e0aced5d29','tt_content',1,'pi_flexform','sDEF/lDEF/settings.persistenceIdentifier/vDEF/','formPersistenceIdentifier','ff0a0811a2714d13cd3adaf006b02709',-1,0,'sys_file',1,'',0,0,2147483647,0,'',0,0,2147483647,0,0),('749b0771828793d3e3eba1372852a7a8','sys_file',2,'metadata','','','',0,0,'sys_file_metadata',2,'',0,0,2147483647,0,'',0,0,2147483647,0,0),('791d3f9d43dcbfa78cd49dd8258caa09','sys_file',5,'storage','','','',0,0,'sys_file_storage',1,'',0,0,2147483647,0,'',0,0,2147483647,0,0),('8987893411baca05f986dca0a4c38bd8','sys_file',5,'metadata','','','',0,0,'sys_file_metadata',5,'',0,0,2147483647,0,'',0,0,2147483647,0,0),('9e6c2eb663cb44fbaed89d6190923a01','tt_content',6,'pi_flexform','sDEF/lDEF/settings.persistenceIdentifier/vDEF/','formPersistenceIdentifier','d0b61346a504b1f6d714ee5d3961c569',-1,0,'sys_file',5,'',0,0,2147483647,0,'',0,0,2147483647,0,0),('bab37143de5339e474516691bf0c5857','sys_file',4,'storage','','','',0,0,'sys_file_storage',1,'',0,0,2147483647,0,'',0,0,2147483647,0,0),('ddc26b8e87d88437258b643c95236b28','tt_content',2,'pi_flexform','sDEF/lDEF/settings.persistenceIdentifier/vDEF/','formPersistenceIdentifier','85cb0a48f70f1686ad14b00e18f1c167',-1,0,'sys_file',2,'',0,0,2147483647,0,'',0,0,2147483647,0,0),('ec01e9666331703a2215b40555f23bf6','sys_file',4,'metadata','','','',0,0,'sys_file_metadata',4,'',0,0,2147483647,0,'',0,0,2147483647,0,0),('f898c544320f3af6bf6a8ca23fb7d434','tt_content',3,'pi_flexform','sDEF/lDEF/settings.persistenceIdentifier/vDEF/','formPersistenceIdentifier','e4588e70299698b29e09cc9b5d0a953d',-1,0,'sys_file',3,'',0,0,2147483647,0,'',0,0,2147483647,0,0),('fd751ad337dbe22f7106b515d9475ec7','tt_content',4,'pi_flexform','sDEF/lDEF/settings.persistenceIdentifier/vDEF/','formPersistenceIdentifier','2e944e27579ca15008cad76e9a5f844e',-1,0,'sys_file',4,'',0,0,2147483647,0,'',0,0,2147483647,0,0),('fe80a6589cac9798aa13ab5e0192cb56','sys_file',1,'metadata','','','',0,0,'sys_file_metadata',1,'',0,0,2147483647,0,'',0,0,2147483647,0,0);
/*!40000 ALTER TABLE `sys_refindex` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `sys_registry`
--

LOCK TABLES `sys_registry` WRITE;
/*!40000 ALTER TABLE `sys_registry` DISABLE KEYS */;
INSERT INTO `sys_registry` VALUES (1,'core','formProtectionSessionToken:1',_binary 's:64:\"cffba6cb3fc5e8eeac56abfd06875767ec96839114fc1ff721b0b1e885ffd8e0\";'),(2,'extensionDataImport','typo3/sysext/form/ext_tables_static+adt.sql',_binary 's:0:\"\";'),(3,'extensionDataImport','typo3/sysext/tstemplate/ext_tables_static+adt.sql',_binary 's:0:\"\";'),(4,'extensionDataImport','typo3/sysext/fluid_styled_content/ext_tables_static+adt.sql',_binary 's:0:\"\";'),(5,'extensionDataImport','typo3conf/ext/form_crshield/ext_tables_static+adt.sql',_binary 's:0:\"\";'),(6,'installUpdate','TYPO3\\CMS\\Install\\Updates\\BackendUserLanguageMigration',_binary 'i:1;'),(8,'installUpdateRows','rowUpdatersDone',_binary 'a:4:{i:0;s:66:\"TYPO3\\CMS\\Install\\Updates\\RowUpdater\\L18nDiffsourceToJsonMigration\";i:1;s:77:\"TYPO3\\CMS\\Install\\Updates\\RowUpdater\\WorkspaceMovePlaceholderRemovalMigration\";i:2;s:76:\"TYPO3\\CMS\\Install\\Updates\\RowUpdater\\WorkspaceNewPlaceholderRemovalMigration\";i:3;s:69:\"TYPO3\\CMS\\Install\\Updates\\RowUpdater\\SysRedirectRootPageMoveMigration\";}'),(9,'installUpdate','TYPO3\\CMS\\Install\\Updates\\PasswordPolicyForFrontendUsersUpdate',_binary 'i:1;'),(10,'installUpdate','TYPO3\\CMS\\Install\\Updates\\SvgFilesSanitization',_binary 'i:1;'),(11,'installUpdate','TYPO3\\CMS\\Install\\Updates\\SysLogSerializationUpdate',_binary 'i:1;');
/*!40000 ALTER TABLE `sys_registry` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `sys_template`
--

LOCK TABLES `sys_template` WRITE;
/*!40000 ALTER TABLE `sys_template` DISABLE KEYS */;
INSERT INTO `sys_template` VALUES (1,1,1667048534,1667048285,0,0,0,0,256,NULL,'NEW SITE',1,3,'EXT:fluid_styled_content/Configuration/TypoScript/,EXT:form/Configuration/TypoScript/',NULL,'page = PAGE\r\npage.10 < styles.content.get','',0,0);
/*!40000 ALTER TABLE `sys_template` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `tt_content`
--

LOCK TABLES `tt_content` WRITE;
/*!40000 ALTER TABLE `tt_content` DISABLE KEYS */;
INSERT INTO `tt_content` VALUES (1,'',2,1667048491,1667048489,0,0,0,0,'',256,0,0,0,0,NULL,_binary '{\"CType\":\"\",\"colPos\":\"\",\"header\":\"\",\"header_layout\":\"\",\"header_position\":\"\",\"date\":\"\",\"header_link\":\"\",\"pi_flexform\":\"\",\"layout\":\"\",\"frame_class\":\"\",\"space_before_class\":\"\",\"space_after_class\":\"\",\"sectionIndex\":\"\",\"linkToTop\":\"\",\"sys_language_uid\":\"\",\"hidden\":\"\",\"starttime\":\"\",\"endtime\":\"\",\"fe_group\":\"\",\"editlock\":\"\",\"categories\":\"\",\"rowDescription\":\"\"}',0,0,0,0,'form_formframework','','',NULL,0,0,0,0,0,0,0,2,0,0,0,'default',0,'','',NULL,NULL,0,'','',0,0,'',1,0,NULL,0,'','','',0,0,0,'<?xml version=\"1.0\" encoding=\"utf-8\" standalone=\"yes\" ?>\n<T3FlexForms>\n    <data>\n        <sheet index=\"sDEF\">\n            <language index=\"lDEF\">\n                <field index=\"settings.persistenceIdentifier\">\n                    <value index=\"vDEF\">1:/form_definitions/simpleform.form.yaml</value>\n                </field>\n            </language>\n        </sheet>\n    </data>\n</T3FlexForms>','',0,'','','',NULL,124,0,0,0,0,NULL),(2,'',3,1667048610,1667048609,0,0,0,0,'',256,0,0,0,0,NULL,_binary '{\"CType\":\"\",\"colPos\":\"\",\"header\":\"\",\"header_layout\":\"\",\"header_position\":\"\",\"date\":\"\",\"header_link\":\"\",\"pi_flexform\":\"\",\"layout\":\"\",\"frame_class\":\"\",\"space_before_class\":\"\",\"space_after_class\":\"\",\"sectionIndex\":\"\",\"linkToTop\":\"\",\"sys_language_uid\":\"\",\"hidden\":\"\",\"starttime\":\"\",\"endtime\":\"\",\"fe_group\":\"\",\"editlock\":\"\",\"categories\":\"\",\"rowDescription\":\"\"}',0,0,0,0,'form_formframework','','',NULL,0,0,0,0,0,0,0,2,0,0,0,'default',0,'','',NULL,NULL,0,'','',0,0,'',1,0,NULL,0,'','','',0,0,0,'<?xml version=\"1.0\" encoding=\"utf-8\" standalone=\"yes\" ?>\n<T3FlexForms>\n    <data>\n        <sheet index=\"sDEF\">\n            <language index=\"lDEF\">\n                <field index=\"settings.persistenceIdentifier\">\n                    <value index=\"vDEF\">1:/form_definitions/simpleformwithsummary.form.yaml</value>\n                </field>\n                <field index=\"settings.overrideFinishers\">\n                    <value index=\"vDEF\">0</value>\n                </field>\n            </language>\n        </sheet>\n    </data>\n</T3FlexForms>','',0,'','','',NULL,124,0,0,0,0,NULL),(3,'',4,1667048755,1667048754,0,0,0,0,'',256,0,0,0,0,NULL,_binary '{\"CType\":\"\",\"colPos\":\"\",\"header\":\"\",\"header_layout\":\"\",\"header_position\":\"\",\"date\":\"\",\"header_link\":\"\",\"pi_flexform\":\"\",\"layout\":\"\",\"frame_class\":\"\",\"space_before_class\":\"\",\"space_after_class\":\"\",\"sectionIndex\":\"\",\"linkToTop\":\"\",\"sys_language_uid\":\"\",\"hidden\":\"\",\"starttime\":\"\",\"endtime\":\"\",\"fe_group\":\"\",\"editlock\":\"\",\"categories\":\"\",\"rowDescription\":\"\"}',0,0,0,0,'form_formframework','','',NULL,0,0,0,0,0,0,0,2,0,0,0,'default',0,'','',NULL,NULL,0,'','',0,0,'',1,0,NULL,0,'','','',0,0,0,'<?xml version=\"1.0\" encoding=\"utf-8\" standalone=\"yes\" ?>\n<T3FlexForms>\n    <data>\n        <sheet index=\"sDEF\">\n            <language index=\"lDEF\">\n                <field index=\"settings.persistenceIdentifier\">\n                    <value index=\"vDEF\">1:/form_definitions/multiplestepform.form.yaml</value>\n                </field>\n                <field index=\"settings.overrideFinishers\">\n                    <value index=\"vDEF\">0</value>\n                </field>\n            </language>\n        </sheet>\n    </data>\n</T3FlexForms>','',0,'','','',NULL,124,0,0,0,0,NULL),(4,'',5,1667048826,1667048825,0,0,0,0,'',256,0,0,0,0,NULL,_binary '{\"CType\":\"\",\"colPos\":\"\",\"header\":\"\",\"header_layout\":\"\",\"header_position\":\"\",\"date\":\"\",\"header_link\":\"\",\"pi_flexform\":\"\",\"layout\":\"\",\"frame_class\":\"\",\"space_before_class\":\"\",\"space_after_class\":\"\",\"sectionIndex\":\"\",\"linkToTop\":\"\",\"sys_language_uid\":\"\",\"hidden\":\"\",\"starttime\":\"\",\"endtime\":\"\",\"fe_group\":\"\",\"editlock\":\"\",\"categories\":\"\",\"rowDescription\":\"\"}',0,0,0,0,'form_formframework','','',NULL,0,0,0,0,0,0,0,2,0,0,0,'default',0,'','',NULL,NULL,0,'','',0,0,'',1,0,NULL,0,'','','',0,0,0,'<?xml version=\"1.0\" encoding=\"utf-8\" standalone=\"yes\" ?>\n<T3FlexForms>\n    <data>\n        <sheet index=\"sDEF\">\n            <language index=\"lDEF\">\n                <field index=\"settings.persistenceIdentifier\">\n                    <value index=\"vDEF\">1:/form_definitions/multiplestepformwithsummary.form.yaml</value>\n                </field>\n                <field index=\"settings.overrideFinishers\">\n                    <value index=\"vDEF\">0</value>\n                </field>\n            </language>\n        </sheet>\n    </data>\n</T3FlexForms>','',0,'','','',NULL,124,0,0,0,0,NULL),(5,'',1,1667063774,1667063774,0,0,0,0,'',256,0,0,0,0,NULL,'',0,0,0,0,'header','Root Page','',NULL,0,0,0,0,0,0,0,2,0,0,0,'default',0,'','',NULL,NULL,0,'','',0,0,'',1,0,NULL,0,'','','',0,0,0,NULL,'',0,'','','',NULL,124,0,0,0,0,NULL),(6,'',6,1705135357,1705135356,0,0,0,0,'',256,0,0,0,0,NULL,_binary '{\"CType\":\"\",\"colPos\":\"\",\"header\":\"\",\"header_layout\":\"\",\"header_position\":\"\",\"date\":\"\",\"header_link\":\"\",\"subheader\":\"\",\"pi_flexform\":\"\",\"layout\":\"\",\"frame_class\":\"\",\"space_before_class\":\"\",\"space_after_class\":\"\",\"sectionIndex\":\"\",\"linkToTop\":\"\",\"sys_language_uid\":\"\",\"hidden\":\"\",\"starttime\":\"\",\"endtime\":\"\",\"fe_group\":\"\",\"editlock\":\"\",\"categories\":\"\",\"rowDescription\":\"\"}',0,0,0,0,'form_formframework','','',NULL,0,0,0,0,0,0,0,2,0,0,0,'default',0,'','',NULL,NULL,0,'','',0,0,'',1,0,NULL,0,'','','',0,0,0,'<?xml version=\"1.0\" encoding=\"utf-8\" standalone=\"yes\" ?>\n<T3FlexForms>\n    <data>\n        <sheet index=\"sDEF\">\n            <language index=\"lDEF\">\n                <field index=\"settings.persistenceIdentifier\">\n                    <value index=\"vDEF\">1:/form_definitions/serversidevalidation.form.yaml</value>\n                </field>\n            </language>\n        </sheet>\n    </data>\n</T3FlexForms>','',0,'','','',NULL,124,0,0,0,0,NULL);
/*!40000 ALTER TABLE `tt_content` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `tx_extensionmanager_domain_model_extension`
--

LOCK TABLES `tx_extensionmanager_domain_model_extension` WRITE;
/*!40000 ALTER TABLE `tx_extensionmanager_domain_model_extension` DISABLE KEYS */;
/*!40000 ALTER TABLE `tx_extensionmanager_domain_model_extension` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-07-21 13:44:21
