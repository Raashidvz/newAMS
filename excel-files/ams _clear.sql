-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 02, 2024 at 12:57 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.1.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ams`
--

-- --------------------------------------------------------

--
-- Table structure for table `batches`
--

CREATE TABLE `batches` (
  `BATCH_ID` int(11) NOT NULL,
  `BATCH` varchar(200) NOT NULL,
  `YEARR` int(11) NOT NULL,
  `CLASS` varchar(100) NOT NULL,
  `SEMESTER_1` int(11) NOT NULL DEFAULT 0,
  `SEMESTER_2` int(11) NOT NULL DEFAULT 0,
  `SEMESTER_3` int(11) NOT NULL DEFAULT 0,
  `SEMESTER_4` int(11) NOT NULL DEFAULT 0,
  `SEMESTER_5` int(11) NOT NULL DEFAULT 0,
  `SEMESTER_6` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `classes`
--

CREATE TABLE `classes` (
  `CLASS_ID` int(11) NOT NULL,
  `CLASS_NAME` varchar(100) NOT NULL,
  `SEMESTER` int(11) NOT NULL,
  `SUBJECT_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `notes`
--

CREATE TABLE `notes` (
  `NOTE_ID` int(11) NOT NULL,
  `SUBJECT_ID` int(11) NOT NULL,
  `MODULE` int(11) NOT NULL,
  `MODULE_NAME` varchar(200) NOT NULL,
  `DESCRIPTIONN` varchar(255) NOT NULL,
  `CATEGORY` enum('NOTE','ASSIGNMENT') NOT NULL,
  `FILE_NAME` varchar(255) NOT NULL,
  `UPLOAD_DATE` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `STUDENT_ID` int(11) NOT NULL,
  `USER_ID` int(11) NOT NULL,
  `NAMEE` varchar(100) NOT NULL,
  `CLASS_NAME` varchar(100) NOT NULL,
  `PARENT_CONTACT` varchar(100) NOT NULL,
  `BATCH_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `subjects`
--

CREATE TABLE `subjects` (
  `SUBJECT_ID` int(11) NOT NULL,
  `SUBJECT_NAME` varchar(200) NOT NULL,
  `CLASS_NAME` varchar(200) NOT NULL,
  `SEMESTER` int(11) NOT NULL,
  `TOTAL_MODULES` int(11) NOT NULL,
  `TEACHER_ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `teachers`
--

CREATE TABLE `teachers` (
  `TEACHER_ID` int(11) NOT NULL,
  `USER_ID` int(11) NOT NULL,
  `NAMEE` varchar(100) NOT NULL,
  `DEPARTMENT` varchar(100) NOT NULL,
  `JOINING_DATE` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `USER_ID` int(11) NOT NULL,
  `USER_NAME` varchar(100) NOT NULL,
  `PASSWORDD` varchar(100) NOT NULL,
  `EMAIL` varchar(100) NOT NULL,
  `ROLEE` enum('ADMIN','TEACHERS','STUDENTS') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`USER_ID`, `USER_NAME`, `PASSWORDD`, `EMAIL`, `ROLEE`) VALUES
(1, 'admin', 'admin', 'admin@gmail.com', 'ADMIN');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `batches`
--
ALTER TABLE `batches`
  ADD PRIMARY KEY (`BATCH_ID`);

--
-- Indexes for table `classes`
--
ALTER TABLE `classes`
  ADD PRIMARY KEY (`CLASS_ID`),
  ADD KEY `SUBJECT_ID` (`SUBJECT_ID`);

--
-- Indexes for table `notes`
--
ALTER TABLE `notes`
  ADD PRIMARY KEY (`NOTE_ID`),
  ADD KEY `SUBJECT_ID` (`SUBJECT_ID`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`STUDENT_ID`),
  ADD KEY `USER_ID` (`USER_ID`),
  ADD KEY `BATCH_ID` (`BATCH_ID`);

--
-- Indexes for table `subjects`
--
ALTER TABLE `subjects`
  ADD PRIMARY KEY (`SUBJECT_ID`),
  ADD KEY `TEACHER_ID` (`TEACHER_ID`);

--
-- Indexes for table `teachers`
--
ALTER TABLE `teachers`
  ADD PRIMARY KEY (`TEACHER_ID`),
  ADD KEY `USER_ID` (`USER_ID`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`USER_ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `batches`
--
ALTER TABLE `batches`
  MODIFY `BATCH_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `classes`
--
ALTER TABLE `classes`
  MODIFY `CLASS_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `notes`
--
ALTER TABLE `notes`
  MODIFY `NOTE_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `students`
--
ALTER TABLE `students`
  MODIFY `STUDENT_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `subjects`
--
ALTER TABLE `subjects`
  MODIFY `SUBJECT_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `teachers`
--
ALTER TABLE `teachers`
  MODIFY `TEACHER_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `USER_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `classes`
--
ALTER TABLE `classes`
  ADD CONSTRAINT `classes_ibfk_1` FOREIGN KEY (`SUBJECT_ID`) REFERENCES `subjects` (`SUBJECT_ID`);

--
-- Constraints for table `notes`
--
ALTER TABLE `notes`
  ADD CONSTRAINT `notes_ibfk_1` FOREIGN KEY (`SUBJECT_ID`) REFERENCES `subjects` (`SUBJECT_ID`);

--
-- Constraints for table `students`
--
ALTER TABLE `students`
  ADD CONSTRAINT `students_ibfk_1` FOREIGN KEY (`USER_ID`) REFERENCES `users` (`USER_ID`),
  ADD CONSTRAINT `students_ibfk_2` FOREIGN KEY (`BATCH_ID`) REFERENCES `batches` (`BATCH_ID`);

--
-- Constraints for table `subjects`
--
ALTER TABLE `subjects`
  ADD CONSTRAINT `subjects_ibfk_1` FOREIGN KEY (`TEACHER_ID`) REFERENCES `teachers` (`TEACHER_ID`);

--
-- Constraints for table `teachers`
--
ALTER TABLE `teachers`
  ADD CONSTRAINT `teachers_ibfk_1` FOREIGN KEY (`USER_ID`) REFERENCES `users` (`USER_ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
