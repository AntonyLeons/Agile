-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Apr 05, 2019 at 02:39 PM
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
-- Table structure for table `logintable`
--

DROP TABLE IF EXISTS `logintable`;
CREATE TABLE IF NOT EXISTS `logintable` (
  `ID` int(11) DEFAULT NULL,
  `Password` text,
  `UserType` text,
  `PrimKey` int(11) NOT NULL,
  PRIMARY KEY (`PrimKey`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `logintable`
--

INSERT INTO `logintable` (`ID`, `Password`, `UserType`, `PrimKey`) VALUES
(201709001, 'James', 'Student', 1),
(111111111, 'Staff', 'Staff', 2),
(222222222, 'Admin', 'Admin', 3),
(333333333, 'Society', 'Society', 4),
(555555555, 'Lecturer', 'Lecturer', 5);

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
('COHEN-LT3', 'Yes', 'No', 2, 'Yes', '2019-05-05 16:00:00', 60, 112, 'Cohen', 'No', 'No'),
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
('20', '2019-04-03 01:29:53', '201707408', 'Monzo', '2019-04-03 14:00:00', '2019-04-03 20:00:00', 'Movie night', 'ESK ALLAM', 'Student');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
