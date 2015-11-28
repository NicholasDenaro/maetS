-- phpMyAdmin SQL Dump
-- version 4.4.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Nov 28, 2015 at 01:19 AM
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

--
-- Dumping data for table `auction_item`
--

INSERT INTO `auction_item` (`iid`, `bid`, `bidder`, `min_price`) VALUES
('1423bid', '2435f5d1', 'Sepheroth23', 1),
('1423bid', '2435f5d2', 'Jessintime', 5),
('1423bid', '2435f5d3', 'DemoFred123', 9),
('1423bid', '2435f5d4', 'Sepheroth23', 11),
('1423bid', '2435f5d5', 'DemoFred123', 20);

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

--
-- Dumping data for table `cash_credit_card`
--

INSERT INTO `cash_credit_card` (`cnumber`, `cname`, `ctype`, `username`, `expiration`) VALUES
(1.111222233334445e15, 'Fred', 'Discover', 'DemoFred123', '2020-12-12'),
(1.111948572875384e15, 'Christopher', 'American Express', 'ChromeNight89', '2020-04-09'),
(1.234263451253453e15, 'Jessica', 'Master Card', 'Jessintime', '2017-09-02'),
(3.333444455556667e15, 'Alice', 'Visa', 'CelticAlice220', '2018-12-12'),
(3.333444455556668e15, 'Jake', 'Visa', 'Sepheroth23', '2020-09-09');

-- --------------------------------------------------------

--
-- Table structure for table `categorized`
--

