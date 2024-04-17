-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 17, 2024 at 01:38 PM
-- Server version: 10.4.10-MariaDB
-- PHP Version: 7.3.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `Ikimina`
--

-- --------------------------------------------------------

--
-- Table structure for table `creditb`
--

CREATE TABLE `creditb` (
  `creditid` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `requestedamount` varchar(100) NOT NULL,
  `amountpaid` varchar(100) NOT NULL,
  `status` varchar(100) NOT NULL,
  `paystatus` varchar(100) NOT NULL,
  `pendapprove` varchar(20) NOT NULL,
  `dates` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `creditb`
--

INSERT INTO `creditb` (`creditid`, `userid`, `requestedamount`, `amountpaid`, `status`, `paystatus`, `pendapprove`, `dates`) VALUES
(1, 4, '80', '84.0', 'approved', 'paid', 'pending', '2024-04-17');

-- --------------------------------------------------------

--
-- Table structure for table `savingtb`
--

CREATE TABLE `savingtb` (
  `savingid` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `amount` varchar(100) NOT NULL,
  `dates` varchar(255) NOT NULL,
  `saveyear` varchar(100) NOT NULL,
  `status` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `savingtb`
--

INSERT INTO `savingtb` (`savingid`, `userid`, `amount`, `dates`, `saveyear`, `status`) VALUES
(1, 4, '100', '2024-04-17', '2024', 'completed');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `userid` int(11) NOT NULL,
  `names` varchar(80) NOT NULL,
  `email` varchar(80) NOT NULL,
  `location` varchar(80) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `password` varchar(80) NOT NULL,
  `type` varchar(20) NOT NULL,
  `status` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`userid`, `names`, `email`, `location`, `phone`, `password`, `type`, `status`) VALUES
(2, 'Muzehe', 'admin@gmail.com', 'Rubavu', '0781110784', '1234567', 'admin', 'confrimed'),
(3, 'Kamari jean', 'niyoyandikalie@gmail.com', 'Musanze', '+250781110784', '1234567', 'guest', 'confirmed'),
(4, 'Muhawe Emmile', 'guest@gmail.com', 'Musanze', '0781110780', '1234567', 'guest', 'confirmed');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `creditb`
--
ALTER TABLE `creditb`
  ADD PRIMARY KEY (`creditid`);

--
-- Indexes for table `savingtb`
--
ALTER TABLE `savingtb`
  ADD PRIMARY KEY (`savingid`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`userid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `creditb`
--
ALTER TABLE `creditb`
  MODIFY `creditid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `savingtb`
--
ALTER TABLE `savingtb`
  MODIFY `savingid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `userid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
