-- phpMyAdmin SQL Dump
-- version 4.4.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Oct 28, 2015 at 06:25 PM
-- Server version: 5.6.26
-- PHP Version: 5.6.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `431w_proj`
--

-- --------------------------------------------------------

--
-- Table structure for table `auction_item`
--

CREATE TABLE IF NOT EXISTS `auction_item` (
  `iid` char(20) NOT NULL,
  `bid` char(20) NOT NULL,
  `bidder` char(20) NOT NULL,
  `min_price` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `cash_credit_card`
--

CREATE TABLE IF NOT EXISTS `cash_credit_card` (
  `cnumber` double NOT NULL DEFAULT '0',
  `cname` char(20) NOT NULL,
  `ctype` char(20) NOT NULL,
  `username` char(20) NOT NULL,
  `expiration` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `categorized`
--

CREATE TABLE IF NOT EXISTS `categorized` (
  `iid` char(20) NOT NULL,
  `ccid` char(30) NOT NULL,
  `pcid` char(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE IF NOT EXISTS `category` (
  `cname` char(20) NOT NULL,
  `cid` char(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `connected_to`
--

CREATE TABLE IF NOT EXISTS `connected_to` (
  `cid` char(30) NOT NULL,
  `mcid` char(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `cont_phone`
--

CREATE TABLE IF NOT EXISTS `cont_phone` (
  `username` char(20) NOT NULL,
  `number` double DEFAULT NULL,
  `phid` char(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `filled_with`
--

CREATE TABLE IF NOT EXISTS `filled_with` (
  `ranking` double DEFAULT NULL,
  `wid` char(30) NOT NULL,
  `iid` char(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `item`
--

CREATE TABLE IF NOT EXISTS `item` (
  `iid` char(20) NOT NULL,
  `descr` char(250) DEFAULT NULL,
  `location` char(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `loc_addresses`
--

CREATE TABLE IF NOT EXISTS `loc_addresses` (
  `username` char(20) NOT NULL,
  `aid` char(30) NOT NULL,
  `street` char(25) NOT NULL,
  `city` char(20) NOT NULL,
  `astate` char(15) NOT NULL,
  `zip` double DEFAULT NULL,
  `apt_number` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `loc_addresses`
--

INSERT INTO `loc_addresses` (`username`, `aid`, `street`, `city`, `astate`, `zip`, `apt_number`) VALUES
('Nick', '', '123', 'cityname', 'pa', 12345, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `runs_shop`
--

CREATE TABLE IF NOT EXISTS `runs_shop` (
  `username` char(20) NOT NULL,
  `rsname` char(20) NOT NULL,
  `shid` char(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `sale_item`
--

CREATE TABLE IF NOT EXISTS `sale_item` (
  `iid` char(20) NOT NULL,
  `price` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `search_key`
--

CREATE TABLE IF NOT EXISTS `search_key` (
  `word` char(20) DEFAULT NULL,
  `kid` char(30) NOT NULL,
  `iid` char(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `stocked_by`
--

CREATE TABLE IF NOT EXISTS `stocked_by` (
  `iid` char(20) NOT NULL,
  `shid` char(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `supplier_stocked`
--

CREATE TABLE IF NOT EXISTS `supplier_stocked` (
  `iid` char(20) NOT NULL,
  `username` char(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `supplier_trans`
--

CREATE TABLE IF NOT EXISTS `supplier_trans` (
  `iid` char(20) NOT NULL,
  `username` char(20) NOT NULL,
  `stname` char(20) NOT NULL,
  `poc` char(20) NOT NULL,
  `stid` char(30) NOT NULL,
  `staddress` char(30) NOT NULL,
  `stphone` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user_stocked`
--

CREATE TABLE IF NOT EXISTS `user_stocked` (
  `iid` char(20) NOT NULL,
  `username` char(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user_transaction`
--

CREATE TABLE IF NOT EXISTS `user_transaction` (
  `utdate` date DEFAULT NULL,
  `tid` char(30) NOT NULL,
  `cusername` char(20) NOT NULL,
  `busername` char(20) NOT NULL,
  `iid` char(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `usr`
--

CREATE TABLE IF NOT EXISTS `usr` (
  `username` char(20) NOT NULL,
  `upassword` char(20) NOT NULL,
  `income` double DEFAULT NULL,
  `gender` char(1) NOT NULL,
  `dob` date DEFAULT NULL,
  `uname` char(30) NOT NULL,
  `email` char(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `usr`
--

INSERT INTO `usr` (`username`, `upassword`, `income`, `gender`, `dob`, `uname`, `email`) VALUES
('Nick', 'blah', 2.3049234092384203e19, 'D', '1900-01-01', 'uNick', 'blah@gml.'),
('Will', 'butts', 320948230498, 'M', '1900-01-01', 'uWill', 'asdlfnoi@asdf.s');

-- --------------------------------------------------------

--
-- Table structure for table `whishes_for`
--

CREATE TABLE IF NOT EXISTS `whishes_for` (
  `wid` char(30) NOT NULL,
  `username` char(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `auction_item`
--
ALTER TABLE `auction_item`
  ADD PRIMARY KEY (`iid`);

--
-- Indexes for table `cash_credit_card`
--
ALTER TABLE `cash_credit_card`
  ADD PRIMARY KEY (`cnumber`,`username`),
  ADD KEY `username` (`username`);

--
-- Indexes for table `categorized`
--
ALTER TABLE `categorized`
  ADD PRIMARY KEY (`iid`),
  ADD KEY `ccid` (`ccid`),
  ADD KEY `pcid` (`pcid`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`cid`);

--
-- Indexes for table `connected_to`
--
ALTER TABLE `connected_to`
  ADD PRIMARY KEY (`cid`,`mcid`),
  ADD KEY `mcid` (`mcid`);

--
-- Indexes for table `cont_phone`
--
ALTER TABLE `cont_phone`
  ADD PRIMARY KEY (`phid`,`username`),
  ADD KEY `username` (`username`);

--
-- Indexes for table `filled_with`
--
ALTER TABLE `filled_with`
  ADD PRIMARY KEY (`wid`,`iid`),
  ADD KEY `iid` (`iid`);

--
-- Indexes for table `item`
--
ALTER TABLE `item`
  ADD PRIMARY KEY (`iid`);

--
-- Indexes for table `loc_addresses`
--
ALTER TABLE `loc_addresses`
  ADD PRIMARY KEY (`aid`,`username`),
  ADD KEY `username` (`username`);

--
-- Indexes for table `runs_shop`
--
ALTER TABLE `runs_shop`
  ADD PRIMARY KEY (`shid`,`username`),
  ADD KEY `username` (`username`);

--
-- Indexes for table `sale_item`
--
ALTER TABLE `sale_item`
  ADD PRIMARY KEY (`iid`);

--
-- Indexes for table `search_key`
--
ALTER TABLE `search_key`
  ADD PRIMARY KEY (`kid`,`iid`),
  ADD KEY `iid` (`iid`);

--
-- Indexes for table `stocked_by`
--
ALTER TABLE `stocked_by`
  ADD PRIMARY KEY (`shid`,`iid`),
  ADD KEY `iid` (`iid`);

--
-- Indexes for table `supplier_stocked`
--
ALTER TABLE `supplier_stocked`
  ADD PRIMARY KEY (`iid`,`username`),
  ADD KEY `username` (`username`);

--
-- Indexes for table `supplier_trans`
--
ALTER TABLE `supplier_trans`
  ADD PRIMARY KEY (`stid`,`iid`,`username`),
  ADD KEY `iid` (`iid`),
  ADD KEY `username` (`username`);

--
-- Indexes for table `user_stocked`
--
ALTER TABLE `user_stocked`
  ADD PRIMARY KEY (`iid`,`username`),
  ADD KEY `username` (`username`);

--
-- Indexes for table `user_transaction`
--
ALTER TABLE `user_transaction`
  ADD PRIMARY KEY (`tid`,`cusername`,`busername`),
  ADD KEY `iid` (`iid`),
  ADD KEY `cusername` (`cusername`),
  ADD KEY `busername` (`busername`);

--
-- Indexes for table `usr`
--
ALTER TABLE `usr`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `whishes_for`
--
ALTER TABLE `whishes_for`
  ADD PRIMARY KEY (`wid`,`username`),
  ADD KEY `username` (`username`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `auction_item`
--
ALTER TABLE `auction_item`
  ADD CONSTRAINT `auction_item_ibfk_1` FOREIGN KEY (`iid`) REFERENCES `item` (`iid`);

--
-- Constraints for table `cash_credit_card`
--
ALTER TABLE `cash_credit_card`
  ADD CONSTRAINT `cash_credit_card_ibfk_1` FOREIGN KEY (`username`) REFERENCES `usr` (`username`) ON DELETE CASCADE;

--
-- Constraints for table `categorized`
--
ALTER TABLE `categorized`
  ADD CONSTRAINT `categorized_ibfk_1` FOREIGN KEY (`iid`) REFERENCES `item` (`iid`),
  ADD CONSTRAINT `categorized_ibfk_2` FOREIGN KEY (`ccid`) REFERENCES `category` (`cid`),
  ADD CONSTRAINT `categorized_ibfk_3` FOREIGN KEY (`pcid`) REFERENCES `category` (`cid`);

--
-- Constraints for table `connected_to`
--
ALTER TABLE `connected_to`
  ADD CONSTRAINT `connected_to_ibfk_1` FOREIGN KEY (`mcid`) REFERENCES `category` (`cid`),
  ADD CONSTRAINT `connected_to_ibfk_2` FOREIGN KEY (`cid`) REFERENCES `category` (`cid`);

--
-- Constraints for table `cont_phone`
--
ALTER TABLE `cont_phone`
  ADD CONSTRAINT `cont_phone_ibfk_1` FOREIGN KEY (`username`) REFERENCES `usr` (`username`) ON DELETE CASCADE;

--
-- Constraints for table `filled_with`
--
ALTER TABLE `filled_with`
  ADD CONSTRAINT `filled_with_ibfk_1` FOREIGN KEY (`iid`) REFERENCES `item` (`iid`),
  ADD CONSTRAINT `filled_with_ibfk_2` FOREIGN KEY (`wid`) REFERENCES `whishes_for` (`wid`);

--
-- Constraints for table `loc_addresses`
--
ALTER TABLE `loc_addresses`
  ADD CONSTRAINT `loc_addresses_ibfk_1` FOREIGN KEY (`username`) REFERENCES `usr` (`username`) ON DELETE CASCADE;

--
-- Constraints for table `runs_shop`
--
ALTER TABLE `runs_shop`
  ADD CONSTRAINT `runs_shop_ibfk_1` FOREIGN KEY (`username`) REFERENCES `usr` (`username`) ON DELETE CASCADE;

--
-- Constraints for table `sale_item`
--
ALTER TABLE `sale_item`
  ADD CONSTRAINT `sale_item_ibfk_1` FOREIGN KEY (`iid`) REFERENCES `item` (`iid`);

--
-- Constraints for table `search_key`
--
ALTER TABLE `search_key`
  ADD CONSTRAINT `search_key_ibfk_1` FOREIGN KEY (`iid`) REFERENCES `item` (`iid`) ON DELETE CASCADE;

--
-- Constraints for table `stocked_by`
--
ALTER TABLE `stocked_by`
  ADD CONSTRAINT `stocked_by_ibfk_1` FOREIGN KEY (`iid`) REFERENCES `item` (`iid`) ON DELETE NO ACTION,
  ADD CONSTRAINT `stocked_by_ibfk_2` FOREIGN KEY (`shid`) REFERENCES `runs_shop` (`shid`) ON DELETE CASCADE;

--
-- Constraints for table `supplier_stocked`
--
ALTER TABLE `supplier_stocked`
  ADD CONSTRAINT `supplier_stocked_ibfk_1` FOREIGN KEY (`iid`) REFERENCES `item` (`iid`),
  ADD CONSTRAINT `supplier_stocked_ibfk_2` FOREIGN KEY (`username`) REFERENCES `usr` (`username`);

--
-- Constraints for table `supplier_trans`
--
ALTER TABLE `supplier_trans`
  ADD CONSTRAINT `supplier_trans_ibfk_1` FOREIGN KEY (`iid`) REFERENCES `item` (`iid`) ON DELETE NO ACTION,
  ADD CONSTRAINT `supplier_trans_ibfk_2` FOREIGN KEY (`username`) REFERENCES `usr` (`username`) ON DELETE NO ACTION;

--
-- Constraints for table `user_stocked`
--
ALTER TABLE `user_stocked`
  ADD CONSTRAINT `user_stocked_ibfk_1` FOREIGN KEY (`iid`) REFERENCES `item` (`iid`),
  ADD CONSTRAINT `user_stocked_ibfk_2` FOREIGN KEY (`username`) REFERENCES `usr` (`username`);

--
-- Constraints for table `user_transaction`
--
ALTER TABLE `user_transaction`
  ADD CONSTRAINT `user_transaction_ibfk_1` FOREIGN KEY (`iid`) REFERENCES `item` (`iid`),
  ADD CONSTRAINT `user_transaction_ibfk_2` FOREIGN KEY (`cusername`) REFERENCES `usr` (`username`),
  ADD CONSTRAINT `user_transaction_ibfk_3` FOREIGN KEY (`busername`) REFERENCES `usr` (`username`);

--
-- Constraints for table `whishes_for`
--
ALTER TABLE `whishes_for`
  ADD CONSTRAINT `whishes_for_ibfk_1` FOREIGN KEY (`username`) REFERENCES `usr` (`username`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
