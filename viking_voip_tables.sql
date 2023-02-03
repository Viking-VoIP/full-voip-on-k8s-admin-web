--

LOCK TABLES `re_grp` WRITE;
/*!40000 ALTER TABLE `re_grp` DISABLE KEYS */;
/*!40000 ALTER TABLE `re_grp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rtpengine`
--

DROP TABLE IF EXISTS `rtpengine`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rtpengine` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `setid` int(10) unsigned NOT NULL DEFAULT '0',
  `url` varchar(64) NOT NULL,
  `weight` int(10) unsigned NOT NULL DEFAULT '1',
  `disabled` int(1) NOT NULL DEFAULT '0',
  `stamp` datetime NOT NULL DEFAULT '1900-01-01 00:00:01',
  PRIMARY KEY (`id`),
  UNIQUE KEY `rtpengine_nodes` (`setid`,`url`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rtpengine`
--

LOCK TABLES `rtpengine` WRITE;
/*!40000 ALTER TABLE `rtpengine` DISABLE KEYS */;
/*!40000 ALTER TABLE `rtpengine` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rtpproxy`
--

DROP TABLE IF EXISTS `rtpproxy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rtpproxy` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `setid` varchar(32) NOT NULL DEFAULT '0',
  `url` varchar(64) NOT NULL DEFAULT '',
  `flags` int(11) NOT NULL DEFAULT '0',
  `weight` int(11) NOT NULL DEFAULT '1',
  `description` varchar(64) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rtpproxy`
--

LOCK TABLES `rtpproxy` WRITE;
/*!40000 ALTER TABLE `rtpproxy` DISABLE KEYS */;
/*!40000 ALTER TABLE `rtpproxy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sca_subscriptions`
--

DROP TABLE IF EXISTS `sca_subscriptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sca_subscriptions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `subscriber` varchar(255) NOT NULL,
  `aor` varchar(255) NOT NULL,
  `event` int(11) NOT NULL DEFAULT '0',
  `expires` int(11) NOT NULL DEFAULT '0',
  `state` int(11) NOT NULL DEFAULT '0',
  `app_idx` int(11) NOT NULL DEFAULT '0',
  `call_id` varchar(255) NOT NULL,
  `from_tag` varchar(128) NOT NULL,
  `to_tag` varchar(128) NOT NULL,
  `record_route` text,
  `notify_cseq` int(11) NOT NULL,
  `subscribe_cseq` int(11) NOT NULL,
  `server_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `sca_subscriptions_idx` (`subscriber`,`call_id`,`from_tag`,`to_tag`),
  KEY `sca_expires_idx` (`server_id`,`expires`),
  KEY `sca_subscribers_idx` (`subscriber`,`event`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sca_subscriptions`
--

LOCK TABLES `sca_subscriptions` WRITE;
/*!40000 ALTER TABLE `sca_subscriptions` DISABLE KEYS */;
/*!40000 ALTER TABLE `sca_subscriptions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `secfilter`
--

DROP TABLE IF EXISTS `secfilter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `secfilter` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `action` smallint(6) NOT NULL DEFAULT '0',
  `type` smallint(6) NOT NULL DEFAULT '0',
  `data` varchar(64) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `secfilter_idx` (`action`,`type`,`data`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `secfilter`
--

LOCK TABLES `secfilter` WRITE;
/*!40000 ALTER TABLE `secfilter` DISABLE KEYS */;
/*!40000 ALTER TABLE `secfilter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `silo`
--

DROP TABLE IF EXISTS `silo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `silo` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `src_addr` varchar(255) NOT NULL DEFAULT '',
  `dst_addr` varchar(255) NOT NULL DEFAULT '',
  `username` varchar(64) NOT NULL DEFAULT '',
  `domain` varchar(64) NOT NULL DEFAULT '',
  `inc_time` int(11) NOT NULL DEFAULT '0',
  `exp_time` int(11) NOT NULL DEFAULT '0',
  `snd_time` int(11) NOT NULL DEFAULT '0',
  `ctype` varchar(32) NOT NULL DEFAULT 'text/plain',
  `body` blob,
  `extra_hdrs` text,
  `callid` varchar(128) NOT NULL DEFAULT '',
  `status` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `account_idx` (`username`,`domain`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `silo`
--

LOCK TABLES `silo` WRITE;
/*!40000 ALTER TABLE `silo` DISABLE KEYS */;
/*!40000 ALTER TABLE `silo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sip_trace`
--

DROP TABLE IF EXISTS `sip_trace`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sip_trace` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `time_stamp` datetime NOT NULL DEFAULT '2000-01-01 00:00:01',
  `time_us` int(10) unsigned NOT NULL DEFAULT '0',
  `callid` varchar(255) NOT NULL DEFAULT '',
  `traced_user` varchar(255) NOT NULL DEFAULT '',
  `msg` mediumtext NOT NULL,
  `method` varchar(50) NOT NULL DEFAULT '',
  `status` varchar(255) NOT NULL DEFAULT '',
  `fromip` varchar(50) NOT NULL DEFAULT '',
  `toip` varchar(50) NOT NULL DEFAULT '',
  `fromtag` varchar(128) NOT NULL DEFAULT '',
  `totag` varchar(128) NOT NULL DEFAULT '',
  `direction` varchar(4) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `traced_user_idx` (`traced_user`),
  KEY `date_idx` (`time_stamp`),
  KEY `fromip_idx` (`fromip`),
  KEY `callid_idx` (`callid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sip_trace`
--

LOCK TABLES `sip_trace` WRITE;
/*!40000 ALTER TABLE `sip_trace` DISABLE KEYS */;
/*!40000 ALTER TABLE `sip_trace` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `speed_dial`
--

DROP TABLE IF EXISTS `speed_dial`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `speed_dial` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(64) NOT NULL DEFAULT '',
  `domain` varchar(64) NOT NULL DEFAULT '',
  `sd_username` varchar(64) NOT NULL DEFAULT '',
  `sd_domain` varchar(64) NOT NULL DEFAULT '',
  `new_uri` varchar(255) NOT NULL DEFAULT '',
  `fname` varchar(64) NOT NULL DEFAULT '',
  `lname` varchar(64) NOT NULL DEFAULT '',
  `description` varchar(64) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `speed_dial_idx` (`username`,`domain`,`sd_domain`,`sd_username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `speed_dial`
--

LOCK TABLES `speed_dial` WRITE;
/*!40000 ALTER TABLE `speed_dial` DISABLE KEYS */;
/*!40000 ALTER TABLE `speed_dial` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subscriber`
--

DROP TABLE IF EXISTS `subscriber`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subscriber` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(64) NOT NULL DEFAULT '',
  `domain` varchar(64) NOT NULL DEFAULT '',
  `password` varchar(64) NOT NULL DEFAULT '',
  `ha1` varchar(128) NOT NULL DEFAULT '',
  `ha1b` varchar(128) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `account_idx` (`username`,`domain`),
  KEY `username_idx` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subscriber`
--

LOCK TABLES `subscriber` WRITE;
/*!40000 ALTER TABLE `subscriber` DISABLE KEYS */;
/*!40000 ALTER TABLE `subscriber` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `topos_d`
--

DROP TABLE IF EXISTS `topos_d`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `topos_d` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rectime` datetime NOT NULL,
  `s_method` varchar(64) NOT NULL DEFAULT '',
  `s_cseq` varchar(64) NOT NULL DEFAULT '',
  `a_callid` varchar(255) NOT NULL DEFAULT '',
  `a_uuid` varchar(255) NOT NULL DEFAULT '',
  `b_uuid` varchar(255) NOT NULL DEFAULT '',
  `a_contact` varchar(512) NOT NULL DEFAULT '',
  `b_contact` varchar(512) NOT NULL DEFAULT '',
  `as_contact` varchar(512) NOT NULL DEFAULT '',
  `bs_contact` varchar(512) NOT NULL DEFAULT '',
  `a_tag` varchar(255) NOT NULL DEFAULT '',
  `b_tag` varchar(255) NOT NULL DEFAULT '',
  `a_rr` mediumtext,
  `b_rr` mediumtext,
  `s_rr` mediumtext,
  `iflags` int(10) unsigned NOT NULL DEFAULT '0',
  `a_uri` varchar(255) NOT NULL DEFAULT '',
  `b_uri` varchar(255) NOT NULL DEFAULT '',
  `r_uri` varchar(255) NOT NULL DEFAULT '',
  `a_srcaddr` varchar(128) NOT NULL DEFAULT '',
  `b_srcaddr` varchar(128) NOT NULL DEFAULT '',
  `a_socket` varchar(128) NOT NULL DEFAULT '',
  `b_socket` varchar(128) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `rectime_idx` (`rectime`),
  KEY `a_callid_idx` (`a_callid`),
  KEY `a_uuid_idx` (`a_uuid`),
  KEY `b_uuid_idx` (`b_uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `topos_d`
--

LOCK TABLES `topos_d` WRITE;
/*!40000 ALTER TABLE `topos_d` DISABLE KEYS */;
/*!40000 ALTER TABLE `topos_d` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `topos_t`
--

DROP TABLE IF EXISTS `topos_t`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `topos_t` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rectime` datetime NOT NULL,
  `s_method` varchar(64) NOT NULL DEFAULT '',
  `s_cseq` varchar(64) NOT NULL DEFAULT '',
  `a_callid` varchar(255) NOT NULL DEFAULT '',
  `a_uuid` varchar(255) NOT NULL DEFAULT '',
  `b_uuid` varchar(255) NOT NULL DEFAULT '',
  `direction` int(11) NOT NULL DEFAULT '0',
  `x_via` mediumtext,
  `x_vbranch` varchar(255) NOT NULL DEFAULT '',
  `x_rr` mediumtext,
  `y_rr` mediumtext,
  `s_rr` mediumtext,
  `x_uri` varchar(255) NOT NULL DEFAULT '',
  `a_contact` varchar(512) NOT NULL DEFAULT '',
  `b_contact` varchar(512) NOT NULL DEFAULT '',
  `as_contact` varchar(512) NOT NULL DEFAULT '',
  `bs_contact` varchar(512) NOT NULL DEFAULT '',
  `x_tag` varchar(255) NOT NULL DEFAULT '',
  `a_tag` varchar(255) NOT NULL DEFAULT '',
  `b_tag` varchar(255) NOT NULL DEFAULT '',
  `a_srcaddr` varchar(255) NOT NULL DEFAULT '',
  `b_srcaddr` varchar(255) NOT NULL DEFAULT '',
  `a_socket` varchar(128) NOT NULL DEFAULT '',
  `b_socket` varchar(128) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `rectime_idx` (`rectime`),
  KEY `a_callid_idx` (`a_callid`),
  KEY `x_vbranch_idx` (`x_vbranch`),
  KEY `a_uuid_idx` (`a_uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `topos_t`
--

LOCK TABLES `topos_t` WRITE;
/*!40000 ALTER TABLE `topos_t` DISABLE KEYS */;
/*!40000 ALTER TABLE `topos_t` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trusted`
--

DROP TABLE IF EXISTS `trusted`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `trusted` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `src_ip` varchar(50) NOT NULL,
  `proto` varchar(4) NOT NULL,
  `from_pattern` varchar(64) DEFAULT NULL,
  `ruri_pattern` varchar(64) DEFAULT NULL,
  `tag` varchar(64) DEFAULT NULL,
  `priority` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `peer_idx` (`src_ip`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trusted`
--

LOCK TABLES `trusted` WRITE;
/*!40000 ALTER TABLE `trusted` DISABLE KEYS */;
/*!40000 ALTER TABLE `trusted` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uacreg`
--

DROP TABLE IF EXISTS `uacreg`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `uacreg` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `l_uuid` varchar(64) NOT NULL DEFAULT '',
  `l_username` varchar(64) NOT NULL DEFAULT '',
  `l_domain` varchar(64) NOT NULL DEFAULT '',
  `r_username` varchar(64) NOT NULL DEFAULT '',
  `r_domain` varchar(64) NOT NULL DEFAULT '',
  `realm` varchar(64) NOT NULL DEFAULT '',
  `auth_username` varchar(64) NOT NULL DEFAULT '',
  `auth_password` varchar(64) NOT NULL DEFAULT '',
  `auth_ha1` varchar(128) NOT NULL DEFAULT '',
  `auth_proxy` varchar(255) NOT NULL DEFAULT '',
  `expires` int(11) NOT NULL DEFAULT '0',
  `flags` int(11) NOT NULL DEFAULT '0',
  `reg_delay` int(11) NOT NULL DEFAULT '0',
  `socket` varchar(128) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `l_uuid_idx` (`l_uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uacreg`
--

LOCK TABLES `uacreg` WRITE;
/*!40000 ALTER TABLE `uacreg` DISABLE KEYS */;
/*!40000 ALTER TABLE `uacreg` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uri`
--

DROP TABLE IF EXISTS `uri`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `uri` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(64) NOT NULL DEFAULT '',
  `domain` varchar(64) NOT NULL DEFAULT '',
  `uri_user` varchar(64) NOT NULL DEFAULT '',
  `last_modified` datetime NOT NULL DEFAULT '2000-01-01 00:00:01',
  PRIMARY KEY (`id`),
  UNIQUE KEY `account_idx` (`username`,`domain`,`uri_user`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uri`
--

LOCK TABLES `uri` WRITE;
/*!40000 ALTER TABLE `uri` DISABLE KEYS */;
/*!40000 ALTER TABLE `uri` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userblacklist`
--

DROP TABLE IF EXISTS `userblacklist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userblacklist` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(64) NOT NULL DEFAULT '',
  `domain` varchar(64) NOT NULL DEFAULT '',
  `prefix` varchar(64) NOT NULL DEFAULT '',
  `whitelist` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `userblacklist_idx` (`username`,`domain`,`prefix`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userblacklist`
--

LOCK TABLES `userblacklist` WRITE;
/*!40000 ALTER TABLE `userblacklist` DISABLE KEYS */;
/*!40000 ALTER TABLE `userblacklist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usr_preferences`
--

DROP TABLE IF EXISTS `usr_preferences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usr_preferences` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(64) NOT NULL DEFAULT '',
  `username` varchar(255) NOT NULL DEFAULT '0',
  `domain` varchar(64) NOT NULL DEFAULT '',
  `attribute` varchar(32) NOT NULL DEFAULT '',
  `type` int(11) NOT NULL DEFAULT '0',
  `value` varchar(128) NOT NULL DEFAULT '',
  `last_modified` datetime NOT NULL DEFAULT '2000-01-01 00:00:01',
  PRIMARY KEY (`id`),
  KEY `ua_idx` (`uuid`,`attribute`),
  KEY `uda_idx` (`username`,`domain`,`attribute`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usr_preferences`
--

LOCK TABLES `usr_preferences` WRITE;
/*!40000 ALTER TABLE `usr_preferences` DISABLE KEYS */;
/*!40000 ALTER TABLE `usr_preferences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `version`
--

DROP TABLE IF EXISTS `version`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `version` (
  `table_name` varchar(32) NOT NULL,
  `table_version` int(10) unsigned NOT NULL DEFAULT '0',
  UNIQUE KEY `table_name_idx` (`table_name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `version`
--

LOCK TABLES `version` WRITE;
/*!40000 ALTER TABLE `version` DISABLE KEYS */;
INSERT INTO `version` VALUES ('acc',5),('acc_cdrs',2),('address',6),('aliases',8),('carrierfailureroute',2),('carrierroute',3),('carrier_name',1),('cpl',1),('dbaliases',1),('dialog',7),('dialog_vars',1),('dialplan',2),('dispatcher',4),('domain',2),('domainpolicy',2),('domain_attrs',1),('domain_name',1),('dr_gateways',3),('dr_groups',2),('dr_gw_lists',1),('dr_rules',3),('globalblacklist',1),('grp',2),('htable',2),('imc_members',1),('imc_rooms',1),('lcr_gw',3),('lcr_rule',3),('lcr_rule_target',1),('location',9),('location_attrs',1),('missed_calls',4),('mohqcalls',1),('mohqueues',1),('mtree',1),('mtrees',2),('pdt',1),('pl_pipes',1),('purplemap',1),('re_grp',1),('rtpengine',1),('rtpproxy',1),('sca_subscriptions',2),('secfilter',1),('silo',8),('sip_trace',4),('speed_dial',2),('subscriber',7),('topos_d',1),('topos_t',1),('trusted',6),('uacreg',4),('uri',1),('userblacklist',1),('usr_preferences',2),('version',1);
/*!40000 ALTER TABLE `version` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `view_route_tables`
--

DROP TABLE IF EXISTS `view_route_tables`;
/*!50001 DROP VIEW IF EXISTS `view_route_tables`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `view_route_tables` (
  `TABLE_NAME` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `webusers`
--

DROP TABLE IF EXISTS `webusers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `webusers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `lastname` varchar(45) DEFAULT NULL,
  `username` varchar(45) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `webusers`
--

LOCK TABLES `webusers` WRITE;
/*!40000 ALTER TABLE `webusers` DISABLE KEYS */;
INSERT INTO `webusers` VALUES (15,'admin','','admin','21232f297a57a5a743894a0e4a801fc3');
/*!40000 ALTER TABLE `webusers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ws_cdr`
--

DROP TABLE IF EXISTS `ws_cdr`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ws_cdr` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `datetime_start` datetime DEFAULT NULL,
  `call_id` varchar(128) DEFAULT NULL,
  `clgnum` varchar(45) DEFAULT NULL,
  `clgnum_display` varchar(45) DEFAULT NULL,
  `cldnum` varchar(45) DEFAULT NULL,
  `datetime_answer` datetime DEFAULT NULL,
  `clgnum_out` varchar(45) DEFAULT NULL,
  `cldnum_out` varchar(45) DEFAULT NULL,
  `billsec` decimal(16,0) DEFAULT NULL,
  `received_ip` varchar(15) DEFAULT NULL,
  `rtp_audio_in_mos` decimal(4,2) DEFAULT NULL,
  `rtp_audio_in_packet_count` int(11) DEFAULT NULL,
  `rtp_audio_in_skip_packet` int(11) DEFAULT NULL,
  `datetime_end` datetime DEFAULT NULL,
  `hangup_cause` varchar(25) DEFAULT NULL,
  `hangup_cause_q850` int(11) DEFAULT NULL,
  `remote_media_ip` varchar(15) DEFAULT NULL,
  `read_codec` varchar(15) DEFAULT NULL,
  `own_ip` varchar(15) DEFAULT NULL,
  `write_codec` varchar(15) DEFAULT NULL,
  `context` varchar(45) DEFAULT NULL,
  `route_table` varchar(45) DEFAULT NULL,
  `rate_table` varchar(45) DEFAULT NULL,
  `last_app` varchar(45) DEFAULT NULL,
  `last_arg` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `crono_in_symbol` (`datetime_start`),
  KEY `crono_in_ip` (`datetime_start`,`received_ip`)
) ENGINE=MyISAM AUTO_INCREMENT=10930561 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ws_cdr`
--

LOCK TABLES `ws_cdr` WRITE;
/*!40000 ALTER TABLE `ws_cdr` DISABLE KEYS */;
/*!40000 ALTER TABLE `ws_cdr` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ws_def_route_table`
--

DROP TABLE IF EXISTS `ws_def_route_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ws_def_route_table` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `areacode` varchar(64) NOT NULL,
  `destination` varchar(45) NOT NULL,
  `provider_list` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `areacode_UNIQUE` (`areacode`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ws_def_route_table`
--

LOCK TABLES `ws_def_route_table` WRITE;
/*!40000 ALTER TABLE `ws_def_route_table` DISABLE KEYS */;
/*!40000 ALTER TABLE `ws_def_route_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ws_distribution_strategy`
--

DROP TABLE IF EXISTS `ws_distribution_strategy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ws_distribution_strategy` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `alghorithm` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`,`name`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ws_distribution_strategy`
--

LOCK TABLES `ws_distribution_strategy` WRITE;
/*!40000 ALTER TABLE `ws_distribution_strategy` DISABLE KEYS */;
INSERT INTO `ws_distribution_strategy` VALUES (1,'Hash on Call ID','0'),(2,'Hash on From-URI','1'),(3,'Hash on To-URI','2'),(4,'Hash on R-URI','3'),(5,'Round-Robin','4'),(6,'Hash on Auth-Username','5'),(7,'Random','6'),(8,'Weight-based','9'),(9,'Call Load','10');
/*!40000 ALTER TABLE `ws_distribution_strategy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ws_providers`
--

DROP TABLE IF EXISTS `ws_providers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ws_providers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` char(50) DEFAULT NULL,
  `symbol` varchar(15) NOT NULL,
  `address` char(255) DEFAULT NULL,
  `zip` char(5) DEFAULT NULL,
  `city` char(50) DEFAULT NULL,
  `state` char(50) DEFAULT NULL,
  `country` char(50) DEFAULT NULL,
  `phone` char(15) DEFAULT NULL,
  `fax` char(15) DEFAULT NULL,
  `contact_name` char(50) DEFAULT NULL,
  `contact_email` char(50) DEFAULT NULL,
  `distribution_strategy` varchar(45) DEFAULT NULL,
  `sip_ip` char(25) DEFAULT NULL,
  `codec_list` char(50) DEFAULT NULL,
  `strip_digits` char(20) NOT NULL DEFAULT '',
  `out_prefix` char(15) DEFAULT NULL,
  `lastchange` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`,`symbol`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `symbol_UNIQUE` (`symbol`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=44 DEFAULT CHARSET=latin1 CHECKSUM=1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ws_providers`
--

LOCK TABLES `ws_providers` WRITE;
/*!40000 ALTER TABLE `ws_providers` DISABLE KEYS */;
/*!40000 ALTER TABLE `ws_providers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ws_route_table_IDT`
--

DROP TABLE IF EXISTS `ws_route_table_IDT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ws_route_table_IDT` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `areacode` varchar(64) NOT NULL,
  `destination` varchar(45) NOT NULL,
  `provider_list` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `areacode_UNIQUE` (`areacode`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ws_route_table_IDT`
--

LOCK TABLES `ws_route_table_IDT` WRITE;
/*!40000 ALTER TABLE `ws_route_table_IDT` DISABLE KEYS */;
/*!40000 ALTER TABLE `ws_route_table_IDT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ws_route_table_idt`
--

DROP TABLE IF EXISTS `ws_route_table_idt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ws_route_table_idt` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `areacode` varchar(64) NOT NULL,
  `destination` varchar(45) NOT NULL,
  `provider_list` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `areacode_UNIQUE` (`areacode`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ws_route_table_idt`
--

LOCK TABLES `ws_route_table_idt` WRITE;
/*!40000 ALTER TABLE `ws_route_table_idt` DISABLE KEYS */;
/*!40000 ALTER TABLE `ws_route_table_idt` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ws_route_table_idt_routes`
--

DROP TABLE IF EXISTS `ws_route_table_idt_routes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ws_route_table_idt_routes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `areacode` varchar(64) NOT NULL,
  `destination` varchar(45) NOT NULL,
  `provider_list` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `areacode_UNIQUE` (`areacode`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ws_route_table_idt_routes`
--

LOCK TABLES `ws_route_table_idt_routes` WRITE;
/*!40000 ALTER TABLE `ws_route_table_idt_routes` DISABLE KEYS */;
/*!40000 ALTER TABLE `ws_route_table_idt_routes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ws_route_table_new_idt`
--

DROP TABLE IF EXISTS `ws_route_table_new_idt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ws_route_table_new_idt` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `areacode` varchar(64) NOT NULL,
  `destination` varchar(45) NOT NULL,
  `provider_list` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `areacode_UNIQUE` (`areacode`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ws_route_table_new_idt`
--

LOCK TABLES `ws_route_table_new_idt` WRITE;
/*!40000 ALTER TABLE `ws_route_table_new_idt` DISABLE KEYS */;
/*!40000 ALTER TABLE `ws_route_table_new_idt` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ws_routes`
--

DROP TABLE IF EXISTS `ws_routes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ws_routes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `areacode` varchar(15) NOT NULL,
  `destination` varchar(64) DEFAULT NULL,
  `provider_id` varchar(45) DEFAULT NULL,
  `lastchange` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `route_name_UNIQUE` (`areacode`)
) ENGINE=MyISAM AUTO_INCREMENT=55 DEFAULT CHARSET=utf8 CHECKSUM=1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ws_routes`
--

LOCK TABLES `ws_routes` WRITE;
/*!40000 ALTER TABLE `ws_routes` DISABLE KEYS */;
/*!40000 ALTER TABLE `ws_routes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ws_settings`
--

DROP TABLE IF EXISTS `ws_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ws_settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `service_ip` varchar(15) NOT NULL,
  `service_port` int(11) DEFAULT NULL,
  `service_type` varchar(25) DEFAULT NULL,
  `running_trace` varchar(3) DEFAULT NULL,
  `remote_host` varchar(15) DEFAULT NULL,
  `dialed_number` varchar(45) DEFAULT NULL,
  `reload` varchar(3) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ip` (`service_ip`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ws_settings`
--

LOCK TABLES `ws_settings` WRITE;
/*!40000 ALTER TABLE `ws_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `ws_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ws_subscriber_info`
--

DROP TABLE IF EXISTS `ws_subscriber_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ws_subscriber_info` (
  `phone_number` varchar(45) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `lastname` varchar(45) DEFAULT NULL,
  `enabled` int(11) DEFAULT NULL,
  `rate_table` varchar(45) DEFAULT NULL,
  `route_table` varchar(45) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  `domain` varchar(45) NOT NULL,
  PRIMARY KEY (`phone_number`,`domain`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ws_subscriber_info`
--

LOCK TABLES `ws_subscriber_info` WRITE;
/*!40000 ALTER TABLE `ws_subscriber_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `ws_subscriber_info` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`admin`@`%`*/ /*!50003 TRIGGER `kamailio`.`ws_subscriber_info_AFTER_INSERT` AFTER INSERT ON `ws_subscriber_info` FOR EACH ROW
BEGIN
	 INSERT INTO subscriber (id,username,domain,password,ha1,ha1b)  VALUES (
		NULL,
        NEW.phone_number,
        NEW.domain,
        NEW.password,
		md5(concat(NEW.phone_number, ':', NEW.domain, ':', NEW.password)),
		md5(concat(NEW.phone_number, '@', NEW.domain, ':', NEW.domain, ':', NEW.password))
     );
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`admin`@`%`*/ /*!50003 TRIGGER `kamailio`.`ws_subscriber_info_AFTER_UPDATE` AFTER UPDATE ON `ws_subscriber_info` FOR EACH ROW
BEGIN
	UPDATE subscriber
		SET
			domain=NEW.domain,
            password=NEW.password,
			ha1 = md5(concat(NEW.phone_number, ':', NEW.domain, ':', NEW.password)),
			ha1b = md5(concat(NEW.phone_number, '@', NEW.domain, ':', NEW.domain, ':', NEW.password))
    WHERE username = NEW.phone_number;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`admin`@`%`*/ /*!50003 TRIGGER `kamailio`.`ws_subscriber_info_AFTER_DELETE` AFTER DELETE ON `ws_subscriber_info` FOR EACH ROW
BEGIN
	DELETE FROM subscriber WHERE username = OLD.phone_number;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

--
-- Final view structure for view `view_route_tables`
--

/*!50001 DROP TABLE IF EXISTS `view_route_tables`*/;
/*!50001 DROP VIEW IF EXISTS `view_route_tables`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`admin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `view_route_tables` AS select `information_schema`.`TABLES`.`TABLE_NAME` AS `TABLE_NAME` from `INFORMATION_SCHEMA`.`TABLES` where ((`information_schema`.`TABLES`.`TABLE_SCHEMA` = 'kamailio') and (`information_schema`.`TABLES`.`TABLE_NAME` like 'ws_route_table_%')) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-02-01 23:19:47
