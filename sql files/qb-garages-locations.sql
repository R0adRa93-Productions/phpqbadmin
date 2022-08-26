-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 26, 2022 at 08:33 PM
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
-- Table structure for table `qb-garages-locations`
--

CREATE TABLE `qb-garages-locations` (
  `qb-garages-location_id` bigint(20) UNSIGNED NOT NULL,
  `label` varchar(60) NOT NULL,
  `takevehicle` text NOT NULL,
  `spawnvehicle` text NOT NULL,
  `putvehicle` text NOT NULL,
  `showblip` enum('true','false') NOT NULL,
  `blipnumber` int(4) NOT NULL,
  `type` enum('public','depot','gang','police') NOT NULL,
  `vehicle` enum('car','air','sea') NOT NULL,
  `job` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `qb-garages-locations`
--

INSERT INTO `qb-garages-locations` (`qb-garages-location_id`, `label`, `takevehicle`, `spawnvehicle`, `putvehicle`, `showblip`, `blipnumber`, `type`, `vehicle`, `job`) VALUES
(1, 'Motel Parking', 'vector3(273.43, -343.99, 44.91)', 'vector4(270.94, -342.96, 43.97, 161.5)', 'vector3(276.69, -339.85, 44.91)', 'true', 357, 'public', 'car', ''),
(2, 'San Andreas Parking', 'vector3(-330.01, -780.33, 33.96)', 'vector4(-334.44, -780.75, 33.96, 137.5)', 'vector3(-336.31, -774.93, 33.96)', 'true', 357, 'public', 'car', ''),
(3, 'Spanish Ave Parking', 'vector3(-1160.86, -741.41, 19.63)', 'vector4(-1163.88, -749.32, 18.42, 35.5)', 'vector3(-1147.58, -738.11, 19.31)', 'true', 357, 'public', 'car', ''),
(4, 'Caears 24 Parking', 'vector3(69.84, 12.6, 68.96)', 'vector4(73.21, 10.72, 68.83, 163.5)', 'vector3(65.43, 21.19, 69.47)', 'true', 357, 'public', 'car', ''),
(5, 'Caears 24 Parking II', 'vector3(-475.31, -818.73, 30.46)', 'vector4(-472.03, -815.47, 30.5, 177.5)', 'vector3(-453.6, -817.08, 30.61)', 'true', 357, 'public', 'car', ''),
(6, 'Laguna Parking', 'vector3(364.37, 297.83, 103.49)', 'vector4(367.49, 297.71, 103.43, 340.5)', 'vector3(363.04, 283.51, 103.38)', 'true', 357, 'public', 'car', ''),
(7, 'Airport Parking', 'vector3(-796.86, -2024.85, 8.88)', 'vector4(-800.41, -2016.53, 9.32, 48.5)', 'vector3(-804.84, -2023.21, 9.16)', 'true', 357, 'public', 'car', ''),
(8, 'Beach Parking', 'vector3(-1183.1, -1511.11, 4.36)', 'vector4(-1181.0, -1505.98, 4.37, 214.5)', 'vector3(-1176.81, -1498.63, 4.37)', 'true', 357, 'public', 'car', ''),
(9, 'The Motor Hotel Parking', 'vector3(1137.77, 2663.54, 37.9)', 'vector4(1137.69, 2673.61, 37.9, 359.5)', 'vector3(1137.75, 2652.95, 37.9)', 'true', 357, 'public', 'car', ''),
(10, 'Liqour Parking', 'vector3(934.95, 3606.59, 32.81)', 'vector4(941.57, 3619.99, 32.5, 141.5)', 'vector3(939.37, 3612.25, 32.69)', 'true', 357, 'public', 'car', ''),
(11, 'Shore Parking', 'vector3(1726.21, 3707.16, 34.17)', 'vector4(1730.31, 3711.07, 34.2, 20.5)', 'vector3(1737.13, 3718.91, 34.04)', 'true', 357, 'public', 'car', ''),
(12, 'Bell Farms Parking', 'vector3(78.34, 6418.74, 31.28)', 'vector4(70.71, 6425.16, 30.92, 68.5)', 'vector3(85.3, 6427.52, 31.33)', 'true', 357, 'public', 'car', ''),
(13, 'Dumbo Private Parking', 'vector3(157.26, -3240.00, 7.00)', 'vector4(165.32, -3236.10, 5.93, 268.5)', 'vector3(165.32, -3230.00, 5.93)', 'true', 357, 'public', 'car', ''),
(14, 'Pillbox Garage Parking', 'vector3(215.9499, -809.698, 30.731)', 'vector4(234.1942, -787.066, 30.193, 159.6)', 'vector3(218.0894, -781.370, 30.389)', 'true', 357, 'public', 'car', ''),
(15, 'Impound Lot', 'vector3(409.89, -1623.51, 29.29)', 'vector4(407.92, -1646.29, 29.29, 226.39)', '', 'true', 68, 'depot', 'car', ''),
(16, 'Ballas', 'vector3(98.50, -1954.49, 20.84)', 'vector4(98.50, -1954.49, 20.75, 335.73)', 'vector3(94.75, -1959.93, 20.84)', 'false', 357, 'gang', 'car', 'ballas'),
(17, 'La Familia', 'vector3(-811.65, 187.49, 72.48)', 'vector4(-818.43, 184.97, 72.28, 107.85)', 'vector3(-811.65, 187.49, 72.48)', 'false', 357, 'gang', 'car', 'families'),
(18, 'Lost MC', 'vector3(957.25, -129.63, 74.39)', 'vector4(957.25, -129.63, 74.39, 199.21)', 'vector3(950.47, -122.05, 74.36)', 'false', 357, 'gang', 'car', 'lostmc'),
(19, 'Cartel', 'vector3(1407.18, 1118.04, 114.84)', 'vector4(1407.18, 1118.04, 114.84, 88.34)', 'vector3(1407.18, 1118.04, 114.84)', 'false', 357, 'gang', 'car', 'cartel'),
(20, 'Police', 'vector3(454.6, -1017.4, 28.4)', 'vector4(438.4, -1018.3, 27.7, 90.0)', 'vector3(452.88, -1006.98, 27.5)', 'false', 357, 'police', 'car', 'police'),
(21, 'Airport Hangar', 'vector3(-1025.92, -3017.86, 13.95)', 'vector4(-979.2, -2995.51, 13.95, 52.19)', 'vector3(-1003.38, -3008.87, 13.95)', 'true', 360, 'public', 'air', ''),
(22, 'Higgins Helitours', 'vector3(-722.15, -1472.79, 5.0)', 'vector4(-724.83, -1443.89, 5.0, 140.1)', 'vector3(-745.48, -1468.46, 5.0)', 'true', 360, 'public', 'air', ''),
(23, 'Sandy Shores Hangar', 'vector3(1758.19, 3296.66, 41.14)', 'vector4(1740.98, 3279.08, 41.75, 106.77)', 'vector3(1740.4, 3283.92, 41.1)', 'true', 360, 'public', 'air', ''),
(24, 'Air Depot', 'vector3(-1243.29, -3392.3, 13.94)', 'vector4(-1269.67, -3377.74, 13.94, 327.88)', '', 'true', 359, 'depot', 'air', ''),
(25, 'LSYMC Boathouse', 'vector3(-794.66, -1510.83, 1.59)', 'vector4(-793.58, -1501.4, 0.12, 111.5)', 'vector3(-793.58, -1501.4, 0.12)', 'true', 356, 'public', 'sea', ''),
(26, 'Paleto Boathouse', 'vector3(-277.46, 6637.2, 7.48)', 'vector4(-289.2, 6637.96, 1.01, 45.5)', 'vector3(-289.2, 6637.96, 1.01)', 'true', 356, 'public', 'sea', ''),
(27, 'Millars Boathouse', 'vector3(1299.24, 4216.69, 33.9)', 'vector4(1297.82, 4209.61, 30.12, 253.5)', 'vector3(1297.82, 4209.61, 30.12)', 'true', 356, 'public', 'sea', ''),
(28, 'LSYMC Depot', 'vector3(-772.98, -1430.76, 1.59)', 'vector4(-729.77, -1355.49, 1.19, 142.5)', '', 'true', 356, 'depot', 'sea', '');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `qb-garages-locations`
--
ALTER TABLE `qb-garages-locations`
  ADD PRIMARY KEY (`qb-garages-location_id`),
  ADD UNIQUE KEY `label` (`label`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `qb-garages-locations`
--
ALTER TABLE `qb-garages-locations`
  MODIFY `qb-garages-location_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
