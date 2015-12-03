-- phpMyAdmin SQL Dump
-- version 4.4.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Dec 03, 2015 at 03:48 AM
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
  `bidder` char(20) DEFAULT NULL,
  `min_price` double NOT NULL DEFAULT '0',
  `end_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `auction_item`
--

INSERT INTO `auction_item` (`iid`, `bidder`, `min_price`, `end_date`) VALUES
('1423bid', 'CelticAlice220', 4, '0000-00-00');

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
  `cid` char(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `categorized`
--

INSERT INTO `categorized` (`iid`, `cid`) VALUES
('54321', '234b63gf5f4536bg'),
('12345', '23v542d3145v6b73'),
('1423bid', '23v542d3145v6b73'),
('12345123', '2f457h385g246f3d45'),
('12345abc', '2f457h385g246f3d45'),
('1234abc', '3c4g356f14526f2');

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
('All Items', '0'),
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
  `ccid` char(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `connected_to`
--

INSERT INTO `connected_to` (`cid`, `ccid`) VALUES
('432g7h6g45435ff', '234b63gf5f4536bg'),
('432g7h6g45435ff', '23v542d3145v6b73'),
('432g7h6g45435ff', '2f457h385g246f3d45'),
('432g7h6g45435ff', '3c4g356f14526f2'),
('0', '432g7h6g45435ff');

-- --------------------------------------------------------

--
-- Table structure for table `cont_phone`
--

CREATE TABLE IF NOT EXISTS `cont_phone` (
  `username` char(20) NOT NULL,
  `number` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cont_phone`
--

INSERT INTO `cont_phone` (`username`, `number`) VALUES
('CelticAlice220', 17063765230),
('ChromeNight89', 16103529046),
('DemoFred123', 17064364784),
('Jessintime', 14844616861),
('Sepheroth23', 16109898400);

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
(2, '123', '12345'),
(1, '123', '12345abc'),
(NULL, '123', '54321'),
(5, '234v234v231', '54321'),
(1, '41c4134c14c', '12345123'),
(2, '41c4134c14c', '1234abc'),
(4, 'b35v252v41c', '12345abc'),
(3, 'c1341241c11', '12345'),
(2, 'c4124123c41', '1234abc');

-- --------------------------------------------------------

--
-- Table structure for table `item`
--