CREATE TABLE IF NOT EXISTS `categorized` (
  `iid` char(20) NOT NULL,
  `ccid` char(30) DEFAULT NULL,
  `pcid` char(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `categorized`
--

INSERT INTO `categorized` (`iid`, `ccid`, `pcid`) VALUES
('12345', '', '23v542d3145v6b73'),
('12345123', '432g7h6g45435ff', '2f457h385g246f3d45'),
('12345abc', '', '2f457h385g246f3d45'),
('1234abc', '', '3c4g356f14526f2'),
('1423bid', '', '23v542d3145v6b73'),
('54321', '', '234b63gf5f4536bg');

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE IF NOT EXISTS `category` (
  `cname` char(20) NOT NULL,
  `cid` char(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`cname`, `cid`) VALUES
('PARENT', ''),
('Apparel', '234b63gf5f4536bg'),
('Digital Content', '23v542d3145v6b73'),
('Trading Cards', '2f457h385g246f3d45'),
('Action Figures', '3c4g356f14526f2'),
('Limited Edition', '432g7h6g45435ff');

-- --------------------------------------------------------

--
-- Table structure for table `connected_to`
--

CREATE TABLE IF NOT EXISTS `connected_to` (
  `cid` char(30) NOT NULL,
  `mcid` char(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `connected_to`
--

INSERT INTO `connected_to` (`cid`, `mcid`) VALUES
('432g7h6g45435ff', '234b63gf5f4536bg'),
('432g7h6g45435ff', '23v542d3145v6b73'),
('432g7h6g45435ff', '2f457h385g246f3d45'),
('432g7h6g45435ff', '3c4g356f14526f2');

-- --------------------------------------------------------

--
-- Table structure for table `cont_phone`
--

CREATE TABLE IF NOT EXISTS `cont_phone` (
  `username` char(20) NOT NULL,
  `number` double DEFAULT NULL,
  `phid` char(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cont_phone`
--

INSERT INTO `cont_phone` (`username`, `number`, `phid`) VALUES
('Jessintime', 14844616861, '14844616861'),
('ChromeNight89', 16103529046, '16103529046'),
('Sepheroth23', 16109898400, '16109898400'),
('CelticAlice220', 17063765230, '17063765230'),
('DemoFred123', 17064364784, '17064364784');

-- --------------------------------------------------------

--
-- Table structure for table `filled_with`
--

CREATE TABLE IF NOT EXISTS `filled_with` (
  `ranking` double DEFAULT NULL,
  `wid` char(30) NOT NULL,
  `iid` char(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `filled_with`
--

INSERT INTO `filled_with` (`ranking`, `wid`, `iid`) VALUES
(5, '234v234v231', '54321'),
(1, '41c4134c14c', '12345123'),
(4, 'b35v252v41c', '12345abc'),
(3, 'c1341241c11', '12345'),
(2, 'c4124123c41', '1234abc');

-- --------------------------------------------------------

--
-- Table structure for table `item`
--

CREATE TABLE IF NOT EXISTS `item` (
  `iid` char(20) NOT NULL,
  `descr` char(250) DEFAULT NULL,
  `location` char(20) NOT NULL,
  `seller` char(20) NOT NULL,
  `img` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `item`
--

INSERT INTO `item` (`iid`, `descr`, `location`, `seller`, `img`) VALUES
('12345', 'This is an expansion pack for Skyrim (PC ONLY)', 'DIGITAL', 'Sepheroth23', '1.jpg'),
('12345123', 'This limited edition FairyTail trading card!', 'New York, New York,', 'DemoFred123', '2.jpg'),
('12345abc', 'This is a 200 card collection of Pokémon cards.', 'Wayne, PA, USA', 'ChromeNight89', '0.jpg'),
('1234abc', 'This is an expansion pack for Sims 4 (PC ONLY).', 'DIGITAL', 'CelticAlice220', '3.jpg'),
('1423bid', 'This is the first pikachu action figure ever created', 'Seattle, WA', 'ChromeNight89', '4.jpg'),
('143123412543', 'blah blah blah', 'nowhere', 'MassSeller', NULL),
('54321', 'This is a T-shirt worthy of any knight.', 'State College, PA, U', 'Sepheroth23', NULL);

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
('DemoFred123', '123453t4vr', '112 tee street', 'hello', 'world', 19999, 0),
('ChromeNight89', '123453t4vre', '112 keystone avenue', 'your', 'world', 19949, 0),
('Sepheroth23', '123453t4vrf', '112 low street', 'my', 'world', 19599, 0),
('CelticAlice220', '123453t4vrs', '112 high street', 'hello', 'world', 19999, 0),
('Jessintime', '123453t4vrs', '112 montevideo drive', 'no', 'world', 19399, 0);

-- --------------------------------------------------------

--
-- Table structure for table `runs_shop`
--

CREATE TABLE IF NOT EXISTS `runs_shop` (
  `username` char(20) NOT NULL,
  `rsname` char(20) NOT NULL,
  `shid` char(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `runs_shop`
--

INSERT INTO `runs_shop` (`username`, `rsname`, `shid`) VALUES
('Sepheroth23', '12451241', '123c4123vc412v4'),
('CelticAlice220', '4313451', '12c4124123v412c4'),
('DemoFred123', '12341', '12c413412c3'),
('Jessintime', '41541234', '234v51412c1'),
('ChromeNight89', '145124124', 'c1234123c41');

-- --------------------------------------------------------

--
-- Table structure for table `sale_item`
--

CREATE TABLE IF NOT EXISTS `sale_item` (
  `iid` char(20) NOT NULL,
  `price` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sale_item`
--

INSERT INTO `sale_item` (`iid`, `price`) VALUES
('12345', 20),
('12345123', 1000),
('12345abc', 50),
('1234abc', 30),
('54321', 10);

-- --------------------------------------------------------

--
-- Table structure for table `search_key`
--

CREATE TABLE IF NOT EXISTS `search_key` (
  `word` char(20) DEFAULT NULL,
  `kid` char(30) NOT NULL,
  `iid` char(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `search_key`
--

INSERT INTO `search_key` (`word`, `kid`, `iid`) VALUES
('shirt', '23453245', '54321'),
('collection', '2352366', '12345abc'),
('sims', '36456234523', '1234abc'),
('rare', '4352342345', '12345123'),
('pikachu', '5236522', '1423bid');

-- --------------------------------------------------------

--
-- Table structure for table `stocked_by`
--

CREATE TABLE IF NOT EXISTS `stocked_by` (
  `iid` char(20) NOT NULL,
  `shid` char(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `stocked_by`
--

INSERT INTO `stocked_by` (`iid`, `shid`) VALUES
('143123412543', '123c4123vc412v4'),
('143123412543', '12c4124123v412c4'),
('143123412543', '12c413412c3'),
('143123412543', '234v51412c1'),
('143123412543', 'c1234123c41');

-- --------------------------------------------------------

--
-- Table structure for table `supplier_stocked`
--

CREATE TABLE IF NOT EXISTS `supplier_stocked` (
  `iid` char(20) NOT NULL,
  `username` char(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `supplier_stocked`
--

INSERT INTO `supplier_stocked` (`iid`, `username`) VALUES
('143123412543', 'MassSeller');

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

--
-- Dumping data for table `supplier_trans`
--

INSERT INTO `supplier_trans` (`iid`, `username`, `stname`, `poc`, `stid`, `staddress`, `stphone`) VALUES
('143123412543', 'MassSeller', 'Gain', 'none', '125134512', '123 nowhere lane', 11112223345),
('143123412543', 'MassSeller', 'Gain', 'none', '2b545b311', '123 nowhere lane', 11112223345),
('143123412543', 'MassSeller', 'Gain', 'none', '56n4256b251', '123 nowhere lane', 11112223345),
('143123412543', 'MassSeller', 'Gain', 'none', '573564621', '123 nowhere lane', 11112223345),
('143123412543', 'MassSeller', 'Gain', 'none', 'b25f54d14', '123 nowhere lane', 11112223345);

-- --------------------------------------------------------

--
-- Table structure for table `user_stocked`
--

CREATE TABLE IF NOT EXISTS `user_stocked` (
  `iid` char(20) NOT NULL,
  `username` char(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_stocked`
--

INSERT INTO `user_stocked` (`iid`, `username`) VALUES
('1234abc', 'CelticAlice220'),
('1423bid', 'ChromeNight89'),
('12345123', 'DemoFred123'),
('12345', 'Sepheroth23'),
('54321', 'Sepheroth23');

-- --------------------------------------------------------

--
-- Table structure for table `user_transaction`
--

CREATE TABLE IF NOT EXISTS `user_transaction` (
  `utdate` date DEFAULT NULL,
  `iid` char(20) NOT NULL,
  `tid` char(30) NOT NULL,
  `cusername` char(20) NOT NULL,
  `busername` char(20) NOT NULL,
  `tcomment` char(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_transaction`
--

INSERT INTO `user_transaction` (`utdate`, `iid`, `tid`, `cusername`, `busername`, `tcomment`) VALUES
('2015-10-28', '12345123', '141v2f5', 'CelticAlice220', 'DemoFred123', ''),
('2015-02-10', '12345', '1ef131', 'DemoFred123', 'Sepheroth23', 'The worst experience ever!'),
('2015-10-28', '1234abc', '2n637472nb', 'Jessintime', 'CelticAlice220', 'This is what I was looking for! I am so excited!'),
('2015-09-23', '12345abc', 'dfvr1f3421q45', 'ChromeNight89', 'Sepheroth23', 'Very good service. 5 starts.'),
('2015-03-09', '54321', 'f3134f13v', 'Jessintime', 'ChromeNight89', 'Everything went well! I am very satisfied.');

-- --------------------------------------------------------

--
-- Table structure for table `usr`
--

CREATE TABLE IF NOT EXISTS `usr` (
  `uname` char(30) NOT NULL,
  `upassword` char(20) NOT NULL,
  `income` double DEFAULT NULL,
  `gender` char(1) NOT NULL,
  `dob` date DEFAULT NULL,
  `username` char(20) NOT NULL,
  `email` char(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `usr`
--

INSERT INTO `usr` (`uname`, `upassword`, `income`, `gender`, `dob`, `username`, `email`) VALUES
('Alice', 'purpleFl0w3R', 45000, 'F', '1988-06-05', 'CelticAlice220', 'Alice@alice.com'),
('Christopher', 'Train!Hard3R', 130000, 'M', '1990-12-05', 'ChromeNight89', 'chris@chris.com'),
('Fred', 'Pa$$W0rd', 19000, 'M', '1992-03-15', 'DemoFred123', 'Fred@fred.com'),
('Jessica', 'Discover1t', 34000, 'F', '1996-10-28', 'Jessintime', 'jessica@jess.net'),
('seller', 'sellerpass', 99999999, 'M', '0000-11-22', 'MassSeller', 'seller@seller.net'),
('Jake', 'DrAg0n1t3', 92000, 'M', '1994-02-09', 'Sepheroth23', 'jake@jake.com');

-- --------------------------------------------------------

--
-- Table structure for table `wishes_for`
--

CREATE TABLE IF NOT EXISTS `wishes_for` (
  `wid` char(30) NOT NULL,
  `username` char(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `wishes_for`
--

INSERT INTO `wishes_for` (`wid`, `username`) VALUES
('c4124123c41', 'CelticAlice220'),
('b35v252v41c', 'ChromeNight89'),
('41c4134c14c', 'DemoFred123'),
('234v234v231', 'Sepheroth23'),
('c1341241c11', 'Sepheroth23');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `auction_item`
--
ALTER TABLE `auction_item`
  ADD PRIMARY KEY (`bid`),
  ADD KEY `iid` (`iid`),
  ADD KEY `bidder` (`bidder`);

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
  ADD PRIMARY KEY (`iid`),
  ADD KEY `seller` (`seller`);

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
-- Indexes for table `wishes_for`
--
ALTER TABLE `wishes_for`
  ADD PRIMARY KEY (`wid`,`username`),
  ADD KEY `username` (`username`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `auction_item`
--
ALTER TABLE `auction_item`
  ADD CONSTRAINT `auction_item_ibfk_1` FOREIGN KEY (`iid`) REFERENCES `item` (`iid`) ON DELETE CASCADE,
  ADD CONSTRAINT `auction_item_ibfk_2` FOREIGN KEY (`bidder`) REFERENCES `usr` (`username`);

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
  ADD CONSTRAINT `filled_with_ibfk_2` FOREIGN KEY (`wid`) REFERENCES `wishes_for` (`wid`);

--
-- Constraints for table `item`
--
ALTER TABLE `item`
  ADD CONSTRAINT `item_ibfk_1` FOREIGN KEY (`seller`) REFERENCES `usr` (`username`);

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
  ADD CONSTRAINT `sale_item_ibfk_1` FOREIGN KEY (`iid`) REFERENCES `item` (`iid`) ON DELETE CASCADE;

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
-- Constraints for table `wishes_for`
--
ALTER TABLE `wishes_for`
  ADD CONSTRAINT `wishes_for_ibfk_1` FOREIGN KEY (`username`) REFERENCES `usr` (`username`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
