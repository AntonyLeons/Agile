-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Apr 09, 2019 at 01:54 PM
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
-- Table structure for table `speakers`
--

DROP TABLE IF EXISTS `speakers`;
CREATE TABLE IF NOT EXISTS `speakers` (
  `SpeakerID` int(11) NOT NULL,
  `SocietyID` int(11) NOT NULL,
  `RoomID` int(11) NOT NULL,
  `SpeakerName` text NOT NULL,
  `Affiliation` text NOT NULL,
  `SpeechTopic` text NOT NULL,
  `SpeechDescription` text NOT NULL,
  `PrimKey` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`PrimKey`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `speakers`
--

INSERT INTO `speakers` (`SpeakerID`, `SocietyID`, `RoomID`, `SpeakerName`, `Affiliation`, `SpeechTopic`, `SpeechDescription`, `PrimKey`) VALUES
(1, 333333333, 1, 'Test', 'Test', 'Test', 'Test', 2);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
