-- phpMyAdmin SQL Dump
-- version 4.1.4
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 03. Mai 2014 um 13:52
-- Server Version: 5.6.15-log
-- PHP Version: 5.4.24

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `arma3life`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `gang_players`
--

CREATE TABLE IF NOT EXISTS `gang_players` (
  `gangname` varchar(30) NOT NULL,
  `playerid` varchar(2048) NOT NULL,
  PRIMARY KEY (`gangname`),
  KEY `gangname` (`gangname`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `gang_players`
--


/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
