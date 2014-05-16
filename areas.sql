-- phpMyAdmin SQL Dump
-- version 4.1.4
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 16. Mai 2014 um 14:28
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
-- Tabellenstruktur für Tabelle `areas`
--

CREATE TABLE IF NOT EXISTS `areas` (
  `area` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`area`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `areas`
--

INSERT INTO `areas` (`area`, `owner`, `name`) VALUES
('gang_1', '', 'Channel 6 News'),
('gang_2', '', 'Syrta'),
('gang_3', '', 'Negades'),
('gang_4', '', 'Kore'),
('gang_5', '', 'Agios Dionysios'),
('gang_6', '', 'Lakka'),
('gang_7', '', 'Alikampos'),
('gang_8', '', 'Poliakko'),
('gang_9', '', 'Katalaki'),
('gang_10', '', 'Therisa'),
('gang_11', '', 'Panochori'),
('gang_12', '', 'Neri'),
('gang_13', '', 'Galati'),
('gang_14', '', 'Frini'),
('gang_15', '', 'Rodopoli'),
('gang_17', '', 'Kalochori'),
('gang_18', '', 'Telos');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
