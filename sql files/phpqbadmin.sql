-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 15, 2022 at 12:29 PM
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
CREATE DATABASE IF NOT EXISTS `phpqbadmin` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `phpqbadmin`;

-- --------------------------------------------------------

--
-- Table structure for table `qb-core-shared-items`
--

CREATE TABLE `qb-core-shared-items` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` text NOT NULL,
  `label` text NOT NULL,
  `weight` int(11) NOT NULL,
  `type` enum('weapon','item') NOT NULL DEFAULT 'item',
  `image` text NOT NULL,
  `itemunique` enum('true','false') NOT NULL,
  `useable` enum('true','false') NOT NULL,
  `shouldClose` enum('true','false') NOT NULL,
  `combinable` text NOT NULL,
  `description` text NOT NULL,
  `expire` int(11) DEFAULT NULL,
  `enabled` enum('true','false') NOT NULL DEFAULT 'true'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `qb-core-shared-items`
--

INSERT INTO `qb-core-shared-items` (`id`, `name`, `label`, `weight`, `type`, `image`, `itemunique`, `useable`, `shouldClose`, `combinable`, `description`, `expire`, `enabled`) VALUES
(1, 'pistol_ammo', 'Pistol ammo', 200, 'item', 'pistol_ammo.png', 'false', 'true', 'true', 'nil', 'Ammo for Pistols', NULL, 'true'),
(2, 'rifle_ammo', 'Rifle ammo', 1000, 'item', 'rifle_ammo.png', 'false', 'true', 'true', 'nil', 'Ammo for Rifles', NULL, 'true'),
(3, 'smg_ammo', 'SMG ammo', 500, 'item', 'smg_ammo.png', 'false', 'true', 'true', 'nil', 'Ammo for Sub Machine Guns', NULL, 'true'),
(4, 'shotgun_ammo', 'Shotgun ammo', 500, 'item', 'shotgun_ammo.png', 'false', 'true', 'true', 'nil', 'Ammo for Shotguns', NULL, 'true'),
(5, 'mg_ammo', 'MG ammo', 1000, 'item', 'mg_ammo.png', 'false', 'true', 'true', 'nil', 'Ammo for Machine Guns', NULL, 'true'),
(6, 'snp_ammo', 'Sniper ammo', 1000, 'item', 'rifle_ammo.png', 'false', 'true', 'true', 'nil', 'Ammo for Sniper Rifles', NULL, 'true'),
(7, 'emp_ammo', 'EMP Ammo', 200, 'item', 'emp_ammo.png', 'false', 'true', 'true', 'nil', 'Ammo for EMP Launcher', NULL, 'true'),
(8, 'id_card', 'ID Card', 0, 'item', 'id_card.png', 'true', 'true', 'false', 'nil', 'A card containing all your information to identify yourself', NULL, 'true'),
(9, 'driver_license', 'Drivers License', 0, 'item', 'driver_license.png', 'true', 'true', 'false', 'nil', 'Permit to show you can drive a vehicle', NULL, 'true'),
(10, 'lawyerpass', 'Lawyer Pass', 0, 'item', 'lawyerpass.png', 'true', 'true', 'false', 'nil', 'Pass exclusive to lawyers to show they can represent a suspect', NULL, 'true'),
(11, 'weaponlicense', 'Weapon License', 0, 'item', 'weapon_license.png', 'true', 'true', 'true', 'nil', 'Weapon License', NULL, 'true'),
(12, 'visa', 'Visa Card', 0, 'item', 'visacard.png', 'true', 'true', 'false', 'nil', 'Visa can be used via ATM', NULL, 'true'),
(13, 'mastercard', 'Master Card', 0, 'item', 'mastercard.png', 'true', 'true', 'false', 'nil', 'MasterCard can be used via ATM', NULL, 'true'),
(14, 'security_card_01', 'Security Card A', 0, 'item', 'security_card_01.png', 'false', 'true', 'true', 'nil', 'A security card... I wonder what it goes to', NULL, 'true'),
(15, 'security_card_02', 'Security Card B', 0, 'item', 'security_card_02.png', 'false', 'true', 'true', 'nil', 'A security card... I wonder what it goes to', NULL, 'true'),
(16, 'tosti', 'Grilled Cheese Sandwich', 200, 'item', 'tosti.png', 'false', 'true', 'true', 'nil', 'Nice to eat', NULL, 'true'),
(17, 'twerks_candy', 'Twerks', 100, 'item', 'twerks_candy.png', 'false', 'true', 'true', 'nil', 'Some delicious candy :O', NULL, 'true'),
(18, 'snikkel_candy', 'Snikkel', 100, 'item', 'snikkel_candy.png', 'false', 'true', 'true', 'nil', 'Some delicious candy :O', NULL, 'true'),
(19, 'sandwich', 'Sandwich', 200, 'item', 'sandwich.png', 'false', 'true', 'true', 'nil', 'Nice bread for your stomach', NULL, 'true'),
(20, 'water_bottle', 'Bottle of Water', 500, 'item', 'water_bottle.png', 'false', 'true', 'true', 'nil', 'For all the thirsty out there', NULL, 'true'),
(21, 'coffee', 'Coffee', 200, 'item', 'coffee.png', 'false', 'true', 'true', 'nil', 'Pump 4 Caffeine', NULL, 'true'),
(22, 'kurkakola', 'Cola', 500, 'item', 'cola.png', 'false', 'true', 'true', 'nil', 'For all the thirsty out there', NULL, 'true'),
(23, 'beer', 'Beer', 500, 'item', 'beer.png', 'false', 'true', 'true', 'nil', 'Nothing like a good cold beer!', NULL, 'true'),
(24, 'whiskey', 'Whiskey', 500, 'item', 'whiskey.png', 'false', 'true', 'true', 'nil', 'For all the thirsty out there', NULL, 'true'),
(25, 'vodka', 'Vodka', 500, 'item', 'vodka.png', 'false', 'true', 'true', 'nil', 'For all the thirsty out there', NULL, 'true'),
(26, 'grape', 'Grape', 100, 'item', 'grape.png', 'false', 'true', 'false', 'nil', 'Mmmmh yummie grapes', NULL, 'true'),
(27, 'wine', 'Wine', 300, 'item', 'wine.png', 'false', 'true', 'false', 'nil', 'Some good wine to drink on a fine evening', NULL, 'true'),
(28, 'grapejuice', 'Grape Juice', 200, 'item', 'grapejuice.png', 'false', 'true', 'false', 'nil', 'Grape juice is said to be healthy', NULL, 'true'),
(29, 'joint', 'Joint', 0, 'item', 'joint.png', 'false', 'true', 'true', 'nil', 'Sidney would be very proud at you', NULL, 'true'),
(30, 'cokebaggy', 'Bag of Coke', 0, 'item', 'cocaine_baggy.png', 'false', 'true', 'true', 'nil', 'To get happy real quick', NULL, 'true'),
(31, 'crack_baggy', 'Bag of Crack', 0, 'item', 'crack_baggy.png', 'false', 'true', 'true', 'nil', 'To get happy faster', NULL, 'true'),
(32, 'xtcbaggy', 'Bag of XTC', 0, 'item', 'xtc_baggy.png', 'false', 'true', 'true', 'nil', 'Pop those pills baby', NULL, 'true'),
(33, 'weed_brick', 'Weed Brick', 1000, 'item', 'weed_brick.png', 'false', 'false', 'true', 'nil', '1KG Weed Brick to sell to large customers.', NULL, 'true'),
(34, 'coke_brick', 'Coke Brick', 1000, 'item', 'coke_brick.png', 'true', 'false', 'true', 'nil', 'Heavy package of cocaine mostly used for deals and takes a lot of space', NULL, 'true'),
(35, 'coke_small_brick', 'Coke Package', 350, 'item', 'coke_small_brick.png', 'true', 'false', 'true', 'nil', 'Small package of cocaine mostly used for deals and takes a lot of space', NULL, 'true'),
(36, 'oxy', 'Prescription Oxy', 0, 'item', 'oxy.png', 'false', 'true', 'true', 'nil', 'The Label Has Been Ripped Off', NULL, 'true'),
(37, 'meth', 'Meth', 100, 'item', 'meth_baggy.png', 'false', 'true', 'true', 'nil', 'A baggie of Meth', NULL, 'true'),
(38, 'rolling_paper', 'Rolling Paper', 0, 'item', 'rolling_paper.png', 'false', 'false', 'true', '{accept = {\'weed_white-widow\', \'weed_skunk\', \'weed_purple-haze\', \'weed_og-kush\', \'weed_amnesia\', \'weed_ak47\'}, reward = \'joint\', anim = {[\'dict\'] = \'anim@amb@business@weed@weed_inspecting_high_dry@\', [\'lib\'] = \'weed_inspecting_high_base_inspector\', [\'text\'] = \'Rolling joint\', [\'timeOut\'] = 5000,}}', 'Paper made specifically for encasing and smoking tobacco or cannabis.', NULL, 'true'),
(39, 'weed_white-widow', 'White Widow 2g', 200, 'item', 'weed_baggy.png', 'false', 'true', 'false', 'nil', 'A weed bag with 2g White Widow', NULL, 'true'),
(40, 'weed_skunk', 'Skunk 2g', 200, 'item', 'weed_baggy.png', 'false', 'true', 'false', 'nil', 'A weed bag with 2g Skunk', NULL, 'true'),
(41, 'weed_purple-haze', 'Purple Haze 2g', 200, 'item', 'weed_baggy.png', 'false', 'true', 'false', 'nil', 'A weed bag with 2g Purple Haze', NULL, 'true'),
(42, 'weed_og-kush', 'OGKush 2g', 200, 'item', 'weed_baggy.png', 'false', 'true', 'false', 'nil', 'A weed bag with 2g OG Kush', NULL, 'true'),
(43, 'weed_amnesia', 'Amnesia 2g', 200, 'item', 'weed_baggy.png', 'false', 'true', 'false', 'nil', 'A weed bag with 2g Amnesia', NULL, 'true'),
(44, 'weed_ak47', 'AK47 2g', 200, 'item', 'weed_baggy.png', 'false', 'true', 'false', 'nil', 'A weed bag with 2g AK47', NULL, 'true'),
(45, 'weed_white-widow_seed', 'White Widow Seed', 0, 'item', 'weed_seed.png', 'false', 'true', 'false', 'nil', 'A weed seed of White Widow', NULL, 'true'),
(46, 'weed_skunk_seed', 'Skunk Seed', 0, 'item', 'weed_seed.png', 'false', 'true', 'true', 'nil', 'A weed seed of Skunk', NULL, 'true'),
(47, 'weed_purple-haze_seed', 'Purple Haze Seed', 0, 'item', 'weed_seed.png', 'false', 'true', 'true', 'nil', 'A weed seed of Purple Haze', NULL, 'true'),
(48, 'weed_og-kush_seed', 'OGKush Seed', 0, 'item', 'weed_seed.png', 'false', 'true', 'true', 'nil', 'A weed seed of OG Kush', NULL, 'true'),
(49, 'weed_amnesia_seed', 'Amnesia Seed', 0, 'item', 'weed_seed.png', 'false', 'true', 'true', 'nil', 'A weed seed of Amnesia', NULL, 'true'),
(50, 'weed_ak47_seed', 'AK47 Seed', 0, 'item', 'weed_seed.png', 'false', 'true', 'true', 'nil', 'A weed seed of AK47', NULL, 'true'),
(51, 'empty_weed_bag', 'Empty Weed Bag', 0, 'item', 'weed_baggy_empty.png', 'false', 'true', 'true', 'nil', 'A small empty bag', NULL, 'true'),
(52, 'weed_nutrition', 'Plant Fertilizer', 2000, 'item', 'weed_nutrition.png', 'false', 'true', 'true', 'nil', 'Plant nutrition', NULL, 'true'),
(53, 'plastic', 'Plastic', 100, 'item', 'plastic.png', 'false', 'false', 'false', 'nil', 'RECYCLE! - Greta Thunberg 2019', NULL, 'true'),
(54, 'metalscrap', 'Metal Scrap', 100, 'item', 'metalscrap.png', 'false', 'false', 'false', 'nil', 'You can probably make something nice out of this', NULL, 'true'),
(55, 'copper', 'Copper', 100, 'item', 'copper.png', 'false', 'false', 'false', 'nil', 'Nice piece of metal that you can probably use for something', NULL, 'true'),
(56, 'aluminum', 'Aluminium', 100, 'item', 'aluminum.png', 'false', 'false', 'false', 'nil', 'Nice piece of metal that you can probably use for something', NULL, 'true'),
(57, 'aluminumoxide', 'Aluminium Powder', 100, 'item', 'aluminumoxide.png', 'false', 'false', 'false', 'nil', 'Some powder to mix with', NULL, 'true'),
(58, 'iron', 'Iron', 100, 'item', 'iron.png', 'false', 'false', 'false', 'nil', 'Handy piece of metal that you can probably use for something', NULL, 'true'),
(59, 'ironoxide', 'Iron Powder', 100, 'item', 'ironoxide.png', 'false', 'false', 'false', '{accept = {\'aluminumoxide\'}, reward = \'thermite\', anim = {[\'dict\'] = \'anim@amb@business@weed@weed_inspecting_high_dry@\', [\'lib\'] = \'weed_inspecting_high_base_inspector\', [\'text\'] = \'Mixing powder..\', [\'timeOut\'] = 10000}}', 'Some powder to mix with.', NULL, 'true'),
(60, 'steel', 'Steel', 100, 'item', 'steel.png', 'false', 'false', 'false', 'nil', 'Nice piece of metal that you can probably use for something', NULL, 'true'),
(61, 'rubber', 'Rubber', 100, 'item', 'rubber.png', 'false', 'false', 'false', 'nil', 'Rubber I believe you can make your own rubber ducky with it :D', NULL, 'true'),
(62, 'glass', 'Glass', 100, 'item', 'glass.png', 'false', 'false', 'false', 'nil', 'It is very fragile watch out', NULL, 'true'),
(63, 'lockpick', 'Lockpick', 300, 'item', 'lockpick.png', 'false', 'true', 'true', '{accept = {\'screwdriverset\'}, reward = \'advancedlockpick\', anim = {[\'dict\'] = \'anim@amb@business@weed@weed_inspecting_high_dry@\', [\'lib\'] = \'weed_inspecting_high_base_inspector\', [\'text\'] = \'Crafting lockpick\', [\'timeOut\'] = 7500,}}', 'Very useful if you lose your keys a lot.. or if you want to use it for something else...', NULL, 'true'),
(64, 'advancedlockpick', 'Advanced Lockpick', 500, 'item', 'advancedlockpick.png', 'false', 'true', 'true', 'nil', 'If you lose your keys a lot this is very useful... Also useful to open your beers', NULL, 'true'),
(65, 'electronickit', 'Electronic Kit', 100, 'item', 'electronickit.png', 'false', 'true', 'true', '{accept = {\'gatecrack\'}, reward = \'trojan_usb\', anim = nil}', 'If you\'ve always wanted to build a robot you can maybe start here. Maybe you\'ll be the new Elon Musk?', NULL, 'true'),
(66, 'gatecrack', 'Gatecrack', 0, 'item', 'usb_device.png', 'false', 'false', 'true', 'nil', 'Handy software to tear down some fences', NULL, 'true'),
(67, 'thermite', 'Thermite', 1000, 'item', 'thermite.png', 'false', 'true', 'true', 'nil', 'Sometimes you\'d wish for everything to burn', NULL, 'true'),
(68, 'trojan_usb', 'Trojan USB', 0, 'item', 'usb_device.png', 'false', 'false', 'true', 'nil', 'Handy software to shut down some systems', NULL, 'true'),
(69, 'screwdriverset', 'Toolkit', 1000, 'item', 'screwdriverset.png', 'false', 'false', 'false', 'nil', 'Very useful to screw... screws...', NULL, 'true'),
(70, 'drill', 'Drill', 20000, 'item', 'drill.png', 'false', 'false', 'false', 'nil', 'The real deal...', NULL, 'true'),
(71, 'nitrous', 'Nitrous', 1000, 'item', 'nitrous.png', 'false', 'true', 'true', 'nil', 'Speed up gas pedal! :D', NULL, 'true'),
(72, 'repairkit', 'Repairkit', 2500, 'item', 'repairkit.png', 'false', 'true', 'true', 'nil', 'A nice toolbox with stuff to repair your vehicle', NULL, 'true'),
(73, 'advancedrepairkit', 'Advanced Repairkit', 4000, 'item', 'advancedkit.png', 'false', 'true', 'true', 'nil', 'A nice toolbox with stuff to repair your vehicle', NULL, 'true'),
(74, 'cleaningkit', 'Cleaning Kit', 250, 'item', 'cleaningkit.png', 'false', 'true', 'true', 'nil', 'A microfiber cloth with some soap will let your car sparkle again!', NULL, 'true'),
(75, 'tunerlaptop', 'Tunerchip', 2000, 'item', 'tunerchip.png', 'true', 'true', 'true', 'nil', 'With this tunerchip you can get your car on steroids... If you know what you\'re doing', NULL, 'true'),
(76, 'harness', 'Race Harness', 1000, 'item', 'harness.png', 'true', 'true', 'true', 'nil', 'Racing Harness so no matter what you stay in the car', NULL, 'true'),
(77, 'jerry_can', 'Jerrycan 20L', 20000, 'item', 'jerry_can.png', 'false', 'true', 'true', 'nil', 'A can full of Fuel', NULL, 'true'),
(78, 'firstaid', 'First Aid', 2500, 'item', 'firstaid.png', 'false', 'true', 'true', 'nil', 'You can use this First Aid kit to get people back on their feet', NULL, 'true'),
(79, 'bandage', 'Bandage', 0, 'item', 'bandage.png', 'false', 'true', 'true', 'nil', 'A bandage works every time', NULL, 'true'),
(80, 'ifaks', 'ifaks', 200, 'item', 'ifaks.png', 'false', 'true', 'true', 'nil', 'ifaks for healing and a complete stress remover.', NULL, 'true'),
(81, 'painkillers', 'Painkillers', 0, 'item', 'painkillers.png', 'false', 'true', 'true', 'nil', 'For pain you can\'t stand anymore take this pill that\'d make you feel great again', NULL, 'true'),
(82, 'walkstick', 'Walking Stick', 1000, 'item', 'walkstick.png', 'false', 'true', 'true', 'nil', 'Walking stick for ya\'ll grannies out there.. HAHA', NULL, 'true'),
(83, 'phone', 'Phone', 700, 'item', 'phone.png', 'true', 'false', 'false', 'nil', 'Neat phone ya got there', NULL, 'true'),
(84, 'radio', 'Radio', 2000, 'item', 'radio.png', 'true', 'true', 'true', 'nil', 'You can communicate with this through a signal', NULL, 'true'),
(85, 'iphone', 'iPhone', 1000, 'item', 'iphone.png', 'false', 'false', 'true', 'nil', 'Very expensive phone', NULL, 'true'),
(86, 'samsungphone', 'Samsung S10', 1000, 'item', 'samsungphone.png', 'false', 'false', 'true', 'nil', 'Very expensive phone', NULL, 'true'),
(87, 'laptop', 'Laptop', 4000, 'item', 'laptop.png', 'false', 'false', 'true', 'nil', 'Expensive laptop', NULL, 'true'),
(88, 'tablet', 'Tablet', 2000, 'item', 'tablet.png', 'false', 'false', 'true', 'nil', 'Expensive tablet', NULL, 'true'),
(89, 'fitbit', 'Fitbit', 500, 'item', 'fitbit.png', 'true', 'true', 'true', 'nil', 'I like fitbit', NULL, 'true'),
(90, 'radioscanner', 'Radio Scanner', 1000, 'item', 'radioscanner.png', 'false', 'false', 'true', 'nil', 'With this you can get some police alerts. Not 100% effective however', NULL, 'true'),
(91, 'pinger', 'Pinger', 1000, 'item', 'pinger.png', 'false', 'false', 'true', 'nil', 'With a pinger and your phone you can send out your location', NULL, 'true'),
(92, 'cryptostick', 'Crypto Stick', 200, 'item', 'cryptostick.png', 'true', 'true', 'true', 'nil', 'Why would someone ever buy money that doesn\'t exist.. How many would it contain..?', NULL, 'true'),
(93, 'rolex', 'Golden Watch', 1500, 'item', 'rolex.png', 'false', 'false', 'true', 'nil', 'A golden watch seems like the jackpot to me!', NULL, 'true'),
(94, 'diamond_ring', 'Diamond Ring', 1500, 'item', 'diamond_ring.png', 'false', 'false', 'true', 'nil', 'A diamond ring seems like the jackpot to me!', NULL, 'true'),
(95, 'diamond', 'Diamond', 1000, 'item', 'diamond.png', 'false', 'false', 'true', 'nil', 'A diamond seems like the jackpot to me!', NULL, 'true'),
(96, 'goldchain', 'Golden Chain', 1500, 'item', 'goldchain.png', 'false', 'false', 'true', 'nil', 'A golden chain seems like the jackpot to me!', NULL, 'true'),
(97, '10kgoldchain', '10k Gold Chain', 2000, 'item', '10kgoldchain.png', 'false', 'false', 'true', 'nil', '10 carat golden chain', NULL, 'true'),
(98, 'goldbar', 'Gold Bar', 7000, 'item', 'goldbar.png', 'false', 'false', 'true', 'nil', 'Looks pretty expensive to me', NULL, 'true'),
(99, 'armor', 'Armor', 5000, 'item', 'armor.png', 'false', 'true', 'true', 'nil', 'Some protection won\'t hurt... right?', NULL, 'true'),
(100, 'heavyarmor', 'Heavy Armor', 5000, 'item', 'armor.png', 'false', 'true', 'true', 'nil', 'Some protection won\'t hurt... right?', NULL, 'true'),
(101, 'handcuffs', 'Handcuffs', 100, 'item', 'handcuffs.png', 'false', 'true', 'true', 'nil', 'Comes in handy when people misbehave. Maybe it can be used for something else?', NULL, 'true'),
(102, 'police_stormram', 'Stormram', 18000, 'item', 'police_stormram.png', 'false', 'true', 'true', 'nil', 'A nice tool to break into doors', NULL, 'true'),
(103, 'empty_evidence_bag', 'Empty Evidence Bag', 0, 'item', 'evidence.png', 'false', 'false', 'false', 'nil', 'Used a lot to keep DNA from blood bullet shells and more', NULL, 'true'),
(104, 'filled_evidence_bag', 'Evidence Bag', 200, 'item', 'evidence.png', 'true', 'false', 'false', 'nil', 'A filled evidence bag to see who committed the crime >:(', NULL, 'true'),
(105, 'firework1', '2Brothers', 1000, 'item', 'firework1.png', 'false', 'true', 'true', 'nil', 'Fireworks', NULL, 'true'),
(106, 'firework2', 'Poppelers', 1000, 'item', 'firework2.png', 'false', 'true', 'true', 'nil', 'Fireworks', NULL, 'true'),
(107, 'firework3', 'WipeOut', 1000, 'item', 'firework3.png', 'false', 'true', 'true', 'nil', 'Fireworks', NULL, 'true'),
(108, 'firework4', 'Weeping Willow', 1000, 'item', 'firework4.png', 'false', 'true', 'true', 'nil', 'Fireworks', NULL, 'true'),
(109, 'dendrogyra_coral', 'Dendrogyra', 1000, 'item', 'dendrogyra_coral.png', 'false', 'false', 'true', 'nil', 'Its also known as pillar coral', NULL, 'true'),
(110, 'antipatharia_coral', 'Antipatharia', 1000, 'item', 'antipatharia_coral.png', 'false', 'false', 'true', 'nil', 'Its also known as black corals or thorn corals', NULL, 'true'),
(111, 'diving_gear', 'Diving Gear', 30000, 'item', 'diving_gear.png', 'true', 'true', 'true', 'nil', 'An oxygen tank and a rebreather', NULL, 'true'),
(112, 'diving_fill', 'Diving Tube', 3000, 'item', 'diving_tube.png', 'true', 'true', 'true', 'nil', 'An oxygen tube and a rebreather', NULL, 'true'),
(113, 'casinochips', 'Casino Chips', 0, 'item', 'casinochips.png', 'false', 'false', 'false', 'nil', 'Chips For Casino Gambling', NULL, 'true'),
(114, 'stickynote', 'Sticky note', 0, 'item', 'stickynote.png', 'true', 'false', 'false', 'nil', 'Sometimes handy to remember something :)', NULL, 'true'),
(115, 'moneybag', 'Money Bag', 0, 'item', 'moneybag.png', 'true', 'true', 'true', 'nil', 'A bag with cash', NULL, 'true'),
(116, 'parachute', 'Parachute', 30000, 'item', 'parachute.png', 'true', 'true', 'true', 'nil', 'The sky is the limit! Woohoo!', NULL, 'true'),
(117, 'binoculars', 'Binoculars', 600, 'item', 'binoculars.png', 'false', 'true', 'true', 'nil', 'Sneaky Breaky...', NULL, 'true'),
(118, 'lighter', 'Lighter', 0, 'item', 'lighter.png', 'false', 'false', 'true', 'nil', 'On new years eve a nice fire to stand next to', NULL, 'true'),
(119, 'certificate', 'Certificate', 0, 'item', 'certificate.png', 'false', 'false', 'true', 'nil', 'Certificate that proves you own certain stuff', NULL, 'true'),
(120, 'markedbills', 'Marked Money', 1000, 'item', 'markedbills.png', 'true', 'false', 'true', 'nil', 'Money?', NULL, 'true'),
(121, 'labkey', 'Key', 500, 'item', 'labkey.png', 'true', 'true', 'true', 'nil', 'Key for a lock...?', NULL, 'true'),
(122, 'printerdocument', 'Document', 500, 'item', 'printerdocument.png', 'true', 'true', 'true', 'nil', 'A nice document', NULL, 'true');

-- --------------------------------------------------------

--
-- Table structure for table `qb-core-shared-items-weapons`
--

CREATE TABLE `qb-core-shared-items-weapons` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` text NOT NULL,
  `label` text NOT NULL,
  `weight` int(11) NOT NULL,
  `type` enum('item','weapon') NOT NULL DEFAULT 'weapon',
  `ammotype` text NOT NULL,
  `image` text NOT NULL,
  `itemunique` enum('true','false') NOT NULL,
  `useable` enum('true','false') NOT NULL,
  `description` text NOT NULL,
  `enabled` enum('true','false') NOT NULL DEFAULT 'true'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `qb-core-shared-items-weapons`
