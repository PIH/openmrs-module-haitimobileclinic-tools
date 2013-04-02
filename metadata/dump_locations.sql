-- MySQL dump 10.13  Distrib 5.5.27, for osx10.6 (i386)
--
-- Host: localhost    Database: openmrs
-- ------------------------------------------------------
-- Server version	5.5.27

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
-- Table structure for table `location`
--

DROP TABLE IF EXISTS `location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `location` (
  `location_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `description` varchar(255) DEFAULT NULL,
  `address1` varchar(255) DEFAULT NULL,
  `address2` varchar(255) DEFAULT NULL,
  `city_village` varchar(255) DEFAULT NULL,
  `state_province` varchar(255) DEFAULT NULL,
  `postal_code` varchar(50) DEFAULT NULL,
  `country` varchar(50) DEFAULT NULL,
  `latitude` varchar(50) DEFAULT NULL,
  `longitude` varchar(50) DEFAULT NULL,
  `creator` int(11) NOT NULL DEFAULT '0',
  `date_created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `county_district` varchar(255) DEFAULT NULL,
  `address3` varchar(255) DEFAULT NULL,
  `address6` varchar(255) DEFAULT NULL,
  `address5` varchar(255) DEFAULT NULL,
  `address4` varchar(255) DEFAULT NULL,
  `retired` tinyint(1) NOT NULL DEFAULT '0',
  `retired_by` int(11) DEFAULT NULL,
  `date_retired` datetime DEFAULT NULL,
  `retire_reason` varchar(255) DEFAULT NULL,
  `parent_location` int(11) DEFAULT NULL,
  `uuid` char(38) NOT NULL,
  PRIMARY KEY (`location_id`),
  UNIQUE KEY `location_uuid_index` (`uuid`),
  KEY `user_who_created_location` (`creator`),
  KEY `name_of_location` (`name`),
  KEY `user_who_retired_location` (`retired_by`),
  KEY `retired_status` (`retired`),
  KEY `parent_location` (`parent_location`),
  CONSTRAINT `parent_location` FOREIGN KEY (`parent_location`) REFERENCES `location` (`location_id`),
  CONSTRAINT `user_who_created_location` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`),
  CONSTRAINT `user_who_retired_location` FOREIGN KEY (`retired_by`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `location`
--

LOCK TABLES `location` WRITE;
/*!40000 ALTER TABLE `location` DISABLE KEYS */;
INSERT INTO `location` VALUES (1,'Unknown Location','Precise location unknown','','','','','','','','',1,'2005-09-22 00:00:00',NULL,NULL,NULL,NULL,NULL,1,1,NULL,'unneeded',NULL,'8d6c993e-c2cc-11de-8d13-0010c6dffd0f'),(2,'Cange','Cange Pavillion Thomas J. White',NULL,NULL,NULL,'Centre',NULL,'Haiti',NULL,NULL,1,'2009-06-11 12:38:21',NULL,NULL,NULL,NULL,NULL,0,1,NULL,NULL,NULL,'328f68e4-0370-102d-b0e3-001ec94a0cc1'),(3,'Hinche','Hinche MDR-TB Clinic','','','Hinche','Centre','','Haiti','','',1,'2009-06-11 12:38:36',NULL,'',NULL,NULL,NULL,0,1,NULL,NULL,NULL,'328f6a60-0370-102d-b0e3-001ec94a0cc1'),(4,'Non-ZL Clinic','Clinic not run by Zanmi Lasante','','','','','','','','',1,'2009-06-15 11:41:38',NULL,NULL,NULL,NULL,NULL,0,1,NULL,NULL,NULL,'328f6bd2-0370-102d-b0e3-001ec94a0cc1'),(5,'MSLI','Massachusetts State Laboratory Institute','','','Boston','','','USA','','',1,'2009-06-15 23:11:04',NULL,NULL,NULL,NULL,NULL,1,1,NULL,'unneeded',NULL,'328f6d44-0370-102d-b0e3-001ec94a0cc1'),(6,'MSPP','Ministry of Health Laboratory','',NULL,'',NULL,NULL,NULL,NULL,NULL,1,'2009-08-17 18:49:07',NULL,NULL,NULL,NULL,NULL,1,1,'2010-08-04 13:34:07','Not used',NULL,'328f6eac-0370-102d-b0e3-001ec94a0cc1'),(7,'Lacolline','Lacolline',NULL,NULL,NULL,NULL,NULL,'Haiti',NULL,NULL,1,'2012-01-24 14:53:28',NULL,NULL,NULL,NULL,NULL,0,1,NULL,NULL,NULL,'23e7bb0d-51f9-4d5f-b34b-2fbbfeea1960'),(8,'Boucan-Carré','Boucan-Carré (MoH code 62301)','','','Boucan Carré','Centre',NULL,'Haiti',NULL,NULL,1,'2012-07-16 14:54:31',NULL,'',NULL,NULL,NULL,0,1,NULL,NULL,NULL,'9bc65df6-99a2-4d43-b56b-f42bde3f5d6d'),(9,'Belladères','Belladères (MoH code 63201)','','','Belladères','Centre',NULL,'Haiti',NULL,NULL,1,'2012-07-16 14:56:21',NULL,'',NULL,NULL,NULL,0,1,NULL,NULL,NULL,'d6dafa1a-9a2f-4f61-a33e-410acb64b0e9'),(10,'Cerca-la-Source','Cerca-la-Source (MoH code 64101)','','','Cerca La Source','Centre',NULL,'Haiti',NULL,NULL,1,'2012-07-16 14:57:36',NULL,'',NULL,NULL,NULL,0,1,NULL,NULL,NULL,'c741e25d-eb07-4efc-89e4-38ac73948ae1'),(11,'Mirebalais','Mirebalais (MoH code 62101)','','','Mirebalais','Centre',NULL,'Haiti',NULL,NULL,1,'2012-07-16 14:59:16',NULL,'',NULL,NULL,NULL,0,1,NULL,NULL,NULL,'a084f714-a536-473b-94e6-ec317b152b43'),(12,'Petite Rivière','Petite Rivière (MoH code 54201)','','','Petite Rivière de L\'Artibonite','Artibonite',NULL,'Haiti',NULL,NULL,1,'2012-07-16 15:00:33',NULL,'',NULL,NULL,NULL,0,1,NULL,NULL,NULL,'a7af173a-f623-445a-bf01-e6a64c0b2c98'),(13,'Saint-Marc SSPE','Saint-Marc SSPE (MoH code 53115)','','','Saint-Marc','Artibonite',NULL,'Haiti',NULL,NULL,1,'2012-07-16 15:01:46',NULL,'',NULL,NULL,NULL,0,1,NULL,NULL,NULL,'209c84cf-4cd7-4908-a946-030499c1ff75'),(14,'Thomonde','Thomonde (MoH code 61301) ','','','Thomonde','Centre',NULL,'Haiti',NULL,NULL,1,'2012-07-16 15:02:52',NULL,'',NULL,NULL,NULL,0,1,NULL,NULL,NULL,'376b3e7e-f7c0-4268-a98d-c2bddfee8bcf'),(15,'Verrettes','Verrettes (MoH code 53206)','','','Verrettes','Artibonite',NULL,'Haiti',NULL,NULL,1,'2012-07-16 15:03:46',NULL,'',NULL,NULL,NULL,0,1,NULL,NULL,NULL,'6c1c2579-7d16-4d39-bca2-e77141ff435f'),(16,'Promotion Objectif Zerosida POZ','Promotion Objectif Zerosida (POZ) (MoH code 54202).  HIV clinic in Saint-Marc.','','','Saint-Marc','Artibonite',NULL,'Haiti',NULL,NULL,1,'2012-07-16 15:08:30',NULL,'',NULL,NULL,NULL,0,1,NULL,NULL,NULL,'c488ed05-f259-4f7b-a9d4-8f56736da691'),(17,'Saint Marc HSN',NULL,NULL,NULL,NULL,NULL,NULL,'Haiti',NULL,NULL,3,'2013-03-09 11:03:02',NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'0ed2ec19-aa4c-4860-b7f9-9b2314019555');
/*!40000 ALTER TABLE `location` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `location_attribute`
--

DROP TABLE IF EXISTS `location_attribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `location_attribute` (
  `location_attribute_id` int(11) NOT NULL AUTO_INCREMENT,
  `location_id` int(11) NOT NULL,
  `attribute_type_id` int(11) NOT NULL,
  `value_reference` text NOT NULL,
  `uuid` char(38) NOT NULL,
  `creator` int(11) NOT NULL,
  `date_created` datetime NOT NULL,
  `changed_by` int(11) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `voided` tinyint(1) NOT NULL DEFAULT '0',
  `voided_by` int(11) DEFAULT NULL,
  `date_voided` datetime DEFAULT NULL,
  `void_reason` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`location_attribute_id`),
  UNIQUE KEY `uuid` (`uuid`),
  KEY `location_attribute_location_fk` (`location_id`),
  KEY `location_attribute_attribute_type_id_fk` (`attribute_type_id`),
  KEY `location_attribute_creator_fk` (`creator`),
  KEY `location_attribute_changed_by_fk` (`changed_by`),
  KEY `location_attribute_voided_by_fk` (`voided_by`),
  CONSTRAINT `location_attribute_attribute_type_id_fk` FOREIGN KEY (`attribute_type_id`) REFERENCES `location_attribute_type` (`location_attribute_type_id`),
  CONSTRAINT `location_attribute_changed_by_fk` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `location_attribute_creator_fk` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`),
  CONSTRAINT `location_attribute_location_fk` FOREIGN KEY (`location_id`) REFERENCES `location` (`location_id`),
  CONSTRAINT `location_attribute_voided_by_fk` FOREIGN KEY (`voided_by`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `location_attribute`
--

LOCK TABLES `location_attribute` WRITE;
/*!40000 ALTER TABLE `location_attribute` DISABLE KEYS */;
/*!40000 ALTER TABLE `location_attribute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `location_attribute_type`
--

DROP TABLE IF EXISTS `location_attribute_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `location_attribute_type` (
  `location_attribute_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` varchar(1024) DEFAULT NULL,
  `datatype` varchar(255) DEFAULT NULL,
  `datatype_config` text,
  `preferred_handler` varchar(255) DEFAULT NULL,
  `handler_config` text,
  `min_occurs` int(11) NOT NULL,
  `max_occurs` int(11) DEFAULT NULL,
  `creator` int(11) NOT NULL,
  `date_created` datetime NOT NULL,
  `changed_by` int(11) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `retired` tinyint(1) NOT NULL DEFAULT '0',
  `retired_by` int(11) DEFAULT NULL,
  `date_retired` datetime DEFAULT NULL,
  `retire_reason` varchar(255) DEFAULT NULL,
  `uuid` char(38) NOT NULL,
  PRIMARY KEY (`location_attribute_type_id`),
  UNIQUE KEY `uuid` (`uuid`),
  KEY `location_attribute_type_creator_fk` (`creator`),
  KEY `location_attribute_type_changed_by_fk` (`changed_by`),
  KEY `location_attribute_type_retired_by_fk` (`retired_by`),
  CONSTRAINT `location_attribute_type_changed_by_fk` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `location_attribute_type_creator_fk` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`),
  CONSTRAINT `location_attribute_type_retired_by_fk` FOREIGN KEY (`retired_by`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `location_attribute_type`
--

LOCK TABLES `location_attribute_type` WRITE;
/*!40000 ALTER TABLE `location_attribute_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `location_attribute_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `location_tag`
--

DROP TABLE IF EXISTS `location_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `location_tag` (
  `location_tag_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `creator` int(11) NOT NULL,
  `date_created` datetime NOT NULL,
  `retired` tinyint(1) NOT NULL DEFAULT '0',
  `retired_by` int(11) DEFAULT NULL,
  `date_retired` datetime DEFAULT NULL,
  `retire_reason` varchar(255) DEFAULT NULL,
  `uuid` char(38) NOT NULL,
  PRIMARY KEY (`location_tag_id`),
  UNIQUE KEY `location_tag_uuid_index` (`uuid`),
  KEY `location_tag_creator` (`creator`),
  KEY `location_tag_retired_by` (`retired_by`),
  CONSTRAINT `location_tag_creator` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`),
  CONSTRAINT `location_tag_retired_by` FOREIGN KEY (`retired_by`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `location_tag`
--

LOCK TABLES `location_tag` WRITE;
/*!40000 ALTER TABLE `location_tag` DISABLE KEYS */;
INSERT INTO `location_tag` VALUES (1,'Medical Record Location','Notes that this location is a valid identifier location for an identifier that references a paper medical record',1,'2012-10-09 19:01:33',0,1,NULL,NULL,'71c99f93-bc0c-4a44-b573-a7ac096ff636');
/*!40000 ALTER TABLE `location_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `location_tag_map`
--

DROP TABLE IF EXISTS `location_tag_map`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `location_tag_map` (
  `location_id` int(11) NOT NULL,
  `location_tag_id` int(11) NOT NULL,
  PRIMARY KEY (`location_id`,`location_tag_id`),
  KEY `location_tag_map_tag` (`location_tag_id`),
  CONSTRAINT `location_tag_map_location` FOREIGN KEY (`location_id`) REFERENCES `location` (`location_id`),
  CONSTRAINT `location_tag_map_tag` FOREIGN KEY (`location_tag_id`) REFERENCES `location_tag` (`location_tag_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `location_tag_map`
--

LOCK TABLES `location_tag_map` WRITE;
/*!40000 ALTER TABLE `location_tag_map` DISABLE KEYS */;
INSERT INTO `location_tag_map` VALUES (7,1);
/*!40000 ALTER TABLE `location_tag_map` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2013-04-02 21:05:59
