-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 12, 2023 at 10:37 AM
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
-- Database: `my_project`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `admin_id` int(11) NOT NULL,
  `salary` int(11) DEFAULT NULL,
  `f_name` varchar(255) DEFAULT NULL,
  `l_name` varchar(255) DEFAULT NULL,
  `manager_id` int(11) DEFAULT NULL,
  `Password` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`admin_id`, `salary`, `f_name`, `l_name`, `manager_id`, `Password`) VALUES
(1212, 30000, 'mohammad', 'shami', 5, 'shami'),
(1313, 30000, 'yuzvendra', 'chahal', 5, 'chahal'),
(2323, 30000, 'rohith', 'sharma', 1, 'sharma'),
(3434, 30000, 'lokesh', 'rahul', 2, 'lokesh'),
(4433, 30000, 'sanju', 'samson', 2, 'sanju'),
(4545, 30000, 'suryakumar', 'yadav', 1, 'yadav'),
(5656, 30000, 'hardik', 'pandya', 4, 'pandya'),
(6767, 30000, 'ishaan', 'kishan', 5, 'kishan'),
(7878, 30000, 'ravindra', 'jadeja', 3, 'jadeja'),
(8989, 30000, 'dinesh', 'karthik', 3, 'karthik'),
(9090, 30000, 'jasprit', 'bumrah', 4, 'bumrah');

-- --------------------------------------------------------

--
-- Table structure for table `author`
--