--

INSERT INTO `qb-core-shared-items-weapons` (`id`, `name`, `label`, `weight`, `type`, `ammotype`, `image`, `itemunique`, `useable`, `description`, `enabled`) VALUES
(1, 'weapon_unarmed', 'Fists', 1000, 'weapon', 'nil', 'placeholder.png', 'true', 'false', 'Fisticuffs', 'true'),
(2, 'weapon_dagger', 'Dagger', 1000, 'weapon', 'nil', 'weapon_dagger.png', 'true', 'false', 'A short knife with a pointed and edged blade, used as a weapon', 'true'),
(3, 'weapon_bat', 'Bat', 1000, 'weapon', 'nil', 'weapon_bat.png', 'true', 'false', 'Used for hitting a ball in sports (or other things)', 'true'),
(4, 'weapon_bottle', 'Broken Bottle', 1000, 'weapon', 'nil', 'weapon_bottle.png', 'true', 'false', 'A broken bottle', 'true'),
(5, 'weapon_crowbar', 'Crowbar', 1000, 'weapon', 'nil', 'weapon_crowbar.png', 'true', 'false', 'An iron bar with a flattened end, used as a lever', 'true'),
(6, 'weapon_flashlight', 'Flashlight', 1000, 'weapon', 'nil', 'weapon_flashlight.png', 'true', 'false', 'A battery-operated portable light', 'true'),
(7, 'weapon_golfclub', 'Golfclub', 1000, 'weapon', 'nil', 'weapon_golfclub.png', 'true', 'false', 'A club used to hit the ball in golf', 'true'),
(8, 'weapon_hammer', 'Hammer', 1000, 'weapon', 'nil', 'weapon_hammer.png', 'true', 'false', 'Used for jobs such as breaking things (legs) and driving in nails', 'true'),
(9, 'weapon_hatchet', 'Hatchet', 1000, 'weapon', 'nil', 'weapon_hatchet.png', 'true', 'false', 'A small axe with a short handle for use in one hand', 'true'),
(10, 'weapon_knuckle', 'Knuckle', 1000, 'weapon', 'nil', 'weapon_knuckle.png', 'true', 'false', 'A metal guard worn over the knuckles in fighting, especially to increase the effect of the blows', 'true'),
(11, 'weapon_knife', 'Knife', 1000, 'weapon', 'nil', 'weapon_knife.png', 'true', 'false', 'An instrument composed of a blade fixed into a handle, used for cutting or as a weapon', 'true'),
(12, 'weapon_machete', 'Machete', 1000, 'weapon', 'nil', 'weapon_machete.png', 'true', 'false', 'A broad heavy knife used as a weapon', 'true'),
(13, 'weapon_switchblade', 'Switchblade', 1000, 'weapon', 'nil', 'weapon_switchblade.png', 'true', 'false', 'A knife with a blade that springs out from the handle when a button is pressed', 'true'),
(14, 'weapon_nightstick', 'Nightstick', 1000, 'weapon', 'nil', 'weapon_nightstick.png', 'true', 'false', 'A police officer\'s club or billy', 'true'),
(15, 'weapon_wrench', 'Wrench', 1000, 'weapon', 'nil', 'weapon_wrench.png', 'true', 'false', 'A tool used for gripping and turning nuts, bolts, pipes, etc', 'true'),
(16, 'weapon_battleaxe', 'Battle Axe', 1000, 'weapon', 'nil', 'weapon_battleaxe.png', 'true', 'false', 'A large broad-bladed axe used in ancient warfare', 'true'),
(17, 'weapon_poolcue', 'Poolcue', 1000, 'weapon', 'nil', 'weapon_poolcue.png', 'true', 'false', 'A stick used to strike a ball, usually the cue ball (or other things)', 'true'),
(18, 'weapon_briefcase', 'Briefcase', 1000, 'weapon', 'nil', 'weapon_briefcase.png', 'true', 'false', 'A briefcase for storing important documents', 'true'),
(19, 'weapon_briefcase_02', 'Suitcase', 1000, 'weapon', 'nil', 'weapon_briefcase2.png', 'true', 'false', 'Wonderfull for nice vacation to Liberty City', 'true'),
(20, 'weapon_garbagebag', 'Garbage Bag', 1000, 'weapon', 'nil', 'weapon_garbagebag.png', 'true', 'false', 'A garbage bag', 'true'),
(21, 'weapon_handcuffs', 'Handcuffs', 1000, 'weapon', 'nil', 'weapon_handcuffs.png', 'true', 'false', 'A pair of lockable linked metal rings for securing a prisoner\'s wrists', 'true'),
(22, 'weapon_bread', 'Baquette', 1000, 'weapon', 'nil', 'baquette.png', 'true', 'false', 'Bread...?', 'true'),
(23, 'weapon_stone_hatchet', 'Stone Hatchet', 1000, 'weapon', 'nil', 'weapon_stone_hatchet.png', 'true', 'true', 'Stone ax', 'true'),
(24, 'weapon_pistol', 'Walther P99', 1000, 'weapon', 'AMMO_PISTOL', 'weapon_pistol.png', 'true', 'false', 'A small firearm designed to be held in one hand', 'true'),
(25, 'weapon_pistol_mk2', 'Pistol Mk II', 1000, 'weapon', 'AMMO_PISTOL', 'weapon_pistol_mk2.png', 'true', 'false', 'An upgraded small firearm designed to be held in one hand', 'true'),
(26, 'weapon_combatpistol', 'Combat Pistol', 1000, 'weapon', 'AMMO_PISTOL', 'weapon_combatpistol.png', 'true', 'false', 'A combat version small firearm designed to be held in one hand', 'true'),
(27, 'weapon_appistol', 'AP Pistol', 1000, 'weapon', 'AMMO_PISTOL', 'weapon_appistol.png', 'true', 'false', 'A small firearm designed to be held in one hand that is automatic', 'true'),
(28, 'weapon_stungun', 'Taser', 1000, 'weapon', 'nil', 'weapon_stungun.png', 'true', 'false', 'A weapon firing barbs attached by wires to batteries, causing temporary paralysis', 'true'),
(29, 'weapon_pistol50', 'Pistol .50', 1000, 'weapon', 'AMMO_PISTOL', 'weapon_pistol50.png', 'true', 'false', 'A .50 caliber firearm designed to be held with both hands', 'true'),
(30, 'weapon_snspistol', 'SNS Pistol', 1000, 'weapon', 'AMMO_PISTOL', 'weapon_snspistol.png', 'true', 'false', 'A very small firearm designed to be easily concealed', 'true'),
(31, 'weapon_heavypistol', 'Heavy Pistol', 1000, 'weapon', 'AMMO_PISTOL', 'weapon_heavypistol.png', 'true', 'false', 'A hefty firearm designed to be held in one hand (or attempted)', 'true'),
(32, 'weapon_vintagepistol', 'Vintage Pistol', 1000, 'weapon', 'AMMO_PISTOL', 'weapon_vintagepistol.png', 'true', 'false', 'An antique firearm designed to be held in one hand', 'true'),
(33, 'weapon_flaregun', 'Flare Gun', 1000, 'weapon', 'AMMO_FLARE', 'weapon_flaregun.png', 'true', 'false', 'A handgun for firing signal rockets', 'true'),
(34, 'weapon_marksmanpistol', 'Marksman Pistol', 1000, 'weapon', 'AMMO_PISTOL', 'weapon_marksmanpistol.png', 'true', 'false', 'A very accurate small firearm designed to be held in one hand', 'true'),
(35, 'weapon_revolver', 'Revolver', 1000, 'weapon', 'AMMO_PISTOL', 'weapon_revolver.png', 'true', 'false', 'A pistol with revolving chambers enabling several shots to be fired without reloading', 'true'),
(36, 'weapon_revolver_mk2', 'Violence', 1000, 'weapon', 'AMMO_PISTOL', 'weapon_revolver_mk2.png', 'true', 'true', 'da Violence', 'true'),
(37, 'weapon_doubleaction', 'Double Action Revolver', 1000, 'weapon', 'AMMO_PISTOL', 'weapon_doubleaction.png', 'true', 'true', 'Double Action Revolver', 'true'),
(38, 'weapon_snspistol_mk2', 'SNS Pistol Mk II', 1000, 'weapon', 'AMMO_PISTOL', 'weapon_snspistol_mk2.png', 'true', 'true', 'SNS Pistol MK2', 'true'),
(39, 'weapon_raypistol', 'Up-n-Atomizer', 1000, 'weapon', 'AMMO_PISTOL', 'weapon_raypistol.png', 'true', 'true', 'Weapon Raypistol', 'true'),
(40, 'weapon_ceramicpistol', 'Ceramic Pistol', 1000, 'weapon', 'AMMO_PISTOL', 'weapon_ceramicpistol.png', 'true', 'true', 'Weapon Ceramicpistol', 'true'),
(41, 'weapon_navyrevolver', 'Navy Revolver', 1000, 'weapon', 'AMMO_PISTOL', 'weapon_navyrevolver.png', 'true', 'true', 'Weapon Navyrevolver', 'true'),
(42, 'weapon_gadgetpistol', 'Perico Pistol', 1000, 'weapon', 'AMMO_PISTOL', 'weapon_gadgetpistol.png', 'true', 'true', 'Weapon Gadgetpistol', 'true'),
(43, 'weapon_microsmg', 'Micro SMG', 1000, 'weapon', 'AMMO_SMG', 'weapon_microsmg.png', 'true', 'false', 'A handheld lightweight machine gun', 'true'),
(44, 'weapon_smg', 'SMG', 1000, 'weapon', 'AMMO_SMG', 'weapon_smg.png', 'true', 'false', 'A handheld lightweight machine gun', 'true'),
(45, 'weapon_smg_mk2', 'SMG Mk II', 1000, 'weapon', 'AMMO_SMG', 'weapon_smg_mk2.png', 'true', 'true', 'SMG MK2', 'true'),
(46, 'weapon_assaultsmg', 'Assault SMG', 1000, 'weapon', 'AMMO_SMG', 'weapon_assaultsmg.png', 'true', 'false', 'An assault version of a handheld lightweight machine gun', 'true'),
(47, 'weapon_combatpdw', 'Combat PDW', 1000, 'weapon', 'AMMO_SMG', 'weapon_combatpdw.png', 'true', 'false', 'A combat version of a handheld lightweight machine gun', 'true'),
(48, 'weapon_machinepistol', 'Tec-9', 1000, 'weapon', 'AMMO_PISTOL', 'weapon_machinepistol.png', 'true', 'false', 'A self-loading pistol capable of burst or fully automatic fire', 'true'),
(49, 'weapon_minismg', 'Mini SMG', 1000, 'weapon', 'AMMO_SMG', 'weapon_minismg.png', 'true', 'false', 'A mini handheld lightweight machine gun', 'true'),
(50, 'weapon_raycarbine', 'Unholy Hellbringer', 1000, 'weapon', 'AMMO_SMG', 'weapon_raycarbine.png', 'true', 'true', 'Weapon Raycarbine', 'true'),
(51, 'weapon_pumpshotgun', 'Pump Shotgun', 1000, 'weapon', 'AMMO_SHOTGUN', 'weapon_pumpshotgun.png', 'true', 'false', 'A pump-action smoothbore gun for firing small shot at short range', 'true'),
(52, 'weapon_sawnoffshotgun', 'Sawn-off Shotgun', 1000, 'weapon', 'AMMO_SHOTGUN', 'weapon_sawnoffshotgun.png', 'true', 'false', 'A sawn-off smoothbore gun for firing small shot at short range', 'true'),
(53, 'weapon_assaultshotgun', 'Assault Shotgun', 1000, 'weapon', 'AMMO_SHOTGUN', 'weapon_assaultshotgun.png', 'true', 'false', 'An assault version of asmoothbore gun for firing small shot at short range', 'true'),
(54, 'weapon_bullpupshotgun', 'Bullpup Shotgun', 1000, 'weapon', 'AMMO_SHOTGUN', 'weapon_bullpupshotgun.png', 'true', 'false', 'A compact smoothbore gun for firing small shot at short range', 'true'),
(55, 'weapon_musket', 'Musket', 1000, 'weapon', 'AMMO_SHOTGUN', 'weapon_musket.png', 'true', 'false', 'An infantryman\'s light gun with a long barrel typically smooth-bored, muzzleloading, and fired from the shoulder', 'true'),
(56, 'weapon_heavyshotgun', 'Heavy Shotgun', 1000, 'weapon', 'AMMO_SHOTGUN', 'weapon_heavyshotgun.png', 'true', 'false', 'A large smoothbore gun for firing small shot at short range', 'true'),
(57, 'weapon_dbshotgun', 'Double-barrel Shotgun', 1000, 'weapon', 'AMMO_SHOTGUN', 'weapon_dbshotgun.png', 'true', 'false', 'A shotgun with two parallel barrels allowing two single shots to be fired in quick succession', 'true'),
(58, 'weapon_autoshotgun', 'Auto Shotgun', 1000, 'weapon', 'AMMO_SHOTGUN', 'weapon_autoshotgun.png', 'true', 'false', 'A shotgun capable of rapid continous fire', 'true'),
(59, 'weapon_pumpshotgun_mk2', 'Pumpshotgun Mk II', 1000, 'weapon', 'AMMO_SHOTGUN', 'weapon_pumpshotgun_mk2.png', 'true', 'true', 'Pumpshotgun MK2', 'true'),
(60, 'weapon_combatshotgun', 'Combat Shotgun', 1000, 'weapon', 'AMMO_SHOTGUN', 'weapon_combatshotgun.png', 'true', 'true', 'Weapon Combatshotgun', 'true'),
(61, 'weapon_assaultrifle', 'Assault Rifle', 1000, 'weapon', 'AMMO_RIFLE', 'weapon_assaultrifle.png', 'true', 'false', 'A rapid-fire, magazine-fed automatic rifle designed for infantry use', 'true'),
(62, 'weapon_assaultrifle_mk2', 'Assault Rifle Mk II', 1000, 'weapon', 'AMMO_RIFLE', 'weapon_assaultrifle_mk2.png', 'true', 'true', 'Assault Rifle MK2', 'true'),
(63, 'weapon_carbinerifle', 'Carbine Rifle', 1000, 'weapon', 'AMMO_RIFLE', 'weapon_carbinerifle.png', 'true', 'false', 'A lightweight automatic rifle', 'true'),
(64, 'weapon_carbinerifle_mk2', 'Carbine Rifle Mk II', 1000, 'weapon', 'AMMO_RIFLE', 'weapon_carbinerifle_mk2.png', 'true', 'true', 'Carbine Rifle MK2', 'true'),
(65, 'weapon_advancedrifle', 'Advanced Rifle', 1000, 'weapon', 'AMMO_RIFLE', 'weapon_advancedrifle.png', 'true', 'false', 'An assault version of a rapid-fire, magazine-fed automatic rifle designed for infantry use', 'true'),
(66, 'weapon_specialcarbine', 'Special Carbine', 1000, 'weapon', 'AMMO_RIFLE', 'weapon_specialcarbine.png', 'true', 'false', 'An extremely versatile assault rifle for any combat situation', 'true'),
(67, 'weapon_bullpuprifle', 'Bullpup Rifle', 1000, 'weapon', 'AMMO_RIFLE', 'weapon_bullpuprifle.png', 'true', 'false', 'A compact automatic assault rifle', 'true'),
(68, 'weapon_compactrifle', 'Compact Rifle', 1000, 'weapon', 'AMMO_RIFLE', 'weapon_compactrifle.png', 'true', 'false', 'A compact version of an assault rifle', 'true'),
(69, 'weapon_specialcarbine_mk2', 'Special Carbine Mk II', 1000, 'weapon', 'AMMO_RIFLE', 'weapon_specialcarbine_mk2.png', 'true', 'true', 'Weapon Specialcarbine MK2', 'true'),
(70, 'weapon_bullpuprifle_mk2', 'Bullpup Rifle Mk II', 1000, 'weapon', 'AMMO_RIFLE', 'weapon_bullpuprifle_mk2.png', 'true', 'true', 'Bull Puprifle MK2', 'true'),
(71, 'weapon_militaryrifle', 'Military Rifle', 1000, 'weapon', 'AMMO_RIFLE', 'weapon_militaryrifle.png', 'true', 'true', 'Weapon Militaryrifle', 'true'),
(72, 'weapon_mg', 'Machinegun', 1000, 'weapon', 'AMMO_MG', 'weapon_mg.png', 'true', 'false', 'An automatic gun that fires bullets in rapid succession for as long as the trigger is pressed', 'true'),
(73, 'weapon_combatmg', 'Combat MG', 1000, 'weapon', 'AMMO_MG', 'weapon_combatmg.png', 'true', 'false', 'A combat version of an automatic gun that fires bullets in rapid succession for as long as the trigger is pressed', 'true'),
(74, 'weapon_gusenberg', 'Thompson SMG', 1000, 'weapon', 'AMMO_MG', 'weapon_gusenberg.png', 'true', 'false', 'An automatic rifle commonly referred to as a tommy gun', 'true'),
(75, 'weapon_combatmg_mk2', 'Combat MG Mk II', 1000, 'weapon', 'AMMO_MG', 'weapon_combatmg_mk2.png', 'true', 'true', 'Weapon Combatmg MK2', 'true'),
(76, 'weapon_sniperrifle', 'Sniper Rifle', 1000, 'weapon', 'AMMO_SNIPER', 'weapon_sniperrifle.png', 'true', 'false', 'A high-precision, long-range rifle', 'true'),
(77, 'weapon_heavysniper', 'Heavy Sniper', 1000, 'weapon', 'AMMO_SNIPER', 'weapon_heavysniper.png', 'true', 'false', 'An upgraded high-precision, long-range rifle', 'true'),
(78, 'weapon_marksmanrifle', 'Marksman Rifle', 1000, 'weapon', 'AMMO_SNIPER', 'weapon_marksmanrifle.png', 'true', 'false', 'A very accurate single-fire rifle', 'true'),
(79, 'weapon_remotesniper', 'Remote Sniper', 1000, 'weapon', 'AMMO_SNIPER_REMOTE', 'weapon_remotesniper.png', 'true', 'false', 'A portable high-precision, long-range rifle', 'true'),
(80, 'weapon_heavysniper_mk2', 'Heavy Sniper Mk II', 1000, 'weapon', 'AMMO_SNIPER', 'weapon_heavysniper_mk2.png', 'true', 'true', 'Weapon Heavysniper MK2', 'true'),
(81, 'weapon_marksmanrifle_mk2', 'Marksman Rifle Mk II', 1000, 'weapon', 'AMMO_SNIPER', 'weapon_marksmanrifle_mk2.png', 'true', 'true', 'Weapon Marksmanrifle MK2', 'true'),
(82, 'weapon_rpg', 'RPG', 1000, 'weapon', 'AMMO_RPG', 'weapon_rpg.png', 'true', 'false', 'A rocket-propelled grenade launcher', 'true'),
(83, 'weapon_grenadelauncher', 'Grenade Launcher', 1000, 'weapon', 'AMMO_GRENADELAUNCHER', 'weapon_grenadelauncher.png', 'true', 'false', 'A weapon that fires a specially-designed large-caliber projectile, often with an explosive, smoke or gas warhead', 'true'),
(84, 'weapon_grenadelauncher_smoke', 'Smoke Grenade Launcher', 1000, 'weapon', 'AMMO_GRENADELAUNCHER', 'weapon_smokegrenade.png', 'true', 'false', 'A bomb that produces a lot of smoke when it explodes', 'true'),
(85, 'weapon_minigun', 'Minigun', 1000, 'weapon', 'AMMO_MINIGUN', 'weapon_minigun.png', 'true', 'false', 'A portable machine gun consisting of a rotating cluster of six barrels and capable of variable rates of fire of up to 6,000 rounds per minute', 'true'),
(86, 'weapon_firework', 'Firework Launcher', 1000, 'weapon', 'nil', 'weapon_firework.png', 'true', 'false', 'A device containing gunpowder and other combustible chemicals that causes a spectacular explosion when ignited', 'true'),
(87, 'weapon_railgun', 'Railgun', 1000, 'weapon', 'nil', 'weapon_railgun.png', 'true', 'false', 'A weapon that uses electromagnetic force to launch high velocity projectiles', 'true'),
(88, 'weapon_hominglauncher', 'Homing Launcher', 1000, 'weapon', 'AMMO_STINGER', 'weapon_hominglauncher.png', 'true', 'false', 'A weapon fitted with an electronic device that enables it to find and hit a target', 'true'),
(89, 'weapon_compactlauncher', 'Compact Launcher', 1000, 'weapon', 'nil', 'weapon_compactlauncher.png', 'true', 'false', 'A compact grenade launcher', 'true'),
(90, 'weapon_rayminigun', 'Widowmaker', 1000, 'weapon', 'AMMO_MINIGUN', 'weapon_rayminigun.png', 'true', 'true', 'Weapon Rayminigun', 'true'),
(91, 'weapon_grenade', 'Grenade', 1000, 'weapon', 'nil', 'weapon_grenade.png', 'true', 'false', 'A handheld throwable bomb', 'true'),
(92, 'weapon_bzgas', 'BZ Gas', 1000, 'weapon', 'nil', 'weapon_bzgas.png', 'true', 'false', 'A cannister of gas that causes extreme pain', 'true'),
(93, 'weapon_molotov', 'Molotov', 1000, 'weapon', 'nil', 'weapon_molotov.png', 'true', 'false', 'A crude bomb made of a bottle filled with a flammable liquid and fitted with a wick for lighting', 'true'),
(94, 'weapon_stickybomb', 'C4', 1000, 'weapon', 'nil', 'weapon_stickybomb.png', 'true', 'false', 'An explosive charge covered with an adhesive that when thrown against an object sticks until it explodes', 'true'),
(95, 'weapon_proxmine', 'Proxmine Grenade', 1000, 'weapon', 'nil', 'weapon_proximitymine.png', 'true', 'false', 'A bomb placed on the ground that detonates when going within its proximity', 'true'),
(96, 'weapon_snowball', 'Snowball', 1000, 'weapon', 'nil', 'weapon_snowball.png', 'true', 'false', 'A ball of packed snow, especially one made for throwing at other people for fun', 'true'),
(97, 'weapon_pipebomb', 'Pipe Bomb', 1000, 'weapon', 'nil', 'weapon_pipebomb.png', 'true', 'false', 'A homemade bomb, the components of which are contained in a pipe', 'true'),
(98, 'weapon_ball', 'Ball', 1000, 'weapon', 'AMMO_BALL', 'weapon_ball.png', 'true', 'false', 'A solid or hollow spherical or egg-shaped object that is kicked, thrown, or hit in a game', 'true'),
(99, 'weapon_smokegrenade', 'Smoke Grenade', 1000, 'weapon', 'nil', 'weapon_c4.png', 'true', 'false', 'An explosive charge that can be remotely detonated', 'true'),
(100, 'weapon_flare', 'Flare pistol', 1000, 'weapon', 'AMMO_FLARE', 'weapon_flare.png', 'true', 'false', 'A small pyrotechnic devices used for illumination and signalling', 'true'),
(101, 'weapon_petrolcan', 'Petrol Can', 1000, 'weapon', 'AMMO_PETROLCAN', 'weapon_petrolcan.png', 'true', 'false', 'A robust liquid container made from pressed steel', 'true'),
(102, 'weapon_fireextinguisher', 'Fire Extinguisher', 1000, 'weapon', 'nil', 'weapon_fireextinguisher.png', 'true', 'false', 'A portable device that discharges a jet of water, foam, gas, or other material to extinguish a fire', 'true'),
(103, 'weapon_hazardcan', 'Hazardous Jerry Can', 1000, 'weapon', 'AMMO_PETROLCAN', 'weapon_hazardcan.png', 'true', 'true', 'Weapon Hazardcan', 'true');

