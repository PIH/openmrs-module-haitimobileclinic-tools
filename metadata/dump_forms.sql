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
-- Table structure for table `form`
--

DROP TABLE IF EXISTS `form`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `form` (
  `form_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `version` varchar(50) NOT NULL DEFAULT '',
  `build` int(11) DEFAULT NULL,
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `xslt` text,
  `template` text,
  `description` text,
  `encounter_type` int(11) DEFAULT NULL,
  `creator` int(11) NOT NULL DEFAULT '0',
  `date_created` datetime NOT NULL,
  `changed_by` int(11) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `retired` tinyint(1) NOT NULL DEFAULT '0',
  `retired_by` int(11) DEFAULT NULL,
  `date_retired` datetime DEFAULT NULL,
  `retired_reason` varchar(255) DEFAULT NULL,
  `uuid` char(38) DEFAULT NULL,
  PRIMARY KEY (`form_id`),
  UNIQUE KEY `form_uuid_index` (`uuid`),
  KEY `form_published_index` (`published`),
  KEY `form_retired_index` (`retired`),
  KEY `form_published_and_retired_index` (`published`,`retired`),
  KEY `user_who_last_changed_form` (`changed_by`),
  KEY `user_who_created_form` (`creator`),
  KEY `form_encounter_type` (`encounter_type`),
  KEY `user_who_retired_form` (`retired_by`),
  CONSTRAINT `form_encounter_type` FOREIGN KEY (`encounter_type`) REFERENCES `encounter_type` (`encounter_type_id`),
  CONSTRAINT `user_who_created_form` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`),
  CONSTRAINT `user_who_last_changed_form` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `user_who_retired_form` FOREIGN KEY (`retired_by`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `form`
--

LOCK TABLES `form` WRITE;
/*!40000 ALTER TABLE `form` DISABLE KEYS */;
INSERT INTO `form` VALUES (1,'Mobile Clinic Consultation','1',NULL,0,NULL,NULL,NULL,19,1,'2013-02-13 15:05:55',3,'2013-03-20 14:26:35',0,NULL,NULL,NULL,'2ff2fd33-676d-4096-96bb-54a52845f7cb'),(2,'Mobile Clinic Reception','1',NULL,0,NULL,NULL,NULL,18,1,'2013-02-13 19:39:45',1,'2013-03-04 08:34:06',1,1,'2013-03-04 08:34:06','not needed as of now','0a3e8481-5b37-4d55-a6e5-ec1c4762a07f'),(3,'Static Clinic Enrollment','1',NULL,0,NULL,NULL,NULL,20,1,'2013-02-26 11:38:55',NULL,NULL,0,NULL,NULL,NULL,'49f59162-37e5-48fb-b043-73149c89a269'),(4,'TB Results','1',NULL,0,NULL,NULL,NULL,21,1,'2013-02-28 11:34:03',NULL,NULL,0,NULL,NULL,NULL,'531d023f-92bd-48a7-90b1-10ed985b141d');
/*!40000 ALTER TABLE `form` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `htmlformentry_html_form`
--

DROP TABLE IF EXISTS `htmlformentry_html_form`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `htmlformentry_html_form` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `form_id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `xml_data` mediumtext NOT NULL,
  `creator` int(11) NOT NULL DEFAULT '0',
  `date_created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `changed_by` int(11) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `retired` tinyint(1) NOT NULL DEFAULT '0',
  `uuid` char(38) NOT NULL,
  `description` varchar(1000) DEFAULT NULL,
  `retired_by` int(11) DEFAULT NULL,
  `date_retired` datetime DEFAULT NULL,
  `retire_reason` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `htmlformentry_html_form_uuid_index` (`uuid`),
  KEY `User who created htmlformentry_htmlform` (`creator`),
  KEY `Form with which this htmlform is related` (`form_id`),
  KEY `User who changed htmlformentry_htmlform` (`changed_by`),
  KEY `user_who_retired_html_form` (`retired_by`),
  CONSTRAINT `Form with which this htmlform is related` FOREIGN KEY (`form_id`) REFERENCES `form` (`form_id`),
  CONSTRAINT `User who changed htmlformentry_htmlform` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `User who created htmlformentry_htmlform` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`),
  CONSTRAINT `user_who_retired_html_form` FOREIGN KEY (`retired_by`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `htmlformentry_html_form`
--

LOCK TABLES `htmlformentry_html_form` WRITE;
/*!40000 ALTER TABLE `htmlformentry_html_form` DISABLE KEYS */;
INSERT INTO `htmlformentry_html_form` VALUES (1,1,NULL,'<htmlform>\r\n<!-- MAKE SURE YOU EDIT THE MOST RECENT VERSION! -->\r\n<!-- The most recent version is either \r\n       - under https://github.com/PIH/openmrs-module-haitimobileclinic-tools/tree/master/openmrs-forms\r\n       or \r\n       - straight in the MySQL dump of the metadata (less preferred, but likely)\r\n-->\r\n<!-- Full reference for HTML Forms at http://wiki.openmrs.org/x/kg8z -->\r\n	<macros>\r\n		paperFormId = (Fill this in)\r\n		headerColor =#009d8e\r\n		fontOnHeaderColor = white\r\n	</macros>\r\n\r\n	<style>\r\n		.section {\r\n			border: 1px solid $headerColor;\r\n			padding: 2px;\r\n			text-align: left;\r\n			margin-bottom: 1em;\r\n		}\r\n		.sectionHeader {\r\n			background-color: $headerColor;\r\n			color: $fontOnHeaderColor;\r\n			display: block;\r\n			padding: 2px;\r\n			font-weight: bold;\r\n		}\r\n		table.baseline-aligned td {\r\n			vertical-align: baseline;\r\n		}\r\n	</style>\r\n\r\n	<script type=\"text/javascript\">\r\n		function getSessionDate() {\r\n		   return \"<lookup expression=\"session.httpSession.getAttribute(\'sessionDate\')\" />\";\r\n		}\r\n		function getSessionCoordinates() {\r\n		   return \"<lookup expression=\"session.httpSession.getAttribute(\'sessionCoordinates\')\" />\";\r\n		}\r\n		function getSessionChwName1() {\r\n		   return \"<lookup expression=\"session.httpSession.getAttribute(\'sessionChwName1\')\" />\";\r\n		}\r\n		function getSessionChwName2() {\r\n		   return \"<lookup expression=\"session.httpSession.getAttribute(\'sessionChwName2\')\" />\";\r\n		}\r\n		function getSessionChwName3() {\r\n		   return \"<lookup expression=\"session.httpSession.getAttribute(\'sessionChwName3\')\" />\";\r\n		}\r\n		function getSessionNecName1() {\r\n		   return \"<lookup expression=\"session.httpSession.getAttribute(\'sessionNecName1\')\" />\";\r\n		}\r\n		function getSessionNecName2() {\r\n		   return \"<lookup expression=\"session.httpSession.getAttribute(\'sessionNecName2\')\" />\";\r\n		}\r\n		function getSessionLocation() {\r\n		   return \"<lookup expression=\"session.httpSession.getAttribute(\'sessionLocation\')\" />\";\r\n		}\r\n		function getSessionLocationAddressHierarchyId() {\r\n		   return \"<lookup expression=\"session.httpSession.getAttribute(\'sessionLocationAddressHierarchyId\')\" />\";\r\n		}\r\n		\r\n		$j(function() {\r\n			<includeIf velocityTest=\"$context.getMode()==\'ENTER\' \">\r\n				// a little bit of a pain\r\n				// editing of the form only works when defaults have been set or javacript is disabled...\r\n				if (!getSessionDate() &amp;&amp; !getSessionLocation()) {\r\n					window.location.replace(\"/openmrs/module/haitimobileclinic/dataEntryDefaults.form\");\r\n				}\r\n				setValue(\'sessionLocation.value\', getSessionLocation());\r\n				setValue(\'sessionLocationAddressHierarchyId.value\', getSessionLocationAddressHierarchyId());\r\n				setValue(\'sessionCoordinates.value\', getSessionCoordinates());\r\n				setValue(\'sessionNecName1.value\', getSessionNecName1());\r\n				setValue(\'sessionNecName2.value\', getSessionNecName2());\r\n				setValue(\'sessionChwName1.value\', getSessionChwName1());\r\n				setValue(\'sessionChwName2.value\', getSessionChwName2());\r\n				setValue(\'sessionChwName3.value\', getSessionChwName3());\r\n				setValue(\'encounterDate.value\', getSessionDate());\r\n				//setValue(\'encounterProvider.value\', 5);\r\n			</includeIf> \r\n		});\r\n		\r\n		$j(document).ready(function(){\r\n			$j(\'#sessionChwName1 input\').attr(\'readonly\', \'true\');\r\n			$j(\'#sessionChwName2 input\').attr(\'readonly\', \'true\');\r\n			$j(\'#sessionChwName3 input\').attr(\'readonly\', \'true\');\r\n			$j(\'#sessionNecName1 input\').attr(\'readonly\', \'true\');\r\n			$j(\'#sessionNecName2 input\').attr(\'readonly\', \'true\');\r\n			$j(\'#sessionLocation input\').attr(\'readonly\', \'true\');\r\n			$j(\'#sessionCoordinates input\').attr(\'readonly\', true);\r\n			$j(\'#encounterDate input\').attr(\'readonly\', \'true\'); // datepicker still responds to onclick...\r\n			\r\n			// there is no readonly in HTML for select fields, but disabling it will prevent the form from submitting any value\r\n			// therefore remove every entry except the pre-selected one (which should be already set from a the user profile default location)\r\n			$j(\"#encounterLocation select option\").not(\"option:selected\").remove();\r\n\r\n			// set proper initial state for dependent fields\r\n			clickOrChangeInHivTest();\r\n			clickOrChangeInReferred();\r\n		});\r\n	</script>\r\n\r\n	<span style=\"float:right\">v1.5 (13-MAS 2013)</span>\r\n\r\n	<h2>Forme de Consultation pour les Cliniques Mobiles</h2>\r\n\r\n	<section headerLabel=\"Données démographiques du patient\">\r\n		<table class=\"baseline-aligned\">\r\n			<tr>\r\n				<td>Dossier #:</td>\r\n				<td>\r\n					<lookup class=\"value\"\r\n						complexExpression=\"#foreach( $patId in $patientIdentifiers.get(\'Mobile Clinic Dossier Number\') ) $patId #end \" />\r\n				</td>\r\n			</tr>\r\n			<tr>\r\n				<td>Nom:</td>\r\n				<td>\r\n					<lookup class=\"value\" expression=\"patient.personName\" />\r\n				</td>\r\n			</tr>\r\n			<tr>\r\n				<td>Localité:</td>\r\n				<td>\r\n					<lookup complexExpression=\"#foreach( $addr in $patient.addresses ) $addr.stateProvince, $addr.cityVillage, $addr.address3, $addr.address1    #end\"/>\r\n				</td>\r\n			</tr>\r\n			<tr>\r\n				<td>Sexe:</td>\r\n				<td>\r\n					<lookup class=\"value\" expression=\"patient.gender\" />\r\n				</td>\r\n			</tr>\r\n			<tr>\r\n				<td>Enceinte (seule femme):</td>\r\n				<td>\r\n					<span id=\"pregnant\"><obs conceptId=\"6761\" style=\"radio\"/></span>\r\n					<includeIf velocityTest=\"$patient.gender!=\'F\' \">\r\n						<script>\r\n							$j(function() {\r\n								$j(\'#pregnant\').find(\':input\').each(function(){\r\n								    $j(this).attr(\'disabled\', \'disabled\');\r\n								});\r\n							});\r\n						</script>\r\n					</includeIf>					\r\n				</td>\r\n			</tr>\r\n		</table>\r\n	</section>\r\n\r\n	<section headerLabel=\"Détails journée de clinique (readonly, change through \'Set defaults\')\">\r\n		<table class=\"baseline-aligned\">\r\n			<tr>\r\n				<td>Date:</td>\r\n				<td><encounterDate id=\"encounterDate\" disallowMultipleEncountersOnDate=\"warn\"/></td>\r\n				<td>Institution sanitaire:</td>\r\n				<td colspan=\"5\"><encounterLocation id=\"encounterLocation\" default=\"GlobalProperty:default_location\"/></td>\r\n			</tr>\r\n			<tr>\r\n				<td>Clinique Localité:</td>\r\n				<td colspan=\"3\">\r\n					<obs conceptId=\"6767\" id=\"sessionLocation\" size=\"65\"/>\r\n					<span style=\"visibility:hidden\"><obs conceptId=\"6791\" id=\"sessionLocationAddressHierarchyId\" /></span>\r\n				</td>\r\n				<td>Coordonnées GPS:</td>\r\n				<td><obs conceptId=\"6772\" id=\"sessionCoordinates\"/></td>\r\n			</tr>\r\n			<tr>\r\n				<td>Nom du NEC 1:</td>\r\n				<td><obs conceptId=\"6769\" id=\"sessionNecName1\"/></td>\r\n				<td>Nom du CHW 1:</td>\r\n				<td><obs conceptId=\"6768\" id=\"sessionChwName1\"/></td>\r\n				<td>Nom du CHW 2:</td>\r\n				<td><obs conceptId=\"6770\" id=\"sessionChwName2\"/></td>\r\n			</tr>\r\n			<tr>\r\n				<td>Nom du NEC 2:</td>\r\n				<td><obs conceptId=\"6795\" id=\"sessionNecName2\"/></td>\r\n				<td>Nom du CHW 3:</td>\r\n				<td><obs conceptId=\"6771\" id=\"sessionChwName3\"/></td>\r\n			</tr>\r\n		</table>\r\n	</section>\r\n\r\n	<section headerLabel=\"PB\">\r\n		<table class=\"baseline-aligned\">\r\n			<tr>\r\n				<td><obs conceptId=\"6766\" labelNameTag=\"default\" style=\"radio\"/> (Enfants de 6 mois à 5 ans)</td>\r\n			</tr>\r\n		</table>\r\n	</section>\r\n\r\n	<section headerLabel=\"Dépistage TB\">\r\n		<table class=\"baseline-aligned\">\r\n			<tr>\r\n				<td><obs conceptId=\"6744\" labelNameTag=\"default\" style=\"radio\"/></td>\r\n			</tr>\r\n			<tr>\r\n				<td><obs conceptId=\"6745\" labelNameTag=\"default\" style=\"radio\"/></td>\r\n			</tr>\r\n			<tr>\r\n				<td><obs conceptId=\"6746\" labelNameTag=\"default\" style=\"radio\"/></td>\r\n			</tr>\r\n			<tr>\r\n				<td><obs conceptId=\"6747\" labelNameTag=\"default\" style=\"radio\"/></td>\r\n			</tr>\r\n			<tr>\r\n				<td><obs conceptId=\"6748\" labelNameTag=\"default\" style=\"radio\"/></td>\r\n			</tr>\r\n		</table>\r\n	</section>\r\n\r\n	<section headerLabel=\"Dépistage VIH\">\r\n		<table class=\"baseline-aligned\">\r\n			<tr>\r\n				<td>HIV Test:</td>\r\n				<td>\r\n					<obs conceptId=\"6762\" style=\"radio\" id=\"hivTest\"/>\r\n					<script>\r\n						function clickOrChangeInHivTest() {\r\n							if (getValue(\'hivTest.value\') == \'1065\') {\r\n							      $j(\'#hivResult\').find(\':input\').each(function(){\r\n							        $j(this).removeAttr(\'disabled\');\r\n							      });\r\n						    } else {\r\n							      $j(\'#hivResult\').find(\':input\').each(function(){\r\n							        // uncheck everything as disabled fields are not send via forms \r\n									// and therefore might lead to confusion if the checkbox is checked, but disabled\r\n							        $j(this).attr(\'checked\', false);\r\n							        $j(this).attr(\'disabled\', \'disabled\');\r\n							      });\r\n							}\r\n						}\r\n						$j(function() {\r\n							$j(\'#hivTest\').find(\':input\').each(function(){\r\n							  $j(this).change(function(){\r\n								clickOrChangeInHivTest();\r\n							  });\r\n							  $j(this).click(function(){\r\n								clickOrChangeInHivTest();\r\n							  });\r\n							})\r\n						});\r\n					</script>\r\n				</td>\r\n			</tr>\r\n			<tr>\r\n				<td>Si oui, le résultat du test est:</td>\r\n				<td>\r\n					<span id=\"hivResult\"><obs conceptId=\"3753\" style=\"radio\"/></span>\r\n				</td>\r\n			</tr>\r\n		</table>\r\n	</section>\r\n\r\n	<section headerLabel=\"Diagnostic confirmé\">\r\n		<table class=\"baseline-aligned\">\r\n			<tr>\r\n				<td>Diagnostic</td>\r\n				<td>Codé:</td>\r\n				<td><obs conceptId=\"6542\" /></td>\r\n				<td>En clair:</td>\r\n				<td><obs conceptId=\"6543\" /></td>\r\n			</tr>\r\n			<tr>\r\n				<td/>\r\n				<td/>\r\n				<td><obs conceptId=\"6542\" /></td>\r\n				<td/>\r\n				<td><obs conceptId=\"6543\" /></td>\r\n			</tr>\r\n			<tr>\r\n				<td/>\r\n				<td/>\r\n				<td><obs conceptId=\"6542\" /></td>\r\n				<td/>\r\n				<td><obs conceptId=\"6543\" /></td>\r\n			</tr>\r\n			<tr>\r\n				<td>Prestataire:</td>\r\n				<td colspan=\"2\">\r\n					<encounterProvider id=\"encounterProvider\" default=\"5\"/>\r\n				</td>\r\n			</tr>\r\n		</table>\r\n	</section>\r\n\r\n	<section headerLabel=\"Référence\">\r\n		<table class=\"baseline-aligned\">\r\n			<tr>\r\n				<td>\r\n					<obs id=\"referred\" conceptId=\"6750\" labelNameTag=\"default\" style=\"radio\"/>\r\n					<script>\r\n						function clickOrChangeInReferred() {\r\n							if (getValue(\'referred.value\') == \'1065\') {\r\n						      $j(\'#referralReason\').find(\':input\').each(function(){\r\n						        $j(this).removeAttr(\'disabled\');\r\n						      });\r\n						      $j(\'#referralDestination\').find(\':input\').each(function(){\r\n						        $j(this).removeAttr(\'disabled\');\r\n						      });\r\n						      $j(\'#emergencyTransport\').find(\':input\').each(function(){\r\n						        $j(this).removeAttr(\'disabled\');\r\n						      });\r\n						    } else {\r\n						      $j(\'#referralReason\').find(\':input\').each(function(){\r\n						        // uncheck everything as disabled fields are not send via forms \r\n								// and therefore might lead to confusion if the checkbox is checked, but disabled\r\n						        $j(this).attr(\'checked\', false);\r\n						        $j(this).attr(\'disabled\', \'disabled\');\r\n						      });\r\n						      $j(\'#referralDestination\').find(\':input\').each(function(){\r\n							$j(this).val(\"\");\r\n						        $j(this).attr(\'disabled\', \'disabled\');\r\n						      });\r\n						      $j(\'#emergencyTransport\').find(\':input\').each(function(){\r\n						        $j(this).attr(\'checked\', false);\r\n						        $j(this).attr(\'disabled\', \'disabled\');\r\n						      });\r\n						    }\r\n						}\r\n						$j(function() {\r\n							// couldn\'t get HFE support for change events of radio buttons to work, DIY\r\n							//	    getField(\'referred.value\').change(function() {\r\n							//	        window.alert(\'Value is \' + getValue(\'referred.value\'));\r\n							//	    });\r\n							// still doesn\'t as it should, but the best I could do...\r\n							// first, readonly for checkboxes seems not existing in HTML, \r\n							$j(\'#referred\').find(\':input\').each(function(){\r\n							  $j(this).change(function(){\r\n								clickOrChangeInReferred();\r\n							  });\r\n							  $j(this).click(function(){\r\n								clickOrChangeInReferred();\r\n							  });\r\n							})\r\n						});\r\n					</script>\r\n				</td>\r\n			</tr>\r\n			<tr>\r\n				<td>\r\n					<span id=\'referralDestination\'>\r\n						<obs conceptId=\"6794\" labelNameTag=\"default\" style=\"location\"/>\r\n					</span>\r\n				</td>\r\n			</tr>\r\n			<tr>\r\n				<td>\r\n					<span id=\'emergencyTransport\'>\r\n						<obs conceptId=\"6749\" labelNameTag=\"default\" style=\"radio\"/>\r\n					</span>\r\n				</td>\r\n			</tr>\r\n			<tr>\r\n				<td>\r\n					<span id=\'referralReason\'>\r\n						<obs conceptId=\"6760\" style=\"checkbox\" answerConceptId=\"6751\" />\r\n						<obs conceptId=\"6760\" style=\"checkbox\" answerConceptId=\"6752\" />\r\n						<obs conceptId=\"6760\" style=\"checkbox\" answerConceptId=\"6753\" />\r\n						<obs conceptId=\"6760\" style=\"checkbox\" answerConceptId=\"6754\" />\r\n						<obs conceptId=\"6760\" style=\"checkbox\" answerConceptId=\"6755\" />\r\n						<obs conceptId=\"6760\" style=\"checkbox\" answerConceptId=\"6756\" />\r\n						<obs conceptId=\"6760\" style=\"checkbox\" answerConceptId=\"6757\" />\r\n						<obs conceptId=\"6760\" style=\"checkbox\" answerConceptId=\"6758\" />\r\n						<obs conceptId=\"6760\" style=\"checkbox\" answerConceptId=\"6792\" />\r\n						<obs conceptId=\"6760\" style=\"checkbox\" answerConceptId=\"6793\" />\r\n						<obs conceptId=\"6760\" style=\"checkbox\" answerConceptId=\"6759\" />\r\n					</span>\r\n				</td>\r\n			</tr>\r\n		</table>\r\n	</section>\r\n\r\n	<submit />\r\n</htmlform>',1,'2013-02-13 15:05:55',3,'2013-04-03 15:18:05',0,'6104de2d-8e04-4ce1-9882-d1194f7b332f',NULL,NULL,NULL,NULL),(2,2,NULL,'<htmlform>\r\n<!-- Full reference for HTML Forms at http://wiki.openmrs.org/x/kg8z -->\r\n	<macros>\r\n		paperFormId = (Fill this in)\r\n		headerColor =#009d8e\r\n		fontOnHeaderColor = white\r\n	</macros>\r\n\r\n	<style>\r\n		.section {\r\n		border: 1px solid $headerColor;\r\n		padding: 2px;\r\n		text-align: left;\r\n		margin-bottom: 1em;\r\n		}\r\n		.sectionHeader {\r\n		background-color: $headerColor;\r\n		color: $fontOnHeaderColor;\r\n		display: block;\r\n		padding: 2px;\r\n		font-weight: bold;\r\n		}\r\n		table.baseline-aligned td {\r\n		vertical-align: baseline;\r\n		}\r\n	</style>\r\n\r\n	<span style=\"float:right\">1</span>\r\n	<h2>Mobile Clinic Reception</h2>\r\n\r\n	<section headerLabel=\"Patient Demographics\">\r\n		<table class=\"baseline-aligned\">\r\n			<tr>\r\n				<td>ZL EMR ID:</td>\r\n				<td>\r\n					<lookup class=\"value\"\r\n						complexExpression=\"#foreach( $patId in $patientIdentifiers.get(\'ZL EMR ID\') ) $patId #end \" />\r\n				</td>\r\n				<td>Dossier Number:</td>\r\n				<td>\r\n					<lookup class=\"value\"\r\n						complexExpression=\"#foreach( $patId in $patientIdentifiers.get(\'Nimewo Dosye\') ) $patId #end \" />\r\n				</td>\r\n			</tr>\r\n			<tr>\r\n				<td>Name:</td>\r\n				<td>\r\n					<lookup class=\"value\" expression=\"patient.personName\" />\r\n				</td>\r\n			</tr>\r\n			<tr>\r\n				<td>Lokalitie:</td>\r\n				<td></td>\r\n			</tr>\r\n			<tr>\r\n				<td>Gender:</td>\r\n				<td>\r\n					<lookup class=\"value\" expression=\"patient.gender\" />\r\n				</td>\r\n			</tr>\r\n		</table>\r\n	</section>\r\n\r\n	<section headerLabel=\"Visit Details\">\r\n		<table class=\"baseline-aligned\">\r\n			<tr>\r\n				<td>Date:</td>\r\n				<td>\r\n					<encounterDate default=\"today\" />\r\n				</td>\r\n				<td>Location:</td>\r\n				<td>\r\n					<encounterLocation />\r\n					(Use\r\n					<a href=\"/openmrs/options.form\">\'My Profile\' - \'Default location\'</a>\r\n					to change default location)\r\n				</td>\r\n			</tr>\r\n			<tr>\r\n				<td colspan=\"4\"><obs conceptId=\"6744\" labelNameTag=\"default\" style=\"radio\"/></td>\r\n			</tr>\r\n		</table>\r\n	</section>\r\n\r\n	<submit />\r\n</htmlform>',1,'2013-02-13 19:39:45',1,'2013-03-04 08:34:06',0,'80e2835c-dc2b-44c8-ab73-2040a67b0828',NULL,NULL,NULL,NULL),(3,3,NULL,'<htmlform>\r\n<!-- MAKE SURE YOU EDIT THE MOST RECENT VERSION! -->\r\n<!-- The most recent version is either \r\n       - under https://github.com/PIH/openmrs-module-haitimobileclinic-tools/tree/master/openmrs-forms\r\n       or \r\n       - straight in the MySQL dump of the metadata (less preferred, but likely)\r\n-->\r\n<!-- Full reference for HTML Forms at http://wiki.openmrs.org/x/kg8z -->\r\n	<macros>\r\n		paperFormId = (Fill this in)\r\n		headerColor =#009d8e\r\n		fontOnHeaderColor = white\r\n	</macros>\r\n\r\n	<style>\r\n		.section {\r\n			border: 1px solid $headerColor;\r\n			padding: 2px;\r\n			text-align: left;\r\n			margin-bottom: 1em;\r\n		}\r\n		.sectionHeader {\r\n			background-color: $headerColor;\r\n			color: $fontOnHeaderColor;\r\n			display: block;\r\n			padding: 2px;\r\n			font-weight: bold;\r\n		}\r\n		table.baseline-aligned td {\r\n			vertical-align: baseline;\r\n		}\r\n	</style>\r\n\r\n	<script type=\"text/javascript\">\r\n		$j(document).ready(function(){\r\n			// there is no readonly in HTML for select fields, but disabling it will prevent the form from submitting any value\r\n			// therefore remove every entry except the pre-selected one (which should be already set from a the user profile default location)\r\n			$j(\"#encounterLocation select option\").not(\"option:selected\").remove();\r\n		});\r\n	</script>\r\n\r\n	<span style=\"float:right\">v1.0 (26-FEBRUARY 2013)</span>\r\n\r\n	<h2>Static Clinic Enrollment Visit</h2>\r\n\r\n	<section headerLabel=\"Données démographiques du patient\">\r\n		<table class=\"baseline-aligned\">\r\n			<tr>\r\n				<td>Dossier #:</td>\r\n				<td>\r\n					<lookup class=\"value\"\r\n						complexExpression=\"#foreach( $patId in $patientIdentifiers.get(\'Mobile Clinic Dossier Number\') ) $patId #end \" />\r\n				</td>\r\n			</tr>\r\n			<tr>\r\n				<td>Nom:</td>\r\n				<td>\r\n					<lookup class=\"value\" expression=\"patient.personName\" />\r\n				</td>\r\n			</tr>\r\n			<tr>\r\n				<td>Localité:</td>\r\n				<td>\r\n					<lookup complexExpression=\"#foreach( $addr in $patient.addresses ) $addr.stateProvince, $addr.cityVillage, $addr.address3, $addr.address1    #end\"/>\r\n				</td>\r\n			</tr>\r\n			<tr>\r\n				<td>Sexe:</td>\r\n				<td>\r\n					<lookup class=\"value\" expression=\"patient.gender\" />\r\n				</td>\r\n			</tr>\r\n		</table>\r\n	</section>\r\n\r\n	<section headerLabel=\"Enrollment Details\">\r\n		\r\n		<table class=\"baseline-aligned\">\r\n			<tr>\r\n				<td>Enrollment reason:</td>\r\n				<td><obs conceptId=\"6760\" style=\"radio\"/></td>\r\n			</tr>\r\n			<tr>\r\n				<td>Date:</td>\r\n				<td><encounterDate id=\"encounterDate\"/></td>\r\n			</tr>\r\n			<tr>\r\n				<td>Institution sanitaire:</td>\r\n				<td><encounterLocation id=\"encounterLocation\" default=\"GlobalProperty:default_location\"/></td>\r\n			</tr>\r\n			<!-- provider is not relevant here, simply hide it -->\r\n			<tr style=\"display:none\">\r\n				<td>Provider:</td>\r\n				<td><encounterProvider id=\"encounterProvider\" default=\"5\"/></td>\r\n			</tr>\r\n		</table>\r\n	</section>\r\n\r\n	<submit />\r\n</htmlform>',1,'2013-02-26 11:38:55',3,'2013-04-03 15:19:39',0,'4f439acb-7c29-4d1f-a320-ecade78909bf',NULL,NULL,NULL,NULL),(4,4,NULL,'<htmlform>\r\n<!-- MAKE SURE YOU EDIT THE MOST RECENT VERSION! -->\r\n<!-- The most recent version is either \r\n       - under https://github.com/PIH/openmrs-module-haitimobileclinic-tools/tree/master/openmrs-forms\r\n       or \r\n       - straight in the MySQL dump of the metadata (less preferred, but likely)\r\n-->\r\n<!-- Full reference for HTML Forms at http://wiki.openmrs.org/x/kg8z -->\r\n	<macros>\r\n		paperFormId = (Fill this in)\r\n		headerColor =#009d8e\r\n		fontOnHeaderColor = white\r\n	</macros>\r\n\r\n	<style>\r\n		.section {\r\n			border: 1px solid $headerColor;\r\n			padding: 2px;\r\n			text-align: left;\r\n			margin-bottom: 1em;\r\n		}\r\n		.sectionHeader {\r\n			background-color: $headerColor;\r\n			color: $fontOnHeaderColor;\r\n			display: block;\r\n			padding: 2px;\r\n			font-weight: bold;\r\n		}\r\n		table.baseline-aligned td {\r\n			vertical-align: baseline;\r\n		}\r\n	</style>\r\n\r\n	<script type=\"text/javascript\">\r\n		$j(document).ready(function(){\r\n			// there is no readonly in HTML for select fields, but disabling it will prevent the form from submitting any value\r\n			// therefore remove every entry except the pre-selected one (which should be already set from a the user profile default location)\r\n			$j(\"#encounterLocation select option\").not(\"option:selected\").remove();\r\n		});\r\n	</script>\r\n\r\n	<span style=\"float:right\">v1.0 (28-FEBRUARY 2013)</span>\r\n\r\n	<h2>TB Results and Status</h2>\r\n\r\n	<section headerLabel=\"Données démographiques du patient\">\r\n		<table class=\"baseline-aligned\">\r\n			<tr>\r\n				<td>Dossier #:</td>\r\n				<td>\r\n					<lookup class=\"value\"\r\n						complexExpression=\"#foreach( $patId in $patientIdentifiers.get(\'Mobile Clinic Dossier Number\') ) $patId #end \" />\r\n				</td>\r\n			</tr>\r\n			<tr>\r\n				<td>Nom:</td>\r\n				<td>\r\n					<lookup class=\"value\" expression=\"patient.personName\" />\r\n				</td>\r\n			</tr>\r\n			<tr>\r\n				<td>Localité:</td>\r\n				<td>\r\n					<lookup complexExpression=\"#foreach( $addr in $patient.addresses ) $addr.stateProvince, $addr.cityVillage, $addr.address3, $addr.address1    #end\"/>\r\n				</td>\r\n			</tr>\r\n			<tr>\r\n				<td>Sexe:</td>\r\n				<td>\r\n					<lookup class=\"value\" expression=\"patient.gender\" />\r\n				</td>\r\n			</tr>\r\n		</table>\r\n	</section>\r\n\r\n	<section headerLabel=\"TB Details\">\r\n		\r\n		<table class=\"baseline-aligned\">\r\n			<tr>\r\n				<td>6 years and older</td>\r\n			</tr>\r\n			<tr>\r\n				<td></td>\r\n				<td>Sputum result 1:</td>\r\n				<td><obs conceptId=\"6777\" style=\"select\"/> </td>\r\n				<td><obs conceptId=\"6783\"/></td>\r\n			</tr>\r\n			<tr>\r\n				<td></td>\r\n				<td>Sputum result 2:</td>\r\n				<td><obs conceptId=\"6778\" style=\"select\"/> </td>\r\n				<td><obs conceptId=\"6784\"/></td>\r\n			</tr>\r\n			<tr>\r\n				<td></td>\r\n				<td>Sputum result 3:</td>\r\n				<td><obs conceptId=\"6779\" style=\"select\"/> </td>\r\n				<td><obs conceptId=\"6785\"/></td>\r\n			</tr>\r\n			<tr>\r\n				<td>Child under 6 years</td>\r\n			</tr>\r\n			<tr>\r\n				<td></td>\r\n				<td>PPD result:</td>\r\n				<td><obs conceptId=\"6787\" style=\"select\"/> </td>\r\n				<td><obs conceptId=\"6788\"/></td>\r\n			</tr>\r\n		</table>\r\n		<table class=\"baseline-aligned\">\r\n			<tr>\r\n				<td>Confirmative TB status:</td>\r\n				<td><obs conceptId=\"6782\" style=\"select\"/> <obs conceptId=\"6786\"/></td>\r\n			</tr>\r\n			<tr>\r\n				<td>Date:</td>\r\n				<td><encounterDate id=\"encounterDate\"/></td>\r\n			</tr>\r\n			<tr>\r\n				<td>Static location:</td>\r\n				<td><encounterLocation id=\"encounterLocation\" default=\"GlobalProperty:default_location\"/></td>\r\n			</tr>\r\n			<!-- provider is not relevant here, simply hide it -->\r\n			<tr style=\"display:none\">\r\n				<td>Provider:</td>\r\n				<td><encounterProvider id=\"encounterProvider\" default=\"5\"/></td>\r\n			</tr>\r\n		</table>\r\n	</section>\r\n\r\n	<submit />\r\n</htmlform>',1,'2013-02-28 11:34:03',3,'2013-03-20 16:26:04',0,'8f19031d-4305-4b3c-b464-1362c67256e7',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `htmlformentry_html_form` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2013-04-05 15:13:42
