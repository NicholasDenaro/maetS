-- phpMyAdmin SQL Dump
-- version 4.4.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Dec 01, 2015 at 05:23 AM
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
  `min_price` double NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `auction_item`
--

INSERT INTO `auction_item` (`iid`, `bidder`, `min_price`) VALUES
('1423bid', 'CelticAlice220', 4),
('565b9091c08372.39159', NULL, 40);

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
('565c9d1587b142.84159', '0'),
('565c9d29f220d6.50726', '0'),
('565c9d4d11e092.85924', '0'),
('565c9d6b757f27.57703', '0'),
('565c9d79957cd1.23942', '0'),
('565c9d80290325.48451', '0'),
('565c9d81cd6053.92283', '0'),
('565c9d839ae071.20396', '0'),
('565c9dbc3ec8c9.86915', '0'),
('565c9dbe20dc91.47604', '0'),
('565c9dc0954d10.69625', '0'),
('565c9e631cc789.14969', '0'),
('565c9e652c5196.00363', '0'),
('565c9e65ae7e91.24715', '0'),
('565c9e66226f32.78203', '0'),
('565c9e666b1a77.22853', '0'),
('565c9e667e3777.67396', '0'),
('565c9e66a07e98.25041', '0'),
('565c9e66c463f1.69402', '0'),
('565c9e66dce1c2.86006', '0'),
('565c9e67091430.77910', '0'),
('565c9e672881b4.09922', '0'),
('565c9e6741cc07.30819', '0'),
('565c9e67572f72.32344', '0'),
('565c9f4f9cc936.85489', '0'),
('565c9f50d108f7.76018', '0'),
('565c9f52c90220.15133', '0'),
('565d00ade90782.94684', '0'),
('565d00f6135cb5.55425', '0'),
('565d012a290611.05945', '0'),
('565d0154451453.96219', '0'),
('565d0157f263b8.79446', '0'),
('565d01582b25a1.68925', '0'),
('565d015865f172.90730', '0'),
('565d01587d9476.29967', '0'),
('565d0158a566d3.72883', '0'),
('565d0158c5db32.52268', '0'),
('565d0158eb7376.39829', '0'),
('565d0159247ee0.57633', '0'),
('565d01594bd819.86859', '0'),
('565d0159747e56.65244', '0'),
('565d015998fd75.25402', '0'),
('565d0159c9d298.99412', '0'),
('565d0159f2cff4.32668', '0'),
('565d015a2870d7.61432', '0'),
('565d015a4a83a2.45874', '0'),
('565d015a6fdb12.72772', '0'),
('565d0274476811.68592', '0'),
('565d0274f18508.87001', '0'),
('565d02751cea52.01591', '0'),
('565d0275475979.82362', '0'),
('565d0275626318.13382', '0'),
('565d02758c4d86.44692', '0'),
('565d0275ad28e3.46454', '0'),
('565d0275c87532.00324', '0'),
('565d0275e349f3.74847', '0'),
('565d0276178157.41624', '0'),
('565d02763a5925.25437', '0'),
('565d02764f5676.97839', '0'),
('565d0276754e05.10702', '0'),
('565d0276864bc6.53153', '0'),
('565d0276a4bfa3.40665', '0'),
('565d0276bb0b54.78523', '0'),
('565d0276dd7318.19818', '0'),
('565d027702b7e4.03079', '0'),
('565d02771df9b4.89582', '0'),
('565d02774bf3f6.54015', '0'),
('565d027762d691.99492', '0'),
('565d027773c1c6.95318', '0'),
('565d0277863ea0.39352', '0'),
('565d0277a539a2.87962', '0'),
('565d0277c3d2a6.01065', '0'),
('565d0277d85cb1.39317', '0'),
('565d0278049f79.42910', '0'),
('565d02781fdcc5.21317', '0'),
('565d02783da485.22892', '0'),
('565d02785453b6.14340', '0'),
('565d02787c7fb3.05940', '0'),
('565d02789f5658.77420', '0'),
('565d0278b9caf3.82716', '0'),
('565d0278da82f3.71344', '0'),
('565d027900d113.74593', '0'),
('565d027916c815.88272', '0'),
('565d027931ddf1.46993', '0'),
('565d0279571739.67608', '0'),
('565d02796ad5c1.15047', '0'),
('565d02796f7d88.41343', '0'),
('565d0279827888.65866', '0'),
('565d0279a37503.26111', '0'),
('565d0279c17295.92309', '0'),
('565d0279d6ae65.88475', '0'),
('565d0279e8e5d8.63240', '0'),
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
(NULL, '565ca48f768d45.96748', '54321'),
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
  `img` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `item`
--