-- --------------------------------------------------------

--
-- Table structure for table `qb-core-shared-vehicles`
--

CREATE TABLE `qb-core-shared-vehicles` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` text NOT NULL,
  `brand` text NOT NULL,
  `model` text NOT NULL,
  `price` bigint(20) NOT NULL,
  `category` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `categorylabel` text NOT NULL DEFAULT 'Not Categorized',
  `shop` text NOT NULL,
  `enabled` enum('true','false') NOT NULL DEFAULT 'true'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `qb-core-shared-vehicles`
--

INSERT INTO `qb-core-shared-vehicles` (`id`, `name`, `brand`, `model`, `price`, `category`, `categorylabel`, `shop`, `enabled`) VALUES
(1, 'Asbo', 'Maxwell', 'asbo', 4000, 'compacts', 'Compacts', 'pdm', 'true'),
(2, 'Blista', 'Dinka', 'blista', 13000, 'compacts', 'Compacts', 'pdm', 'true'),
(3, 'Brioso R/A', 'Grotti', 'brioso', 20000, 'compacts', 'Compacts', 'pdm', 'true'),
(4, 'Club', 'BF', 'club', 8000, 'compacts', 'Compacts', 'pdm', 'true'),
(5, 'Dilettante', 'Karin', 'dilettante', 9000, 'compacts', 'Compacts', 'pdm', 'true'),
(6, 'Dilettante Patrol', 'Karin', 'dilettante2', 12000, 'compacts', 'Compacts', 'pdm', 'true'),
(7, 'Blista Kanjo', 'Dinka', 'kanjo', 12000, 'compacts', 'Compacts', 'pdm', 'true'),
(8, 'Issi', 'Weeny', 'issi2', 7000, 'compacts', 'Compacts', 'pdm', 'true'),
(9, 'Issi Classic', 'Weeny', 'issi3', 5000, 'compacts', 'Compacts', 'pdm', 'true'),
(10, 'Issi Arena', 'Weeny', 'issi4', 80000, 'compacts', 'Compacts', 'pdm', 'true'),
(11, 'Issi Arena', 'Weeny', 'issi5', 80000, 'compacts', 'Compacts', 'pdm', 'true'),
(12, 'Issi Arena', 'Weeny', 'issi6', 80000, 'compacts', 'Compacts', 'pdm', 'true'),
(13, 'Panto', 'Benefactor', 'panto', 3200, 'compacts', 'Compacts', 'pdm', 'true'),
(14, 'Prairie', 'Bollokan', 'prairie', 30000, 'compacts', 'Compacts', 'pdm', 'true'),
(15, 'Rhapsody', 'Declasse', 'rhapsody', 10000, 'compacts', 'Compacts', 'pdm', 'true'),
(16, 'Brioso 300', 'Grotti', 'brioso2', 12000, 'compacts', 'Compacts', 'pdm', 'true'),
(17, 'Weevil', 'BF', 'weevil', 9000, 'compacts', 'Compacts', 'pdm', 'true'),
(18, 'Cognoscenti Cabrio', 'Enus', 'cogcabrio', 30000, 'coupes', 'Coupes', 'pdm', 'true'),
(19, 'Exemplar', 'Dewbauchee', 'exemplar', 40000, 'coupes', 'Coupes', 'pdm', 'true'),
(20, 'F620', 'Ocelot', 'f620', 32500, 'coupes', 'Coupes', 'pdm', 'true'),
(21, 'Felon', 'Lampadati', 'felon', 31000, 'coupes', 'Coupes', 'pdm', 'true'),
(22, 'Felon GT', 'Lampadati', 'felon2', 37000, 'coupes', 'Coupes', 'pdm', 'true'),
(23, 'Jackal', 'Ocelot', 'jackal', 19000, 'coupes', 'Coupes', 'pdm', 'true'),
(24, 'Oracle', 'Ubermacht', 'oracle', 22000, 'sedans', 'Sedans', 'pdm', 'true'),
(25, 'Oracle XS', 'Übermacht', 'oracle2', 28000, 'coupes', 'Coupes', 'pdm', 'true'),
(26, 'Sentinel', 'Übermacht', 'sentinel', 30000, 'coupes', 'Coupes', 'pdm', 'true'),
(27, 'Sentinel XS', ' Übermacht', 'sentinel2', 33000, 'coupes', 'Coupes', 'pdm', 'true'),
(28, 'Windsor', 'Enus', 'windsor', 27000, 'coupes', 'Coupes', 'pdm', 'true'),
(29, 'Windsor Drop', 'Enus', 'windsor2', 34000, 'coupes', 'Coupes', 'pdm', 'true'),
(30, 'Zion', 'Übermacht', 'zion', 22000, 'coupes', 'Coupes', 'pdm', 'true'),
(31, 'Zion Cabrio', 'Übermacht', 'zion2', 28000, 'coupes', 'Coupes', 'pdm', 'true'),
(32, 'Previon', 'Karin', 'previon', 149000, 'coupes', 'Coupes', 'pdm', 'true'),
(33, 'Champion', 'Dewbauchee', 'champion', 205000, 'coupes', 'Coupes', 'pdm', 'true'),
(34, 'Ignus', 'Pegassi', 'ignus', 1120000, 'coupes', 'Coupes', 'pdm', 'true'),
(35, 'Zeno', 'Overflod', 'zeno', 1350000, 'coupes', 'Coupes', 'pdm', 'true'),
(36, 'BMX', 'Bike', 'bmx', 160, 'cycles', 'Bicycles', 'pdm', 'true'),
(37, 'Cruiser', 'Bike', 'cruiser', 510, 'cycles', 'Bicycles', 'pdm', 'true'),
(38, 'Fixter', 'Bike', 'fixter', 225, 'cycles', 'Bicycles', 'pdm', 'true'),
(39, 'Scorcher', 'Bike', 'scorcher', 280, 'cycles', 'Bicycles', 'pdm', 'true'),
(40, 'Tri Bike', 'Bike', 'tribike', 500, 'cycles', 'Bicycles', 'pdm', 'true'),
(41, 'Tri Bike 2', 'Bike', 'tribike2', 700, 'cycles', 'Bicycles', 'pdm', 'true'),
(42, 'Tri Bike 3', 'Bike', 'tribike3', 520, 'cycles', 'Bicycles', 'pdm', 'true'),
(43, 'Akuma', 'Dinka', 'akuma', 55000, 'motorcycles', 'Motorcycles', 'pdm', 'true'),
(44, 'Avarus', 'LCC', 'avarus', 20000, 'motorcycles', 'Motorcycles', 'pdm', 'true'),
(45, 'Bagger', 'WMC', 'bagger', 13500, 'motorcycles', 'Motorcycles', 'pdm', 'true'),
(46, 'Bati 801', 'Pegassi', 'bati', 24000, 'motorcycles', 'Motorcycles', 'pdm', 'true'),
(47, 'Bati 801RR', 'Pegassi', 'bati2', 19000, 'motorcycles', 'Motorcycles', 'pdm', 'true'),
(48, 'BF400', 'Nagasaki', 'bf400', 22000, 'motorcycles', 'Motorcycles', 'pdm', 'true'),
(49, 'Carbon RS', 'Nagasaki', 'carbonrs', 22000, 'motorcycles', 'Motorcycles', 'pdm', 'true'),
(50, 'Chimera', 'Nagasaki', 'chimera', 21000, 'motorcycles', 'Motorcycles', 'pdm', 'true'),
(51, 'Cliffhanger', 'Western', 'cliffhanger', 28500, 'motorcycles', 'Motorcycles', 'pdm', 'true'),
(52, 'Daemon', 'WMC', 'daemon', 14000, 'motorcycles', 'Motorcycles', 'pdm', 'true'),
(53, 'Daemon Custom', 'Western', 'daemon2', 23000, 'motorcycles', 'Motorcycles', 'pdm', 'true'),
(54, 'Defiler', 'Shitzu', 'defiler', 30000, 'motorcycles', 'Motorcycles', 'pdm', 'true'),
(55, 'deathbike', 'deathbike', 'deathbike', 30000, 'motorcycles', 'Motorcycles', 'pdm', 'true'),
(56, 'deathbike2', 'deathbike', 'deathbike2', 30000, 'motorcycles', 'Motorcycles', 'pdm', 'true'),
(57, 'deathbike3', 'deathbike', 'deathbike3', 30000, 'motorcycles', 'Motorcycles', 'pdm', 'true'),
(58, 'Diablous', 'Principe', 'diablous', 30000, 'motorcycles', 'Motorcycles', 'pdm', 'true'),
(59, 'Diablous Custom', 'Principe', 'diablous2', 38000, 'motorcycles', 'Motorcycles', 'pdm', 'true'),
(60, 'Double-T', 'Dinka', 'double', 28000, 'motorcycles', 'Motorcycles', 'pdm', 'true'),
(61, 'Enduro', 'Dinka', 'enduro', 5500, 'motorcycles', 'Motorcycles', 'pdm', 'true'),
(62, 'Esskey', 'Pegassi', 'esskey', 12000, 'motorcycles', 'Motorcycles', 'pdm', 'true'),
(63, 'Faggio Sport', 'Pegassi', 'faggio', 2000, 'motorcycles', 'Motorcycles', 'pdm', 'true'),
(64, 'Faggio', 'Pegassi', 'faggio2', 1900, 'motorcycles', 'Motorcycles', 'pdm', 'true'),
(65, 'Faggio Mod', 'Pegassi', 'faggio3', 2500, 'motorcycles', 'Motorcycles', 'pdm', 'true'),
(66, 'FCR 1000', 'Pegassi', 'fcr', 5000, 'motorcycles', 'Motorcycles', 'pdm', 'true'),
(67, 'FCR 1000 Custom', 'Pegassi', 'fcr2', 19000, 'motorcycles', 'Motorcycles', 'pdm', 'true'),
(68, 'Gargoyle', 'Western', 'gargoyle', 32000, 'motorcycles', 'Motorcycles', 'pdm', 'true'),
(69, 'Hakuchou', 'Shitzu', 'hakuchou', 17000, 'motorcycles', 'Motorcycles', 'pdm', 'true'),
(70, 'Hakuchou Drag', 'Shitzu', 'hakuchou2', 45000, 'motorcycles', 'Motorcycles', 'pdm', 'true'),
(71, 'Hexer', 'LCC', 'hexer', 16000, 'motorcycles', 'Motorcycles', 'pdm', 'true'),
(72, 'Innovation', 'LLC', 'innovation', 33500, 'motorcycles', 'Motorcycles', 'pdm', 'true'),
(73, 'Lectro', 'Principe', 'lectro', 28000, 'motorcycles', 'Motorcycles', 'pdm', 'true'),
(74, 'Manchez', 'Maibatsu', 'manchez', 8300, 'motorcycles', 'Motorcycles', 'pdm', 'true'),
(75, 'Nemesis', 'Principe', 'nemesis', 20000, 'motorcycles', 'Motorcycles', 'pdm', 'true'),
(76, 'Nightblade', 'WMC', 'nightblade', 23000, 'motorcycles', 'Motorcycles', 'pdm', 'true'),
(77, 'Oppressor', 'Pegassi', 'oppressor', 9999999, 'super', 'Super Cars', 'luxury', 'true'),
(78, 'PCJ-600', 'Shitzu', 'pcj', 15000, 'motorcycles', 'Motorcycles', 'pdm', 'true'),
(79, 'Rat Bike', 'Western', 'ratbike', 3000, 'motorcycles', 'Motorcycles', 'pdm', 'true'),
(80, 'Ruffian', 'Pegassi', 'ruffian', 25000, 'motorcycles', 'Motorcycles', 'pdm', 'true'),
(81, 'Sanchez Livery', 'Maibatsu', 'sanchez', 5300, 'motorcycles', 'Motorcycles', 'pdm', 'true'),
(82, 'Sanchez', 'Maibatsu', 'sanchez2', 5300, 'motorcycles', 'Motorcycles', 'pdm', 'true'),
(83, 'Sanctus', 'LCC', 'sanctus', 35000, 'motorcycles', 'Motorcycles', 'pdm', 'true'),
(84, 'Shotaro Concept', 'Nagasaki', 'shotaro', 320000, 'motorcycles', 'Motorcycles', 'pdm', 'true'),
(85, 'Sovereign', 'WMC', 'sovereign', 8000, 'motorcycles', 'Motorcycles', 'pdm', 'true'),
(86, 'Stryder', 'Nagasaki', 'stryder', 50000, 'motorcycles', 'Motorcycles', 'pdm', 'true'),
(87, 'Thrust', 'Dinka', 'thrust', 22000, 'motorcycles', 'Motorcycles', 'pdm', 'true'),
(88, 'Vader', 'Shitzu', 'vader', 7200, 'motorcycles', 'Motorcycles', 'pdm', 'true'),
(89, 'Vindicator', 'Dinka', 'vindicator', 19000, 'motorcycles', 'Motorcycles', 'pdm', 'true'),
(90, 'Vortex', 'Pegassi', 'vortex', 31000, 'motorcycles', 'Motorcycles', 'pdm', 'true'),
(91, 'Wolfsbane', 'Western', 'wolfsbane', 14000, 'motorcycles', 'Motorcycles', 'pdm', 'true'),
(92, 'Zombie Bobber', 'Western', 'zombiea', 28000, 'motorcycles', 'Motorcycles', 'pdm', 'true'),
(93, 'Zombie Chopper', 'Western', 'zombieb', 27000, 'motorcycles', 'Motorcycles', 'pdm', 'true'),
(94, 'Manchez', 'Maibatsu', 'manchez2', 14000, 'motorcycles', 'Motorcycles', 'pdm', 'true'),
(95, 'Shinobi', 'Nagasaki', 'shinobi', 25000, 'motorcycles', 'Motorcycles', 'pdm', 'true'),
(96, 'Reever', 'Western', 'reever', 25000, 'motorcycles', 'Motorcycles', 'pdm', 'true'),
(97, 'Blade', 'Vapid', 'blade', 23500, 'muscle', 'Muscle Cars', 'pdm', 'true'),
(98, 'Buccaneer', 'Albany', 'buccaneer', 22500, 'muscle', 'Muscle Cars', 'pdm', 'true'),
(99, 'Buccaneer Rider', 'Albany', 'buccaneer2', 24500, 'muscle', 'Muscle Cars', 'pdm', 'true'),
(100, 'Chino', 'Vapid', 'chino', 5000, 'muscle', 'Muscle Cars', 'pdm', 'true'),
(101, 'Chino Luxe', 'Vapid', 'chino2', 8000, 'muscle', 'Muscle Cars', 'pdm', 'true'),
(102, 'Clique', 'Vapid', 'clique', 20000, 'muscle', 'Muscle Cars', 'pdm', 'true'),
(103, 'Coquette BlackFin', 'Invetero', 'coquette3', 180000, 'muscle', 'Muscle Cars', 'pdm', 'true'),
(104, 'Deviant', 'Schyster', 'deviant', 70000, 'muscle', 'Muscle Cars', 'pdm', 'true'),
(105, 'Dominator', 'Vapid', 'dominator', 62500, 'muscle', 'Muscle Cars', 'pdm', 'true'),
(106, 'Pißwasser Dominator', 'Vapid', 'dominator2', 50000, 'muscle', 'Muscle Cars', 'pdm', 'true'),
(107, 'Dominator GTX', 'Vapid', 'dominator3', 70000, 'muscle', 'Muscle Cars', 'pdm', 'true'),
(108, 'Dominator Arena', 'Vapid', 'dominator4', 200000, 'muscle', 'Muscle Cars', 'pdm', 'true'),
(109, 'Dominator ASP', 'Vapid', 'dominator7', 110000, 'muscle', 'Muscle Cars', 'pdm', 'true'),
(110, 'Dominator GTT', 'Vapid', 'dominator8', 80000, 'muscle', 'Muscle Cars', 'pdm', 'true'),
(111, 'Dukes', 'Imponte', 'dukes', 23500, 'muscle', 'Muscle Cars', 'pdm', 'true'),
(112, 'Dukes Nightrider', 'Imponte', 'dukes2', 60000, 'muscle', 'Muscle Cars', 'pdm', 'true'),
(113, 'Beater Dukes', 'Imponte', 'dukes3', 45000, 'muscle', 'Muscle Cars', 'pdm', 'true'),
(114, 'Faction', 'Willard', 'faction', 17000, 'muscle', 'Muscle Cars', 'pdm', 'true'),
(115, 'Faction Rider', 'Willard', 'faction2', 19000, 'muscle', 'Muscle Cars', 'pdm', 'true'),
(116, 'Faction Custom Donk', 'Willard', 'faction3', 35000, 'muscle', 'Muscle Cars', 'pdm', 'true'),
(117, 'Ellie', 'Vapid', 'ellie', 42250, 'muscle', 'Muscle Cars', 'pdm', 'true'),
(118, 'Gauntlet', 'Bravado', 'gauntlet', 28500, 'muscle', 'Muscle Cars', 'pdm', 'true'),
(119, 'Redwood Gauntlet', 'Bravado', 'gauntlet2', 70000, 'muscle', 'Muscle Cars', 'pdm', 'true'),
(120, 'Classic Gauntlet', 'Bravado', 'gauntlet3', 75000, 'muscle', 'Muscle Cars', 'pdm', 'true'),
(121, 'Gauntlet Hellfire', 'Bravado', 'gauntlet4', 80000, 'muscle', 'Muscle Cars', 'pdm', 'true'),
(122, 'Gauntlet Classic Custom', 'Bravado', 'gauntlet5', 120000, 'muscle', 'Muscle Cars', 'pdm', 'true'),
(123, 'Hermes', 'Albany', 'hermes', 535000, 'muscle', 'Muscle Cars', 'pdm', 'true'),
(124, 'Hotknife', 'Vapid', 'hotknife', 90000, 'muscle', 'Muscle Cars', 'pdm', 'true'),
(125, 'Hustler', 'Vapid', 'hustler', 95000, 'muscle', 'Muscle Cars', 'pdm', 'true'),
(126, 'impaler', 'Vapid', 'impaler', 95000, 'muscle', 'Muscle Cars', 'pdm', 'true'),
(127, 'impaler2', 'Vapid', 'impaler2', 95000, 'muscle', 'Muscle Cars', 'pdm', 'true'),
(128, 'impaler3', 'Vapid', 'impaler3', 95000, 'muscle', 'Muscle Cars', 'pdm', 'true'),
(129, 'impaler4', 'Vapid', 'impaler4', 95000, 'muscle', 'Muscle Cars', 'pdm', 'true'),
(130, 'imperator', 'Vapid', 'imperator', 95000, 'muscle', 'Muscle Cars', 'pdm', 'true'),
(131, 'imperator2', 'Vapid', 'imperator2', 95000, 'muscle', 'Muscle Cars', 'pdm', 'true'),
(132, 'imperator3', 'Vapid', 'imperator3', 95000, 'muscle', 'Muscle Cars', 'pdm', 'true'),
(133, 'Gauntlet Classic Custom', 'Bravado', 'lurcher', 21000, 'muscle', 'Muscle Cars', 'pdm', 'true'),
(134, 'Moonbeam', 'Declasse', 'moonbeam', 13000, 'vans', 'Vans', 'pdm', 'true'),
(135, 'Moonbeam Custom', 'Declasse', 'moonbeam2', 15000, 'vans', 'Vans', 'pdm', 'true'),
(136, 'Nightshade', 'Imponte', 'nightshade', 70000, 'muscle', 'Muscle Cars', 'pdm', 'true'),
(137, 'Peyote Gasser', 'Vapid', 'peyote2', 40000, 'sportsclassics', 'Sports Classics', 'pdm', 'true'),
(138, 'Phoenix', 'Imponte', 'phoenix', 65000, 'muscle', 'Muscle Cars', 'pdm', 'true'),
(139, 'Picador', 'Cheval', 'picador', 20000, 'muscle', 'Muscle Cars', 'pdm', 'true'),
(140, 'ratloader2', 'Ratloader2', 'ratloader2', 20000, 'muscle', 'Muscle Cars', 'pdm', 'true'),
(141, 'Ruiner', 'Imponte', 'ruiner', 29000, 'muscle', 'Muscle Cars', 'pdm', 'true'),
(142, 'Ruiner 2000', 'Imponte', 'ruiner2', 50000, 'muscle', 'Muscle Cars', 'pdm', 'true'),
(143, 'Sabre Turbo', 'Declasse', 'sabregt', 23000, 'muscle', 'Muscle Cars', 'pdm', 'true'),
(144, 'Sabre GT', 'Declasse', 'sabregt2', 26500, 'muscle', 'Muscle Cars', 'pdm', 'true'),
(145, 'Slam Van', 'Vapid', 'slamvan', 30000, 'muscle', 'Muscle Cars', 'pdm', 'true'),
(146, 'Lost Slam Van', 'Vapid', 'slamvan2', 90000, 'muscle', 'Muscle Cars', 'pdm', 'true'),
(147, 'Slam Van Custom', 'Vapid', 'slamvan3', 17000, 'muscle', 'Muscle Cars', 'pdm', 'true'),
(148, 'Stallion', 'Declasse', 'stalion', 33000, 'muscle', 'Muscle Cars', 'pdm', 'true'),
(149, 'Stallion Burgershot', 'Declasse', 'stalion2', 40000, 'muscle', 'Muscle Cars', 'pdm', 'true'),
(150, 'Tampa', 'Declasse', 'tampa', 24500, 'muscle', 'Muscle Cars', 'pdm', 'true'),
(151, 'Tulip', 'Declasse', 'tulip', 80000, 'muscle', 'Muscle Cars', 'pdm', 'true'),
(152, 'Vamos', 'Declasse', 'vamos', 30000, 'muscle', 'Muscle Cars', 'pdm', 'true'),
(153, 'Vigero', 'Declasse', 'vigero', 39500, 'muscle', 'Muscle Cars', 'pdm', 'true'),
(154, 'Virgo', 'Albany', 'virgo', 22000, 'muscle', 'Muscle Cars', 'pdm', 'true'),
(155, 'Virgo Custom Classic', 'Dundreary', 'virgo2', 21000, 'muscle', 'Muscle Cars', 'pdm', 'true'),
(156, 'Virgo Custom Classic', 'Dundreary', 'virgo3', 21000, 'muscle', 'Muscle Cars', 'pdm', 'true'),
(157, 'Voodoo', 'Declasse', 'voodoo', 13000, 'muscle', 'Muscle Cars', 'pdm', 'true'),
(158, 'Yosemite', 'Declasse', 'yosemite', 19500, 'muscle', 'Muscle Cars', 'pdm', 'true'),
(159, 'Yosemite Drift', 'Declasse', 'yosemite2', 55000, 'muscle', 'Muscle Cars', 'pdm', 'true'),
(160, 'Yosemite Rancher', 'Declasse', 'yosemite3', 425000, 'offroad', 'Off-Road', 'pdm', 'true'),
(161, 'Buffalo STX', 'Bravado', 'buffalo4', 345000, 'muscle', 'Muscle Cars', 'pdm', 'true'),
(162, 'Bf Injection', 'Annis', 'bfinjection', 9000, 'offroad', 'Off-Road', 'pdm', 'true'),
(163, 'Bifta', 'Annis', 'bifta', 15500, 'offroad', 'Off-Road', 'pdm', 'true'),
(164, 'Blazer', 'Annis', 'blazer', 7500, 'offroad', 'Off-Road', 'pdm', 'true'),
(165, 'Blazer Lifeguard', 'Nagasaki', 'blazer2', 7000, 'offroad', 'Off-Road', 'pdm', 'true'),
(166, 'Blazer Hot Rod', 'Nagasaki', 'blazer3', 7000, 'offroad', 'Off-Road', 'pdm', 'true'),
(167, 'Blazer Sport', 'Annis', 'blazer4', 9250, 'offroad', 'Off-Road', 'pdm', 'true'),
(168, 'Blazer Aqua', 'Nagasaki', 'blazer5', 40000, 'offroad', 'Off-Road', 'pdm', 'true'),
(169, 'Brawler', 'Annis', 'brawler', 40000, 'offroad', 'Off-Road', 'pdm', 'true'),
(170, 'Caracara', 'Vapid', 'caracara', 60000, 'offroad', 'Off-Road', 'pdm', 'true'),
(171, 'Caracara 4x4', 'Vapid', 'caracara2', 80000, 'offroad', 'Off-Road', 'pdm', 'true'),
(172, 'Dubsta 6x6', 'Annis', 'dubsta3', 34000, 'offroad', 'Off-Road', 'pdm', 'true'),
(173, 'Dune Buggy', 'Annis', 'dune', 14000, 'offroad', 'Off-Road', 'pdm', 'true'),
(174, 'Everon', 'Karin', 'everon', 60000, 'offroad', 'Off-Road', 'pdm', 'true'),
(175, 'Freecrawler', 'Canis', 'freecrawler', 24000, 'offroad', 'Off-Road', 'pdm', 'true'),
(176, 'Hellion', 'Annis', 'hellion', 38000, 'offroad', 'Off-Road', 'pdm', 'true'),
(177, 'Kalahari', 'Canis', 'kalahari', 14000, 'offroad', 'Off-Road', 'pdm', 'true'),
(178, 'Kamacho', 'Canis', 'kamacho', 50000, 'offroad', 'Off-Road', 'pdm', 'true'),
(179, 'Mesa Merryweather', 'Canis', 'mesa3', 400000, 'offroad', 'Off-Road', 'pdm', 'true'),
(180, 'Outlaw', 'Nagasaki', 'outlaw', 15000, 'offroad', 'Off-Road', 'pdm', 'true'),
(181, 'Rancher XL', 'Declasse', 'rancherxl', 24000, 'offroad', 'Off-Road', 'pdm', 'true'),
(182, 'Rebel', 'Annis', 'rebel2', 20000, 'offroad', 'Off-Road', 'pdm', 'true'),
(183, 'Riata', 'Vapid', 'riata', 380000, 'offroad', 'Off-Road', 'pdm', 'true'),
(184, 'Sandking', 'Annis', 'sandking', 25000, 'offroad', 'Off-Road', 'pdm', 'true'),
(185, 'Sandking SWB', 'Annis', 'sandking2', 38000, 'offroad', 'Off-Road', 'pdm', 'true'),
(186, 'Trophy Truck', 'Annis', 'trophytruck', 60000, 'offroad', 'Off-Road', 'pdm', 'true'),
(187, 'Trophy Truck Limited', 'Annis', 'trophytruck2', 80000, 'offroad', 'Off-Road', 'pdm', 'true'),
(188, 'Vagrant', 'Maxwell', 'vagrant', 50000, 'offroad', 'Off-Road', 'pdm', 'true'),
(189, 'Verus', 'Dinka', 'verus', 20000, 'offroad', 'Off-Road', 'pdm', 'true'),
(190, 'Winky', 'Vapid', 'winky', 10000, 'offroad', 'Off-Road', 'pdm', 'true'),
(191, 'Baller', 'Gallivanter', 'baller', 22000, 'suvs', 'SUVs', 'pdm', 'true'),
(192, 'Baller', 'Gallivanter', 'baller2', 15000, 'suvs', 'SUVs', 'pdm', 'true'),
(193, 'Baller LE', 'Gallivanter', 'baller3', 15000, 'suvs', 'SUVs', 'pdm', 'true'),
(194, 'Baller LE LWB', 'Gallivanter', 'baller4', 29000, 'suvs', 'SUVs', 'pdm', 'true'),
(195, 'Baller LE (Armored)', 'Gallivanter', 'baller5', 78000, 'suvs', 'SUVs', 'pdm', 'true'),
(196, 'Baller LE LWB (Armored)', 'Gallivanter', 'baller6', 82000, 'suvs', 'SUVs', 'pdm', 'true'),
(197, 'BeeJay XL', 'Karin', 'bjxl', 19000, 'suvs', 'SUVs', 'pdm', 'true'),
(198, 'Cavalcade', 'Albany', 'cavalcade', 14000, 'suvs', 'SUVs', 'pdm', 'true'),
(199, 'Cavalcade', 'Albany', 'cavalcade2', 16500, 'suvs', 'SUVs', 'pdm', 'true'),
(200, 'Contender', 'Vapid', 'contender', 35000, 'suvs', 'SUVs', 'pdm', 'true'),
(201, 'Dubsta', 'Benefactor', 'dubsta', 19000, 'suvs', 'SUVs', 'pdm', 'true'),
(202, 'Dubsta Luxuary', 'Benefactor', 'dubsta2', 19500, 'suvs', 'SUVs', 'pdm', 'true'),
(203, 'FQ2', 'Fathom', 'fq2', 18500, 'suvs', 'SUVs', 'pdm', 'true'),
(204, 'Granger', 'Declasse', 'granger', 22000, 'suvs', 'SUVs', 'pdm', 'true'),
(205, 'Gresley', 'Bravado', 'gresley', 25000, 'suvs', 'SUVs', 'pdm', 'true'),
(206, 'Habanero', 'Emperor', 'habanero', 20000, 'suvs', 'SUVs', 'pdm', 'true'),
(207, 'Huntley S', 'Enus', 'huntley', 24500, 'suvs', 'SUVs', 'pdm', 'true'),
(208, 'Landstalker', 'Dundreary', 'landstalker', 12000, 'suvs', 'SUVs', 'pdm', 'true'),
(209, 'Landstalker XL', 'Dundreary', 'landstalker2', 26000, 'suvs', 'SUVs', 'pdm', 'true'),
(210, 'Mesa', 'Canis', 'mesa', 12000, 'offroad', 'Off-Road', 'pdm', 'true'),
(211, 'Novak', 'Lampadati', 'novak', 70000, 'suvs', 'SUVs', 'pdm', 'true'),
(212, 'Patriot', 'Mammoth', 'patriot', 21000, 'suvs', 'SUVs', 'pdm', 'true'),
(213, 'Radius', 'Vapid', 'radi', 18000, 'suvs', 'SUVs', 'pdm', 'true'),
(214, 'Rebla GTS', 'Übermacht', 'rebla', 21000, 'suvs', 'SUVs', 'pdm', 'true'),
(215, 'Rocoto', 'Obey', 'rocoto', 13000, 'suvs', 'SUVs', 'pdm', 'true'),
(216, 'Seminole', 'Canis', 'seminole', 20000, 'suvs', 'SUVs', 'pdm', 'true'),
(217, 'Seminole Frontier', 'Canis', 'seminole2', 13000, 'suvs', 'SUVs', 'pdm', 'true'),
(218, 'Serrano', 'Benefactor', 'serrano', 48000, 'suvs', 'SUVs', 'pdm', 'true'),
(219, 'Toros', 'Pegassi', 'toros', 65000, 'suvs', 'SUVs', 'pdm', 'true'),
(220, 'XLS', 'Benefactor', 'xls', 17000, 'suvs', 'SUVs', 'pdm', 'true'),
(221, 'Granger 3600LX', 'Declasse', 'granger2', 221000, 'suvs', 'SUVs', 'pdm', 'true'),
(222, 'Asea', 'Declasse', 'asea', 2500, 'sedans', 'Sedans', 'pdm', 'true'),
(223, 'Asterope', 'Karin', 'asterope', 11000, 'sedans', 'Sedans', 'pdm', 'true'),
(224, 'Cognoscenti 55', 'Enus', 'cog55', 22000, 'sedans', 'Sedans', 'pdm', 'true'),
(225, 'Cognoscenti', 'Enus', 'cognoscenti', 22500, 'sedans', 'Sedans', 'pdm', 'true'),
(226, 'Emperor', 'Albany', 'emperor', 4250, 'sedans', 'Sedans', 'pdm', 'true'),
(227, 'Fugitive', 'Cheval', 'fugitive', 20000, 'sedans', 'Sedans', 'pdm', 'true'),
(228, 'Glendale', 'Benefactor', 'glendale', 3400, 'sedans', 'Sedans', 'pdm', 'true'),
(229, 'Glendale', 'Benefactor', 'glendale2', 12000, 'sedans', 'Sedans', 'pdm', 'true'),
(230, 'Ingot', 'Vulcar', 'ingot', 4999, 'sedans', 'Sedans', 'pdm', 'true'),
(231, 'Intruder', 'Karin', 'intruder', 11250, 'sedans', 'Sedans', 'pdm', 'true'),
(232, 'Premier', 'Declasse', 'premier', 12000, 'sedans', 'Sedans', 'pdm', 'true'),
(233, 'Primo', 'Albany', 'primo', 5000, 'sedans', 'Sedans', 'pdm', 'true'),
(234, 'Primo Custom', 'Albany', 'primo2', 14500, 'sedans', 'Sedans', 'pdm', 'true'),
(235, 'Regina', 'Dundreary', 'regina', 7000, 'sedans', 'Sedans', 'pdm', 'true'),
(236, 'Stafford', 'Enus', 'stafford', 30000, 'sedans', 'Sedans', 'pdm', 'true'),
(237, 'Stanier', 'Vapid', 'stanier', 19000, 'sedans', 'Sedans', 'pdm', 'true'),
(238, 'Stratum', 'Zirconium', 'stratum', 15000, 'sedans', 'Sedans', 'pdm', 'true'),
(239, 'Stretch', 'Dundreary', 'stretch', 19000, 'sedans', 'Sedans', 'pdm', 'true'),
(240, 'Super Diamond', 'Enus', 'superd', 17000, 'sedans', 'Sedans', 'pdm', 'true'),
(241, 'Surge', 'Cheval', 'surge', 20000, 'sedans', 'Sedans', 'pdm', 'true'),
(242, 'Tailgater', 'Obey', 'tailgater', 22000, 'sedans', 'Sedans', 'pdm', 'true'),
(243, 'Warrener', 'Vulcar', 'warrener', 4000, 'sedans', 'Sedans', 'pdm', 'true'),
(244, 'Washington', 'Albany', 'washington', 7000, 'sedans', 'Sedans', 'pdm', 'true'),
(245, 'Tailgater S', 'Obey', 'tailgater2', 51000, 'sedans', 'Sedans', 'pdm', 'true'),
(246, 'Lampadati', 'Cinquemila', 'cinquemila', 125000, 'sedans', 'Sedans', 'pdm', 'true'),
(247, 'Obey', 'I-Wagen', 'iwagen', 225000, 'sedans', 'Sedans', 'pdm', 'true'),
(248, 'Pfister', 'Astron', 'astron', 150000, 'sedans', 'Sedans', 'pdm', 'true'),
(249, 'Baller ST', 'Gallivanter', 'baller7', 145000, 'sedans', 'Sedans', 'pdm', 'true'),
(250, 'Comet', 'S2 Cabrio', 'comet7', 25000, 'sedans', 'Sedans', 'pdm', 'true'),
(251, 'Deity', 'Enus', 'deity', 505000, 'sedans', 'Sedans', 'pdm', 'true'),
(252, 'Jubilee', 'Enus', 'jubilee', 485000, 'sedans', 'Sedans', 'pdm', 'true'),
(253, 'Patriot', 'Mil-Spec', 'patriot3', 270000, 'sedans', 'Sedans', 'pdm', 'true'),
(254, 'Alpha', 'Albany', 'alpha', 53000, 'sports', 'Sports Cars', 'luxury', 'true'),
(255, 'Banshee', 'Bravado', 'banshee', 56000, 'sports', 'Sports Cars', 'luxury', 'true'),
(256, 'Bestia GTS', 'Grotti', 'bestiagts', 37000, 'sports', 'Sports Cars', 'luxury', 'true'),
(257, 'Blista Compact', 'Dinka', 'blista2', 18950, 'compacts', 'Compacts', 'pdm', 'true'),
(258, 'Blista Go Go Monkey', 'Dinka', 'blista3', 15000, 'compacts', 'Compacts', 'pdm', 'true'),
(259, 'Buffalo', 'Bravado', 'buffalo', 18750, 'sports', 'Sports Cars', 'luxury', 'true'),
(260, 'Buffalo S', 'Bravado', 'buffalo2', 24500, 'sports', 'Sports Cars', 'luxury', 'true'),
(261, 'Carbonizzare', 'Grotti', 'carbonizzare', 155000, 'sports', 'Sports Cars', 'luxury', 'true'),
(262, 'Comet', 'Pfister', 'comet2', 130000, 'sports', 'Sports Cars', 'luxury', 'true'),
(263, 'Comet Retro Custom', 'Pfister', 'comet3', 175000, 'sports', 'Sports Cars', 'luxury', 'true'),
(264, 'Comet Safari', 'Pfister', 'comet4', 110000, 'sports', 'Sports Cars', 'luxury', 'true'),
(265, 'Comet SR', 'Pfister', 'comet5', 155000, 'sports', 'Sports Cars', 'luxury', 'true'),
(266, 'Coquette', 'Invetero', 'coquette', 145000, 'sports', 'Sports Cars', 'luxury', 'true'),
(267, 'Coquette Classic', 'Invetero', 'coquette2', 165000, 'sportsclassics', 'Sports Classics', 'pdm', 'true'),
(268, 'Coquette D10', 'Invetero', 'coquette4', 220000, 'sports', 'Sports Cars', 'luxury', 'true'),
(269, '8F Drafter', 'Obey', 'drafter', 80000, 'sports', 'Sports Cars', 'luxury', 'true'),
(270, 'Deveste', 'Principe', 'deveste', 234000, 'super', 'Super Cars', 'luxury', 'true'),
(271, 'Elegy Retro Custom', 'Annis', 'elegy', 145000, 'sports', 'Sports Cars', 'luxury', 'true'),
(272, 'Elegy RH8', 'Annis', 'elegy2', 150000, 'sports', 'Sports Cars', 'luxury', 'true'),
(273, 'Feltzer', 'Benefactor', 'feltzer2', 97000, 'sports', 'Sports Cars', 'luxury', 'true'),
(274, 'Flash GT', 'Vapid', 'flashgt', 48000, 'sports', 'Sports Cars', 'luxury', 'true'),
(275, 'Furore GT', 'Lampadati', 'furoregt', 78000, 'sports', 'Sports Cars', 'luxury', 'true'),
(276, 'Futo', 'Karin', 'futo', 17500, 'coupes', 'Coupes', 'pdm', 'true'),
(277, 'GB 200', 'Vapid', 'gb200', 140000, 'sports', 'Sports Cars', 'luxury', 'true'),
(278, 'Komoda', 'Lampadati', 'komoda', 55000, 'sports', 'Sports Cars', 'luxury', 'true'),
(279, 'Imorgon', 'Overflod', 'imorgon', 120000, 'sports', 'Sports Cars', 'luxury', 'true'),
(280, 'Issi Sport', 'Weeny', 'issi7', 100000, 'compacts', 'Compacts', 'pdm', 'true'),
(281, 'Itali GTO', 'Progen', 'italigto', 260000, 'sports', 'Sports Cars', 'luxury', 'true'),
(282, 'Jugular', 'Ocelot', 'jugular', 80000, 'sports', 'Sports Cars', 'luxury', 'true'),
(283, 'Jester', 'Dinka', 'jester', 132250, 'sports', 'Sports Cars', 'luxury', 'true'),
(284, 'Jester Racecar', 'Dinka', 'jester2', 210000, 'sports', 'Sports Cars', 'luxury', 'true'),
(285, 'Jester Classic', 'Dinka', 'jester3', 85000, 'sports', 'Sports Cars', 'luxury', 'true'),
(286, 'Khamelion', 'Hijak', 'khamelion', 90000, 'sports', 'Sports Cars', 'luxury', 'true'),
(287, 'Kuruma', 'Karin', 'kuruma', 72000, 'sports', 'Sports Cars', 'luxury', 'true'),
(288, 'kuruma2', 'Karin2', 'kuruma2', 72000, 'sports', 'Sports Cars', 'luxury', 'true'),
(289, 'Locust', 'Ocelot', 'locust', 200000, 'sports', 'Sports Cars', 'luxury', 'true'),
(290, 'Lynx', 'Ocelot', 'lynx', 150000, 'sports', 'Sports Cars', 'luxury', 'true'),
(291, 'Massacro', 'Dewbauchee', 'massacro', 110000, 'sports', 'Sports Cars', 'luxury', 'true'),
(292, 'Massacro Racecar', 'Dewbauchee', 'massacro2', 80000, 'sports', 'Sports Cars', 'luxury', 'true'),
(293, 'Neo', 'Vysser', 'neo', 230000, 'sports', 'Sports Cars', 'luxury', 'true'),
(294, 'Neon', 'Pfister', 'neon', 220000, 'sports', 'Sports Cars', 'luxury', 'true'),
(295, '9F', 'Obey', 'ninef', 95000, 'sports', 'Sports Cars', 'luxury', 'true'),
(296, '9F Cabrio', 'Obey', 'ninef2', 105000, 'sports', 'Sports Cars', 'luxury', 'true'),
(297, 'Omnis', 'Wow', 'omnis', 90000, 'sports', 'Sports Cars', 'luxury', 'true'),
(298, 'Paragon', 'Enus', 'paragon', 60000, 'sports', 'Sports Cars', 'luxury', 'true'),
(299, 'Pariah', 'Ocelot', 'pariah', 90000, 'sports', 'Sports Cars', 'luxury', 'true'),
(300, 'Penumbra', 'Maibatsu', 'penumbra', 22000, 'sports', 'Sports Cars', 'luxury', 'true'),
(301, 'Penumbra FF', 'Maibatsu', 'penumbra2', 30000, 'sports', 'Sports Cars', 'luxury', 'true'),
(302, 'Rapid GT', 'Dewbauchee', 'rapidgt', 86000, 'sports', 'Sports Cars', 'luxury', 'true'),
(303, 'Rapid GT Convertible', 'Dewbauchee', 'rapidgt2', 92000, 'sports', 'Sports Cars', 'luxury', 'true'),
(304, 'Raptor', 'BF', 'raptor', 90000, 'sports', 'Sports Cars', 'luxury', 'true'),
(305, 'Revolter', 'Ubermacht', 'revolter', 95000, 'sports', 'Sports Cars', 'luxury', 'true'),
(306, 'Ruston', 'Hijak', 'ruston', 130000, 'sports', 'Sports Cars', 'luxury', 'true'),
(307, 'Schafter', 'Benefactor', 'schafter2', 16000, 'sedans', 'Sedans', 'pdm', 'true'),
(308, 'Schafter V12', 'Benefactor', 'schafter3', 35000, 'sports', 'Sports Cars', 'luxury', 'true'),
(309, 'Schafter LWB', 'Benefactor', 'schafter4', 21000, 'sports', 'Sports Cars', 'luxury', 'true'),
(310, 'Schlagen GT', 'Benefactor', 'schlagen', 160000, 'sports', 'Sports Cars', 'luxury', 'true'),
(311, 'Schwartzer', 'Benefactor', 'schwarzer', 47000, 'sports', 'Sports Cars', 'luxury', 'true'),
(312, 'Sentinel Classic', 'Übermacht', 'sentinel3', 70000, 'coupes', 'Coupes', 'pdm', 'true'),
(313, 'Seven-70', 'Dewbauchee', 'seven70', 140000, 'sports', 'Sports Cars', 'luxury', 'true'),
(314, 'Specter', 'Dewbauchee', 'specter', 160000, 'sports', 'Sports Cars', 'luxury', 'true'),
(315, 'Streiter', 'Benefactor', 'streiter', 40000, 'sports', 'Sports Cars', 'luxury', 'true'),
(316, 'Sugoi', 'Dinka', 'sugoi', 85000, 'sports', 'Sports Cars', 'luxury', 'true'),
(317, 'Sultan', 'Karin', 'sultan', 50000, 'sports', 'Sports Cars', 'luxury', 'true'),
(318, 'Sultan Custom', 'Karin', 'sultan2', 55000, 'sports', 'Sports Cars', 'luxury', 'true'),
(319, 'Surano', ' Benefactor', 'surano', 80000, 'sports', 'Sports Cars', 'luxury', 'true'),
(320, 'Drift Tampa', 'Declasse', 'tampa2', 80000, 'muscle', 'Muscle Cars', 'pdm', 'true'),
(321, 'Tropos Rallye', 'Lampadati', 'tropos', 65000, 'sports', 'Sports Cars', 'luxury', 'true'),
(322, 'Verlierer', 'Bravado', 'verlierer2', 90500, 'sports', 'Sports Cars', 'luxury', 'true'),
(323, 'V-STR', 'Albany', 'vstr', 80000, 'sports', 'Sports Cars', 'luxury', 'true'),
(324, 'Itali RSX', 'Progen', 'italirsx', 260000, 'sports', 'Sports Cars', 'luxury', 'true'),
(325, 'ZR350', 'Annis', 'zr350', 38000, 'sports', 'Sports Cars', 'luxury', 'true'),
(326, 'Calico GTF', 'Karin', 'calico', 39000, 'sports', 'Sports Cars', 'luxury', 'true'),
(327, 'Futo GTX', 'Karin', 'futo2', 39000, 'sports', 'Sports Cars', 'luxury', 'true'),
(328, 'Euros', 'Annis', 'euros', 80000, 'sports', 'Sports Cars', 'luxury', 'true'),
(329, 'Jester RR', 'Dinka', 'jester4', 240000, 'sports', 'Sports Cars', 'luxury', 'true'),
(330, 'Remus', 'Annis', 'remus', 48000, 'sports', 'Sports Cars', 'luxury', 'true'),
(331, 'Comet S2', 'Pfister', 'comet6', 230000, 'sports', 'Sports Cars', 'luxury', 'true'),
(332, 'Growler', 'Pfister', 'growler', 205000, 'sports', 'Sports Cars', 'luxury', 'true'),
(333, 'Emperor Vectre', 'Emperor', 'vectre', 80000, 'sports', 'Sports Cars', 'luxury', 'true'),
(334, 'Cypher', 'Ubermacht', 'cypher', 155000, 'sports', 'Sports Cars', 'luxury', 'true'),
(335, 'Sultan Classic Custom', 'Karin', 'sultan3', 56000, 'sports', 'Sports Cars', 'luxury', 'true'),
(336, 'RT3000', 'Dinka', 'rt3000', 65000, 'sports', 'Sports Cars', 'luxury', 'true'),
(337, 'Ardent', 'Ocelot', 'ardent', 30000, 'sportsclassics', 'Sports Classics', 'pdm', 'true'),
(338, 'Roosevelt', 'Albany', 'btype', 75000, 'sportsclassics', 'Sports Classics', 'pdm', 'true'),
(339, 'Franken Stange', 'Albany', 'btype2', 87000, 'sportsclassics', 'Sports Classics', 'pdm', 'true'),
(340, 'Roosevelt Valor', 'Albany', 'btype3', 63000, 'sportsclassics', 'Sports Classics', 'pdm', 'true'),
(341, 'Casco', 'Lampadati', 'casco', 100000, 'sportsclassics', 'Sports Classics', 'pdm', 'true'),
(342, 'Cheetah Classic', 'Grotti', 'cheetah2', 195000, 'sports', 'Sports Cars', 'luxury', 'true'),
(343, 'Deluxo', 'Imponte', 'deluxo', 55000, 'sportsclassics', 'Sports Classics', 'pdm', 'true'),
(344, 'Dynasty', 'Weeny', 'dynasty', 25000, 'sportsclassics', 'Sports Classics', 'pdm', 'true'),
(345, 'Fagaloa', 'Vulcar', 'fagaloa', 13000, 'sportsclassics', 'Sports Classics', 'pdm', 'true'),
(346, 'Stirling GT', 'Benefactor', 'feltzer3', 115000, 'sportsclassics', 'Sports Classics', 'pdm', 'true'),
(347, 'GT500', 'Grotti', 'gt500', 130000, 'sportsclassics', 'Sports Classics', 'pdm', 'true'),
(348, 'Infernus Classic', 'Pegassi', 'infernus2', 245000, 'sportsclassics', 'Sports Classics', 'pdm', 'true'),
(349, 'JB 700', 'Dewbauchee', 'jb700', 240000, 'sportsclassics', 'Sports Classics', 'pdm', 'true'),
(350, 'JB 700W', 'Dewbauchee', 'jb7002', 40000, 'sportsclassics', 'Sports Classics', 'pdm', 'true'),
(351, 'Mamba', 'Declasse', 'mamba', 140000, 'sportsclassics', 'Sports Classics', 'pdm', 'true'),
(352, 'Manana', 'Albany', 'manana', 12800, 'muscle', 'Muscle Cars', 'pdm', 'true'),
(353, 'Manana Custom', 'Albany', 'manana2', 24000, 'muscle', 'Muscle Cars', 'pdm', 'true'),
(354, 'Michelli GT', 'Lampadati', 'michelli', 30000, 'sportsclassics', 'Sports Classics', 'pdm', 'true'),
(355, 'Monroe', 'Pegassi', 'monroe', 115000, 'sportsclassics', 'Sports Classics', 'pdm', 'true'),
(356, 'Nebula', 'Vulcar', 'nebula', 22000, 'sportsclassics', 'Sports Classics', 'pdm', 'true'),
(357, 'Peyote', 'Vapid', 'peyote', 23500, 'sportsclassics', 'Sports Classics', 'pdm', 'true'),
(358, 'Peyote Custom', 'Vapid', 'peyote3', 48000, 'sportsclassics', 'Sports Classics', 'pdm', 'true'),
(359, 'Pigalle', 'Lampadati', 'pigalle', 92000, 'sportsclassics', 'Sports Classics', 'pdm', 'true'),
(360, 'Rapid GT', 'Dewbauchee', 'rapidgt3', 90000, 'sportsclassics', 'Sports Classics', 'pdm', 'true'),
(361, 'Retinue', 'Vapid', 'retinue', 32000, 'sportsclassics', 'Sports Classics', 'pdm', 'true'),
(362, 'Retinue MKII', 'Vapid', 'retinue2', 38000, 'sportsclassics', 'Sports Classics', 'pdm', 'true'),
(363, 'Savestra', 'Annis', 'savestra', 67000, 'sportsclassics', 'Sports Classics', 'pdm', 'true'),
(364, 'Stinger', 'Grotti', 'stinger', 39500, 'sportsclassics', 'Sports Classics', 'pdm', 'true'),
(365, 'Stinger GT', 'Grotti', 'stingergt', 70000, 'sportsclassics', 'Sports Classics', 'pdm', 'true'),
(366, 'Stromberg', 'Ocelot', 'stromberg', 80000, 'sportsclassics', 'Sports Classics', 'pdm', 'true'),
(367, 'Swinger', 'Ocelot', 'swinger', 221000, 'sportsclassics', 'Sports Classics', 'pdm', 'true'),
(368, 'Torero', 'Pegassi', 'torero', 84000, 'sportsclassics', 'Sports Classics', 'pdm', 'true'),
(369, 'Tornado', 'Declasse', 'tornado', 21000, 'sportsclassics', 'Sports Classics', 'pdm', 'true'),
(370, 'Tornado Gang', 'Declasse', 'tornado2', 22000, 'sportsclassics', 'Sports Classics', 'pdm', 'true'),
(371, 'Tornado Custom', 'Declasse', 'tornado5', 22000, 'sportsclassics', 'Sports Classics', 'pdm', 'true'),
(372, 'Turismo Classic', 'Grotti', 'turismo2', 170000, 'sportsclassics', 'Sports Classics', 'pdm', 'true'),
(373, 'Viseris', 'Lampadati', 'viseris', 210000, 'sportsclassics', 'Sports Classics', 'pdm', 'true'),
(374, '190Z', 'Karin', 'z190', 78000, 'sportsclassics', 'Sports Classics', 'pdm', 'true'),
(375, 'Z-Type', 'Truffade', 'ztype', 270000, 'sportsclassics', 'Sports Classics', 'pdm', 'true'),
(376, 'Zion Classic', 'Übermacht', 'zion3', 45000, 'sportsclassics', 'Sports Classics', 'pdm', 'true'),
(377, 'Cheburek', 'Rune', 'cheburek', 7000, 'sportsclassics', 'Sports Classics', 'pdm', 'true'),
(378, 'Toreador', 'Pegassi', 'toreador', 50000, 'sportsclassics', 'Sports Classics', 'pdm', 'true'),
(379, 'Adder', 'Truffade', 'adder', 280000, 'super', 'Super Cars', 'luxury', 'true'),
(380, 'Autarch', 'Överflöd', 'autarch', 224000, 'super', 'Super Cars', 'luxury', 'true'),
(381, 'Banshee 900R', 'Bravado', 'banshee2', 120000, 'super', 'Super Cars', 'luxury', 'true'),
(382, 'Bullet', 'Vapid', 'bullet', 120000, 'super', 'Super Cars', 'luxury', 'true'),
(383, 'Cheetah', 'Grotti', 'cheetah', 214000, 'super', 'Super Cars', 'luxury', 'true'),
(384, 'Cyclone', 'Coil', 'cyclone', 300000, 'super', 'Super Cars', 'luxury', 'true'),
(385, 'Entity XXR', 'Överflöd', 'entity2', 164000, 'super', 'Super Cars', 'luxury', 'true'),
(386, 'Entity XF', 'Överflöd', 'entityxf', 180000, 'super', 'Super Cars', 'luxury', 'true'),
(387, 'Emerus', 'Progen', 'emerus', 220000, 'super', 'Super Cars', 'luxury', 'true'),
(388, 'FMJ', 'Vapid', 'fmj', 125000, 'super', 'Super Cars', 'luxury', 'true'),
(389, 'Furia', 'Grotti', 'furia', 230000, 'super', 'Super Cars', 'luxury', 'true'),
(390, 'GP1', 'Progen', 'gp1', 110000, 'super', 'Super Cars', 'luxury', 'true'),
(391, 'Infernus', 'Pegassi', 'infernus', 235000, 'super', 'Super Cars', 'luxury', 'true'),
(392, 'Itali GTB', 'Progen', 'italigtb', 170000, 'super', 'Super Cars', 'luxury', 'true'),
(393, 'Itali GTB', 'Progen', 'italigtb2', 250000, 'super', 'Super Cars', 'luxury', 'true'),
(394, 'Krieger', 'Benefactor', 'krieger', 222000, 'super', 'Super Cars', 'luxury', 'true'),
(395, 'RE-7B', 'Annis', 'le7b', 260000, 'super', 'Super Cars', 'luxury', 'true'),
(396, 'Nero', 'Truffade', 'nero', 200000, 'super', 'Super Cars', 'luxury', 'true'),
(397, 'Nero Custom', 'Truffade', 'nero2', 260000, 'super', 'Super Cars', 'luxury', 'true'),
(398, 'Osiris', 'Pegassi', 'osiris', 220000, 'super', 'Super Cars', 'luxury', 'true'),
(399, 'Penetrator', 'Ocelot', 'penetrator', 130000, 'super', 'Super Cars', 'luxury', 'true'),
(400, '811', 'Pfister', 'pfister811', 220000, 'super', 'Super Cars', 'luxury', 'true'),
(401, 'X80 Proto', 'Grotti', 'prototipo', 235000, 'super', 'Super Cars', 'luxury', 'true'),
(402, 'Reaper', 'Pegassi', 'reaper', 100000, 'super', 'Super Cars', 'luxury', 'true'),
(403, 'S80RR', 'Annis', 's80', 205000, 'super', 'Super Cars', 'luxury', 'true'),
(404, 'SC1', 'Übermacht', 'sc1', 90000, 'super', 'Super Cars', 'luxury', 'true'),
(405, 'ETR1', 'Emperor', 'sheava', 220000, 'super', 'Super Cars', 'luxury', 'true'),
(406, 'Sultan RS', 'Karin', 'sultanrs', 76500, 'sports', 'Sports Cars', 'luxury', 'true'),
(407, 'T20', 'Progen', 't20', 1650000, 'super', 'Super Cars', 'luxury', 'true'),
(408, 'Taipan', 'Cheval', 'taipan', 1850000, 'super', 'Super Cars', 'luxury', 'true'),
(409, 'Tempesta', 'Pegassi', 'tempesta', 120000, 'super', 'Super Cars', 'luxury', 'true'),
(410, 'Tezeract', 'Pegassi', 'tezeract', 220000, 'super', 'Super Cars', 'luxury', 'true'),
(411, 'Thrax', 'Truffade', 'thrax', 180000, 'super', 'Super Cars', 'luxury', 'true'),
(412, 'Tigon', 'Lampadati', 'tigon', 240000, 'super', 'Super Cars', 'luxury', 'true'),
(413, 'Turismo R', 'Grotti', 'turismor', 140000, 'super', 'Super Cars', 'luxury', 'true'),
(414, 'Tyrant', ' Överflöd', 'tyrant', 2100000, 'super', 'Super Cars', 'luxury', 'true'),
(415, 'Tyrus', 'Progen', 'tyrus', 230000, 'super', 'Super Cars', 'luxury', 'true'),
(416, 'Vacca', 'Pegassi', 'vacca', 105000, 'super', 'Super Cars', 'luxury', 'true'),
(417, 'Vagner', 'Dewbauchee', 'vagner', 1660000, 'super', 'Super Cars', 'luxury', 'true'),
(418, 'Visione', 'Grotti', 'visione', 750000, 'sports', 'Sports Cars', 'luxury', 'true'),
(419, 'Voltic', 'Coil', 'voltic', 120000, 'super', 'Super Cars', 'luxury', 'true'),
(420, 'Rocket Voltic', 'Coil', 'voltic2', 9830400, 'super', 'Super Cars', 'luxury', 'true'),
(421, 'XA-21', 'Ocelot', 'xa21', 180000, 'super', 'Super Cars', 'luxury', 'true'),
(422, 'Zentorno', 'Pegassi', 'zentorno', 340000, 'super', 'Super Cars', 'luxury', 'true'),
(423, 'Zorrusso', 'Pegassi', 'zorrusso', 277000, 'super', 'Super Cars', 'luxury', 'true'),
(424, 'Bison', 'Bravado', 'bison', 18000, 'vans', 'Vans', 'pdm', 'true'),
(425, 'Bobcat XL Open', 'Vapid', 'bobcatxl', 13500, 'vans', 'Vans', 'pdm', 'true'),
(426, 'Burrito', 'Declasse', 'burrito3', 4000, 'vans', 'Vans', 'pdm', 'true'),
(427, 'Burrito Custom', 'Declasse', 'gburrito2', 11500, 'vans', 'Vans', 'pdm', 'true'),
(428, 'Rumpo', 'Bravado', 'rumpo', 9000, 'vans', 'Vans', 'pdm', 'true'),
(429, 'Journey', 'Zirconium', 'journey', 6500, 'vans', 'Vans', 'pdm', 'true'),
(430, 'Minivan', 'Vapid', 'minivan', 7000, 'vans', 'Vans', 'pdm', 'true'),
(431, 'Minivan Custom', 'Vapid', 'minivan2', 10000, 'vans', 'Vans', 'pdm', 'true'),
(432, 'Paradise', 'Bravado', 'paradise', 9000, 'vans', 'Vans', 'pdm', 'true'),
(433, 'Rumpo Custom', 'Bravado', 'rumpo3', 19500, 'vans', 'Vans', 'pdm', 'true'),
(434, 'Speedo', 'Vapid', 'speedo', 10000, 'vans', 'Vans', 'pdm', 'true'),
(435, 'Speedo Custom', 'Vapid', 'speedo4', 15000, 'vans', 'Vans', 'pdm', 'true'),
(436, 'Surfer', 'BF', 'surfer', 9000, 'vans', 'Vans', 'pdm', 'true'),
(437, 'Youga Classic 4x4', 'Bravado', 'youga3', 15000, 'vans', 'Vans', 'pdm', 'true'),
(438, 'Youga', 'Bravado', 'youga', 8000, 'vans', 'Vans', 'pdm', 'true'),
(439, 'Youga Classic', 'Bravado', 'youga2', 14500, 'vans', 'Vans', 'pdm', 'true'),
(440, 'Youga', 'Bravado', 'youga4', 85000, 'vans', 'Vans', 'pdm', 'true'),
(441, 'Mule', 'Box Truck', 'mule5', 221000, 'vans', 'Vans', 'pdm', 'true'),
(442, 'Sadler', 'Vapid', 'sadler', 20000, 'offroad', 'Off-Road', 'pdm', 'true'),
(443, 'Guardian', 'Annis', 'guardian', 21000, 'offroad', 'Off-Road', 'pdm', 'true'),
(444, 'Slam Truck', 'Vapid', 'slamtruck', 100000, 'muscle', 'Muscle Cars', 'pdm', 'true'),
(445, 'Warrener HKR', 'Vulcar', 'warrener2', 30000, 'sedans', 'Sedans', 'pdm', 'true'),
(446, 'Squalo', 'Shitzu', 'squalo', 40000, 'boats', 'Boats', 'boats', 'true'),
(447, 'Marquis', 'Dinka', 'marquis', 40000, 'boats', 'Boats', 'boats', 'true'),
(448, 'Seashark', 'Speedophile', 'seashark', 40000, 'boats', 'Boats', 'boats', 'true'),
(449, 'Seashark', 'Speedophile', 'seashark2', 40000, 'boats', 'Boats', 'boats', 'true'),
(450, 'Seashark', 'Speedophile', 'seashark3', 40000, 'boats', 'Boats', 'boats', 'true'),
(451, 'Shitzu', 'Jetmax', 'jetmax', 40000, 'boats', 'Boats', 'boats', 'true'),
(452, 'Shitzu', 'Tropic', 'tropic', 40000, 'boats', 'Boats', 'boats', 'true'),
(453, 'Shitzu', 'Tropic', 'tropic2', 40000, 'boats', 'Boats', 'boats', 'true'),
(454, 'Nagasaki', 'Dinghy', 'dinghy', 40000, 'boats', 'Boats', 'boats', 'true'),
(455, 'Nagasaki', 'Dinghy', 'dinghy2', 40000, 'boats', 'Boats', 'boats', 'true'),
(456, 'Nagasaki', 'Dinghy', 'dinghy3', 40000, 'boats', 'Boats', 'boats', 'true'),
(457, 'Nagasaki', 'Dinghy', 'dinghy4', 40000, 'boats', 'Boats', 'boats', 'true'),
(458, 'Shitzu', 'Suntrap', 'suntrap', 40000, 'boats', 'Boats', 'boats', 'true'),
(459, 'Speeder', 'Pegassi', 'speeder', 40000, 'boats', 'Boats', 'boats', 'true'),
(460, 'Speeder', 'Pegassi', 'speeder2', 40000, 'boats', 'Boats', 'boats', 'true'),
(461, 'Longfin', 'Shitzu', 'longfin', 40000, 'boats', 'Boats', 'boats', 'true'),
(462, 'Toro', 'Lampadati', 'toro', 40000, 'boats', 'Boats', 'boats', 'true'),
(463, 'Toro', 'Lampadati', 'toro2', 40000, 'boats', 'Boats', 'boats', 'true'),
(464, 'Buzzard', 'Unknown', 'buzzard2', 52000, 'helicopters', 'Helicopters', 'air', 'true'),
(465, 'Frogger', 'Unknown', 'frogger', 52000, 'helicopters', 'Helicopters', 'air', 'true'),
(466, 'Frogger', 'Unknown', 'frogger2', 52000, 'helicopters', 'Helicopters', 'air', 'true'),
(467, 'Maverick', 'Unknown', 'maverick', 52000, 'helicopters', 'Helicopters', 'air', 'true'),
(468, 'Swift', 'Buckingham', 'swift', 52000, 'helicopters', 'Helicopters', 'air', 'true'),
(469, 'Swift', 'Buckingham', 'swift2', 52000, 'helicopters', 'Helicopters', 'air', 'true'),
(470, 'Sea Sparrow', 'Unknown', 'seasparrow', 52000, 'helicopters', 'Helicopters', 'air', 'true'),
(471, 'Sparrow', 'Unknown', 'seasparrow2', 52000, 'helicopters', 'Helicopters', 'air', 'true'),
(472, 'Sparrow', 'Unknown', 'seasparrow3', 52000, 'helicopters', 'Helicopters', 'air', 'true'),
(473, 'SuperVolito', 'Buckingham', 'supervolito', 52000, 'helicopters', 'Helicopters', 'air', 'true'),
(474, 'SuperVolito Carbon', 'Buckingham', 'supervolito2', 52000, 'helicopters', 'Helicopters', 'air', 'true'),
(475, 'Volatus', 'Buckingham', 'volatus', 52000, 'helicopters', 'Helicopters', 'air', 'true'),
(476, 'Havok', 'Nagasaki', 'havok', 52000, 'helicopters', 'Helicopters', 'air', 'true'),
(477, 'Duster', 'Unknown', 'duster', 45000, 'planes', 'Planes', 'air', 'true'),
(478, 'Luxor', 'Buckingham', 'luxor', 45000, 'planes', 'Planes', 'air', 'true'),
(479, 'Luxor Deluxe', 'Buckingham', 'luxor2', 45000, 'planes', 'Planes', 'air', 'true'),
(480, 'Mallard', 'Unknown', 'stunt', 45000, 'planes', 'Planes', 'air', 'true'),
(481, 'Mammatus', 'Unknown', 'mammatus', 45000, 'planes', 'Planes', 'air', 'true'),
(482, 'Velum', 'Unknown', 'velum', 45000, 'planes', 'Planes', 'air', 'true'),
(483, 'Velum', 'Unknown', 'velum2', 45000, 'planes', 'Planes', 'air', 'true'),
(484, 'Shamal', 'Buckingham', 'shamal', 45000, 'planes', 'Planes', 'air', 'true'),
(485, 'Vestra', 'Buckingham', 'vestra', 45000, 'planes', 'Planes', 'air', 'true'),
(486, 'Dodo', 'Mammoth', 'dodo', 45000, 'planes', 'Planes', 'air', 'true'),
(487, 'Howard NX-25', 'Buckingham', 'howard', 45000, 'planes', 'Planes', 'air', 'true'),
(488, 'Alpha-Z1', 'Buckingham', 'alphaz1', 45000, 'planes', 'Planes', 'air', 'true'),
(489, 'Nimbus', 'Buckingham', 'nimbus', 45000, 'planes', 'Planes', 'air', 'true'),
(490, 'Brioso 300 Widebody', 'Grotti', 'brioso3', 125000, 'compacts', 'Compacts', 'pdm', 'true'),
(491, 'Conada', 'Buckingham', 'conada', 115000, 'helicopters', 'Helicopters', 'air', 'true'),
(492, 'Corsita', 'Lampadati', 'corsita', 90000, 'sports', 'Sports Cars', 'luxury', 'true'),
(493, 'Draugur', 'Declasse', 'draugur', 99000, 'offroad', 'Off-Road', 'pdm', 'true'),
(494, 'Greenwood', 'Bravado', 'greenwood', 105000, 'muscle', 'Muscle Cars', 'pdm', 'true'),
(495, 'Kanjo SJ', 'Dinka', 'kanjosj', 143000, 'coupes', 'Coupes', 'pdm', 'true'),
(496, 'LM87', 'Benefactor', 'lm87', 155000, 'super', 'Super Cars', 'luxury', 'true'),
(497, 'Omnis e-GT', 'Obey', 'omnisegt', 185000, 'sports', 'Sports Cars', 'luxury', 'true'),
(498, 'Postlude', 'Dinka', 'postlude', 90000, 'coupes', 'Coupes', 'pdm', 'true'),
(499, 'Rhinehart', 'Ubermacht', 'rhinehart ', 105000, 'sedans', 'Sedans', 'pdm', 'true'),
(500, 'Ruiner ZZ-8', 'Imponte', 'ruiner4', 85000, 'muscle', 'Muscle Cars', 'pdm', 'true'),
(501, 'Sentinel Classic Widebody', 'Ubermacht', 'sentinel4', 140000, 'sports', 'Sports Cars', 'luxury', 'true'),
(502, 'SM722', 'Benefactor', 'sm722', 125000, 'sports', 'Sports Cars', 'luxury', 'true'),
(503, '10F', 'Obey', 'tenf', 185000, 'sports', 'Sports Cars', 'luxury', 'true'),
(504, '10F Widebody', 'Obey', 'tenf2', 215000, 'sports', 'Sports Cars', 'luxury', 'true'),
(505, 'Torero XO', 'Pegassi', 'torero2', 245000, 'super', 'Super Cars', 'luxury', 'true'),
(506, 'Vigero ZX', 'Declasse', 'vigero2', 105000, 'muscle', 'Muscle Cars', 'pdm', 'true'),
(507, 'Weevil Custom', 'BF', 'weevil2', 95000, 'muscle', 'Muscle Cars', 'pdm', 'true'),
(508, 'Phantom', 'JoBuilt', 'phantom', 90000, 'commercial', 'Conventional', 'cvs', 'true'),
(509, 'Trailer', 'BigDog', 'trailers', 75000, 'utility', 'Dry Van', 'cvs', 'true');

-- --------------------------------------------------------

--
-- Table structure for table `qb-drugs-config`
--

CREATE TABLE `qb-drugs-config` (
  `qb-drugs-config-id` tinyint(4) UNSIGNED NOT NULL,
  `usetarget` enum('true','false') NOT NULL DEFAULT 'true',
  `policecallchance` int(3) UNSIGNED NOT NULL,
  `successchance` int(3) UNSIGNED NOT NULL DEFAULT 50,
  `scamchance` int(3) UNSIGNED NOT NULL DEFAULT 25,
  `robberychance` int(3) UNSIGNED NOT NULL DEFAULT 25,
  `minimumdrugsalepolice` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `usemarkedbills` enum('true','false') NOT NULL DEFAULT 'true',
  `deliveryrepgain` int(10) UNSIGNED NOT NULL DEFAULT 1,
  `deliveryreploss` int(10) UNSIGNED NOT NULL DEFAULT 1,
  `policedeliverymodifer` int(10) UNSIGNED NOT NULL DEFAULT 2,
  `wrongamountfee` int(10) UNSIGNED NOT NULL DEFAULT 2,
  `overduedeliveryfee` int(10) UNSIGNED NOT NULL DEFAULT 4
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `qb-drugs-config`
--

INSERT INTO `qb-drugs-config` (`qb-drugs-config-id`, `usetarget`, `policecallchance`, `successchance`, `scamchance`, `robberychance`, `minimumdrugsalepolice`, `usemarkedbills`, `deliveryrepgain`, `deliveryreploss`, `policedeliverymodifer`, `wrongamountfee`, `overduedeliveryfee`) VALUES
(1, 'true', 15, 50, 25, 25, 0, 'true', 1, 1, 2, 2, 4);

-- --------------------------------------------------------

--
-- Table structure for table `qb-drugs-config-deliveryitems`
--

CREATE TABLE `qb-drugs-config-deliveryitems` (
  `qb-drugs-config-deliveryitems-id` int(11) NOT NULL,
  `item` varchar(50) NOT NULL,
  `minrep` int(11) NOT NULL DEFAULT 0,
  `payout` int(11) NOT NULL DEFAULT 1000
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `qb-drugs-config-deliveryitems`
--

INSERT INTO `qb-drugs-config-deliveryitems` (`qb-drugs-config-deliveryitems-id`, `item`, `minrep`, `payout`) VALUES
(1, 'weed_brick', 0, 1000),
(2, 'coke_brick', 0, 1000);

-- --------------------------------------------------------

--
-- Table structure for table `qb-drugs-config-deliverylocations`
--

CREATE TABLE `qb-drugs-config-deliverylocations` (
  `qb-drugs-config-deliverylocations-id` int(10) UNSIGNED NOT NULL,
  `label` varchar(50) NOT NULL,
  `coords` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `qb-drugs-config-deliverylocations`
--

INSERT INTO `qb-drugs-config-deliverylocations` (`qb-drugs-config-deliverylocations-id`, `label`, `coords`) VALUES
(1, 'Stripclub', 'vector3(106.24, -1280.32, 29.24)'),
(2, 'Vinewood Video', 'vector3(223.98, 121.53, 102.76)'),
(3, 'Taxi', 'vector3(882.67, -160.26, 77.11)'),
(4, 'Resort', 'vector3(-1245.63, 376.21, 75.34)'),
(5, 'Bahama Mamas', 'vector3(-1383.1, -639.99, 28.67)');

-- --------------------------------------------------------

--
-- Table structure for table `qb-drugs-config-drugsprice`
--

CREATE TABLE `qb-drugs-config-drugsprice` (
  `qb-drugs-config-drugsprice-id` int(10) UNSIGNED NOT NULL,
  `name` varchar(50) NOT NULL,
  `min` int(10) UNSIGNED NOT NULL,
  `max` int(10) UNSIGNED NOT NULL,
  `enabled` enum('true','false') NOT NULL DEFAULT 'true'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `qb-drugs-config-drugsprice`
--

INSERT INTO `qb-drugs-config-drugsprice` (`qb-drugs-config-drugsprice-id`, `name`, `min`, `max`, `enabled`) VALUES
(1, 'weed_white-widow', 15, 24, 'true'),
(2, 'weed_og-kush', 15, 28, 'true'),
(3, 'weed_skunk', 15, 31, 'true'),
(4, 'weed_amnesia', 18, 34, 'true'),
(5, 'weed_purple-haze', 18, 37, 'true'),
(6, 'weed_ak47', 18, 40, 'true'),
(7, 'crack_baggy', 18, 34, 'true'),
(8, 'cokebaggy', 18, 37, 'true'),
(9, 'meth', 18, 40, 'true');

-- --------------------------------------------------------

--
-- Table structure for table `qb-drugs-config-products`
--

CREATE TABLE `qb-drugs-config-products` (
  `qb-drugs-config-products-id` int(10) UNSIGNED NOT NULL,
  `name` varchar(50) NOT NULL,
  `price` int(10) UNSIGNED NOT NULL,
  `amount` int(10) UNSIGNED NOT NULL,
  `info` text NOT NULL,
  `type` enum('item','weapon') NOT NULL DEFAULT 'item',
  `minrep` int(10) UNSIGNED NOT NULL,
  `enabled` enum('true','false') NOT NULL DEFAULT 'true'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `qb-drugs-config-products`
--

INSERT INTO `qb-drugs-config-products` (`qb-drugs-config-products-id`, `name`, `price`, `amount`, `info`, `type`, `minrep`, `enabled`) VALUES
(1, 'weed_white-widow', 15, 150, '', 'item', 0, 'true'),
(2, 'weed_skunk', 15, 150, '', 'item', 20, 'true'),
(3, 'weed_purple-haze', 15, 150, '', 'item', 40, 'true'),
(4, 'weed_og-kush', 15, 150, '', 'item', 60, 'true'),
(5, 'weed_amnesia', 15, 150, '', 'item', 80, 'true'),
(6, 'weed_white-widow_seed', 15, 150, '', 'item', 100, 'true'),
(7, 'weed_skunk_seed', 15, 150, '', 'item', 120, 'true'),
(8, 'weed_purple-haze_seed', 15, 150, '', 'item', 140, 'true'),
(9, 'weed_og-kush_seed', 15, 150, '', 'item', 160, 'true'),
(10, 'weed_amnesia_seed', 15, 150, '', 'item', 180, 'true');

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

-- --------------------------------------------------------

--
-- Table structure for table `qb-garages-locations`
--

CREATE TABLE `qb-garages-locations` (
  `qb-garages-location_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(50) NOT NULL DEFAULT '',
  `label` varchar(50) NOT NULL DEFAULT '',
  `takevehicle` text NOT NULL,
  `spawnpoint` text NOT NULL,
  `putvehicle` text NOT NULL,
  `showblip` enum('true','false') NOT NULL,
  `blipname` text DEFAULT NULL,
  `blipnumber` int(4) NOT NULL,
  `type` enum('public','depot','gang','job') NOT NULL,
  `vehicle` enum('car','air','sea','rig') NOT NULL,
  `job` text NOT NULL,
  `enabled` enum('true','false') NOT NULL DEFAULT 'true'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `qb-garages-locations`
