-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3308
-- Generation Time: May 16, 2020 at 09:47 AM
-- Server version: 8.0.18
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
-- Database: `sales`
--

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
CREATE TABLE IF NOT EXISTS `customer` (
  `CustomerID` int(11) NOT NULL,
  `Username` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`CustomerID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`CustomerID`, `Username`) VALUES
(1, 'jayshah07'),
(2, 'satyapavan'),
(3, 'rajesh064'),
(4, 'sanketd'),
(5, 'tharizeph'),
(6, 'manan123'),
(7, 'halagamer'),
(8, 'deep34');

-- --------------------------------------------------------

--
-- Table structure for table `customer_details`
--

DROP TABLE IF EXISTS `customer_details`;
CREATE TABLE IF NOT EXISTS `customer_details` (
  `CustomerID` int(11) NOT NULL,
  `Phone_no` varchar(11) DEFAULT NULL,
  `Email_id` varchar(20) NOT NULL,
  `Address` varchar(100) NOT NULL,
  KEY `CustomerID` (`CustomerID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `customer_details`
--

INSERT INTO `customer_details` (`CustomerID`, `Phone_no`, `Email_id`, `Address`) VALUES
(1, '9986965412', 'jayshah@gmail.com', 'Vinay Tower,Mumbai,Maharashtra'),
(2, '9632587410', 'satyapavan@gmal.com', 'Gandhi Nagar,Hyderabad,Telangana'),
(4, '9512347860', 'sanketd@gmail.com', 'Bidar,Karnataka'),
(6, '9001723657', 'mananshah@gmail.com', 'Pooja Park,Mumbai,Maharashtra'),
(3, '9663224490', 'raju@gmail.com', 'Hanuman gali,Delhi'),
(5, '9110003610', 'zeph@gmail.com', 'Hyderabad'),
(7, '9887755440', 'harsh06@gmail.com', 'Gandhi Chowk,Ahmedabad,Gujarat'),
(8, '9631472581', 'deepu@gmail.com', 'Nehru road,Bhopal,Madhya Pradesh');

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
CREATE TABLE IF NOT EXISTS `payment` (
  `PaymentID` int(11) NOT NULL,
  `CustomerID` int(11) NOT NULL,
  `Payment_time` varchar(30) NOT NULL,
  `Amount` float(10,2) NOT NULL,
  PRIMARY KEY (`PaymentID`),
  KEY `CustomerID` (`CustomerID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `payment`
--

INSERT INTO `payment` (`PaymentID`, `CustomerID`, `Payment_time`, `Amount`) VALUES
(1, 2, '11:30 AM', 127.00),
(2, 7, '3:03 PM', 24300.00),
(3, 1, '8:30 PM', 299.00),
(4, 3, '12:30 PM', 6000.00),
(5, 4, '6:00 PM', 270.00),
(6, 8, '9:00 AM', 45860.00),
(7, 2, '12:01 AM', 500.00),
(8, 3, '8:30 PM', 240.00),
(9, 6, '8:00 PM', 24000.00),
(10, 4, '2:30 PM', 46500.00);

-- --------------------------------------------------------

--
-- Table structure for table `payment_details`
--

DROP TABLE IF EXISTS `payment_details`;
CREATE TABLE IF NOT EXISTS `payment_details` (
  `Payment_detailID` int(11) NOT NULL,
  `PaymentID` int(11) NOT NULL,
  `CustomerID` int(11) NOT NULL,
  `ProductID` int(11) NOT NULL,
  `Quantity` int(3) DEFAULT NULL,
  `Mode` varchar(20) DEFAULT NULL,
  `Discount` float(7,2) NOT NULL,
  PRIMARY KEY (`Payment_detailID`),
  KEY `PaymentID` (`PaymentID`),
  KEY `ProductID` (`ProductID`),
  KEY `CustomerID` (`CustomerID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `payment_details`
--

INSERT INTO `payment_details` (`Payment_detailID`, `PaymentID`, `CustomerID`, `ProductID`, `Quantity`, `Mode`, `Discount`) VALUES
(1, 1, 2, 5, 1, 'Cash On Delivery', 0.00),
(2, 3, 1, 3, 1, 'UPI', 100.00),
(3, 2, 7, 1, 1, 'Debit Card', 3690.00),
(4, 8, 3, 5, 2, 'UPI', 7.00),
(5, 7, 2, 4, 1, 'Credit Card', 209.00),
(6, 5, 4, 3, 1, 'UPI', 129.00),
(7, 6, 8, 6, 1, 'Cash On Delivery', 11130.00),
(8, 4, 3, 8, 1, 'Cash On Delivery', 315.00),
(9, 9, 6, 1, 1, 'Credit Card', 3990.00),
(10, 10, 4, 6, 1, 'Debit Card', 10490.00);

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
CREATE TABLE IF NOT EXISTS `product` (
  `Product_id` int(11) NOT NULL,
  `Name` varchar(25) NOT NULL,
  `Price` float(8,2) NOT NULL,
  `InStock` varchar(5) NOT NULL,
  PRIMARY KEY (`Product_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`Product_id`, `Name`, `Price`, `InStock`) VALUES
(1, 'Vivo V17', 27990.00, 'Yes'),
(2, 'Redmi Note 8', 12999.00, 'No'),
(3, 'Rich Dad Poor Dad', 399.00, 'Yes'),
(4, 'Python for Everybody', 709.00, 'Yes'),
(5, 'Parachute Coconut Oil', 127.00, 'Yes'),
(6, 'Asus Vivobook 14', 56990.00, 'Yes'),
(7, 'Titan Analog Man\'s Watch', 2395.00, 'No'),
(8, 'Hero Sprint Junior Cycle', 6315.00, 'Yes');

-- --------------------------------------------------------

--
-- Table structure for table `product_details`
--

DROP TABLE IF EXISTS `product_details`;
CREATE TABLE IF NOT EXISTS `product_details` (
  `ProductID` int(11) NOT NULL,
  `Description` varchar(150) DEFAULT NULL,
  `Type` varchar(25) DEFAULT NULL,
  KEY `ProductID` (`ProductID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `product_details`
--

INSERT INTO `product_details` (`ProductID`, `Description`, `Type`) VALUES
(5, 'Volume:300ml,Speciality:No Preservatives', 'Oil'),
(1, '32MP front camera,8GB Ram,128GB internal memory', 'Mobile'),
(2, 'Colour:Purple,4GB Ram,64GB internal storage,48MP AI Quad camera', 'Mobile'),
(3, 'What the rich teach their kids about money that the Poor and Middle class do not', 'Book'),
(6, 'Intel Core i5 8th Gen 14-inch,8GB Ram,512GB SSD,Windows 10', 'Laptop'),
(4, 'Exploring Data in Python 3', 'Programming Book'),
(7, 'Dial Color:Silver,Band Color:Brown,Display type:Analog', 'Men\'s Watch'),
(8, 'Single Speed cycle for boys,Height between 3 feet 2 inches to 4 feet 2 inches', 'Cycle');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
