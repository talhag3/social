-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Apr 15, 2022 at 09:35 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 7.4.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tweety`
--

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `commentID` int(11) NOT NULL,
  `comment` varchar(140) NOT NULL,
  `commentOn` int(11) NOT NULL,
  `commentBy` int(11) NOT NULL,
  `commentAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`commentID`, `comment`, `commentOn`, `commentBy`, `commentAt`) VALUES
(2, 'HElL', 2, 3, '2022-04-13 19:49:20');

-- --------------------------------------------------------

--
-- Table structure for table `follow`
--

CREATE TABLE `follow` (
  `followID` int(11) NOT NULL,
  `sender` int(11) NOT NULL,
  `receiver` int(11) NOT NULL,
  `followOn` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `follow`
--

INSERT INTO `follow` (`followID`, `sender`, `receiver`, `followOn`) VALUES
(2, 3, 2, '2022-04-14 21:18:31'),
(3, 4, 2, '2022-04-14 21:18:42');

-- --------------------------------------------------------

--
-- Table structure for table `likes`
--

CREATE TABLE `likes` (
  `likeID` int(11) NOT NULL,
  `likeBy` int(11) NOT NULL,
  `likeOn` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `likes`
--

INSERT INTO `likes` (`likeID`, `likeBy`, `likeOn`) VALUES
(2, 2, 2),
(3, 2, 3),
(5, 2, 1),
(6, 2, 4),
(7, 3, 5);

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `messageID` int(11) NOT NULL,
  `message` text NOT NULL,
  `messageTo` int(11) NOT NULL,
  `messageFrom` int(11) NOT NULL,
  `messageOn` datetime NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `messages`
--

INSERT INTO `messages` (`messageID`, `message`, `messageTo`, `messageFrom`, `messageOn`, `status`) VALUES
(1, 'hi', 3, 2, '2022-04-15 12:23:22', 0),
(2, 'hhihiih', 3, 2, '2022-04-15 12:56:46', 0);

-- --------------------------------------------------------

--
-- Table structure for table `notification`
--

CREATE TABLE `notification` (
  `ID` int(11) NOT NULL,
  `notificationFor` int(11) NOT NULL,
  `notificationFrom` int(11) NOT NULL,
  `target` int(11) NOT NULL,
  `type` enum('follow','retweet','like','mention') NOT NULL,
  `time` datetime NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `notification`
--

INSERT INTO `notification` (`ID`, `notificationFor`, `notificationFrom`, `target`, `type`, `time`, `status`) VALUES
(1, 2, 3, 1, 'like', '2022-04-15 19:31:52', 1),
(2, 2, 4, 1, 'like', '2022-04-15 20:58:38', 1),
(3, 2, 5, 1, 'retweet', '2022-04-15 20:58:52', 1);

-- --------------------------------------------------------

--
-- Table structure for table `trends`
--

CREATE TABLE `trends` (
  `trendID` int(11) NOT NULL,
  `hashtag` varchar(140) NOT NULL,
  `createdOn` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `trends`
--

INSERT INTO `trends` (`trendID`, `hashtag`, `createdOn`) VALUES
(1, 'php', '2022-04-11 18:46:15'),
(2, 'demo', '2022-04-11 18:46:47'),
(3, 'pakistan', '2022-04-11 18:46:59'),
(4, 'hashtag', '2022-04-12 19:41:11'),
(13, 'new', '2022-04-14 00:46:56'),
(25, 'laptop', '2022-04-15 19:56:54');

-- --------------------------------------------------------

--
-- Table structure for table `tweets`
--

CREATE TABLE `tweets` (
  `tweetID` int(11) NOT NULL,
  `status` varchar(140) NOT NULL,
  `tweetBy` int(11) NOT NULL,
  `retweetID` int(11) NOT NULL,
  `retweetBy` int(11) NOT NULL,
  `tweetImage` varchar(255) NOT NULL,
  `likesCount` int(11) NOT NULL,
  `retweetCount` int(11) NOT NULL,
  `postedOn` datetime NOT NULL,
  `retweetMsg` varchar(140) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tweets`
--

INSERT INTO `tweets` (`tweetID`, `status`, `tweetBy`, `retweetID`, `retweetBy`, `tweetImage`, `likesCount`, `retweetCount`, `postedOn`, `retweetMsg`) VALUES
(4, 'Hello my name is laptop', 2, 1, 3, '', 1, 0, '2022-04-13 16:00:09', ''),
(5, 'hehehehhehhehehh', 2, 2, 4, '', 1, 0, '2022-04-13 21:48:41', 'THis is retweet MSg thx'),
(6, 'test status', 2, 2, 5, '', 0, 0, '2022-04-13 21:48:41', 'test retweet'),
(7, 'The definition of a tweet is a status update consisting of 140 characters or less on Twitter. ', 3, 3, 2, '', 0, 12, '2022-04-14 10:24:14', '');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `username` varchar(40) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(32) NOT NULL,
  `screenName` varchar(40) NOT NULL,
  `profileImage` varchar(255) NOT NULL,
  `profileCover` varchar(255) NOT NULL,
  `following` int(11) DEFAULT NULL,
  `followers` int(11) DEFAULT NULL,
  `bio` varchar(140) NOT NULL,
  `country` varchar(255) NOT NULL,
  `website` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `username`, `email`, `password`, `screenName`, `profileImage`, `profileCover`, `following`, `followers`, `bio`, `country`, `website`) VALUES
(2, 'hanzala', 'hanz@hanz.com', 'hanzala', 'Hanzala', 'users/277216340_711332363234756_4747308053788031699_n.jpg', 'users/pexels-lucie-liz-3165335.jpg', 46, 14, 'This is demo bio test uploading', 'Pakistan', 'Pakistan'),
(3, 'demo', 'demo@hanz.com', 'hanzala', 'demoaccount', 'assets/images/defaultProfileImage.png', 'assets/images/defaultCoverImage.png', 19, 44, 'This is demo account', 'pakistan', 'https://www.youtube.com/watch?v=dQw4w9WgXcQ'),
(4, 'theusername', 'username@test.com', 'hanzala', 'theusername', 'assets/images/defaultProfileImage.png', 'assets/images/defaultCoverImage.png', 0, 5, 'This is testing account that i am adding using SQL database.', 'Pakistan.', 'Pakistan.'),
(5, 'asus', 'asus@hanz.com', 'hanzala', 'Asus_laptop', 'assets/images/defaultProfileImage.png', 'assets/images/defaultCoverImage.png', 1, 3, 'Hello my name is ASUS', 'Pakistan', 'https://www.youtube.com/watch?v=dQw4w9WgXcQ');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`commentID`);

--
-- Indexes for table `follow`
--
ALTER TABLE `follow`
  ADD PRIMARY KEY (`followID`);

--
-- Indexes for table `likes`
--
ALTER TABLE `likes`
  ADD PRIMARY KEY (`likeID`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`messageID`);

--
-- Indexes for table `notification`
--
ALTER TABLE `notification`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `trends`
--
ALTER TABLE `trends`
  ADD PRIMARY KEY (`trendID`),
  ADD UNIQUE KEY `hashtag` (`hashtag`);

--
-- Indexes for table `tweets`
--
ALTER TABLE `tweets`
  ADD PRIMARY KEY (`tweetID`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `commentID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `follow`
--
ALTER TABLE `follow`
  MODIFY `followID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `likes`
--
ALTER TABLE `likes`
  MODIFY `likeID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `messageID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `notification`
--
ALTER TABLE `notification`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `trends`
--
ALTER TABLE `trends`
  MODIFY `trendID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `tweets`
--
ALTER TABLE `tweets`
  MODIFY `tweetID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