--

INSERT INTO `qb-garages-locations` (`qb-garages-location_id`, `name`, `label`, `takevehicle`, `spawnpoint`, `putvehicle`, `showblip`, `blipname`, `blipnumber`, `type`, `vehicle`, `job`, `enabled`) VALUES
(1, 'motelgarage', 'Motel Parking', 'vector3(273.43, -343.99, 44.91)', 'vector4(270.94, -342.96, 43.97, 161.5)', 'vector3(276.69, -339.85, 44.91)', 'true', 'Public Parking', 357, 'public', 'car', '', 'true'),
(2, 'sapcounsel', 'San Andreas Parking', 'vector3(-330.01, -780.33, 33.96)', 'vector4(-334.44, -780.75, 33.96, 137.5)', 'vector3(-336.31, -774.93, 33.96)', 'true', 'Public Parking', 357, 'public', 'car', '', 'true'),
(3, 'spanishave', 'Spanish Ave Parking', 'vector3(-1160.86, -741.41, 19.63)', 'vector4(-1163.88, -749.32, 18.42, 35.5)', 'vector3(-1147.58, -738.11, 19.31)', 'true', 'Public Parking', 357, 'public', 'car', '', 'true'),
(4, 'caears24', 'Caears 24 Parking', 'vector3(69.84, 12.6, 68.96)', 'vector4(73.21, 10.72, 68.83, 163.5)', 'vector3(65.43, 21.19, 69.47)', 'true', 'Public Parking', 357, 'public', 'car', '', 'true'),
(5, 'caears242', 'Caears 24 Parking', 'vector3(-475.31, -818.73, 30.46)', 'vector4(-472.03, -815.47, 30.5, 177.5)', 'vector3(-453.6, -817.08, 30.61)', 'true', 'Public Parking', 357, 'public', 'car', '', 'true'),
(6, 'lagunapi', 'Laguna Parking', 'vector3(364.37, 297.83, 103.49)', 'vector4(367.49, 297.71, 103.43, 340.5)', 'vector3(363.04, 283.51, 103.38)', 'true', 'Public Parking', 357, 'public', 'car', '', 'true'),
(7, 'airportp', 'Airport Parking', 'vector3(-796.86, -2024.85, 8.88)', 'vector4(-800.41, -2016.53, 9.32, 48.5)', 'vector3(-804.84, -2023.21, 9.16)', 'true', 'Public Parking', 357, 'public', 'car', '', 'true'),
(8, 'beachp', 'Beach Parking', 'vector3(-1183.1, -1511.11, 4.36)', 'vector4(-1181.0, -1505.98, 4.37, 214.5)', 'vector3(-1176.81, -1498.63, 4.37)', 'true', 'Public Parking', 357, 'public', 'car', '', 'true'),
(9, 'themotorhotel', 'The Motor Hotel Parking', 'vector3(1137.77, 2663.54, 37.9)', 'vector4(1137.69, 2673.61, 37.9, 359.5)', 'vector3(1137.75, 2652.95, 37.9)', 'true', 'Public Parking', 357, 'public', 'car', '', 'true'),
(10, 'liqourparking', 'Liqour Parking', 'vector3(934.95, 3606.59, 32.81)', 'vector4(941.57, 3619.99, 32.5, 141.5)', 'vector3(939.37, 3612.25, 32.69)', 'true', 'Public Parking', 357, 'public', 'car', '', 'true'),
(11, 'shoreparking', 'Shore Parking', 'vector3(1726.21, 3707.16, 34.17)', 'vector4(1730.31, 3711.07, 34.2, 20.5)', 'vector3(1737.13, 3718.91, 34.04)', 'true', 'Public Parking', 357, 'public', 'car', '', 'true'),
(12, 'haanparking', 'Bell Farms Parking', 'vector3(78.34, 6418.74, 31.28)', 'vector4(70.71, 6425.16, 30.92, 68.5)', 'vector3(85.3, 6427.52, 31.33)', 'true', 'Public Parking', 357, 'public', 'car', '', 'true'),
(13, 'dumbogarage', 'Dumbo Private Parking', 'vector3(157.26, -3240.00, 7.00)', 'vector4(165.32, -3236.10, 5.93, 268.5)', 'vector3(165.32, -3230.00, 5.93)', 'true', 'Public Parking', 357, 'public', 'car', '', 'true'),
(14, 'pillboxgarage', 'Pillbox Garage Parking', 'vector3(215.9499, -809.698, 30.731)', 'vector4(234.1942, -787.066, 30.193, 159.6)', 'vector3(218.0894, -781.370, 30.389)', 'true', 'Public Parking', 357, 'public', 'car', '', 'true'),
(15, 'impoundlot', 'Impound Lot', 'vector3(409.89, -1623.51, 29.29)', 'vector4(407.92, -1646.29, 29.29, 226.39)', '', 'true', 'Impound Lot', 68, 'depot', 'car', '', 'true'),
(16, 'ballas', 'Ballas', 'vector3(98.50, -1954.49, 20.84)', 'vector4(98.50, -1954.49, 20.75, 335.73)', 'vector3(94.75, -1959.93, 20.84)', 'false', 'Ballas', 357, 'gang', 'car', 'ballas', 'true'),
(17, 'families', 'La Familia', 'vector3(-811.65, 187.49, 72.48)', 'vector4(-818.43, 184.97, 72.28, 107.85)', 'vector3(-811.65, 187.49, 72.48)', 'false', 'La Familia', 357, 'gang', 'car', 'families', 'true'),
(18, 'lostmc', 'Lost MC', 'vector3(957.25, -129.63, 74.39)', 'vector4(957.25, -129.63, 74.39, 199.21)', 'vector3(950.47, -122.05, 74.36)', 'false', 'Lost MC', 357, 'gang', 'car', 'lostmc', 'true'),
(19, 'cartel', 'Cartel', 'vector3(1407.18, 1118.04, 114.84)', 'vector4(1407.18, 1118.04, 114.84, 88.34)', 'vector3(1407.18, 1118.04, 114.84)', 'false', 'Cartel', 357, 'gang', 'car', 'cartel', 'true'),
(20, 'police', 'Police', 'vector3(454.6, -1017.4, 28.4)', 'vector4(438.4, -1018.3, 27.7, 90.0)', 'vector3(452.88, -1006.98, 27.5)', 'false', 'Police', 357, 'job', 'car', 'police', 'true'),
(21, 'intairport', 'Airport Hangar', 'vector3(-1025.92, -3017.86, 13.95)', 'vector4(-979.2, -2995.51, 13.95, 52.19)', 'vector3(-1003.38, -3008.87, 13.95)', 'true', 'Hangar', 360, 'public', 'air', '', 'true'),
(22, 'higginsheli', 'Higgins Helitours', 'vector3(-722.15, -1472.79, 5.0)', 'vector4(-724.83, -1443.89, 5.0, 140.1)', 'vector3(-745.48, -1468.46, 5.0)', 'true', 'Hangar', 360, 'public', 'air', '', 'true'),
(23, 'airsshores', 'Sandy Shores Hangar', 'vector3(1758.19, 3296.66, 41.14)', 'vector4(1740.98, 3279.08, 41.75, 106.77)', 'vector3(1740.4, 3283.92, 41.1)', 'true', 'Hangar', 360, 'public', 'air', '', 'true'),
(24, 'airdepot', 'Air Depot', 'vector3(-1243.29, -3392.3, 13.94)', 'vector4(-1269.67, -3377.74, 13.94, 327.88)', '', 'true', 'Air Depot', 359, 'depot', 'air', '', 'true'),
(25, 'lsymc', 'LSYMC Boathouse', 'vector3(-794.66, -1510.83, 1.59)', 'vector4(-793.58, -1501.4, 0.12, 111.5)', 'vector3(-793.58, -1501.4, 0.12)', 'true', 'Boathouse', 356, 'public', 'sea', '', 'true'),
(26, 'paleto', 'Paleto Boathouse', 'vector3(-277.46, 6637.2, 7.48)', 'vector4(-289.2, 6637.96, 1.01, 45.5)', 'vector3(-289.2, 6637.96, 1.01)', 'true', 'Boathouse', 356, 'public', 'sea', '', 'true'),
(27, 'millars', 'Millars Boathouse', 'vector3(1299.24, 4216.69, 33.9)', 'vector4(1297.82, 4209.61, 30.12, 253.5)', 'vector3(1297.82, 4209.61, 30.12)', 'true', 'Boathouse', 356, 'public', 'sea', '', 'true'),
(28, 'seadepot', 'LSYMC Depot', 'vector3(-772.98, -1430.76, 1.59)', 'vector4(-729.77, -1355.49, 1.19, 142.5)', '', 'true', 'LSYMC Depot', 356, 'depot', 'sea', '', 'true'),
(29, 'casinogarage', 'Casino Parking', 'vector3(925.3, 51.85, 81.11)', 'vector4(918.77, 51.73, 80.16, 329.43)', 'vector3(914.92, 37.85, 80.07)', 'true', 'Public Parking', 357, 'public', 'car', '', 'true');

