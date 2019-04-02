-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Apr 02, 2019 at 05:35 PM
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
  `Room` text,
  `IsBooked` varchar(255) NOT NULL DEFAULT 'No',
  `IsDisabledAccess` varchar(255) DEFAULT NULL,
  `RoomID` int(11) NOT NULL,
  `IsProjector` varchar(255) DEFAULT NULL,
  `LatestBooking` datetime DEFAULT NULL,
  `BookedDuration` int(11) DEFAULT NULL,
  `RoomCapacity` int(11) DEFAULT NULL,
  `RoomBuilding` text,
  `IsComputerLab` varchar(255) DEFAULT NULL,
  `IsChemicalLab` varchar(255) DEFAULT NULL,
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
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `rooms`
--

INSERT INTO `rooms` (`entryID`, `ts`, `StudentID`, `Society`, `booking_for`, `booking_end`, `Activity`, `Room`, `UserType`) VALUES
(6, '2019-03-27 08:19:17', '0000', 'compsci', '2019-05-17 02:02:00', '2019-05-24 18:00:00', 'dying', 'Wilberforce', 'Staff'),
(7, '2019-03-27 08:20:16', '554538', 'hjbj', '2019-03-31 08:09:00', '2019-03-31 09:00:00', 'crying', 'my room', 'Student'),
(8, '2019-03-27 08:22:43', '554538', 'hjbj', '2019-03-31 08:09:00', '2019-03-31 09:00:00', 'crying', 'my room', 'Student'),
(9, '2019-03-27 08:22:54', '554538', 'hjbj', '2019-03-31 08:09:00', '2019-03-31 09:00:00', 'crying', 'my room', 'Staff'),
(10, '2019-03-27 08:23:12', '554538', 'hjbj', '2019-03-31 08:09:00', '2019-03-31 09:00:00', 'crying', 'my room', 'Staff'),
(11, '2019-03-27 08:23:59', '554538', 'hjbj', '2019-03-31 08:09:00', '2019-03-31 09:00:00', 'crying', 'my room', 'Staff'),
(12, '2019-03-27 08:24:27', '554538', 'hjbj', '2019-03-31 08:09:00', '2019-03-31 09:00:00', 'crying', 'my room', 'Staff'),
(13, '2019-03-27 08:26:30', '554538', 'hjbj', '2019-03-31 08:09:00', '2019-03-31 09:00:00', 'crying', 'my room', 'Staff'),
(14, '2019-03-27 10:07:27', '554538', 'rftgt', '2019-03-02 03:42:00', '2019-03-31 03:34:00', 'sesh', 'agile room', 'Student');

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
('6', '2019-03-27 08:19:17', '0000', 'compsci', '2019-05-17 02:02:00', '2019-05-24 18:00:00', 'dying', 'Wilberforce', 'Staff'),
('7', '2019-03-27 08:20:16', '554538', 'hjbj', '2019-03-31 08:09:00', '2019-03-31 09:00:00', 'crying', 'my room', 'Student'),
('8', '2019-03-27 08:22:43', '554538', 'hjbj', '2019-03-31 08:09:00', '2019-03-31 09:00:00', 'crying', 'my room', 'Student'),
('9', '2019-03-27 08:22:54', '554538', 'hjbj', '2019-03-31 08:09:00', '2019-03-31 09:00:00', 'crying', 'my room', 'Staff'),
('10', '2019-03-27 08:23:12', '554538', 'hjbj', '2019-03-31 08:09:00', '2019-03-31 09:00:00', 'crying', 'my room', 'Staff'),
('11', '2019-03-27 08:23:59', '554538', 'hjbj', '2019-03-31 08:09:00', '2019-03-31 09:00:00', 'crying', 'my room', 'Staff'),
('12', '2019-03-27 08:24:27', '554538', 'hjbj', '2019-03-31 08:09:00', '2019-03-31 09:00:00', 'crying', 'my room', 'Staff'),
('13', '2019-03-27 08:26:30', '554538', 'hjbj', '2019-03-31 08:09:00', '2019-03-31 09:00:00', 'crying', 'my room', 'Staff'),
('14', '2019-03-27 10:07:27', '554538', 'rftgt', '2019-03-02 03:42:00', '2019-03-31 03:34:00', 'sesh', 'agile room', 'Student'),
('', '2019-04-02 13:54:40', '201709001', '', '2018-10-05 14:00:00', '2018-10-05 15:00:00', 'Systems Analysis, Design and Process L', 'ESK-ALLAM-LT   [500] ', 'Timetabling'),
('', '2019-04-02 13:54:40', '201709001', '', '2018-10-26 14:00:00', '2018-10-26 15:00:00', 'Systems Analysis, Design and Process L', 'ESK-ALLAM-LT   [500] ', 'Timetabling'),
('', '2019-04-02 13:54:40', '201709001', '', '2018-11-02 15:00:00', '2018-11-02 16:00:00', 'Systems Analysis, Design and Process L', 'ESK-ALLAM-LT   [500] ', 'Timetabling'),
('', '2019-04-02 13:54:40', '201709001', '', '2018-11-09 15:00:00', '2018-11-09 16:00:00', 'Systems Analysis, Design and Process L', 'ESK-ALLAM-LT   [500] ', 'Timetabling'),
('', '2019-04-02 13:54:40', '201709001', '', '2018-11-16 15:00:00', '2018-11-16 16:00:00', 'Systems Analysis, Design and Process L', 'ESK-ALLAM-LT   [500] ', 'Timetabling'),
('', '2019-04-02 13:54:40', '201709001', '', '2018-11-23 15:00:00', '2018-11-23 16:00:00', 'Systems Analysis, Design and Process L', 'ESK-ALLAM-LT   [500] ', 'Timetabling'),
('', '2019-04-02 13:54:40', '201709001', '', '2018-11-30 15:00:00', '2018-11-30 16:00:00', 'Systems Analysis, Design and Process L', 'ESK-ALLAM-LT   [500] ', 'Timetabling'),
('', '2019-04-02 13:54:40', '201709001', '', '2018-12-07 15:00:00', '2018-12-07 16:00:00', 'Systems Analysis, Design and Process L', 'ESK-ALLAM-LT   [500] ', 'Timetabling'),
('', '2019-04-02 13:54:40', '201709001', '', '2018-12-14 15:00:00', '2018-12-14 16:00:00', 'Systems Analysis, Design and Process L', 'ESK-ALLAM-LT   [500] ', 'Timetabling'),
('', '2019-04-02 13:54:40', '201709001', '', '2018-10-05 16:00:00', '2018-10-05 17:00:00', 'Systems Analysis, Design and Process L', 'ESK-ALLAM-LT   [500] ', 'Timetabling'),
('', '2019-04-02 13:54:40', '201709001', '', '2018-10-26 16:00:00', '2018-10-26 17:00:00', 'Systems Analysis, Design and Process L', 'ESK-ALLAM-LT   [500] ', 'Timetabling'),
('', '2019-04-02 13:54:40', '201709001', '', '2018-11-02 17:00:00', '2018-11-02 18:00:00', 'Systems Analysis, Design and Process L', 'ESK-ALLAM-LT   [500] ', 'Timetabling'),
('', '2019-04-02 13:54:40', '201709001', '', '2018-11-09 17:00:00', '2018-11-09 18:00:00', 'Systems Analysis, Design and Process L', 'ESK-ALLAM-LT   [500] ', 'Timetabling'),
('', '2019-04-02 13:54:40', '201709001', '', '2018-11-16 17:00:00', '2018-11-16 18:00:00', 'Systems Analysis, Design and Process L', 'ESK-ALLAM-LT   [500] ', 'Timetabling'),
('', '2019-04-02 13:54:40', '201709001', '', '2018-11-23 17:00:00', '2018-11-23 18:00:00', 'Systems Analysis, Design and Process L', 'ESK-ALLAM-LT   [500] ', 'Timetabling'),
('', '2019-04-02 13:54:40', '201709001', '', '2018-11-30 17:00:00', '2018-11-30 18:00:00', 'Systems Analysis, Design and Process L', 'ESK-ALLAM-LT   [500] ', 'Timetabling'),
('', '2019-04-02 13:54:40', '201709001', '', '2018-12-07 17:00:00', '2018-12-07 18:00:00', 'Systems Analysis, Design and Process L', 'ESK-ALLAM-LT   [500] ', 'Timetabling'),
('', '2019-04-02 13:54:40', '201709001', '', '2018-12-14 17:00:00', '2018-12-14 18:00:00', 'Systems Analysis, Design and Process L', 'ESK-ALLAM-LT   [500] ', 'Timetabling'),
('', '2019-04-02 13:54:40', '201709001', '', '2018-10-19 14:00:00', '2018-10-19 16:00:00', 'Systems Analysis, Design and Process L', 'ESK-ALLAM-LT   [500] ', 'Timetabling'),
('', '2019-04-02 13:54:40', '201709001', '', '2019-03-21 14:00:00', '2019-03-21 15:00:00', 'Systems Analysis, Design and Process L', 'ESK-ALLAM-LT   [500] ', 'Timetabling'),
('', '2019-04-02 13:54:40', '201709001', '', '2019-04-09 11:00:00', '2019-04-09 12:00:00', 'Networking and User Interface Design Opt', 'BRYN-TR1   [45] ', 'Timetabling'),
('', '2019-04-02 13:54:40', '201709001', '', '2019-01-29 12:00:00', '2019-01-29 13:00:00', 'Networking and User Interface Design L', 'ESK-ALLAM-LT   [500] ', 'Timetabling'),
('', '2019-04-02 13:54:40', '201709001', '', '2019-02-05 12:00:00', '2019-02-05 13:00:00', 'Networking and User Interface Design L', 'ESK-ALLAM-LT   [500] ', 'Timetabling'),
('', '2019-04-02 13:54:40', '201709001', '', '2019-02-12 12:00:00', '2019-02-12 13:00:00', 'Networking and User Interface Design L', 'ESK-ALLAM-LT   [500] ', 'Timetabling'),
('', '2019-04-02 13:54:40', '201709001', '', '2019-02-19 12:00:00', '2019-02-19 13:00:00', 'Networking and User Interface Design L', 'ESK-ALLAM-LT   [500] ', 'Timetabling'),
('', '2019-04-02 13:54:40', '201709001', '', '2019-02-26 12:00:00', '2019-02-26 13:00:00', 'Networking and User Interface Design L', 'ESK-ALLAM-LT   [500] ', 'Timetabling'),
('', '2019-04-02 13:54:40', '201709001', '', '2019-01-28 16:00:00', '2019-01-28 17:00:00', 'Networking and User Interface Design L', 'ESK-ALLAM-LT   [500] ', 'Timetabling'),
('', '2019-04-02 13:54:40', '201709001', '', '2019-02-04 16:00:00', '2019-02-04 17:00:00', 'Networking and User Interface Design L', 'ESK-ALLAM-LT   [500] ', 'Timetabling'),
('', '2019-04-02 13:54:40', '201709001', '', '2019-02-11 16:00:00', '2019-02-11 17:00:00', 'Networking and User Interface Design L', 'ESK-ALLAM-LT   [500] ', 'Timetabling'),
('', '2019-04-02 13:54:40', '201709001', '', '2019-02-18 16:00:00', '2019-02-18 17:00:00', 'Networking and User Interface Design L', 'ESK-ALLAM-LT   [500] ', 'Timetabling'),
('', '2019-04-02 13:54:40', '201709001', '', '2019-02-25 16:00:00', '2019-02-25 17:00:00', 'Networking and User Interface Design L', 'ESK-ALLAM-LT   [500] ', 'Timetabling'),
('', '2019-04-02 13:54:40', '201709001', '', '2019-04-08 15:00:00', '2019-04-08 16:00:00', 'Networking and User Interface Design L', 'ESK-ALLAM-LT   [500] ', 'Timetabling'),
('', '2019-04-02 13:54:40', '201709001', '', '2019-03-04 16:00:00', '2019-03-04 17:00:00', 'Networking and User Interface Design L', 'ESK-ALLAM-LT   [500] ', 'Timetabling'),
('', '2019-04-02 13:54:40', '201709001', '', '2019-03-11 16:00:00', '2019-03-11 17:00:00', 'Networking and User Interface Design L', 'ESK-ALLAM-LT   [500] ', 'Timetabling'),
('', '2019-04-02 13:54:40', '201709001', '', '2019-03-18 16:00:00', '2019-03-18 17:00:00', 'Networking and User Interface Design L', 'ESK-ALLAM-LT   [500] ', 'Timetabling'),
('', '2019-04-02 13:54:40', '201709001', '', '2019-03-25 16:00:00', '2019-03-25 17:00:00', 'Networking and User Interface Design L', 'ESK-ALLAM-LT   [500] ', 'Timetabling'),
('', '2019-04-02 13:54:40', '201709001', '', '2019-04-01 15:00:00', '2019-04-01 16:00:00', 'Networking and User Interface Design L', 'ESK-ALLAM-LT   [500] ', 'Timetabling'),
('', '2019-04-02 13:54:40', '201709001', '', '2019-01-31 09:00:00', '2019-01-31 11:00:00', 'Networking and User Interface Design Lab', 'FENNER-052B PC (CSE Image)    [52] *FENNER-052C PC (CSE Image)   [24] *FENNER-052A PC (CSE Image)   [65] ', 'Timetabling'),
('', '2019-04-02 13:54:40', '201709001', '', '2019-02-07 09:00:00', '2019-02-07 11:00:00', 'Networking and User Interface Design Lab', 'FENNER-052B PC (CSE Image)    [52] *FENNER-052C PC (CSE Image)   [24] *FENNER-052A PC (CSE Image)   [65] ', 'Timetabling'),
('', '2019-04-02 13:54:40', '201709001', '', '2019-02-14 09:00:00', '2019-02-14 11:00:00', 'Networking and User Interface Design Lab', 'FENNER-052B PC (CSE Image)    [52] *FENNER-052C PC (CSE Image)   [24] *FENNER-052A PC (CSE Image)   [65] ', 'Timetabling'),
('', '2019-04-02 13:54:40', '201709001', '', '2019-02-21 09:00:00', '2019-02-21 11:00:00', 'Networking and User Interface Design Lab', 'FENNER-052B PC (CSE Image)    [52] *FENNER-052C PC (CSE Image)   [24] *FENNER-052A PC (CSE Image)   [65] ', 'Timetabling'),
('', '2019-04-02 13:54:40', '201709001', '', '2019-02-28 09:00:00', '2019-02-28 11:00:00', 'Networking and User Interface Design Lab', 'FENNER-052B PC (CSE Image)    [52] *FENNER-052C PC (CSE Image)   [24] *FENNER-052A PC (CSE Image)   [65] ', 'Timetabling'),
('', '2019-04-02 13:54:40', '201709001', '', '2019-03-07 09:00:00', '2019-03-07 11:00:00', 'Networking and User Interface Design Lab', 'FENNER-052B PC (CSE Image)    [52] *FENNER-052C PC (CSE Image)   [24] *FENNER-052A PC (CSE Image)   [65] ', 'Timetabling'),
('', '2019-04-02 13:54:40', '201709001', '', '2018-10-12 16:00:00', '2018-10-12 17:00:00', 'Systems Analysis, Design and Process L', 'ESK-ALLAM-LT   [500] ', 'Timetabling'),
('', '2019-04-02 13:54:40', '201709001', '', '2018-11-27 09:00:00', '2018-11-27 11:00:00', 'Information Systems and Web Technologies Lab', 'RBB-209B PC (CSE Image)    [40] *RBB-321 PC (CS Image)  [24] *RBB-209A PC (CSE Image)   [40] ', 'Timetabling'),
('', '2019-04-02 13:54:40', '201709001', '', '2018-12-04 09:00:00', '2018-12-04 11:00:00', 'Information Systems and Web Technologies Lab', 'RBB-209B PC (CSE Image)    [40] *RBB-321 PC (CS Image)  [24] *RBB-209A PC (CSE Image)   [40] ', 'Timetabling'),
('', '2019-04-02 13:54:40', '201709001', '', '2018-10-22 15:00:00', '2018-10-22 17:00:00', 'Information Systems and Web Technologies Lab', 'RBB-209B PC (CSE Image)    [40] *RBB-321 PC (CS Image)  [24] *RBB-209A PC (CSE Image)   [40] ', 'Timetabling'),
('', '2019-04-02 13:54:40', '201709001', '', '2018-11-05 16:00:00', '2018-11-05 18:00:00', 'Information Systems and Web Technologies Lab', 'RBB-209B PC (CSE Image)    [40] *RBB-321 PC (CS Image)  [24] *RBB-209A PC (CSE Image)   [40] ', 'Timetabling'),
('', '2019-04-02 13:54:40', '201709001', '', '2018-11-12 16:00:00', '2018-11-12 18:00:00', 'Information Systems and Web Technologies Lab', 'RBB-209B PC (CSE Image)    [40] *RBB-321 PC (CS Image)  [24] *RBB-209A PC (CSE Image)   [40] ', 'Timetabling'),
('', '2019-04-02 13:54:40', '201709001', '', '2018-11-19 16:00:00', '2018-11-19 18:00:00', 'Information Systems and Web Technologies Lab', 'RBB-209B PC (CSE Image)    [40] *RBB-321 PC (CS Image)  [24] *RBB-209A PC (CSE Image)   [40] ', 'Timetabling'),
('', '2019-04-02 13:54:40', '201709001', '', '2018-10-30 17:00:00', '2018-10-30 18:00:00', 'Information Systems and Web Technologies Lab', 'RBB-209B PC (CSE Image)    [40] *RBB-321 PC (CS Image)  [24] *RBB-209A PC (CSE Image)   [40] ', 'Timetabling'),
('', '2019-04-02 13:54:40', '201709001', '', '2018-12-11 09:00:00', '2018-12-11 16:00:00', 'Information Systems and Web Technologies ANM', 'RBB-209B PC (CSE Image)    [40] *RBB-321 PC (CS Image)  [24] ', 'Timetabling'),
('', '2019-04-02 13:54:40', '201709001', '', '2019-03-05 11:00:00', '2019-03-05 12:00:00', 'Database Techniques P', 'FENNER-052B PC (CSE Image)    [52] *FENNER-052C PC (CSE Image)   [24] *FENNER-052A PC (CSE Image)   [65] ', 'Timetabling'),
('', '2019-04-02 13:54:40', '201709001', '', '2019-03-12 11:00:00', '2019-03-12 12:00:00', 'Database Techniques P', 'FENNER-052B PC (CSE Image)    [52] *FENNER-052C PC (CSE Image)   [24] *FENNER-052A PC (CSE Image)   [65] ', 'Timetabling'),
('', '2019-04-02 13:54:40', '201709001', '', '2019-03-19 11:00:00', '2019-03-19 12:00:00', 'Database Techniques P', 'FENNER-052B PC (CSE Image)    [52] *FENNER-052C PC (CSE Image)   [24] *FENNER-052A PC (CSE Image)   [65] ', 'Timetabling'),
('', '2019-04-02 13:54:40', '201709001', '', '2019-03-26 11:00:00', '2019-03-26 12:00:00', 'Database Techniques P', 'FENNER-052B PC (CSE Image)    [52] *FENNER-052C PC (CSE Image)   [24] *FENNER-052A PC (CSE Image)   [65] ', 'Timetabling'),
('', '2019-04-02 13:54:40', '201709001', '', '2019-04-02 10:00:00', '2019-04-02 11:00:00', 'Database Techniques P', 'FENNER-052B PC (CSE Image)    [52] *FENNER-052C PC (CSE Image)   [24] *FENNER-052A PC (CSE Image)   [65] ', 'Timetabling'),
('', '2019-04-02 13:54:40', '201709001', '', '2019-04-09 10:00:00', '2019-04-09 11:00:00', 'Database Techniques P', 'FENNER-052B PC (CSE Image)    [52] *FENNER-052C PC (CSE Image)   [24] *FENNER-052A PC (CSE Image)   [65] ', 'Timetabling'),
('', '2019-04-02 13:54:40', '201709001', '', '2019-04-30 10:00:00', '2019-04-30 11:00:00', 'Database Techniques P', 'FENNER-052B PC (CSE Image)    [52] *FENNER-052C PC (CSE Image)   [24] *FENNER-052A PC (CSE Image)   [65] ', 'Timetabling'),
('', '2019-04-02 13:54:40', '201709001', '', '2019-03-26 15:00:00', '2019-03-26 16:00:00', 'Database Techniques L', 'APPSCI-LLT   [213] ', 'Timetabling'),
('', '2019-04-02 13:54:40', '201709001', '', '2019-04-02 14:00:00', '2019-04-02 15:00:00', 'Database Techniques L', 'APPSCI-LLT   [213] ', 'Timetabling'),
('', '2019-04-02 13:54:40', '201709001', '', '2019-04-09 14:00:00', '2019-04-09 15:00:00', 'Database Techniques L', 'APPSCI-LLT   [213] ', 'Timetabling'),
('', '2019-04-02 13:54:40', '201709001', '', '2019-04-30 14:00:00', '2019-04-30 15:00:00', 'Database Techniques L', 'APPSCI-LLT   [213] ', 'Timetabling'),
('', '2019-04-02 13:54:40', '201709001', '', '2019-02-01 10:00:00', '2019-02-01 11:00:00', 'Database Techniques L', 'HARDY-LT1   [232] ', 'Timetabling'),
('', '2019-04-02 13:54:40', '201709001', '', '2019-02-08 10:00:00', '2019-02-08 11:00:00', 'Database Techniques L', 'HARDY-LT1   [232] ', 'Timetabling'),
('', '2019-04-02 13:54:40', '201709001', '', '2019-02-15 10:00:00', '2019-02-15 11:00:00', 'Database Techniques L', 'HARDY-LT1   [232] ', 'Timetabling'),
('', '2019-04-02 13:54:40', '201709001', '', '2019-02-22 10:00:00', '2019-02-22 11:00:00', 'Database Techniques L', 'HARDY-LT1   [232] ', 'Timetabling'),
('', '2019-04-02 13:54:40', '201709001', '', '2019-03-01 10:00:00', '2019-03-01 11:00:00', 'Database Techniques L', 'HARDY-LT1   [232] ', 'Timetabling'),
('', '2019-04-02 13:54:40', '201709001', '', '2019-01-29 15:00:00', '2019-01-29 16:00:00', 'Database Techniques L', 'WILB-LT01   [244] ', 'Timetabling'),
('', '2019-04-02 13:54:40', '201709001', '', '2019-02-05 15:00:00', '2019-02-05 16:00:00', 'Database Techniques L', 'WILB-LT01   [244] ', 'Timetabling'),
('', '2019-04-02 13:54:40', '201709001', '', '2019-02-12 15:00:00', '2019-02-12 16:00:00', 'Database Techniques L', 'WILB-LT01   [244] ', 'Timetabling'),
('', '2019-04-02 13:54:40', '201709001', '', '2019-02-19 15:00:00', '2019-02-19 16:00:00', 'Database Techniques L', 'WILB-LT01   [244] ', 'Timetabling'),
('', '2019-04-02 13:54:40', '201709001', '', '2019-02-26 15:00:00', '2019-02-26 16:00:00', 'Database Techniques L', 'WILB-LT01   [244] ', 'Timetabling'),
('', '2019-04-02 13:54:40', '201709001', '', '2019-03-05 15:00:00', '2019-03-05 16:00:00', 'Database Techniques L', 'WILB-LT01   [244] ', 'Timetabling'),
('', '2019-04-02 13:54:40', '201709001', '', '2019-03-12 15:00:00', '2019-03-12 16:00:00', 'Database Techniques L', 'WILB-LT01   [244] ', 'Timetabling'),
('', '2019-04-02 13:54:40', '201709001', '', '2019-03-19 15:00:00', '2019-03-19 16:00:00', 'Database Techniques L', 'WILB-LT01   [244] ', 'Timetabling'),
('', '2019-04-02 13:54:40', '201709001', '', '2018-10-26 15:00:00', '2018-10-26 16:00:00', 'Information Systems and Web Technologies L', 'WILB-LT15   [120] ', 'Timetabling'),
('', '2019-04-02 13:54:40', '201709001', '', '2018-11-02 16:00:00', '2018-11-02 17:00:00', 'Information Systems and Web Technologies L', 'WILB-LT15   [120] ', 'Timetabling'),
('', '2019-04-02 13:54:40', '201709001', '', '2018-11-09 16:00:00', '2018-11-09 17:00:00', 'Information Systems and Web Technologies L', 'WILB-LT15   [120] ', 'Timetabling'),
('', '2019-04-02 13:54:40', '201709001', '', '2018-11-16 16:00:00', '2018-11-16 17:00:00', 'Information Systems and Web Technologies L', 'WILB-LT15   [120] ', 'Timetabling'),
('', '2019-04-02 13:54:40', '201709001', '', '2018-11-23 16:00:00', '2018-11-23 17:00:00', 'Information Systems and Web Technologies L', 'WILB-LT15   [120] ', 'Timetabling'),
('', '2019-04-02 13:54:40', '201709001', '', '2018-11-30 16:00:00', '2018-11-30 17:00:00', 'Information Systems and Web Technologies L', 'WILB-LT15   [120] ', 'Timetabling'),
('', '2019-04-02 13:54:40', '201709001', '', '2018-12-07 16:00:00', '2018-12-07 17:00:00', 'Information Systems and Web Technologies L', 'WILB-LT15   [120] ', 'Timetabling'),
('', '2019-04-02 13:54:40', '201709001', '', '2018-11-26 15:00:00', '2018-11-26 16:00:00', 'Information Systems and Web Technologies L', 'AMB- LT1 [200] ', 'Timetabling'),
('', '2019-04-02 13:54:40', '201709001', '', '2018-12-03 15:00:00', '2018-12-03 16:00:00', 'Information Systems and Web Technologies L', 'AMB- LT1 [200] ', 'Timetabling'),
('', '2019-04-02 13:54:40', '201709001', '', '2018-12-10 15:00:00', '2018-12-10 16:00:00', 'Information Systems and Web Technologies L', 'AMB- LT1 [200] ', 'Timetabling'),
('', '2019-04-02 13:54:40', '201709001', '', '2018-10-08 10:00:00', '2018-10-08 11:00:00', 'Information Systems and Web Technologies L', 'AMB- LT1 [200] ', 'Timetabling'),
('', '2019-04-02 13:54:40', '201709001', '', '2018-10-15 10:00:00', '2018-10-15 11:00:00', 'Information Systems and Web Technologies L', 'AMB- LT1 [200] ', 'Timetabling'),
('', '2019-04-02 13:54:40', '201709001', '', '2018-10-22 10:00:00', '2018-10-22 11:00:00', 'Information Systems and Web Technologies L', 'AMB- LT1 [200] ', 'Timetabling'),
('', '2019-04-02 13:54:40', '201709001', '', '2018-10-29 11:00:00', '2018-10-29 12:00:00', 'Information Systems and Web Technologies L', 'AMB- LT1 [200] ', 'Timetabling'),
('', '2019-04-02 13:54:40', '201709001', '', '2018-11-05 11:00:00', '2018-11-05 12:00:00', 'Information Systems and Web Technologies L', 'AMB- LT1 [200] ', 'Timetabling'),
('', '2019-04-02 13:54:40', '201709001', '', '2018-11-12 11:00:00', '2018-11-12 12:00:00', 'Information Systems and Web Technologies L', 'AMB- LT1 [200] ', 'Timetabling'),
('', '2019-04-02 13:54:40', '201709001', '', '2018-11-19 11:00:00', '2018-11-19 12:00:00', 'Information Systems and Web Technologies L', 'AMB- LT1 [200] ', 'Timetabling'),
('', '2019-04-02 13:54:40', '201709001', '', '2018-09-24 11:00:00', '2018-09-24 12:00:00', 'Information Systems and Web Technologies L', 'APPSCI-WLT   [105] ', 'Timetabling'),
('', '2019-04-02 13:54:40', '201709001', '', '2018-10-01 11:00:00', '2018-10-01 12:00:00', 'Information Systems and Web Technologies L', 'APPSCI-WLT   [105] ', 'Timetabling'),
('', '2019-04-02 13:54:40', '201709001', '', '2018-09-28 11:00:00', '2018-09-28 12:00:00', 'Systems Analysis, Design and Process Opt', 'APPSCI-ELT   [105] ', 'Timetabling'),
('', '2019-04-02 13:54:40', '201709001', '', '2018-10-05 11:00:00', '2018-10-05 12:00:00', 'Systems Analysis, Design and Process Opt', 'APPSCI-ELT   [105] ', 'Timetabling'),
('', '2019-04-02 13:54:40', '201709001', '', '2018-10-19 11:00:00', '2018-10-19 12:00:00', 'Systems Analysis, Design and Process Opt', 'APPSCI-ELT   [105] ', 'Timetabling'),
('', '2019-04-02 13:54:40', '201709001', '', '2018-11-16 12:00:00', '2018-11-16 13:00:00', 'Systems Analysis, Design and Process Opt', 'APPSCI-ELT   [105] ', 'Timetabling'),
('', '2019-04-02 13:54:40', '201709001', '', '2018-11-30 12:00:00', '2018-11-30 13:00:00', 'Systems Analysis, Design and Process Opt', 'APPSCI-ELT   [105] ', 'Timetabling'),
('', '2019-04-02 13:54:40', '201709001', '', '2019-01-28 11:00:00', '2019-01-28 13:00:00', 'Agile Software Development L', 'LARKIN-LTC   [120]', 'Timetabling'),
('', '2019-04-02 13:54:40', '201709001', '', '2019-02-04 11:00:00', '2019-02-04 13:00:00', 'Agile Software Development L', 'LARKIN-LTC   [120]', 'Timetabling'),
('', '2019-04-02 13:54:40', '201709001', '', '2019-02-11 11:00:00', '2019-02-11 13:00:00', 'Agile Software Development L', 'LARKIN-LTC   [120]', 'Timetabling'),
('', '2019-04-02 13:54:40', '201709001', '', '2019-02-18 11:00:00', '2019-02-18 13:00:00', 'Agile Software Development L', 'LARKIN-LTC   [120]', 'Timetabling'),
('', '2019-04-02 13:54:40', '201709001', '', '2019-02-25 11:00:00', '2019-02-25 13:00:00', 'Agile Software Development L', 'LARKIN-LTC   [120]', 'Timetabling'),
('', '2019-04-02 13:54:40', '201709001', '', '2019-03-04 11:00:00', '2019-03-04 13:00:00', 'Agile Software Development L', 'LARKIN-LTC   [120]', 'Timetabling'),
('', '2019-04-02 13:54:40', '201709001', '', '2019-03-11 11:00:00', '2019-03-11 13:00:00', 'Agile Software Development L', 'LARKIN-LTC   [120]', 'Timetabling'),
('', '2019-04-02 13:54:40', '201709001', '', '2019-03-18 11:00:00', '2019-03-18 13:00:00', 'Agile Software Development L', 'LARKIN-LTC   [120]', 'Timetabling'),
('', '2019-04-02 13:54:40', '201709001', '', '2019-03-25 11:00:00', '2019-03-25 13:00:00', 'Agile Software Development L', 'LARKIN-LTC   [120]', 'Timetabling'),
('', '2019-04-02 13:54:40', '201709001', '', '2019-04-01 10:00:00', '2019-04-01 12:00:00', 'Agile Software Development L', 'LARKIN-LTC   [120]', 'Timetabling'),
('', '2019-04-02 13:54:40', '201709001', '', '2019-04-08 10:00:00', '2019-04-08 12:00:00', 'Agile Software Development L', 'LARKIN-LTC   [120]', 'Timetabling'),
('', '2019-04-02 13:54:40', '201709001', '', '2019-04-29 10:00:00', '2019-04-29 12:00:00', 'Agile Software Development L', 'LARKIN-LTC   [120]', 'Timetabling'),
('', '2019-04-02 13:54:40', '201709001', '', '2019-02-06 10:00:00', '2019-02-06 11:00:00', 'Agile Software Development P', 'RBB-270 PC (CSE Image)  [60] ', 'Timetabling'),
('', '2019-04-02 13:54:40', '201709001', '', '2019-02-13 10:00:00', '2019-02-13 11:00:00', 'Agile Software Development P', 'RBB-270 PC (CSE Image)  [60] ', 'Timetabling'),
('', '2019-04-02 13:54:40', '201709001', '', '2019-02-20 10:00:00', '2019-02-20 11:00:00', 'Agile Software Development P', 'RBB-270 PC (CSE Image)  [60] ', 'Timetabling'),
('', '2019-04-02 13:54:40', '201709001', '', '2019-02-27 10:00:00', '2019-02-27 11:00:00', 'Agile Software Development P', 'RBB-270 PC (CSE Image)  [60] ', 'Timetabling'),
('', '2019-04-02 13:54:40', '201709001', '', '2019-03-06 10:00:00', '2019-03-06 11:00:00', 'Agile Software Development P', 'RBB-270 PC (CSE Image)  [60] ', 'Timetabling'),
('', '2019-04-02 13:54:40', '201709001', '', '2019-03-13 10:00:00', '2019-03-13 11:00:00', 'Agile Software Development P', 'RBB-270 PC (CSE Image)  [60] ', 'Timetabling'),
('', '2019-04-02 13:54:40', '201709001', '', '2019-03-20 10:00:00', '2019-03-20 11:00:00', 'Agile Software Development P', 'RBB-270 PC (CSE Image)  [60] ', 'Timetabling'),
('', '2019-04-02 13:54:40', '201709001', '', '2019-03-27 10:00:00', '2019-03-27 11:00:00', 'Agile Software Development P', 'RBB-270 PC (CSE Image)  [60] ', 'Timetabling'),
('', '2019-04-02 13:54:40', '201709001', '', '2019-04-03 09:00:00', '2019-04-03 10:00:00', 'Agile Software Development P', 'RBB-270 PC (CSE Image)  [60] ', 'Timetabling'),
('', '2019-04-02 13:54:40', '201709001', '', '2019-04-10 09:00:00', '2019-04-10 10:00:00', 'Agile Software Development P', 'RBB-270 PC (CSE Image)  [60] ', 'Timetabling'),
('', '2019-04-02 13:54:40', '201709001', '', '2019-05-01 09:00:00', '2019-05-01 10:00:00', 'Agile Software Development P', 'RBB-270 PC (CSE Image)  [60] ', 'Timetabling'),
('', '2019-04-02 13:54:40', '201709001', '', '2018-09-28 15:00:00', '2018-09-28 16:00:00', 'Systems Analysis, Design and Process L', 'ESK-ALLAM-LT   [500] ', 'Timetabling'),
('', '2019-04-02 13:54:40', '201709001', '', '2018-10-12 15:00:00', '2018-10-12 16:00:00', 'Systems Analysis, Design and Process L', 'ESK-ALLAM-LT   [500] ', 'Timetabling'),
('', '2019-04-02 13:54:40', '201709001', '', '2019-03-15 10:00:00', '2019-03-15 11:00:00', 'Database Techniques L', 'APPSCI-LLT   [213] ', 'Timetabling'),
('', '2019-04-02 13:54:40', '201709001', '', '2019-03-22 10:00:00', '2019-03-22 11:00:00', 'Database Techniques L', 'APPSCI-LLT   [213] ', 'Timetabling'),
('', '2019-04-02 13:54:40', '201709001', '', '2019-03-29 10:00:00', '2019-03-29 11:00:00', 'Database Techniques L', 'APPSCI-LLT   [213] ', 'Timetabling'),
('', '2019-04-02 13:54:40', '201709001', '', '2019-04-05 09:00:00', '2019-04-05 10:00:00', 'Database Techniques L', 'APPSCI-LLT   [213] ', 'Timetabling'),
('', '2019-04-02 13:54:40', '201709001', '', '2019-04-12 09:00:00', '2019-04-12 10:00:00', 'Database Techniques L', 'APPSCI-LLT   [213] ', 'Timetabling'),
('', '2019-04-02 13:54:40', '201709001', '', '2019-05-03 09:00:00', '2019-05-03 10:00:00', 'Database Techniques L', 'APPSCI-LLT   [213] ', 'Timetabling'),
('', '2019-04-02 13:54:40', '201709001', '', '2019-03-08 10:00:00', '2019-03-08 11:00:00', 'Database Techniques CANCELLED', '', 'Timetabling'),
('', '2019-04-02 13:54:40', '201709001', '', '2019-03-05 12:00:00', '2019-03-05 13:00:00', 'Networking and User Interface Design L', 'ESK-ALLAM-LT   [500] ', 'Timetabling'),
('', '2019-04-02 13:54:40', '201709001', '', '2019-03-19 12:00:00', '2019-03-19 13:00:00', 'Networking and User Interface Design L', 'ESK-ALLAM-LT   [500] ', 'Timetabling'),
('', '2019-04-02 13:54:40', '201709001', '', '2019-03-26 12:00:00', '2019-03-26 13:00:00', 'Networking and User Interface Design L', 'ESK-ALLAM-LT   [500] ', 'Timetabling'),
('', '2019-04-02 13:54:40', '201709001', '', '2019-03-12 12:00:00', '2019-03-12 13:00:00', 'Networking and User Interface Design CANCELLED', '', 'Timetabling'),
('', '2019-04-02 13:54:40', '201709001', '', '2018-10-03 09:00:00', '2018-10-03 11:00:00', 'Electronics and Interfacing P', 'RBB-209B PC (CSE Image)    [40] *RBB-209A PC (CSE Image)   [40] ', 'Timetabling'),
('', '2019-04-02 13:54:40', '201709001', '', '2018-10-10 09:00:00', '2018-10-10 11:00:00', 'Electronics and Interfacing P', 'RBB-209B PC (CSE Image)    [40] *RBB-209A PC (CSE Image)   [40] ', 'Timetabling'),
('', '2019-04-02 13:54:40', '201709001', '', '2018-10-17 09:00:00', '2018-10-17 11:00:00', 'Electronics and Interfacing P', 'RBB-209B PC (CSE Image)    [40] *RBB-209A PC (CSE Image)   [40] ', 'Timetabling'),
('', '2019-04-02 13:54:40', '201709001', '', '2018-10-24 09:00:00', '2018-10-24 11:00:00', 'Electronics and Interfacing P', 'RBB-209B PC (CSE Image)    [40] *RBB-209A PC (CSE Image)   [40] ', 'Timetabling'),
('', '2019-04-02 13:54:40', '201709001', '', '2018-10-31 10:00:00', '2018-10-31 12:00:00', 'Electronics and Interfacing P', 'RBB-209B PC (CSE Image)    [40] *RBB-209A PC (CSE Image)   [40] ', 'Timetabling'),
('', '2019-04-02 13:54:40', '201709001', '', '2018-11-07 10:00:00', '2018-11-07 12:00:00', 'Electronics and Interfacing P', 'RBB-209B PC (CSE Image)    [40] *RBB-209A PC (CSE Image)   [40] ', 'Timetabling'),
('', '2019-04-02 13:54:40', '201709001', '', '2018-11-14 10:00:00', '2018-11-14 12:00:00', 'Electronics and Interfacing P', 'RBB-209B PC (CSE Image)    [40] *RBB-209A PC (CSE Image)   [40] ', 'Timetabling'),
('', '2019-04-02 13:54:40', '201709001', '', '2018-11-21 10:00:00', '2018-11-21 12:00:00', 'Electronics and Interfacing P', 'RBB-209B PC (CSE Image)    [40] *RBB-209A PC (CSE Image)   [40] ', 'Timetabling'),
('', '2019-04-02 13:54:40', '201709001', '', '2018-11-28 10:00:00', '2018-11-28 12:00:00', 'Electronics and Interfacing P', 'RBB-209B PC (CSE Image)    [40] *RBB-209A PC (CSE Image)   [40] ', 'Timetabling'),
('', '2019-04-02 13:54:40', '201709001', '', '2018-12-05 10:00:00', '2018-12-05 12:00:00', 'Electronics and Interfacing P', 'RBB-209B PC (CSE Image)    [40] *RBB-209A PC (CSE Image)   [40] ', 'Timetabling'),
('', '2019-04-02 13:54:40', '201709001', '', '2018-10-05 09:00:00', '2018-10-05 11:00:00', 'Electronics and Interfacing P', 'RBB-209B PC (CSE Image)    [40] *RBB-209A PC (CSE Image)   [40] ', 'Timetabling'),
('', '2019-04-02 13:54:40', '201709001', '', '2018-10-12 09:00:00', '2018-10-12 11:00:00', 'Electronics and Interfacing P', 'RBB-209B PC (CSE Image)    [40] *RBB-209A PC (CSE Image)   [40] ', 'Timetabling'),
('', '2019-04-02 13:54:40', '201709001', '', '2018-10-19 09:00:00', '2018-10-19 11:00:00', 'Electronics and Interfacing P', 'RBB-209B PC (CSE Image)    [40] *RBB-209A PC (CSE Image)   [40] ', 'Timetabling'),
('', '2019-04-02 13:54:40', '201709001', '', '2018-10-26 09:00:00', '2018-10-26 11:00:00', 'Electronics and Interfacing P', 'RBB-209B PC (CSE Image)    [40] *RBB-209A PC (CSE Image)   [40] ', 'Timetabling'),
('', '2019-04-02 13:54:40', '201709001', '', '2018-11-02 10:00:00', '2018-11-02 12:00:00', 'Electronics and Interfacing P', 'RBB-209B PC (CSE Image)    [40] *RBB-209A PC (CSE Image)   [40] ', 'Timetabling'),
('', '2019-04-02 13:54:40', '201709001', '', '2018-11-09 10:00:00', '2018-11-09 12:00:00', 'Electronics and Interfacing P', 'RBB-209B PC (CSE Image)    [40] *RBB-209A PC (CSE Image)   [40] ', 'Timetabling'),
('', '2019-04-02 13:54:40', '201709001', '', '2018-11-16 10:00:00', '2018-11-16 12:00:00', 'Electronics and Interfacing P', 'RBB-209B PC (CSE Image)    [40] *RBB-209A PC (CSE Image)   [40] ', 'Timetabling'),
('', '2019-04-02 13:54:40', '201709001', '', '2018-11-23 10:00:00', '2018-11-23 12:00:00', 'Electronics and Interfacing P', 'RBB-209B PC (CSE Image)    [40] *RBB-209A PC (CSE Image)   [40] ', 'Timetabling'),
('', '2019-04-02 13:54:40', '201709001', '', '2018-11-30 10:00:00', '2018-11-30 12:00:00', 'Electronics and Interfacing P', 'RBB-209B PC (CSE Image)    [40] *RBB-209A PC (CSE Image)   [40] ', 'Timetabling'),
('', '2019-04-02 13:54:40', '201709001', '', '2018-12-07 10:00:00', '2018-12-07 12:00:00', 'Electronics and Interfacing P', 'RBB-209B PC (CSE Image)    [40] *RBB-209A PC (CSE Image)   [40] ', 'Timetabling'),
('', '2019-04-02 13:54:40', '201709001', '', '2018-12-13 15:00:00', '2018-12-13 17:00:00', 'Electronics and Interfacing P', 'RBB-209B PC (CSE Image)    [40] *RBB-209A PC (CSE Image)   [40] ', 'Timetabling'),
('', '2019-04-02 13:54:40', '201709001', '', '2018-10-02 12:00:00', '2018-10-02 13:00:00', 'Electronics and Interfacing L', 'APPSCI-WLT   [105] ', 'Timetabling'),
('', '2019-04-02 13:54:40', '201709001', '', '2018-10-09 12:00:00', '2018-10-09 13:00:00', 'Electronics and Interfacing L', 'APPSCI-WLT   [105] ', 'Timetabling'),
('', '2019-04-02 13:54:40', '201709001', '', '2018-10-16 12:00:00', '2018-10-16 13:00:00', 'Electronics and Interfacing L', 'APPSCI-WLT   [105] ', 'Timetabling'),
('', '2019-04-02 13:54:40', '201709001', '', '2018-10-23 12:00:00', '2018-10-23 13:00:00', 'Electronics and Interfacing L', 'APPSCI-WLT   [105] ', 'Timetabling'),
('', '2019-04-02 13:54:40', '201709001', '', '2018-10-30 13:00:00', '2018-10-30 14:00:00', 'Electronics and Interfacing L', 'APPSCI-WLT   [105] ', 'Timetabling'),
('', '2019-04-02 13:54:40', '201709001', '', '2018-11-13 13:00:00', '2018-11-13 14:00:00', 'Electronics and Interfacing L', 'WILB-LT29   [68] ', 'Timetabling'),
('', '2019-04-02 13:54:40', '201709001', '', '2018-12-04 13:00:00', '2018-12-04 15:00:00', 'Electronics and Interfacing T', 'APPSCI-WLT   [105] ', 'Timetabling'),
('', '2019-04-02 13:54:40', '201709001', '', '2019-02-08 14:00:00', '2019-02-08 15:00:00', 'Networking and User Interface Design Opt', 'ESK-ALLAM-LT   [500] ', 'Timetabling'),
('', '2019-04-02 13:54:40', '201709001', '', '2019-03-15 14:00:00', '2019-03-15 15:00:00', 'Networking and User Interface Design Opt', 'ESK-ALLAM-LT   [500] ', 'Timetabling'),
('', '2019-04-02 13:54:40', '201709001', '', '2019-03-29 14:00:00', '2019-03-29 15:00:00', 'Networking and User Interface Design Opt', 'ESK-ALLAM-LT   [500] ', 'Timetabling'),
('', '2019-04-02 13:54:40', '201709001', '', '2019-04-05 13:00:00', '2019-04-05 14:00:00', 'Networking and User Interface Design Opt', 'ESK-ALLAM-LT   [500] ', 'Timetabling'),
('', '2019-04-02 13:54:40', '201709001', '', '2019-03-01 14:00:00', '2019-03-01 15:00:00', 'Networking and User Interface Design Opt', 'APPSCI-LLT   [213] ', 'Timetabling'),
('', '2019-04-02 13:54:40', '201709001', '', '2018-10-04 08:00:00', '2018-10-04 10:00:00', 'Systems Analysis, Design and Process Lab', 'FENNER-052B PC (CSE Image)    [52] *FENNER-052C PC (CSE Image)   [24] *FENNER-052A PC (CSE Image)   [65] ', 'Timetabling'),
('', '2019-04-02 13:54:40', '201709001', '', '2018-10-11 08:00:00', '2018-10-11 10:00:00', 'Systems Analysis, Design and Process Lab', 'FENNER-052B PC (CSE Image)    [52] *FENNER-052C PC (CSE Image)   [24] *FENNER-052A PC (CSE Image)   [65] ', 'Timetabling'),
('', '2019-04-02 13:54:40', '201709001', '', '2018-10-18 08:00:00', '2018-10-18 10:00:00', 'Systems Analysis, Design and Process Lab', 'FENNER-052B PC (CSE Image)    [52] *FENNER-052C PC (CSE Image)   [24] *FENNER-052A PC (CSE Image)   [65] ', 'Timetabling'),
('', '2019-04-02 13:54:40', '201709001', '', '2018-10-25 08:00:00', '2018-10-25 10:00:00', 'Systems Analysis, Design and Process Lab', 'FENNER-052B PC (CSE Image)    [52] *FENNER-052C PC (CSE Image)   [24] *FENNER-052A PC (CSE Image)   [65] ', 'Timetabling'),
('', '2019-04-02 13:54:40', '201709001', '', '2018-11-01 09:00:00', '2018-11-01 11:00:00', 'Systems Analysis, Design and Process Lab', 'FENNER-052B PC (CSE Image)    [52] *FENNER-052C PC (CSE Image)   [24] *FENNER-052A PC (CSE Image)   [65] ', 'Timetabling'),
('', '2019-04-02 13:54:40', '201709001', '', '2018-11-08 09:00:00', '2018-11-08 11:00:00', 'Systems Analysis, Design and Process Lab', 'FENNER-052B PC (CSE Image)    [52] *FENNER-052C PC (CSE Image)   [24] *FENNER-052A PC (CSE Image)   [65] ', 'Timetabling'),
('', '2019-04-02 13:54:40', '201709001', '', '2018-11-15 09:00:00', '2018-11-15 11:00:00', 'Systems Analysis, Design and Process Lab', 'FENNER-052B PC (CSE Image)    [52] *FENNER-052C PC (CSE Image)   [24] *FENNER-052A PC (CSE Image)   [65] ', 'Timetabling'),
('', '2019-04-02 13:54:40', '201709001', '', '2018-11-22 09:00:00', '2018-11-22 11:00:00', 'Systems Analysis, Design and Process Lab', 'FENNER-052B PC (CSE Image)    [52] *FENNER-052C PC (CSE Image)   [24] *FENNER-052A PC (CSE Image)   [65] ', 'Timetabling'),
('', '2019-04-02 13:54:40', '201709001', '', '2018-11-29 09:00:00', '2018-11-29 11:00:00', 'Systems Analysis, Design and Process Lab', 'FENNER-052B PC (CSE Image)    [52] *FENNER-052C PC (CSE Image)   [24] *FENNER-052A PC (CSE Image)   [65] ', 'Timetabling'),
('', '2019-04-02 13:54:40', '201709001', '', '2018-12-06 09:00:00', '2018-12-06 11:00:00', 'Systems Analysis, Design and Process Lab', 'FENNER-052B PC (CSE Image)    [52] *FENNER-052C PC (CSE Image)   [24] *FENNER-052A PC (CSE Image)   [65] ', 'Timetabling');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
