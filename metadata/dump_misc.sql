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
-- Table structure for table `person_attribute_type`
--

DROP TABLE IF EXISTS `person_attribute_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `person_attribute_type` (
  `person_attribute_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  `format` varchar(50) DEFAULT NULL,
  `foreign_key` int(11) DEFAULT NULL,
  `searchable` tinyint(1) NOT NULL DEFAULT '0',
  `creator` int(11) NOT NULL DEFAULT '0',
  `date_created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `changed_by` int(11) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `retired` tinyint(1) NOT NULL DEFAULT '0',
  `retired_by` int(11) DEFAULT NULL,
  `date_retired` datetime DEFAULT NULL,
  `retire_reason` varchar(255) DEFAULT NULL,
  `edit_privilege` varchar(50) DEFAULT NULL,
  `uuid` char(38) NOT NULL,
  `sort_weight` double DEFAULT NULL,
  PRIMARY KEY (`person_attribute_type_id`),
  UNIQUE KEY `person_attribute_type_uuid_index` (`uuid`),
  KEY `name_of_attribute` (`name`),
  KEY `type_creator` (`creator`),
  KEY `attribute_type_changer` (`changed_by`),
  KEY `attribute_is_searchable` (`searchable`),
  KEY `user_who_retired_person_attribute_type` (`retired_by`),
  KEY `person_attribute_type_retired_status` (`retired`),
  KEY `privilege_which_can_edit` (`edit_privilege`),
  CONSTRAINT `attribute_type_changer` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `attribute_type_creator` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`),
  CONSTRAINT `privilege_which_can_edit` FOREIGN KEY (`edit_privilege`) REFERENCES `privilege` (`privilege`),
  CONSTRAINT `user_who_retired_person_attribute_type` FOREIGN KEY (`retired_by`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `person_attribute_type`
--

LOCK TABLES `person_attribute_type` WRITE;
/*!40000 ALTER TABLE `person_attribute_type` DISABLE KEYS */;
INSERT INTO `person_attribute_type` VALUES (1,'Race','Group of persons related by common descent or heredity','java.lang.String',NULL,0,1,'2007-05-04 09:59:23',1,'2013-02-14 18:24:42',1,3,'2013-02-14 18:24:42','unsued',NULL,'8d871386-c2cc-11de-8d13-0010c6dffd0f',7),(2,'Birthplace','Location of persons birth','java.lang.String',NULL,0,1,'2007-05-04 09:59:23',1,'2013-02-14 18:23:53',1,3,'2013-02-14 18:23:53','unsued',NULL,'8d8718c2-c2cc-11de-8d13-0010c6dffd0f',0),(3,'Citizenship','Country of which this person is a member','java.lang.String',NULL,0,1,'2007-05-04 09:59:23',1,'2013-02-14 18:24:00',1,3,'2013-02-14 18:23:59','unsued',NULL,'8d871afc-c2cc-11de-8d13-0010c6dffd0f',1),(4,'Mother\'s Name','First or last name of this person\'s mother','java.lang.String',NULL,0,1,'2007-05-04 09:59:23',1,'2013-02-14 18:26:00',1,3,'2013-02-14 18:25:59','unused',NULL,'8d871d18-c2cc-11de-8d13-0010c6dffd0f',6),(5,'Civil Status','Marriage status of this person','org.openmrs.Concept',1054,0,1,'2007-05-04 09:59:23',1,'2013-02-14 18:24:06',1,3,'2013-02-14 18:24:06','unsued',NULL,'8d871f2a-c2cc-11de-8d13-0010c6dffd0f',2),(6,'Health District','District/region in which this patient\' home health center resides','java.lang.String',NULL,0,1,'2007-05-04 09:59:23',1,'2013-02-14 18:24:28',1,3,'2013-02-14 18:24:28','unsued',NULL,'8d872150-c2cc-11de-8d13-0010c6dffd0f',4),(7,'Health Center','Specific Location of this person\'s home health center.','org.openmrs.Location',NULL,0,1,'2007-05-04 09:59:23',1,'2013-02-14 18:24:22',1,3,'2013-02-14 18:24:22','unsued',NULL,'8d87236c-c2cc-11de-8d13-0010c6dffd0f',3),(8,'Treatment Supporter','unsued','java.lang.String',NULL,1,1,'2008-08-16 17:20:57',1,'2013-02-14 18:25:14',1,3,'2013-02-14 18:25:14','unused',NULL,'340cf7b8-0370-102d-b0e3-001ec94a0cc1',9),(9,'MDR-TB Patient Contact ID Number','Used to identify mdrtb contacts.  Used by the mdrt-tb module.','java.lang.String',NULL,0,1,'2008-09-23 17:33:51',1,'2013-02-14 18:24:34',1,3,'2013-02-14 18:24:34','unsued',NULL,'340d0384-0370-102d-b0e3-001ec94a0cc1',5),(10,'Telephone Number','Person\'s Primary Telephone Number','java.lang.String',NULL,0,1,'2009-06-12 17:03:23',1,'2012-02-07 20:13:16',0,1,NULL,NULL,NULL,'340d04c4-0370-102d-b0e3-001ec94a0cc1',8),(11,'Zone','From Haiti HIV EMR1 hiv_demographics.zone','java.lang.String',NULL,0,1,'2011-06-03 11:34:31',1,NULL,1,1,'2011-06-03 11:34:53','Only for HIV patient migration',NULL,'3ad89b92-0dbd-42ba-9463-1da3cafe2f6e',10),(12,'Test patient','Is the patient a test patient? Anything besides NULL indicates a test patient.','java.lang.String',NULL,0,1,'2011-06-03 11:35:42',1,'2013-02-14 18:26:16',1,3,'2013-02-14 18:26:16','unused',NULL,'4df58da3-f7df-4bb2-a9e2-544e6620a02b',11),(13,'Provider Identifier','Provider Identifier','java.lang.String',NULL,1,1,'2012-08-22 13:25:37',1,'2013-02-14 18:25:23',1,3,'2013-02-14 18:25:23','unsued',NULL,'6de6c415-97a2-4cca-817a-9501cd9ef382',12);
/*!40000 ALTER TABLE `person_attribute_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `program`
--

DROP TABLE IF EXISTS `program`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `program` (
  `program_id` int(11) NOT NULL AUTO_INCREMENT,
  `concept_id` int(11) NOT NULL DEFAULT '0',
  `creator` int(11) NOT NULL DEFAULT '0',
  `date_created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `changed_by` int(11) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `retired` tinyint(1) NOT NULL DEFAULT '0',
  `name` varchar(50) NOT NULL,
  `description` varchar(500) DEFAULT NULL,
  `uuid` char(38) NOT NULL,
  `outcomes_concept_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`program_id`),
  UNIQUE KEY `program_uuid_index` (`uuid`),
  KEY `program_concept` (`concept_id`),
  KEY `program_creator` (`creator`),
  KEY `user_who_changed_program` (`changed_by`),
  KEY `program_outcomes_concept_id_fk` (`outcomes_concept_id`),
  CONSTRAINT `program_concept` FOREIGN KEY (`concept_id`) REFERENCES `concept` (`concept_id`),
  CONSTRAINT `program_creator` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`),
  CONSTRAINT `program_outcomes_concept_id_fk` FOREIGN KEY (`outcomes_concept_id`) REFERENCES `concept` (`concept_id`),
  CONSTRAINT `user_who_changed_program` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `program`
--

LOCK TABLES `program` WRITE;
/*!40000 ALTER TABLE `program` DISABLE KEYS */;
INSERT INTO `program` VALUES (1,2842,1,'2008-08-16 17:28:08',1,'2012-02-03 14:19:41',0,'MDR-TB PROGRAM','MDR-TB PROGRAM','34198d48-0370-102d-b0e3-001ec94a0cc1',NULL),(2,1482,1,'2011-06-02 14:35:30',1,'2011-06-02 17:13:40',0,'HIV Program','Program for HIV patients','b1eeb3e4-f975-40b9-afec-7c1a8e636cd2',NULL),(4,6428,1,'2011-09-07 09:58:19',1,'2011-09-08 09:55:40',0,'Rehab program','Physical rehabilitation program','e38b68e9-b25e-4f86-95b0-2974a9a7974f',NULL);
/*!40000 ALTER TABLE `program` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `program_workflow`
--

DROP TABLE IF EXISTS `program_workflow`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `program_workflow` (
  `program_workflow_id` int(11) NOT NULL AUTO_INCREMENT,
  `program_id` int(11) NOT NULL DEFAULT '0',
  `concept_id` int(11) NOT NULL DEFAULT '0',
  `creator` int(11) NOT NULL DEFAULT '0',
  `date_created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `retired` tinyint(1) NOT NULL DEFAULT '0',
  `changed_by` int(11) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `uuid` char(38) NOT NULL,
  PRIMARY KEY (`program_workflow_id`),
  UNIQUE KEY `program_workflow_uuid_index` (`uuid`),
  KEY `program_for_workflow` (`program_id`),
  KEY `workflow_concept` (`concept_id`),
  KEY `workflow_creator` (`creator`),
  KEY `workflow_voided_by` (`changed_by`),
  CONSTRAINT `program_for_workflow` FOREIGN KEY (`program_id`) REFERENCES `program` (`program_id`),
  CONSTRAINT `workflow_changed_by` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `workflow_concept` FOREIGN KEY (`concept_id`) REFERENCES `concept` (`concept_id`),
  CONSTRAINT `workflow_creator` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `program_workflow`
--

LOCK TABLES `program_workflow` WRITE;
/*!40000 ALTER TABLE `program_workflow` DISABLE KEYS */;
INSERT INTO `program_workflow` VALUES (1,1,3508,1,'2008-08-16 17:28:50',0,1,'2012-02-03 14:19:41','3419f864-0370-102d-b0e3-001ec94a0cc1'),(2,1,3506,1,'2008-08-16 17:28:50',1,1,'2012-02-03 14:19:41','3419f9ae-0370-102d-b0e3-001ec94a0cc1'),(3,1,3502,1,'2008-08-16 17:28:50',1,1,'2012-02-03 14:19:41','3419fa9e-0370-102d-b0e3-001ec94a0cc1'),(4,1,3524,1,'2010-11-11 13:05:11',0,1,'2012-02-03 14:19:41','bbca2400-1b99-4efa-a476-206c0f82a1ef'),(5,1,3521,1,'2010-11-11 13:05:11',0,1,'2012-02-03 14:19:41','63aaeb83-c377-4082-ac4c-5f4ceed69637'),(6,1,6416,1,'2010-11-11 13:05:33',0,1,'2012-02-03 14:19:41','bb8627ba-4a10-42ec-b13e-5dfea3df81c8'),(7,2,6424,1,'2011-06-02 17:12:36',0,1,'2011-06-02 17:13:40','ccf45370-a1e7-47aa-aaa7-3ee93749f02a'),(8,4,1484,1,'2011-09-07 09:58:19',0,1,'2011-09-08 09:55:40','23e491a8-3a3d-45fa-a301-e518ef097f9d');
/*!40000 ALTER TABLE `program_workflow` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `program_workflow_state`
--

DROP TABLE IF EXISTS `program_workflow_state`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `program_workflow_state` (
  `program_workflow_state_id` int(11) NOT NULL AUTO_INCREMENT,
  `program_workflow_id` int(11) NOT NULL DEFAULT '0',
  `concept_id` int(11) NOT NULL DEFAULT '0',
  `initial` tinyint(1) NOT NULL DEFAULT '0',
  `terminal` tinyint(1) NOT NULL DEFAULT '0',
  `creator` int(11) NOT NULL DEFAULT '0',
  `date_created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `retired` tinyint(1) NOT NULL DEFAULT '0',
  `changed_by` int(11) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `uuid` char(38) NOT NULL,
  PRIMARY KEY (`program_workflow_state_id`),
  UNIQUE KEY `program_workflow_state_uuid_index` (`uuid`),
  KEY `workflow_for_state` (`program_workflow_id`),
  KEY `state_concept` (`concept_id`),
  KEY `state_creator` (`creator`),
  KEY `state_voided_by` (`changed_by`),
  CONSTRAINT `state_changed_by` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `state_concept` FOREIGN KEY (`concept_id`) REFERENCES `concept` (`concept_id`),
  CONSTRAINT `state_creator` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`),
  CONSTRAINT `workflow_for_state` FOREIGN KEY (`program_workflow_id`) REFERENCES `program_workflow` (`program_workflow_id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `program_workflow_state`
--

LOCK TABLES `program_workflow_state` WRITE;
/*!40000 ALTER TABLE `program_workflow_state` DISABLE KEYS */;
INSERT INTO `program_workflow_state` VALUES (1,1,1746,1,1,1,'2008-08-16 17:29:56',0,1,'2012-02-03 14:19:41','341a66b4-0370-102d-b0e3-001ec94a0cc1'),(2,1,1714,1,1,1,'2008-08-16 17:29:56',0,1,'2012-02-03 14:19:41','341a6808-0370-102d-b0e3-001ec94a0cc1'),(3,1,843,1,1,1,'2008-08-16 17:29:56',0,1,'2012-02-03 14:19:41','341a6902-0370-102d-b0e3-001ec94a0cc1'),(4,1,1743,1,1,1,'2008-08-16 17:29:56',0,1,'2012-02-03 14:19:41','341a7d66-0370-102d-b0e3-001ec94a0cc1'),(5,1,1742,1,1,1,'2008-08-16 17:29:56',0,1,'2012-02-03 14:19:41','341a7e6a-0370-102d-b0e3-001ec94a0cc1'),(6,1,1744,1,1,1,'2008-08-16 17:29:56',0,1,'2012-02-03 14:19:41','341a7f5a-0370-102d-b0e3-001ec94a0cc1'),(7,1,3507,0,0,1,'2008-08-16 17:29:56',1,1,'2012-02-03 14:19:41','341a804a-0370-102d-b0e3-001ec94a0cc1'),(8,3,3501,0,0,1,'2008-08-16 17:30:41',1,1,'2012-02-03 14:19:41','341a813a-0370-102d-b0e3-001ec94a0cc1'),(9,3,3500,0,0,1,'2008-08-16 17:30:41',1,1,'2012-02-03 14:19:41','341a822a-0370-102d-b0e3-001ec94a0cc1'),(10,3,3499,0,0,1,'2008-08-16 17:30:41',1,1,'2012-02-03 14:19:41','341a831a-0370-102d-b0e3-001ec94a0cc1'),(11,3,1714,0,0,1,'2008-08-16 17:30:41',1,1,'2012-02-03 14:19:41','341a840a-0370-102d-b0e3-001ec94a0cc1'),(12,2,3505,0,0,1,'2008-08-16 17:31:16',1,1,'2012-02-03 14:19:41','341a84fa-0370-102d-b0e3-001ec94a0cc1'),(13,2,3504,0,0,1,'2008-08-16 17:31:16',1,1,'2012-02-03 14:19:41','341a85ea-0370-102d-b0e3-001ec94a0cc1'),(14,2,3503,0,0,1,'2008-08-16 17:31:16',1,1,'2012-02-03 14:19:41','341a86da-0370-102d-b0e3-001ec94a0cc1'),(15,2,1107,0,0,1,'2008-08-16 17:31:16',1,1,'2012-02-03 14:19:41','341a87ca-0370-102d-b0e3-001ec94a0cc1'),(16,4,3522,1,0,1,'2010-11-11 13:05:11',0,1,'2012-02-03 14:19:41','3745a3bc-c9ad-4011-85ee-c8dcbfd1ed97'),(17,4,3523,1,0,1,'2010-11-11 13:05:11',0,1,'2012-02-03 14:19:41','d4f92bdd-1e22-4578-a535-93dbb44c1fd4'),(18,4,6419,1,0,1,'2010-11-11 13:05:11',0,1,'2012-02-03 14:19:41','8b418fa9-e4fb-4da8-89ea-7d5dd2545554'),(19,5,1509,1,0,1,'2010-11-11 13:05:11',0,1,'2012-02-03 14:19:41','62947aa4-701d-4b43-b523-4932da252712'),(20,5,6419,1,0,1,'2010-11-11 13:05:11',0,1,'2012-02-03 14:19:41','c5af5671-fd5f-45f3-9634-6a90bd817175'),(21,5,5622,1,0,1,'2010-11-11 13:05:11',0,1,'2012-02-03 14:19:41','a6d7505c-d6db-461b-ac12-c52f404915f7'),(22,5,6420,1,0,1,'2010-11-11 13:05:11',0,1,'2012-02-03 14:19:41','db4ace29-9be1-47ef-9922-9553735ec956'),(23,5,1743,1,0,1,'2010-11-11 13:05:11',0,1,'2012-02-03 14:19:41','da376766-24f8-42b9-8815-27d34f18ab49'),(24,5,1526,1,0,1,'2010-11-11 13:05:11',0,1,'2012-02-03 14:19:41','13e48c26-f392-4454-8ae8-17c828e363a9'),(25,5,6349,1,0,1,'2010-11-11 13:05:11',0,1,'2012-02-03 14:19:41','ebd7123e-d7d2-4f3d-a096-5d19ec610919'),(26,6,1664,1,0,1,'2010-11-11 13:05:33',1,1,'2012-02-03 14:19:41','f962eef5-3ff8-4ca2-8054-5c6407fca025'),(27,6,3389,1,0,1,'2010-11-11 13:05:33',0,1,'2012-02-03 14:19:41','63f05870-32af-454d-9b44-763dce78fd33'),(29,1,5240,1,1,1,'2011-05-16 14:17:05',0,1,'2012-02-03 14:19:41','ac314226-c71c-4be4-9989-2973db447be0'),(30,1,6423,1,1,1,'2011-05-16 14:21:02',0,1,'2012-02-03 14:19:41','a77f0834-a5d9-4b63-8382-9b5a1d0da3ac'),(31,7,1742,1,1,1,'2011-06-02 17:13:40',0,1,NULL,'f4b25cd3-71e8-4023-a155-54d019f52d10'),(32,7,1744,1,1,1,'2011-06-02 17:13:40',0,1,NULL,'ca6e921c-a3c4-4d34-b689-4eea1c5fb533'),(33,7,5240,1,1,1,'2011-06-02 17:13:40',0,1,NULL,'9165476f-283c-46f4-a5f5-63feebe53c3c'),(34,1,6427,1,1,1,'2011-08-15 11:25:49',0,1,'2012-02-03 14:19:41','b85ce310-2962-4aba-b84d-96dabe579b3a'),(35,8,6436,1,0,1,'2011-09-08 09:55:40',0,1,'2012-01-19 12:09:15','a88b1712-c3cb-41d1-a79e-086d11f954e3'),(36,8,6435,1,0,1,'2011-09-08 09:55:40',0,1,'2012-01-19 12:09:15','e1b0d034-a17b-4343-b49b-bf97b626ec8d'),(37,8,6434,1,0,1,'2011-09-08 09:55:40',0,1,'2012-01-19 12:09:15','20d2cbcf-988e-4017-ad64-56bb902d334c'),(38,8,6432,1,0,1,'2011-09-08 09:55:40',0,1,'2012-01-19 12:09:15','d562a3fb-6d9b-40ed-b618-882b6e8430fe'),(39,8,6433,1,0,1,'2011-09-08 09:55:40',0,1,'2012-01-19 12:09:15','72e7ef78-3fde-4bb5-878e-8cc2ce29f144');
/*!40000 ALTER TABLE `program_workflow_state` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `encounter_type`
--

DROP TABLE IF EXISTS `encounter_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `encounter_type` (
  `encounter_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '',
  `description` text,
  `creator` int(11) NOT NULL DEFAULT '0',
  `date_created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `retired` tinyint(1) NOT NULL DEFAULT '0',
  `retired_by` int(11) DEFAULT NULL,
  `date_retired` datetime DEFAULT NULL,
  `retire_reason` varchar(255) DEFAULT NULL,
  `uuid` char(38) NOT NULL,
  PRIMARY KEY (`encounter_type_id`),
  UNIQUE KEY `encounter_type_uuid_index` (`uuid`),
  KEY `user_who_created_type` (`creator`),
  KEY `user_who_retired_encounter_type` (`retired_by`),
  KEY `retired_status` (`retired`),
  CONSTRAINT `user_who_created_type` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`),
  CONSTRAINT `user_who_retired_encounter_type` FOREIGN KEY (`retired_by`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `encounter_type`
--

LOCK TABLES `encounter_type` WRITE;
/*!40000 ALTER TABLE `encounter_type` DISABLE KEYS */;
INSERT INTO `encounter_type` VALUES (1,'Note','Note made in the patient clinical record',1,'2005-02-24 00:00:00',1,1,'2013-02-27 14:16:26','unneeded','327e7d86-0370-102d-b0e3-001ec94a0cc1'),(2,'Regimen Change','Regimen Change',1,'2005-02-24 00:00:00',1,1,'2013-02-27 14:16:31','unneeded','327e8074-0370-102d-b0e3-001ec94a0cc1'),(5,'Bacteriology Result','Bacteriology Result -- used by the MDRTB module',1,'2008-08-16 17:22:25',1,1,'2010-11-11 13:04:53','retired as part of MDR-TB migration','327e8196-0370-102d-b0e3-001ec94a0cc1'),(6,'DST Result','DST Result -- used by the MDRTB module',1,'2008-08-16 17:22:49',1,1,'2010-11-11 13:04:54','retired as part of MDR-TB migration','327e82a4-0370-102d-b0e3-001ec94a0cc1'),(7,'MDR-TB Intake','An initial encounter within the MDR-TB program',1,'2009-06-11 12:36:30',1,1,'2013-02-27 14:16:21','unneeded','327e83b2-0370-102d-b0e3-001ec94a0cc1'),(8,'MDR-TB Follow Up','A follow-up encounter within the MDR-TB program',1,'2009-06-11 12:37:11',1,1,'2013-02-27 14:16:17','unneeded','327e84c0-0370-102d-b0e3-001ec94a0cc1'),(9,'Specimen Collection','An encounter where blood, sputum, or some other sp',1,'2009-06-15 22:50:13',1,1,'2013-02-28 10:59:43','unneeded','327e85ce-0370-102d-b0e3-001ec94a0cc1'),(10,'ADULT INITIAL VISIT','Outpatient Adult Initial Visit',1,'2005-02-24 00:00:00',1,1,'2012-01-23 23:12:17','Too general.  Moved rehab to specific encounter','4d911d04-26fe-102b-80cb-0017a47871b2'),(11,'Rehab evaluation','A rehabilitation encounter with an evaluation -- initial or ongoing.',1,'2012-01-23 22:59:32',1,1,'2013-02-27 14:16:36','unneeded','e91a4139-e0e7-447f-a5dd-c4f3b92d27c9'),(12,'Patient Registration','Patient registration -- normally a new patient.  (In Kreyol, it\'s \'Enrejistreman\')',1,'2012-01-24 10:38:06',0,1,NULL,NULL,'873f968a-73a8-4f9c-ac78-9f4778b751b6'),(13,'Primary Care Reception','Primary care reception (in Kreyol it\'s \'resepsyon swen primè\')',1,'2012-01-24 10:39:13',0,1,NULL,NULL,'55a0d3ea-a4d7-4e88-8f01-5aceb2d3c61b'),(14,'Primary Care Visit','Primary care visit (In Kreyol, it\'s \'vizit swen primè\')',1,'2012-01-24 10:40:50',0,1,NULL,NULL,'1373cf95-06e8-468b-a3da-360ac1cf026d'),(15,'EpiInfo visit','These encounters were entered into EpiInfo.',1,'2012-01-26 16:06:58',0,NULL,NULL,NULL,'f5ca437a-d6a8-44b8-abc0-b7a9f2437fce'),(16,'Rehab Visit','A visit which includes only the weekly non evaluation encounters.',1,'2012-06-18 11:52:13',1,1,'2013-02-27 14:16:40','unneeded','343ca9dd-5576-45ff-bcf4-d8e2f36cab1b'),(17,'Lab test','Laboratory tests',1,'2012-07-26 11:47:52',1,1,'2013-02-27 14:16:13','unneeded','cf284c1b-4e27-4226-87e1-440616886346'),(18,'Mobile Clinic Reception','Mobile Clinic Reception',3,'2013-02-12 22:00:13',0,NULL,NULL,NULL,'35d094f1-d33b-4750-ab86-08213d5af6bb'),(19,'Mobile Clinic Consultation','Mobile Clinic Consultation',1,'2013-02-13 15:56:51',0,NULL,NULL,NULL,'fec6f3ed-6a3c-4c47-8982-a28f96befb5b'),(20,'Static Clinic Enrollment Visit','Static Clinic Enrollment Visit',1,'2013-02-26 11:38:11',0,NULL,NULL,NULL,'7c4c0494-5dbe-441b-84fc-1d3e7560eaa9'),(21,'TB Results','TB Results',1,'2013-02-28 11:00:13',0,NULL,NULL,NULL,'d6c6cd8f-2964-4567-a279-bcf2f8030674');
/*!40000 ALTER TABLE `encounter_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_type`
--

DROP TABLE IF EXISTS `order_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_type` (
  `order_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT '',
  `creator` int(11) NOT NULL DEFAULT '0',
  `date_created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `retired` tinyint(1) NOT NULL DEFAULT '0',
  `retired_by` int(11) DEFAULT NULL,
  `date_retired` datetime DEFAULT NULL,
  `retire_reason` varchar(255) DEFAULT NULL,
  `uuid` char(38) NOT NULL,
  PRIMARY KEY (`order_type_id`),
  UNIQUE KEY `order_type_uuid_index` (`uuid`),
  KEY `type_created_by` (`creator`),
  KEY `user_who_retired_order_type` (`retired_by`),
  KEY `retired_status` (`retired`),
  CONSTRAINT `type_created_by` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`),
  CONSTRAINT `user_who_retired_order_type` FOREIGN KEY (`retired_by`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_type`
--

LOCK TABLES `order_type` WRITE;
/*!40000 ALTER TABLE `order_type` DISABLE KEYS */;
INSERT INTO `order_type` VALUES (1,'Drug','Drug',1,'2008-08-16 17:26:51',0,1,NULL,NULL,'33ccf820-0370-102d-b0e3-001ec94a0cc1'),(2,'Drug Order','Drug Order',1,'2008-08-16 17:27:12',0,1,NULL,NULL,'33ccfbae-0370-102d-b0e3-001ec94a0cc1'),(3,'Lab Order','Order for a Laboratory Test',1,'2009-06-26 21:20:31',0,1,NULL,NULL,'33ccfcc6-0370-102d-b0e3-001ec94a0cc1');
/*!40000 ALTER TABLE `order_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `relationship_type`
--

DROP TABLE IF EXISTS `relationship_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `relationship_type` (
  `relationship_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `a_is_to_b` varchar(50) NOT NULL,
  `b_is_to_a` varchar(50) NOT NULL,
  `preferred` int(1) NOT NULL DEFAULT '0',
  `weight` int(11) NOT NULL DEFAULT '0',
  `description` varchar(255) NOT NULL DEFAULT '',
  `creator` int(11) NOT NULL DEFAULT '0',
  `date_created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `uuid` char(38) NOT NULL,
  `retired` tinyint(1) NOT NULL DEFAULT '0',
  `retired_by` int(11) DEFAULT NULL,
  `date_retired` datetime DEFAULT NULL,
  `retire_reason` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`relationship_type_id`),
  UNIQUE KEY `relationship_type_uuid_index` (`uuid`),
  KEY `user_who_created_rel` (`creator`),
  KEY `user_who_retired_relationship_type` (`retired_by`),
  CONSTRAINT `user_who_created_rel` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`),
  CONSTRAINT `user_who_retired_relationship_type` FOREIGN KEY (`retired_by`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `relationship_type`
--

LOCK TABLES `relationship_type` WRITE;
/*!40000 ALTER TABLE `relationship_type` DISABLE KEYS */;
INSERT INTO `relationship_type` VALUES (1,'Doctor','Patient',0,0,'Relationship from a primary care provider to the patient',1,'2007-05-04 09:59:22','8d919b58-c2cc-11de-8d13-0010c6dffd0f',0,1,NULL,NULL),(2,'Sibling','Sibling',0,0,'Relationship between brother/sister, brother/brother, and sister/sister',1,'2007-05-04 09:59:22','8d91a01c-c2cc-11de-8d13-0010c6dffd0f',0,1,NULL,NULL),(3,'Parent','Child',0,0,'Relationship from a mother/father to the child',1,'2007-05-04 09:59:22','8d91a210-c2cc-11de-8d13-0010c6dffd0f',0,1,NULL,NULL),(4,'Aunt/Uncle','Niece/Nephew',0,0,'Auto generated by OpenMRS',1,'2007-05-04 09:59:22','8d91a3dc-c2cc-11de-8d13-0010c6dffd0f',0,1,NULL,NULL),(5,'Treatment Supporter','Treatment Supportee',0,0,' Treatment Supporter/Treatment Supportee',1,'2008-08-16 17:20:01','341b635c-0370-102d-b0e3-001ec94a0cc1',0,1,NULL,NULL),(6,'Husband','Wife',0,0,'Husband or Wife / Husband or Wife',1,'2008-09-18 13:14:54','341b644c-0370-102d-b0e3-001ec94a0cc1',0,1,NULL,NULL);
/*!40000 ALTER TABLE `relationship_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `provider_attribute_type`
--

DROP TABLE IF EXISTS `provider_attribute_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `provider_attribute_type` (
  `provider_attribute_type_id` int(11) NOT NULL AUTO_INCREMENT,
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
  PRIMARY KEY (`provider_attribute_type_id`),
  UNIQUE KEY `uuid` (`uuid`),
  KEY `provider_attribute_type_creator_fk` (`creator`),
  KEY `provider_attribute_type_changed_by_fk` (`changed_by`),
  KEY `provider_attribute_type_retired_by_fk` (`retired_by`),
  CONSTRAINT `provider_attribute_type_changed_by_fk` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `provider_attribute_type_creator_fk` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`),
  CONSTRAINT `provider_attribute_type_retired_by_fk` FOREIGN KEY (`retired_by`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `provider_attribute_type`
--

LOCK TABLES `provider_attribute_type` WRITE;
/*!40000 ALTER TABLE `provider_attribute_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `provider_attribute_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `provider_attribute`
--

DROP TABLE IF EXISTS `provider_attribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `provider_attribute` (
  `provider_attribute_id` int(11) NOT NULL AUTO_INCREMENT,
  `provider_id` int(11) NOT NULL,
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
  PRIMARY KEY (`provider_attribute_id`),
  UNIQUE KEY `uuid` (`uuid`),
  KEY `provider_attribute_provider_fk` (`provider_id`),
  KEY `provider_attribute_attribute_type_id_fk` (`attribute_type_id`),
  KEY `provider_attribute_creator_fk` (`creator`),
  KEY `provider_attribute_changed_by_fk` (`changed_by`),
  KEY `provider_attribute_voided_by_fk` (`voided_by`),
  CONSTRAINT `provider_attribute_attribute_type_id_fk` FOREIGN KEY (`attribute_type_id`) REFERENCES `provider_attribute_type` (`provider_attribute_type_id`),
  CONSTRAINT `provider_attribute_changed_by_fk` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `provider_attribute_creator_fk` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`),
  CONSTRAINT `provider_attribute_provider_fk` FOREIGN KEY (`provider_id`) REFERENCES `provider` (`provider_id`),
  CONSTRAINT `provider_attribute_voided_by_fk` FOREIGN KEY (`voided_by`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `provider_attribute`
--

LOCK TABLES `provider_attribute` WRITE;
/*!40000 ALTER TABLE `provider_attribute` DISABLE KEYS */;
/*!40000 ALTER TABLE `provider_attribute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `visit_attribute_type`
--

DROP TABLE IF EXISTS `visit_attribute_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `visit_attribute_type` (
  `visit_attribute_type_id` int(11) NOT NULL AUTO_INCREMENT,
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
  PRIMARY KEY (`visit_attribute_type_id`),
  UNIQUE KEY `uuid` (`uuid`),
  KEY `visit_attribute_type_creator_fk` (`creator`),
  KEY `visit_attribute_type_changed_by_fk` (`changed_by`),
  KEY `visit_attribute_type_retired_by_fk` (`retired_by`),
  CONSTRAINT `visit_attribute_type_changed_by_fk` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `visit_attribute_type_creator_fk` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`),
  CONSTRAINT `visit_attribute_type_retired_by_fk` FOREIGN KEY (`retired_by`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `visit_attribute_type`
--

LOCK TABLES `visit_attribute_type` WRITE;
/*!40000 ALTER TABLE `visit_attribute_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `visit_attribute_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `visit_type`
--

DROP TABLE IF EXISTS `visit_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `visit_type` (
  `visit_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` varchar(1024) DEFAULT NULL,
  `uuid` char(38) NOT NULL,
  `creator` int(11) NOT NULL,
  `date_created` datetime NOT NULL,
  `changed_by` int(11) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `retired` tinyint(4) NOT NULL DEFAULT '0',
  `retired_by` int(11) DEFAULT NULL,
  `date_retired` datetime DEFAULT NULL,
  `retire_reason` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`visit_type_id`),
  UNIQUE KEY `uuid` (`uuid`),
  KEY `visit_type_creator` (`creator`),
  KEY `visit_type_changed_by` (`changed_by`),
  KEY `visit_type_retired_by` (`retired_by`),
  CONSTRAINT `visit_type_changed_by` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `visit_type_creator` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`),
  CONSTRAINT `visit_type_retired_by` FOREIGN KEY (`retired_by`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `visit_type`
--

LOCK TABLES `visit_type` WRITE;
/*!40000 ALTER TABLE `visit_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `visit_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role` (
  `role` varchar(50) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT '',
  `uuid` char(38) NOT NULL,
  PRIMARY KEY (`role`),
  UNIQUE KEY `role_uuid_index` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES ('Anonymous','Privileges for non-authenticated users.','774b2af3-6437-4e5a-a310-547554c7c65c'),('Authenticated','Privileges gained once authentication has been established.','f7fd42ef-880e-40c5-972d-e4ae7c990de2'),('Clinician','Users who are a part of direct patient care.','341cb8a6-0370-102d-b0e3-001ec94a0cc1'),('Data Assistant','Clerks who perform data entry.','341cb9aa-0370-102d-b0e3-001ec94a0cc1'),('Data Manager','User who maintains clinical data stored within the OpenMRS repository.','341cbaae-0370-102d-b0e3-001ec94a0cc1'),('Everything','Temporary role to give all privileges to everyone','341cbb9e-0370-102d-b0e3-001ec94a0cc1'),('LacollineProvider','Provides medical services at La Colline hospital','2107293d-d104-40d2-a7bf-d5c40e3f012e'),('MDR-TB Application User','Allows access to the MDR-TB Application','21031583-e2ae-4485-8d66-4a97f803ae7c'),('MDR-TB Site Only','People who cannot see the regular homepage and are automatically redirected to the MDR-TB one','341cbc98-0370-102d-b0e3-001ec94a0cc1'),('Mobile Clinic Admin User','m','13bcfe9b-8b27-43f2-8959-c7f7e82c7d9f'),('Mobile Clinic Application User','m','48fb2417-bec7-45ff-a01c-2cb2e0514d3d'),('Outpatient Application User','Allows access to the outpatient application, including patient registration and primary care reception and visits','b9acdea9-47ce-4539-b8c0-29b7fc0846fa'),('Outpatient Application User - Supervisor','Outpatient Application User - Supervisor','ed54f8d7-c1ab-429b-82fb-21f36823a011'),('Provider','Health care provider','8d94f280-c2cc-11de-8d13-0010c6dffd0f'),('Rehab Application User','Allows access to the rehab application from the home page','cee15cd4-58c7-4450-9817-2e3b1acb83be'),('Rehab educator','Physical rehabilitation educators','55a5bc23-7733-49db-93b0-27dc0558a39f'),('Rehab technician','Physical rehabilitation technician','81bf1078-eb41-4053-990d-93062a10225c'),('Report user','Users of reports, but do not design or build reports','7d86495c-8729-4a86-87c3-8b120741c5ee'),('System Administrator','Users with this role have access to the administration section','83d0f2e8-7c3d-44d4-abb4-9de59162164a'),('System Developer','Developers of the OpenMRS .. have additional access to change fundamental structure of the database model.','8d94f852-c2cc-11de-8d13-0010c6dffd0f');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_role`
--

DROP TABLE IF EXISTS `role_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role_role` (
  `parent_role` varchar(50) NOT NULL DEFAULT '',
  `child_role` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`parent_role`,`child_role`),
  KEY `inherited_role` (`child_role`),
  CONSTRAINT `inherited_role` FOREIGN KEY (`child_role`) REFERENCES `role` (`role`),
  CONSTRAINT `parent_role` FOREIGN KEY (`parent_role`) REFERENCES `role` (`role`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_role`
--

LOCK TABLES `role_role` WRITE;
/*!40000 ALTER TABLE `role_role` DISABLE KEYS */;
INSERT INTO `role_role` VALUES ('Everything','Clinician'),('MDR-TB Site Only','Clinician'),('Provider','Clinician'),('Everything','Data Assistant'),('Data Assistant','Data Manager'),('System Developer','Everything'),('System Developer','MDR-TB Application User'),('Everything','MDR-TB Site Only'),('Outpatient Application User','Outpatient Application User - Supervisor'),('System Developer','Rehab Application User'),('Clinician','Rehab educator'),('Provider','Rehab technician'),('System Developer','System Administrator');
/*!40000 ALTER TABLE `role_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_privilege`
--

DROP TABLE IF EXISTS `role_privilege`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role_privilege` (
  `role` varchar(50) NOT NULL DEFAULT '',
  `privilege` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`privilege`,`role`),
  KEY `role_privilege` (`role`),
  CONSTRAINT `privilege_definitons` FOREIGN KEY (`privilege`) REFERENCES `privilege` (`privilege`),
  CONSTRAINT `role_privilege` FOREIGN KEY (`role`) REFERENCES `role` (`role`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_privilege`
--

LOCK TABLES `role_privilege` WRITE;
/*!40000 ALTER TABLE `role_privilege` DISABLE KEYS */;
INSERT INTO `role_privilege` VALUES ('Anonymous','View Navigation Menu'),('Authenticated','View Concept Classes'),('Authenticated','View Concept Datatypes'),('Authenticated','View Encounter Types'),('Authenticated','View Field Types'),('Authenticated','View Global Properties'),('Authenticated','View Identifier Types'),('Authenticated','View Locations'),('Authenticated','View Order Types'),('Authenticated','View Person Attribute Types'),('Authenticated','View Privileges'),('Authenticated','View Relationship Types'),('Authenticated','View Relationships'),('Authenticated','View Roles'),('Data Assistant','Add Patients'),('Data Assistant','Add People'),('Data Assistant','Add Relationships'),('Data Assistant','Delete Relationships'),('Data Assistant','Edit Patients'),('Data Assistant','Edit People'),('Data Assistant','Edit Relationships'),('Data Assistant','Manage Programs'),('Data Assistant','Patient Dashboard - View Demographics Section'),('Data Assistant','Patient Dashboard - View Encounters Section'),('Data Assistant','Patient Dashboard - View Forms Section'),('Data Assistant','Patient Dashboard - View Overview Section'),('Data Assistant','View Concepts'),('Data Assistant','View Encounters'),('Data Assistant','View Forms'),('Data Assistant','View Navigation Menu'),('Data Assistant','View Observations'),('Data Assistant','View Patient Identifiers'),('Data Assistant','View Patients'),('Data Assistant','View People'),('Data Assistant','View Programs'),('Data Assistant','View Users'),('Data Manager','Add Observations'),('Data Manager','Add Patients'),('Data Manager','Delete Observations'),('Data Manager','Delete Report Objects'),('Data Manager','Edit Encounters'),('Data Manager','Edit Observations'),('Data Manager','Edit Patients'),('Data Manager','Manage Alerts'),('Data Manager','Manage Locations'),('Data Manager','Patient Dashboard - View Demographics Section'),('Data Manager','Patient Dashboard - View Encounters Section'),('Data Manager','Patient Dashboard - View Forms Section'),('Data Manager','Patient Dashboard - View Graphs Section'),('Data Manager','View Administration Functions'),('Data Manager','View Concepts'),('Data Manager','View Data Entry Statistics'),('Data Manager','View Encounters'),('Data Manager','View Forms'),('Data Manager','View Navigation Menu'),('Data Manager','View Observations'),('Data Manager','View Orders'),('Data Manager','View Patient Cohorts'),('Data Manager','View Patient Identifiers'),('Data Manager','View Patients'),('Data Manager','View People'),('Data Manager','View Programs'),('Data Manager','View Users'),('Everything','Add Cohorts'),('Everything','Add Concept Proposals'),('Everything','Add Encounters'),('Everything','Add FormEntry Archive'),('Everything','Add FormEntry Error'),('Everything','Add FormEntry Queue'),('Everything','Add Observations'),('Everything','Add Orders'),('Everything','Add Patient Identifiers'),('Everything','Add Patient Programs'),('Everything','Add Patients'),('Everything','Add People'),('Everything','Add Relationships'),('Everything','Add Report Objects'),('Everything','Add Reports'),('Everything','Add Users'),('Everything','Delete Cohorts'),('Everything','Delete Concept Proposals'),('Everything','Delete Encounters'),('Everything','Delete FormEntry Archive'),('Everything','Delete FormEntry Error'),('Everything','Delete FormEntry Queue'),('Everything','Delete Observations'),('Everything','Delete Orders'),('Everything','Delete Patient Identifiers'),('Everything','Delete Patient Programs'),('Everything','Delete Patients'),('Everything','Delete People'),('Everything','Delete Relationships'),('Everything','Delete Report Objects'),('Everything','Delete Reports'),('Everything','Delete Users'),('Everything','Edit Cohorts'),('Everything','Edit Concept Proposals'),('Everything','Edit Encounters'),('Everything','Edit FormEntry Archive'),('Everything','Edit FormEntry Error'),('Everything','Edit FormEntry Queue'),('Everything','Edit Observations'),('Everything','Edit Orders'),('Everything','Edit Patient Identifiers'),('Everything','Edit Patient Programs'),('Everything','Edit Patients'),('Everything','Edit People'),('Everything','Edit Relationships'),('Everything','Edit Report Objects'),('Everything','Edit Reports'),('Everything','Edit User Passwords'),('Everything','Edit Users'),('Everything','Edit Visits'),('Everything','Form Entry'),('Everything','Generate Batch of Identifiers'),('Everything','Manage Alerts'),('Everything','Manage Concept Classes'),('Everything','Manage Concept Datatypes'),('Everything','Manage Concept Sources'),('Everything','Manage Concepts'),('Everything','Manage Encounter Roles'),('Everything','Manage Encounter Types'),('Everything','Manage Field Types'),('Everything','Manage FormEntry XSN'),('Everything','Manage Forms'),('Everything','Manage Global Properties'),('Everything','Manage Identifier Sources'),('Everything','Manage Identifier Types'),('Everything','Manage Locations'),('Everything','Manage Modules'),('Everything','Manage Order Types'),('Everything','Manage Person Attribute Types'),('Everything','Manage Privileges'),('Everything','Manage Programs'),('Everything','Manage Relationship Types'),('Everything','Manage Relationships'),('Everything','Manage Reports'),('Everything','Manage Roles'),('Everything','Manage Scheduler'),('Everything','Patient Dashboard - View Demographics Section'),('Everything','Patient Dashboard - View Encounters Section'),('Everything','Patient Dashboard - View Forms Section'),('Everything','Patient Dashboard - View Graphs Section'),('Everything','Patient Dashboard - View Overview Section'),('Everything','Patient Dashboard - View Patient Summary'),('Everything','Patient Dashboard - View Regimen Section'),('Everything','Purge Field Types'),('Everything','Upload Batch of Identifiers'),('Everything','Upload XSN'),('Everything','View Administration Functions'),('Everything','View Concept Classes'),('Everything','View Concept Datatypes'),('Everything','View Concept Proposals'),('Everything','View Concept Sources'),('Everything','View Concepts'),('Everything','View Data Entry Statistics'),('Everything','View Encounter Types'),('Everything','View Encounters'),('Everything','View Field Types'),('Everything','View FormEntry Archive'),('Everything','View FormEntry Error'),('Everything','View FormEntry Queue'),('Everything','View Forms'),('Everything','View Global Properties'),('Everything','View Identifier Types'),('Everything','View Locations'),('Everything','View Navigation Menu'),('Everything','View Observations'),('Everything','View Order Types'),('Everything','View Orders'),('Everything','View Patient Cohorts'),('Everything','View Patient Identifiers'),('Everything','View Patient Programs'),('Everything','View Patients'),('Everything','View People'),('Everything','View Person Attribute Types'),('Everything','View Privileges'),('Everything','View Programs'),('Everything','View Providers'),('Everything','View Relationship Types'),('Everything','View Relationships'),('Everything','View RelationshipTypes'),('Everything','View Report Objects'),('Everything','View Reports'),('Everything','View Roles'),('Everything','View Unpublished Forms'),('Everything','View Users'),('Everything','View Visits'),('Mobile Clinic Admin User','Add Cohorts'),('Mobile Clinic Admin User','Add Concept Proposals'),('Mobile Clinic Admin User','Add Encounters'),('Mobile Clinic Admin User','Add FormEntry Archive'),('Mobile Clinic Admin User','Add FormEntry Error'),('Mobile Clinic Admin User','Add FormEntry Queue'),('Mobile Clinic Admin User','Add HL7 Inbound Archive'),('Mobile Clinic Admin User','Add HL7 Inbound Exception'),('Mobile Clinic Admin User','Add HL7 Inbound Queue'),('Mobile Clinic Admin User','Add HL7 Source'),('Mobile Clinic Admin User','Add Observations'),('Mobile Clinic Admin User','Add Orders'),('Mobile Clinic Admin User','Add Patient Identifiers'),('Mobile Clinic Admin User','Add Patients'),('Mobile Clinic Admin User','Add People'),('Mobile Clinic Admin User','Add Relationships'),('Mobile Clinic Admin User','Add Report Objects'),('Mobile Clinic Admin User','Add Reports'),('Mobile Clinic Admin User','Add Users'),('Mobile Clinic Admin User','Add Visits'),('Mobile Clinic Admin User','Configure Visits'),('Mobile Clinic Admin User','Delete Cohorts'),('Mobile Clinic Admin User','Delete Concept Proposals'),('Mobile Clinic Admin User','Delete Encounters'),('Mobile Clinic Admin User','Delete FormEntry Archive'),('Mobile Clinic Admin User','Delete FormEntry Error'),('Mobile Clinic Admin User','Delete FormEntry Queue'),('Mobile Clinic Admin User','Delete HL7 Inbound Archive'),('Mobile Clinic Admin User','Delete HL7 Inbound Exception'),('Mobile Clinic Admin User','Delete HL7 Inbound Queue'),('Mobile Clinic Admin User','Delete Observations'),('Mobile Clinic Admin User','Delete Orders'),('Mobile Clinic Admin User','Delete Patient Identifiers'),('Mobile Clinic Admin User','Delete Patients'),('Mobile Clinic Admin User','Delete People'),('Mobile Clinic Admin User','Delete Relationships'),('Mobile Clinic Admin User','Delete Report Objects'),('Mobile Clinic Admin User','Delete Reports'),('Mobile Clinic Admin User','Delete Users'),('Mobile Clinic Admin User','Delete Visits'),('Mobile Clinic Admin User','Edit Cohorts'),('Mobile Clinic Admin User','Edit Concept Proposals'),('Mobile Clinic Admin User','Edit Encounters'),('Mobile Clinic Admin User','Edit FormEntry Archive'),('Mobile Clinic Admin User','Edit FormEntry Error'),('Mobile Clinic Admin User','Edit FormEntry Queue'),('Mobile Clinic Admin User','Edit Observations'),('Mobile Clinic Admin User','Edit Orders'),('Mobile Clinic Admin User','Edit Patient Identifiers'),('Mobile Clinic Admin User','Edit Patients'),('Mobile Clinic Admin User','Edit People'),('Mobile Clinic Admin User','Edit Relationships'),('Mobile Clinic Admin User','Edit Report Objects'),('Mobile Clinic Admin User','Edit Reports'),('Mobile Clinic Admin User','Edit User Passwords'),('Mobile Clinic Admin User','Edit Users'),('Mobile Clinic Admin User','Edit Visits'),('Mobile Clinic Admin User','Form Entry'),('Mobile Clinic Admin User','Generate Batch of Identifiers'),('Mobile Clinic Admin User','Groovy Scripting'),('Mobile Clinic Admin User','List Groovy Scripts'),('Mobile Clinic Admin User','Manage Address Hierarchy'),('Mobile Clinic Admin User','Manage Address Templates'),('Mobile Clinic Admin User','Manage Alerts'),('Mobile Clinic Admin User','Manage Auto Generation Options'),('Mobile Clinic Admin User','Manage Cohort Definitions'),('Mobile Clinic Admin User','Manage Concept Classes'),('Mobile Clinic Admin User','Manage Concept Datatypes'),('Mobile Clinic Admin User','Manage Concept Map Types'),('Mobile Clinic Admin User','Manage Concept Name tags'),('Mobile Clinic Admin User','Manage Concept Reference Terms'),('Mobile Clinic Admin User','Manage Concept Sources'),('Mobile Clinic Admin User','Manage Concept Stop Words'),('Mobile Clinic Admin User','Manage Concepts'),('Mobile Clinic Admin User','Manage Custom Messages'),('Mobile Clinic Admin User','Manage Data Set Definitions'),('Mobile Clinic Admin User','Manage Dimension Definitions'),('Mobile Clinic Admin User','Manage Encounter Roles'),('Mobile Clinic Admin User','Manage Encounter Types'),('Mobile Clinic Admin User','Manage Field Types'),('Mobile Clinic Admin User','Manage Flags'),('Mobile Clinic Admin User','Manage FormEntry XSN'),('Mobile Clinic Admin User','Manage Forms'),('Mobile Clinic Admin User','Manage Global Properties'),('Mobile Clinic Admin User','Manage HL7 Messages'),('Mobile Clinic Admin User','Manage Homepages'),('Mobile Clinic Admin User','Manage Identifier Sources'),('Mobile Clinic Admin User','Manage Identifier Types'),('Mobile Clinic Admin User','Manage Implementation Id'),('Mobile Clinic Admin User','Manage Indicator Definitions'),('Mobile Clinic Admin User','Manage Location Attribute Types'),('Mobile Clinic Admin User','Manage Location Tags'),('Mobile Clinic Admin User','Manage Locations'),('Mobile Clinic Admin User','Manage Modules'),('Mobile Clinic Admin User','Manage Order Types'),('Mobile Clinic Admin User','Manage Person Attribute Types'),('Mobile Clinic Admin User','Manage Privileges'),('Mobile Clinic Admin User','Manage Providers'),('Mobile Clinic Admin User','Manage Relationship Types'),('Mobile Clinic Admin User','Manage Relationships'),('Mobile Clinic Admin User','Manage Report Definitions'),('Mobile Clinic Admin User','Manage Roles'),('Mobile Clinic Admin User','Manage Rule Definitions'),('Mobile Clinic Admin User','Manage Scheduled Report Tasks'),('Mobile Clinic Admin User','Manage Scheduler'),('Mobile Clinic Admin User','Manage Synchronization'),('Mobile Clinic Admin User','Manage Token Registrations'),('Mobile Clinic Admin User','Manage Tokens'),('Mobile Clinic Admin User','Manage Visit Attribute Types'),('Mobile Clinic Admin User','Manage Visit Types'),('Mobile Clinic Admin User','Metadata Mapping'),('Mobile Clinic Admin User','Patient Dashboard - View Demographics Section'),('Mobile Clinic Admin User','Patient Dashboard - View Encounters Section'),('Mobile Clinic Admin User','Patient Dashboard - View Overview Section'),('Mobile Clinic Admin User','Patient Dashboard - View Patient Summary'),('Mobile Clinic Admin User','Patient Registration Task - mobileClinic'),('Mobile Clinic Admin User','Patient Registration Task - patientLookup'),('Mobile Clinic Admin User','Patient Registration Task - reporting'),('Mobile Clinic Admin User','Patient Registration Task - viewDuplicates'),('Mobile Clinic Admin User','Purge Field Types'),('Mobile Clinic Admin User','Purge Global Properties'),('Mobile Clinic Admin User','Run Groovy Scripts'),('Mobile Clinic Admin User','Run Reports'),('Mobile Clinic Admin User','Share Metadata'),('Mobile Clinic Admin User','SQL Level Access'),('Mobile Clinic Admin User','Test Flags'),('Mobile Clinic Admin User','Update HL7 Inbound Archive'),('Mobile Clinic Admin User','Update HL7 Inbound Exception'),('Mobile Clinic Admin User','Update HL7 Inbound Queue'),('Mobile Clinic Admin User','Update HL7 Source'),('Mobile Clinic Admin User','Upload Batch of Identifiers'),('Mobile Clinic Admin User','Upload XSN'),('Mobile Clinic Admin User','Validate Objects'),('Mobile Clinic Admin User','View Administration Functions'),('Mobile Clinic Admin User','View Calculations'),('Mobile Clinic Admin User','View Concept Classes'),('Mobile Clinic Admin User','View Concept Datatypes'),('Mobile Clinic Admin User','View Concept Map Types'),('Mobile Clinic Admin User','View Concept Proposals'),('Mobile Clinic Admin User','View Concept Reference Terms'),('Mobile Clinic Admin User','View Concept Sources'),('Mobile Clinic Admin User','View Concepts'),('Mobile Clinic Admin User','View Data Entry Statistics'),('Mobile Clinic Admin User','View Database Changes'),('Mobile Clinic Admin User','View Encounter Roles'),('Mobile Clinic Admin User','View Encounter Types'),('Mobile Clinic Admin User','View Encounters'),('Mobile Clinic Admin User','View Field Types'),('Mobile Clinic Admin User','View FormEntry Archive'),('Mobile Clinic Admin User','View FormEntry Error'),('Mobile Clinic Admin User','View FormEntry Queue'),('Mobile Clinic Admin User','View Forms'),('Mobile Clinic Admin User','View Global Properties'),('Mobile Clinic Admin User','View HL7 Inbound Archive'),('Mobile Clinic Admin User','View HL7 Inbound Exception'),('Mobile Clinic Admin User','View HL7 Inbound Queue'),('Mobile Clinic Admin User','View HL7 Source'),('Mobile Clinic Admin User','View Identifier Types'),('Mobile Clinic Admin User','View Location Attribute Types'),('Mobile Clinic Admin User','View Locations'),('Mobile Clinic Admin User','View Navigation Menu'),('Mobile Clinic Admin User','View Observations'),('Mobile Clinic Admin User','View Order Types'),('Mobile Clinic Admin User','View Orders'),('Mobile Clinic Admin User','View Patient Cohorts'),('Mobile Clinic Admin User','View Patient Identifiers'),('Mobile Clinic Admin User','View Patients'),('Mobile Clinic Admin User','View People'),('Mobile Clinic Admin User','View Person Attribute Types'),('Mobile Clinic Admin User','View Privileges'),('Mobile Clinic Admin User','View Providers'),('Mobile Clinic Admin User','View Relationship Types'),('Mobile Clinic Admin User','View Relationships'),('Mobile Clinic Admin User','View RelationshipTypes'),('Mobile Clinic Admin User','View Report Objects'),('Mobile Clinic Admin User','View Reports'),('Mobile Clinic Admin User','View Roles'),('Mobile Clinic Admin User','View Rule Definitions'),('Mobile Clinic Admin User','View Synchronization Records'),('Mobile Clinic Admin User','View Synchronization Status'),('Mobile Clinic Admin User','View Token Registrations'),('Mobile Clinic Admin User','View Unpublished Forms'),('Mobile Clinic Admin User','View Users'),('Mobile Clinic Admin User','View Visit Attribute Types'),('Mobile Clinic Admin User','View Visit Types'),('Mobile Clinic Admin User','View Visits'),('Mobile Clinic Application User','Add Encounters'),('Mobile Clinic Application User','Add Observations'),('Mobile Clinic Application User','Add Patient Identifiers'),('Mobile Clinic Application User','Add Patients'),('Mobile Clinic Application User','Add People'),('Mobile Clinic Application User','Add Report Objects'),('Mobile Clinic Application User','Add Reports'),('Mobile Clinic Application User','Add Users'),('Mobile Clinic Application User','Delete Encounters'),('Mobile Clinic Application User','Delete Observations'),('Mobile Clinic Application User','Delete Patient Identifiers'),('Mobile Clinic Application User','Delete Patients'),('Mobile Clinic Application User','Delete People'),('Mobile Clinic Application User','Delete Report Objects'),('Mobile Clinic Application User','Delete Reports'),('Mobile Clinic Application User','Delete Users'),('Mobile Clinic Application User','Edit Encounters'),('Mobile Clinic Application User','Edit Observations'),('Mobile Clinic Application User','Edit Patient Identifiers'),('Mobile Clinic Application User','Edit Patients'),('Mobile Clinic Application User','Edit People'),('Mobile Clinic Application User','Edit Report Objects'),('Mobile Clinic Application User','Edit Reports'),('Mobile Clinic Application User','Edit User Passwords'),('Mobile Clinic Application User','Edit Users'),('Mobile Clinic Application User','Form Entry'),('Mobile Clinic Application User','Generate Batch of Identifiers'),('Mobile Clinic Application User','Manage Address Hierarchy'),('Mobile Clinic Application User','Manage Address Templates'),('Mobile Clinic Application User','Manage Auto Generation Options'),('Mobile Clinic Application User','Manage Encounter Roles'),('Mobile Clinic Application User','Manage Global Properties'),('Mobile Clinic Application User','Manage Identifier Sources'),('Mobile Clinic Application User','Manage Location Attribute Types'),('Mobile Clinic Application User','Manage Location Tags'),('Mobile Clinic Application User','Manage Locations'),('Mobile Clinic Application User','Patient Dashboard - View Demographics Section'),('Mobile Clinic Application User','Patient Dashboard - View Encounters Section'),('Mobile Clinic Application User','Patient Dashboard - View Overview Section'),('Mobile Clinic Application User','Patient Registration Task - mobileClinic'),('Mobile Clinic Application User','Patient Registration Task - patientLookup'),('Mobile Clinic Application User','Patient Registration Task - reporting'),('Mobile Clinic Application User','Patient Registration Task - viewDuplicates'),('Mobile Clinic Application User','Purge Global Properties'),('Mobile Clinic Application User','Run Reports'),('Mobile Clinic Application User','SQL Level Access'),('Mobile Clinic Application User','Upload Batch of Identifiers'),('Mobile Clinic Application User','Validate Objects'),('Mobile Clinic Application User','View Administration Functions'),('Mobile Clinic Application User','View Concepts'),('Mobile Clinic Application User','View Data Entry Statistics'),('Mobile Clinic Application User','View Encounter Roles'),('Mobile Clinic Application User','View Encounters'),('Mobile Clinic Application User','View Forms'),('Mobile Clinic Application User','View Global Properties'),('Mobile Clinic Application User','View Identifier Types'),('Mobile Clinic Application User','View Location Attribute Types'),('Mobile Clinic Application User','View Locations'),('Mobile Clinic Application User','View Navigation Menu'),('Mobile Clinic Application User','View Observations'),('Mobile Clinic Application User','View Orders'),('Mobile Clinic Application User','View Patient Cohorts'),('Mobile Clinic Application User','View Patient Identifiers'),('Mobile Clinic Application User','View Patients'),('Mobile Clinic Application User','View People'),('Mobile Clinic Application User','View Person Attribute Types'),('Mobile Clinic Application User','View Privileges'),('Mobile Clinic Application User','View Providers'),('Mobile Clinic Application User','View Report Objects'),('Mobile Clinic Application User','View Reports'),('Mobile Clinic Application User','View Roles'),('Mobile Clinic Application User','View Unpublished Forms'),('Mobile Clinic Application User','View Users'),('Mobile Clinic Application User','View Visit Attribute Types'),('Mobile Clinic Application User','View Visits'),('Outpatient Application User','Add Encounters'),('Outpatient Application User','Add Observations'),('Outpatient Application User','Add Patient Identifiers'),('Outpatient Application User','Add Patients'),('Outpatient Application User','Edit Encounters'),('Outpatient Application User','Edit Observations'),('Outpatient Application User','Edit Patient Identifiers'),('Outpatient Application User','Edit Patients'),('Outpatient Application User','Edit People'),('Outpatient Application User','Form Entry'),('Outpatient Application User','Generate Batch of Identifiers'),('Outpatient Application User','Manage Auto Generation Options'),('Outpatient Application User','Manage Encounter Roles'),('Outpatient Application User','Manage Forms'),('Outpatient Application User','Manage Identifier Sources'),('Outpatient Application User','Patient Dashboard - View Demographics Section'),('Outpatient Application User','Patient Dashboard - View Encounters Section'),('Outpatient Application User','Patient Dashboard - View Overview Section'),('Outpatient Application User','Patient Dashboard - View Patient Summary'),('Outpatient Application User','Patient Registration Task - patientLookup'),('Outpatient Application User','Patient Registration Task - patientRegistration'),('Outpatient Application User','Patient Registration Task - primaryCareReception'),('Outpatient Application User','Patient Registration Task - primaryCareVisit'),('Outpatient Application User','SQL Level Access'),('Outpatient Application User','Upload Batch of Identifiers'),('Outpatient Application User','View Concept Classes'),('Outpatient Application User','View Concept Datatypes'),('Outpatient Application User','View Concept Sources'),('Outpatient Application User','View Concepts'),('Outpatient Application User','View Encounter Types'),('Outpatient Application User','View Encounters'),('Outpatient Application User','View Field Types'),('Outpatient Application User','View FormEntry Error'),('Outpatient Application User','View Forms'),('Outpatient Application User','View Identifier Types'),('Outpatient Application User','View Locations'),('Outpatient Application User','View Navigation Menu'),('Outpatient Application User','View Observations'),('Outpatient Application User','View Orders'),('Outpatient Application User','View Patient Cohorts'),('Outpatient Application User','View Patient Identifiers'),('Outpatient Application User','View Patients'),('Outpatient Application User','View People'),('Outpatient Application User','View Person Attribute Types'),('Outpatient Application User','View Programs'),('Outpatient Application User','View Providers'),('Outpatient Application User','View Unpublished Forms'),('Outpatient Application User','View Users'),('Outpatient Application User - Supervisor','Patient Registration Task - reporting'),('Outpatient Application User - Supervisor','Patient Registration Task - retrospectiveEntry'),('Outpatient Application User - Supervisor','Patient Registration Task - viewDuplicates'),('Provider','View Concepts'),('Provider','View Encounters'),('Provider','View Observations'),('Provider','View Patient Identifiers'),('Provider','View Patients'),('Provider','View People'),('Report user','Manage Scheduled Report Tasks'),('Report user','Patient Registration Task - reporting'),('Report user','Run Reports'),('Report user','SQL Level Access'),('Report user','View Report Objects'),('Report user','View Reports');
/*!40000 ALTER TABLE `role_privilege` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `privilege`
--

DROP TABLE IF EXISTS `privilege`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `privilege` (
  `privilege` varchar(50) NOT NULL DEFAULT '',
  `description` varchar(250) NOT NULL DEFAULT '',
  `uuid` char(38) NOT NULL,
  PRIMARY KEY (`privilege`),
  UNIQUE KEY `privilege_uuid_index` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `privilege`
--

LOCK TABLES `privilege` WRITE;
/*!40000 ALTER TABLE `privilege` DISABLE KEYS */;
INSERT INTO `privilege` VALUES ('Add Allergies','Add allergies','d558963a-b0dc-43be-8151-342d224c2063'),('Add Cohorts','Able to add a cohort to the system','34186b20-0370-102d-b0e3-001ec94a0cc1'),('Add Concept Proposals','Able to add concept proposals to the system','34186d32-0370-102d-b0e3-001ec94a0cc1'),('Add Encounters','Able to add patient encounters','34186e04-0370-102d-b0e3-001ec94a0cc1'),('Add FormEntry Archive','Allows the user to add the formentry archive','34186ec2-0370-102d-b0e3-001ec94a0cc1'),('Add FormEntry Error','Allows a user to add a formentry error item','34186f8a-0370-102d-b0e3-001ec94a0cc1'),('Add FormEntry Queue','Allows user to add a queue item to database','34187052-0370-102d-b0e3-001ec94a0cc1'),('Add HL7 Inbound Archive','Able to add an HL7 archive item','f4d3479f-1820-477c-af54-1e2850192a85'),('Add HL7 Inbound Exception','Able to add an HL7 error item','e51106a8-5999-497d-b04f-18002893e595'),('Add HL7 Inbound Queue','Able to add an HL7 Queue item','9c51a371-90c9-4655-8434-5d833897e6f9'),('Add HL7 Source','Able to add an HL7 Source','48c2917c-0aa4-46b8-9a9c-84c724561bdb'),('Add Observations','Able to add patient observations','34187124-0370-102d-b0e3-001ec94a0cc1'),('Add Orders','Able to add orders','341871ec-0370-102d-b0e3-001ec94a0cc1'),('Add Patient Identifiers','Able to add patient identifiers','341872aa-0370-102d-b0e3-001ec94a0cc1'),('Add Patient Programs','Able to add patients to programs','34187372-0370-102d-b0e3-001ec94a0cc1'),('Add Patients','Able to add patients','3418743a-0370-102d-b0e3-001ec94a0cc1'),('Add People','Able to add person objects','341874f8-0370-102d-b0e3-001ec94a0cc1'),('Add Problems','Add problems','4476937c-71bc-434b-9fbf-205775e0891d'),('Add Relationships','Able to add relationships','341875ac-0370-102d-b0e3-001ec94a0cc1'),('Add Report Objects','Able to add report objects','3418766a-0370-102d-b0e3-001ec94a0cc1'),('Add Reports','Able to add reports','341886e6-0370-102d-b0e3-001ec94a0cc1'),('Add Users','Able to add users to OpenMRS','341887ae-0370-102d-b0e3-001ec94a0cc1'),('Add Visits','Able to add visits','0ae57e4c-feb2-4d9b-9b1f-8a47bfaf2f22'),('Configure Visits','Able to choose encounter visit handler and enable/disable encounter visits','07e01cc8-2708-4ec5-85d8-a4522828b504'),('Delete Cohorts','Able to add a cohort to the system','34188862-0370-102d-b0e3-001ec94a0cc1'),('Delete Concept Proposals','Able to delete concept proposals from the system','3418892a-0370-102d-b0e3-001ec94a0cc1'),('Delete Encounters','Able to delete patient encounters','341889f2-0370-102d-b0e3-001ec94a0cc1'),('Delete FormEntry Archive','Allows the user to delete a formentry archive','34188ab0-0370-102d-b0e3-001ec94a0cc1'),('Delete FormEntry Error','Allows a user to delete a formentry error item','34188b78-0370-102d-b0e3-001ec94a0cc1'),('Delete FormEntry Queue','Allows the user to delete formentry queue items','34188c40-0370-102d-b0e3-001ec94a0cc1'),('Delete HL7 Inbound Archive','Able to delete/retire an HL7 archive item','ac103409-7005-474c-a120-daafda6d27f0'),('Delete HL7 Inbound Exception','Able to delete an HL7 archive item','23765343-f4f6-4c90-8606-d4df7e803863'),('Delete HL7 Inbound Queue','Able to delete an HL7 Queue item','5890ffb8-f5ee-44e5-9a0e-29e925c79375'),('Delete Observations','Able to delete patient observations','34188d08-0370-102d-b0e3-001ec94a0cc1'),('Delete Orders','Able to delete orders','34188dd0-0370-102d-b0e3-001ec94a0cc1'),('Delete Patient Identifiers','Able to delete patient identifiers','34188e98-0370-102d-b0e3-001ec94a0cc1'),('Delete Patient Programs','Able to delete patients from programs','34188f60-0370-102d-b0e3-001ec94a0cc1'),('Delete Patients','Able to delete patients','34189028-0370-102d-b0e3-001ec94a0cc1'),('Delete People','Able to delete objects','341890f0-0370-102d-b0e3-001ec94a0cc1'),('Delete Relationships','Able to delete relationships','341891ae-0370-102d-b0e3-001ec94a0cc1'),('Delete Report Objects','Able to delete report objects','3418926c-0370-102d-b0e3-001ec94a0cc1'),('Delete Reports','Able to delete reports','3418933e-0370-102d-b0e3-001ec94a0cc1'),('Delete Users','Able to delete users in OpenMRS','341893fc-0370-102d-b0e3-001ec94a0cc1'),('Delete Visits','Able to delete visits','6f714bc3-77fe-4e3b-8192-af5cbc520659'),('Edit Allergies','Able to edit allergies','171ed1fa-6da6-4fed-bc9e-ad70c92956b6'),('Edit Cohorts','Able to add a cohort to the system','341894b0-0370-102d-b0e3-001ec94a0cc1'),('Edit Concept Proposals','Able to edit concept proposals in the system','34189564-0370-102d-b0e3-001ec94a0cc1'),('Edit Encounters','Able to edit patient encounters','3418962c-0370-102d-b0e3-001ec94a0cc1'),('Edit FormEntry Archive','Allows the user to edit a formentry archive','341896ea-0370-102d-b0e3-001ec94a0cc1'),('Edit FormEntry Error','Allows a user to edit a formentry error item','341897a8-0370-102d-b0e3-001ec94a0cc1'),('Edit FormEntry Queue','Allows the user to edit the formentry queue','34189870-0370-102d-b0e3-001ec94a0cc1'),('Edit Observations','Able to edit patient observations','34189938-0370-102d-b0e3-001ec94a0cc1'),('Edit Orders','Able to edit orders','3418a9c8-0370-102d-b0e3-001ec94a0cc1'),('Edit Patient Identifiers','Able to edit patient identifiers','3418aa86-0370-102d-b0e3-001ec94a0cc1'),('Edit Patient Programs','Able to edit patients in programs','3418ab4e-0370-102d-b0e3-001ec94a0cc1'),('Edit Patients','Able to edit patients','3418ac16-0370-102d-b0e3-001ec94a0cc1'),('Edit People','Able to edit person objects','3418acd4-0370-102d-b0e3-001ec94a0cc1'),('Edit Problems','Able to edit problems','40709791-b83d-413d-b730-c179954cc5f9'),('Edit Relationships','Able to edit relationships','3418ad92-0370-102d-b0e3-001ec94a0cc1'),('Edit Report Objects','Able to edit report objects','3418ae50-0370-102d-b0e3-001ec94a0cc1'),('Edit Reports','Able to edit reports','3418af0e-0370-102d-b0e3-001ec94a0cc1'),('Edit User Passwords','Able to change the passwords of users in OpenMRS','3418afcc-0370-102d-b0e3-001ec94a0cc1'),('Edit Users','Able to edit users in OpenMRS','3418b0c6-0370-102d-b0e3-001ec94a0cc1'),('Edit Visits','Able to edit visits','2cb490ae-09a5-442d-83e8-a1617685df5a'),('Form Entry','Allows user to access Form Entry pages/functions','3418b184-0370-102d-b0e3-001ec94a0cc1'),('Generate Batch of Identifiers','Allows user to generate a batch of identifiers to a file for offline use','19139b69-3118-4b8c-ad34-5e0fba5b74f7'),('Groovy Scripting','Allows user to execute Groovy scripts','ddb082d4-552d-4fa6-b824-776f2449bac5'),('List Groovy Scripts','Allows user to view Groovy scripts which are saved.','a863cc26-0ccf-4e8c-b191-2ea6397253e6'),('Manage Address Hierarchy','Allows user to access/modify the defined address hierarchy','bac4508c-79a3-4197-9bfb-f7ca80e85cfd'),('Manage Address Templates','Able to add/edit/delete address templates','39e829cc-683b-412d-8665-198948fdd55e'),('Manage Alerts','Able to add/edit/delete user alerts','3418b242-0370-102d-b0e3-001ec94a0cc1'),('Manage Auto Generation Options','Allows user add, edit, and remove auto-generation options','556c8a1f-a3e3-4dfa-a698-93f5d2bd339c'),('Manage Cohort Definitions','Add/Edit/Remove Cohort Definitions','bd8df5b1-10cd-44e7-908c-cc5927bd72b1'),('Manage Concept Classes','Able to add/edit/retire concept classes','3418b300-0370-102d-b0e3-001ec94a0cc1'),('Manage Concept Datatypes','Able to add/edit/retire concept datatypes','3418b3be-0370-102d-b0e3-001ec94a0cc1'),('Manage Concept Map Types','Able to add/edit/retire concept map types','2e71474b-e323-4dc6-8d44-2a33a8c92e18'),('Manage Concept Name tags','Able to add/edit/delete concept name tags','c221ecea-12a3-45f9-aef0-5efb001b4ed5'),('Manage Concept Reference Terms','Able to add/edit/retire reference terms','578cd104-db74-45d0-a404-342689fa8a3d'),('Manage Concept Sources','Able to add/edit/delete concept sources','3418b486-0370-102d-b0e3-001ec94a0cc1'),('Manage Concept Stop Words','Able to view/add/remove the concept stop words','c6249b5f-2d97-4f40-b69f-4fff53ca1346'),('Manage Concepts','Able to add/edit/delete concept entries','3418b558-0370-102d-b0e3-001ec94a0cc1'),('Manage Custom Messages','This privilege will give a user access editing custom message translations','3ab4edcc-9b0c-4b35-b4ee-c940235a118f'),('Manage Data Set Definitions','Add/Edit/Remove Data Set Definitions','8ea53053-4729-4989-82f2-c178121e835b'),('Manage Dimension Definitions','Add/Edit/Remove Dimension Definitions','6242658b-551d-41b5-8a57-09c2c225c126'),('Manage Encounter Roles','Able to add/edit/retire encounter roles','d97dee15-aea8-4d23-bc97-be862c8effab'),('Manage Encounter Types','Able to add/edit/delete encounter types','3418b6ca-0370-102d-b0e3-001ec94a0cc1'),('Manage Field Types','Able to add/edit/retire field types','3418b792-0370-102d-b0e3-001ec94a0cc1'),('Manage Flags','Allows user add, edit, and remove flags','26d2a24c-0d82-43ea-a921-607c40fb72ef'),('Manage FormEntry XSN','Allows user to upload and edit the xsns stored on the server','3418b850-0370-102d-b0e3-001ec94a0cc1'),('Manage Forms','Able to add/edit/delete forms','3418b918-0370-102d-b0e3-001ec94a0cc1'),('Manage Global Properties','Able to add/edit global properties','3418b9e0-0370-102d-b0e3-001ec94a0cc1'),('Manage HL7 Messages','Able to add/edit/delete HL7 messages','b5508f1e-d108-48b8-bcd9-8bd1fbdad1fa'),('Manage Homepages','Manage Role-based Homepages','da86ccd4-7c45-4d72-8668-1d22c4e49722'),('Manage Identifier Sources','Allows user add, edit, and remove identifier sources','a139c0d4-7ec3-478b-917e-d06bd84cc81d'),('Manage Identifier Types','Able to add/edit/delete patient identifier types','3418ba9e-0370-102d-b0e3-001ec94a0cc1'),('Manage Implementation Id','Able to view/add/edit the implementation id for the system','7e08715f-93a6-4a47-beea-1ae065a2310b'),('Manage Indicator Definitions','Add/Edit/Remove Indicator Definitions','ea8b8093-eedb-4af9-9a87-160663440dac'),('Manage Location Attribute Types','Able to add/edit/retire location attribute types','894d65fd-5a9e-45cf-8c48-f657a4c928bc'),('Manage Location Tags','Able to add/edit/delete location tags','0cd88490-6e62-4159-9509-8a8324928512'),('Manage Locations','Able to add/edit/delete locations','3418bb66-0370-102d-b0e3-001ec94a0cc1'),('Manage Modules','Able to add/remove modules to the system','3418bc24-0370-102d-b0e3-001ec94a0cc1'),('Manage Order Types','Able to add/edit/retire order types','3418bce2-0370-102d-b0e3-001ec94a0cc1'),('Manage Person Attribute Types','Able to add/edit/delete person attribute types','3418ce3a-0370-102d-b0e3-001ec94a0cc1'),('Manage Privileges','Able to add/edit/delete privileges','3418cf0c-0370-102d-b0e3-001ec94a0cc1'),('Manage Programs','Able to add/view/delete patient programs','3418d254-0370-102d-b0e3-001ec94a0cc1'),('Manage Providers','Able to edit Provider','56c7ff73-a552-4571-926d-defb9ff77298'),('Manage Relationship Types','Able to add/edit/retire relationship types','3418d31c-0370-102d-b0e3-001ec94a0cc1'),('Manage Relationships','Able to add/edit/delete relationships','3418d3ee-0370-102d-b0e3-001ec94a0cc1'),('Manage Report Definitions','Add/Edit/Remove Report Definitions','76a74130-70c8-49cf-8ec1-0ee7e867a27a'),('Manage Report Designs','Add/Edit/Remove Report Designs','07d48022-c62b-4cb1-8095-bd97d6a2abca'),('Manage Reports','Base privilege for add/edit/delete reporting definitions. This gives access to the administrative menus, but you need to grant additional privileges to manage each specific type of reporting definition','4ab2899b-fa51-4ed6-a24a-173d7f2da4b5'),('Manage Roles','Able to add/edit/delete user roles','3418d574-0370-102d-b0e3-001ec94a0cc1'),('Manage Rule Definitions','Allows creation and editing of user-defined rules','a0c05931-f2e3-4bbc-be58-acbc7efdf7ee'),('Manage Scheduled Report Tasks','Manage Task Scheduling in Reporting Module','a22359fb-5121-4065-a3a1-1abfd7ea4ed5'),('Manage Scheduler','Able to add/edit/remove scheduled tasks','3418d632-0370-102d-b0e3-001ec94a0cc1'),('Manage Synchronization','Enables one to do administrative duties for the synchronization module','d9f04a4b-4141-41d6-9ea7-d88da8968a4a'),('Manage Token Registrations','Allows to create/update/delete token registrations','6dfe11f5-7d06-4697-b792-99c097a279b1'),('Manage Tokens','Allows registering and removal of tokens','c8356474-9187-4429-969e-bfb003bb61a6'),('Manage Usage Statistics','Able to manage and configure usage statistics','6faa5346-7969-4498-b30a-182dfb0cc4ad'),('Manage Visit Attribute Types','Able to add/edit/retire visit attribute types','7708c480-23d0-4095-9ce1-b0094498675e'),('Manage Visit Types','Able to add/edit/delete visit types','e6b00b39-c5d5-4652-a661-3691989c4f57'),('Metadata Mapping','Allows the user to prepare concepts for publishing/subscribing','f3f05d26-fb44-473d-aad8-97a2ca0145c3'),('Patient Dashboard - View Demographics Section','Able to view the \'Demographics\' tab on the patient dashboard','3418d704-0370-102d-b0e3-001ec94a0cc1'),('Patient Dashboard - View Encounters Section','Able to view the \'Encounters\' tab on the patient dashboard','3418d7d6-0370-102d-b0e3-001ec94a0cc1'),('Patient Dashboard - View Forms Section','Able to view the \'Forms\' tab on the patient dashboard','3418d8b2-0370-102d-b0e3-001ec94a0cc1'),('Patient Dashboard - View Graphs Section','Able to view the \'Graphs\' tab on the patient dashboard','3418d998-0370-102d-b0e3-001ec94a0cc1'),('Patient Dashboard - View Overview Section','Able to view the \'Overview\' tab on the patient dashboard','3418da74-0370-102d-b0e3-001ec94a0cc1'),('Patient Dashboard - View Patient Summary','Able to view the \'Summary\' tab on the patient dashboard','3418db46-0370-102d-b0e3-001ec94a0cc1'),('Patient Dashboard - View Regimen Section','Able to view the \'Regimen\' tab on the patient dashboard','3418dc22-0370-102d-b0e3-001ec94a0cc1'),('Patient Dashboard - View Visits Section','Able to view the \'Visits\' tab on the patient dashboard','d9b8900a-4e92-44d9-8707-7ec3685f17a4'),('Patient Registration Task - mobileClinic','This privilege will give a user access to the combined Patient registration and Mobile Clinic Reception Task in the Patient Registration module','48e14bcf-8fec-4913-af9c-3a6cb260fd66'),('Patient Registration Task - mobileClinicReception','This privilege will give a user access to the Mobile Clinic Reception Task in the Patient Registration module','e9b428ba-b23e-4720-bdbd-22ed72b06a1c'),('Patient Registration Task - patientLookup','This privilege will give a user access to the Patient Lookup Task in the Patient Registration module','c5a569ca-7d29-4d48-945c-6158c2507639'),('Patient Registration Task - patientRegistration','This privilege will give a user access to the Patient Registration Task in the Patient Registration module','f4c6f756-a62d-4720-a656-77b505f71493'),('Patient Registration Task - primaryCareReception','This privilege will give a user access to the Primary Care Reception Task in the Patient Registration module','a47cbdd0-68e8-44e3-9510-7fd496528703'),('Patient Registration Task - primaryCareVisit','This privilege will give a user access to the Primary Care Visit Task in the Patient Registration module','98d6bd7c-c7c4-43ac-9427-e145da43584c'),('Patient Registration Task - reporting','This privilege will give a user access to the Reporting Task in the Patient Registration module','422aab99-1080-4df1-8397-e83bd47520fa'),('Patient Registration Task - retrospectiveEntry','This privilege will give a user access to the Retrospective Data Entry Task in the Patient Registration module','a122b5fe-37c4-4b11-8c3c-4b8355197bf4'),('Patient Registration Task - viewDuplicates','This privilege will give a user access to the View Patient Duplicates Task in the Patient Registration module','b9e5819a-3299-415c-935b-a63c934dfc80'),('Purge Field Types','Able to purge field types','3418dcfe-0370-102d-b0e3-001ec94a0cc1'),('Purge Global Properties','nobody hears me crying...','e3a494ca-743d-45a6-a542-b7db16a5082f'),('Remove Allergies','Remove allergies','02958057-5652-4eec-959b-4ba56c69e21d'),('Remove Problems','Remove problems','7fad0218-095b-475c-bdf8-1d224d228520'),('Run Groovy Scripts','Allows user to execute Groovy scripts.','2a5f8682-1cbb-4f2c-a266-d6b6cb9ebd98'),('Run Reports','Able to run reports','7af27953-7b78-4c2d-b567-e55056bca213'),('Share Metadata','Allows user to export and import metadata','b57cfd20-fba0-4f14-94f2-302425aabf5a'),('SQL Level Access','Allows sql scripts for reporting and other area.','44139560-c60c-47c9-ae56-7a8fa3a5b7ef'),('Test Flags','Allows the user to test a flag, or set of flags, against a Patient set','a433e2f1-a1c8-4dc6-a46d-765766f747e1'),('Update HL7 Inbound Archive','Able to update an HL7 archive item','07b161e6-89a4-45d8-b0ed-8e94adc3401c'),('Update HL7 Inbound Exception','Able to update an HL7 archive item','716d0592-2a89-42c4-bf6f-f95a61032270'),('Update HL7 Inbound Queue','Able to update an HL7 Queue item','c90431ad-5cf9-4b87-a59d-578806d5137f'),('Update HL7 Source','Able to update an HL7 Source','dc4e833a-fb33-4183-8010-8211b782d340'),('Upload Batch of Identifiers','Allows user to upload a batch of identifiers','a5e785a7-3603-4eb7-9b9b-34f09f234775'),('Upload XSN','Allows user to upload/overwrite the XSNs defined for forms','3418ddbc-0370-102d-b0e3-001ec94a0cc1'),('Validate Objects','Allows to validate data and metadata','6508d34a-5b8a-4624-8743-3d39ae4505c6'),('View Administration Functions','Able to view the \'Administration\' link in the navigation bar','3418de70-0370-102d-b0e3-001ec94a0cc1'),('View Allergies','Able to view allergies','1412614a-49fc-418c-b414-77858b2f0d48'),('View Calculations','Allows to view Calculations','94c390c9-dffe-477a-8f02-802a1b61e46e'),('View Concept Classes','Able to view concept classes','3418df2e-0370-102d-b0e3-001ec94a0cc1'),('View Concept Datatypes','Able to view concept datatypes','3418dfec-0370-102d-b0e3-001ec94a0cc1'),('View Concept Map Types','Able to view concept map types','4e3d0eb5-203c-4dbd-8bb9-9dabaefc8d2f'),('View Concept Proposals','Able to view concept proposals to the system','3418e0b4-0370-102d-b0e3-001ec94a0cc1'),('View Concept Reference Terms','Able to view concept reference terms','93f0ad29-4045-4c71-9c34-3b89ede996aa'),('View Concept Sources','Able to view concept sources','3418e172-0370-102d-b0e3-001ec94a0cc1'),('View Concepts','Able to view concept entries','3418e23a-0370-102d-b0e3-001ec94a0cc1'),('View Data Entry Statistics','Able to view data entry statistics from the admin screen','3418e302-0370-102d-b0e3-001ec94a0cc1'),('View Database Changes','Able to view database changes from the admin screen','b521348f-ddec-4aad-a425-697790936e38'),('View Encounter Roles','Able to view encounter roles','7c25c5b5-37b5-40ae-b8b9-5d9b5a7238db'),('View Encounter Types','Able to view encounter types','3418e3ca-0370-102d-b0e3-001ec94a0cc1'),('View Encounters','Able to view patient encounters','3418f4e6-0370-102d-b0e3-001ec94a0cc1'),('View Field Types','Able to view field types','3418f5a4-0370-102d-b0e3-001ec94a0cc1'),('View FormEntry Archive','Allows the user to view the formentry archive','3418f66c-0370-102d-b0e3-001ec94a0cc1'),('View FormEntry Error','Allows a user to view a formentry error','3418f734-0370-102d-b0e3-001ec94a0cc1'),('View FormEntry Queue','Allows user to view the queue items','3418f7fc-0370-102d-b0e3-001ec94a0cc1'),('View Forms','Able to view forms','3418f8c4-0370-102d-b0e3-001ec94a0cc1'),('View Global Properties','Able to view global properties on the administration screen','3418f982-0370-102d-b0e3-001ec94a0cc1'),('View HL7 Inbound Archive','Able to view an HL7 archive item','30542e77-2e34-4892-9f9c-42c8e8824411'),('View HL7 Inbound Exception','Able to view an HL7 archive item','3771e197-7997-4af1-adba-60bd185a7872'),('View HL7 Inbound Queue','Able to view an HL7 Queue item','464223d3-847a-44e9-b983-305b3a993363'),('View HL7 Source','Able to view an HL7 Source','05658b44-ad0d-4447-96c7-81770040dee9'),('View Identifier Types','Able to view patient identifier types','3418fa40-0370-102d-b0e3-001ec94a0cc1'),('View Location Attribute Types','Able to view location attribute types','e693aa26-7092-4d1f-9159-e2d8c4072e52'),('View Locations','Able to view locations','3418fb08-0370-102d-b0e3-001ec94a0cc1'),('View Navigation Menu','Ability to see the navigation menu','3418fbbc-0370-102d-b0e3-001ec94a0cc1'),('View Observations','Able to view patient observations','3418fc84-0370-102d-b0e3-001ec94a0cc1'),('View Order Types','Able to view order types','3418fd42-0370-102d-b0e3-001ec94a0cc1'),('View Orders','Able to view orders','3418fe0a-0370-102d-b0e3-001ec94a0cc1'),('View Patient Cohorts','Able to view patient cohorts','3418febe-0370-102d-b0e3-001ec94a0cc1'),('View Patient Identifiers','Able to view patient identifiers','3418ff86-0370-102d-b0e3-001ec94a0cc1'),('View Patient Programs','Able to see which programs that patients are in','34190058-0370-102d-b0e3-001ec94a0cc1'),('View Patients','Able to view patients','341903a0-0370-102d-b0e3-001ec94a0cc1'),('View People','Able to view person objects','34190468-0370-102d-b0e3-001ec94a0cc1'),('View Person Attribute Types','Able to view person attribute types','34190530-0370-102d-b0e3-001ec94a0cc1'),('View Privileges','Able to view user privileges','341905f8-0370-102d-b0e3-001ec94a0cc1'),('View Problems','Able to view problems','89fe771b-a205-4241-872f-29b8ec503bac'),('View Programs','Able to view patient programs','341906b6-0370-102d-b0e3-001ec94a0cc1'),('View Providers','Able to view Provider','85003c04-46db-49ae-949f-eb263707d754'),('View Relationship Types','Able to view relationship types','34190774-0370-102d-b0e3-001ec94a0cc1'),('View Relationships','Able to view relationships','3419083c-0370-102d-b0e3-001ec94a0cc1'),('View RelationshipTypes','View RelationshipTypes','34190904-0370-102d-b0e3-001ec94a0cc1'),('View Report Objects','Able to view report objects','341909cc-0370-102d-b0e3-001ec94a0cc1'),('View Reports','Able to view reports','34191ac0-0370-102d-b0e3-001ec94a0cc1'),('View Roles','Able to view user roles','34191b88-0370-102d-b0e3-001ec94a0cc1'),('View Rule Definitions','Allows viewing of user-defined rules. (This privilege is not necessary to run rules under normal usage.)','a00d6a16-29c4-4911-b8fb-32208aa804f7'),('View Synchronization Records','Enables one to see the synchronization record data','21caf923-d41f-4df4-aa97-ad354f104110'),('View Synchronization Status','Enables one to see the status of the synchronization process','3d5a797a-a9f2-4a97-8c1f-1fd239bed102'),('View Token Registrations','Allows to view token registrations','aec28470-7206-4a48-825d-4f3e3e4e41cd'),('View Unpublished Forms','Able to view and fill out unpublished forms','34191d54-0370-102d-b0e3-001ec94a0cc1'),('View Usage Statistics','Able to view usage statistics','0834e32e-77cb-47cd-b079-4ea23c906c4c'),('View Users','Able to view users in OpenMRS','34191e30-0370-102d-b0e3-001ec94a0cc1'),('View Visit Attribute Types','Able to view visit attribute types','ba4451cf-f2bb-479b-93d5-74a2e83eb500'),('View Visit Types','Able to view visit types','ac2b55cb-3264-42e8-9c48-71042f5f3896'),('View Visits','Able to view visits','4b12d25c-c864-4042-9125-ab94157e7ef0');
/*!40000 ALTER TABLE `privilege` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed
