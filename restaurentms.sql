-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 17, 2022 at 04:59 PM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 8.0.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `restaurentms`
--

-- --------------------------------------------------------

--
-- Table structure for table `acroom`
--

CREATE TABLE `acroom` (
  `id` int(11) NOT NULL,
  `roomno` int(11) NOT NULL,
  `roomtype` varchar(20) DEFAULT NULL,
  `price` int(11) NOT NULL,
  `status` varchar(20) NOT NULL DEFAULT 'un book'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `acroom`
--

INSERT INTO `acroom` (`id`, `roomno`, `roomtype`, `price`, `status`) VALUES
(6, 522, 'AC', 900, 'un book');

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `name`, `username`, `email`, `password`) VALUES
(1, 'sakib', 'vai', 'a@g', '123'),
(2, 'sakib', 'shakib', 'abc@g.com', '123'),
(3, 'sha', 'kib', 'abc', '1234'),
(4, 'sha', 'kib', 'a@b', '123');

-- --------------------------------------------------------

--
-- Table structure for table `admin_edit`
--

CREATE TABLE `admin_edit` (
  `admin_id` int(11) NOT NULL,
  `roomno` int(11) NOT NULL,
  `roomtype` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `admin_edit`
--

INSERT INTO `admin_edit` (`admin_id`, `roomno`, `roomtype`) VALUES
(1, 121, 'deluxAC'),
(3, 523, 'nonAC'),
(4, 122, 'deluxAC'),
(5, 524, 'nonAC');

--
-- Triggers `admin_edit`
--
DELIMITER $$
CREATE TRIGGER `Audit_ac` AFTER INSERT ON `admin_edit` FOR EACH ROW BEGIN
        
IF (NEW.roomtype = 'AC') THEN
            INSERT INTO acroom

    SET  
	roomno = NEW.roomno,

    	roomtype =  NEW.roomtype,
	
	price = 900,

	status = 'un book';

     
      END IF;
   

END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `Audit_delux` AFTER INSERT ON `admin_edit` FOR EACH ROW BEGIN
     IF ( NEW.roomtype = 'deluxAC') THEN
        INSERT INTO deluxacroom
           SET
    
            roomno = NEW.roomno,

            roomtype =  NEW.roomtype,

           price = 1100,

           status = 'un book';
      
            
      END IF;
   
    

    

END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `Audit_nonac` AFTER INSERT ON `admin_edit` FOR EACH ROW BEGIN
        
IF (NEW.roomtype = 'nonAC') THEN
            INSERT INTO nonac

    SET  
	    roomno = NEW.roomno,

    	roomtype =  NEW.roomtype,
	
	   price = 700,

	   status = 'un book';

     
      END IF;
   

END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `card details`
--

CREATE TABLE `card details` (
  `id` int(11) NOT NULL,
  `cardno` bigint(16) NOT NULL,
  `cvv` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `card details`
--

INSERT INTO `card details` (`id`, `cardno`, `cvv`) VALUES
(1, 1111111111111111, 111),
(2, 2222222222222222, 222),
(3, 3333333333333333, 333),
(4, 4444444444444444, 444);

-- --------------------------------------------------------

--
-- Table structure for table `contact`
--

CREATE TABLE `contact` (
  `id` int(11) NOT NULL,
  `name` varchar(20) NOT NULL,
  `email` varchar(255) NOT NULL,
  `mobile` bigint(10) NOT NULL,
  `address` varchar(255) NOT NULL,
  `message` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `contact`
--

INSERT INTO `contact` (`id`, `name`, `email`, `mobile`, `address`, `message`) VALUES
(3, 'neel', 'neel@gmail.com', 1223344558, 'sarasnagar', 'food is not good'),
(4, 'jasprit', 'jasprit@gmail.com', 9889988998, 'chandan nagar', 'what is the price of AC room?'),
(5, 'harsh', 'harsh@gmail.com', 1234567899, 'burud goan', 'room pricw');

-- --------------------------------------------------------

--
-- Table structure for table `deluxacroom`
--

CREATE TABLE `deluxacroom` (
  `id` int(11) NOT NULL,
  `roomno` int(20) NOT NULL,
  `roomtype` varchar(20) DEFAULT NULL,
  `price` int(20) NOT NULL,
  `status` varchar(20) NOT NULL DEFAULT 'un book'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `deluxacroom`
--

INSERT INTO `deluxacroom` (`id`, `roomno`, `roomtype`, `price`, `status`) VALUES
(1, 101, 'deluxAC', 1100, 'book'),
(18, 111, 'deluxAC', 1100, 'unbook');

-- --------------------------------------------------------

--
-- Table structure for table `feedback`
--

CREATE TABLE `feedback` (
  `id` int(11) NOT NULL,
  `name` varchar(30) DEFAULT NULL,
  `feedback` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `feedback`
--

INSERT INTO `feedback` (`id`, `name`, `feedback`) VALUES
(1, 'yash', 'good'),
(2, 'harsh', 'excellent'),
(3, 'amrut', 'excellent'),
(4, 'raj mutha', 'excellent'),
(6, 'jasprit', 'good ');

-- --------------------------------------------------------

--
-- Table structure for table `food`
--

CREATE TABLE `food` (
  `id` int(255) NOT NULL,
  `full_name` text NOT NULL,
  `phone` bigint(100) NOT NULL,
  `address` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `food`
--

INSERT INTO `food` (`id`, `full_name`, `phone`, `address`) VALUES
(5, 'rohiy', 336366363, 'munoooo'),
(6, 'giri', 5555666677, 'pune'),
(19, 'virat', 102030405, 'burud goan road'),
(23, 'Yash pokharna ', 7768561235, 'burud goan road'),
(24, 'Yash pokharna ', 7765898978, 'burud goan road'),
(25, 'unnatti ', 9421197320, 'saras nagar nali me'),
(26, 'jasprit ', 9889988998, 'chandan nagar'),
(27, 'Yash pokharna ', 1223344558, 'burud goan road'),
(28, 'harsh', 1223344558, 'burud goan road'),
(29, 'samanna israt', 123456789, 'ctg');

-- --------------------------------------------------------

--
-- Table structure for table `hall`
--

CREATE TABLE `hall` (
  `id` int(11) NOT NULL,
  `hallyype` varchar(20) NOT NULL,
  `price` int(11) NOT NULL,
  `status` varchar(20) NOT NULL DEFAULT 'un book'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `hall`
--

INSERT INTO `hall` (`id`, `hallyype`, `price`, `status`) VALUES
(1, 'marriage', 10000, 'un book');

-- --------------------------------------------------------

--
-- Table structure for table `hall_details`
--

CREATE TABLE `hall_details` (
  `id` int(11) NOT NULL,
  `name` varchar(20) NOT NULL,
  `address` varchar(100) NOT NULL,
  `state` varchar(20) NOT NULL,
  `city` varchar(20) NOT NULL,
  `email` varchar(50) NOT NULL,
  `date` datetime NOT NULL,
  `members` int(11) NOT NULL,
  `function` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `hall_details`
--

INSERT INTO `hall_details` (`id`, `name`, `address`, `state`, `city`, `email`, `date`, `members`, `function`) VALUES
(1, 'Samanna Israt', 'ctg', 'bangladesg', 'ctg', 'samanna@gmail.com', '0000-00-00 00:00:00', 2, 'abc'),
(2, 'israt', 'dhaka', 'bangladesh', 'dhaka', 'abcd@gmail.com', '0000-00-00 00:00:00', 20, 'birthday');

-- --------------------------------------------------------

--
-- Table structure for table `nonac`
--

CREATE TABLE `nonac` (
  `id` int(11) NOT NULL,
  `roomno` int(11) NOT NULL,
  `roomtype` varchar(20) DEFAULT NULL,
  `price` int(11) NOT NULL,
  `status` varchar(20) NOT NULL DEFAULT 'un book'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `nonac`
--

INSERT INTO `nonac` (`id`, `roomno`, `roomtype`, `price`, `status`) VALUES
(9, 523, 'nonAC', 700, 'un book');

-- --------------------------------------------------------

--
-- Table structure for table `room booking`
--

CREATE TABLE `room booking` (
  `id` int(11) NOT NULL,
  `name` varchar(20) NOT NULL,
  `address` varchar(20) NOT NULL,
  `state` varchar(20) NOT NULL,
  `city` varchar(20) NOT NULL,
  `email` varchar(20) NOT NULL,
  `cin` varchar(20) NOT NULL,
  `cout` varchar(20) NOT NULL,
  `members` int(11) NOT NULL,
  `roomtype` varchar(20) DEFAULT NULL,
  `no of rooms` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `room booking`
--

INSERT INTO `room booking` (`id`, `name`, `address`, `state`, `city`, `email`, `cin`, `cout`, `members`, `roomtype`, `no of rooms`) VALUES
(7, 'yashh', 'geetanjali bunglow', 'maharshtra', 'ahmednagar', 'this@gmail.com', '22/11/2021', '23/11/2021', 2, 'deluxAC', 2),
(80, 'rohan', 'eden gardens', 'karnataka', 'Ahmednagar', 'ro@gmail.com', '2021-12-03', '2021-12-04', 2, 'Delux-AC', 1),
(85, 'Yash', 'burud goan', 'maharashtra', 'mumbai', 'rohan@gmail.com', '2021-12-05', '2021-12-06', 2, 'Delux AC', 1),
(87, 'viraj', 'burud goan', 'maharashtra', 'Delhi', 'rohan@gmail.com', '2021-12-06', '2021-12-07', 2, 'Non AC', 1),
(88, 'Yash', 'burud goan road', 'maharashtra', 'Ahmednagar', 'yashpokharna2513@gma', '2021-12-06', '2021-12-07', 1, 'Non AC', 1),
(89, 'rohit', 'burud goan', 'maharashtra', 'mumbai', 'ro@gmail.com', '2021-12-06', '2021-12-07', 2, 'Delux AC', 1),
(90, 'viraj', 'burud goan', 'maharashtra', 'Ahmednagar', 've@gmail.com', '2021-12-06', '2021-12-07', 2, 'Non AC', 1),
(91, 'jasprit', 'chandan nagar', 'maharashtra', 'mumbai', 'jasprit@gmail.com', '2021-12-07', '2021-12-08', 2, 'Non AC', 1),
(92, 'Yash', 'burud goan', 'maharashtra', 'Delhi', 'yashpokharna2513@gma', '2021-12-11', '2021-12-12', 2, 'Non AC', 1),
(93, 'harsh', 'burud goan', 'maharashtra', 'Ahmednagar', 'harsh@gmail.com', '2021-12-11', '2021-12-12', 1, 'Delux AC', 1),
(94, 'harsh bogawat', 'swastik chowk', 'maharashtra', 'Ahmednagar', 'harsh@gmail.com', '2022-01-13', '2022-01-14', 2, 'Delux AC', 1),
(95, 'Samanna Israt', 'ctg', 'bangladesg', 'ctg', 'samanna@gmail.com', '2022-04-07', '2022-04-15', 2, 'Delux AC', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `acroom`
--
ALTER TABLE `acroom`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `admin_edit`
--
ALTER TABLE `admin_edit`
  ADD PRIMARY KEY (`admin_id`);

--
-- Indexes for table `card details`
--
ALTER TABLE `card details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contact`
--
ALTER TABLE `contact`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `deluxacroom`
--
ALTER TABLE `deluxacroom`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `feedback`
--
ALTER TABLE `feedback`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `food`
--
ALTER TABLE `food`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hall`
--
ALTER TABLE `hall`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hall_details`
--
ALTER TABLE `hall_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `nonac`
--
ALTER TABLE `nonac`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `room booking`
--
ALTER TABLE `room booking`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `acroom`
--
ALTER TABLE `acroom`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `admin_edit`
--
ALTER TABLE `admin_edit`
  MODIFY `admin_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `card details`
--
ALTER TABLE `card details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `contact`
--
ALTER TABLE `contact`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `deluxacroom`
--
ALTER TABLE `deluxacroom`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `feedback`
--
ALTER TABLE `feedback`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `food`
--
ALTER TABLE `food`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `hall`
--
ALTER TABLE `hall`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `hall_details`
--
ALTER TABLE `hall_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `nonac`
--
ALTER TABLE `nonac`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `room booking`
--
ALTER TABLE `room booking`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=96;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
