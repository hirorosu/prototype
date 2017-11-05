-- phpMyAdmin SQL Dump
-- version 4.2.11
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: 2017 年 11 月 05 日 15:45
-- サーバのバージョン： 5.6.21
-- PHP Version: 5.6.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `hirorosu`
--

-- --------------------------------------------------------

--
-- テーブルの構造 `users_table`
--

CREATE TABLE IF NOT EXISTS `users_table` (
`id` int(11) NOT NULL,
  `uName` varchar(11) COLLATE utf8mb4_unicode_ci NOT NULL,
  `uPassword` varchar(11) COLLATE utf8mb4_unicode_ci NOT NULL,
  `uPasswordCheck` varchar(11) COLLATE utf8mb4_unicode_ci NOT NULL,
  `uGrade` varchar(11) COLLATE utf8mb4_unicode_ci NOT NULL,
  `uSchool` varchar(11) COLLATE utf8mb4_unicode_ci NOT NULL,
  `indate` datetime NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- テーブルのデータのダンプ `users_table`
--

INSERT INTO `users_table` (`id`, `uName`, `uPassword`, `uPasswordCheck`, `uGrade`, `uSchool`, `indate`) VALUES
(1, 'hiromasa', 'pass', 'pass', '1nen', 'kindai', '2017-11-05 00:23:30'),
(2, 'kosegawa', 'kose', 'kose', '1nen', 'kindai', '2017-11-05 00:25:50'),
(3, 'kosehiro', 'papa', 'papa', '1nen', 'sendai', '2017-11-05 00:49:07'),
(4, 'hiroman', 'hiro', 'hiro', '1nen', 'kindai', '2017-11-05 17:40:40'),
(5, 'kkk', 'kkk', 'kkk', '1nen', 'kindai', '2017-11-05 20:28:49'),
(6, 'ttt', 'tttt', 'tttt', '1nen', 'kindai', '2017-11-05 20:33:46'),
(7, 'hiromasa', 'pass2', 'pass2', '2nen', 'kindai', '2017-11-05 22:34:22');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `users_table`
--
ALTER TABLE `users_table`
 ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `users_table`
--
ALTER TABLE `users_table`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
