-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Dec 21, 2020 at 09:56 PM
-- Server version: 5.7.26
-- PHP Version: 7.2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `fivepd`
--

-- --------------------------------------------------------

--
-- Table structure for table `allowlist`
--

DROP TABLE IF EXISTS `allowlist`;
CREATE TABLE IF NOT EXISTS `allowlist` (
  `userID` int(11) NOT NULL,
  UNIQUE KEY `userID` (`userID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `arrestreports`
--

DROP TABLE IF EXISTS `arrestreports`;
CREATE TABLE IF NOT EXISTS `arrestreports` (
  `caseID` varchar(75) COLLATE utf8_bin NOT NULL,
  `userID` int(11) NOT NULL,
  `defendantName` varchar(75) COLLATE utf8_bin NOT NULL,
  `city` varchar(75) COLLATE utf8_bin NOT NULL,
  `street` varchar(75) COLLATE utf8_bin NOT NULL,
  `zip` varchar(75) COLLATE utf8_bin NOT NULL,
  `arrestingOfficer` varchar(75) COLLATE utf8_bin NOT NULL,
  `date` varchar(10) COLLATE utf8_bin NOT NULL COMMENT 'Format DD/MM/YYYY',
  `time` varchar(5) COLLATE utf8_bin NOT NULL COMMENT 'Format HH:MM',
  `factsOfArrest` text COLLATE utf8_bin NOT NULL,
  `signature` text COLLATE utf8_bin NOT NULL COMMENT 'Encoded JSON String',
  `charges` text COLLATE utf8_bin NOT NULL COMMENT 'JSON Array String',
  UNIQUE KEY `caseID` (`caseID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `defaultreports`
--

DROP TABLE IF EXISTS `defaultreports`;
CREATE TABLE IF NOT EXISTS `defaultreports` (
  `caseID` varchar(75) COLLATE utf8_bin NOT NULL,
  `callName` text COLLATE utf8_bin,
  `userID` int(11) DEFAULT NULL,
  `officer` varchar(75) COLLATE utf8_bin DEFAULT NULL,
  `location` varchar(75) COLLATE utf8_bin DEFAULT NULL,
  `date` varchar(10) COLLATE utf8_bin DEFAULT NULL COMMENT 'Fromat - DD/MM/YYYY',
  `time` varchar(5) COLLATE utf8_bin DEFAULT NULL COMMENT 'Format - HH:MM',
  `involved` text COLLATE utf8_bin COMMENT 'JSON Array String',
  `suspects` text COLLATE utf8_bin COMMENT 'JSON Array String',
  `victims` text COLLATE utf8_bin COMMENT 'JSON Array String',
  `report` text COLLATE utf8_bin,
  `signature` text COLLATE utf8_bin COMMENT 'Encoded JSON String',
  UNIQUE KEY `caseID` (`caseID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `departments`
--

DROP TABLE IF EXISTS `departments`;
CREATE TABLE IF NOT EXISTS `departments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(75) COLLATE utf8_bin NOT NULL,
  `shortname` varchar(10) COLLATE utf8_bin NOT NULL,
  `icon` text COLLATE utf8_bin NOT NULL,
  `background` text COLLATE utf8_bin NOT NULL,
  `wallpaper` text COLLATE utf8_bin NOT NULL,
  `requiresApplication` tinyint(1) NOT NULL DEFAULT '0',
  `hiring` tinyint(1) NOT NULL DEFAULT '0',
  `maxMembers` int(11) UNSIGNED NOT NULL DEFAULT '1',
  `callsignFormat` varchar(10) COLLATE utf8_bin NOT NULL DEFAULT '',
  `radius` float NOT NULL DEFAULT '0',
  `posX` float NOT NULL DEFAULT '0',
  `posY` float NOT NULL DEFAULT '0',
  `posZ` float NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `department_members`
--

DROP TABLE IF EXISTS `department_members`;
CREATE TABLE IF NOT EXISTS `department_members` (
  `userID` int(11) NOT NULL,
  `rankID` int(11) NOT NULL,
  `departmentID` int(11) NOT NULL,
  `accepted` tinyint(1) NOT NULL,
  `callsign` varchar(10) COLLATE utf8_bin NOT NULL DEFAULT '',
  UNIQUE KEY `userID` (`userID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

DROP TABLE IF EXISTS `messages`;
CREATE TABLE IF NOT EXISTS `messages` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `receiverID` int(11) NOT NULL,
  `senderID` int(11) NOT NULL,
  `timestamp` int(11) DEFAULT NULL,
  `message` text COLLATE utf8_bin,
  `isRead` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `pedcitations`
--

DROP TABLE IF EXISTS `pedcitations`;
CREATE TABLE IF NOT EXISTS `pedcitations` (
  `citationID` varchar(15) COLLATE utf8_bin NOT NULL,
  `userID` int(11) NOT NULL,
  `name` varchar(150) COLLATE utf8_bin NOT NULL,
  `address` varchar(150) COLLATE utf8_bin DEFAULT NULL,
  `date` varchar(10) COLLATE utf8_bin NOT NULL COMMENT 'dd/mm/yyyy',
  `time` varchar(5) COLLATE utf8_bin NOT NULL COMMENT 'hh:mm',
  `reason` text COLLATE utf8_bin NOT NULL COMMENT 'JSON Array String',
  `location` varchar(75) COLLATE utf8_bin NOT NULL,
  `amount` double NOT NULL,
  `timestamp` int(11) NOT NULL DEFAULT '0' COMMENT 'Record Timestamp',
  UNIQUE KEY `citationID` (`citationID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `ranks`
--

DROP TABLE IF EXISTS `ranks`;
CREATE TABLE IF NOT EXISTS `ranks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `departmentID` int(11) NOT NULL,
  `name` varchar(75) COLLATE utf8_bin NOT NULL COMMENT 'The name of the rank',
  `promoteOnly` tinyint(1) NOT NULL,
  `canPromote` tinyint(1) NOT NULL,
  `canKick` tinyint(1) NOT NULL,
  `canAccept` tinyint(1) NOT NULL,
  `canChangeCallsign` tinyint(1) NOT NULL DEFAULT '0',
  `rankNumber` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

DROP TABLE IF EXISTS `settings`;
CREATE TABLE IF NOT EXISTS `settings` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `userID` int(11) NOT NULL,
  `radiovolume` double NOT NULL DEFAULT '1',
  `emergencyvolume` double NOT NULL DEFAULT '1',
  `language` varchar(2) COLLATE utf8_bin NOT NULL DEFAULT 'en',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `userID` (`userID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `license` varchar(75) COLLATE utf8_bin DEFAULT NULL,
  `gameName` varchar(75) COLLATE utf8_bin DEFAULT NULL,
  `isAdmin` tinyint(1) DEFAULT '0',
  `activated` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `license` (`license`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `vehiclecitations`
--

DROP TABLE IF EXISTS `vehiclecitations`;
CREATE TABLE IF NOT EXISTS `vehiclecitations` (
  `citationID` varchar(15) COLLATE utf8_bin NOT NULL,
  `userID` int(11) NOT NULL,
  `name` varchar(150) COLLATE utf8_bin DEFAULT NULL,
  `address` varchar(150) COLLATE utf8_bin DEFAULT NULL,
  `licenseplate` varchar(15) COLLATE utf8_bin DEFAULT NULL,
  `vehicle` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `date` varchar(10) COLLATE utf8_bin DEFAULT NULL COMMENT 'dd/mm/yyyy',
  `time` varchar(5) COLLATE utf8_bin DEFAULT NULL COMMENT 'hh:mm',
  `reason` text COLLATE utf8_bin COMMENT 'JSON Array String',
  `location` varchar(75) COLLATE utf8_bin DEFAULT NULL,
  `amount` int(11) NOT NULL DEFAULT '0',
  `isPoint` tinyint(1) NOT NULL,
  `timestamp` int(11) NOT NULL DEFAULT '0',
  UNIQUE KEY `citationID` (`citationID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
