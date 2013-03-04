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
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2013-03-04 15:01:07
