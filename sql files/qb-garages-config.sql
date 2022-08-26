-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 26, 2022 at 08:29 AM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `phpqbadmin`
--

-- --------------------------------------------------------

--
-- Table structure for table `qb-garages-config`
--

CREATE TABLE `qb-garages-config` (
  `qb-garages-config-id` tinyint(4) UNSIGNED NOT NULL,
  `autorespawn` enum('true','false') NOT NULL,
  `sharedgarages` enum('true','false') NOT NULL,
  `visuallydamagecars` enum('true','false') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `qb-garages-config`
--

INSERT INTO `qb-garages-config` (`qb-garages-config-id`, `autorespawn`, `sharedgarages`, `visuallydamagecars`) VALUES
(1, 'false', 'false', 'true');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `qb-garages-config`
--
ALTER TABLE `qb-garages-config`
  ADD PRIMARY KEY (`qb-garages-config-id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `qb-garages-config`
--
ALTER TABLE `qb-garages-config`
  MODIFY `qb-garages-config-id` tinyint(4) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