-- --------------------------------------------------------

--
-- Table structure for table `qb-shops-config`
--

CREATE TABLE `qb-shops-config` (
  `firearmslicensecheck` enum('true','false') NOT NULL DEFAULT 'false',
  `sellcasinochips-coords` text NOT NULL,
  `sellcasinochips-radius` float NOT NULL,
  `sellcasinochips-ped` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `qb-shops-config`
--

INSERT INTO `qb-shops-config` (`firearmslicensecheck`, `sellcasinochips-coords`, `sellcasinochips-radius`, `sellcasinochips-ped`) VALUES
('false', 'vector4(950.37, 34.72, 71.87, 33.82)', 1.5, 's_m_y_casino_01');

-- --------------------------------------------------------

--
-- Table structure for table `qb-shops-config-locations`
--

CREATE TABLE `qb-shops-config-locations` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` text NOT NULL,
  `label` text NOT NULL,
  `type` text DEFAULT NULL,
  `coords` text NOT NULL,
  `ped` text NOT NULL,
  `scenario` text NOT NULL,
  `radius` float UNSIGNED NOT NULL,
  `targetIcon` text NOT NULL,
  `targetLabel` text NOT NULL,
  `products` text NOT NULL,
  `showblip` enum('true','false') NOT NULL DEFAULT 'true',
  `blipsprite` int(11) UNSIGNED NOT NULL,
  `blipscale` float UNSIGNED NOT NULL,
  `blipcolor` int(11) UNSIGNED NOT NULL,
  `enabled` enum('true','false') NOT NULL DEFAULT 'true'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `qb-shops-config-locations`
--

INSERT INTO `qb-shops-config-locations` (`id`, `name`, `label`, `type`, `coords`, `ped`, `scenario`, `radius`, `targetIcon`, `targetLabel`, `products`, `showblip`, `blipsprite`, `blipscale`, `blipcolor`, `enabled`) VALUES
(1, '247supermarket', '24/7 Supermarket', '', 'vector4(24.47, -1346.62, 29.5, 271.66)', 'mp_m_shopkeep_01', 'WORLD_HUMAN_STAND_MOBILE', 1.5, 'fas fa-shopping-basket', 'Open Shop', 'normal', 'true', 52, 0.6, 0, 'true'),
(2, '247supermarket2', '24/7 Supermarket', '', 'vector4(-3039.54, 584.38, 7.91, 17.27)', 'mp_m_shopkeep_01', 'WORLD_HUMAN_STAND_MOBILE', 1.5, 'fas fa-shopping-basket', 'Open Shop', 'normal', 'true', 52, 0.6, 0, 'true'),
(3, '247supermarket3', '24/7 Supermarket', '', 'vector4(-3242.97, 1000.01, 12.83, 357.57)', 'mp_m_shopkeep_01', 'WORLD_HUMAN_STAND_MOBILE', 1.5, 'fas fa-shopping-basket', 'Open Shop', 'normal', 'true', 52, 0.6, 0, 'true'),
(4, '247supermarket4', '24/7 Supermarket', '', 'vector4(1728.07, 6415.63, 35.04, 242.95)', 'mp_m_shopkeep_01', 'WORLD_HUMAN_STAND_MOBILE', 1.5, 'fas fa-shopping-basket', 'Open Shop', 'normal', 'true', 52, 0.6, 0, 'true'),
(5, '247supermarket5', '24/7 Supermarket', '', 'vector4(1959.82, 3740.48, 32.34, 301.57)', 'mp_m_shopkeep_01', 'WORLD_HUMAN_STAND_MOBILE', 1.5, 'fas fa-shopping-basket', 'Open Shop', 'normal', 'true', 52, 0.6, 0, 'true'),
(6, '247supermarket6', '24/7 Supermarket', '', 'vector4(549.13, 2670.85, 42.16, 99.39)', 'mp_m_shopkeep_01', 'WORLD_HUMAN_STAND_MOBILE', 1.5, 'fas fa-shopping-basket', 'Open Shop', 'normal', 'true', 52, 0.6, 0, 'true'),
(7, '247supermarket7', '24/7 Supermarket', '', 'vector4(2677.47, 3279.76, 55.24, 335.08)', 'mp_m_shopkeep_01', 'WORLD_HUMAN_STAND_MOBILE', 1.5, 'fas fa-shopping-basket', 'Open Shop', 'normal', 'true', 52, 0.6, 0, 'true'),
(8, '247supermarket8', '24/7 Supermarket', '', 'vector4(2556.66, 380.84, 108.62, 356.67)', 'mp_m_shopkeep_01', 'WORLD_HUMAN_STAND_MOBILE', 1.5, 'fas fa-shopping-basket', 'Open Shop', 'normal', 'true', 52, 0.6, 0, 'true'),
(9, '247supermarket9', '24/7 Supermarket', '', 'vector4(372.66, 326.98, 103.57, 253.73)', 'mp_m_shopkeep_01', 'WORLD_HUMAN_STAND_MOBILE', 1.5, 'fas fa-shopping-basket', 'Open Shop', 'normal', 'true', 52, 0.6, 0, 'true'),
(10, 'ltdgasoline', 'LTD Gasoline', '', 'vector4(-47.02, -1758.23, 29.42, 45.05)', 'mp_m_shopkeep_01', 'WORLD_HUMAN_STAND_MOBILE', 1.5, 'fas fa-shopping-basket', 'Open Shop', 'normal', 'true', 52, 0.6, 0, 'true'),
(11, 'ltdgasoline2', 'LTD Gasoline', '', 'vector4(-706.06, -913.97, 19.22, 88.04)', 'mp_m_shopkeep_01', 'WORLD_HUMAN_STAND_MOBILE', 1.5, 'fas fa-shopping-basket', 'Open Shop', 'normal', 'true', 52, 0.6, 0, 'true'),
(12, 'ltdgasoline3', 'LTD Gasoline', '', 'vector4(-1820.02, 794.03, 138.09, 135.45)', 'mp_m_shopkeep_01', 'WORLD_HUMAN_STAND_MOBILE', 1.5, 'fas fa-shopping-basket', 'Open Shop', 'normal', 'true', 52, 0.6, 0, 'true'),
(13, 'ltdgasoline4', 'LTD Gasoline', '', 'vector4(1164.71, -322.94, 69.21, 101.72)', 'mp_m_shopkeep_01', 'WORLD_HUMAN_STAND_MOBILE', 1.5, 'fas fa-shopping-basket', 'Open Open Shop', 'normal', 'true', 52, 0.6, 0, 'true'),
(14, 'ltdgasoline5', 'LTD Gasoline', '', 'vector4(1697.87, 4922.96, 42.06, 324.71)', 'mp_m_shopkeep_01', 'WORLD_HUMAN_STAND_MOBILE', 1.5, 'fas fa-shopping-basket', 'Open Shop', 'normal', 'true', 52, 0.6, 0, 'true'),
(15, 'robsliquor', 'Rob\'s Liqour', '', 'vector4(-1221.58, -908.15, 12.33, 35.49)', 'mp_m_shopkeep_01', 'WORLD_HUMAN_STAND_MOBILE', 1.5, 'fas fa-shopping-basket', 'Open Shop', 'liquor', 'true', 52, 0.6, 0, 'true'),
(16, 'robsliquor2', 'Rob\'s Liqour', '', 'vector4(-1486.59, -377.68, 40.16, 139.51)', 'mp_m_shopkeep_01', 'WORLD_HUMAN_STAND_MOBILE', 1.5, 'fas fa-shopping-basket', 'Open Shop', 'liquor', 'true', 52, 0.6, 0, 'true'),
(17, 'robsliquor3', 'Rob\'s Liqour', '', 'vector4(-2966.39, 391.42, 15.04, 87.48)', 'mp_m_shopkeep_01', 'WORLD_HUMAN_STAND_MOBILE', 1.5, 'fas fa-shopping-basket', 'Open Shop', 'liquor', 'true', 52, 0.6, 0, 'true'),
(18, 'robsliquor4', 'Rob\'s Liqour', '', 'vector4(1165.17, 2710.88, 38.16, 179.43)', 'mp_m_shopkeep_01', 'WORLD_HUMAN_STAND_MOBILE', 1.5, 'fas fa-shopping-basket', 'Open Shop', 'liquor', 'true', 52, 0.6, 0, 'true'),
(19, 'robsliquor5', 'Rob\'s Liqour', '', 'vector4(1134.2, -982.91, 46.42, 277.24)', 'mp_m_shopkeep_01', 'WORLD_HUMAN_STAND_MOBILE', 1.5, 'fas fa-shopping-basket', 'Open Shop', 'liquor', 'true', 52, 0.6, 0, 'true'),
(20, 'hardware', 'Hardware Store', '', 'vector4(45.68, -1749.04, 29.61, 53.13)', 'mp_m_waremech_01', 'WORLD_HUMAN_CLIPBOARD', 1.5, 'fas fa-wrench', 'Open Hardware Store', 'hardware', 'true', 402, 0.8, 0, 'true'),
(21, 'hardware2', 'Hardware Store', '', 'vector4(2747.71, 3472.85, 55.67, 255.08)', 'mp_m_waremech_01', 'WORLD_HUMAN_CLIPBOARD', 1.5, 'fas fa-wrench', 'Open Hardware Store', 'hardware', 'true', 402, 0.8, 0, 'true'),
(22, 'hardware3', 'Hardware Store', '', 'vector4(-421.83, 6136.13, 31.88, 228.2)', 'mp_m_waremech_01', 'WORLD_HUMAN_CLIPBOARD', 1.5, 'fas fa-wrench', 'Hardware Store', 'hardware', 'true', 402, 0.8, 0, 'true'),
(23, 'ammunation', 'Ammunation', 'weapon', 'vector4(-661.96, -933.53, 21.83, 177.05)', 's_m_y_ammucity_01', 'WORLD_HUMAN_COP_IDLES', 1.5, 'fas fa-gun', 'Open Ammunation', 'weapons', 'true', 110, 0.6, 0, 'true'),
(24, 'ammunation2', 'Ammunation', 'weapon', 'vector4(809.68, -2159.13, 29.62, 1.43)', 's_m_y_ammucity_01', 'WORLD_HUMAN_COP_IDLES', 1.5, 'fas fa-gun', 'Open Ammunation', 'weapons', 'true', 110, 0.6, 0, 'true'),
(25, 'ammunation3', 'Ammunation', 'weapon', 'vector4(1692.67, 3761.38, 34.71, 227.65)', 's_m_y_ammucity_01', 'WORLD_HUMAN_COP_IDLES', 1.5, 'fas fa-gun', 'Open Ammunation', 'weapons', 'true', 110, 0.6, 0, 'true'),
(26, 'ammunation4', 'Ammunation', 'weapon', 'vector4(-331.23, 6085.37, 31.45, 228.02)', 's_m_y_ammucity_01', 'WORLD_HUMAN_COP_IDLES', 1.5, 'fas fa-gun', 'Open Ammunation', 'weapons', 'true', 110, 0.6, 0, 'true'),
(27, 'ammunation5', 'Ammunation', 'weapon', 'vector4(253.63, -51.02, 69.94, 72.91)', 's_m_y_ammucity_01', 'WORLD_HUMAN_COP_IDLES', 1.5, 'fas fa-gun', 'Open Ammunation', 'weapons', 'true', 110, 0.6, 0, 'true'),
(28, 'ammunation6', 'Ammunation', 'weapon', 'vector4(23.0, -1105.67, 29.8, 162.91)', 's_m_y_ammucity_01', 'WORLD_HUMAN_COP_IDLES', 1.5, 'fas fa-gun', 'Open Ammunation', 'weapons', 'true', 110, 0.6, 0, 'true'),
(29, 'ammunation7', 'Ammunation', 'weapon', 'vector4(2567.48, 292.59, 108.73, 349.68)', 's_m_y_ammucity_01', 'WORLD_HUMAN_COP_IDLES', 1.5, 'fas fa-gun', 'Open Ammunation', 'weapons', 'true', 110, 0.6, 0, 'true'),
(30, 'ammunation8', 'Ammunation', 'weapon', 'vector4(-1118.59, 2700.05, 18.55, 221.89)', 's_m_y_ammucity_01', 'WORLD_HUMAN_COP_IDLES', 1.5, 'fas fa-gun', 'Open Ammunation', 'weapons', 'true', 110, 0.6, 0, 'true'),
(31, 'ammunation9', 'Ammunation', 'weapon', 'vector4(841.92, -1035.32, 28.19, 1.56)', 's_m_y_ammucity_01', 'WORLD_HUMAN_COP_IDLES', 1.5, 'fas fa-gun', 'Open Ammunation', 'weapons', 'true', 110, 0.6, 0, 'true'),
(32, 'ammunation10', 'Ammunation', 'weapon', 'vector4(-1304.19, -395.12, 36.7, 75.03)', 's_m_y_ammucity_01', 'WORLD_HUMAN_COP_IDLES', 1.5, 'fas fa-gun', 'Open Ammunation', 'weapons', 'true', 110, 0.6, 0, 'true'),
(33, 'ammunation11', 'Ammunation', 'weapon', 'vector4(-3173.31, 1088.85, 20.84, 244.18)', 's_m_y_ammucity_01', 'WORLD_HUMAN_COP_IDLES', 1.5, 'fas fa-gun', 'Open Ammunation', 'weapons', 'true', 110, 0.6, 0, 'true'),
(34, 'casino', 'Diamond Casino', '', 'vector4(949.29, 32.13, 71.95, 79.54)', 'csb_tomcasino', 'WORLD_HUMAN_STAND_MOBILE', 1.5, 'fas fa-coins', 'Buy Chips', 'casino', 'true', 617, 0.8, 0, 'true'),
(35, 'casinobar', 'Casino Bar', '', 'vector4(937.45, 27.22, 71.83, 61.21)', 'a_m_y_smartcaspat_01', 'WORLD_HUMAN_VALET', 1.5, 'fas fa-wine-bottle', 'Open Casino Bar', 'liquor', 'false', 52, 0.8, 0, 'true'),
(36, 'weedshop', 'Smoke On The Water', '', 'vector4(-1171.31, -1570.89, 4.66, 130.03)', 'a_m_y_hippy_01', 'WORLD_HUMAN_AA_SMOKE', 1.5, 'fas fa-cannabis', 'Open Weed Shop', 'weedshop', 'true', 140, 0.8, 0, 'true'),
(37, 'seaword', 'Sea Word', '', 'vector4(-1687.03, -1072.18, 13.15, 52.93)', 'a_m_y_beach_01', 'WORLD_HUMAN_STAND_IMPATIENT', 1.5, 'fas fa-fish', 'Sea Word', 'gearshop', 'true', 52, 0.8, 0, 'true'),
(38, 'leisureshop', 'Leisure Shop', '', 'vector4(-1505.91, 1511.95, 115.29, 257.13)', 'a_m_y_beach_01', 'WORLD_HUMAN_STAND_MOBILE_CLUBHOUSE', 1.5, 'fas fa-leaf', 'Open Leisure Shop', 'leisureshop', 'true', 52, 0.8, 0, 'true');

-- --------------------------------------------------------

--
-- Table structure for table `qb-shops-config-products`
--

CREATE TABLE `qb-shops-config-products` (
  `id` int(10) UNSIGNED NOT NULL,
  `shops` text NOT NULL,
  `name` text NOT NULL,
  `price` int(11) NOT NULL,
  `amount` int(11) NOT NULL,
  `info` text DEFAULT NULL,
  `type` enum('item','weapon') NOT NULL DEFAULT 'item',
  `requiredjob` text DEFAULT NULL,
  `requiresLicense` enum('true','false') NOT NULL DEFAULT 'false',
  `enabled` enum('true','false') NOT NULL DEFAULT 'true'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `qb-shops-config-products`
--

INSERT INTO `qb-shops-config-products` (`id`, `shops`, `name`, `price`, `amount`, `info`, `type`, `requiredjob`, `requiresLicense`, `enabled`) VALUES
(1, 'normal', 'tosti', 2, 50, NULL, 'item', NULL, 'false', 'true'),
(2, 'normal', 'water_bottle', 2, 50, NULL, 'item', NULL, 'false', 'true'),
(3, 'normal', 'kurkakola', 2, 50, NULL, 'item', NULL, 'false', 'true'),
(4, 'normal', 'twerks_candy', 2, 50, NULL, 'item', NULL, 'false', 'true'),
(5, 'normal', 'snikkel_candy', 2, 50, NULL, 'item', NULL, 'false', 'true'),
(6, 'normal', 'sandwich', 2, 50, NULL, 'item', NULL, 'false', 'true'),
(7, 'normal', 'beer', 7, 50, NULL, 'item', NULL, 'false', 'true'),
(8, 'normal', 'whiskey', 10, 50, NULL, 'item', NULL, 'false', 'true'),
(9, 'normal', 'vodka', 12, 50, NULL, 'item', NULL, 'false', 'true'),
(10, 'normal', 'bandage', 100, 50, NULL, 'item', NULL, 'false', 'true'),
(11, 'normal', 'lighter', 2, 50, NULL, 'item', NULL, 'false', 'true'),
(12, 'normal', 'rolling_paper', 2, 5000, NULL, 'item', NULL, 'false', 'true'),
(13, 'liquor', 'beer', 7, 50, NULL, 'item', NULL, 'false', 'true'),
(14, 'liquor', 'whiskey', 10, 50, NULL, 'item', NULL, 'false', 'true'),
(15, 'liquor', 'vodka', 12, 50, NULL, 'item', NULL, 'false', 'true'),
(16, 'hardware', 'lockpick', 200, 50, NULL, 'item', NULL, 'false', 'true'),
(17, 'hardware', 'weapon_wrench', 250, 250, NULL, 'item', NULL, 'false', 'true'),
(18, 'hardware', 'weapon_hammer', 250, 250, NULL, 'item', NULL, 'false', 'true'),
(19, 'hardware', 'repairkit', 250, 50, NULL, 'item', '\'mechanic\',\'police\'', 'false', 'true'),
(20, 'hardware', 'screwdriverset', 350, 50, NULL, 'item', NULL, 'false', 'true'),
(21, 'hardware', 'phone', 850, 50, NULL, 'item', NULL, 'false', 'true'),
(22, 'hardware', 'radio', 250, 50, NULL, 'item', NULL, 'false', 'true'),
(23, 'hardware', 'binoculars', 50, 50, NULL, 'item', NULL, 'false', 'true'),
(24, 'hardware', 'firework1', 50, 50, NULL, 'item', NULL, 'false', 'true'),
(25, 'hardware', 'firework2', 50, 50, NULL, 'item', NULL, 'false', 'true'),
(26, 'hardware', 'firework3', 50, 50, NULL, 'item', NULL, 'false', 'true'),
(27, 'hardware', 'firework4', 50, 50, NULL, 'item', NULL, 'false', 'true'),
(28, 'hardware', 'fitbit', 400, 150, NULL, 'item', NULL, 'false', 'true'),
(29, 'hardware', 'cleaningkit', 150, 150, NULL, 'item', NULL, 'false', 'true'),
(30, 'hardware', 'advancedrepairkit', 500, 50, NULL, 'item', 'mechanic', 'false', 'true'),
(31, 'weedshop', 'joint', 10, 1000, NULL, 'item', NULL, 'false', 'true'),
(32, 'weedshop', 'weapon_poolcue', 100, 1000, NULL, 'item', NULL, 'false', 'true'),
(33, 'weedshop', 'weed_nutrition', 20, 1000, NULL, 'item', NULL, 'false', 'true'),
(34, 'weedshop', 'empty_weed_bag', 2, 1000, NULL, 'item', NULL, 'false', 'true'),
(35, 'weedshop', 'rolling_paper', 2, 1000, NULL, 'item', NULL, 'false', 'true'),
(36, 'gearshop', 'diving_gear', 2500, 10, NULL, 'item', NULL, 'false', 'true'),
(37, 'gearshop', 'jerry_can', 200, 50, NULL, 'item', NULL, 'false', 'true'),
(38, 'leisureshop', 'parachute', 2500, 10, NULL, 'item', NULL, 'false', 'true'),
(39, 'leisureshop', 'binoculars', 50, 50, NULL, 'item', NULL, 'false', 'true'),
(40, 'leisureshop', 'diving_gear', 2500, 10, NULL, 'item', NULL, 'false', 'true'),
(41, 'leisureshop', 'diving_fill', 500, 10, NULL, 'item', NULL, 'false', 'true'),
(42, 'weapons', 'weapon_knife', 250, 250, NULL, 'weapon', NULL, 'false', 'true'),
(43, 'weapons', 'weapon_bat', 250, 250, NULL, 'weapon', NULL, 'false', 'true'),
(44, 'weapons', 'weapon_hatchet', 250, 250, NULL, 'weapon', '\'mechanic\', \'police\'', 'false', 'true'),
(45, 'weapons', 'weapon_pistol', 2500, 5, NULL, 'weapon', NULL, 'true', 'true'),
(46, 'weapons', 'weapon_snspistol', 1500, 5, NULL, 'weapon', NULL, 'true', 'true'),
(47, 'weapons', 'weapon_vintagepistol', 4000, 5, NULL, 'weapon', NULL, 'true', 'true'),
(48, 'weapons', 'pistol_ammo', 250, 250, NULL, 'item', NULL, 'false', 'true'),
(49, 'casino', 'casinochips', 1, 999999, NULL, 'item', NULL, 'false', 'true');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `qb-core-shared-items`
--
ALTER TABLE `qb-core-shared-items`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`) USING HASH;