INSERT INTO `item` (`iid`, `name`, `descr`, `location`, `img`) VALUES
('12345', '', 'This is an expansion pack for Skyrim (PC ONLY)', 'DIGITAL', '1.jpg'),
('12345123', '', 'This limited edition FairyTail trading card!', 'New York, New York,', '2.jpg'),
('12345abc', '', 'This is a 200 card collection of Pokémon cards.', 'Wayne, PA, USA', '0.jpg'),
('1234abc', '', 'This is an expansion pack for Sims 4 (PC ONLY).', 'DIGITAL', '3.jpg'),
('1423bid', '', 'This is the first pikachu action figure ever created', 'Seattle, WA', '4.jpg'),
('143123412543', '', 'blah blah blah', 'nowhere', NULL),
('54321', '', 'This is a T-shirt worthy of any knight.', 'State College, PA, U', NULL),
('565b8c661a3247.03438', 'asdf', 'asdfadfoweindosfioiwefwo', 'buttsville', 'asdf.jpg'),
('565b8c685d6248.62518', 'asdf', 'asdfadfoweindosfioiwefwo', 'buttsville', 'asdf.jpg'),
('565b8c6933fdf1.73385', 'asdf', 'asdfadfoweindosfioiwefwo', 'buttsville', 'asdf.jpg'),
('565b8c699f4a87.85218', 'asdf', 'asdfadfoweindosfioiwefwo', 'buttsville', 'asdf.jpg'),
('565b8c6a198a01.00562', 'asdf', 'asdfadfoweindosfioiwefwo', 'buttsville', 'asdf.jpg'),
('565b8c6a6e25f5.05596', 'asdf', 'asdfadfoweindosfioiwefwo', 'buttsville', 'asdf.jpg'),
('565b8c6a937a54.22050', 'asdf', 'asdfadfoweindosfioiwefwo', 'buttsville', 'asdf.jpg'),
('565b8c6ac41f39.66594', 'asdf', 'asdfadfoweindosfioiwefwo', 'buttsville', 'asdf.jpg'),
('565b8c6b0225d2.79420', 'asdf', 'asdfadfoweindosfioiwefwo', 'buttsville', 'asdf.jpg'),
('565b8c6b27c3e2.02510', 'asdf', 'asdfadfoweindosfioiwefwo', 'buttsville', 'asdf.jpg'),
('565b8c6b4873d9.04575', 'asdf', 'asdfadfoweindosfioiwefwo', 'buttsville', 'asdf.jpg'),
('565b8c6b698577.12639', 'asdf', 'asdfadfoweindosfioiwefwo', 'buttsville', 'asdf.jpg'),
('565b8c6b87fd02.58686', 'asdf', 'asdfadfoweindosfioiwefwo', 'buttsville', 'asdf.jpg'),
('565b8c6ba88a24.46555', 'asdf', 'asdfadfoweindosfioiwefwo', 'buttsville', 'asdf.jpg'),
('565b8c6bd63099.55532', 'asdf', 'asdfadfoweindosfioiwefwo', 'buttsville', 'asdf.jpg'),
('565b8c6c045a20.77901', 'asdf', 'asdfadfoweindosfioiwefwo', 'buttsville', 'asdf.jpg'),
('565b8c6c2ce5d6.85675', 'asdf', 'asdfadfoweindosfioiwefwo', 'buttsville', 'asdf.jpg'),
('565b8c6c544d47.57099', 'asdf', 'asdfadfoweindosfioiwefwo', 'buttsville', 'asdf.jpg'),
('565b8c6c810852.88737', 'asdf', 'asdfadfoweindosfioiwefwo', 'buttsville', 'asdf.jpg'),
('565b8c6cb9b242.16736', 'asdf', 'asdfadfoweindosfioiwefwo', 'buttsville', 'asdf.jpg'),
('565b8c6cd0b995.29443', 'asdf', 'asdfadfoweindosfioiwefwo', 'buttsville', 'asdf.jpg'),
('565b8c6d08a0b0.40678', 'asdf', 'asdfadfoweindosfioiwefwo', 'buttsville', 'asdf.jpg'),
('565b8c6d282791.15022', 'asdf', 'asdfadfoweindosfioiwefwo', 'buttsville', 'asdf.jpg'),
('565b8c6d5afc42.38691', 'asdf', 'asdfadfoweindosfioiwefwo', 'buttsville', 'asdf.jpg'),
('565b8c6d83d8d9.52844', 'asdf', 'asdfadfoweindosfioiwefwo', 'buttsville', 'asdf.jpg'),
('565b8c6db77482.83641', 'asdf', 'asdfadfoweindosfioiwefwo', 'buttsville', 'asdf.jpg'),
('565b8c6ddd2c45.38490', 'asdf', 'asdfadfoweindosfioiwefwo', 'buttsville', 'asdf.jpg'),
('565b8c6e190c00.21647', 'asdf', 'asdfadfoweindosfioiwefwo', 'buttsville', 'asdf.jpg'),
('565b8c6e3f22c7.49874', 'asdf', 'asdfadfoweindosfioiwefwo', 'buttsville', 'asdf.jpg'),
('565b8c6e6f53c6.36561', 'asdf', 'asdfadfoweindosfioiwefwo', 'buttsville', 'asdf.jpg'),
('565b8c6e9851e3.51193', 'asdf', 'asdfadfoweindosfioiwefwo', 'buttsville', 'asdf.jpg'),
('565b8c6ebf8c02.48579', 'asdf', 'asdfadfoweindosfioiwefwo', 'buttsville', 'asdf.jpg'),
('565b8c6ef38db3.18539', 'asdf', 'asdfadfoweindosfioiwefwo', 'buttsville', 'asdf.jpg'),
('565b8c6f276af3.14572', 'asdf', 'asdfadfoweindosfioiwefwo', 'buttsville', 'asdf.jpg'),
('565b8c6f498f77.51329', 'asdf', 'asdfadfoweindosfioiwefwo', 'buttsville', 'asdf.jpg'),
('565b8c6f76da58.87872', 'asdf', 'asdfadfoweindosfioiwefwo', 'buttsville', 'asdf.jpg'),
('565b8c6fa13f77.57878', 'asdf', 'asdfadfoweindosfioiwefwo', 'buttsville', 'asdf.jpg'),
('565b8c6fbb39e4.14360', 'asdf', 'asdfadfoweindosfioiwefwo', 'buttsville', 'asdf.jpg'),
('565b8c6fec32f0.20837', 'asdf', 'asdfadfoweindosfioiwefwo', 'buttsville', 'asdf.jpg'),
('565b8c70176b80.72696', 'asdf', 'asdfadfoweindosfioiwefwo', 'buttsville', 'asdf.jpg'),
('565b8c704b9690.42148', 'asdf', 'asdfadfoweindosfioiwefwo', 'buttsville', 'asdf.jpg'),
('565b8c7063cb06.27682', 'asdf', 'asdfadfoweindosfioiwefwo', 'buttsville', 'asdf.jpg'),
('565b8c7087c127.42343', 'asdf', 'asdfadfoweindosfioiwefwo', 'buttsville', 'asdf.jpg'),
('565b8c70b72479.72118', 'asdf', 'asdfadfoweindosfioiwefwo', 'buttsville', 'asdf.jpg'),
('565b8c70d82231.49278', 'asdf', 'asdfadfoweindosfioiwefwo', 'buttsville', 'asdf.jpg'),
('565b8c71074863.62327', 'asdf', 'asdfadfoweindosfioiwefwo', 'buttsville', 'asdf.jpg'),
('565b8dd05773e2.23696', 'asdf', 'asdfadfoweindosfioiwefwo', 'buttsville', 'asdf.jpg'),
('565b8dd38da779.78142', 'asdf', 'asdfadfoweindosfioiwefwo', 'buttsville', 'asdf.jpg'),
('565b8dd441cfc7.82998', 'asdf', 'asdfadfoweindosfioiwefwo', 'buttsville', 'asdf.jpg'),
('565b8dd4594009.06901', 'asdf', 'asdfadfoweindosfioiwefwo', 'buttsville', 'asdf.jpg'),
('565b8dd478abd4.06342', 'asdf', 'asdfadfoweindosfioiwefwo', 'buttsville', 'asdf.jpg'),
('565b8dd493b2d8.44636', 'asdf', 'asdfadfoweindosfioiwefwo', 'buttsville', 'asdf.jpg'),
('565b8dd4b75ce4.38055', 'asdf', 'asdfadfoweindosfioiwefwo', 'buttsville', 'asdf.jpg'),
('565b8dd4dca781.62058', 'asdf', 'asdfadfoweindosfioiwefwo', 'buttsville', 'asdf.jpg'),
('565b8dd4ec3f09.74151', 'asdf', 'asdfadfoweindosfioiwefwo', 'buttsville', 'asdf.jpg'),
('565b8dd5100f86.90696', 'asdf', 'asdfadfoweindosfioiwefwo', 'buttsville', 'asdf.jpg'),
('565b8dd52cdea2.09841', 'asdf', 'asdfadfoweindosfioiwefwo', 'buttsville', 'asdf.jpg'),
('565b8dd5499ee3.27924', 'asdf', 'asdfadfoweindosfioiwefwo', 'buttsville', 'asdf.jpg'),
('565b8dd561f7b1.12705', 'asdf', 'asdfadfoweindosfioiwefwo', 'buttsville', 'asdf.jpg'),
('565b8dd583cad7.45854', 'asdf', 'asdfadfoweindosfioiwefwo', 'buttsville', 'asdf.jpg'),
('565b8dd5a130f1.46212', 'asdf', 'asdfadfoweindosfioiwefwo', 'buttsville', 'asdf.jpg'),
('565b8dd5b5feb7.44100', 'asdf', 'asdfadfoweindosfioiwefwo', 'buttsville', 'asdf.jpg'),
('565b8dd5cb4c13.55170', 'asdf', 'asdfadfoweindosfioiwefwo', 'buttsville', 'asdf.jpg'),
('565b8dd5e25243.28534', 'asdf', 'asdfadfoweindosfioiwefwo', 'buttsville', 'asdf.jpg'),
('565b8dd603e202.25560', 'asdf', 'asdfadfoweindosfioiwefwo', 'buttsville', 'asdf.jpg'),
('565b8dd621d590.69664', 'asdf', 'asdfadfoweindosfioiwefwo', 'buttsville', 'asdf.jpg'),
('565b8dd63984c7.27149', 'asdf', 'asdfadfoweindosfioiwefwo', 'buttsville', 'asdf.jpg'),
('565b8dd64c0dd8.12833', 'asdf', 'asdfadfoweindosfioiwefwo', 'buttsville', 'asdf.jpg'),
('565b8dd66913e1.12339', 'asdf', 'asdfadfoweindosfioiwefwo', 'buttsville', 'asdf.jpg'),
('565b8dd67b0dc4.76038', 'asdf', 'asdfadfoweindosfioiwefwo', 'buttsville', 'asdf.jpg'),
('565b8dd68c9306.82842', 'asdf', 'asdfadfoweindosfioiwefwo', 'buttsville', 'asdf.jpg'),
('565b8ef3cca7b1.72779', 'asdf', 'asdfadfoweindosfioiwefwo', 'buttsville', 'asdf.jpg'),
('565b8f98be3a63.44879', 'asdf', 'asdfadfoweindosfioiwefwo', 'buttsville', 'asdf.jpg'),
('565b8f99562a69.19331', 'asdf', 'asdfadfoweindosfioiwefwo', 'buttsville', 'asdf.jpg'),
('565b8f999fbe25.98803', 'asdf', 'asdfadfoweindosfioiwefwo', 'buttsville', 'asdf.jpg'),
('565b8f99db7383.36847', 'asdf', 'asdfadfoweindosfioiwefwo', 'buttsville', 'asdf.jpg'),
('565b8f9a211ff2.02014', 'asdf', 'asdfadfoweindosfioiwefwo', 'buttsville', 'asdf.jpg'),
('565b8f9a5b7986.14448', 'asdf', 'asdfadfoweindosfioiwefwo', 'buttsville', 'asdf.jpg'),
('565b8f9a816ab3.52328', 'asdf', 'asdfadfoweindosfioiwefwo', 'buttsville', 'asdf.jpg'),
('565b8f9ac15e39.30970', 'asdf', 'asdfadfoweindosfioiwefwo', 'buttsville', 'asdf.jpg'),
('565b8f9af0d5a5.25294', 'asdf', 'asdfadfoweindosfioiwefwo', 'buttsville', 'asdf.jpg'),
('565b8f9b1ce699.34953', 'asdf', 'asdfadfoweindosfioiwefwo', 'buttsville', 'asdf.jpg'),
('565b8f9b39ea78.12761', 'asdf', 'asdfadfoweindosfioiwefwo', 'buttsville', 'asdf.jpg'),
('565b8f9b5828e9.28989', 'asdf', 'asdfadfoweindosfioiwefwo', 'buttsville', 'asdf.jpg'),
('565b8f9b7425a2.95329', 'asdf', 'asdfadfoweindosfioiwefwo', 'buttsville', 'asdf.jpg'),
('565b8f9b95cd35.01483', 'asdf', 'asdfadfoweindosfioiwefwo', 'buttsville', 'asdf.jpg'),
('565b8f9ba86108.54971', 'asdf', 'asdfadfoweindosfioiwefwo', 'buttsville', 'asdf.jpg'),
('565b8f9bc82a24.32201', 'asdf', 'asdfadfoweindosfioiwefwo', 'buttsville', 'asdf.jpg'),
('565b8f9be84ae2.31997', 'asdf', 'asdfadfoweindosfioiwefwo', 'buttsville', 'asdf.jpg'),
('565b8f9c08fa91.23019', 'asdf', 'asdfadfoweindosfioiwefwo', 'buttsville', 'asdf.jpg'),
('565b8f9c2093c6.86985', 'asdf', 'asdfadfoweindosfioiwefwo', 'buttsville', 'asdf.jpg'),
('565b8f9c42c0f6.23337', 'asdf', 'asdfadfoweindosfioiwefwo', 'buttsville', 'asdf.jpg'),
('565b8f9c5f3be1.37572', 'asdf', 'asdfadfoweindosfioiwefwo', 'buttsville', 'asdf.jpg'),
('565b8f9c73d203.18731', 'asdf', 'asdfadfoweindosfioiwefwo', 'buttsville', 'asdf.jpg'),
('565b8f9c8fbaa9.51963', 'asdf', 'asdfadfoweindosfioiwefwo', 'buttsville', 'asdf.jpg'),
('565b8f9cb71705.39165', 'asdf', 'asdfadfoweindosfioiwefwo', 'buttsville', 'asdf.jpg'),
('565b8f9cd92d89.68602', 'asdf', 'asdfadfoweindosfioiwefwo', 'buttsville', 'asdf.jpg'),
('565b8f9ceddf63.58127', 'asdf', 'asdfadfoweindosfioiwefwo', 'buttsville', 'asdf.jpg'),
('565b8f9d149a67.70452', 'asdf', 'asdfadfoweindosfioiwefwo', 'buttsville', 'asdf.jpg'),
('565b8fa4ea7f06.28445', 'asdf', 'asdfadfoweindosfioiwefwo', 'buttsville', '0jpg'),
('565b9091c08372.39159', 'asdf', 'asdfadfoweindosfioiwefwo', 'buttsville', '0jpg'),
('565c9c668461d4.50911', 'asdf', 'asdfadfoweindosfioiwefwo', 'buttsville', 'asdf.jpg'),
('565c9c9f394322.45083', 'asdf', 'asdfadfoweindosfioiwefwo', 'buttsville', 'asdf.jpg'),
('565c9cf7b64419.76114', 'asdf', 'asdfadfoweindosfioiwefwo', 'buttsville', 'asdf.jpg'),
('565c9d1587b142.84159', 'asdf', 'asdfadfoweindosfioiwefwo', 'buttsville', 'asdf.jpg'),
('565c9d29f220d6.50726', 'asdf', 'asdfadfoweindosfioiwefwo', 'buttsville', 'asdf.jpg'),
('565c9d4d11e092.85924', 'asdf', 'asdfadfoweindosfioiwefwo', 'buttsville', 'asdf.jpg'),
('565c9d6b757f27.57703', 'asdf', 'asdfadfoweindosfioiwefwo', 'buttsville', 'asdf.jpg'),
('565c9d79957cd1.23942', 'asdf', 'asdfadfoweindosfioiwefwo', 'buttsville', 'asdf.jpg'),
('565c9d80290325.48451', 'asdf', 'asdfadfoweindosfioiwefwo', 'buttsville', 'asdf.jpg'),
('565c9d81cd6053.92283', 'asdf', 'asdfadfoweindosfioiwefwo', 'buttsville', 'asdf.jpg'),
('565c9d839ae071.20396', 'asdf', 'asdfadfoweindosfioiwefwo', 'buttsville', 'asdf.jpg'),
('565c9dbc3ec8c9.86915', 'wlkefnowiefn', 'asdfadfoweindosfioiwefwo', 'buttsville', 'asdf.jpg'),
('565c9dbe20dc91.47604', 'wlkefnowiefn', 'asdfadfoweindosfioiwefwo', 'buttsville', 'asdf.jpg'),
('565c9dc0954d10.69625', 'wlkefnowiefn', 'asdfadfoweindosfioiwefwo', 'buttsville', 'asdf.jpg'),
('565c9e631cc789.14969', 'wlkefnowiefn', 'asdfadfoweindosfioiwefwo', 'buttsville', 'asdf.jpg'),
('565c9e652c5196.00363', 'wlkefnowiefn', 'asdfadfoweindosfioiwefwo', 'buttsville', 'asdf.jpg'),
('565c9e65ae7e91.24715', 'wlkefnowiefn', 'asdfadfoweindosfioiwefwo', 'buttsville', 'asdf.jpg'),
('565c9e66226f32.78203', 'wlkefnowiefn', 'asdfadfoweindosfioiwefwo', 'buttsville', 'asdf.jpg'),
('565c9e666b1a77.22853', 'wlkefnowiefn', 'asdfadfoweindosfioiwefwo', 'buttsville', 'asdf.jpg'),
('565c9e667e3777.67396', 'wlkefnowiefn', 'asdfadfoweindosfioiwefwo', 'buttsville', 'asdf.jpg'),
('565c9e66a07e98.25041', 'wlkefnowiefn', 'asdfadfoweindosfioiwefwo', 'buttsville', 'asdf.jpg'),
('565c9e66c463f1.69402', 'wlkefnowiefn', 'asdfadfoweindosfioiwefwo', 'buttsville', 'asdf.jpg'),
('565c9e66dce1c2.86006', 'wlkefnowiefn', 'asdfadfoweindosfioiwefwo', 'buttsville', 'asdf.jpg'),
('565c9e67091430.77910', 'wlkefnowiefn', 'asdfadfoweindosfioiwefwo', 'buttsville', 'asdf.jpg'),
('565c9e672881b4.09922', 'wlkefnowiefn', 'asdfadfoweindosfioiwefwo', 'buttsville', 'asdf.jpg'),
('565c9e6741cc07.30819', 'wlkefnowiefn', 'asdfadfoweindosfioiwefwo', 'buttsville', 'asdf.jpg'),
('565c9e67572f72.32344', 'wlkefnowiefn', 'asdfadfoweindosfioiwefwo', 'buttsville', 'asdf.jpg'),
('565c9f4f9cc936.85489', 'wlkefnowiefn', 'asdfadfoweindosfioiwefwo', 'buttsville', 'asdf.jpg'),
('565c9f50d108f7.76018', 'wlkefnowiefn', 'asdfadfoweindosfioiwefwo', 'buttsville', 'asdf.jpg'),
('565c9f52c90220.15133', 'wlkefnowiefn', 'asdfadfoweindosfioiwefwo', 'buttsville', 'asdf.jpg'),
('565d00ade90782.94684', 'asdf', 'asdfadfoweindosfioiwefwo', 'buttsville', ''),
('565d00f6135cb5.55425', 'asdf', 'asdfadfoweindosfioiwefwo', 'buttsville', 'test9'),
('565d012a290611.05945', 'asdf', 'asdfadfoweindosfioiwefwo', 'buttsville', 'test9'),
('565d0154451453.96219', 'asdf', 'asdfadfoweindosfioiwefwo', 'buttsville', 'test9'),
('565d0157f263b8.79446', 'asdf', 'asdfadfoweindosfioiwefwo', 'buttsville', 'test9'),
('565d01582b25a1.68925', 'asdf', 'asdfadfoweindosfioiwefwo', 'buttsville', 'test9'),
('565d015865f172.90730', 'asdf', 'asdfadfoweindosfioiwefwo', 'buttsville', 'test9'),
('565d01587d9476.29967', 'asdf', 'asdfadfoweindosfioiwefwo', 'buttsville', 'test9'),
('565d0158a566d3.72883', 'asdf', 'asdfadfoweindosfioiwefwo', 'buttsville', 'test9'),
('565d0158c5db32.52268', 'asdf', 'asdfadfoweindosfioiwefwo', 'buttsville', 'test9'),
('565d0158eb7376.39829', 'asdf', 'asdfadfoweindosfioiwefwo', 'buttsville', 'test9'),
('565d0159247ee0.57633', 'asdf', 'asdfadfoweindosfioiwefwo', 'buttsville', 'test9'),
('565d01594bd819.86859', 'asdf', 'asdfadfoweindosfioiwefwo', 'buttsville', 'test9'),
('565d0159747e56.65244', 'asdf', 'asdfadfoweindosfioiwefwo', 'buttsville', 'test9'),
('565d015998fd75.25402', 'asdf', 'asdfadfoweindosfioiwefwo', 'buttsville', 'test9'),
('565d0159c9d298.99412', 'asdf', 'asdfadfoweindosfioiwefwo', 'buttsville', 'test9'),
('565d0159f2cff4.32668', 'asdf', 'asdfadfoweindosfioiwefwo', 'buttsville', 'test9'),
('565d015a2870d7.61432', 'asdf', 'asdfadfoweindosfioiwefwo', 'buttsville', 'test9'),
('565d015a4a83a2.45874', 'asdf', 'asdfadfoweindosfioiwefwo', 'buttsville', 'test9'),
('565d015a6fdb12.72772', 'asdf', 'asdfadfoweindosfioiwefwo', 'buttsville', 'test9'),
('565d0274476811.68592', 'asdf', 'asdfadfoweindosfioiwefwo', 'buttsville', 'asdf.jpg'),
('565d0274f18508.87001', 'asdf', 'asdfadfoweindosfioiwefwo', 'buttsville', 'asdf.jpg'),
('565d02751cea52.01591', 'asdf', 'asdfadfoweindosfioiwefwo', 'buttsville', 'asdf.jpg'),
('565d0275475979.82362', 'asdf', 'asdfadfoweindosfioiwefwo', 'buttsville', 'asdf.jpg'),
('565d0275626318.13382', 'asdf', 'asdfadfoweindosfioiwefwo', 'buttsville', 'asdf.jpg'),
('565d02758c4d86.44692', 'asdf', 'asdfadfoweindosfioiwefwo', 'buttsville', 'asdf.jpg'),
('565d0275ad28e3.46454', 'asdf', 'asdfadfoweindosfioiwefwo', 'buttsville', 'asdf.jpg'),
('565d0275c87532.00324', 'asdf', 'asdfadfoweindosfioiwefwo', 'buttsville', 'asdf.jpg'),
('565d0275e349f3.74847', 'asdf', 'asdfadfoweindosfioiwefwo', 'buttsville', 'asdf.jpg'),
('565d0276178157.41624', 'asdf', 'asdfadfoweindosfioiwefwo', 'buttsville', 'asdf.jpg'),
('565d02763a5925.25437', 'asdf', 'asdfadfoweindosfioiwefwo', 'buttsville', 'asdf.jpg'),
('565d02764f5676.97839', 'asdf', 'asdfadfoweindosfioiwefwo', 'buttsville', 'asdf.jpg'),
('565d0276754e05.10702', 'asdf', 'asdfadfoweindosfioiwefwo', 'buttsville', 'asdf.jpg'),
('565d0276864bc6.53153', 'asdf', 'asdfadfoweindosfioiwefwo', 'buttsville', 'asdf.jpg'),
('565d0276a4bfa3.40665', 'asdf', 'asdfadfoweindosfioiwefwo', 'buttsville', 'asdf.jpg'),
('565d0276bb0b54.78523', 'asdf', 'asdfadfoweindosfioiwefwo', 'buttsville', 'asdf.jpg'),
('565d0276dd7318.19818', 'asdf', 'asdfadfoweindosfioiwefwo', 'buttsville', 'asdf.jpg'),
('565d027702b7e4.03079', 'asdf', 'asdfadfoweindosfioiwefwo', 'buttsville', 'asdf.jpg'),
('565d02771df9b4.89582', 'asdf', 'asdfadfoweindosfioiwefwo', 'buttsville', 'asdf.jpg'),
('565d02774bf3f6.54015', 'asdf', 'asdfadfoweindosfioiwefwo', 'buttsville', 'asdf.jpg'),
('565d027762d691.99492', 'asdf', 'asdfadfoweindosfioiwefwo', 'buttsville', 'asdf.jpg'),
('565d027773c1c6.95318', 'asdf', 'asdfadfoweindosfioiwefwo', 'buttsville', 'asdf.jpg'),
('565d0277863ea0.39352', 'asdf', 'asdfadfoweindosfioiwefwo', 'buttsville', 'asdf.jpg'),
('565d0277a539a2.87962', 'asdf', 'asdfadfoweindosfioiwefwo', 'buttsville', 'asdf.jpg'),
('565d0277c3d2a6.01065', 'asdf', 'asdfadfoweindosfioiwefwo', 'buttsville', 'asdf.jpg'),
('565d0277d85cb1.39317', 'asdf', 'asdfadfoweindosfioiwefwo', 'buttsville', 'asdf.jpg'),
('565d0278049f79.42910', 'asdf', 'asdfadfoweindosfioiwefwo', 'buttsville', 'asdf.jpg'),
('565d02781fdcc5.21317', 'asdf', 'asdfadfoweindosfioiwefwo', 'buttsville', 'asdf.jpg'),
('565d02783da485.22892', 'asdf', 'asdfadfoweindosfioiwefwo', 'buttsville', 'asdf.jpg'),
('565d02785453b6.14340', 'asdf', 'asdfadfoweindosfioiwefwo', 'buttsville', 'asdf.jpg'),
('565d02787c7fb3.05940', 'asdf', 'asdfadfoweindosfioiwefwo', 'buttsville', 'asdf.jpg'),
('565d02789f5658.77420', 'asdf', 'asdfadfoweindosfioiwefwo', 'buttsville', 'asdf.jpg'),
('565d0278b9caf3.82716', 'asdf', 'asdfadfoweindosfioiwefwo', 'buttsville', 'asdf.jpg'),
('565d0278da82f3.71344', 'asdf', 'asdfadfoweindosfioiwefwo', 'buttsville', 'asdf.jpg'),
('565d027900d113.74593', 'asdf', 'asdfadfoweindosfioiwefwo', 'buttsville', 'asdf.jpg'),
('565d027916c815.88272', 'asdf', 'asdfadfoweindosfioiwefwo', 'buttsville', 'asdf.jpg'),
('565d027931ddf1.46993', 'asdf', 'asdfadfoweindosfioiwefwo', 'buttsville', 'asdf.jpg'),
('565d0279571739.67608', 'asdf', 'asdfadfoweindosfioiwefwo', 'buttsville', 'asdf.jpg'),
('565d02796ad5c1.15047', 'asdf', 'asdfadfoweindosfioiwefwo', 'buttsville', 'asdf.jpg'),
('565d02796f7d88.41343', 'asdf', 'asdfadfoweindosfioiwefwo', 'buttsville', 'asdf.jpg'),
('565d0279827888.65866', 'asdf', 'asdfadfoweindosfioiwefwo', 'buttsville', 'asdf.jpg'),
('565d0279a37503.26111', 'asdf', 'asdfadfoweindosfioiwefwo', 'buttsville', 'asdf.jpg'),
('565d0279c17295.92309', 'asdf', 'asdfadfoweindosfioiwefwo', 'buttsville', 'asdf.jpg'),
('565d0279d6ae65.88475', 'asdf', 'asdfadfoweindosfioiwefwo', 'buttsville', 'asdf.jpg'),
('565d0279e8e5d8.63240', 'asdf', 'asdfadfoweindosfioiwefwo', 'buttsville', 'asdf.jpg');

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
('Sepheroth23', '112 low street', 'my', 'world', 19599, 0),
('test10', 'road', 'testcity', 'ST', 12345, 2),
('test11', 'road', 'testcity', 'ST', 12345, 2);

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
('54321', 10),
('565b8dd05773e2.23696', 40),
('565b8dd38da779.78142', 40),
('565b8dd441cfc7.82998', 40),
('565b8dd4594009.06901', 40),
('565b8dd478abd4.06342', 40),
('565b8dd493b2d8.44636', 40),
('565b8dd4b75ce4.38055', 40),
('565b8dd4dca781.62058', 40),
('565b8dd4ec3f09.74151', 40),
('565b8dd5100f86.90696', 40),
('565b8dd52cdea2.09841', 40),
('565b8dd5499ee3.27924', 40),
('565b8dd561f7b1.12705', 40),
('565b8dd583cad7.45854', 40),
('565b8dd5a130f1.46212', 40),
('565b8dd5b5feb7.44100', 40),
('565b8dd5cb4c13.55170', 40),
('565b8dd5e25243.28534', 40),
('565b8dd603e202.25560', 40),
('565b8dd621d590.69664', 40),
('565b8dd63984c7.27149', 40),
('565b8dd64c0dd8.12833', 40),
('565b8dd66913e1.12339', 40),
('565b8dd67b0dc4.76038', 40),
('565b8dd68c9306.82842', 40),
('565c9c668461d4.50911', 40),
('565c9c9f394322.45083', 40),
('565c9cf7b64419.76114', 40),
('565c9d1587b142.84159', 40),
('565c9d29f220d6.50726', 40),
('565c9d4d11e092.85924', 40),
('565c9d6b757f27.57703', 40),
('565c9d79957cd1.23942', 40),
('565c9d80290325.48451', 40),
('565c9d81cd6053.92283', 40),
('565c9d839ae071.20396', 40),
('565c9dbc3ec8c9.86915', 40),
('565c9dbe20dc91.47604', 40),
('565c9dc0954d10.69625', 40),
('565c9e631cc789.14969', 40),
('565c9e652c5196.00363', 40),
('565c9e65ae7e91.24715', 40),
('565c9e66226f32.78203', 40),
('565c9e666b1a77.22853', 40),
('565c9e667e3777.67396', 40),
('565c9e66a07e98.25041', 40),
('565c9e66c463f1.69402', 40),
('565c9e66dce1c2.86006', 40),
('565c9e67091430.77910', 40),
('565c9e672881b4.09922', 40),
('565c9e6741cc07.30819', 40),
('565c9e67572f72.32344', 40),
('565c9f4f9cc936.85489', 40),
('565c9f50d108f7.76018', 40),
('565c9f52c90220.15133', 40),
('565d00ade90782.94684', 0),
('565d00f6135cb5.55425', 0),
('565d012a290611.05945', 0),
('565d0154451453.96219', 0),
('565d0157f263b8.79446', 0),
('565d01582b25a1.68925', 0),
('565d015865f172.90730', 0),
('565d01587d9476.29967', 0),
('565d0158a566d3.72883', 0),
('565d0158c5db32.52268', 0),
('565d0158eb7376.39829', 0),
('565d0159247ee0.57633', 0),
('565d01594bd819.86859', 0),
('565d0159747e56.65244', 0),
('565d015998fd75.25402', 0),
('565d0159c9d298.99412', 0),
('565d0159f2cff4.32668', 0),
('565d015a2870d7.61432', 0),
('565d015a4a83a2.45874', 0),
('565d015a6fdb12.72772', 0),
('565d0274476811.68592', 40),
('565d0274f18508.87001', 40),
('565d02751cea52.01591', 40),
('565d0275475979.82362', 40),
('565d0275626318.13382', 40),
('565d02758c4d86.44692', 40),
('565d0275ad28e3.46454', 40),
('565d0275c87532.00324', 40),
('565d0275e349f3.74847', 40),
('565d0276178157.41624', 40),
('565d02763a5925.25437', 40),
('565d02764f5676.97839', 40),
('565d0276754e05.10702', 40),
('565d0276864bc6.53153', 40),
('565d0276a4bfa3.40665', 40),
('565d0276bb0b54.78523', 40),
('565d0276dd7318.19818', 40),
('565d027702b7e4.03079', 40),
('565d02771df9b4.89582', 40),
('565d02774bf3f6.54015', 40),
('565d027762d691.99492', 40),
('565d027773c1c6.95318', 40),
('565d0277863ea0.39352', 40),
('565d0277a539a2.87962', 40),
('565d0277c3d2a6.01065', 40),
('565d0277d85cb1.39317', 40),
('565d0278049f79.42910', 40),
('565d02781fdcc5.21317', 40),
('565d02783da485.22892', 40),
('565d02785453b6.14340', 40),
('565d02787c7fb3.05940', 40),
('565d02789f5658.77420', 40),
('565d0278b9caf3.82716', 40),
('565d0278da82f3.71344', 40),
('565d027900d113.74593', 40),
('565d027916c815.88272', 40),
('565d027931ddf1.46993', 40),
('565d0279571739.67608', 40),
('565d02796ad5c1.15047', 40),
('565d02796f7d88.41343', 40),
('565d0279827888.65866', 40),
('565d0279a37503.26111', 40),
('565d0279c17295.92309', 40),
('565d0279d6ae65.88475', 40),
('565d0279e8e5d8.63240', 40);

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
('shirt', '54321'),
('testword', '565c9f4f9cc936.85489'),
('testword2', '565c9f4f9cc936.85489'),
('testword', '565c9f50d108f7.76018'),
('testword2', '565c9f50d108f7.76018'),
('testword', '565c9f52c90220.15133'),
('testword2', '565c9f52c90220.15133'),
('testword', '565d00ade90782.94684'),
('testword2', '565d00ade90782.94684'),
('testword', '565d00f6135cb5.55425'),
('testword2', '565d00f6135cb5.55425'),
('testword', '565d012a290611.05945'),
('testword2', '565d012a290611.05945'),
('testword', '565d0154451453.96219'),
('testword2', '565d0154451453.96219'),
('testword', '565d0157f263b8.79446'),
('testword2', '565d0157f263b8.79446'),
('testword', '565d01582b25a1.68925'),
('testword2', '565d01582b25a1.68925'),
('testword', '565d015865f172.90730'),
('testword2', '565d015865f172.90730'),
('testword', '565d01587d9476.29967'),
('testword2', '565d01587d9476.29967'),
('testword', '565d0158a566d3.72883'),
('testword2', '565d0158a566d3.72883'),
('testword', '565d0158c5db32.52268'),
('testword2', '565d0158c5db32.52268'),
('testword', '565d0158eb7376.39829'),
('testword2', '565d0158eb7376.39829'),
('testword', '565d0159247ee0.57633'),
('testword2', '565d0159247ee0.57633'),
('testword', '565d01594bd819.86859'),
('testword2', '565d01594bd819.86859'),
('testword', '565d0159747e56.65244'),
('testword2', '565d0159747e56.65244'),
('testword', '565d015998fd75.25402'),
('testword2', '565d015998fd75.25402'),
('testword', '565d0159c9d298.99412'),
('testword2', '565d0159c9d298.99412'),
('testword', '565d0159f2cff4.32668'),
('testword2', '565d0159f2cff4.32668'),
('testword', '565d015a2870d7.61432'),
('testword2', '565d015a2870d7.61432'),
('testword', '565d015a4a83a2.45874'),
('testword2', '565d015a4a83a2.45874'),
('testword', '565d015a6fdb12.72772'),
('testword2', '565d015a6fdb12.72772'),
('testword', '565d0274476811.68592'),
('testword2', '565d0274476811.68592'),
('testword', '565d0274f18508.87001'),
('testword2', '565d0274f18508.87001'),
('testword', '565d02751cea52.01591'),
('testword2', '565d02751cea52.01591'),
('testword', '565d0275475979.82362'),
('testword2', '565d0275475979.82362'),
('testword', '565d0275626318.13382'),
('testword2', '565d0275626318.13382'),
('testword', '565d02758c4d86.44692'),
('testword2', '565d02758c4d86.44692'),
('testword', '565d0275ad28e3.46454'),
('testword2', '565d0275ad28e3.46454'),
('testword', '565d0275c87532.00324'),
('testword2', '565d0275c87532.00324'),
('testword', '565d0275e349f3.74847'),
('testword2', '565d0275e349f3.74847'),
('testword', '565d0276178157.41624'),
('testword2', '565d0276178157.41624'),
('testword', '565d02763a5925.25437'),
('testword2', '565d02763a5925.25437'),
('testword', '565d02764f5676.97839'),
('testword2', '565d02764f5676.97839'),
('testword', '565d0276754e05.10702'),
('testword2', '565d0276754e05.10702'),
('testword', '565d0276864bc6.53153'),
('testword2', '565d0276864bc6.53153'),
('testword', '565d0276a4bfa3.40665'),
('testword2', '565d0276a4bfa3.40665'),
('testword', '565d0276bb0b54.78523'),
('testword2', '565d0276bb0b54.78523'),
('testword', '565d0276dd7318.19818'),
('testword2', '565d0276dd7318.19818'),
('testword', '565d027702b7e4.03079'),
('testword2', '565d027702b7e4.03079'),
('testword', '565d02771df9b4.89582'),
('testword2', '565d02771df9b4.89582'),
('testword', '565d02774bf3f6.54015'),
('testword2', '565d02774bf3f6.54015'),
('testword', '565d027762d691.99492'),
('testword2', '565d027762d691.99492'),
('testword', '565d027773c1c6.95318'),
('testword2', '565d027773c1c6.95318'),
('testword', '565d0277863ea0.39352'),
('testword2', '565d0277863ea0.39352'),
('testword', '565d0277a539a2.87962'),
('testword2', '565d0277a539a2.87962'),
('testword', '565d0277c3d2a6.01065'),
('testword2', '565d0277c3d2a6.01065'),
('testword', '565d0277d85cb1.39317'),
('testword2', '565d0277d85cb1.39317'),
('testword', '565d0278049f79.42910'),
('testword2', '565d0278049f79.42910'),
('testword', '565d02781fdcc5.21317'),
('testword2', '565d02781fdcc5.21317'),
('testword', '565d02783da485.22892'),
('testword2', '565d02783da485.22892'),
('testword', '565d02785453b6.14340'),
('testword2', '565d02785453b6.14340'),
('testword', '565d02787c7fb3.05940'),
('testword2', '565d02787c7fb3.05940'),
('testword', '565d02789f5658.77420'),
('testword2', '565d02789f5658.77420'),
('testword', '565d0278b9caf3.82716'),
('testword2', '565d0278b9caf3.82716'),
('testword', '565d0278da82f3.71344'),
('testword2', '565d0278da82f3.71344'),
('testword', '565d027900d113.74593'),
('testword2', '565d027900d113.74593'),
('testword', '565d027916c815.88272'),
('testword2', '565d027916c815.88272'),
('testword', '565d027931ddf1.46993'),
('testword2', '565d027931ddf1.46993'),
('testword', '565d0279571739.67608'),
('testword2', '565d0279571739.67608'),
('testword', '565d02796ad5c1.15047'),
('testword2', '565d02796ad5c1.15047'),
('testword', '565d02796f7d88.41343'),
('testword2', '565d02796f7d88.41343'),
('testword', '565d0279827888.65866'),
('testword2', '565d0279827888.65866'),
('testword', '565d0279a37503.26111'),
('testword2', '565d0279a37503.26111'),
('testword', '565d0279c17295.92309'),
('testword2', '565d0279c17295.92309'),
('testword', '565d0279d6ae65.88475'),
('testword2', '565d0279d6ae65.88475'),
('testword', '565d0279e8e5d8.63240'),
('testword2', '565d0279e8e5d8.63240');

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
('54321', 'CelticAlice220', 'HelloWorld', '2015-11-30', 4, 'BAD'),
('54321', 'test', 'HelloWorld', '2015-11-30', 4, 'BAD');

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
('tester', 'test', 9001, 'T', '1111-01-01', 'test', 'test'),
('tester', 'test', 9001, 'T', '1111-01-01', 'test10', 'test'),
('tester', 'test', 9001, 'T', '1111-01-01', 'test11', 'test'),
('tester', 'test', 9001, 'T', '1111-01-01', 'test2', 'test'),
('tester', 'test', 9001, 'T', '1111-01-01', 'test3', 'test'),
('tester', 'test', 9001, 'T', '1111-01-01', 'test4', 'test'),
('tester', 'test', 9001, 'T', '1111-01-01', 'test5', 'test'),
('tester', 'test', 9001, 'T', '1111-01-01', 'test6', 'test'),
('tester', 'test', 9001, 'T', '1111-01-01', 'test7', 'test'),
('tester', 'test', 9001, 'T', '1111-01-01', 'test8', 'test'),
('tester', 'test', 9001, 'T', '1111-01-01', 'test9', 'test');

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
('565d0154451453.96219', 'test9'),
('565d0157f263b8.79446', 'test9'),
('565d01582b25a1.68925', 'test9'),
('565d015865f172.90730', 'test9'),
('565d01587d9476.29967', 'test9'),
('565d0158a566d3.72883', 'test9'),
('565d0158c5db32.52268', 'test9'),
('565d0158eb7376.39829', 'test9'),
('565d0159247ee0.57633', 'test9'),
('565d01594bd819.86859', 'test9'),
('565d0159747e56.65244', 'test9'),
('565d015998fd75.25402', 'test9'),
('565d0159c9d298.99412', 'test9'),
('565d0159f2cff4.32668', 'test9'),
('565d015a2870d7.61432', 'test9'),
('565d015a4a83a2.45874', 'test9'),
('565d015a6fdb12.72772', 'test9'),
('565d0274476811.68592', 'test9'),
('565d0274f18508.87001', 'test9'),
('565d02751cea52.01591', 'test9'),
('565d0275475979.82362', 'test9'),
('565d0275626318.13382', 'test9'),
('565d02758c4d86.44692', 'test9'),
('565d0275ad28e3.46454', 'test9'),
('565d0275c87532.00324', 'test9'),
('565d0275e349f3.74847', 'test9'),
('565d0276178157.41624', 'test9'),
('565d02763a5925.25437', 'test9'),
('565d02764f5676.97839', 'test9'),
('565d0276754e05.10702', 'test9'),
('565d0276864bc6.53153', 'test9'),
('565d0276a4bfa3.40665', 'test9'),
('565d0276bb0b54.78523', 'test9'),
('565d0276dd7318.19818', 'test9'),
('565d027702b7e4.03079', 'test9'),
('565d02771df9b4.89582', 'test9'),
('565d02774bf3f6.54015', 'test9'),
('565d027762d691.99492', 'test9'),
('565d027773c1c6.95318', 'test9'),
('565d0277863ea0.39352', 'test9'),
('565d0277a539a2.87962', 'test9'),
('565d0277c3d2a6.01065', 'test9'),
('565d0277d85cb1.39317', 'test9'),
('565d0278049f79.42910', 'test9'),
('565d02781fdcc5.21317', 'test9'),
('565d02783da485.22892', 'test9'),
('565d02785453b6.14340', 'test9'),
('565d02787c7fb3.05940', 'test9'),
('565d02789f5658.77420', 'test9'),
('565d0278b9caf3.82716', 'test9'),
('565d0278da82f3.71344', 'test9'),
('565d027900d113.74593', 'test9'),
('565d027916c815.88272', 'test9'),
('565d027931ddf1.46993', 'test9'),
('565d0279571739.67608', 'test9'),
('565d02796ad5c1.15047', 'test9'),
('565d02796f7d88.41343', 'test9'),
('565d0279827888.65866', 'test9'),
('565d0279a37503.26111', 'test9'),
('565d0279c17295.92309', 'test9'),
('565d0279d6ae65.88475', 'test9'),
('565d0279e8e5d8.63240', 'test9');

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
('0000-00-00', '12345', 'Sepheroth23', 'CelticAlice220', 0, NULL),
('0000-00-00', '54321', 'Sepheroth23', 'CelticAlice220', 0, NULL);

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
('123', 'test'),
('565ca48f768d45.96748', 'test9');

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
