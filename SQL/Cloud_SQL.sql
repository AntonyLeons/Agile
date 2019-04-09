-- MySQL dump 10.13  Distrib 5.7.14, for Linux (x86_64)
--
-- Host: localhost    Database: mysql
-- ------------------------------------------------------
-- Server version	5.7.14-google

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
-- Current Database: `Bookings`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `Bookings` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `Bookings`;

--
-- Table structure for table `logintable`
--

DROP TABLE IF EXISTS `logintable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `logintable` (
  `ID` int(11) NOT NULL,
  `Password` varchar(50) DEFAULT NULL,
  `UserType` varchar(50) DEFAULT NULL,
  `SocietyName` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `logintable`
--

LOCK TABLES `logintable` WRITE;
/*!40000 ALTER TABLE `logintable` DISABLE KEYS */;
INSERT INTO `logintable` VALUES (111111111,'Staff','Staff',NULL),(201707408,'Antony','Admin',NULL),(201709001,'James','Student',NULL),(222222222,'Admin','Admin',NULL),(333333333,'Society','Society','Airsoft'),(555555555,'Lecturer','Lecturer',NULL);
/*!40000 ALTER TABLE `logintable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `members`
--

DROP TABLE IF EXISTS `members`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `members` (
  `MemberID` int(11) NOT NULL,
  `MemberName` text NOT NULL,
  `Phone` text NOT NULL,
  `UserType` text NOT NULL,
  `Email` text NOT NULL,
  `SocietyID` int(11) NOT NULL,
  `PrimKey` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`PrimKey`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `members`
--

LOCK TABLES `members` WRITE;
/*!40000 ALTER TABLE `members` DISABLE KEYS */;
INSERT INTO `members` VALUES (201709001,'James Duncan','01632 960858','Student','jamesjduncan99@gmail.com',333333333,1);
/*!40000 ALTER TABLE `members` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roomcontent`
--

DROP TABLE IF EXISTS `roomcontent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roomcontent` (
  `Room` text CHARACTER SET utf8mb4,
  `IsBooked` varchar(5) CHARACTER SET utf8mb4 NOT NULL DEFAULT 'No',
  `IsDisabledAccess` varchar(5) CHARACTER SET utf8mb4 DEFAULT NULL,
  `RoomID` int(11) NOT NULL AUTO_INCREMENT,
  `IsProjector` varchar(5) CHARACTER SET utf8mb4 DEFAULT NULL,
  `LatestBooking` datetime DEFAULT NULL,
  `BookedDuration` int(11) DEFAULT NULL,
  `Time` time DEFAULT NULL,
  `RoomCapacity` int(11) DEFAULT NULL,
  `RoomBuilding` text CHARACTER SET utf8mb4,
  `IsComputerLab` varchar(5) CHARACTER SET utf8mb4 DEFAULT NULL,
  `IsChemicalLab` varchar(5) CHARACTER SET utf8mb4 DEFAULT NULL,
  PRIMARY KEY (`RoomID`),
  KEY `RoomID` (`RoomID`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roomcontent`
--

LOCK TABLES `roomcontent` WRITE;
/*!40000 ALTER TABLE `roomcontent` DISABLE KEYS */;
INSERT INTO `roomcontent` VALUES ('ESK-ALLAM-LT','No','Yes',1,'Yes',NULL,NULL,'09:00:00',500,'ESK','No','No'),('COHEN-LT3','No','No',2,'Yes',NULL,NULL,'10:00:00',112,'Cohen','No','No'),('ESK-ALLAM-LT','No','Yes',4,'Yes',NULL,NULL,'10:00:00',500,'ESK','No','No'),('ESK-ALLAM-LT','No','Yes',5,'Yes',NULL,NULL,'11:00:00',500,'ESK','No','No'),('ESK-ALLAM-LT','No','Yes',6,'Yes',NULL,NULL,'12:00:00',500,'ESK','No','No'),('ESK-ALLAM-LT','No','Yes',7,'Yes',NULL,NULL,'13:00:00',500,'ESK','No','No'),('ESK-ALLAM-LT','No','Yes',8,'Yes',NULL,NULL,'14:00:00',500,'ESK','No','No'),('ESK-ALLAM-LT','No','Yes',9,'Yes',NULL,NULL,'15:00:00',500,'ESK','No','No'),('ESK-ALLAM-LT','No','Yes',10,'Yes',NULL,NULL,'16:00:00',500,'ESK','No','No'),('ESK-ALLAM-LT','No','Yes',11,'Yes',NULL,NULL,'17:00:00',500,'ESK','No','No'),('COHEN-LT3','No','No',12,'Yes',NULL,NULL,'09:00:00',112,'Cohen','No','No'),('COHEN-LT3','No','No',13,'Yes',NULL,NULL,'11:00:00',112,'Cohen','No','No'),('COHEN-LT3','No','No',14,'Yes',NULL,NULL,'12:00:00',112,'Cohen','No','No'),('COHEN-LT3','No','No',15,'Yes',NULL,NULL,'13:00:00',112,'Cohen','No','No'),('COHEN-LT3','No','No',16,'Yes',NULL,NULL,'14:00:00',112,'Cohen','No','No'),('COHEN-LT3','No','No',17,'Yes',NULL,NULL,'15:00:00',112,'Cohen','No','No'),('COHEN-LT3','No','No',18,'Yes',NULL,NULL,'16:00:00',112,'Cohen','No','No'),('COHEN-LT3','No','No',19,'Yes',NULL,NULL,'17:00:00',112,'Cohen','No','No'),('FENNER-052B','No','Yes',20,'No',NULL,NULL,'00:00:00',52,'Fenner','Yes','No'),('FENNER-052B','No','Yes',21,'No',NULL,NULL,'01:00:00',52,'Fenner','Yes','No'),('FENNER-052B','No','Yes',22,'No',NULL,NULL,'02:00:00',52,'Fenner','Yes','No'),('FENNER-052B','No','Yes',23,'No',NULL,NULL,'03:00:00',52,'Fenner','Yes','No'),('FENNER-052B','No','Yes',24,'No',NULL,NULL,'04:00:00',52,'Fenner','Yes','No'),('FENNER-052B','No','Yes',25,'No',NULL,NULL,'05:00:00',52,'Fenner','Yes','No'),('FENNER-052B','No','Yes',26,'No',NULL,NULL,'06:00:00',52,'Fenner','Yes','No'),('FENNER-052B','No','Yes',28,'No',NULL,NULL,'07:00:00',52,'Fenner','Yes','No'),('FENNER-052B','No','Yes',29,'No',NULL,NULL,'08:00:00',52,'Fenner','Yes','No'),('FENNER-052B','No','Yes',30,'No',NULL,NULL,'09:00:00',52,'Fenner','Yes','No'),('FENNER-052B','No','Yes',31,'No',NULL,NULL,'10:00:00',52,'Fenner','Yes','No'),('FENNER-052B','No','Yes',32,'No',NULL,NULL,'11:00:00',52,'Fenner','Yes','No'),('FENNER-052B','No','Yes',33,'No',NULL,NULL,'12:00:00',52,'Fenner','Yes','No'),('FENNER-052B','No','Yes',34,'No',NULL,NULL,'13:00:00',52,'Fenner','Yes','No'),('FENNER-052B','No','Yes',35,'No',NULL,NULL,'00:00:00',52,'Fenner','Yes','No'),('FENNER-052B','No','Yes',36,'No',NULL,NULL,'15:00:00',52,'Fenner','Yes','No'),('FENNER-052B','No','Yes',37,'No',NULL,NULL,'16:00:00',52,'Fenner','Yes','No'),('FENNER-052B','No','Yes',38,'No',NULL,NULL,'17:00:00',52,'Fenner','Yes','No'),('FENNER-052B','No','Yes',39,'No',NULL,NULL,'18:00:00',52,'Fenner','Yes','No'),('FENNER-052B','No','Yes',40,'No',NULL,NULL,'19:00:00',52,'Fenner','Yes','No'),('FENNER-052B','No','Yes',41,'No',NULL,NULL,'20:00:00',52,'Fenner','Yes','No'),('FENNER-052B','No','Yes',42,'No',NULL,NULL,'21:00:00',52,'Fenner','Yes','No'),('FENNER-052B','No','Yes',43,'No',NULL,NULL,'22:00:00',52,'Fenner','Yes','No'),('FENNER-052B','No','Yes',44,'No',NULL,NULL,'23:00:00',52,'Fenner','Yes','No');
/*!40000 ALTER TABLE `roomcontent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rooms`
--

DROP TABLE IF EXISTS `rooms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rooms` (
  `entryID` int(11) NOT NULL AUTO_INCREMENT,
  `ts` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `StudentID` varchar(20) DEFAULT NULL,
  `Society` varchar(20) DEFAULT NULL,
  `booking_for` timestamp NULL DEFAULT NULL,
  `booking_end` timestamp NULL DEFAULT NULL,
  `Activity` varchar(100) DEFAULT NULL,
  `Room` varchar(50) DEFAULT NULL,
  `UserType` varchar(50) NOT NULL,
  PRIMARY KEY (`entryID`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rooms`
--

LOCK TABLES `rooms` WRITE;
/*!40000 ALTER TABLE `rooms` DISABLE KEYS */;
INSERT INTO `rooms` VALUES (15,'2019-04-03 01:32:59','201707038','compsci','2019-04-04 14:00:00','2019-04-04 17:00:00','Social','Sanc','Student'),(20,'2019-04-03 01:29:53','201707408','Monzo','2019-04-03 14:00:00','2019-04-03 20:00:00','Movie night','ESK ALLAM','Student'),(21,'2019-04-03 01:35:03','201707406','Horror','2019-04-06 19:00:00','2019-04-07 01:00:00','Sleepover','agile room','Student');
/*!40000 ALTER TABLE `rooms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `temp`
--

DROP TABLE IF EXISTS `temp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `temp` (
  `entryID` varchar(20) DEFAULT NULL,
  `ts` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `StudentID` varchar(20) DEFAULT NULL,
  `Society` varchar(20) DEFAULT NULL,
  `booking_for` timestamp NULL DEFAULT NULL,
  `booking_end` timestamp NULL DEFAULT NULL,
  `Activity` varchar(100) DEFAULT NULL,
  `Room` varchar(255) DEFAULT NULL,
  `UserType` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `temp`
--

LOCK TABLES `temp` WRITE;
/*!40000 ALTER TABLE `temp` DISABLE KEYS */;
INSERT INTO `temp` VALUES ('20','2019-04-03 01:29:53','201707408','Monzo','2019-04-03 14:00:00','2019-04-03 20:00:00','Movie night','ESK ALLAM','Student');
/*!40000 ALTER TABLE `temp` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-04-09 12:21:30
