-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Apr 03, 2019 at 01:38 AM
-- Server version: 5.7.24
-- PHP Version: 7.2.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bookings`
--

-- --------------------------------------------------------

--
-- Table structure for table `roomcontent`
--

DROP TABLE IF EXISTS `roomcontent`;
CREATE TABLE IF NOT EXISTS `roomcontent` (
  `Room` text CHARACTER SET utf8mb4,
  `IsBooked` varchar(255) CHARACTER SET utf8mb4 NOT NULL DEFAULT 'No',
  `IsDisabledAccess` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `RoomID` int(11) NOT NULL,
  `IsProjector` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL,
  `LatestBooking` datetime DEFAULT NULL,
  `BookedDuration` int(11) DEFAULT NULL,
  `RoomCapacity` int(11) DEFAULT NULL,
  `RoomBuilding` text CHARACTER SET utf8mb4,
  `IsComputerLab` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `IsChemicalLab` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL,
  PRIMARY KEY (`RoomID`),
  KEY `RoomID` (`RoomID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `roomcontent`
--

INSERT INTO `roomcontent` (`Room`, `IsBooked`, `IsDisabledAccess`, `RoomID`, `IsProjector`, `LatestBooking`, `BookedDuration`, `RoomCapacity`, `RoomBuilding`, `IsComputerLab`, `IsChemicalLab`) VALUES
('ESK-ALLAM-LT', 'Yes', 'Yes', 1, 'Yes', '2019-05-05 16:00:00', 60, 500, 'ESK', 'No', 'No'),
('COHEN-LT3', 'No', 'No', 2, 'Yes', NULL, NULL, 112, 'Cohen', 'No', 'No'),
('FENNER-052B', 'No', 'Yes', 3, 'No', NULL, NULL, 52, 'Fenner', 'Yes', 'No');

-- --------------------------------------------------------

--
-- Table structure for table `rooms`
--

DROP TABLE IF EXISTS `rooms`;
CREATE TABLE IF NOT EXISTS `rooms` (
  `entryID` int(11) NOT NULL AUTO_INCREMENT,
  `ts` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `StudentID` varchar(20) DEFAULT NULL,
  `Society` varchar(20) DEFAULT NULL,
  `booking_for` timestamp NULL DEFAULT NULL,
  `booking_end` timestamp NULL DEFAULT NULL,
  `Activity` varchar(100) DEFAULT NULL,
  `Room` varchar(50) DEFAULT NULL,
  `UserType` varchar(7) NOT NULL,
  PRIMARY KEY (`entryID`)
) ENGINE=MyISAM AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `rooms`
--

INSERT INTO `rooms` (`entryID`, `ts`, `StudentID`, `Society`, `booking_for`, `booking_end`, `Activity`, `Room`, `UserType`) VALUES
(21, '2019-04-03 01:35:03', '201707406', 'Horror', '2019-04-06 19:00:00', '2019-04-07 01:00:00', 'Sleepover', 'agile room', 'Student'),
(15, '2019-04-03 01:32:59', '201707038', 'compsci', '2019-04-04 14:00:00', '2019-04-04 17:00:00', 'Social', 'Sanc', 'Student'),
(20, '2019-04-03 01:29:53', '201707408', 'Monzo', '2019-04-03 14:00:00', '2019-04-03 20:00:00', 'Movie night', 'ESK ALLAM', 'Student');

-- --------------------------------------------------------

--
-- Table structure for table `temp`
--

