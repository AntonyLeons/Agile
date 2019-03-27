-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Mar 27, 2019 at 11:23 AM
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
-- Table structure for table `acw`
--

DROP TABLE IF EXISTS `acw`;
CREATE TABLE IF NOT EXISTS `acw` (
  `entryID` int(11) NOT NULL AUTO_INCREMENT,
  `ts` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `StudentID` int(11) NOT NULL,
  `FirstName` varchar(20) NOT NULL,
  `Surname` varchar(20) NOT NULL,
  `Location` varchar(20) NOT NULL,
  `UserType` varchar(7) NOT NULL,
  PRIMARY KEY (`entryID`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `acw`
--

INSERT INTO `acw` (`entryID`, `ts`, `StudentID`, `FirstName`, `Surname`, `Location`, `UserType`) VALUES
(1, '2019-03-26 15:44:34', 3424, 'hi', 'MSSQL', 'MYsql', 'STAFF'),
(2, '2019-03-26 17:17:09', 554538, 'Ant', 'tony', 'hull', 'student'),
(3, '2019-03-26 17:23:51', 28227, 'bvuj', 'hgvbu', 'uybuyb', 'Student');

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
  `Room` varchar(50) DEFAULT NULL,
  `booking_for` timestamp NULL DEFAULT NULL,
  `booking_end` timestamp NULL DEFAULT NULL,
  `Activity` varchar(100) DEFAULT NULL,
  `UserType` varchar(7) NOT NULL,
  PRIMARY KEY (`entryID`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `rooms`
--

INSERT INTO `rooms` (`entryID`, `ts`, `StudentID`, `Society`, `Room`, `booking_for`, `booking_end`, `Activity`, `UserType`) VALUES
(6, '2019-03-27 08:19:17', '0000', 'compsci', 'Wilberforce', '2019-05-17 02:02:00', '2019-05-24 18:00:00', 'dying', 'Staff'),
(7, '2019-03-27 08:20:16', '554538', 'hjbj', 'my room', '2019-03-31 08:09:00', '2019-03-31 09:00:00', 'crying', 'Student'),
(8, '2019-03-27 08:22:43', '554538', 'hjbj', 'my room', '2019-03-31 08:09:00', '2019-03-31 09:00:00', 'crying', 'Student'),
(9, '2019-03-27 08:22:54', '554538', 'hjbj', 'my room', '2019-03-31 08:09:00', '2019-03-31 09:00:00', 'crying', 'Staff'),
(10, '2019-03-27 08:23:12', '554538', 'hjbj', 'my room', '2019-03-31 08:09:00', '2019-03-31 09:00:00', 'crying', 'Staff'),
(11, '2019-03-27 08:23:59', '554538', 'hjbj', 'my room', '2019-03-31 08:09:00', '2019-03-31 09:00:00', 'crying', 'Staff'),
(12, '2019-03-27 08:24:27', '554538', 'hjbj', 'my room', '2019-03-31 08:09:00', '2019-03-31 09:00:00', 'crying', 'Staff'),
(13, '2019-03-27 08:26:30', '554538', 'hjbj', 'my room', '2019-03-31 08:09:00', '2019-03-31 09:00:00', 'crying', 'Staff'),
(14, '2019-03-27 10:07:27', '554538', 'rftgt', 'agile room', '2019-03-02 03:42:00', '2019-03-31 03:34:00', 'sesh', 'Student');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