--
-- Indexes for table `qb-core-shared-items-weapons`
--
ALTER TABLE `qb-core-shared-items-weapons`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `qb-core-shared-vehicles`
--
ALTER TABLE `qb-core-shared-vehicles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `qb-drugs-config`
--
ALTER TABLE `qb-drugs-config`
  ADD PRIMARY KEY (`qb-drugs-config-id`);

--
-- Indexes for table `qb-drugs-config-deliveryitems`
--
ALTER TABLE `qb-drugs-config-deliveryitems`
  ADD PRIMARY KEY (`qb-drugs-config-deliveryitems-id`),
  ADD UNIQUE KEY `qb-drugs-config-deliveryitems-item` (`item`);

--
-- Indexes for table `qb-drugs-config-deliverylocations`
--
ALTER TABLE `qb-drugs-config-deliverylocations`
  ADD PRIMARY KEY (`qb-drugs-config-deliverylocations-id`),
  ADD UNIQUE KEY `qb-drugs-config-deliverylocations-label` (`label`);

--
-- Indexes for table `qb-drugs-config-drugsprice`
--
ALTER TABLE `qb-drugs-config-drugsprice`
  ADD PRIMARY KEY (`qb-drugs-config-drugsprice-id`),
  ADD UNIQUE KEY `qb-drugs-config-drugsprice-name` (`name`);

--
-- Indexes for table `qb-drugs-config-products`
--
ALTER TABLE `qb-drugs-config-products`
  ADD PRIMARY KEY (`qb-drugs-config-products-id`),
  ADD UNIQUE KEY `qb-drugs-config-products-name` (`name`);

--
-- Indexes for table `qb-garages-config`
--
ALTER TABLE `qb-garages-config`
  ADD PRIMARY KEY (`qb-garages-config-id`);

--
-- Indexes for table `qb-garages-locations`
--
ALTER TABLE `qb-garages-locations`
  ADD PRIMARY KEY (`qb-garages-location_id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `qb-shops-config-locations`