DROP TABLE IF EXISTS `temp`;
CREATE TABLE IF NOT EXISTS `temp` (
  `entryID` varchar(20) DEFAULT NULL,
  `ts` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `StudentID` varchar(20) DEFAULT NULL,
  `Society` varchar(20) DEFAULT NULL,
  `booking_for` timestamp NULL DEFAULT NULL,
  `booking_end` timestamp NULL DEFAULT NULL,
  `Activity` varchar(100) DEFAULT NULL,
  `Room` varchar(255) DEFAULT NULL,
  `UserType` varchar(11) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `temp`
--

INSERT INTO `temp` (`entryID`, `ts`, `StudentID`, `Society`, `booking_for`, `booking_end`, `Activity`, `Room`, `UserType`) VALUES
('21', '2019-04-03 01:35:03', '201707406', 'Horror', '2019-04-06 19:00:00', '2019-04-07 01:00:00', 'Sleepover', 'agile room', 'Student'),
('15', '2019-04-03 01:32:59', '201707038', 'compsci', '2019-04-04 14:00:00', '2019-04-04 17:00:00', 'Social', 'Sanc', 'Student'),
('20', '2019-04-03 01:29:53', '201707408', 'Monzo', '2019-04-03 14:00:00', '2019-04-03 20:00:00', 'Movie night', 'ESK ALLAM', 'Student'),
('', '2019-04-03 01:37:40', '201707408', '', '2019-04-09 11:00:00', '2019-04-09 12:00:00', 'Networking and User Interface Design Opt', 'BRYN-TR1   [45] ', 'Timetabling'),
('', '2019-04-03 01:37:40', '201707408', '', '2019-01-29 12:00:00', '2019-01-29 13:00:00', 'Networking and User Interface Design L', 'ESK-ALLAM-LT   [500] ', 'Timetabling'),
('', '2019-04-03 01:37:40', '201707408', '', '2019-02-05 12:00:00', '2019-02-05 13:00:00', 'Networking and User Interface Design L', 'ESK-ALLAM-LT   [500] ', 'Timetabling'),
('', '2019-04-03 01:37:40', '201707408', '', '2019-02-12 12:00:00', '2019-02-12 13:00:00', 'Networking and User Interface Design L', 'ESK-ALLAM-LT   [500] ', 'Timetabling'),
('', '2019-04-03 01:37:40', '201707408', '', '2019-02-19 12:00:00', '2019-02-19 13:00:00', 'Networking and User Interface Design L', 'ESK-ALLAM-LT   [500] ', 'Timetabling'),
('', '2019-04-03 01:37:40', '201707408', '', '2019-02-26 12:00:00', '2019-02-26 13:00:00', 'Networking and User Interface Design L', 'ESK-ALLAM-LT   [500] ', 'Timetabling'),
('', '2019-04-03 01:37:40', '201707408', '', '2019-01-28 16:00:00', '2019-01-28 17:00:00', 'Networking and User Interface Design L', 'ESK-ALLAM-LT   [500] ', 'Timetabling'),
('', '2019-04-03 01:37:40', '201707408', '', '2019-02-04 16:00:00', '2019-02-04 17:00:00', 'Networking and User Interface Design L', 'ESK-ALLAM-LT   [500] ', 'Timetabling'),
('', '2019-04-03 01:37:40', '201707408', '', '2019-02-11 16:00:00', '2019-02-11 17:00:00', 'Networking and User Interface Design L', 'ESK-ALLAM-LT   [500] ', 'Timetabling'),
('', '2019-04-03 01:37:40', '201707408', '', '2019-02-18 16:00:00', '2019-02-18 17:00:00', 'Networking and User Interface Design L', 'ESK-ALLAM-LT   [500] ', 'Timetabling'),
('', '2019-04-03 01:37:40', '201707408', '', '2019-02-25 16:00:00', '2019-02-25 17:00:00', 'Networking and User Interface Design L', 'ESK-ALLAM-LT   [500] ', 'Timetabling'),
('', '2019-04-03 01:37:40', '201707408', '', '2019-04-08 15:00:00', '2019-04-08 16:00:00', 'Networking and User Interface Design L', 'ESK-ALLAM-LT   [500] ', 'Timetabling'),
('', '2019-04-03 01:37:40', '201707408', '', '2019-03-04 16:00:00', '2019-03-04 17:00:00', 'Networking and User Interface Design L', 'ESK-ALLAM-LT   [500] ', 'Timetabling'),
('', '2019-04-03 01:37:40', '201707408', '', '2019-03-11 16:00:00', '2019-03-11 17:00:00', 'Networking and User Interface Design L', 'ESK-ALLAM-LT   [500] ', 'Timetabling'),
('', '2019-04-03 01:37:40', '201707408', '', '2019-03-18 16:00:00', '2019-03-18 17:00:00', 'Networking and User Interface Design L', 'ESK-ALLAM-LT   [500] ', 'Timetabling'),
('', '2019-04-03 01:37:40', '201707408', '', '2019-03-25 16:00:00', '2019-03-25 17:00:00', 'Networking and User Interface Design L', 'ESK-ALLAM-LT   [500] ', 'Timetabling'),
('', '2019-04-03 01:37:40', '201707408', '', '2019-04-01 15:00:00', '2019-04-01 16:00:00', 'Networking and User Interface Design L', 'ESK-ALLAM-LT   [500] ', 'Timetabling'),
('', '2019-04-03 01:37:40', '201707408', '', '2019-01-31 09:00:00', '2019-01-31 11:00:00', 'Networking and User Interface Design Lab', 'FENNER-052B PC (CSE Image)    [52] *FENNER-052C PC (CSE Image)   [24] *FENNER-052A PC (CSE Image)   [65] ', 'Timetabling'),
('', '2019-04-03 01:37:40', '201707408', '', '2019-02-07 09:00:00', '2019-02-07 11:00:00', 'Networking and User Interface Design Lab', 'FENNER-052B PC (CSE Image)    [52] *FENNER-052C PC (CSE Image)   [24] *FENNER-052A PC (CSE Image)   [65] ', 'Timetabling'),
('', '2019-04-03 01:37:40', '201707408', '', '2019-02-14 09:00:00', '2019-02-14 11:00:00', 'Networking and User Interface Design Lab', 'FENNER-052B PC (CSE Image)    [52] *FENNER-052C PC (CSE Image)   [24] *FENNER-052A PC (CSE Image)   [65] ', 'Timetabling'),
('', '2019-04-03 01:37:40', '201707408', '', '2019-02-21 09:00:00', '2019-02-21 11:00:00', 'Networking and User Interface Design Lab', 'FENNER-052B PC (CSE Image)    [52] *FENNER-052C PC (CSE Image)   [24] *FENNER-052A PC (CSE Image)   [65] ', 'Timetabling'),
('', '2019-04-03 01:37:40', '201707408', '', '2019-02-28 09:00:00', '2019-02-28 11:00:00', 'Networking and User Interface Design Lab', 'FENNER-052B PC (CSE Image)    [52] *FENNER-052C PC (CSE Image)   [24] *FENNER-052A PC (CSE Image)   [65] ', 'Timetabling'),
('', '2019-04-03 01:37:40', '201707408', '', '2019-03-07 09:00:00', '2019-03-07 11:00:00', 'Networking and User Interface Design Lab', 'FENNER-052B PC (CSE Image)    [52] *FENNER-052C PC (CSE Image)   [24] *FENNER-052A PC (CSE Image)   [65] ', 'Timetabling'),
('', '2019-04-03 01:37:40', '201707408', '', '2019-03-05 11:00:00', '2019-03-05 12:00:00', 'Database Techniques P', 'FENNER-052B PC (CSE Image)    [52] *FENNER-052C PC (CSE Image)   [24] *FENNER-052A PC (CSE Image)   [65] ', 'Timetabling'),
('', '2019-04-03 01:37:40', '201707408', '', '2019-03-12 11:00:00', '2019-03-12 12:00:00', 'Database Techniques P', 'FENNER-052B PC (CSE Image)    [52] *FENNER-052C PC (CSE Image)   [24] *FENNER-052A PC (CSE Image)   [65] ', 'Timetabling'),
('', '2019-04-03 01:37:40', '201707408', '', '2019-03-19 11:00:00', '2019-03-19 12:00:00', 'Database Techniques P', 'FENNER-052B PC (CSE Image)    [52] *FENNER-052C PC (CSE Image)   [24] *FENNER-052A PC (CSE Image)   [65] ', 'Timetabling'),
('', '2019-04-03 01:37:40', '201707408', '', '2019-03-26 11:00:00', '2019-03-26 12:00:00', 'Database Techniques P', 'FENNER-052B PC (CSE Image)    [52] *FENNER-052C PC (CSE Image)   [24] *FENNER-052A PC (CSE Image)   [65] ', 'Timetabling'),
('', '2019-04-03 01:37:40', '201707408', '', '2019-04-02 10:00:00', '2019-04-02 11:00:00', 'Database Techniques P', 'FENNER-052B PC (CSE Image)    [52] *FENNER-052C PC (CSE Image)   [24] *FENNER-052A PC (CSE Image)   [65] ', 'Timetabling'),
('', '2019-04-03 01:37:40', '201707408', '', '2019-04-09 10:00:00', '2019-04-09 11:00:00', 'Database Techniques P', 'FENNER-052B PC (CSE Image)    [52] *FENNER-052C PC (CSE Image)   [24] *FENNER-052A PC (CSE Image)   [65] ', 'Timetabling'),
('', '2019-04-03 01:37:40', '201707408', '', '2019-04-30 10:00:00', '2019-04-30 11:00:00', 'Database Techniques P', 'FENNER-052B PC (CSE Image)    [52] *FENNER-052C PC (CSE Image)   [24] *FENNER-052A PC (CSE Image)   [65] ', 'Timetabling'),
('', '2019-04-03 01:37:40', '201707408', '', '2019-03-26 15:00:00', '2019-03-26 16:00:00', 'Database Techniques L', 'APPSCI-LLT   [213] ', 'Timetabling'),
('', '2019-04-03 01:37:40', '201707408', '', '2019-04-02 14:00:00', '2019-04-02 15:00:00', 'Database Techniques L', 'APPSCI-LLT   [213] ', 'Timetabling'),
('', '2019-04-03 01:37:40', '201707408', '', '2019-04-09 14:00:00', '2019-04-09 15:00:00', 'Database Techniques L', 'APPSCI-LLT   [213] ', 'Timetabling'),
('', '2019-04-03 01:37:40', '201707408', '', '2019-04-30 14:00:00', '2019-04-30 15:00:00', 'Database Techniques L', 'APPSCI-LLT   [213] ', 'Timetabling'),
('', '2019-04-03 01:37:40', '201707408', '', '2019-02-01 10:00:00', '2019-02-01 11:00:00', 'Database Techniques L', 'HARDY-LT1   [232] ', 'Timetabling'),
('', '2019-04-03 01:37:40', '201707408', '', '2019-02-08 10:00:00', '2019-02-08 11:00:00', 'Database Techniques L', 'HARDY-LT1   [232] ', 'Timetabling'),
('', '2019-04-03 01:37:40', '201707408', '', '2019-02-15 10:00:00', '2019-02-15 11:00:00', 'Database Techniques L', 'HARDY-LT1   [232] ', 'Timetabling'),
('', '2019-04-03 01:37:40', '201707408', '', '2019-02-22 10:00:00', '2019-02-22 11:00:00', 'Database Techniques L', 'HARDY-LT1   [232] ', 'Timetabling'),
('', '2019-04-03 01:37:40', '201707408', '', '2019-03-01 10:00:00', '2019-03-01 11:00:00', 'Database Techniques L', 'HARDY-LT1   [232] ', 'Timetabling'),
('', '2019-04-03 01:37:40', '201707408', '', '2019-01-29 15:00:00', '2019-01-29 16:00:00', 'Database Techniques L', 'WILB-LT01   [244] ', 'Timetabling'),
('', '2019-04-03 01:37:40', '201707408', '', '2019-02-05 15:00:00', '2019-02-05 16:00:00', 'Database Techniques L', 'WILB-LT01   [244] ', 'Timetabling'),
('', '2019-04-03 01:37:40', '201707408', '', '2019-02-12 15:00:00', '2019-02-12 16:00:00', 'Database Techniques L', 'WILB-LT01   [244] ', 'Timetabling'),
('', '2019-04-03 01:37:40', '201707408', '', '2019-02-19 15:00:00', '2019-02-19 16:00:00', 'Database Techniques L', 'WILB-LT01   [244] ', 'Timetabling'),
('', '2019-04-03 01:37:40', '201707408', '', '2019-02-26 15:00:00', '2019-02-26 16:00:00', 'Database Techniques L', 'WILB-LT01   [244] ', 'Timetabling'),
('', '2019-04-03 01:37:40', '201707408', '', '2019-03-05 15:00:00', '2019-03-05 16:00:00', 'Database Techniques L', 'WILB-LT01   [244] ', 'Timetabling'),
('', '2019-04-03 01:37:40', '201707408', '', '2019-03-12 15:00:00', '2019-03-12 16:00:00', 'Database Techniques L', 'WILB-LT01   [244] ', 'Timetabling'),
('', '2019-04-03 01:37:40', '201707408', '', '2019-03-19 15:00:00', '2019-03-19 16:00:00', 'Database Techniques L', 'WILB-LT01   [244] ', 'Timetabling'),
('', '2019-04-03 01:37:40', '201707408', '', '2019-01-28 11:00:00', '2019-01-28 13:00:00', 'Agile Software Development L', 'LARKIN-LTC   [120]', 'Timetabling'),
('', '2019-04-03 01:37:40', '201707408', '', '2019-02-04 11:00:00', '2019-02-04 13:00:00', 'Agile Software Development L', 'LARKIN-LTC   [120]', 'Timetabling'),
('', '2019-04-03 01:37:40', '201707408', '', '2019-02-11 11:00:00', '2019-02-11 13:00:00', 'Agile Software Development L', 'LARKIN-LTC   [120]', 'Timetabling'),
('', '2019-04-03 01:37:40', '201707408', '', '2019-02-18 11:00:00', '2019-02-18 13:00:00', 'Agile Software Development L', 'LARKIN-LTC   [120]', 'Timetabling'),
('', '2019-04-03 01:37:40', '201707408', '', '2019-02-25 11:00:00', '2019-02-25 13:00:00', 'Agile Software Development L', 'LARKIN-LTC   [120]', 'Timetabling'),
('', '2019-04-03 01:37:40', '201707408', '', '2019-03-04 11:00:00', '2019-03-04 13:00:00', 'Agile Software Development L', 'LARKIN-LTC   [120]', 'Timetabling'),
('', '2019-04-03 01:37:40', '201707408', '', '2019-03-11 11:00:00', '2019-03-11 13:00:00', 'Agile Software Development L', 'LARKIN-LTC   [120]', 'Timetabling'),
('', '2019-04-03 01:37:40', '201707408', '', '2019-03-18 11:00:00', '2019-03-18 13:00:00', 'Agile Software Development L', 'LARKIN-LTC   [120]', 'Timetabling'),
('', '2019-04-03 01:37:40', '201707408', '', '2019-03-25 11:00:00', '2019-03-25 13:00:00', 'Agile Software Development L', 'LARKIN-LTC   [120]', 'Timetabling'),
('', '2019-04-03 01:37:40', '201707408', '', '2019-04-01 10:00:00', '2019-04-01 12:00:00', 'Agile Software Development L', 'LARKIN-LTC   [120]', 'Timetabling'),
('', '2019-04-03 01:37:40', '201707408', '', '2019-04-08 10:00:00', '2019-04-08 12:00:00', 'Agile Software Development L', 'LARKIN-LTC   [120]', 'Timetabling'),
('', '2019-04-03 01:37:40', '201707408', '', '2019-04-29 10:00:00', '2019-04-29 12:00:00', 'Agile Software Development L', 'LARKIN-LTC   [120]', 'Timetabling'),
('', '2019-04-03 01:37:40', '201707408', '', '2019-03-15 10:00:00', '2019-03-15 11:00:00', 'Database Techniques L', 'APPSCI-LLT   [213] ', 'Timetabling'),
('', '2019-04-03 01:37:40', '201707408', '', '2019-03-22 10:00:00', '2019-03-22 11:00:00', 'Database Techniques L', 'APPSCI-LLT   [213] ', 'Timetabling'),
('', '2019-04-03 01:37:40', '201707408', '', '2019-03-29 10:00:00', '2019-03-29 11:00:00', 'Database Techniques L', 'APPSCI-LLT   [213] ', 'Timetabling'),
('', '2019-04-03 01:37:40', '201707408', '', '2019-04-05 09:00:00', '2019-04-05 10:00:00', 'Database Techniques L', 'APPSCI-LLT   [213] ', 'Timetabling'),
('', '2019-04-03 01:37:40', '201707408', '', '2019-04-12 09:00:00', '2019-04-12 10:00:00', 'Database Techniques L', 'APPSCI-LLT   [213] ', 'Timetabling'),
('', '2019-04-03 01:37:40', '201707408', '', '2019-05-03 09:00:00', '2019-05-03 10:00:00', 'Database Techniques L', 'APPSCI-LLT   [213] ', 'Timetabling'),
('', '2019-04-03 01:37:40', '201707408', '', '2019-03-08 10:00:00', '2019-03-08 11:00:00', 'Database Techniques CANCELLED', '', 'Timetabling'),
('', '2019-04-03 01:37:40', '201707408', '', '2019-03-05 12:00:00', '2019-03-05 13:00:00', 'Networking and User Interface Design L', 'ESK-ALLAM-LT   [500] ', 'Timetabling'),
('', '2019-04-03 01:37:40', '201707408', '', '2019-03-19 12:00:00', '2019-03-19 13:00:00', 'Networking and User Interface Design L', 'ESK-ALLAM-LT   [500] ', 'Timetabling'),
('', '2019-04-03 01:37:40', '201707408', '', '2019-03-26 12:00:00', '2019-03-26 13:00:00', 'Networking and User Interface Design L', 'ESK-ALLAM-LT   [500] ', 'Timetabling'),
('', '2019-04-03 01:37:40', '201707408', '', '2019-03-12 12:00:00', '2019-03-12 13:00:00', 'Networking and User Interface Design CANCELLED', '', 'Timetabling'),
('', '2019-04-03 01:37:40', '201707408', '', '2019-02-08 14:00:00', '2019-02-08 15:00:00', 'Networking and User Interface Design Opt', 'ESK-ALLAM-LT   [500] ', 'Timetabling'),
('', '2019-04-03 01:37:40', '201707408', '', '2019-03-15 14:00:00', '2019-03-15 15:00:00', 'Networking and User Interface Design Opt', 'ESK-ALLAM-LT   [500] ', 'Timetabling'),
('', '2019-04-03 01:37:40', '201707408', '', '2019-03-29 14:00:00', '2019-03-29 15:00:00', 'Networking and User Interface Design Opt', 'ESK-ALLAM-LT   [500] ', 'Timetabling'),
('', '2019-04-03 01:37:40', '201707408', '', '2019-04-05 13:00:00', '2019-04-05 14:00:00', 'Networking and User Interface Design Opt', 'ESK-ALLAM-LT   [500] ', 'Timetabling'),
('', '2019-04-03 01:37:40', '201707408', '', '2019-03-01 14:00:00', '2019-03-01 15:00:00', 'Networking and User Interface Design Opt', 'APPSCI-LLT   [213] ', 'Timetabling');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