CREATE TABLE `author` (
  `author_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `author`
--

INSERT INTO `author` (`author_id`) VALUES
(11),
(22),
(33),
(44),
(55),
(66),
(77),
(88),
(99),
(109),
(119),
(129),
(139),
(149),
(159),
(169),
(179),
(189),
(199),
(209),
(219),
(229),
(239),
(249),
(259),
(269),
(279),
(287),
(289),
(299),
(309),
(528),
(536),
(631),
(797),
(809),
(849);

-- --------------------------------------------------------

--
-- Table structure for table `author_names`
--

CREATE TABLE `author_names` (
  `f_name` varchar(255) DEFAULT NULL,
  `l_name` varchar(255) DEFAULT NULL,
  `author_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `author_names`
--

INSERT INTO `author_names` (`f_name`, `l_name`, `author_id`) VALUES
('Daniel', 'Defoe', 11),
('Chetan ', 'Bhagat', 22),
('J.R.R', 'Tolkien', 33),
('Peter', 'Norwig', 44),
('Stuart', 'Russel', 55),
('J K', 'Rowling', 66),
('Emily', 'Bronte', 77),
('R L', 'Stine', 88),
('Amish', 'Tripathi', 99),
('Tom', 'Mitchell', 109),
('Enid', 'Blyton', 119),
('Scott', 'Fitzgerald', 129),
('Georges', 'Remi', 139),
('Joseph', 'kizza', 149),
('Wenliang ', 'Du', 159),
('Roald ', 'Dahl', 169),
('Rick', 'Riordan', 179),
('Ramez', 'Elamsri', 189),
('Jonathan', 'Katz', 199),
('Yehuda', 'Lindell', 209),
('Don', 'Norman', 219),
('Robert', 'Sibesta', 229),
('djdjdj', 'nnnn', 631),
('kknk', 'nnnn', 849),
('fdfd', 'ijiji', 797),
('knkmk', 'dffd', 809),
('Dan', 'Brown', 287),
('jessica', 'pearson', 528),
('', 'daniel', 536);

-- --------------------------------------------------------

--
-- Table structure for table `books`
--

CREATE TABLE `books` (
  `ISBN` varchar(255) NOT NULL,
  `price` int(11) DEFAULT NULL,
  `category` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `admin_id` int(11) DEFAULT NULL,
  `publisher_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `books`
--

INSERT INTO `books` (`ISBN`, `price`, `category`, `status`, `title`, `admin_id`, `publisher_id`) VALUES
('b007', 1390, 'kids', 'yes', 'the famous five', 7878, 2000),
('b037', 1232, 'kids', 'yes', 'charlie and the chocolate factory', 4545, 3000),
('b133', 789, 'kids', 'yes', 'james and the giant peach', 9090, 1000),
('b152', 1000, 'novel', 'yes', 'The lord of the rings', 2323, 3000),
('b155', 1800, 'kids', 'yes', 'matilda', 5656, 2000),
('b209', 1500, 'kids', 'yes', 'the bfg', 1313, 1000),
('b222', 289, 'novel', 'yes', 'robinson crusoe', 4545, 1000),
('b231', 333, 'academics', 'yes', 'fundamentals of database systems', 2323, 1000),
('b232', 599, 'novel', 'yes', 'percy jackson and the sea of monsters', 1313, 2000),
('b234', 1099, 'novel', 'yes', 'raavan:the enemy of aryavarta', 1212, 3000),
('b324', 3432, 'academics', 'no', 'computer network security', 2323, 1000),
('b374', 223, 'fiction', 'yes', 'percy jackson: the lightning theif', 1212, 4000),
('b428', 756, 'fiction', 'no', 'goosebumps', 5656, 3000),
('b436', 1543, 'novel', 'yes', 'ram:scion of ikshvaku', 1212, 1000),
('b452', 476, 'fiction', 'yes', 'The secret of nagas', 2323, 4000),
('b521', 999, 'academics', 'yes', 'the design of everyday things', 4433, 3000),
('b545', 1234, 'novel', 'no', 'the great gatsby', 6767, 3000),
('b565', 1546, 'academics', 'no', 'artificial intelligence', 5656, 4000),
('b667', 1444, 'novel', 'yes', 'the immortals of meluha', 4433, 4000),
('b723', 899, 'novel', 'yes', 'the oath of vayuputras', 7878, 2000),
('b760', 1233, 'academics', 'yes', 'intoduction to modern cryptography', 7878, 4000),
('b767', 1555, 'academics', 'yes', 'computer and internet security', 9090, 2000),
('b769', 2222, 'novel', 'yes', 'sita:warrior of mithila', 2323, 2000),
('b774', 243, 'academics', 'yes', 'concepts of programming languages', 2323, 4000),
('b777', 454, 'novel', 'yes', 'wuthering heights', 6767, 2000),
('b826', 222, 'fiction', 'no', 'harry potter and the chamber of secrets', 4545, 1000),
('b908', 1800, 'academics', 'no', 'machine learning', 8989, 1000),
('b986', 543, 'fiction', 'no', 'revolution 2020', 3434, 2000),
('b998', 2132, 'kids', 'yes', 'the adventures of tintin', 8989, 4000),
('b999', 1090, 'novel', 'yes', 'the 3 mistakes of my life', 1212, 3000);

-- --------------------------------------------------------

--
-- Table structure for table `book_names`
--

CREATE TABLE `book_names` (
  `name` varchar(255) DEFAULT NULL,
  `author_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `book_names`
--

INSERT INTO `book_names` (`name`, `author_id`) VALUES
('robinson crusoe', 11),
('revolution 2020', 22),
('The lord of the rings', 33),
('artificial intelligence', 44),
('harry potter and the chamber of secrets', 66),
('wuthering heights', 77),
('goosebumps', 88),
('The secret of nagas', 99),
('machine learning', 109),
('the famous five', 119),
('the great gatsby', 129),
('the adventures of tintin', 139),
('computer network security', 149),
('computer and internet security', 159),
('charlie and the chocolate factory', 169),
('percy jackson: the lightning theif', 179),
('fundamentals of database systems', 189),
('percy jackson and the sea of monsters', 179),
('the 3 mistakes of my life', 22),
('intoduction to modern cryptography', 199),
('the bfg', 169),
('matilda', 169),
('the design of everyday things', 219),
('concepts of programming languages', 229),
('ram:scion of ikshvaku', 99),
('sita:warrior of mithila', 99),
('raavan:the enemy of aryavarta', 99),
('the immortals of meluha', 99),
('james and the giant peach', 169),
('the oath of vayuputras', 99),
('artificial intelligence', 44),
('intoduction to modern cryptography', 209);

-- --------------------------------------------------------

--
-- Table structure for table `branch`
--

CREATE TABLE `branch` (
  `manager_id` int(11) NOT NULL,
  `f_name` varchar(255) NOT NULL,
  `l_name` varchar(255) NOT NULL,
  `contact_no` bigint(11) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `street` varchar(255) DEFAULT NULL,
  `pin` int(11) DEFAULT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `branch`
--

INSERT INTO `branch` (`manager_id`, `f_name`, `l_name`, `contact_no`, `state`, `city`, `street`, `pin`, `password`) VALUES
(1, 'soumye', 'joshi', 9736457263, 'karnataka', 'bangalore', 'church street', 635487, 'soumye'),
(2, 'tanya', 'arora', 9867198987, 'andhra pradesh', 'amaravati', 'reddy street', 563726, 'tanya'),
(3, 'soubhagya', 'ranjan', 9487255664, 'tamil nadu', 'chennai', 'amma street', 978878, 'soubhagya'),
(4, 'srujan', 'raj', 9188769897, 'maharashtra', 'mumbai', 'linking road', 263874, 'srujan'),
(5, 'srinath', 'ganesh', 9235547563, 'gujarat', 'ahmedabad', 'gandhi road', 162534, 'srinath');

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `customer_id` int(11) NOT NULL,
  `f_name` varchar(255) DEFAULT NULL,
  `l_name` varchar(255) DEFAULT NULL,
  `street` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `pin` int(11) DEFAULT NULL,
  `reg_date` date DEFAULT NULL,
  `manager_id` int(11) DEFAULT NULL,
  `password` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`customer_id`, `f_name`, `l_name`, `street`, `city`, `pin`, `reg_date`, `manager_id`, `password`) VALUES
(11111, 'vishwas', 'm', '2', 'udupi', 182432, '2022-10-12', 1, 'vishwas'),
(12345, 'vismaya', 'r', '45', 'mysore', 143678, '2022-10-04', 1, 'vismaya'),
(13234, 'tushar', 'bothra', '44', 'mumbai', 369061, '2022-10-06', 5, 'tushar'),
(15432, 'tenzin', 'tsephel', '65', 'hubli', 909090, '2022-10-05', 3, 'tenzin'),
(18273, 'sheldon', 'cooper', '46', 'texas', 756735, '2022-10-12', 3, 'sheldon'),
(22222, 'raghav', 'loknath', '6', 'salem', 543234, '2022-10-03', 3, 'raghav'),
(44444, 'sai', 'rethwik', '7', 'marathalli', 248554, '2022-10-16', 4, 'sai'),
(46384, 'vidip', 'chabhra', '28', 'jaipur', 821432, '2022-10-10', 5, 'vidip'),
(55555, 'vishwa', 'mehta', '1', 'haralur', 268543, '2022-10-11', 3, 'vishwa'),
(56434, 'jennifer', 'aniston', '12', 'los angeles', 936545, '2022-10-10', 2, 'jennifer'),
(56453, 'mike', 'ross', '41', 'new york', 152434, '2022-10-05', 4, 'mike'),
(65432, 'bavanika', 'v', '19', 'bangalore', 825378, '2022-10-07', 4, 'bavanika'),
(66666, 'vinti', 'agrawal', '34', 'bangalore', 275325, '0000-00-00', 2, 'vinti'),
(67890, 'srushti', 's', '85', 'bangalore', 629078, '2022-10-04', 4, 'srushti'),
(77777, 'vishal', 'elangovan', '67', 'chennai', 873456, '2022-10-09', 2, 'vishal'),
(87456, 'shuvam', 'bose', '73', 'kolkata', 456234, '2022-10-14', 2, 'shuvam'),
(88888, 'tushar', 'bhat', '98', 'mangalore', 813456, '2022-10-09', 4, 'tushar'),
(99999, 'sahith', 'reddy', '11', 'nandyal', 659766, '2022-10-02', 3, 'sahith'),
(990099, 'Harvey', 'Spector', 'Wall Street', 'New York', 298298, '2022-11-19', 1, 'Harvey Reginald Spector'),
(7425646, 'oioioi', 'wewew', 'uii', 'jijijji', 2323, '2022-11-23', 1, 'pppp');

-- --------------------------------------------------------

--
-- Table structure for table `issue_return`
--

CREATE TABLE `issue_return` (
  `customer_id` int(11) DEFAULT NULL,
  `admin_id` int(11) DEFAULT NULL,
  `ISBN` varchar(255) DEFAULT NULL,
  `issue_date` date DEFAULT NULL,
  `return_date` date DEFAULT NULL,
  `fine` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `issue_return`
--

INSERT INTO `issue_return` (`customer_id`, `admin_id`, `ISBN`, `issue_date`, `return_date`, `fine`) VALUES
(11111, 2323, 'b222', '2022-11-12', '2022-11-19', 0),
(11111, 4545, 'b986', '2022-11-12', '2022-11-19', 0),
(22222, 7878, 'b152', '2022-11-03', '2022-11-10', 0),
(22222, 8989, 'b565', '2022-11-03', '2022-11-10', 0),
(44444, 5656, 'b777', '2022-11-05', '2022-11-12', 0),
(55555, 8989, 'b428', '2022-11-08', '2022-11-15', 0),
(66666, 4433, 'b452', '2022-11-12', '2022-11-19', 0),
(66666, 3434, 'b908', '2022-11-12', '2022-11-19', 0),
(77777, 4433, 'b007', '2022-11-18', '2022-11-25', 0),
(87456, 3434, 'b545', '2022-11-06', '2022-11-13', 0),
(88888, 9090, 'b999', '2022-11-11', '2022-11-18', 0),
(18273, 8989, 'b037', '2022-11-16', '2022-11-23', 0),
(18273, 2323, 'b152', '2022-11-05', '2022-11-12', 0),
(44444, 2323, 'b152', '2022-11-23', '2022-11-30', 0);

--
-- Triggers `issue_return`
--
DELIMITER $$
CREATE TRIGGER `before_issuing_book` BEFORE INSERT ON `issue_return` FOR EACH ROW BEGIN
		DECLARE err_msg varchar(100);
    DECLARE counts int;
    SET err_msg = "The number of books issued cannot exceed 2";
    SELECT COUNT(*) into counts from issue_return where issue_return.customer_id=new.customer_id;
    IF counts=2 THEN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT=err_msg;
    END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `phone_no`
--

CREATE TABLE `phone_no` (
  `customer_id` int(11) DEFAULT NULL,
  `number` bigint(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `phone_no`
--

INSERT INTO `phone_no` (`customer_id`, `number`) VALUES
(11111, 9753573673),
(22222, 9528674727),
(33333, 9735271636),
(44444, 9878676568),
(55555, 9182736336),
(66666, 9983846563),
(77777, 9573848382),
(88888, 9173546583),
(99999, 9726466666),
(12345, 9617694746),
(67890, 9552537485),
(13234, 9833346466),
(15432, 9998625347),
(65432, 9555537645),
(87456, 9723653861),
(46384, 9514348722),
(56453, 9233326455),
(18273, 9674548999),
(56434, 9321527387),
(11111, 9237847264),
(22222, 9854444848);

-- --------------------------------------------------------

--
-- Table structure for table `publisher`
--

CREATE TABLE `publisher` (
  `publisher_id` int(11) NOT NULL,
  `publisher_name` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `publisher`
--

INSERT INTO `publisher` (`publisher_id`, `publisher_name`, `country`) VALUES
(1000, 'pearson', 'england'),
(2000, 'macmillan', 'usa'),
(3000, 'puffin books', 'united kingdom'),
(4000, 'penguin random house', 'india');

-- --------------------------------------------------------

--
-- Table structure for table `written_by`
--

CREATE TABLE `written_by` (
  `ISBN` varchar(255) DEFAULT NULL,
  `author_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `written_by`
--

INSERT INTO `written_by` (`ISBN`, `author_id`) VALUES
('b222', 11),
('b986', 22),
('b152', 33),
('b565', 44),
('b826', 66),
('b777', 77),
('b428', 88),
('b452', 99),
('b908', 109),
('b007', 119),
('b545', 129),
('b998', 139),
('b324', 149),
('b767', 159),
('b037', 169),
('b374', 179),
('b231', 189),
('b232', 179),
('b999', 22),
('b760', 199),
('b209', 169),
('b155', 169),
('b521', 219),
('b774', 229),
('b436', 99),
('b769', 99),
('b234', 99),
('b667', 99),
('b133', 169),
('b723', 99),
('b565', 44),
('b760', 209);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`admin_id`),
  ADD KEY `manager_id` (`manager_id`);

--
-- Indexes for table `author`
--
ALTER TABLE `author`
  ADD PRIMARY KEY (`author_id`);

--
-- Indexes for table `author_names`
--
ALTER TABLE `author_names`
  ADD KEY `author_id` (`author_id`);

--
-- Indexes for table `books`
--
ALTER TABLE `books`
  ADD PRIMARY KEY (`ISBN`),
  ADD KEY `admin_id` (`admin_id`),
  ADD KEY `publisher_id` (`publisher_id`);

--
-- Indexes for table `book_names`
--
ALTER TABLE `book_names`
  ADD KEY `author_id` (`author_id`);

--
-- Indexes for table `branch`
--
ALTER TABLE `branch`
  ADD PRIMARY KEY (`manager_id`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`customer_id`),
  ADD KEY `manager_id` (`manager_id`);

--
-- Indexes for table `issue_return`
--
ALTER TABLE `issue_return`
  ADD KEY `customer_id` (`customer_id`),
  ADD KEY `admin_id` (`admin_id`),
  ADD KEY `ISBN` (`ISBN`);

--
-- Indexes for table `phone_no`
--
ALTER TABLE `phone_no`
  ADD KEY `customer_id` (`customer_id`);

--
-- Indexes for table `publisher`
--
ALTER TABLE `publisher`
  ADD PRIMARY KEY (`publisher_id`);

--
-- Indexes for table `written_by`
--
ALTER TABLE `written_by`
  ADD KEY `ISBN` (`ISBN`),
  ADD KEY `author_id` (`author_id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `admins`
--
ALTER TABLE `admins`
  ADD CONSTRAINT `admins_ibfk_1` FOREIGN KEY (`manager_id`) REFERENCES `branch` (`manager_id`);

--
-- Constraints for table `author_names`
--
ALTER TABLE `author_names`
  ADD CONSTRAINT `author_names_ibfk_1` FOREIGN KEY (`author_id`) REFERENCES `author` (`author_id`);

--
-- Constraints for table `books`
--
ALTER TABLE `books`
  ADD CONSTRAINT `books_ibfk_1` FOREIGN KEY (`admin_id`) REFERENCES `admins` (`admin_id`),
  ADD CONSTRAINT `books_ibfk_2` FOREIGN KEY (`publisher_id`) REFERENCES `publisher` (`publisher_id`);

--
-- Constraints for table `book_names`
--
ALTER TABLE `book_names`
  ADD CONSTRAINT `book_names_ibfk_1` FOREIGN KEY (`author_id`) REFERENCES `author` (`author_id`);

--
-- Constraints for table `customer`
--
ALTER TABLE `customer`
  ADD CONSTRAINT `customer_ibfk_1` FOREIGN KEY (`manager_id`) REFERENCES `branch` (`manager_id`);

--
-- Constraints for table `issue_return`
--
ALTER TABLE `issue_return`
  ADD CONSTRAINT `issue_return_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`),
  ADD CONSTRAINT `issue_return_ibfk_2` FOREIGN KEY (`admin_id`) REFERENCES `admins` (`admin_id`),
  ADD CONSTRAINT `issue_return_ibfk_3` FOREIGN KEY (`ISBN`) REFERENCES `books` (`ISBN`);

--
-- Constraints for table `phone_no`
--
ALTER TABLE `phone_no`
  ADD CONSTRAINT `phone_no_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`);

--
-- Constraints for table `written_by`
--
ALTER TABLE `written_by`
  ADD CONSTRAINT `written_by_ibfk_1` FOREIGN KEY (`ISBN`) REFERENCES `books` (`ISBN`),
  ADD CONSTRAINT `written_by_ibfk_2` FOREIGN KEY (`author_id`) REFERENCES `author` (`author_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
