-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 28, 2020 at 08:33 PM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.4.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";
FLUSH PRIVILEGES;

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `techband`
--

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8_bin NOT NULL,
  `perex` text COLLATE utf8_bin NOT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `visible` bit(1) NOT NULL DEFAULT b'1',
  `reviews` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `title`, `perex`, `created_at`, `visible`, `reviews`) VALUES
(1, 'Testovací článok', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean accumsan leo eu risus molestie mollis. Vivamus tortor risus, interdum eget nunc in, ornare tempor ligula. Sed vel eleifend turpis. Cras mollis magna lorem, ac venenatis sapien congue vitae. Curabitur at odio dapibus, ultrices lorem in, mollis enim. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Pellentesque consectetur, sapien vel vulputate fermentum, justo libero rhoncus mi, ac scelerisque nunc sem a elit. Praesent eget eros sit amet sem ornare dignissim. Quisque nisi lectus, accumsan at metus a, hendrerit dignissim mi. Suspendisse lobortis, lorem eget dignissim convallis, tortor magna tempor mauris, in malesuada purus purus non purus. Nam ut ipsum cursus, mollis nulla in, auctor dolor. Nullam pharetra metus felis, at volutpat ex sodales vel. Suspendisse venenatis bibendum laoreet. Integer quis sem tristique, viverra justo eget, tempor est. Sed vestibulum dui vel metus vulputate, vitae fringilla ex pellentesque.', '2020-11-23 16:59:07', b'1', 0),
(2, 'Aleluja', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. In placerat facilisis tortor, at vulputate diam sollicitudin eget. Interdum et malesuada fames ac ante ipsum primis in faucibus. Sed vehicula finibus fermentum. Aenean vel turpis vitae elit eleifend dignissim in eu diam. Suspendisse potenti. Cras at scelerisque ex. Suspendisse ac mauris sagittis, dapibus erat nec, volutpat nisl.', '2020-11-25 17:20:13', b'1', 0),
(3, 'Beta', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. In placerat facilisis tortor, at vulputate diam sollicitudin eget. Interdum et malesuada fames ac ante ipsum primis in faucibus. Sed vehicula finibus fermentum. Aenean vel turpis vitae elit eleifend dignissim in eu diam. Suspendisse potenti. Cras at scelerisque ex. Suspendisse ac mauris sagittis, dapibus erat nec, volutpat nisl.', '2020-11-11 17:20:13', b'1', 2),
(4, 'Delta', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. In placerat facilisis tortor, at vulputate diam sollicitudin eget. Interdum et malesuada fames ac ante ipsum primis in faucibus. Sed vehicula finibus fermentum. Aenean vel turpis vitae elit eleifend dignissim in eu diam. Suspendisse potenti. Cras at scelerisque ex. Suspendisse ac mauris sagittis, dapibus erat nec, volutpat nisl.', '2020-11-10 17:20:31', b'1', 0),
(5, 'Žirafa\r\n', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. In placerat facilisis tortor, at vulputate diam sollicitudin eget. Interdum et malesuada fames ac ante ipsum primis in faucibus. Sed vehicula finibus fermentum. Aenean vel turpis vitae elit eleifend dignissim in eu diam. Suspendisse potenti. Cras at scelerisque ex. Suspendisse ac mauris sagittis, dapibus erat nec, volutpat nisl.', '2020-11-17 20:28:18', b'1', 0),
(6, 'Tralala\r\n', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. In placerat facilisis tortor, at vulputate diam sollicitudin eget. Interdum et malesuada fames ac ante ipsum primis in faucibus. Sed vehicula finibus fermentum. Aenean vel turpis vitae elit eleifend dignissim in eu diam. Suspendisse potenti. Cras at scelerisque ex. Suspendisse ac mauris sagittis, dapibus erat nec, volutpat nisl.', '2020-11-23 17:20:31', b'1', 1),
(7, 'Nanana\r\n', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. In placerat facilisis tortor, at vulputate diam sollicitudin eget. Interdum et malesuada fames ac ante ipsum primis in faucibus. Sed vehicula finibus fermentum. Aenean vel turpis vitae elit eleifend dignissim in eu diam. Suspendisse potenti. Cras at scelerisque ex. Suspendisse ac mauris sagittis, dapibus erat nec, volutpat nisl.', '2020-11-23 17:20:31', b'0', 0);

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `id` int(10) UNSIGNED NOT NULL,
  `post_id` int(11) UNSIGNED NOT NULL,
  `user_id` int(11) UNSIGNED NOT NULL,
  `value` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `login` varchar(255) COLLATE utf8_bin NOT NULL,
  `name` varchar(255) COLLATE utf8_bin NOT NULL,
  `password` varchar(255) COLLATE utf8_bin NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `login`, `name`, `password`, `created_at`) VALUES
(2, 'john', 'John Doe', '$2y$10$NfFc67.iHVJxH4Vr71iLaO912.b8J4KzSOHL3Aq5BesnJIvt1.A3u', '2020-11-28 15:54:25');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`),
  ADD KEY `post_review` (`post_id`),
  ADD KEY `user_review` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `reviews`
--
ALTER TABLE `reviews`
  ADD CONSTRAINT `post_review` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `user_review` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
