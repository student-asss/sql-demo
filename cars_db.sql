-- phpMyAdmin SQL Dump
-- version 5.0.4deb2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Dec 10, 2021 at 12:13 PM
-- Server version: 10.5.12-MariaDB-0+deb11u1
-- PHP Version: 7.4.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cars_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `brand`
--

CREATE TABLE `brand` (
  `brand_id` int(11) NOT NULL,
  `model_name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `brand`
--

INSERT INTO `brand` (`brand_id`, `model_name`) VALUES
(1, 'Porsche'),
(2, 'Lamborghini'),
(3, 'Aston Martin'),
(4, 'Maserati'),
(5, 'Bentley'),
(6, 'Ferrari'),
(7, 'McLaren');

-- --------------------------------------------------------

--
-- Table structure for table `car`
--

CREATE TABLE `car` (
  `car_id` int(11) NOT NULL,
  `registered` enum('yes','no') NOT NULL,
  `price` double NOT NULL,
  `model_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `car`
--

INSERT INTO `car` (`car_id`, `registered`, `price`, `model_id`) VALUES
(1, 'yes', 85000, 1),
(2, 'yes', 120000, 2),
(3, 'no', 190000, 3),
(4, 'no', 97000, 4),
(5, 'yes', 79000, 5),
(6, 'no', 89000, 6),
(7, 'no', 205000, 7),
(8, 'no', 155000, 8),
(9, 'yes', 91000, 9),
(10, 'no', 230000, 10),
(11, 'no', 105000, 11),
(12, 'no', 88400, 12),
(13, 'no', 250000, 13),
(14, 'no', 340000, 14),
(15, 'no', 280000, 15),
(16, 'no', 245000, 16),
(17, 'no', 350000, 17),
(18, 'yes', 507000, 18),
(19, 'yes', 1000000, 19),
(20, 'no', 1650000, 20),
(21, 'no', 174500, 21);

-- --------------------------------------------------------

--
-- Stand-in structure for view `count_models_by_brands`
-- (See below for the actual view)
--
CREATE TABLE `count_models_by_brands` (
`Brand` varchar(100)
,`Model` bigint(21)
);

-- --------------------------------------------------------

--
-- Table structure for table `fuel`
--

CREATE TABLE `fuel` (
  `fuel_id` int(11) NOT NULL,
  `type` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `fuel`
--

INSERT INTO `fuel` (`fuel_id`, `type`) VALUES
(1, 'Gasoline'),
(2, 'Dizel'),
(3, 'Electric'),
(4, 'Hybrid');

-- --------------------------------------------------------

--
-- Stand-in structure for view `max_price_by_brand`
-- (See below for the actual view)
--
CREATE TABLE `max_price_by_brand` (
`Brand` varchar(100)
,`Model` varchar(100)
,`Fuel` varchar(100)
,`HP` varchar(11)
,`Price` double
);

-- --------------------------------------------------------

--
-- Table structure for table `model`
--

CREATE TABLE `model` (
  `model_id` int(11) NOT NULL,
  `model_name` varchar(100) NOT NULL,
  `horsepower` varchar(11) DEFAULT '',
  `year` int(4) NOT NULL,
  `brand_id` int(11) NOT NULL,
  `fuel_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `model`
--

INSERT INTO `model` (`model_id`, `model_name`, `horsepower`, `year`, `brand_id`, `fuel_id`) VALUES
(1, 'Cayenne', '335/HP', 2020, 1, 3),
(2, 'Taycan', '321/HP', 2021, 1, 3),
(3, 'Urus', '', 2020, 2, 1),
(4, 'Valkyrie', '1140/HP', 2021, 3, 1),
(5, 'Ghibli', '', 2019, 4, 4),
(6, 'Levante', '580/HP', 2021, 4, 1),
(7, 'Granturism', '', 2020, 4, 2),
(8, 'Continenta', '650/HP', 2019, 5, 2),
(9, 'Mulsanne', '', 2019, 5, 1),
(10, 'Aventador', '', 2021, 2, 3),
(11, 'Bentaiga S', '542/HP', 2021, 5, 4),
(12, 'Panamera', '325/HP', 2021, 1, 1),
(13, '296GTB', '830/HP', 2021, 6, 1),
(14, '812 SuperFast/GTS', '', 2021, 6, 3),
(15, 'F8 Tributo', '720/HP', 2021, 6, 4),
(16, 'Portofino', '620/HP', 2021, 6, 1),
(17, 'Purosangue', '', 2021, 6, 4),
(18, 'SF90 Stradale/Spider', '', 2021, 6, 3),
(19, 'Senna', '789/HP', 2020, 7, 3),
(20, 'Elva', '804/HP', 2021, 7, 3),
(21, '911 Turbo', '572/HP', 2020, 1, 3);

--
-- Triggers `model`
--
DELIMITER $$
CREATE TRIGGER `trigger_model_bi` BEFORE INSERT ON `model` FOR EACH ROW BEGIN
IF NEW.year > 2021 THEN
SIGNAL SQLSTATE '50001' SET MESSAGE_TEXT = 'The Year could not be higher then the current year!!!`';
END IF;

IF NEW.horsepower NOT RLIKE 
'^[0-9]{2,5}/[KS]$' THEN
SIGNAL SQLSTATE '50006' SET MESSAGE_TEXT = 'Format has to be between 2 and 4 numbers/HP';
END IF;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `trigger_model_bu` BEFORE UPDATE ON `model` FOR EACH ROW BEGIN
IF NEW.year > 2021 THEN
SIGNAL SQLSTATE '50001' SET MESSAGE_TEXT = 'The Year could not be higher then the current year!!!`';
END IF;

IF NEW.horsepower NOT RLIKE 
'^[0-9]{2,5}/[KS]$' THEN
SIGNAL SQLSTATE '50006' SET MESSAGE_TEXT = 'Format has to be between 2 and 4 numbers/HP';
END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Stand-in structure for view `optional_car_selection`
-- (See below for the actual view)
--
CREATE TABLE `optional_car_selection` (
`Brand` varchar(100)
,`Model` varchar(100)
,`Godina` int(4)
,`Fuel` varchar(100)
,`Registered` enum('yes','no')
,`Price` double
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `order_by_price_and_brand`
-- (See below for the actual view)
--
CREATE TABLE `order_by_price_and_brand` (
`ID` int(11)
,`Model` varchar(100)
,`Brend` varchar(100)
,`Price` double
,`Year` int(4)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `sort_by_year_of_production`
-- (See below for the actual view)
--
CREATE TABLE `sort_by_year_of_production` (
`ID` int(11)
,`Model` varchar(100)
,`Brend` varchar(100)
,`Price` double
,`Year` int(4)
);

-- --------------------------------------------------------

--
-- Structure for view `count_models_by_brands`
--
DROP TABLE IF EXISTS `count_models_by_brands`;

CREATE ALGORITHM=UNDEFINED DEFINER=`developer`@`localhost` SQL SECURITY DEFINER VIEW `count_models_by_brands`  AS SELECT `brand`.`model_name` AS `Brand`, count(`model`.`model_id`) AS `Model` FROM (`brand` join `model` on(`brand`.`brand_id` = `model`.`brand_id`)) GROUP BY `brand`.`model_name` ;

-- --------------------------------------------------------

--
-- Structure for view `max_price_by_brand`
--
DROP TABLE IF EXISTS `max_price_by_brand`;

CREATE ALGORITHM=UNDEFINED DEFINER=`developer`@`localhost` SQL SECURITY DEFINER VIEW `max_price_by_brand`  AS SELECT `brand`.`model_name` AS `Brand`, `model`.`model_name` AS `Model`, `fuel`.`type` AS `Fuel`, `model`.`horsepower` AS `HP`, max(`car`.`price`) AS `Price` FROM (((`brand` join `model`) join `fuel`) join `car`) WHERE `model`.`brand_id` = `brand`.`brand_id` AND `model`.`model_id` = `car`.`model_id` AND `model`.`fuel_id` = `fuel`.`fuel_id` GROUP BY `brand`.`brand_id` ;

-- --------------------------------------------------------

--
-- Structure for view `optional_car_selection`
--
DROP TABLE IF EXISTS `optional_car_selection`;

CREATE ALGORITHM=UNDEFINED DEFINER=`developer`@`localhost` SQL SECURITY DEFINER VIEW `optional_car_selection`  AS SELECT `brand`.`model_name` AS `Brand`, `model`.`model_name` AS `Model`, `model`.`year` AS `Godina`, `fuel`.`type` AS `Fuel`, `car`.`registered` AS `Registered`, `car`.`price` AS `Price` FROM (((`model` join `brand`) join `fuel`) join `car`) WHERE `fuel`.`fuel_id` = 1 AND `car`.`registered` = 'no' AND `car`.`price` > 14000 AND `model`.`year` > 2019 AND `model`.`brand_id` = `brand`.`brand_id` AND `model`.`fuel_id` = `fuel`.`fuel_id` AND `car`.`model_id` = `model`.`model_id` ORDER BY `car`.`price` ASC ;

-- --------------------------------------------------------

--
-- Structure for view `order_by_price_and_brand`
--
DROP TABLE IF EXISTS `order_by_price_and_brand`;

CREATE ALGORITHM=UNDEFINED DEFINER=`developer`@`localhost` SQL SECURITY DEFINER VIEW `order_by_price_and_brand`  AS SELECT `sort_by_year_of_production`.`ID` AS `ID`, `sort_by_year_of_production`.`Model` AS `Model`, `sort_by_year_of_production`.`Brend` AS `Brend`, `sort_by_year_of_production`.`Price` AS `Price`, `sort_by_year_of_production`.`Year` AS `Year` FROM `sort_by_year_of_production` WHERE `sort_by_year_of_production`.`Price` between 70000 and 90000 ORDER BY `sort_by_year_of_production`.`Brend` ASC ;

-- --------------------------------------------------------

--
-- Structure for view `sort_by_year_of_production`
--
DROP TABLE IF EXISTS `sort_by_year_of_production`;

CREATE ALGORITHM=UNDEFINED DEFINER=`developer`@`localhost` SQL SECURITY DEFINER VIEW `sort_by_year_of_production`  AS SELECT `car`.`car_id` AS `ID`, `model`.`model_name` AS `Model`, `brand`.`model_name` AS `Brend`, `car`.`price` AS `Price`, `model`.`year` AS `Year` FROM ((`car` join `model` on(`car`.`model_id` = `model`.`model_id`)) left join `brand` on(`model`.`brand_id` = `brand`.`brand_id`)) GROUP BY `car`.`car_id` ORDER BY `model`.`year` DESC ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `brand`
--
ALTER TABLE `brand`
  ADD PRIMARY KEY (`brand_id`);

--
-- Indexes for table `car`
--
ALTER TABLE `car`
  ADD PRIMARY KEY (`car_id`),
  ADD KEY `model_id` (`model_id`);

--
-- Indexes for table `fuel`
--
ALTER TABLE `fuel`
  ADD PRIMARY KEY (`fuel_id`);

--
-- Indexes for table `model`
--
ALTER TABLE `model`
  ADD PRIMARY KEY (`model_id`),
  ADD KEY `brand_id` (`brand_id`),
  ADD KEY `fuel_id` (`fuel_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `brand`
--
ALTER TABLE `brand`
  MODIFY `brand_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `car`
--
ALTER TABLE `car`
  MODIFY `car_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `fuel`
--
ALTER TABLE `fuel`
  MODIFY `fuel_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `model`
--
ALTER TABLE `model`
  MODIFY `model_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `model`
--
ALTER TABLE `model`
  ADD CONSTRAINT `model_ibfk_1` FOREIGN KEY (`brand_id`) REFERENCES `brand` (`brand_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `model_ibfk_2` FOREIGN KEY (`model_id`) REFERENCES `car` (`model_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `model_ibfk_3` FOREIGN KEY (`fuel_id`) REFERENCES `fuel` (`fuel_id`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
