-- MySQL dump 10.14  Distrib 5.5.68-MariaDB, for Linux (x86_64)
--
-- Host: backend-db.c6etf9emo9v3.us-east-1.rds.amazonaws.com    Database: kamailio
-- ------------------------------------------------------
-- Server version	5.7.39

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
  `last_app` varchar(45) DEFAULT NULL,
  `last_arg` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `crono_in_symbol` (`datetime_start`),
  KEY `crono_in_ip` (`datetime_start`,`received_ip`)
) ENGINE=MyISAM AUTO_INCREMENT=10930506 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ws_cdr`
--

LOCK TABLES `ws_cdr` WRITE;
/*!40000 ALTER TABLE `ws_cdr` DISABLE KEYS */;
/*!40000 ALTER TABLE `ws_cdr` ENABLE KEYS */;
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
) ENGINE=MyISAM AUTO_INCREMENT=42 DEFAULT CHARSET=latin1 CHECKSUM=1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ws_providers`
--

LOCK TABLES `ws_providers` WRITE;
/*!40000 ALTER TABLE `ws_providers` DISABLE KEYS */;
/*!40000 ALTER TABLE `ws_providers` ENABLE KEYS */;
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
) ENGINE=MyISAM AUTO_INCREMENT=53 DEFAULT CHARSET=utf8 CHECKSUM=1;
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
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
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
  `name` varchar(45) NOT NULL,
  `lastname` varchar(45) DEFAULT NULL,
  `enabled` int(11) DEFAULT NULL,
  `rate_table` varchar(45) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  `domain` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`phone_number`,`name`),
  UNIQUE KEY `phone_number_UNIQUE` (`phone_number`)
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

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-01-23  1:09:31