CREATE TABLE IF NOT EXISTS `item` (
  `iid` char(20) NOT NULL,
  `name` varchar(20) NOT NULL,
  `descr` char(250) DEFAULT NULL,
  `location` char(20) NOT NULL,
  `img` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `item`
--

INSERT INTO `item` (`iid`, `name`, `descr`, `location`, `img`) VALUES
('12345', 'Dawnguard', 'This is an expansion pack for Skyrim (PC ONLY)', 'DIGITAL', 'http://www.blogcdn.com/www.joystiq.com/media/2012/05/skyrimdawnguard530.jpg'),
('12345123', 'Natsu Card', 'This limited edition FairyTail trading card!', 'New York, New York,', 'http://www.funimation.com/blog/wp-content/uploads/2014/12/ws-fairy-tail-bushiroad-natsu.jpg'),
('12345abc', 'Pokemon Cards', 'This is a 200 card collection of Pokémon cards.', 'Wayne, PA, USA', 'http://i705.photobucket.com/albums/ww54/jt4613/108_2488.jpg'),
('1234abc', 'Sims 4: Get Together', 'This is an expansion pack for Sims 4 (PC ONLY).', 'DIGITAL', 'http://sims-online.com/wp-content/uploads/2015/08/sims-4-get-together-boxart.jpg'),
('1423bid', 'Pikachu Figure', 'This is the first pikachu action figure ever created', 'Seattle, WA', 'http://ecx.images-amazon.com/images/I/318csVhBZ7L._SY300_.jpg'),
('54321', 'Shirt', 'This is a T-shirt worthy of any knight.', 'State College, PA, U', 'https://upload.wikimedia.org/wikipedia/commons/2/24/Blue_Tshirt.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `loc_addresses`
--

CREATE TABLE IF NOT EXISTS `loc_addresses` (
  `username` char(20) NOT NULL,
  `street` char(25) NOT NULL,
  `city` char(20) NOT NULL,
  `astate` char(15) NOT NULL,
  `zip` double DEFAULT NULL,
  `apt_number` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `loc_addresses`
--

INSERT INTO `loc_addresses` (`username`, `street`, `city`, `astate`, `zip`, `apt_number`) VALUES
('CelticAlice220', '112 high street', 'hello', 'world', 19999, 0),
('ChromeNight89', '112 keystone avenue', 'your', 'world', 19949, 0),
('DemoFred123', '112 tee street', 'hello', 'world', 19999, 0),
('Jessintime', '112 montevideo drive', 'no', 'world', 19399, 0),
('Sepheroth23', '112 low street', 'my', 'world', 19599, 0);

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
  `word` char(20) NOT NULL DEFAULT '',
  `iid` char(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `search_key`
--

INSERT INTO `search_key` (`word`, `iid`) VALUES
('rare', '12345123'),
('collection', '12345abc'),
('sims', '1234abc'),
('pikachu', '1423bid'),
('shirt', '54321');

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
-- Table structure for table `supplier`
--

CREATE TABLE IF NOT EXISTS `supplier` (
  `company_name` varchar(10) NOT NULL,
  `password` varchar(20) NOT NULL,
  `address` varchar(50) NOT NULL,
  `poc` varchar(30) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `category` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `supplier`
--

INSERT INTO `supplier` (`company_name`, `password`, `address`, `poc`, `phone`, `category`) VALUES
('Gain', '', '123 something lane?', 'This guy', '1800GAINTON', 'Everything'),
('HelloWorld', 'test', '1233423sogian', 'tester', '1800000000', 'all');

-- --------------------------------------------------------

--
-- Table structure for table `supplier_stocked`
--

CREATE TABLE IF NOT EXISTS `supplier_stocked` (
  `iid` char(20) NOT NULL,
  `supplier` char(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `supplier_trans`
--

CREATE TABLE IF NOT EXISTS `supplier_trans` (
  `iid` char(20) NOT NULL,
  `username` char(20) NOT NULL,
  `supplier` char(20) NOT NULL,
  `stdate` date NOT NULL,
  `rating` int(1) NOT NULL,
  `comment` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `supplier_trans`
--

INSERT INTO `supplier_trans` (`iid`, `username`, `supplier`, `stdate`, `rating`, `comment`) VALUES
('54321', 'CelticAlice220', 'HelloWorld', '2015-11-30', 4, 'BAD');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `uname` char(30) NOT NULL,
  `upassword` char(20) NOT NULL,
  `income` double DEFAULT NULL,
  `gender` char(1) NOT NULL,
  `dob` date DEFAULT NULL,
  `username` char(20) NOT NULL,
  `email` char(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`uname`, `upassword`, `income`, `gender`, `dob`, `username`, `email`) VALUES
('Alice', 'purpleFl0w3R', 45000, 'F', '1988-06-05', 'CelticAlice220', 'Alice@alice.com'),
('Christopher', 'Train!Hard3R', 130000, 'M', '1990-12-05', 'ChromeNight89', 'chris@chris.com'),
('Fred', 'Pa$$W0rd', 19000, 'M', '1992-03-15', 'DemoFred123', 'Fred@fred.com'),
('tester', 'test', 1800000000, '1', '0000-00-00', 'HelloWorld', ''),
('Jessica', 'Discover1t', 34000, 'F', '1996-10-28', 'Jessintime', 'jessica@jess.net'),
('seller', 'sellerpass', 99999999, 'M', '0000-11-22', 'MassSeller', 'seller@seller.net'),
('Jake', 'DrAg0n1t3', 92000, 'M', '1994-02-09', 'Sepheroth23', 'jake@jake.com'),
('tester', 'test', 9001, 'T', '1111-01-01', 'test', 'test');

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
('12345', 'test'),
('54321', 'test');

-- --------------------------------------------------------

--
-- Table structure for table `user_transaction`
--

CREATE TABLE IF NOT EXISTS `user_transaction` (
  `utdate` date DEFAULT NULL,
  `iid` char(20) NOT NULL,
  `cusername` char(20) NOT NULL,
  `busername` char(20) NOT NULL,
  `rating` int(1) NOT NULL,
  `tcomment` char(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_transaction`
--

INSERT INTO `user_transaction` (`utdate`, `iid`, `cusername`, `busername`, `rating`, `tcomment`) VALUES
('2015-10-28', '12345123', 'CelticAlice220', 'DemoFred123', 4, 'BAD'),
('2015-09-23', '12345abc', 'ChromeNight89', 'Sepheroth23', 0, 'Very good service. 5 starts.'),
('2015-02-10', '12345', 'DemoFred123', 'Sepheroth23', 0, 'The worst experience ever!'),
('2015-10-28', '1234abc', 'Jessintime', 'CelticAlice220', 0, 'This is what I was looking for! I am so excited!'),
('2015-03-09', '54321', 'Jessintime', 'ChromeNight89', 0, 'Everything went well! I am very satisfied.'),
('0000-00-00', '12345', 'Sepheroth23', 'CelticAlice220', 0, NULL);

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
('c1341241c11', 'Sepheroth23'),
('123', 'test');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `auction_item`
--
ALTER TABLE `auction_item`
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
  ADD KEY `pcid` (`cid`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`cid`);

--
-- Indexes for table `connected_to`
--
ALTER TABLE `connected_to`
  ADD PRIMARY KEY (`cid`,`ccid`),
  ADD KEY `mcid` (`ccid`);

--
-- Indexes for table `cont_phone`
--
ALTER TABLE `cont_phone`
  ADD PRIMARY KEY (`username`);

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
  ADD PRIMARY KEY (`username`);

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
  ADD PRIMARY KEY (`iid`,`word`) USING BTREE;

--
-- Indexes for table `stocked_by`
--
ALTER TABLE `stocked_by`
  ADD PRIMARY KEY (`shid`,`iid`),
  ADD KEY `iid` (`iid`);

--
-- Indexes for table `supplier`
--
ALTER TABLE `supplier`
  ADD PRIMARY KEY (`company_name`);

--
-- Indexes for table `supplier_stocked`
--
ALTER TABLE `supplier_stocked`
  ADD PRIMARY KEY (`iid`,`supplier`),
  ADD KEY `supplier_stocked_ibfk_2` (`supplier`);

--
-- Indexes for table `supplier_trans`
--
ALTER TABLE `supplier_trans`
  ADD PRIMARY KEY (`iid`,`username`,`supplier`) USING BTREE,
  ADD KEY `username` (`username`),
  ADD KEY `supplier` (`supplier`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`username`);

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
  ADD PRIMARY KEY (`cusername`,`busername`,`iid`) USING BTREE,
  ADD KEY `iid` (`iid`),
  ADD KEY `busername` (`busername`);

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
  ADD CONSTRAINT `auction_item_ibfk_2` FOREIGN KEY (`bidder`) REFERENCES `user` (`username`);

--
-- Constraints for table `cash_credit_card`
--
ALTER TABLE `cash_credit_card`
  ADD CONSTRAINT `cash_credit_card_ibfk_1` FOREIGN KEY (`username`) REFERENCES `user` (`username`) ON DELETE CASCADE;

--
-- Constraints for table `categorized`
--
ALTER TABLE `categorized`
  ADD CONSTRAINT `categorized_ibfk_1` FOREIGN KEY (`iid`) REFERENCES `item` (`iid`),
  ADD CONSTRAINT `categorized_ibfk_3` FOREIGN KEY (`cid`) REFERENCES `category` (`cid`);

--
-- Constraints for table `connected_to`
--
ALTER TABLE `connected_to`
  ADD CONSTRAINT `connected_to_ibfk_1` FOREIGN KEY (`ccid`) REFERENCES `category` (`cid`),
  ADD CONSTRAINT `connected_to_ibfk_2` FOREIGN KEY (`cid`) REFERENCES `category` (`cid`);

--
-- Constraints for table `cont_phone`
--
ALTER TABLE `cont_phone`
  ADD CONSTRAINT `cont_phone_ibfk_1` FOREIGN KEY (`username`) REFERENCES `user` (`username`) ON DELETE CASCADE;

--
-- Constraints for table `filled_with`
--
ALTER TABLE `filled_with`
  ADD CONSTRAINT `filled_with_ibfk_1` FOREIGN KEY (`iid`) REFERENCES `item` (`iid`),
  ADD CONSTRAINT `filled_with_ibfk_2` FOREIGN KEY (`wid`) REFERENCES `wishes_for` (`wid`);

--
-- Constraints for table `loc_addresses`
--
ALTER TABLE `loc_addresses`
  ADD CONSTRAINT `loc_addresses_ibfk_1` FOREIGN KEY (`username`) REFERENCES `user` (`username`) ON DELETE CASCADE;

--
-- Constraints for table `runs_shop`
--
ALTER TABLE `runs_shop`
  ADD CONSTRAINT `runs_shop_ibfk_1` FOREIGN KEY (`username`) REFERENCES `user` (`username`) ON DELETE CASCADE;

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
  ADD CONSTRAINT `supplier_stocked_ibfk_2` FOREIGN KEY (`supplier`) REFERENCES `supplier` (`company_name`);

--
-- Constraints for table `supplier_trans`
--
ALTER TABLE `supplier_trans`
  ADD CONSTRAINT `supplier_trans_ibfk_1` FOREIGN KEY (`iid`) REFERENCES `item` (`iid`) ON DELETE NO ACTION,
  ADD CONSTRAINT `supplier_trans_ibfk_2` FOREIGN KEY (`username`) REFERENCES `user` (`username`) ON DELETE NO ACTION,
  ADD CONSTRAINT `supplier_trans_ibfk_3` FOREIGN KEY (`supplier`) REFERENCES `supplier` (`company_name`);

--
-- Constraints for table `user_stocked`
--
ALTER TABLE `user_stocked`
  ADD CONSTRAINT `user_stocked_ibfk_1` FOREIGN KEY (`iid`) REFERENCES `item` (`iid`),
  ADD CONSTRAINT `user_stocked_ibfk_2` FOREIGN KEY (`username`) REFERENCES `user` (`username`);

--
-- Constraints for table `user_transaction`
--
ALTER TABLE `user_transaction`
  ADD CONSTRAINT `user_transaction_ibfk_1` FOREIGN KEY (`iid`) REFERENCES `item` (`iid`),
  ADD CONSTRAINT `user_transaction_ibfk_2` FOREIGN KEY (`cusername`) REFERENCES `user` (`username`),
  ADD CONSTRAINT `user_transaction_ibfk_3` FOREIGN KEY (`busername`) REFERENCES `user` (`username`);

--
-- Constraints for table `wishes_for`
--
ALTER TABLE `wishes_for`
  ADD CONSTRAINT `wishes_for_ibfk_1` FOREIGN KEY (`username`) REFERENCES `user` (`username`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
