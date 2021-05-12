-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: May 12, 2021 at 07:48 AM
-- Server version: 8.0.13-4
-- PHP Version: 7.2.24-0ubuntu0.18.04.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `QF53HUUBsI`
--

-- --------------------------------------------------------

--
-- Table structure for table `adminregister`
--

CREATE TABLE `adminregister` (
  `regid` int(100) NOT NULL,
  `name` text NOT NULL,
  `password` text NOT NULL,
  `email` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `adminregister`
--

INSERT INTO `adminregister` (`regid`, `name`, `password`, `email`) VALUES
(17, 'arpita', 'arpita', 'arpitahegde8819@gmail.com'),
(19, 'prakash', 'prakash', 'hegde1317@gmail.com'),
(20, 'tara', 'tara', 'arpitaprakashhegde@gmail.com'),
(21, 'appu', 'appu', '9482548971'),
(22, 'swati', 'swati', '9482548971'),
(23, 'ankit', 'ankit', '9482548971'),
(24, 'jaya', 'jaya', '919482548971'),
(25, 'tara123', 'tara123', '9480508020'),
(26, 'arpita1234', 'arpita1234', 'arpitahegde8819@gmail.com'),
(27, 'appug', 'appug', 'hegde1317@gmail.com'),
(28, 'pakku', 'pakku', 'tarahegde415@gmail.com'),
(29, 'appu345', 'appu345', 'arpitahegde8819@gmail.com'),
(30, 'Arpita Prakash Hegde', 'aapu', 'arpitahegde8819@gmail.com'),
(31, '123arpita', 'appu', 'arpitaprakashhegde@gmail.com'),
(32, 'appu12345', 'appu', 'arpitahegde8819@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `areg`
--

CREATE TABLE `areg` (
  `username` text NOT NULL,
  `password` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `areg`
--

INSERT INTO `areg` (`username`, `password`) VALUES
('\0', '\0'),
('', ''),
('admin', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `productid` int(100) NOT NULL,
  `username` text NOT NULL,
  `productname` text NOT NULL,
  `productdesc` text NOT NULL,
  `price` text NOT NULL,
  `qty` text NOT NULL,
  `total` text NOT NULL,
  `avlqty` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `history`
--

CREATE TABLE `history` (
  `productid` int(100) NOT NULL,
  `username` text NOT NULL,
  `date` text NOT NULL,
  `totalqty` text NOT NULL,
  `totalprice` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `history`
--

INSERT INTO `history` (`productid`, `username`, `date`, `totalqty`, `totalprice`) VALUES
(1, '', '', '200.0', '1.0');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `productid` int(100) NOT NULL,
  `username` text NOT NULL,
  `productname` text NOT NULL,
  `productdesc` text NOT NULL,
  `location` text NOT NULL,
  `price` text NOT NULL,
  `units` text NOT NULL,
  `avlqty` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`productid`, `username`, `productname`, `productdesc`, `location`, `price`, `units`, `avlqty`) VALUES
(37, '', 'rice', 'basumathi', '', '200', 'per kg', '20'),
(45, 'tara', 'coat', 'wood', '', '1000', 'per piece', '0.0'),
(46, 'sandeep', 'gdsfhg', 'hdsfbn', '', '34', '1', '123'),
(53, 'tara', 'rice', 'basumathi', '', '200', 'per kg', '10.0'),
(54, 'arpita', 'rice', 'basumathi', 'nakshe', '200', 'per kg', '0.0'),
(55, 'prakash', 'rice', 'basumathi', 'nakshe', '200', 'per kg', '0.0'),
(56, 'swati', 'rice', 'basumathi', 'nakshe', '200', 'per kg', '0.0'),
(57, 'jaya', 'rice', 'basumathi', 'nakshe', '200', 'per kg', '0.0'),
(58, 'tara123', 'rice', 'basumathi', 'nakshe', '200', 'per kg', '0.0'),
(59, 'arpita1234', 'rice', 'basumathi', 'nakshe', '200', 'per kg', '0.0'),
(60, 'appug', 'rice', 'basumathi', 'nakshe', '200', 'per kg', '0.0'),
(61, 'pakku', 'rice', 'basumathi', 'nakshe', '200', 'per kg', '0.0'),
(62, 'appu345', 'rice', 'basumathi', 'nakshe', '200', 'per kg', '0.0'),
(63, 'appu345', 'm,nm', 'ghghjj', 'sirsi', 'nn', 'per kg', '100'),
(64, 'Arpita Prakash Hegde', 'rice', 'basumathi', 'nakshe', '200', 'per kg', '9.0'),
(65, '123arpita', 'rice', 'basumathi', 'nakshe', '200', 'per kg', '0.0'),
(66, 'appu12345', 'rice', 'basumathi', 'nakshe', '200', 'per kg', '10.0'),
(67, 'Arpita Prakash Hegde', 'flowers', 'ghghjj', 'nakshe', '200', 'per kg', '10.0'),
(68, 'arpita', 'fruits', 'basumathi', 'nakshe', '200', 'per kg', '10.0');

-- --------------------------------------------------------

--
-- Table structure for table `register`
--

CREATE TABLE `register` (
  `regid` int(100) NOT NULL,
  `name` text NOT NULL,
  `password` text NOT NULL,
  `email` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `track`
--

CREATE TABLE `track` (
  `productid` int(100) NOT NULL,
  `productname` text NOT NULL,
  `productdesc` text NOT NULL,
  `price` text NOT NULL,
  `qty` text NOT NULL,
  `total` text NOT NULL,
  `avlqty` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `track`
--

INSERT INTO `track` (`productid`, `productname`, `productdesc`, `price`, `qty`, `total`, `avlqty`) VALUES
(164, 'rice', 'basumathi', '200', '10', '2000.0', '0.0'),
(165, 'rice', 'basumathi', '200', '10', '2000.0', '0.0'),
(166, 'rice', 'basumathi', '200', '8', '1600.0', '2.0'),
(167, 'rice', 'basumathi', '200', '2', '400.0', '0.0'),
(168, 'rice', 'basumathi', '200', '01', '200.0', '9.0'),
(169, 'rice', 'basumathi', '200', '9', '1800.0', '0.0'),
(170, 'rice', 'basumathi', '200', '10.0', '2000.0', '0.0'),
(171, 'rice', 'basumathi', '200', '10', '2000.0', '0.0'),
(172, 'rice', 'basumathi', '200', '10', '2000.0', '0.0'),
(173, 'rice', 'basumathi', '200', '10', '2000.0', '0.0'),
(174, 'rice', 'basumathi', '200', '10', '2000.0', '0.0'),
(175, 'rice', 'basumathi', '200', '10.0', '2000.0', '0.0'),
(176, 'rice', 'basumathi', '200', '10.0', '2000.0', '0.0'),
(177, 'rice', 'basumathi', '200', '10.0', '2000.0', '0.0'),
(178, 'fruits', 'basumathi', '200', '5', '1000.0', '0.0'),
(179, 'rice', 'basumathi', '200', '10.0', '2000.0', '0.0'),
(180, 'rice', 'basumathi', '200', '10.0', '2000.0', '0.0'),
(181, 'rice', 'basumathi', '200', '10.0', '2000.0', '0.0'),
(182, 'rice', 'basumathi', '200', '10.0', '2000.0', '0.0'),
(183, 'fruits', 'basumathi', '200', '10.0', '2000.0', '0.0'),
(184, 'rice', 'basumathi', '200', '10.0', '2000.0', '0.0'),
(185, 'rice', 'basumathi', '200', '10.0', '2000.0', '0.0');

-- --------------------------------------------------------

--
-- Table structure for table `useradd`
--

CREATE TABLE `useradd` (
  `productid` int(100) NOT NULL,
  `productname` text NOT NULL,
  `productdesc` text NOT NULL,
  `price` text NOT NULL,
  `qty` text NOT NULL,
  `username` text NOT NULL,
  `phone` text NOT NULL,
  `address` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `userbuy`
--

CREATE TABLE `userbuy` (
  `productname` text NOT NULL,
  `productdesc` text NOT NULL,
  `price` text NOT NULL,
  `qty` text NOT NULL,
  `username` text NOT NULL,
  `phone` text NOT NULL,
  `address` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `userbuy`
--

INSERT INTO `userbuy` (`productname`, `productdesc`, `price`, `qty`, `username`, `phone`, `address`) VALUES
('glass', 'fabric', '200', '10', '', '', ''),
('glass', 'fabric', '200', '10', '', '', ''),
('', '', '', '', 'prakash', '9482548971', 'Tq: Sirsi, Karnataka (581 402) po:bakkal,at:nakshe'),
('desk', 'wood', '500', '90', '', '', ''),
('desk', 'wood', '500', '90', '', '', ''),
('desk', 'wood', '500', '0', '', '', ''),
('desk', 'wood', '500', '10', '', '', ''),
('desk', 'wood', '500', '90', '', '', ''),
('', '', '', '', 'prakash', '9482548971', 'Tq: Sirsi, Karnataka (581 402) po:bakkal,at:nakshe'),
('desk', 'wood', '500', '90', '', '', ''),
('', '', '', '', 'prakash', '9482548971', 'Tq: Sirsi, Karnataka (581 402) po:bakkal,at:nakshe'),
('desk', 'wood', '500', '100', '', '', ''),
('desk', 'wood', '500', '10', '', '', ''),
('desk', 'wood', '500', '10', '', '', ''),
('coat', 'wood', '200', '2', '', '', ''),
('desk', 'wood', '500', '10', '', '', ''),
('desk', 'wood', '500', '10', '', '', ''),
('desk', 'wood', '500', '10', '', '', ''),
('', '', '', '', 'prakash', '9482548971', 'Tq: Sirsi, Karnataka (581 402) po:bakkal,at:nakshe'),
('coat', 'wood', '200', '3.0', '', '', ''),
('coat', 'wood', '200', '3.0', '', '', ''),
('coat', 'wood', '200', '3.0', '', '', ''),
('', '', '', '', 'prakash', '9482548971', 'Tq: Sirsi, Karnataka (581 402) po:bakkal,at:nakshe'),
('', '', '', '', 'prakash', '9482548971', 'Tq: Sirsi, Karnataka (581 402) po:bakkal,at:nakshe'),
('', '', '', '', 'tgksbljdnk,', '9482548971', 'Tq: Sirsi, Karnataka (581 402) po:bakkal,at:nakshe'),
('', '', '', '', 'tgksbljdnk,', '9482548971', 'Tq: Sirsi, Karnataka (581 402) po:bakkal,at:nakshe'),
('', '', '', '', 'prakash', '9482548971', 'Tq: Sirsi, Karnataka (581 402) po:bakkal,at:nakshe'),
('', '', '', '', 'prakash', '9482548971', 'Tq: Sirsi, Karnataka (581 402) po:bakkal,at:nakshe'),
('', '', '', '', 'prakash', '9482548971', 'Tq: Sirsi, Karnataka (581 402) po:bakkal,at:nakshe'),
('', '', '', '', 'prakash', '9482548971', 'Tq: Sirsi, Karnataka (581 402) po:bakkal,at:nakshe'),
('', '', '', '', 'prakash', '9482548971', 'Tq: Sirsi, Karnataka (581 402) po:bakkal,at:nakshe'),
('', '', '', '', 'prakash', '9482548971', 'Tq: Sirsi, Karnataka (581 402) po:bakkal,at:nakshe'),
('', '', '', '', 'prakash', '09482548971', 'Tq: Sirsi, Karnataka (581 402) po:bakkal,at:nakshe'),
('', '', '', '', 'prakash', '9482548971', 'Tq: Sirsi, Karnataka (581 402) po:bakkal,at:nakshe'),
('', '', '', '', 'prakash', '9482548971', 'Tq: Sirsi, Karnataka (581 402) po:bakkal,at:nakshe'),
('', '', '', '', 'prakash', '9482548971', 'Tq: Sirsi, Karnataka (581 402) po:bakkal,at:nakshe'),
('', '', '', '', 'tgksbljdnk,', '9482548971', 'Tq: Sirsi, Karnataka (581 402) po:bakkal,at:nakshe'),
('', '', '', '', 'prakash', '9482548971', 'Tq: Sirsi, Karnataka (581 402) po:bakkal,at:nakshe');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `adminregister`
--
ALTER TABLE `adminregister`
  ADD PRIMARY KEY (`regid`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`productid`);

--
-- Indexes for table `history`
--
ALTER TABLE `history`
  ADD PRIMARY KEY (`productid`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`productid`);

--
-- Indexes for table `register`
--
ALTER TABLE `register`
  ADD PRIMARY KEY (`regid`);

--
-- Indexes for table `track`
--
ALTER TABLE `track`
  ADD PRIMARY KEY (`productid`);

--
-- Indexes for table `useradd`
--
ALTER TABLE `useradd`
  ADD PRIMARY KEY (`productid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `adminregister`
--
ALTER TABLE `adminregister`
  MODIFY `regid` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `history`
--
ALTER TABLE `history`
  MODIFY `productid` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `productid` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=69;

--
-- AUTO_INCREMENT for table `register`
--
ALTER TABLE `register`
  MODIFY `regid` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `track`
--
ALTER TABLE `track`
  MODIFY `productid` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=186;

--
-- AUTO_INCREMENT for table `useradd`
--
ALTER TABLE `useradd`
  MODIFY `productid` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
