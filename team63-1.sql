CREATE DATABASE  IF NOT EXISTS `cs4400` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */;
USE `cs4400`;
-- MySQL dump 10.13  Distrib 8.0.15, for Win64 (x86_64)
--
-- Host: localhost    Database: cs4400
-- ------------------------------------------------------
-- Server version	8.0.15

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `assign_to`
--

DROP TABLE IF EXISTS `assign_to`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `assign_to` (
  `staffUserName` varchar(50) NOT NULL,
  `eventName` varchar(100) NOT NULL,
  `startDate` datetime NOT NULL,
  `siteName` varchar(50) NOT NULL,
  PRIMARY KEY (`staffUserName`,`eventName`,`siteName`,`startDate`),
  KEY `eventName` (`eventName`,`siteName`,`startDate`),
  CONSTRAINT `assign_to_ibfk_1` FOREIGN KEY (`staffUserName`) REFERENCES `employee` (`username`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `assign_to_ibfk_2` FOREIGN KEY (`eventName`, `siteName`, `startDate`) REFERENCES `event` (`name`, `sitename`, `startDate`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assign_to`
--

LOCK TABLES `assign_to` WRITE;
/*!40000 ALTER TABLE `assign_to` DISABLE KEYS */;
INSERT INTO `assign_to` VALUES ('staff3','Arboretum Walking Tour','2019-02-08 00:00:00','Inman Park'),('michael.smith','Bus Tour','2019-02-01 00:00:00','Inman Park'),('staff2','Bus Tour','2019-02-01 00:00:00','Inman Park'),('michael.smith','Bus Tour','2019-02-08 00:00:00','Inman Park'),('robert.smith','Bus Tour','2019-02-08 00:00:00','Inman Park'),('michael.smith','Eastside Trail','2019-02-13 00:00:00','Historic Fourth Ward Park'),('robert.smith','Eastside Trail','2019-02-04 00:00:00','Inman Park'),('staff2','Eastside Trail','2019-02-04 00:00:00','Inman Park'),('staff1','Eastside Trail','2019-03-01 00:00:00','Inman Park'),('michael.smith','Eastside Trail','2019-02-04 00:00:00','Piedmont Park'),('staff1','Eastside Trail','2019-02-04 00:00:00','Piedmont Park'),('staff1','Official Atlanta BeltLine Bike Tour','2019-02-09 00:00:00','Atlanta BeltLine Center'),('robert.smith','Private Bus Tour','2019-02-01 00:00:00','Inman Park'),('staff1','Westside Trail','2019-02-18 00:00:00','Westview Cemetery'),('staff3','Westside Trail','2019-02-18 00:00:00','Westview Cemetery');
/*!40000 ALTER TABLE `assign_to` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `connect`
--

DROP TABLE IF EXISTS `connect`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `connect` (
  `siteName` varchar(50) NOT NULL,
  `routeType` enum('MARTA','Bus','Bike') NOT NULL,
  `transitRoute` varchar(15) NOT NULL,
  PRIMARY KEY (`siteName`,`routeType`,`transitRoute`),
  KEY `routeType` (`routeType`,`transitRoute`),
  CONSTRAINT `connect_ibfk_1` FOREIGN KEY (`siteName`) REFERENCES `site` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `connect_ibfk_2` FOREIGN KEY (`routeType`, `transitRoute`) REFERENCES `transit` (`type`, `route`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `connect`
--

LOCK TABLES `connect` WRITE;
/*!40000 ALTER TABLE `connect` DISABLE KEYS */;
INSERT INTO `connect` VALUES ('Historic Fourth Ward Park','MARTA','Blue'),('Inman Park','MARTA','Blue'),('Piedmont Park','MARTA','Blue'),('Westview Cemetery','MARTA','Blue'),('Historic Fourth Ward Park','Bus','152'),('Inman Park','Bus','152'),('Piedmont Park','Bus','152'),('Historic Fourth Ward Park','Bike','Relay'),('Piedmont Park','Bike','Relay');
/*!40000 ALTER TABLE `connect` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `email`
--

DROP TABLE IF EXISTS `email`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `email` (
  `username` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  UNIQUE KEY `email` (`email`),
  KEY `username` (`username`),
  CONSTRAINT `email_ibfk_1` FOREIGN KEY (`username`) REFERENCES `user` (`username`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email`
--

LOCK TABLES `email` WRITE;
/*!40000 ALTER TABLE `email` DISABLE KEYS */;
INSERT INTO `email` VALUES ('james.smith','jsmith@gmail.com'),('james.smith','jsmith@hotmail.com'),('james.smith','jsmith@gatech.edu'),('james.smith','jsmith@outlook.com'),('michael.smith','msmith@gmail.com'),('robert.smith','rsmith@hotmail.com'),('maria.garcia','mgarcia@yahoo.com'),('maria.garcia','mgarcia@gatech.edu'),('david.smith','dsmith@outlook.com'),('maria.rodriguez','mrodriguez@gmail.com'),('mary.smith','mary@outlook.com'),('maria.hernandez','mh@gatech.edu'),('maria.hernandez','mh123@gmail.com'),('manager1','m1@beltline.com'),('manager2','m2@beltline.com'),('manager3','m3@beltline.com'),('manager4','m4@beltline.com'),('manager5','m5@beltline.com'),('staff1','s1@beltline.com'),('staff2','s2@beltline.com'),('staff3','s3@beltline.com'),('user1','u1@beltline.com'),('visitor1','v1@beltline.com'),('james.smith','asd@y.co'),('james.smith','sdfgs@gmail.com');
/*!40000 ALTER TABLE `email` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `employee` (
  `username` varchar(50) NOT NULL,
  `employeeID` int(9) NOT NULL,
  `phone` char(10) NOT NULL,
  `address` varchar(50) NOT NULL,
  `city` char(30) NOT NULL,
  `state` enum('AL','AK','AZ','AR','CA','CO','CT','DE','FL','GA','HI','ID','IL','IN','IA','KS','KY','LA','ME','MD','MA','MI','MN','MS','MO','MT','NE','NV','NH','NJ','NM','NY','NC','ND','OH','OK','OR','PA','RI','SC','SD','TN','TX','UT','VT','VA','WA','WV','WI','WY') NOT NULL,
  `zipcode` int(5) unsigned NOT NULL,
  `employeeType` enum('admin','manager','staff') NOT NULL,
  PRIMARY KEY (`username`),
  UNIQUE KEY `employeeID` (`employeeID`,`phone`),
  CONSTRAINT `employee_ibfk_1` FOREIGN KEY (`username`) REFERENCES `user` (`username`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES ('david.smith',5,'5124776435','350 Ferst Drive','Atlanta','GA',30332,'manager'),('james.smith',1,'1234567890','123 East Main Street','Rochester','NY',14604,'admin'),('manager1',6,'8045126767','123 East Main Street','Rochester','NY',14604,'manager'),('manager2',7,'9876543210','123 East Main Street','Rochester','NY',14604,'manager'),('manager3',8,'5432167890','350 Ferst Drive','Atlanta','GA',30332,'manager'),('manager4',9,'8053467565','123 East Main Street','Columbus','OH',43215,'manager'),('manager5',10,'8031446782','801 Atlantic Drive','Atlanta','GA',30332,'manager'),('maria.garcia',4,'7890123456','123 East Main Street','Richland','PA',17987,'manager'),('michael.smith',2,'4043726789','350 Ferst Drive','Atlanta','GA',30332,'staff'),('robert.smith',3,'1234567890','123 East Main Street','Columbus','OH',43215,'staff'),('staff1',11,'8024456765','266 Ferst Drive Northwest','Atlanta','GA',30332,'staff'),('staff2',12,'8888888888','266 Ferst Drive Northwest','Atlanta','GA',30332,'staff'),('staff3',13,'3333333333','801 Atlantic Drive','Atlanta','GA',30332,'staff');
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `event`
--

DROP TABLE IF EXISTS `event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `event` (
  `name` varchar(100) NOT NULL,
  `startDate` datetime NOT NULL,
  `sitename` varchar(50) NOT NULL,
  `endDate` datetime NOT NULL,
  `price` int(10) unsigned NOT NULL,
  `capacity` int(3) NOT NULL,
  `minStaffReq` int(3) NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY (`name`,`sitename`,`startDate`),
  UNIQUE KEY `name` (`name`,`sitename`,`startDate`,`endDate`),
  KEY `sitename` (`sitename`),
  CONSTRAINT `event_ibfk_1` FOREIGN KEY (`sitename`) REFERENCES `site` (`name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event`
--

LOCK TABLES `event` WRITE;
/*!40000 ALTER TABLE `event` DISABLE KEYS */;
INSERT INTO `event` VALUES ('Arboretum Walking Tour','2019-02-08 00:00:00','Inman Park','2019-02-11 00:00:00',5,5,1,'Official Atlanta BeltLine Arboretum Walking Tours provide an up-close view of the Westside Trail and the Atlanta BeltLine Arboretum led by Trees Atlanta Docents. The one and a half hour tours step off at at 10am (Oct thru May), and 9am (June thru September). Departure for all tours is from Rose Circle Park near Brown Middle School. More details at: https://beltline.org/visit/atlanta-beltline-tours/#arboretum-walking'),('Bus Tour','2019-02-01 00:00:00','Inman Park','2019-02-02 00:00:00',25,6,2,'The Atlanta BeltLine Partnership’s tour program operates with a natural gas-powered, ADA accessible tour bus funded through contributions from 10th & Monroe, LLC, SunTrust Bank Trusteed Foundations – Florence C. and Harry L. English Memorial Fund and Thomas Guy Woolford Charitable Trust, and AGL Resources'),('Bus Tour','2019-02-08 00:00:00','Inman Park','2019-02-10 00:00:00',25,6,2,'The Atlanta BeltLine Partnership’s tour program operates with a natural gas-powered, ADA accessible tour bus funded through contributions from 10th & Monroe, LLC, SunTrust Bank Trusteed Foundations – Florence C. and Harry L. English Memorial Fund and Thomas Guy Woolford Charitable Trust, and AGL Resources'),('Eastside Trail','2019-02-13 00:00:00','Historic Fourth Ward Park','2019-02-14 00:00:00',0,99999,1,'A combination of multi-use trail and linear greenspace, the Eastside Trail was the first finished section of the Atlanta BeltLine trail in the old rail corridor. The Eastside Trail, which was funded by a combination of public and private philanthropic sources, runs from the tip of Piedmont Park to Reynoldstown. More details at https://beltline.org/explore-atlanta-beltline-trails/eastside-trail/'),('Eastside Trail','2019-02-04 00:00:00','Inman Park','2019-02-05 00:00:00',0,99999,1,'A combination of multi-use trail and linear greenspace, the Eastside Trail was the first finished section of the Atlanta BeltLine trail in the old rail corridor. The Eastside Trail, which was funded by a combination of public and private philanthropic sources, runs from the tip of Piedmont Park to Reynoldstown. More details at https://beltline.org/explore-atlanta-beltline-trails/eastside-trail/'),('Eastside Trail','2019-03-01 00:00:00','Inman Park','2019-03-02 00:00:00',0,99999,1,'A combination of multi-use trail and linear greenspace, the Eastside Trail was the first finished section of the Atlanta BeltLine trail in the old rail corridor. The Eastside Trail, which was funded by a combination of public and private philanthropic sources, runs from the tip of Piedmont Park to Reynoldstown. More details at https://beltline.org/explore-atlanta-beltline-trails/eastside-trail/'),('Eastside Trail','2019-02-04 00:00:00','Piedmont Park','2019-02-05 00:00:00',0,99999,1,'A combination of multi-use trail and linear greenspace, the Eastside Trail was the first finished section of the Atlanta BeltLine trail in the old rail corridor. The Eastside Trail, which was funded by a combination of public and private philanthropic sources, runs from the tip of Piedmont Park to Reynoldstown. More details at https://beltline.org/explore-atlanta-beltline-trails/eastside-trail/'),('Official Atlanta BeltLine Bike Tour','2019-02-09 00:00:00','Atlanta BeltLine Center','2019-02-14 00:00:00',5,5,1,'These tours will include rest stops highlighting assets and points of interest along the Atlanta BeltLine. Staff will lead the rides, and each group will have a ride sweep to help with any unexpected mechanical difficulties.'),('Private Bus Tour','2019-02-01 00:00:00','Inman Park','2019-02-02 00:00:00',40,4,1,'Private tours are available most days, pending bus and tour guide availability. Private tours can accommodate up to 4 guests per tour, and are subject to a tour fee (nonprofit rates are available). As a nonprofit organization with limited resources, we are unable to offer free private tours. We thank you for your support and your understanding as we try to provide as many private group tours as possible. The Atlanta BeltLine Partnership’s tour program operates with a natural gas-powered, ADA accessible tour bus funded through contributions from 10th & Monroe, LLC, SunTrust Bank Trusteed Foundations – Florence C. and Harry L. English Memorial Fund and Thomas Guy Woolford Charitable Trust, and AGL Resources'),('Westside Trail','2019-02-18 00:00:00','Westview Cemetery','2019-02-21 00:00:00',0,99999,1,'The Westside Trail is a free amenity that offers a bicycle and pedestrian-safe corridor with a 14-foot-wide multi-use trail surrounded by mature trees and grasses thanks to Trees Atlanta’s Arboretum. With 16 points of entry, 14 of which will be ADA-accessible with ramp and stair systems, the trail provides numerous access points for people of all abilities. More details at: https://beltline.org/explore-atlanta-beltline-trails/westside-trail/');
/*!40000 ALTER TABLE `event` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `s16_transitview`
--

DROP TABLE IF EXISTS `s16_transitview`;
/*!50001 DROP VIEW IF EXISTS `s16_transitview`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `s16_transitview` AS SELECT 
 1 AS `User`,
 1 AS `Date`,
 1 AS `Route`,
 1 AS `Type`,
 1 AS `Price`,
 1 AS `Sitename`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `s19_siteview`
--

DROP TABLE IF EXISTS `s19_siteview`;
/*!50001 DROP VIEW IF EXISTS `s19_siteview`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `s19_siteview` AS SELECT 
 1 AS `name`,
 1 AS `manager`,
 1 AS `openEveryday`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `s22_transitview`
--

DROP TABLE IF EXISTS `s22_transitview`;
/*!50001 DROP VIEW IF EXISTS `s22_transitview`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `s22_transitview` AS SELECT 
 1 AS `Route`,
 1 AS `TransportType`,
 1 AS `price`,
 1 AS `# Connected Sites`,
 1 AS `# Transit Logged`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `s25_eventfilter`
--

DROP TABLE IF EXISTS `s25_eventfilter`;
/*!50001 DROP VIEW IF EXISTS `s25_eventfilter`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `s25_eventfilter` AS SELECT 
 1 AS `name`,
 1 AS `StaffCount`,
 1 AS `Duration`,
 1 AS `TotalVisits`,
 1 AS `totalRevenue`,
 1 AS `startDate`,
 1 AS `endDate`,
 1 AS `sitename`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `s25_eventstaff`
--

DROP TABLE IF EXISTS `s25_eventstaff`;
/*!50001 DROP VIEW IF EXISTS `s25_eventstaff`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `s25_eventstaff` AS SELECT 
 1 AS `name`,
 1 AS `startDate`,
 1 AS `StaffCount`,
 1 AS `Duration`,
 1 AS `endDate`,
 1 AS `sitename`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `s25_eventvisitors`
--

DROP TABLE IF EXISTS `s25_eventvisitors`;
/*!50001 DROP VIEW IF EXISTS `s25_eventvisitors`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `s25_eventvisitors` AS SELECT 
 1 AS `name`,
 1 AS `startDate`,
 1 AS `TotalVisits`,
 1 AS `totalRevenue`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `s25_eventvisitorsdaily`
--

DROP TABLE IF EXISTS `s25_eventvisitorsdaily`;
/*!50001 DROP VIEW IF EXISTS `s25_eventvisitorsdaily`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `s25_eventvisitorsdaily` AS SELECT 
 1 AS `name`,
 1 AS `startDate`,
 1 AS `siteName`,
 1 AS `date`,
 1 AS `TotalVisits`,
 1 AS `totalRevenue`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `s29_eventvisitors`
--

DROP TABLE IF EXISTS `s29_eventvisitors`;
/*!50001 DROP VIEW IF EXISTS `s29_eventvisitors`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `s29_eventvisitors` AS SELECT 
 1 AS `name`,
 1 AS `startDate`,
 1 AS `endDate`,
 1 AS `siteName`,
 1 AS `date`,
 1 AS `EventCount`,
 1 AS `TotalVisits`,
 1 AS `totalRevenue`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `s29_eventvisitorsdaily`
--

DROP TABLE IF EXISTS `s29_eventvisitorsdaily`;
/*!50001 DROP VIEW IF EXISTS `s29_eventvisitorsdaily`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `s29_eventvisitorsdaily` AS SELECT 
 1 AS `date`,
 1 AS `EventCount`,
 1 AS `StaffCount`,
 1 AS `TotalVisits`,
 1 AS `totalRevenue`,
 1 AS `startDate`,
 1 AS `endDate`,
 1 AS `sitename`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `s31_eventstaff`
--

DROP TABLE IF EXISTS `s31_eventstaff`;
/*!50001 DROP VIEW IF EXISTS `s31_eventstaff`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `s31_eventstaff` AS SELECT 
 1 AS `name`,
 1 AS `startDate`,
 1 AS `StaffCount`,
 1 AS `Duration`,
 1 AS `endDate`,
 1 AS `sitename`,
 1 AS `description`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `s32_eventdetail`
--

DROP TABLE IF EXISTS `s32_eventdetail`;
/*!50001 DROP VIEW IF EXISTS `s32_eventdetail`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `s32_eventdetail` AS SELECT 
 1 AS `name`,
 1 AS `sitename`,
 1 AS `startDate`,
 1 AS `endDate`,
 1 AS `Duration`,
 1 AS `StaffsAssigned`,
 1 AS `capacity`,
 1 AS `price`,
 1 AS `description`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `s32_stafflist`
--

DROP TABLE IF EXISTS `s32_stafflist`;
/*!50001 DROP VIEW IF EXISTS `s32_stafflist`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `s32_stafflist` AS SELECT 
 1 AS `eventName`,
 1 AS `siteName`,
 1 AS `startDate`,
 1 AS `StaffsAssigned`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `s33_exploreevent`
--

DROP TABLE IF EXISTS `s33_exploreevent`;
/*!50001 DROP VIEW IF EXISTS `s33_exploreevent`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `s33_exploreevent` AS SELECT 
 1 AS `name`,
 1 AS `siteName`,
 1 AS `price`,
 1 AS `ticketRemaining`,
 1 AS `totalVisits`,
 1 AS `visitors`,
 1 AS `startDate`,
 1 AS `endDate`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `s33_sub_a`
--

DROP TABLE IF EXISTS `s33_sub_a`;
/*!50001 DROP VIEW IF EXISTS `s33_sub_a`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `s33_sub_a` AS SELECT 
 1 AS `name`,
 1 AS `siteName`,
 1 AS `totalVisits`,
 1 AS `date`,
 1 AS `startDate`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `s33_sub_b`
--

DROP TABLE IF EXISTS `s33_sub_b`;
/*!50001 DROP VIEW IF EXISTS `s33_sub_b`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `s33_sub_b` AS SELECT 
 1 AS `name`,
 1 AS `sitename`,
 1 AS `price`,
 1 AS `capacity`,
 1 AS `Visitors`,
 1 AS `Date`,
 1 AS `startDate`,
 1 AS `endDate`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `s34_visitoreventdetail`
--

DROP TABLE IF EXISTS `s34_visitoreventdetail`;
/*!50001 DROP VIEW IF EXISTS `s34_visitoreventdetail`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `s34_visitoreventdetail` AS SELECT 
 1 AS `name`,
 1 AS `siteName`,
 1 AS `startDate`,
 1 AS `endDate`,
 1 AS `price`,
 1 AS `ticketRemaining`,
 1 AS `description`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `site`
--

DROP TABLE IF EXISTS `site`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `site` (
  `name` varchar(50) NOT NULL,
  `address` varchar(50) DEFAULT NULL,
  `zipcode` int(5) NOT NULL,
  `openEveryday` enum('Yes','No') NOT NULL,
  `manager` varchar(50) NOT NULL,
  PRIMARY KEY (`name`),
  UNIQUE KEY `manager` (`manager`),
  CONSTRAINT `site_ibfk_1` FOREIGN KEY (`manager`) REFERENCES `employee` (`username`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `site`
--

LOCK TABLES `site` WRITE;
/*!40000 ALTER TABLE `site` DISABLE KEYS */;
INSERT INTO `site` VALUES ('Atlanta Beltline Center','112 Krog Street Northeast',30307,'No','manager3'),('Historic Fourth Ward Park','680 Dallas Street Northeast',30308,'Yes','manager4'),('Inman Park',NULL,30307,'Yes','david.smith'),('Piedmont Park','400 Park Drive Northeast',30306,'Yes','manager2'),('Westview Cemetery','1680 Westview Drive Southwest',30310,'No','manager5');
/*!40000 ALTER TABLE `site` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `take`
--

DROP TABLE IF EXISTS `take`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `take` (
  `userName` varchar(50) NOT NULL,
  `routeType` enum('marta','bus','bike') NOT NULL,
  `transitRoute` varchar(15) NOT NULL,
  `date` datetime NOT NULL,
  PRIMARY KEY (`userName`,`routeType`,`transitRoute`,`date`),
  KEY `routeType` (`routeType`,`transitRoute`),
  CONSTRAINT `take_ibfk_1` FOREIGN KEY (`userName`) REFERENCES `user` (`username`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `take_ibfk_2` FOREIGN KEY (`routeType`, `transitRoute`) REFERENCES `transit` (`type`, `route`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `take`
--

LOCK TABLES `take` WRITE;
/*!40000 ALTER TABLE `take` DISABLE KEYS */;
INSERT INTO `take` VALUES ('manager2','marta','Blue','2019-03-20 00:00:00'),('manager2','marta','Blue','2019-03-21 00:00:00'),('manager2','marta','Blue','2019-03-22 00:00:00'),('visitor1','marta','Blue','2019-03-21 00:00:00'),('manager2','bus','152','2019-03-20 00:00:00'),('maria.hernandez','bus','152','2019-03-20 00:00:00'),('maria.hernandez','bus','152','2019-03-22 00:00:00'),('manager3','bike','Relay','2019-03-20 00:00:00'),('maria.hernandez','bike','Relay','2019-03-20 00:00:00'),('mary.smith','bike','Relay','2019-03-23 00:00:00');
/*!40000 ALTER TABLE `take` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transit`
--

DROP TABLE IF EXISTS `transit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `transit` (
  `type` enum('MARTA','Bus','Bike') NOT NULL,
  `route` varchar(15) NOT NULL,
  `price` int(10) unsigned NOT NULL,
  PRIMARY KEY (`type`,`route`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transit`
--

LOCK TABLES `transit` WRITE;
/*!40000 ALTER TABLE `transit` DISABLE KEYS */;
INSERT INTO `transit` VALUES ('MARTA','Blue',2),('Bus','152',2),('Bike','Relay',1);
/*!40000 ALTER TABLE `transit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `user` (
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `status` enum('PENDING','APPROVED','DECLINED') NOT NULL,
  `firstname` varchar(50) NOT NULL,
  `lastname` varchar(50) NOT NULL,
  `usertype` enum('EMPLOYEE','EMPLOYEE, VISITOR','USER','VISITOR') NOT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES ('david.smith','dsmith456','APPROVED','David','Smith','EMPLOYEE'),('james.smith','jsmith123','APPROVED','APoorva','Dey','EMPLOYEE'),('manager1','manager1','PENDING','Manager','One','EMPLOYEE'),('manager2','manager2','APPROVED','Manager','Two','EMPLOYEE, VISITOR'),('manager3','manager3','APPROVED','Manager','Three','EMPLOYEE'),('manager4','manager4','APPROVED','Manager','Four','EMPLOYEE, VISITOR'),('manager5','manager5','APPROVED','Manager','Five','EMPLOYEE, VISITOR'),('maria.garcia','mgarcia123','APPROVED','Maria','Garcia','EMPLOYEE, VISITOR'),('maria.hernandez','mhernandez','APPROVED','Maria','Hernandez','USER'),('maria.rodriguez','mrodriguez','DECLINED','Maria','Rodriguez','VISITOR'),('mary.smith','msmith789','APPROVED','Mary','Smith','VISITOR'),('michael.smith','msmith456','APPROVED','Michael','Smith','EMPLOYEE, VISITOR'),('robert.smith','rsmith789','APPROVED','Robert ','Smith','EMPLOYEE'),('staff1','staff1234','APPROVED','Staff','One','EMPLOYEE'),('staff2','staff4567','APPROVED','Staff','Two','EMPLOYEE, VISITOR'),('staff3','staff7890','APPROVED','Staff','Three','EMPLOYEE, VISITOR'),('user1','user123456','PENDING','User','One','USER'),('visitor1','visitor123','APPROVED','Visitor','One','VISITOR');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `visit_event`
--

DROP TABLE IF EXISTS `visit_event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `visit_event` (
  `visitorUsername` varchar(50) NOT NULL,
  `eventName` varchar(100) NOT NULL,
  `eventStartDate` datetime NOT NULL,
  `siteName` varchar(50) NOT NULL,
  `date` datetime NOT NULL,
  PRIMARY KEY (`visitorUsername`,`siteName`,`eventName`,`eventStartDate`,`date`),
  KEY `eventName` (`eventName`,`siteName`,`eventStartDate`),
  CONSTRAINT `visit_event_ibfk_1` FOREIGN KEY (`visitorUsername`) REFERENCES `user` (`username`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `visit_event_ibfk_2` FOREIGN KEY (`eventName`, `siteName`, `eventStartDate`) REFERENCES `event` (`name`, `sitename`, `startDate`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `visit_event`
--

LOCK TABLES `visit_event` WRITE;
/*!40000 ALTER TABLE `visit_event` DISABLE KEYS */;
INSERT INTO `visit_event` VALUES ('mary.smith','Arboretum Walking Tour','2019-02-08 00:00:00','Inman Park','2019-02-10 00:00:00'),('manager2','Bus Tour','2019-02-01 00:00:00','Inman Park','2019-02-02 00:00:00'),('manager4','Bus Tour','2019-02-01 00:00:00','Inman Park','2019-02-01 00:00:00'),('manager5','Bus Tour','2019-02-01 00:00:00','Inman Park','2019-02-02 00:00:00'),('maria.garcia','Bus Tour','2019-02-01 00:00:00','Inman Park','2019-02-02 00:00:00'),('mary.smith','Bus Tour','2019-02-01 00:00:00','Inman Park','2019-02-01 00:00:00'),('staff2','Bus Tour','2019-02-01 00:00:00','Inman Park','2019-02-02 00:00:00'),('mary.smith','Eastside Trail','2019-02-13 00:00:00','Historic Fourth Ward Park','2019-02-13 00:00:00'),('mary.smith','Eastside Trail','2019-02-13 00:00:00','Historic Fourth Ward Park','2019-02-14 00:00:00'),('visitor1','Eastside Trail','2019-02-13 00:00:00','Historic Fourth Ward Park','2019-02-14 00:00:00'),('mary.smith','Eastside Trail','2019-02-04 00:00:00','Piedmont Park','2019-02-04 00:00:00'),('mary.smith','Official Atlanta BeltLine Bike Tour','2019-02-09 00:00:00','Atlanta BeltLine Center','2019-02-10 00:00:00'),('visitor1','Official Atlanta BeltLine Bike Tour','2019-02-09 00:00:00','Atlanta BeltLine Center','2019-02-10 00:00:00'),('mary.smith','Private Bus Tour','2019-02-01 00:00:00','Inman Park','2019-02-01 00:00:00'),('mary.smith','Private Bus Tour','2019-02-01 00:00:00','Inman Park','2019-02-02 00:00:00'),('mary.smith','Westside Trail','2019-02-18 00:00:00','Westview Cemetery','2019-02-19 00:00:00'),('visitor1','Westside Trail','2019-02-18 00:00:00','Westview Cemetery','2019-02-19 00:00:00');
/*!40000 ALTER TABLE `visit_event` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `visit_site`
--

DROP TABLE IF EXISTS `visit_site`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `visit_site` (
  `visitorUserName` varchar(50) NOT NULL,
  `siteName` varchar(50) NOT NULL,
  `date` datetime NOT NULL,
  PRIMARY KEY (`visitorUserName`,`siteName`,`date`),
  KEY `siteName` (`siteName`),
  CONSTRAINT `visit_site_ibfk_1` FOREIGN KEY (`visitorUserName`) REFERENCES `user` (`username`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `visit_site_ibfk_2` FOREIGN KEY (`siteName`) REFERENCES `site` (`name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `visit_site`
--

LOCK TABLES `visit_site` WRITE;
/*!40000 ALTER TABLE `visit_site` DISABLE KEYS */;
INSERT INTO `visit_site` VALUES ('mary.smith','Atlanta Beltline Center','2019-02-01 00:00:00'),('mary.smith','Atlanta Beltline Center','2019-02-10 00:00:00'),('visitor1','Atlanta Beltline Center','2019-02-09 00:00:00'),('visitor1','Atlanta Beltline Center','2019-02-13 00:00:00'),('mary.smith','Historic Fourth Ward Park','2019-02-02 00:00:00'),('visitor1','Historic Fourth Ward Park','2019-02-11 00:00:00'),('mary.smith','Inman Park','2019-02-01 00:00:00'),('mary.smith','Inman Park','2019-02-02 00:00:00'),('mary.smith','Inman Park','2019-02-03 00:00:00'),('visitor1','Inman Park','2019-02-01 00:00:00'),('mary.smith','Piedmont Park','2019-02-02 00:00:00'),('visitor1','Piedmont Park','2019-02-01 00:00:00'),('visitor1','Piedmont Park','2019-02-11 00:00:00'),('visitor1','Westview Cemetery','2019-02-06 00:00:00');
/*!40000 ALTER TABLE `visit_site` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'cs4400'
--

--
-- Dumping routines for database 'cs4400'
--
/*!50003 DROP PROCEDURE IF EXISTS `s15_filter_transit` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `s15_filter_transit`(in inputsitename varchar(50), inputtransittype enum ('MARTA', 'Bus', 'Bike', 'ALL'), lower_price_range int unsigned, upper_price_range int unsigned)
BEGIN
IF length(inputsitename) <=0 then
	IF inputtransittype != 'ALL' then
		select route, transittype, price, count(*) as "# Connected Sites" 
			from transit inner join connect
			on transit.transittype = connect.routetype
			where transit.transittype = inputtransittype
				AND transit.price >=  lower_price_range
                AND transit.price <= upper_price_range
			group by transit.route;
	ELSE IF inputtransittype = 'ALL' then
		select route, transittype, price, count(*) as "# Connected Sites" 
			from transit inner join connect
			on transit.transittype = connect.routetype
			where transit.price >=  lower_price_range
                AND transit.price <= upper_price_range
			group by transit.route;
ELSE
		select route, transittype, price, count(*) as "# Connected Sites" 
			from transit inner join connect
			on transit.transittype = connect.routetype
			where connect.sitename = inputsitename
				AND transit.transittype = inputtransittype
				AND transit.price >=  lower_price_range
                AND transit.price <= upper_price_range
			group by transit.route;
            
END IF;
END IF;
END IF;
End ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `s15_log_transit` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `s15_log_transit`(in inputusername varchar (50), inputtransittype enum('marta', 'bus', 'bike'), inputroute varchar(15), taken_on DATETIME)
BEGIN
	IF EXISTS(select username, routetype, transitroute, logdate from take 
    where username = inputusername 
    AND routetype = inputtransittype 
    AND transitroute = inputroute
    AND logdate = taken_on)
		then select 'Transit already taken';
	ELSE
		INSERT into take(username, routetype, transitroute, logdate)
        values (inputusername, inputtransittype, inputroute, taken_on);
        Select 'Tansit logged';
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `s16_filter_history` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `s16_filter_history`(in inputusername varchar (50), inputtransittype enum('marta', 'bus', 'bike', 'all'), inputsitename varchar(50), inputroute varchar(15), startdate DATETIME, enddate DATETIME)
BEGIN

IF length(inputroute) <=0 then
	IF inputtransittype != 'ALL' then
		select *
		from s16_transitview as tv
			where tv.type = inputtransittype
                AND tv.date >= startdate
                AND tv.date <= enddate
                AND tv.sitename = inputsitename
                AND tv.user = inputusername
			group by tv.date;
	ELSE IF inputtransittype = 'ALL' then
		select *
		from s16_transitview as tv
			where tv.date >= startdate
                AND tv.date <= enddate
                AND tv.sitename = inputsitename
                AND tv.user = inputusername
			group by tv.date;
ELSE
	IF inputtransittype != 'ALL' then
		select *
		from s16_transitview as tv
			where tv.route = inputroute
				AND tv.type = inputtransittype
                AND tv.date >= startdate
                AND tv.date <= enddate
                AND tv.sitename = inputsitename
                AND tv.user = inputusername
			group by tv.date;
	ELSE IF inputtransittype = 'ALL' then
		select *
		from s16_transitview as tv
			where tv.route = inputroute
                AND tv.date >= startdate
                AND tv.date <= enddate
                AND tv.sitename = inputsitename
                AND tv.user = inputusername
			group by tv.date;
END IF;
END IF;
END IF;
end if;
END if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `s17_create_email` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `s17_create_email`(in username varchar(50) ,in value longtext)
BEGIN
Declare front TEXT DEFAULT NULL;
    DECLARE frontlen INT DEFAULT NULL;
    DECLARE TempValue TEXT DEFAULT NULL;
    
     iterator:
    LOOP  
    IF LENGTH(TRIM(Value)) = 0 OR Value IS NULL THEN
    LEAVE iterator;
    END IF;
    SET front = SUBSTRING_INDEX(Value,',',1);
    SET frontlen = LENGTH(front);
    SET TempValue = TRIM(front);
	
    if (not exists(select * from email where email.email = TempValue)) then
	insert into email Values(username, TempValue);
    end if;

    SET Value = INSERT(Value,1,frontlen + 1,'');
    END LOOP;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `S17_MANAGE` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `S17_MANAGE`(in inputusername varchar(50), inputfirstname varchar(50), inputlastname varchar(50), inputphone char(10), inputemail longtext, inputvisitorcheck enum('yes', 'no'))
BEGIN
IF EXISTS(select username from user where username = inputusername)
then
IF inputvisitorcheck = 'no' then
UPDATE user 
SET 
    firstname = inputfirstname,
    lastname = inputlastname, usertype = 'Employee'
WHERE
    username = inputusername;

update EMPLOYEE
set phone = inputphone
where username = inputusername;
call s17_create_email(inputusername, inputemail);
select 'User updated';


else 
if inputvisitorcheck = 'yes' then
update user
set firstname = inputfirstname, lastname = inputlastname, usertype = 'Employee', usertype = 'Employee, Visitor'
where username = inputusername;

update EMPLOYEE
set phone = inputphone
where username = inputusername;
call s17_create_email(inputusername, inputemail);
select 'User updated';

end if;
end if;
end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `S18_Approve` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `S18_Approve`(in username varchar(50))
BEGIN
	update user set status = "APPROVED" 
    where user.username = username AND (user.status = "PENDING" or user.status = "Declined");
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `S18_Decline` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `S18_Decline`(in username varchar(50))
BEGIN
	update user set status = "Declined" 
    where user.username = username AND user.status = "PENDING" ;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `S18_Filter` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `S18_Filter`(in username varchar(50),in usertype enum('EMPLOYEE', 'EMPLOYEE, VISITOR', 'USER', 'VISITOR'), in status enum("ALL",'PENDING', 'APPROVED', 'Declined'))
BEGIN
	IF (length(username) <= 0 and status != "ALL") then
		select user.username, count(*) as "Email Count", usertype, user.status 
		from user join email 
		where user.username = email.username 
			AND user.usertype = usertype 
			AND user.status = status 
				group by user.username
                order by user.username;
    ELSEif (length(username) <= 0 and status = "ALL") then
			select user.username, count(*) as "Email Count", usertype, user.status 
			from user join email 
			where user.username = email.username 
				AND user.usertype = usertype 
					group by user.username
                    order by user.username;

    ELSE
		select user.username, count(*) as "Email Count", usertype, user.status 
		from user join email 
		where user.username = email.username 
			AND user.username = username 
			AND user.usertype = usertype 
			AND user.status = status 
				group by user.username
                order by user.username;
            
	END IF; 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `s19_deleteSite` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `s19_deleteSite`(in name varchar(50))
BEGIN
	Delete from site where site.name = name;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `s19_filterSites` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `s19_filterSites`(in name varchar(50), in manager varchar(50), in openEveryday enum('Yes', 'No'))
BEGIN
	if (name = "ALL" and manager = "ALL") then
		select * from s19_siteview as SV 
        where SV.openEveryday = openEveryday
        order by SV.name;
	ELSEIF (name = "ALL") then
		select * from s19_siteview as SV 
        where SV.openEveryday = openEveryday
        AND SV.manager = manager
        order by SV.name;
	ELSEIF (manager = "ALL") then
		select * from s19_siteview as SV 
        where SV.openEveryday = openEveryday
        AND SV.name = name
        order by SV.name;
	ELSE 
		select * from s19_siteview as SV 
        where SV.openEveryday = openEveryday
        AND SV.name = name
        AND SV.manager = manager
        order by SV.name;
    end if;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `s1_login` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `s1_login`(in inputemail varchar(50), in inputpassword varchar(255))
BEGIN
set inputpassword = md5(inputpassword);
IF EXISTS(  
   SELECT *  
   FROM user as u, email as e  
   WHERE e.email = inputemail AND u.password = inputpassword) then 
   SELECT 'LOGGED IN';
ELSE
   SELECT 'INCORRECT EMAIL/PASSWORD';
end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `s20_editSite` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `s20_editSite`(in name varchar(50), in newName varchar(50), in zipcode int(5),
in address varchar(50), in manager varchar(50), in openEveryday enum('Yes', 'No'))
BEGIN
	if (exists(select * from s19_siteview as sv where sv.name = name)) then
		if(length(newName) > 0) then 
			update site set site.name = newName where site.name = name; 
        end if;
        if(zipcode is not NULL and length(zipcode) = 5) then 
			update site set site.zipcode = zipcode where site.name = name; 
        end if;
        if(length(address) > 0) then 
			update site set site.address = address where site.name = name; 
        end if;
        if(length(manager) > 0) then 
			update site set site.manager = manager where site.name = name; 
        end if;
        if(openEveryday is not NULL) then 
			update site set site.openEveryday = openEveryday where site.name = name; 
        end if;
	end if;
	
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `s21_createSite` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `s21_createSite`(in name varchar(50), in zipcode int(5),
in address varchar(50), in manager varchar(50), in openEveryday enum('Yes', 'No'))
BEGIN
	IF (length(zipcode) = 5 and not exists(select manager from s19_siteview as sv where sv.manager = manager )) then 
		IF(length(address) <= 0) then
        insert into site values(name, null, zipcode, openEveryday, manager);
        else 
		insert into site values(name, address, zipcode, openEveryday, manager);
		end if;
    end if;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `s22_deleteTransit` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `s22_deleteTransit`(in routeType enum('MARTA', 'Bus', 'Bike'), in route varchar(15))
BEGIN
 if (exists(select * from transit where transit._type = Routetype and 
    transit.route = route)) then

Delete from transit where transit._type = routeType and transit.route = route;
end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `s22_filterTransit` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `s22_filterTransit`(
in routeType enum('ALL','MARTA', 'Bus', 'Bike'), 
in transitRoute varchar(15),  
in siteName varchar(50), 
in startPrice int(10), 
in endPrice int(10))
BEGIN
	If (routeType = "ALL" and transitRoute is not NULL and startPrice is not NULL and endPrice is not null) then
		select * from s22_transitview as tv where
		(tv.Route, tv.TransportType) in 
			(select connect.transitRoute, connect.routetype from connect
            where connect.siteName = siteName)
		and tv.Route = transitRoute
        and tv.price >= startPrice
        and tv.price <= endPrice;
	elseif(transitRoute is not NULL and startPrice is not NULL and endPrice is not null) then
    select * from s22_transitview as tv where
		(tv.Route, tv.TransportType) in 
			(select connect.transitRoute, connect.routetype from connect
            where connect.siteName = siteName)
		and tv.Route = transitRoute
        and tv.TransportType = routetype
        and tv.price >= startPrice
        and tv.price <= endPrice;
	elseif(routeType = "ALL" and startPrice is not NULL and endPrice is not null) then
		select * from s22_transitview as tv where
		(tv.Route, tv.TransportType) in 
			(select connect.transitRoute, connect.routetype from connect
            where connect.siteName = siteName)
        and tv.price >= startPrice
        and tv.price <= endPrice;
	elseif(startPrice is not NULL and endPrice is not null) then
		select * from s22_transitview as tv where
		(tv.Route, tv.TransportType) in 
			(select connect.transitRoute, connect.routetype from connect
            where connect.siteName = siteName)
        and tv.price >= startPrice
        and tv.TransportType = routetype
        and tv.price <= endPrice;
        
	elseIf (routeType = "ALL" and transitRoute is not NULL and endPrice is not null) then
		select * from s22_transitview as tv where
		(tv.Route, tv.TransportType) in 
			(select connect.transitRoute, connect.routetype from connect
            where connect.siteName = siteName)
		and tv.Route = transitRoute
        and tv.price <= endPrice;
	elseif(transitRoute is not NULL and endPrice is not null) then
    select * from s22_transitview as tv where
		(tv.Route, tv.TransportType) in 
			(select connect.transitRoute, connect.routetype from connect
            where connect.siteName = siteName)
		and tv.Route = transitRoute
        and tv.TransportType = routetype
        and tv.price <= endPrice;
        
        elseIf (routeType = "ALL" and transitRoute is not NULL and startPrice is not null) then
		select * from s22_transitview as tv where
		(tv.Route, tv.TransportType) in 
			(select connect.transitRoute, connect.routetype from connect
            where connect.siteName = siteName)
		and tv.Route = transitRoute
        and tv.price >= startPrice;
	elseif(transitRoute is not NULL and startPrice is not null) then
    select * from s22_transitview as tv where
		(tv.Route, tv.TransportType) in 
			(select connect.transitRoute, connect.routetype from connect
            where connect.siteName = siteName)
		and tv.Route = transitRoute
        and tv.TransportType = routetype
        and tv.price >= startPrice;
        
        elseIf (routeType = "ALL" and transitRoute is not NULL) then
		select * from s22_transitview as tv where
		(tv.Route, tv.TransportType) in 
			(select connect.transitRoute, connect.routetype from connect
            where connect.siteName = siteName)
		and tv.Route = transitRoute;
	elseif(transitRoute is not NULL) then
    select * from s22_transitview as tv where
		(tv.Route, tv.TransportType) in 
			(select connect.transitRoute, connect.routetype from connect
            where connect.siteName = siteName)
		and tv.Route = transitRoute
        and tv.TransportType = routetype;
        
        
        elseIf (routeType = "ALL" and endPrice is not null) then
		select * from s22_transitview as tv where
		(tv.Route, tv.TransportType) in 
			(select connect.transitRoute, connect.routetype from connect
            where connect.siteName = siteName)
        and tv.price <= endPrice;
	elseif(endPrice is not null) then
    select * from s22_transitview as tv where
		(tv.Route, tv.TransportType) in 
			(select connect.transitRoute, connect.routetype from connect
            where connect.siteName = siteName)
        and tv.TransportType = routetype
        and tv.price <= endPrice;
        
	elseIf (routeType = "ALL" and startPrice is not null) then
		select * from s22_transitview as tv where
		(tv.Route, tv.TransportType) in 
			(select connect.transitRoute, connect.routetype from connect
            where connect.siteName = siteName)
        and tv.price >= startPrice;
	elseif(startPrice is not null) then
    select * from s22_transitview as tv where
		(tv.Route, tv.TransportType) in 
			(select connect.transitRoute, connect.routetype from connect
            where connect.siteName = siteName)
		and tv.TransportType = routetype
        and tv.price >= startPrice;
        
        
        elseIf (routeType = "ALL") then
		select * from s22_transitview as tv where
		(tv.Route, tv.TransportType) in 
			(select connect.transitRoute, connect.routetype from connect
            where connect.siteName = siteName);
	else
    select * from s22_transitview as tv where
		(tv.Route, tv.TransportType) in 
			(select connect.transitRoute, connect.routetype from connect
            where connect.siteName = siteName)
		and tv.TransportType = routetype;
        
        

    end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `s23_EditTransit` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `s23_EditTransit`(in Value longtext, in Routetype enum('Marta', 'Bus', 'Bike'),
in OldtransitRoute varchar(15), in NewtransitRoute varchar(15), in price int unsigned)
BEGIN
	Declare front TEXT DEFAULT NULL;
    DECLARE frontlen INT DEFAULT NULL;
    DECLARE TempValue TEXT DEFAULT NULL;
    DECLARE actualRoute varchar(15) DEFAULT NULL;
	if (exists(select * from transit where transit._type = Routetype and 
    transit.route = OldtransitRoute)) then

    delete from connect where connect.routeType = Routetype and connect.transitRoute = oldtransitRoute;
    
	SET actualRoute = oldtransitRoute;
	if (exists(select * from transit where transit._type = Routetype 
	and transit.route = OldtransitRoute)) then
    
    if(length(newtransitRoute) > 0) then
	update transit set transit.route = NewtransitRoute where transit._type = Routetype 
	and transit.route = OldtransitRoute;
    set actualRoute = NewtransitRoute;
    end if;
    if (price is not NULL) then
    update transit set transit.price = price where transit._type = Routetype 
	and transit.route = NewtransitRoute;
    end if;
    

    
    iterator:
    LOOP  
    IF LENGTH(TRIM(Value)) = 0 OR Value IS NULL THEN
    LEAVE iterator;
    END IF;
    SET front = SUBSTRING_INDEX(Value,',',1);
    SET frontlen = LENGTH(front);
    SET TempValue = TRIM(front);
    if (not exists(select * from connect where connect.routeType = Routetype 
    and connect.transitRoute = NewtransitRoute 
    and connect.siteName = TempValue)) then
    
    INSERT INTO connect VALUES (TempValue, Routetype, actualRoute);
    end if;

    SET Value = INSERT(Value,1,frontlen + 1,'');
    END LOOP;
    end if;
    end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `s24_CreateTransit` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `s24_CreateTransit`(in Value longtext, in Routetype enum('Marta', 'Bus', 'Bike'),
in transitRoute varchar(15), in price int unsigned, in numberOfsites int unsigned)
BEGIN
	
    Declare front TEXT DEFAULT NULL;
    DECLARE frontlen INT DEFAULT NULL;
    DECLARE TempValue TEXT DEFAULT NULL;
    if (not exists(select * from transit where transit._type = Routetype and 
    transit.route = transitRoute) and numberOfsites > 1) then
    if (price is Null) then 
    insert into transit values (Routetype, transitRoute, 0);
    else 
    insert into transit values (Routetype, transitRoute, price);
    end if;
    iterator:
    LOOP  
    IF LENGTH(TRIM(Value)) = 0 OR Value IS NULL THEN
    LEAVE iterator;
    END IF;
    SET front = SUBSTRING_INDEX(Value,',',1);
    SET frontlen = LENGTH(front);
    SET TempValue = TRIM(front);
    
    INSERT INTO connect VALUES (TempValue, Routetype, transitRoute);

    SET Value = INSERT(Value,1,frontlen + 1,'');
    END LOOP;
    end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `s25_deleteEvent` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `s25_deleteEvent`(in evname varchar(100), in sDate DATE , 
in manager varchar(50))
BEGIN
 DECLARE SiteValue TEXT;
SET SiteValue = (select site.name from site where site.manager = manager);
delete from event where event.name = evname and event.startDate = sDate and event.sitename = SiteValue;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `s25_filterEvents` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `s25_filterEvents`(in eventName varchar(100), in description TEXT, in sDate Date, 
in eDate Date, in sdur int(3), in edur int(3), in sVisits int(3), in eVisits int(3), 
in sRevenue int(15), in eRevenue int(15), in manager varchar(50))
BEGIN
	Declare SQLText varchar(1000);
    Declare needEnd int;
	Set @SQLText = concat("select ef.name, ef.StaffCount, ef.Duration, ef.TotalVisits, ef.totalRevenue from s25_eventfilter as ef join site on site.name = ef.sitename where ef.sitename in (select site.name from site where site.manager = '",manager,"')");
    
    Set needEnd = 1;
    
    if (length(eventName) > 0) then
     if (needEnd = 1) then
	Set @SQLText = concat(@SQLText, " and");
    end if;
    Set @SQLText = concat(@SQLText, " ef.name = \'",eventName, "\'");
    Set needEnd = 1;
    end if;
    
    if (sDate  is not NULL) then
    if (needEnd = 1) then
	Set @SQLText = concat(@SQLText, " and");
    end if;
	Set @SQLText = concat(@SQLText, " ef.startDate >= \'",sDate,"\'");
    Set needEnd = 1;
    end if;
    
    if (eDate  is not NULL) then
     if (needEnd = 1) then
	Set @SQLText = concat(@SQLText, " and");
    end if;
    Set @SQLText = concat(@SQLText, " ef.endDate <= \'",eDate,"\'");
    Set needEnd = 1;
    end if;
    
    if (sdur is not NULL) then
     if (needEnd = 1) then
	Set @SQLText = concat(@SQLText, " and");
    end if;
    Set @SQLText = concat(@SQLText, " ef.Duration >= ",sdur);
    Set needEnd = 1;
    end if;
    
    if (edur is not NULL) then
     if (needEnd = 1) then
	Set @SQLText = concat(@SQLText, " and");
    end if;
    Set @SQLText = concat(@SQLText, " ef.Duration <= ",edur);
    Set needEnd = 1;
    end if;
    
    
    if (sVisits is not NULL) then
     if (needEnd = 1) then
	Set @SQLText = concat(@SQLText, " and");
    end if;
    Set @SQLText = concat(@SQLText, " ef.TotalVisits >= ",sVisits);
    Set needEnd = 1;
    end if;
    
    
    if (eVisits is not NULL) then
	if (needEnd = 1) then
	Set @SQLText = concat(@SQLText, " and");
    end if;
    Set @SQLText = concat(@SQLText, " ef.TotalVisits <= ",eVisits);
    Set needEnd = 1;
    end if;
    
    
    if (sRevenue is not NULL) then
	if (needEnd = 1) then
	Set @SQLText = concat(@SQLText, " and");
    end if;
	Set @SQLText = concat(@SQLText, " ef.totalRevenue >= ",sRevenue);
	Set needEnd = 1;
    end if;
    
    if (eRevenue is not NULL) then
     if (needEnd = 1) then
	Set @SQLText = concat(@SQLText, " and");
    end if;
	Set @SQLText = concat(@SQLText, " ef.totalRevenue <= ",eRevenue);
	Set needEnd = 1;
    end if;
    
    
    if (length(description) > 0) then
     if (needEnd = 1) then
	Set @SQLText = concat(@SQLText, " and");
    end if;
    Set @SQLText = concat(@SQLText, " (ef.name, ef.startDate) in (select event.name, event.startDate from
     event where event.description like \'%", description, "%\')");
    Set needEnd = 1;
    end if;
    Set @SQLText = concat(@SQLText, ";");
    
    Set @SQLText = concat(@SQLText, ";");
    prepare stmt from @SQLText;
    execute stmt;
    deallocate prepare stmt;
    

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `s26_editEvent` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `s26_editEvent`(in sname varchar(100), in sDate DATE, in manager varchar(50),
in Value longtext, in staffSelected int(3), in minstaffrequired int(3), in descrip TEXT)
BEGIN
Declare front TEXT DEFAULT NULL;
DECLARE frontlen INT DEFAULT NULL;
DECLARE TempValue TEXT DEFAULT NULL;
DECLARE SiteValue TEXT;
DECLARE eDate TEXT;
SET SiteValue = (select site.name from site where site.manager = manager);
set eDate = (select event.endDate from event where event.name = sname and event.startDate = sDate 
    and event.sitename = SiteValue);
    if (exists(select * from event where event.name = sname and event.startDate = sDate 
    and event.sitename = SiteValue) and staffSelected >= minstaffrequired) then 
    
    delete from assign_to where assign_to.eventName = sname and assign_to.startDate = sDate;
    
    if (length(descrip) > 0) then
    update event set event.description = descrip where event.name = sname
    and event.startdate = sDate and event.sitename = siteValue;
    end if;
    
	iterator:
    LOOP  
    IF LENGTH(TRIM(Value)) = 0 OR Value IS NULL THEN
    LEAVE iterator;
    END IF;
    SET front = SUBSTRING_INDEX(Value,',',1);
    SET frontlen = LENGTH(front);
    SET TempValue = TRIM(front);
    
    if (exists(select * from employee where employee.username not in 
    (select ast.staffUserName from assign_to as ast where (ast.eventname, ast.startDate) in
    (select event.name, event.startDate from event where (event.startDate <= eDate and event.startDate >= sDate) or (event.endDate >= sDate and event.endDate <= eDate )
	)) and employee.employeeType = 'staff' and employee.username = TempValue)) then
	insert into assign_to values (TempValue, sname, sdate, SiteValue);
	end if;
    

    SET Value = INSERT(Value,1,frontlen + 1,'');
    END LOOP;
    end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `s26_viewEvent` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `s26_viewEvent`(in evName varchar(100),in sDate Date, in manager varchar(50),
in sRevenue int(15), in eRevenue int(15),in sVisits int(15), in eVisits int(15) )
BEGIN
Declare SQLText varchar(500);
DECLARE SiteValue TEXT;
SET SiteValue = (select site.name from site where site.manager = manager);

Set @SQLText = concat("select date, TotalVisits, totalRevenue from s25_eventvisitorsdaily as evd where evd.siteName = '",SiteValue,"' and evd.startDate = '",sDate,"' and evd.name = '",evname,"'");

if (sRevenue is not NULL) then
Set @SQLText = concat(@SQLText, " and evd.totalRevenue >= ",sRevenue);
end if;

if (eRevenue is not NULL) then
Set @SQLText = concat(@SQLText, " and evd.totalRevenue <= ",eRevenue);
end if;

if (sVisits is not NULL) then
Set @SQLText = concat(@SQLText, " and evd.TotalVisits >= ",sVisits);
end if;

if (eVisits is not NULL) then
Set @SQLText = concat(@SQLText, " and evd.TotalVisits <= ",eVisits);
end if;

 Set @SQLText = concat(@SQLText, " order by evd.date;");
prepare stmt from @SQLText;
execute stmt;
deallocate prepare stmt;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `s27_createEvent` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `s27_createEvent`(in evname varchar(100), in sDate DATE, in eDate Date, in price int unsigned,
in capacity int(3), in minStaffReq int(3), in descrip TEXT, in manager varchar(50), in Value longtext, in staffSelected int(3))
BEGIN
	Declare front TEXT DEFAULT NULL;
    DECLARE frontlen INT DEFAULT NULL;
    DECLARE TempValue TEXT DEFAULT NULL;
     DECLARE SiteValue TEXT;
    
	SET SiteValue = (select site.name from site where site.manager = manager);
if (price >= 0 and sDate <= eDate and not exists(select * from event where event.name = evname and event.startDate = sDate 
and event.sitename = SiteValue) and minStaffReq > 0 and staffSelected >= minStaffReq) then 

if(not exists(select event.name, event.startDate from event where ((event.startDate <= eDate and event.startDate >= sDate) 
or (event.endDate >= sDate and event.endDate <= eDate )) and event.sitename = siteValue)) then
insert into event values(evname, sDate, SiteValue, eDate, price, capacity, minStaffReq, descrip);
 iterator:
    LOOP  
    IF LENGTH(TRIM(Value)) = 0 OR Value IS NULL THEN
    LEAVE iterator;
    END IF;
    SET front = SUBSTRING_INDEX(Value,',',1);
    SET frontlen = LENGTH(front);
    SET TempValue = TRIM(front);
    
    if (exists(select * from employee where employee.username not in 
    (select ast.staffUserName from assign_to as ast where (ast.eventname, ast.startDate) in
    (select event.name, event.startDate from event where (event.startDate <= eDate and event.startDate >= sDate) or (event.endDate >= sDate and event.endDate <= eDate )
	)) and employee.employeeType = 'staff' and employee.username = TempValue)) then
	insert into assign_to values (TempValue, evname, sdate, SiteValue);
	end if;
    

    SET Value = INSERT(Value,1,frontlen + 1,'');
    END LOOP;
	end if;
    end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `s29_filterSites` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `s29_filterSites`(in sDate Date, in eDate Date, in sEvent int(3), in eEvent int(3), in sStaff int(3), in eStaff int(3),
in sVisits int(3), in eVisits int(3), in sRevenue int(15), in eRevenue int(15), in manager varchar(50))
BEGIN
	Declare SQLText varchar(1000);
	Declare needEnd int;
	Set @SQLText = concat("select sf.Date, sf.EventCount, sf.StaffCount, sf.TotalVisits, sf.TotalRevenue from s29_sitefilter as sf join site on site.name = sf.sitename where sf.sitename in (select site.name from site where site.manager = '",manager,"')");

	Set needEnd = 1;
    
	if (sDate  is not NULL) then
	if (needEnd = 1) then
	Set @SQLText = concat(@SQLText, " and");
	end if;
	Set @SQLText = concat(@SQLText, " sf.startDate >= \'",sDate,"\'");
	Set needEnd = 1;
	end if;
    
	if (eDate  is not NULL) then
    if (needEnd = 1) then
	Set @SQLText = concat(@SQLText, " and");
	end if;
	Set @SQLText = concat(@SQLText, " sf.endDate <= \'",eDate,"\'");
	Set needEnd = 1;
	end if;
    
	if (sEvent is not NULL) then
 	if (needEnd = 1) then
	Set @SQLText = concat(@SQLText, " and");
	end if;
	Set @SQLText = concat(@SQLText, " sf.EventCount >= ",sEvent);
	Set needEnd = 1;
	end if;
    
	if (eEvent is not NULL) then
 	if (needEnd = 1) then
	Set @SQLText = concat(@SQLText, " and");
	end if;
	Set @SQLText = concat(@SQLText, " sf.EventCount <= ",eEvent);
	Set needEnd = 1;
	end if;
    
	if (sStaff is not NULL) then
 	if (needEnd = 1) then
	Set @SQLText = concat(@SQLText, " and");
	end if;
	Set @SQLText = concat(@SQLText, " sf.StaffCount >= ",sStaff);
	Set needEnd = 1;
	end if;
    
	if (eStaff is not NULL) then
 	if (needEnd = 1) then
	Set @SQLText = concat(@SQLText, " and");
	end if;
	Set @SQLText = concat(@SQLText, " sf.StaffCount <= ",eStaff);
	Set needEnd = 1;
	end if;
    
	if (sVisits is not NULL) then
 	if (needEnd = 1) then
	Set @SQLText = concat(@SQLText, " and");
	end if;
	Set @SQLText = concat(@SQLText, " sf.TotalVisits >= ",sVisits);
	Set needEnd = 1;
	end if;
    
    
	if (eVisits is not NULL) then
	if (needEnd = 1) then
	Set @SQLText = concat(@SQLText, " and");
	end if;
	Set @SQLText = concat(@SQLText, " sf.TotalVisits <= ",eVisits);
	Set needEnd = 1;
	end if;
    
    
	if (sRevenue is not NULL) then
	if (needEnd = 1) then
	Set @SQLText = concat(@SQLText, " and");
	end if;
	Set @SQLText = concat(@SQLText, " sf.totalRevenue >= ",sRevenue);
	Set needEnd = 1;
	end if;
    
	if (eRevenue is not NULL) then
 	if (needEnd = 1) then
	Set @SQLText = concat(@SQLText, " and");
	end if;
	Set @SQLText = concat(@SQLText, " sf.totalRevenue <= ",eRevenue);
	Set needEnd = 1;
	end if;
    
    
	Set @SQLText = concat(@SQLText, ";");
	prepare stmt from @SQLText;
	execute stmt;
	deallocate prepare stmt;
    

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `s30_dailyDetail` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `s30_dailyDetail`(in sDate Date,
in eDate Date,
 in manager varchar(50))
BEGIN
SELECT
    	eventName,
    	staffsAssigned,
    	TotalVisits,
    	totalRevenue
	FROM
    	s30_dailydetail
    	where s30_dailydetail.siteName in
    	(select site.name from site where site.manager = manager)
    	and date >= sDate
    	and date <=eDate;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `s31_viewSchedule` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `s31_viewSchedule`(in eventName varchar(100),
in description Text,
in sDate Date,
in eDate Date,
in staff varchar(50))
BEGIN
	Declare SQLText varchar(1000);
	Declare needEnd int;
	Set @SQLText = concat("select es.name, es.sitename, es.startDate, es.endDate, es.StaffCount
	from s31_eventstaff as es where es.name in
	(select assign_to.eventName
    from assign_to
    where assign_to.staffUserName like concat('%', staff, '%'))");
    
	Set needEnd = 1;
    
	if (length(eventName) > 0) then
 	if (needEnd = 1) then
	Set @SQLText = concat(@SQLText, " and");
	end if;
	Set @SQLText = concat(@SQLText, " es.name = \'",eventName, "\'");
	Set needEnd = 1;
	end if;
    
	if (sDate  is not NULL) then
	if (needEnd = 1) then
	Set @SQLText = concat(@SQLText, " and");
	end if;
	Set @SQLText = concat(@SQLText, " es.startDate >= \'",sDate,"\'");
	Set needEnd = 1;
	end if;
    
	if (eDate  is not NULL) then
 	if (needEnd = 1) then
	Set @SQLText = concat(@SQLText, " and");
	end if;
	Set @SQLText = concat(@SQLText, " es.endDate <= \'",eDate,"\'");
	Set needEnd = 1;
	end if;
    
	if (length(description) > 0) then
 	if (needEnd = 1) then
	Set @SQLText = concat(@SQLText, " and");
	end if;
	Set @SQLText = concat(@SQLText, " (es.name, es.startDate) in (select event.name, event.startDate from
 	event where event.description like concat('%', description, '%')");
	Set needEnd = 1;
	end if;
	Set @SQLText = concat(@SQLText, ";");
    
	Set @SQLText = concat(@SQLText, ";");
	prepare stmt from @SQLText;
	execute stmt;
	deallocate prepare stmt;
    

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `s32_staffEventDetail` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `s32_staffEventDetail`(in eventName varchar(100), in description TEXT, in sDate Date, in eDate Date, in staff varchar(50))
BEGIN
	Declare SQLText varchar(1000);
	Declare needEnd int;
	Set @SQLText = concat("select ed.name, ed.sitename, ed.startDate, ed.endDate, ed.Duration, ed.StaffsAssigned, ed.capacity, ed.price, ed.description from s32_eventdetail as ed where ed.name in (select assign_to.eventName from assign_to where assign_to.staffUserName = '",staff,"') and ed.startDate in (select assign_to.startDate from assign_to where assign_to.staffUserName = '",staff,"')");
    
	Set needEnd = 1;
    
	if (length(eventName) > 0) then
 	if (needEnd = 1) then
	Set @SQLText = concat(@SQLText, " and");
	end if;
	Set @SQLText = concat(@SQLText, " ed.name = \'",eventName, "\'");
	Set needEnd = 1;
	end if;
    
	if (sDate  is not NULL) then
	if (needEnd = 1) then
	Set @SQLText = concat(@SQLText, " and");
	end if;
	Set @SQLText = concat(@SQLText, " ed.startDate >= \'",sDate,"\'");
	Set needEnd = 1;
	end if;
    
	if (eDate  is not NULL) then
 	if (needEnd = 1) then
	Set @SQLText = concat(@SQLText, " and");
	end if;
	Set @SQLText = concat(@SQLText, " ed.endDate <= \'",eDate,"\'");
	Set needEnd = 1;
	end if;
    
	if (length(description) > 0) then
 	if (needEnd = 1) then
	Set @SQLText = concat(@SQLText, " and");
	end if;
	Set @SQLText = concat(@SQLText, " (ed.name, ed.startDate) in (select event.name, event.startDate from
 	event where event.description like \'%", description, "%\')");
	Set needEnd = 1;
	end if;
	Set @SQLText = concat(@SQLText, ";");
    
	Set @SQLText = concat(@SQLText, ";");
	prepare stmt from @SQLText;
	execute stmt;
	deallocate prepare stmt;
    

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `s33_exploreEvent` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `s33_exploreEvent`(
in eventName varchar(50),
in description TEXT,
in siteName enum('ALL', 'Atlanta Beltline Center', 'Historic Fourth Ward Park', 'Inman Park', 'Piedmont Park', 'Westview Cemetry'),
in sDate date,
in eDate date,
in sVisit int(3),
in eVisit int(3),
in visitorUsername varchar(50))
BEGIN
    if (siteName = "ALL" and eventName is not NULL) then
   	 SELECT
   	 s33_exploreevent.name as 'EventName',
   	 s33_exploreevent.SiteName as 'SiteName',
   	 price as 'TicketPrice',
   	 ticketRemaining as 'TicketRemaining',
   	 TotalVisits as 'TotalVisits',
   	 ROUND (   
    	(
        	LENGTH(visitors)
        	- LENGTH( REPLACE (visitors, visitorUsername, "") )
    	) / LENGTH(visitorUsername)   	 
   	 ) AS count
   	 from s33_exploreevent
    	where  s33_exploreevent.name LIKE eventName
    	and StartDate >= sDate
    	and EndDate <= eDate
    	and TotalVisits >= sVisit
    	and TotalVisits <= eVisit;
	end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `s3_create_email` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `s3_create_email`(in username varchar(50) ,in value longtext)
BEGIN
Declare front TEXT DEFAULT NULL;
    DECLARE frontlen INT DEFAULT NULL;
    DECLARE TempValue TEXT DEFAULT NULL;
    
     iterator:
    LOOP  
    IF LENGTH(TRIM(Value)) = 0 OR Value IS NULL THEN
    LEAVE iterator;
    END IF;
    SET front = SUBSTRING_INDEX(Value,',',1);
    SET frontlen = LENGTH(front);
    SET TempValue = TRIM(front);
	
    if (not exists(select * from email where email.email = TempValue)) then
	insert into email Values(username, TempValue);
    end if;

    SET Value = INSERT(Value,1,frontlen + 1,'');
    END LOOP;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `s3_registration` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `s3_registration`(in inputusername varchar(50), inputpassword varchar(255), inputfirstname varchar(50), inputlastname varchar(50), inputusertype enum('EMPLOYEE', 'EMPLOYEE, VISITOR', 'USER', 'VISITOR'), inputemail longtext, inputphone char(10), inputaddress varchar(50), inputcity char(30), inputstate enum('AL', 'AK', 'AZ', 'AR', 'CA', 'CO', 'CT', 'DE', 'FL', 'GA', 'HI', 'ID', 'IL', 'IN', 'IA', 'KS', 'KY', 'LA', 'ME', 'MD', 'MA', 'MI', 'MN', 'MS', 'MO', 'MT', 'NE', 'NV', 'NH', 'NJ', 'NM', 'NY', 'NC', 'ND', 'OH', 'OK', 'OR', 'PA', 'RI', 'SC', 'SD', 'TN', 'TX', 'UT', 'VT', 'VA', 'WA', 'WV', 'WI', 'WY'), inputzipcode int(5), inputemployeeType enum('manager', 'staff'))
BEGIN
	IF EXISTS(select username from user where username = inputusername)
		then select'User already exists';
	ELSE
		IF inputusertype = 'USER' OR inputusertype = 'VISITOR' then
			INSERT INTO user (username, password, status, firstname, lastname, usertype)
			values (inputusername, md5(inputpassword), 'PENDING', inputfirstname, inputlastname, inputusertype);
			call s3_create_email(inputusername, inputemail);
            select 'User registered';
            
		ELSE IF inputusertype = 'EMPLOYEE' OR inputusertype = 'EMPLOYEE, VISITOR' then
			INSERT INTO user (username, password, status, firstname, lastname, usertype)
			values (inputusername, md5(inputpassword), 'PENDING', inputfirstname, inputlastname, inputusertype);
			call s3_create_email(inputusername, inputemail);
			INSERT INTO employee (username, phone, address, city, state, zipcode, employeeType)
			values ((select username from user where username = inputusername), inputphone, inputaddress, inputcity, inputstate, inputzipcode, inputemployeeType);
            select 'User registered';
		END IF;
	END IF;
end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `s16_transitview`
--

/*!50001 DROP VIEW IF EXISTS `s16_transitview`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `s16_transitview` AS select distinct `take`.`userName` AS `User`,`take`.`date` AS `Date`,`transit`.`route` AS `Route`,`transit`.`type` AS `Type`,`transit`.`price` AS `Price`,`connect`.`siteName` AS `Sitename` from ((`take` join `connect`) join `transit`) where ((`take`.`transitRoute` = `transit`.`route`) and (`take`.`transitRoute` = `connect`.`transitRoute`) and (`take`.`routeType` = `connect`.`routeType`) and (`take`.`routeType` = `transit`.`type`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `s19_siteview`
--

/*!50001 DROP VIEW IF EXISTS `s19_siteview`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `s19_siteview` AS select `site`.`name` AS `name`,`site`.`manager` AS `manager`,`site`.`openEveryday` AS `openEveryday` from `site` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `s22_transitview`
--

/*!50001 DROP VIEW IF EXISTS `s22_transitview`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `s22_transitview` AS select `transit`.`route` AS `Route`,`transit`.`type` AS `TransportType`,`transit`.`price` AS `price`,count(distinct `connect`.`siteName`) AS `# Connected Sites`,count(distinct `take`.`userName`,`take`.`date`) AS `# Transit Logged` from ((`transit` join `connect`) join `take`) where ((`transit`.`route` = `connect`.`transitRoute`) and (`transit`.`type` = `connect`.`routeType`) and (`transit`.`type` = `take`.`routeType`) and (`transit`.`route` = `take`.`transitRoute`)) group by `transit`.`route`,`transit`.`type` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `s25_eventfilter`
--

/*!50001 DROP VIEW IF EXISTS `s25_eventfilter`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `s25_eventfilter` AS select `es`.`name` AS `name`,`es`.`StaffCount` AS `StaffCount`,`es`.`Duration` AS `Duration`,`ev`.`TotalVisits` AS `TotalVisits`,`ev`.`totalRevenue` AS `totalRevenue`,`es`.`startDate` AS `startDate`,`es`.`endDate` AS `endDate`,`es`.`sitename` AS `sitename` from (`s25_eventstaff` `es` join `s25_eventvisitors` `ev`) where ((`es`.`name` = `ev`.`name`) and (`es`.`startDate` = `ev`.`startDate`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `s25_eventstaff`
--

/*!50001 DROP VIEW IF EXISTS `s25_eventstaff`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `s25_eventstaff` AS select `event`.`name` AS `name`,`event`.`startDate` AS `startDate`,count(`assign_to`.`staffUserName`) AS `StaffCount`,((`event`.`endDate` - `event`.`startDate`) + 1) AS `Duration`,`event`.`endDate` AS `endDate`,`event`.`sitename` AS `sitename` from (`event` join `assign_to`) where ((`event`.`name` = `assign_to`.`eventName`) and (`event`.`startDate` = `assign_to`.`startDate`) and (`event`.`sitename` = `assign_to`.`siteName`)) group by `event`.`name`,`event`.`startDate` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `s25_eventvisitors`
--

/*!50001 DROP VIEW IF EXISTS `s25_eventvisitors`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `s25_eventvisitors` AS select `event`.`name` AS `name`,`event`.`startDate` AS `startDate`,count(`visit_event`.`visitorUsername`) AS `TotalVisits`,(count(`visit_event`.`visitorUsername`) * `event`.`price`) AS `totalRevenue` from (`event` join `visit_event`) where ((`event`.`name` = `visit_event`.`eventName`) and (`event`.`startDate` = `visit_event`.`eventStartDate`) and (`event`.`sitename` = `visit_event`.`siteName`)) group by `event`.`name`,`event`.`startDate` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `s25_eventvisitorsdaily`
--

/*!50001 DROP VIEW IF EXISTS `s25_eventvisitorsdaily`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `s25_eventvisitorsdaily` AS select `event`.`name` AS `name`,`event`.`startDate` AS `startDate`,`event`.`sitename` AS `siteName`,`visit_event`.`date` AS `date`,count(`visit_event`.`visitorUsername`) AS `TotalVisits`,(count(`visit_event`.`visitorUsername`) * `event`.`price`) AS `totalRevenue` from (`event` join `visit_event`) where ((`event`.`name` = `visit_event`.`eventName`) and (`event`.`startDate` = `visit_event`.`eventStartDate`) and (`event`.`sitename` = `visit_event`.`siteName`)) group by `event`.`name`,`event`.`startDate`,`visit_event`.`date` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `s29_eventvisitors`
--

/*!50001 DROP VIEW IF EXISTS `s29_eventvisitors`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `s29_eventvisitors` AS select `event`.`name` AS `name`,`event`.`startDate` AS `startDate`,`event`.`endDate` AS `endDate`,`event`.`sitename` AS `siteName`,`visit_event`.`date` AS `date`,count(distinct `visit_event`.`eventName`) AS `EventCount`,count(`visit_event`.`visitorUsername`) AS `TotalVisits`,(count(`visit_event`.`visitorUsername`) * `event`.`price`) AS `totalRevenue` from (`event` join `visit_event`) where ((`event`.`name` = `visit_event`.`eventName`) and (`event`.`startDate` = `visit_event`.`eventStartDate`) and (`event`.`sitename` = `visit_event`.`siteName`)) group by `event`.`name`,`event`.`startDate`,`visit_event`.`date` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `s29_eventvisitorsdaily`
--

/*!50001 DROP VIEW IF EXISTS `s29_eventvisitorsdaily`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `s29_eventvisitorsdaily` AS select `ev`.`date` AS `date`,sum(`ev`.`EventCount`) AS `EventCount`,sum(`es`.`StaffCount`) AS `StaffCount`,sum(`ev`.`TotalVisits`) AS `TotalVisits`,sum(`ev`.`totalRevenue`) AS `totalRevenue`,`es`.`startDate` AS `startDate`,`es`.`endDate` AS `endDate`,`es`.`sitename` AS `sitename` from (`s31_eventstaff` `es` join `s29_eventvisitors` `ev`) where ((`es`.`name` = `ev`.`name`) and (`es`.`startDate` = `ev`.`startDate`)) group by `ev`.`date`,`es`.`sitename` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `s31_eventstaff`
--

/*!50001 DROP VIEW IF EXISTS `s31_eventstaff`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `s31_eventstaff` AS select `event`.`name` AS `name`,`event`.`startDate` AS `startDate`,count(`assign_to`.`staffUserName`) AS `StaffCount`,(`event`.`endDate` - `event`.`startDate`) AS `Duration`,`event`.`endDate` AS `endDate`,`event`.`sitename` AS `sitename`,`event`.`description` AS `description` from (`event` join `assign_to`) where ((`event`.`name` = `assign_to`.`eventName`) and (`event`.`startDate` = `assign_to`.`startDate`) and (`event`.`sitename` = `assign_to`.`siteName`)) group by `event`.`name`,`event`.`startDate` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `s32_eventdetail`
--

/*!50001 DROP VIEW IF EXISTS `s32_eventdetail`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `s32_eventdetail` AS select distinct `event`.`name` AS `name`,`event`.`sitename` AS `sitename`,`event`.`startDate` AS `startDate`,`event`.`endDate` AS `endDate`,(`event`.`endDate` - `event`.`startDate`) AS `Duration`,`s32_stafflist`.`StaffsAssigned` AS `StaffsAssigned`,`event`.`capacity` AS `capacity`,`event`.`price` AS `price`,`event`.`description` AS `description` from ((`assign_to` join `event` on(((`event`.`name` = `assign_to`.`eventName`) and (`event`.`startDate` = `assign_to`.`startDate`)))) join `s32_stafflist` on(((`event`.`name` = `s32_stafflist`.`eventName`) and (`event`.`startDate` = `s32_stafflist`.`startDate`)))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `s32_stafflist`
--

/*!50001 DROP VIEW IF EXISTS `s32_stafflist`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `s32_stafflist` AS select `assign_to`.`eventName` AS `eventName`,`assign_to`.`siteName` AS `siteName`,`assign_to`.`startDate` AS `startDate`,group_concat(concat(`user`.`firstname`,' ',`user`.`lastname`) separator ', ') AS `StaffsAssigned` from (`assign_to` join `user` on((`assign_to`.`staffUserName` = `user`.`username`))) group by `assign_to`.`startDate`,`assign_to`.`eventName` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `s33_exploreevent`
--

/*!50001 DROP VIEW IF EXISTS `s33_exploreevent`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `s33_exploreevent` AS select distinct `s33_sub_a`.`name` AS `name`,`s33_sub_a`.`siteName` AS `siteName`,`s33_sub_b`.`price` AS `price`,(`s33_sub_b`.`capacity` - `s33_sub_a`.`totalVisits`) AS `ticketRemaining`,`s33_sub_a`.`totalVisits` AS `totalVisits`,`s33_sub_b`.`Visitors` AS `visitors`,`s33_sub_b`.`startDate` AS `startDate`,`s33_sub_b`.`endDate` AS `endDate` from (`s33_sub_a` join `s33_sub_b` on((`s33_sub_a`.`date` = `s33_sub_b`.`Date`))) group by `s33_sub_a`.`name`,`s33_sub_a`.`siteName`,`s33_sub_a`.`date`,`s33_sub_a`.`startDate` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `s33_sub_a`
--

/*!50001 DROP VIEW IF EXISTS `s33_sub_a`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `s33_sub_a` AS select `s29_eventvisitors`.`name` AS `name`,`s29_eventvisitors`.`siteName` AS `siteName`,sum(`s29_eventvisitors`.`TotalVisits`) AS `totalVisits`,`s29_eventvisitors`.`date` AS `date`,`s29_eventvisitors`.`startDate` AS `startDate` from `s29_eventvisitors` group by `s29_eventvisitors`.`name`,`s29_eventvisitors`.`siteName`,`s29_eventvisitors`.`date` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `s33_sub_b`
--

/*!50001 DROP VIEW IF EXISTS `s33_sub_b`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `s33_sub_b` AS select `event`.`name` AS `name`,`event`.`sitename` AS `sitename`,`event`.`price` AS `price`,`event`.`capacity` AS `capacity`,group_concat(concat(`visit_event`.`visitorUsername`) separator ', ') AS `Visitors`,`visit_event`.`date` AS `Date`,`visit_event`.`eventStartDate` AS `startDate`,`event`.`endDate` AS `endDate` from (`event` join `visit_event` on(((`event`.`name` = `visit_event`.`eventName`) and (`event`.`startDate` = `visit_event`.`eventStartDate`) and (`event`.`sitename` = `visit_event`.`siteName`)))) group by `event`.`name`,`event`.`sitename`,`visit_event`.`date` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `s34_visitoreventdetail`
--

/*!50001 DROP VIEW IF EXISTS `s34_visitoreventdetail`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `s34_visitoreventdetail` AS select `s32_eventdetail`.`name` AS `name`,`s32_eventdetail`.`sitename` AS `siteName`,`s32_eventdetail`.`startDate` AS `startDate`,`s32_eventdetail`.`endDate` AS `endDate`,`s32_eventdetail`.`price` AS `price`,`s33_exploreevent`.`ticketRemaining` AS `ticketRemaining`,`s32_eventdetail`.`description` AS `description` from (`s32_eventdetail` join `s33_exploreevent` on((`s32_eventdetail`.`name` = `s33_exploreevent`.`name`))) group by `s33_exploreevent`.`visitors`,`s33_exploreevent`.`name`,`s33_exploreevent`.`startDate` */;
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

-- Dump completed on 2019-04-22  0:26:40
