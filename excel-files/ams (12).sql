-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 13, 2024 at 09:42 PM
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

--
-- Dumping data for table `batches`
--

INSERT INTO `batches` (`BATCH_ID`, `BATCH`, `YEARR`, `CLASS`, `SEMESTER_1`, `SEMESTER_2`, `SEMESTER_3`, `SEMESTER_4`, `SEMESTER_5`, `SEMESTER_6`) VALUES
(1, 'BCA2022', 2022, 'BCA', 0, 0, 1, 0, 0, 0);

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
-- Table structure for table `events`
--

CREATE TABLE `events` (
  `id` int(11) NOT NULL,
  `event_date` date NOT NULL,
  `event_title` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `events`
--

INSERT INTO `events` (`id`, `event_date`, `event_title`) VALUES
(1, '2024-11-21', 'sulu birthday');

-- --------------------------------------------------------

--
-- Table structure for table `notes`
--

CREATE TABLE `notes` (
  `NOTE_ID` int(11) NOT NULL,
  `SUBJECT_ID` int(11) NOT NULL,
  `TEACHER_ID` int(11) NOT NULL,
  `MODULE` int(11) DEFAULT NULL,
  `MODULE_NAME` varchar(200) NOT NULL,
  `DESCRIPTIONN` varchar(255) NOT NULL,
  `CATEGORY` enum('NOTE','ASSIGNMENT','PAPERPATHWAY') NOT NULL,
  `FILE_NAME` varchar(255) NOT NULL,
  `UPLOAD_DATE` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `routemap`
--

CREATE TABLE `routemap` (
  `R_ID` int(11) NOT NULL,
  `TEACHER_ID` int(11) NOT NULL,
  `SUBJECT_NAME` varchar(225) DEFAULT NULL,
  `CLASS` varchar(225) NOT NULL,
  `YEARR` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `routemap`
--

INSERT INTO `routemap` (`R_ID`, `TEACHER_ID`, `SUBJECT_NAME`, `CLASS`, `YEARR`) VALUES
(38, 58, 'OPERATING SYSTEMS', 'BCA', 2023),
(39, 58, 'DATA STRUCTURE USING C++', 'BCA', 2023),
(40, 59, 'DATA STRUCTURE USING C++', 'BCA', 2023),
(41, 60, 'WEB PROGRAMING USING PHP', 'BCA', 2023),
(42, 60, 'JAVA PROGRMMING USING LINUX', 'BCA', 2022),
(43, 61, 'DESIGN AND ANALYSIS OF ALGORITHM', 'BCA', 2023),
(44, 62, 'COMPUTER GRAPHICS', 'BCA', 2023),
(45, 62, 'ADVANCED STATISTICAL METHODS', 'BCA', 2023),
(46, 63, 'IT AND ENVIRONMENT', 'BCA', 2022),
(47, 64, 'IT AND ENVIRONMENT', 'BCA', 2022),
(48, 65, 'DESIGN AND ANALYSIS OF ALGORITHM', 'BCA', 2023),
(49, 66, 'ADVANCED STATISTICAL METHODS', 'BCA', 2023);

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

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`STUDENT_ID`, `USER_ID`, `NAMEE`, `CLASS_NAME`, `PARENT_CONTACT`, `BATCH_ID`) VALUES
(1, 2, 'AADIL SAKEER', 'BCA', '9876676511', 1),
(2, 3, 'AAFTHAB K I', 'BCA', '2233445544', 1),
(3, 4, 'ABDULRAUOF', 'BCA', '5466457746', 1),
(4, 5, 'ABHIN K S', 'BCA', '6567768775', 1),
(5, 6, 'ABID NAJEEB', 'BCA', '7788567473', 1),
(6, 7, 'ADITHYA  P V', 'BCA', '7477889364', 1),
(7, 8, 'AFSAL V N', 'BCA', '9967463567', 1),
(8, 9, 'AJMI T S', 'BCA', '3547899546', 1),
(9, 10, 'ALTHAF JAMAL', 'BCA', '7868675657', 1),
(10, 11, 'AMAL SAJI', 'BCA', '7788887776', 1),
(11, 12, 'ANAMIKA V U', 'BCA', '5895644658', 1),
(12, 13, 'ANAND O G', 'BCA', '5757688797', 1),
(13, 14, 'ANJALI PAI T S', 'BCA', '5756435333', 1),
(14, 15, 'ANU M A', 'BCA', '7879654323', 1),
(15, 16, 'APARNA  MOHAN', 'BCA', '4354466777', 1),
(16, 17, 'ARJUN P S', 'BCA', '6666464656', 1),
(17, 18, 'ARYA P S', 'BCA', '4646789988', 1),
(18, 19, 'ASNA T I', 'BCA', '9909868688', 1),
(19, 20, 'AYSHA SANJUNA', 'BCA', '6766788888', 1),
(20, 21, 'BHARATH  K M', 'BCA', '7767689797', 1),
(21, 22, 'DEVI CHANDANA  S', 'BCA', '6890809978', 1),
(22, 23, 'DIYA ZAINAB K A', 'BCA', '8798865645', 1),
(23, 24, 'FABIN PAUL FRANCIS', 'BCA', '4647586887', 1),
(24, 25, 'FAMIS NOUSHAD  T N', 'BCA', '5758687989', 1),
(25, 26, 'FARISA C A', 'BCA', '7466444444', 1),
(26, 27, 'FARISHA N A', 'BCA', '4546666666', 1),
(27, 28, 'FARSANA P S', 'BCA', '5466643555', 1),
(28, 29, 'FATHIMA ASHITHA  P A', 'BCA', '9876676546', 1),
(29, 30, 'FATHIMA C I', 'BCA', '6646677777', 1),
(30, 31, 'FATHIMA K B', 'BCA', '5635334234', 1),
(31, 32, 'FATHIMA K S', 'BCA', '4776544433', 1),
(32, 33, 'FATHIMA P A', 'BCA', '5367788888', 1),
(33, 34, 'FATHIMA SALIM ', 'BCA', '7866677777', 1),
(34, 35, 'FATHIMATH FASMINA V T', 'BCA', '4555556666', 1),
(35, 36, 'GASHIYA NAZRIN ', 'BCA', '7776655555', 1),
(36, 37, 'HARIKRISHNAN  U K', 'BCA', '7778888876', 1),
(37, 38, 'JASNAMOL E S', 'BCA', '4456655556', 1),
(38, 39, 'KADEEJA SHAMEER', 'BCA', '6646577577', 1),
(39, 40, 'KIRAN BABU', 'BCA', '4666677776', 1),
(40, 41, 'MAHIN C R', 'BCA', '7654445546', 1),
(41, 42, 'MALAVIKA SHIBU', 'BCA', '7777611111', 1),
(42, 43, 'MOHAMMED IQBAL  M A', 'BCA', '3323333444', 1),
(43, 44, 'MUHAMAD USMAN', 'BCA', '5555332224', 1),
(44, 45, 'MUHAMMAD P K', 'BCA', '5554333566', 1),
(45, 46, 'MUHAMMED ADHIL K R', 'BCA', '7776655554', 1),
(46, 47, 'MUHAMMED ANEES V N', 'BCA', '7778899998', 1),
(47, 48, 'MUHAMMED SUHAIL A M', 'BCA', '7666788996', 1),
(48, 49, 'MUHAMMED SWALIH  T L', 'BCA', '4333556777', 1),
(49, 50, 'NADIYA IBRAHIM', 'BCA', '5578900998', 1),
(50, 51, 'NAJITHA K N', 'BCA', '9990988877', 1),
(51, 52, 'NEHA T', 'BCA', '8098908789', 1),
(52, 53, 'NIMITHRA T S', 'BCA', '9098899099', 1),
(53, 54, 'PRATHAP', 'BCA', '6600676567', 1),
(54, 55, 'RAASHID V Z', 'BCA', '8877067667', 1),
(55, 56, 'RIHAN A M', 'BCA', '5067657906', 1),
(56, 57, 'RISWANA PARVIN K S', 'BCA', '8907980695', 1),
(57, 58, 'RITHU T R', 'BCA', '7908866079', 1),
(58, 59, 'SAFNA K S', 'BCA', '7909765546', 1),
(59, 60, 'SAFNA V A', 'BCA', '6767098909', 1),
(60, 61, 'SANA FATHIMA P S', 'BCA', '4095867855', 1),
(61, 62, 'SETHULAKSHMI A S', 'BCA', '3409678493', 1),
(62, 63, 'SHAHANA SALIM', 'BCA', '1298490380', 1),
(63, 64, 'SHAMSUDHEEN S', 'BCA', '5867302984', 1),
(64, 65, 'SREETHUMOL P B', 'BCA', '3049804886', 1),
(65, 66, 'SULFATH P M', 'BCA', '3848590303', 1),
(66, 67, 'SUSMIN GEORGE', 'BCA', '5767739003', 1),
(67, 68, 'SWETHA BABU', 'BCA', '5678849947', 1);

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
  `TEACHER_ID` int(11) DEFAULT NULL,
  `TEACHER_ID2` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `subjects`
--

INSERT INTO `subjects` (`SUBJECT_ID`, `SUBJECT_NAME`, `CLASS_NAME`, `SEMESTER`, `TOTAL_MODULES`, `TEACHER_ID`, `TEACHER_ID2`) VALUES
(1, 'ADVANCED STATISTICAL METHODS', 'BCA', 3, 4, 62, 66),
(2, 'COMPUTER GRAPHICS', 'BCA', 3, 4, 62, NULL),
(3, 'MICROPROCESSOR AND PC HARDWARE', 'BCA', 3, 5, NULL, NULL),
(4, 'OPERATING SYSTEMS', 'BCA', 3, 5, 58, NULL),
(5, 'DATA STRUCTURE USING C++', 'BCA', 3, 5, 58, 59),
(6, 'COMPUTER NETWORKS', 'BCA', 5, 5, NULL, NULL),
(7, 'IT AND ENVIRONMENT', 'BCA', 5, 5, 63, 64),
(8, 'JAVA PROGRMMING USING LINUX', 'BCA', 5, 5, 60, NULL),
(9, 'OPEN COURSE', 'BCA', 5, 5, NULL, NULL),
(10, 'SYSTEM ANALYSIS AND SOFTWARE ENGINEERING', 'BCA', 4, 5, NULL, NULL),
(11, 'LINUX ADMINISTRATION', 'BCA', 4, 5, NULL, NULL),
(12, 'DESIGN AND ANALYSIS OF ALGORITHM', 'BCA', 4, 5, 61, 65),
(13, 'WEB PROGRAMING USING PHP', 'BCA', 4, 5, 60, NULL),
(14, 'OPERATION RESEARCH', 'BCA', 4, 4, NULL, NULL);

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

--
-- Dumping data for table `teachers`
--

INSERT INTO `teachers` (`TEACHER_ID`, `USER_ID`, `NAMEE`, `DEPARTMENT`, `JOINING_DATE`) VALUES
(58, 133, 'DR. LEENA C. SEKHAR', 'BCA', 'JULY 14, 2022'),
(59, 134, 'SRI. JOSEPH DERIL K S ', 'BCA', 'JULY 14, 2022'),
(60, 135, 'LT. IBRAHIM SALIM M', 'BCA', 'JULY 14, 2022'),
(61, 136, 'DR. JASEENA K U', 'BCA', 'JULY 14, 2022'),
(62, 137, 'DR. BISMIN', 'BCA', 'JULY 14, 2022'),
(63, 138, 'DR. SHAREENA V B ', 'BCA', 'JULY 14, 2022'),
(64, 139, 'DR. JULIE M DAVID', 'BCA', 'JULY 14, 2022'),
(65, 140, 'SRI. JASIR M P', 'BCA', 'JULY 14, 2022'),
(66, 141, 'SMT. SUFAIRA SHAMSUDHEEN', 'BCA', 'JULY 14, 2022');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `USER_ID` int(11) NOT NULL,
  `USER_NAME` varchar(100) NOT NULL,
  `PASSWORDD` varchar(100) NOT NULL,
  `EMAIL` varchar(100) NOT NULL,
  `ROLEE` enum('ADMIN','TEACHERS','STUDENTS') NOT NULL,
  `STATUSS` enum('ACTIVE','INACTIVE') NOT NULL DEFAULT 'ACTIVE'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`USER_ID`, `USER_NAME`, `PASSWORDD`, `EMAIL`, `ROLEE`, `STATUSS`) VALUES
(1, 'admin', 'admin', 'admin@gmail.com', 'ADMIN', 'ACTIVE'),
(2, '220101', '220101', 'aadilsakeer@gmail.com', 'STUDENTS', 'ACTIVE'),
(3, '220102', '220102', 'aafthab@gmail.com', 'STUDENTS', 'ACTIVE'),
(4, '220103', '220103', 'ABDULRAUOF@gmail.com', 'STUDENTS', 'ACTIVE'),
(5, '220104', '220104', 'ABHIN@gmail.com', 'STUDENTS', 'ACTIVE'),
(6, '220105', '220105', 'ABID@gmail.com', 'STUDENTS', 'ACTIVE'),
(7, '220107', '220107', 'ADITHYA@gmail.com', 'STUDENTS', 'ACTIVE'),
(8, '220108', '220108', 'AFSAL@gmail.com', 'STUDENTS', 'ACTIVE'),
(9, '220109', '220109', 'AJMI@gmail.com', 'STUDENTS', 'ACTIVE'),
(10, '220111', '220111', 'ALTHAF@gmail.com', 'STUDENTS', 'ACTIVE'),
(11, '220112', '220112', 'AMAL@gmail.com', 'STUDENTS', 'ACTIVE'),
(12, '220113', '220113', 'ANAMIKA@gmail.com', 'STUDENTS', 'ACTIVE'),
(13, '220114', '220114', 'ANAND@gmail.com', 'STUDENTS', 'ACTIVE'),
(14, '220115', '220115', 'ANJALI@gmail.com', 'STUDENTS', 'ACTIVE'),
(15, '220116', '220116', 'ANU@gmail.com', 'STUDENTS', 'ACTIVE'),
(16, '220117', '220117', 'APARNA@gmail.com', 'STUDENTS', 'ACTIVE'),
(17, '220118', '220118', 'ARJUN@gmail.com', 'STUDENTS', 'ACTIVE'),
(18, '220119', '220119', 'ARYA@gmail.com', 'STUDENTS', 'ACTIVE'),
(19, '220120', '220120', 'ASNA@gmail.com', 'STUDENTS', 'ACTIVE'),
(20, '220121', '220121', 'AYSHA@gmail.com', 'STUDENTS', 'ACTIVE'),
(21, '220122', '220122', 'BHARATH@gmail.com', 'STUDENTS', 'ACTIVE'),
(22, '220123', '220123', 'DEVI@gmail.com', 'STUDENTS', 'ACTIVE'),
(23, '220124', '220124', 'DIYA@gmail.com', 'STUDENTS', 'ACTIVE'),
(24, '220125', '220125', 'FABIN@gmail.com', 'STUDENTS', 'ACTIVE'),
(25, '220126', '220126', 'FAMIS@gmail.com', 'STUDENTS', 'ACTIVE'),
(26, '220127', '220127', 'FARISA@gmail.com', 'STUDENTS', 'ACTIVE'),
(27, '220128', '220128', 'FARISHA@gmail.com', 'STUDENTS', 'ACTIVE'),
(28, '220129', '220129', 'FARSANA@gmail.com', 'STUDENTS', 'ACTIVE'),
(29, '220130', '220130', 'ASHITHA@gmail.com', 'STUDENTS', 'ACTIVE'),
(30, '220131', '220131', 'CI@gmail.com', 'STUDENTS', 'ACTIVE'),
(31, '220132', '220132', 'KB@gmail.com', 'STUDENTS', 'ACTIVE'),
(32, '220133', '220133', 'KS@gmail.com', 'STUDENTS', 'ACTIVE'),
(33, '220134', '220134', 'PA@gmail.com', 'STUDENTS', 'ACTIVE'),
(34, '220135', '220135', 'SALIM@gmail.com', 'STUDENTS', 'ACTIVE'),
(35, '220136', '220136', 'FASMINA@gmail.com', 'STUDENTS', 'ACTIVE'),
(36, '220137', '220137', 'GASHIYA@gmail.com', 'STUDENTS', 'ACTIVE'),
(37, '220139', '220139', 'HARIKRISHNAN@gmail.com', 'STUDENTS', 'ACTIVE'),
(38, '220140', '220140', 'JASNA@gmail.com', 'STUDENTS', 'INACTIVE'),
(39, '220141', '220141', 'KADEEJA@gmail.com', 'STUDENTS', 'ACTIVE'),
(40, '220142', '220142', 'KIRAN@gmail.com', 'STUDENTS', 'ACTIVE'),
(41, '220143', '220143', 'MAHIN@gmail.com', 'STUDENTS', 'ACTIVE'),
(42, '220144', '220144', 'MALAVIKA@gmail.com', 'STUDENTS', 'ACTIVE'),
(43, '220145', '220145', 'IQBAL@gmail.com', 'STUDENTS', 'ACTIVE'),
(44, '220146', '220146', 'USMAN@gmail.com', 'STUDENTS', 'ACTIVE'),
(45, '220147', '220147', 'PK@gmail.com', 'STUDENTS', 'ACTIVE'),
(46, '220148', '220148', 'ADHILKR@gmail.com', 'STUDENTS', 'ACTIVE'),
(47, '220149', '220149', 'ANEES@gmail.com', 'STUDENTS', 'ACTIVE'),
(48, '220150', '220150', 'SUHAIL@gmail.com', 'STUDENTS', 'ACTIVE'),
(49, '220151', '220151', 'SWALIH@gmail.com', 'STUDENTS', 'INACTIVE'),
(50, '220152', '220152', 'NADIYA@gmail.com', 'STUDENTS', 'ACTIVE'),
(51, '220153', '220153', 'NAJITHA@gmail.com', 'STUDENTS', 'ACTIVE'),
(52, '220154', '220154', 'NEHA@gmail.com', 'STUDENTS', 'ACTIVE'),
(53, '220155', '220155', 'NIMITHRA@gmail.com', 'STUDENTS', 'ACTIVE'),
(54, '220156', '220156', 'PRATHAP@gmail.com', 'STUDENTS', 'ACTIVE'),
(55, '220157', '220157', 'RAASHID@gmail.com', 'STUDENTS', 'ACTIVE'),
(56, '220158', '220158', 'RIHAN@gmail.com', 'STUDENTS', 'ACTIVE'),
(57, '220159', '220159', 'RISWANA@gmail.com', 'STUDENTS', 'ACTIVE'),
(58, '220160', '220160', 'RITHU@gmail.com', 'STUDENTS', 'ACTIVE'),
(59, '220161', '220161', 'SAFNA@gmail.com', 'STUDENTS', 'ACTIVE'),
(60, '220162', '220162', 'SAFNA@gmail.com', 'STUDENTS', 'ACTIVE'),
(61, '220163', '220163', 'SANA@gmail.com', 'STUDENTS', 'ACTIVE'),
(62, '220164', '220164', 'SETHULAKSHMI@gmail.com', 'STUDENTS', 'ACTIVE'),
(63, '220165', '220165', 'SHAHANA@gmail.com', 'STUDENTS', 'ACTIVE'),
(64, '220166', '220166', 'SHAMSUDHEEN@gmail.com', 'STUDENTS', 'INACTIVE'),
(65, '220167', '220167', 'SREETHUMOL@gmail.com', 'STUDENTS', 'INACTIVE'),
(66, '220168', '220168', 'SULFA@gmail.com', 'STUDENTS', 'ACTIVE'),
(67, '220169', '220169', 'SUSMIN@gmail.com', 'STUDENTS', 'INACTIVE'),
(68, '220170', '220170', 'SWETHA@gmail.com', 'STUDENTS', 'INACTIVE'),
(133, '192022', '192022', 'leena@gmail.com', 'TEACHERS', 'ACTIVE'),
(134, '192023', '192023', 'deril@gmail.com', 'TEACHERS', 'ACTIVE'),
(135, '192024', '192024', 'salim@gmail.com', 'TEACHERS', 'ACTIVE'),
(136, '192025', '192025', 'jaseena@gmail.com', 'TEACHERS', 'ACTIVE'),
(137, '192026', '192026', 'bismin@gmail.com', 'TEACHERS', 'ACTIVE'),
(138, '192027', '192027', 'shareena@gmail.com', 'TEACHERS', 'ACTIVE'),
(139, '192028', '192028', 'julie@gmail.com', 'TEACHERS', 'ACTIVE'),
(140, '192029', '192029', 'jasir@gmail.com', 'TEACHERS', 'ACTIVE'),
(141, '192030', '192030', 'sufaira@gmail.com', 'TEACHERS', 'ACTIVE');

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
-- Indexes for table `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notes`
--
ALTER TABLE `notes`
  ADD PRIMARY KEY (`NOTE_ID`),
  ADD KEY `SUBJECT_ID` (`SUBJECT_ID`),
  ADD KEY `TEACHER_ID` (`TEACHER_ID`);

--
-- Indexes for table `routemap`
--
ALTER TABLE `routemap`
  ADD PRIMARY KEY (`R_ID`),
  ADD KEY `TEACHER_ID` (`TEACHER_ID`),
  ADD KEY `BATCH_ID` (`CLASS`);

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
  ADD KEY `TEACHER_ID` (`TEACHER_ID`),
  ADD KEY `TEACHER_ID2` (`TEACHER_ID2`);

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
  MODIFY `BATCH_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `classes`
--
ALTER TABLE `classes`
  MODIFY `CLASS_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `events`
--
ALTER TABLE `events`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `notes`
--
ALTER TABLE `notes`
  MODIFY `NOTE_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT for table `routemap`
--
ALTER TABLE `routemap`
  MODIFY `R_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT for table `students`
--
ALTER TABLE `students`
  MODIFY `STUDENT_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=75;

--
-- AUTO_INCREMENT for table `subjects`
--
ALTER TABLE `subjects`
  MODIFY `SUBJECT_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `teachers`
--
ALTER TABLE `teachers`
  MODIFY `TEACHER_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=67;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `USER_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=142;

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
  ADD CONSTRAINT `notes_ibfk_1` FOREIGN KEY (`SUBJECT_ID`) REFERENCES `subjects` (`SUBJECT_ID`),
  ADD CONSTRAINT `notes_ibfk_2` FOREIGN KEY (`TEACHER_ID`) REFERENCES `teachers` (`TEACHER_ID`);

--
-- Constraints for table `routemap`
--
ALTER TABLE `routemap`
  ADD CONSTRAINT `routemap_ibfk_1` FOREIGN KEY (`TEACHER_ID`) REFERENCES `teachers` (`TEACHER_ID`);

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
  ADD CONSTRAINT `subjects_ibfk_1` FOREIGN KEY (`TEACHER_ID`) REFERENCES `teachers` (`TEACHER_ID`),
  ADD CONSTRAINT `subjects_ibfk_2` FOREIGN KEY (`TEACHER_ID2`) REFERENCES `teachers` (`TEACHER_ID`);

--
-- Constraints for table `teachers`
--
ALTER TABLE `teachers`
  ADD CONSTRAINT `teachers_ibfk_1` FOREIGN KEY (`USER_ID`) REFERENCES `users` (`USER_ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
