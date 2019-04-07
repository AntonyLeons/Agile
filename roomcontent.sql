-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Apr 07, 2019 at 04:41 PM
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
  `Society` text,
  `IsBooked` varchar(255) NOT NULL DEFAULT 'No',
  `IsDisabledAccess` varchar(255) DEFAULT NULL,
  `RoomID` int(11) NOT NULL,
  `IsProjector` varchar(255) DEFAULT NULL,
  `LatestBooking` datetime DEFAULT NULL,
  `BookedDuration` int(11) DEFAULT NULL,
  `Time` time DEFAULT NULL,
  `RoomCapacity` int(11) DEFAULT NULL,
  `RoomBuilding` text,
  `IsComputerLab` varchar(255) DEFAULT NULL,
  `IsChemicalLab` varchar(255) DEFAULT NULL,
  `Activity` text,
  PRIMARY KEY (`RoomID`),
  KEY `RoomID` (`RoomID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `roomcontent`
--

INSERT INTO `roomcontent` (`Room`, `Society`, `IsBooked`, `IsDisabledAccess`, `RoomID`, `IsProjector`, `LatestBooking`, `BookedDuration`, `Time`, `RoomCapacity`, `RoomBuilding`, `IsComputerLab`, `IsChemicalLab`, `Activity`) VALUES
('ESK-ALLAM-LT', NULL, 'No', 'Yes', 1, 'Yes', NULL, NULL, '09:00:00', 500, 'ESK', 'No', 'No', NULL),
('COHEN-LT3', NULL, 'No', 'No', 2, 'Yes', NULL, NULL, '10:00:00', 112, 'Cohen', 'No', 'No', NULL),
('ESK-ALLAM-LT', NULL, 'No', 'Yes', 4, 'Yes', NULL, NULL, '10:00:00', 500, 'ESK', 'No', 'No', NULL),
('ESK-ALLAM-LT', NULL, 'No', 'Yes', 5, 'Yes', NULL, NULL, '11:00:00', 500, 'ESK', 'No', 'No', NULL),
('ESK-ALLAM-LT', NULL, 'No', 'Yes', 6, 'Yes', NULL, NULL, '12:00:00', 500, 'ESK', 'No', 'No', NULL),
('ESK-ALLAM-LT', NULL, 'No', 'Yes', 7, 'Yes', NULL, NULL, '13:00:00', 500, 'ESK', 'No', 'No', NULL),
('ESK-ALLAM-LT', NULL, 'No', 'Yes', 8, 'Yes', NULL, NULL, '14:00:00', 500, 'ESK', 'No', 'No', NULL),
('ESK-ALLAM-LT', NULL, 'No', 'Yes', 9, 'Yes', NULL, NULL, '15:00:00', 500, 'ESK', 'No', 'No', NULL),
('ESK-ALLAM-LT', NULL, 'No', 'Yes', 10, 'Yes', NULL, NULL, '16:00:00', 500, 'ESK', 'No', 'No', NULL),
('ESK-ALLAM-LT', NULL, 'No', 'Yes', 11, 'Yes', NULL, NULL, '17:00:00', 500, 'ESK', 'No', 'No', NULL),
('COHEN-LT3', NULL, 'No', 'No', 12, 'Yes', NULL, NULL, '09:00:00', 112, 'Cohen', 'No', 'No', NULL),
('COHEN-LT3', NULL, 'No', 'No', 13, 'Yes', NULL, NULL, '11:00:00', 112, 'Cohen', 'No', 'No', NULL),
('COHEN-LT3', NULL, 'No', 'No', 14, 'Yes', NULL, NULL, '12:00:00', 112, 'Cohen', 'No', 'No', NULL),
('COHEN-LT3', NULL, 'No', 'No', 15, 'Yes', NULL, NULL, '13:00:00', 112, 'Cohen', 'No', 'No', NULL),
('COHEN-LT3', NULL, 'No', 'No', 16, 'Yes', NULL, NULL, '14:00:00', 112, 'Cohen', 'No', 'No', NULL),
('COHEN-LT3', NULL, 'No', 'No', 17, 'Yes', NULL, NULL, '15:00:00', 112, 'Cohen', 'No', 'No', NULL),
('COHEN-LT3', NULL, 'No', 'No', 18, 'Yes', NULL, NULL, '16:00:00', 112, 'Cohen', 'No', 'No', NULL),
('COHEN-LT3', NULL, 'No', 'No', 19, 'Yes', NULL, NULL, '17:00:00', 112, 'Cohen', 'No', 'No', NULL),
('FENNER-052B', NULL, 'No', 'Yes', 20, 'No', NULL, NULL, '00:00:00', 52, 'Fenner', 'Yes', 'No', NULL),
('FENNER-052B', NULL, 'No', 'Yes', 21, 'No', NULL, NULL, '01:00:00', 52, 'Fenner', 'Yes', 'No', NULL),
('FENNER-052B', NULL, 'No', 'Yes', 22, 'No', NULL, NULL, '02:00:00', 52, 'Fenner', 'Yes', 'No', NULL),
('FENNER-052B', NULL, 'No', 'Yes', 23, 'No', NULL, NULL, '03:00:00', 52, 'Fenner', 'Yes', 'No', NULL),
('FENNER-052B', NULL, 'No', 'Yes', 24, 'No', NULL, NULL, '04:00:00', 52, 'Fenner', 'Yes', 'No', NULL),
('FENNER-052B', NULL, 'No', 'Yes', 25, 'No', NULL, NULL, '05:00:00', 52, 'Fenner', 'Yes', 'No', NULL),
('FENNER-052B', NULL, 'No', 'Yes', 26, 'No', NULL, NULL, '06:00:00', 52, 'Fenner', 'Yes', 'No', NULL),
('FENNER-052B', NULL, 'No', 'Yes', 28, 'No', NULL, NULL, '07:00:00', 52, 'Fenner', 'Yes', 'No', NULL),
('FENNER-052B', NULL, 'No', 'Yes', 29, 'No', NULL, NULL, '08:00:00', 52, 'Fenner', 'Yes', 'No', NULL),
('FENNER-052B', NULL, 'No', 'Yes', 30, 'No', NULL, NULL, '09:00:00', 52, 'Fenner', 'Yes', 'No', NULL),
('FENNER-052B', NULL, 'No', 'Yes', 31, 'No', NULL, NULL, '10:00:00', 52, 'Fenner', 'Yes', 'No', NULL),
('FENNER-052B', NULL, 'No', 'Yes', 32, 'No', NULL, NULL, '11:00:00', 52, 'Fenner', 'Yes', 'No', NULL),
('FENNER-052B', NULL, 'No', 'Yes', 33, 'No', NULL, NULL, '12:00:00', 52, 'Fenner', 'Yes', 'No', NULL),
('FENNER-052B', NULL, 'No', 'Yes', 34, 'No', NULL, NULL, '13:00:00', 52, 'Fenner', 'Yes', 'No', NULL),
('FENNER-052B', NULL, 'No', 'Yes', 35, 'No', NULL, NULL, '00:00:00', 52, 'Fenner', 'Yes', 'No', NULL),
('FENNER-052B', NULL, 'No', 'Yes', 36, 'No', NULL, NULL, '15:00:00', 52, 'Fenner', 'Yes', 'No', NULL),
('FENNER-052B', NULL, 'No', 'Yes', 37, 'No', NULL, NULL, '16:00:00', 52, 'Fenner', 'Yes', 'No', NULL),
('FENNER-052B', NULL, 'No', 'Yes', 38, 'No', NULL, NULL, '17:00:00', 52, 'Fenner', 'Yes', 'No', NULL),
('FENNER-052B', NULL, 'No', 'Yes', 39, 'No', NULL, NULL, '18:00:00', 52, 'Fenner', 'Yes', 'No', NULL),
('FENNER-052B', NULL, 'No', 'Yes', 40, 'No', NULL, NULL, '19:00:00', 52, 'Fenner', 'Yes', 'No', NULL),
('FENNER-052B', NULL, 'No', 'Yes', 41, 'No', NULL, NULL, '20:00:00', 52, 'Fenner', 'Yes', 'No', NULL),
('FENNER-052B', NULL, 'No', 'Yes', 42, 'No', NULL, NULL, '21:00:00', 52, 'Fenner', 'Yes', 'No', NULL),
('FENNER-052B', NULL, 'No', 'Yes', 43, 'No', NULL, NULL, '22:00:00', 52, 'Fenner', 'Yes', 'No', NULL),
('FENNER-052B', NULL, 'No', 'Yes', 44, 'No', NULL, NULL, '23:00:00', 52, 'Fenner', 'Yes', 'No', NULL);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