--
ALTER TABLE `qb-shops-config-locations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`) USING HASH;

--
-- Indexes for table `qb-shops-config-products`
--
ALTER TABLE `qb-shops-config-products`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `qb-core-shared-items`
--
ALTER TABLE `qb-core-shared-items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=123;

--
-- AUTO_INCREMENT for table `qb-core-shared-items-weapons`
--
ALTER TABLE `qb-core-shared-items-weapons`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=104;

--
-- AUTO_INCREMENT for table `qb-core-shared-vehicles`
--
ALTER TABLE `qb-core-shared-vehicles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=510;

--
-- AUTO_INCREMENT for table `qb-drugs-config`
--
ALTER TABLE `qb-drugs-config`
  MODIFY `qb-drugs-config-id` tinyint(4) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `qb-drugs-config-deliveryitems`
--
ALTER TABLE `qb-drugs-config-deliveryitems`
  MODIFY `qb-drugs-config-deliveryitems-id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `qb-drugs-config-deliverylocations`
--
ALTER TABLE `qb-drugs-config-deliverylocations`
  MODIFY `qb-drugs-config-deliverylocations-id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `qb-drugs-config-drugsprice`
--
ALTER TABLE `qb-drugs-config-drugsprice`
  MODIFY `qb-drugs-config-drugsprice-id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `qb-drugs-config-products`
--
ALTER TABLE `qb-drugs-config-products`
  MODIFY `qb-drugs-config-products-id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `qb-garages-config`
--
ALTER TABLE `qb-garages-config`
  MODIFY `qb-garages-config-id` tinyint(4) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `qb-garages-locations`
--
ALTER TABLE `qb-garages-locations`
  MODIFY `qb-garages-location_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `qb-shops-config-locations`
--
ALTER TABLE `qb-shops-config-locations`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `qb-shops-config-products`
--
ALTER TABLE `qb-shops-config-products`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
