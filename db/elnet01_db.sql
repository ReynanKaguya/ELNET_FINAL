-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 20, 2025 at 04:31 PM
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
-- Database: `elnet01_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `bookings`
--

CREATE TABLE `bookings` (
  `Id` int(11) NOT NULL,
  `CheckinDate` datetime(6) NOT NULL,
  `CheckoutDate` datetime(6) NOT NULL,
  `RoomType` longtext NOT NULL,
  `Guests` int(11) NOT NULL,
  `UserId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `bookings`
--

INSERT INTO `bookings` (`Id`, `CheckinDate`, `CheckoutDate`, `RoomType`, `Guests`, `UserId`) VALUES
(1, '2025-03-21 00:00:00.000000', '2025-03-23 00:00:00.000000', 'deluxe', 2, 1),
(2, '2025-03-23 00:00:00.000000', '2025-03-26 00:00:00.000000', 'suite', 2, 1),
(3, '2025-03-25 00:00:00.000000', '2025-03-26 00:00:00.000000', 'suite', 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `Id` int(11) NOT NULL,
  `Name` longtext NOT NULL,
  `Email` longtext NOT NULL,
  `Message` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `contacts`
--

INSERT INTO `contacts` (`Id`, `Name`, `Email`, `Message`) VALUES
(1, 'Reynan', 'cudilloreynan.crest@gmail.com', 'Hi hehe');

-- --------------------------------------------------------

--
-- Table structure for table `hotels`
--

CREATE TABLE `hotels` (
  `Id` int(11) NOT NULL,
  `Name` varchar(255) NOT NULL,
  `Location` varchar(255) NOT NULL,
  `Description` longtext DEFAULT NULL,
  `PricePerNight` decimal(65,30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `hotels`
--

INSERT INTO `hotels` (`Id`, `Name`, `Location`, `Description`, `PricePerNight`) VALUES
(1, 'Sheraton Cebu Mactan Resort', 'Cebu', 'A luxury beachfront hotel.', 10000.000000000000000000000000000000),
(2, 'Shangri-La Mactan', 'Cebu', 'A world-class resort with amazing views.', 12000.000000000000000000000000000000),
(3, 'Solea Mactan Resort', 'Cebu', 'Perfect for a family getaway.', 5000.000000000000000000000000000000);

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `Id` int(11) NOT NULL,
  `HotelId` int(11) NOT NULL,
  `UserId` int(11) NOT NULL,
  `Rating` int(11) NOT NULL,
  `ReviewText` varchar(500) NOT NULL,
  `CreatedAt` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `reviews`
--

INSERT INTO `reviews` (`Id`, `HotelId`, `UserId`, `Rating`, `ReviewText`, `CreatedAt`) VALUES
(3, 2, 2, 5, '123123', '2025-03-20 23:02:04.247435'),
(4, 3, 2, 4, 'HAHAHAH LMAO.', '2025-03-20 23:02:44.819594'),
(5, 2, 2, 2, 'waow', '2025-03-20 23:12:01.288309');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `Id` int(11) NOT NULL,
  `Username` longtext NOT NULL,
  `Email` longtext NOT NULL,
  `Password` longtext NOT NULL,
  `Country` longtext DEFAULT NULL,
  `FullName` longtext DEFAULT NULL,
  `PhoneNumber` longtext DEFAULT NULL,
  `ProfilePicture` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`Id`, `Username`, `Email`, `Password`, `Country`, `FullName`, `PhoneNumber`, `ProfilePicture`) VALUES
(1, 'rey@gmail.com', 'reynan@gmail.com', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', '', '', '', ''),
(2, 'yefeng@gmail.com', 'yefeng@gmail.com', '96cae35ce8a9b0244178bf28e4966c2ce1b8385723a96a6b838858cdd6ca0a1e', 'Philippines', 'Reynan', '12345678910', '/images/profile/3515d218-46ea-401d-968b-2bbbac5f7af4.jpg'),
(3, 'ronel@gmail.com', 'ronel@gmail.com', '96cae35ce8a9b0244178bf28e4966c2ce1b8385723a96a6b838858cdd6ca0a1e', 'Philippines', NULL, NULL, NULL),
(4, 'reynan@gmail.com', 'reynan@gmail.com', '96cae35ce8a9b0244178bf28e4966c2ce1b8385723a96a6b838858cdd6ca0a1e', 'Philippines', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `__efmigrationshistory`
--

CREATE TABLE `__efmigrationshistory` (
  `MigrationId` varchar(150) NOT NULL,
  `ProductVersion` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `__efmigrationshistory`
--

INSERT INTO `__efmigrationshistory` (`MigrationId`, `ProductVersion`) VALUES
('20250309083851_InitMySQL', '8.0.13'),
('20250309093720_AddContactTable', '8.0.13'),
('20250314123112_InitialCreate', '8.0.13'),
('20250314124836_AddContactsTable', '8.0.13'),
('20250314140841_AddProfileFieldsToUsers', '8.0.13'),
('20250314142056_UpdateUserProfile', '8.0.13'),
('20250314143224_AddUserProfileFields', '8.0.13'),
('20250314144136_EnsureUserProfileFields', '8.0.13'),
('20250314151734_AddProfileFields', '8.0.13'),
('20250320124102_addBookingsTable', '8.0.13'),
('20250320134142_CreateUsersTable', '8.0.13'),
('20250320141333_CreateHotelsTable', '8.0.13'),
('20250320141400_CreateReviewsTable', '8.0.13'),
('20250320141958_RecreateHotelsTable', '8.0.13'),
('20250320142233_rereCreateHotelsTable', '8.0.13'),
('20250320142252_rereCreateReviewsTable', '8.0.13');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bookings`
--
ALTER TABLE `bookings`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `hotels`
--
ALTER TABLE `hotels`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `IX_Reviews_HotelId` (`HotelId`),
  ADD KEY `IX_Reviews_UserId` (`UserId`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `__efmigrationshistory`
--
ALTER TABLE `__efmigrationshistory`
  ADD PRIMARY KEY (`MigrationId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bookings`
--
ALTER TABLE `bookings`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `hotels`
--
ALTER TABLE `hotels`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `reviews`
--
ALTER TABLE `reviews`
  ADD CONSTRAINT `FK_Reviews_Hotels_HotelId` FOREIGN KEY (`HotelId`) REFERENCES `hotels` (`Id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_Reviews_Users_UserId` FOREIGN KEY (`UserId`) REFERENCES `users` (`Id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
