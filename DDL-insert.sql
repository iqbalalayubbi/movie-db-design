-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jul 27, 2024 at 05:47 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `movie_bsa`
--

-- --------------------------------------------------------

--
-- Table structure for table `actor_movie`
--

CREATE TABLE `actor_movie` (
  `id` int(11) NOT NULL,
  `movie_id` int(11) DEFAULT NULL,
  `person_id` int(11) DEFAULT NULL,
  `character_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
-- --------------------------------------------------------

--
-- Table structure for table `character_movie`
--

CREATE TABLE `character_movie` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `role` enum('leading','supporting','background') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `country`
--

CREATE TABLE `country` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `favorite_movie`
--

CREATE TABLE `favorite_movie` (
  `id` int(11) NOT NULL,
  `movie_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `file`
--

CREATE TABLE `file` (
  `id` int(11) NOT NULL,
  `filename` varchar(255) NOT NULL,
  `mime_type` varchar(100) NOT NULL,
  `key_file` varchar(100) NOT NULL,
  `url` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `genre`
--

CREATE TABLE `genre` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `movie`
--

CREATE TABLE `movie` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `budget` int(11) DEFAULT NULL,
  `release_date` date DEFAULT NULL,
  `duration` int(11) DEFAULT NULL,
  `director_id` int(11) DEFAULT NULL,
  `country_id` int(11) DEFAULT NULL,
  `poster_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Table structure for table `movie_genre`
--

CREATE TABLE `movie_genre` (
  `id` int(11) NOT NULL,
  `genre_id` int(11) DEFAULT NULL,
  `movie_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `person`
--

CREATE TABLE `person` (
  `id` int(11) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) DEFAULT NULL,
  `biography` text DEFAULT NULL,
  `date_of_birth` date NOT NULL,
  `gender` enum('female','male') NOT NULL,
  `country_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `person_image`
--

CREATE TABLE `person_image` (
  `id` int(11) NOT NULL,
  `person_id` int(11) DEFAULT NULL,
  `image_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `avatar_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `actor_movie`
--
ALTER TABLE `actor_movie`
  ADD PRIMARY KEY (`id`),
  ADD KEY `movie_id` (`movie_id`),
  ADD KEY `person_id` (`person_id`),
  ADD KEY `character_id` (`character_id`);

--
-- Indexes for table `character_movie`
--
ALTER TABLE `character_movie`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `country`
--
ALTER TABLE `country`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `favorite_movie`
--
ALTER TABLE `favorite_movie`
  ADD PRIMARY KEY (`id`),
  ADD KEY `movie_id` (`movie_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `file`
--
ALTER TABLE `file`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `genre`
--
ALTER TABLE `genre`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `movie`
--
ALTER TABLE `movie`
  ADD PRIMARY KEY (`id`),
  ADD KEY `director_id` (`director_id`),
  ADD KEY `country_id` (`country_id`),
  ADD KEY `poster_id` (`poster_id`);

--
-- Indexes for table `movie_genre`
--
ALTER TABLE `movie_genre`
  ADD PRIMARY KEY (`id`),
  ADD KEY `genre_id` (`genre_id`),
  ADD KEY `movie_id` (`movie_id`);

--
-- Indexes for table `person`
--
ALTER TABLE `person`
  ADD PRIMARY KEY (`id`),
  ADD KEY `country_id` (`country_id`);

--
-- Indexes for table `person_image`
--
ALTER TABLE `person_image`
  ADD PRIMARY KEY (`id`),
  ADD KEY `person_id` (`person_id`),
  ADD KEY `image_id` (`image_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `avatar_id` (`avatar_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `actor_movie`
--
ALTER TABLE `actor_movie`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `character_movie`
--
ALTER TABLE `character_movie`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `country`
--
ALTER TABLE `country`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `favorite_movie`
--
ALTER TABLE `favorite_movie`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `file`
--
ALTER TABLE `file`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `genre`
--
ALTER TABLE `genre`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `movie`
--
ALTER TABLE `movie`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `movie_genre`
--
ALTER TABLE `movie_genre`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `person`
--
ALTER TABLE `person`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `person_image`
--
ALTER TABLE `person_image`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `actor_movie`
--
ALTER TABLE `actor_movie`
  ADD CONSTRAINT `actor_movie_ibfk_1` FOREIGN KEY (`movie_id`) REFERENCES `movie` (`id`),
  ADD CONSTRAINT `actor_movie_ibfk_2` FOREIGN KEY (`person_id`) REFERENCES `person` (`id`),
  ADD CONSTRAINT `actor_movie_ibfk_3` FOREIGN KEY (`character_id`) REFERENCES `character_movie` (`id`);

--
-- Constraints for table `favorite_movie`
--
ALTER TABLE `favorite_movie`
  ADD CONSTRAINT `favorite_movie_ibfk_1` FOREIGN KEY (`movie_id`) REFERENCES `movie` (`id`),
  ADD CONSTRAINT `favorite_movie_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `movie`
--
ALTER TABLE `movie`
  ADD CONSTRAINT `movie_ibfk_1` FOREIGN KEY (`director_id`) REFERENCES `person` (`id`),
  ADD CONSTRAINT `movie_ibfk_2` FOREIGN KEY (`country_id`) REFERENCES `country` (`id`),
  ADD CONSTRAINT `movie_ibfk_3` FOREIGN KEY (`poster_id`) REFERENCES `file` (`id`);

--
-- Constraints for table `movie_genre`
--
ALTER TABLE `movie_genre`
  ADD CONSTRAINT `movie_genre_ibfk_1` FOREIGN KEY (`genre_id`) REFERENCES `genre` (`id`),
  ADD CONSTRAINT `movie_genre_ibfk_2` FOREIGN KEY (`movie_id`) REFERENCES `movie` (`id`);

--
-- Constraints for table `person`
--
ALTER TABLE `person`
  ADD CONSTRAINT `person_ibfk_1` FOREIGN KEY (`country_id`) REFERENCES `country` (`id`);

--
-- Constraints for table `person_image`
--
ALTER TABLE `person_image`
  ADD CONSTRAINT `person_image_ibfk_1` FOREIGN KEY (`person_id`) REFERENCES `person` (`id`),
  ADD CONSTRAINT `person_image_ibfk_2` FOREIGN KEY (`image_id`) REFERENCES `file` (`id`);

--
-- Constraints for table `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `user_ibfk_1` FOREIGN KEY (`avatar_id`) REFERENCES `file` (`id`);
COMMIT;

-- DML (data definition language)

-- Data Tabel `country`
INSERT INTO `country` (`id`, `name`) VALUES
(1, 'USA'),
(2, 'UK'),
(3, 'Canada');

-- Data Tabel `genre`
INSERT INTO `genre` (`id`, `name`) VALUES
(1, 'Science Fiction'),
(2, 'Action'),
(3, 'Adventure'),
(4, 'Drama'),
(5, 'Thriller');

-- Data Tabel `file`
INSERT INTO `file` (`id`, `filename`, `mime_type`, `key_file`, `url`) VALUES
(1, 'dune_poster.jpg', 'image/jpeg', 'dune_poster', 'https://example.com/dune_poster.jpg'),
(2, 'spider_man_poster.jpg', 'image/jpeg', 'spider_man_poster', 'https://example.com/spider_man_poster.jpg'),
(3, 'batman_poster.jpg', 'image/jpeg', 'batman_poster', 'https://example.com/batman_poster.jpg'),
(4, 'top_gun_poster.jpg', 'image/jpeg', 'top_gun_poster', 'https://example.com/top_gun_poster.jpg'),
(5, 'avatar_poster.jpg', 'image/jpeg', 'avatar_poster', 'https://example.com/avatar_poster.jpg'),
(6, 'alice_avatar.jpg', 'image/jpeg', 'alice_avatar', 'https://example.com/alice_avatar.jpg'),
(7, 'bob_avatar.jpg', 'image/jpeg', 'bob_avatar', 'https://example.com/bob_avatar.jpg'),
(8, 'charlie_avatar.jpg', 'image/jpeg', 'charlie_avatar', 'https://example.com/charlie_avatar.jpg'),
(9, 'diana_avatar.jpg', 'image/jpeg', 'diana_avatar', 'https://example.com/diana_avatar.jpg'),
(10, 'edward_avatar.jpg', 'image/jpeg', 'edward_avatar', 'https://example.com/edward_avatar.jpg');

-- Data Tabel `person`
INSERT INTO `person` (`id`, `first_name`, `last_name`, `biography`, `date_of_birth`, `gender`, `country_id`) VALUES
(1, 'Denis', 'Villeneuve', 'Denis Villeneuve is a Canadian filmmaker known for his work on films like Arrival and Blade Runner 2049.', '1967-10-03', 'male', 1),
(2, 'Jon', 'Watts', 'Jon Watts is an American film director and screenwriter known for his work on Spider-Man films.', '1981-11-28', 'male', 1),
(3, 'Matt', 'Reeves', 'Matt Reeves is an American filmmaker, known for directing Cloverfield, Let Me In, and War for the Planet of the Apes.', '1966-04-27', 'male', 2),
(4, 'Joseph', 'Kosinski', 'Joseph Kosinski is an American director, producer, and screenwriter known for Tron: Legacy and Oblivion.', '1974-05-03', 'male', 2),
(5, 'James', 'Cameron', 'James Cameron is a Canadian filmmaker, known for his work on Titanic, Avatar, and The Terminator.', '1954-08-16', 'male', 3);

-- Data Tabel `movie`
INSERT INTO `movie` (`id`, `title`, `description`, `budget`, `release_date`, `duration`, `director_id`, `country_id`, `poster_id`) VALUES
(1, 'Dune', 'A noble family becomes embroiled in a war for control over the galaxy’s most valuable asset while its heir becomes troubled by visions of a dark future.', 165000000, '2021-09-15', 155, 1, 1, 1),
(2, 'Spider-Man: No Way Home', 'Peter Parker is unmasked and no longer able to separate his normal life from the high-stakes of being a super-hero.', 200000000, '2021-12-17', 148, 2, 1, 2),
(3, 'The Batman', 'When the Riddler emerges as a serial killer targeting Gotham’s elite, Batman is forced to investigate the city\'s hidden corruption and question his family\'s involvement.', 180000000, '2022-03-04', 155, 3, 1, 3),
(4, 'Top Gun: Maverick', 'After more than thirty years of service, Pete "Maverick" Mitchell is still pushing the envelope as a top naval aviator.', 170000000, '2022-05-27', 130, 4, 2, 4),
(5, 'Avatar: The Way of Water', 'Jake Sully and Neytiri have formed a family and are doing everything to stay together. However, they must leave their home and explore the regions of Pandora.', 350000000, '2022-12-16', 192, 5, 3, 5);

-- Data Tabel `character_movie`
INSERT INTO `character_movie` (`id`, `name`, `description`, `role`) VALUES
(1, 'Paul Atreides', 'The protagonist of Dune, heir to House Atreides.', 'leading'),
(2, 'Peter Parker', 'The alter ego of Spider-Man, a high school student with superpowers.', 'leading'),
(3, 'Bruce Wayne / Batman', 'A vigilante crime fighter who operates in Gotham City.', 'leading'),
(4, 'Pete Mitchell / Maverick', 'A naval aviator who is known for his high-flying skills and rebellious nature.', 'leading'),
(5, 'Jake Sully', 'The protagonist of Avatar, a former Marine who becomes a member of the Na\'vi.', 'leading');

-- Data Tabel `actor_movie`
INSERT INTO `actor_movie` (`id`, `movie_id`, `person_id`, `character_id`) VALUES
(1, 1, 1, 1),
(2, 2, 2, 2),
(3, 3, 3, 3),
(4, 2, 3, 3),
(5, 4, 4, 4),
(6, 3, 4, 4),
(7, 5, 5, 5);

-- Data Tabel `movie_genre`
INSERT INTO `movie_genre` (`id`, `genre_id`, `movie_id`) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 1, 3),
(4, 2, 4),
(5, 2, 5),
(6, 4, 5);

-- Data Tabel `person_image`
INSERT INTO `person_image` (`id`, `person_id`, `image_id`) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 3),
(4, 4, 4),
(5, 5, 5);

-- Data Tabel `user`
INSERT INTO `user` (`id`, `username`, `first_name`, `last_name`, `email`, `password`, `avatar_id`) VALUES
(1, 'john_doe', 'John', 'Doe', 'john@example.com', 'hashed_password1', 1),
(2, 'jane_smith', 'Jane', 'Smith', 'jane@example.com', 'hashed_password2', 2),
(3, 'alice_walker', 'Alice', 'Walker', 'alice.walker@example.com', 'hashed_password3', 6),
(4, 'bob_johnson', 'Bob', 'Johnson', 'bob.johnson@example.com', 'hashed_password4', 7),
(5, 'charlie_brown', 'Charlie', 'Brown', 'charlie.brown@example.com', 'hashed_password5', 8),
(6, 'diana_prince', 'Diana', 'Prince', 'diana.prince@example.com', 'hashed_password6', 9),
(7, 'edward_snow', 'Edward', 'Snow', 'edward.snow@example.com', 'hashed_password7', 10);

-- Data Tabel `favorite_movie`
INSERT INTO `favorite_movie` (`id`, `movie_id`, `user_id`) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 3),
(4, 4, 4),
(5, 5, 5),
(6, 1, 6),
(7, 2, 7),
(8, 5, 4);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;