-- phpMyAdmin SQL Dump
-- version 5.0.4deb2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Dec 10, 2021 at 12:46 PM
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
-- Database: `movie_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `comments_id` int(10) NOT NULL,
  `created` timestamp NULL DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `user_id` int(10) NOT NULL,
  `movie_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`comments_id`, `created`, `comment`, `user_id`, `movie_id`) VALUES
(1, '2021-03-14 19:48:18', 'Excellent ...', 4, 9),
(2, '2021-03-14 19:51:11', 'Worth a look.', 2, 2),
(3, '2021-03-29 21:14:01', 'Don\'t miss it !!!!', 5, 5),
(4, '2021-03-29 22:44:46', 'One of the better classics ...', 2, 7),
(5, '2021-03-30 07:18:22', 'For every recommendation.', 4, 4),
(6, '2021-03-30 11:47:44', 'I love this cartoon !!!', 1, 8);

-- --------------------------------------------------------

--
-- Table structure for table `description`
--

CREATE TABLE `description` (
  `description_id` int(10) NOT NULL,
  `text` text NOT NULL,
  `image` blob DEFAULT NULL,
  `movie_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `description`
--

INSERT INTO `description` (`description_id`, `text`, `image`, `movie_id`) VALUES
(1, 'A cowboy doll is profoundly threatened and jealous when a new spaceman figure supplants him as top toy in a boy\'s room.', '', 10),
(2, 'A young man and woman meet on a train in Europe, and wind up spending one evening together in Vienna. Unfortunately, both know that this will probably be their only night together.', '', 9),
(3, 'Fifty-seven years after surviving an apocalyptic attack aboard her space vessel by merciless space creatures, Officer Ripley awakens from hyper-sleep and tries to warn anyone who will listen about the predators.', '', 8),
(4, 'An angel is sent from Heaven to help a desperately frustrated businessman by showing him what life would have been like if he had never existed.', '', 7),
(5, 'When the menace known as the Joker wreaks havoc and chaos on the people of Gotham, Batman must accept one of the greatest psychological and physical tests of his ability to fight injustice.', '', 6),
(6, 'A thief who steals corporate secrets through the use of dream-sharing technology is given the inverse task of planting an idea into the mind of a C.E.O., but his tragic past may doom the project and his team to disaster.', '', 5),
(7, 'The lives of two mob hitmen, a boxer, a gangster and his wife, and a pair of diner bandits intertwine in four tales of violence and redemption.', '', 1),
(8, 'When a beautiful stranger leads computer hacker Neo to a forbidding underworld, he discovers the shocking truth--the life he knows is the elaborate deception of an evil cyber-intelligence.', '', 3),
(9, 'The Godfather follows Vito Corleone, Don of the Corleone family, as he passes the mantel to his unwilling son, Michael.', '', 2),
(10, 'In Gotham City, mentally troubled comedian Arthur Fleck is disregarded and mistreated by society. He then embarks on a downward spiral of revolution and bloody crime. This path brings him face-to-face with his alter-ego: the Joker.', '', 4);

-- --------------------------------------------------------

--
-- Table structure for table `movie`
--

CREATE TABLE `movie` (
  `movie_id` int(10) NOT NULL,
  `nameMovie` varchar(255) DEFAULT NULL,
  `year` int(11) DEFAULT NULL,
  `rating` float DEFAULT NULL,
  `genre` varchar(100) DEFAULT NULL,
  `stars` varchar(255) DEFAULT NULL,
  `director` varchar(255) DEFAULT NULL,
  `user_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `movie`
--

INSERT INTO `movie` (`movie_id`, `nameMovie`, `year`, `rating`, `genre`, `stars`, `director`, `user_id`) VALUES
(1, 'Pulp Fiction', 1994, 8.9, 'Crime, Drama', 'Jhon Travolta, Uma Thurman', 'Quentin Tarantino', 5),
(2, 'The Godfather', 1972, 9.2, 'Action, Crime, Drama', 'Marlon Brando, Al Pacino', 'Francis Ford Coppola', 2),
(3, 'The Matrix', 1999, 8.7, 'Action, Sci-Fi', 'Keanu Reeves', 'Lana Wachowski', 3),
(4, 'Joker', 2019, 8.4, 'Drama', 'Joaquin Phoenix, Robert De Niro', 'Todd Philips', 2),
(5, 'Inception', 2010, 8.8, 'Action, Crime', 'Leonardo DiCaprio', 'Christopher Nolan', 1),
(6, 'The Dark Knight', 2008, 9, 'Action', 'Christian Bale, Heath Ledger', 'Christopher Nolan', 4),
(7, 'It\'s a Wonderful Life', 1946, 8.6, 'Fantsy', 'James Steward, Donna Reed', 'Frank Capra', 3),
(8, 'Aliens', 1986, 8.3, 'Action, Adventure, Sci-Fi', 'Sigourney Weaver, Michael Biehn', 'James Cameron', 5),
(9, 'Before Sunrise', 1995, 8.1, 'Romance', 'Ethan Hawke, Julie Delpy', 'Richard Linklater', 3),
(10, 'Toy Story', 1995, 8.3, 'Animation, Comedy, Fantasy', 'Tom Hanks, Tim Allen', 'John Lasseter', 5);

-- --------------------------------------------------------

--
-- Stand-in structure for view `movie_and_description`
-- (See below for the actual view)
--
CREATE TABLE `movie_and_description` (
`nameMovie` varchar(255)
,`year` int(11)
,`rating` float
,`genre` varchar(100)
,`stars` varchar(255)
,`text` text
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `movie_comments`
-- (See below for the actual view)
--
CREATE TABLE `movie_comments` (
`Movies` varchar(255)
,`Comments` text
,`Usernames` varchar(45)
);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `user_id` int(10) NOT NULL,
  `created` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `name` varchar(45) NOT NULL,
  `surname` varchar(45) NOT NULL,
  `username` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_id`, `created`, `name`, `surname`, `username`, `password`) VALUES
(1, '2021-05-29 18:41:33', 'Samanta', 'New York', 'samanta', 'admin'),
(2, '2021-12-07 04:41:33', 'Tina', 'Bristol', 'tina', 'hello'),
(3, '2021-11-20 12:41:33', 'Leo', 'Paris', 'leo', 'test'),
(4, '2021-10-10 17:41:33', 'Erik', 'Boston', 'erik', '1234'),
(5, '2021-06-21 20:41:33', 'Tom', 'London', 'tom', '5678');

-- --------------------------------------------------------

--
-- Structure for view `movie_and_description`
--
DROP TABLE IF EXISTS `movie_and_description`;

CREATE ALGORITHM=UNDEFINED DEFINER=`developer`@`localhost` SQL SECURITY DEFINER VIEW `movie_and_description`  AS SELECT `movie`.`nameMovie` AS `nameMovie`, `movie`.`year` AS `year`, `movie`.`rating` AS `rating`, `movie`.`genre` AS `genre`, `movie`.`stars` AS `stars`, `description`.`text` AS `text` FROM (`movie` join `description`) WHERE `movie`.`movie_id` = `description`.`movie_id` ORDER BY `movie`.`movie_id` ASC ;

-- --------------------------------------------------------

--
-- Structure for view `movie_comments`
--
DROP TABLE IF EXISTS `movie_comments`;

CREATE ALGORITHM=UNDEFINED DEFINER=`developer`@`localhost` SQL SECURITY DEFINER VIEW `movie_comments`  AS SELECT `movie`.`nameMovie` AS `Movies`, `comments`.`comment` AS `Comments`, `user`.`username` AS `Usernames` FROM ((`movie` join `comments`) join `user`) WHERE `movie`.`movie_id` = `comments`.`movie_id` AND `comments`.`user_id` = `user`.`user_id` ORDER BY `user`.`username` ASC ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`comments_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `movie_id` (`movie_id`);

--
-- Indexes for table `description`
--
ALTER TABLE `description`
  ADD PRIMARY KEY (`description_id`),
  ADD UNIQUE KEY `movie_id` (`movie_id`);

--
-- Indexes for table `movie`
--
ALTER TABLE `movie`
  ADD PRIMARY KEY (`movie_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`movie_id`) REFERENCES `movie` (`movie_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `comments_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE;

--
-- Constraints for table `description`
--
ALTER TABLE `description`
  ADD CONSTRAINT `description_ibfk_1` FOREIGN KEY (`movie_id`) REFERENCES `movie` (`movie_id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
