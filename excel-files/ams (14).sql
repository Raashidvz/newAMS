-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 20, 2024 at 11:05 AM
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
  `SEMESTER_6` int(11) NOT NULL DEFAULT 0,
  `SEMESTER_7` int(11) NOT NULL DEFAULT 0,
  `SEMESTER_8` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `batches`
--

INSERT INTO `batches` (`BATCH_ID`, `BATCH`, `YEARR`, `CLASS`, `SEMESTER_1`, `SEMESTER_2`, `SEMESTER_3`, `SEMESTER_4`, `SEMESTER_5`, `SEMESTER_6`, `SEMESTER_7`, `SEMESTER_8`) VALUES
(3, 'BCA2022', 2022, 'BCA', 0, 1, 1, 1, 1, 0, 0, 0),
(4, 'BCA2023', 2023, 'BCA', 1, 1, 1, 0, 0, 0, 0, 0);

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
  `TEACHER_ID` int(11) NOT NULL,
  `event_date` date NOT NULL,
  `event_title` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

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

--
-- Dumping data for table `notes`
--

INSERT INTO `notes` (`NOTE_ID`, `SUBJECT_ID`, `TEACHER_ID`, `MODULE`, `MODULE_NAME`, `DESCRIPTIONN`, `CATEGORY`, `FILE_NAME`, `UPLOAD_DATE`) VALUES
(50, 4, 94, 1, 'chapter1', 'test1', 'NOTE', '../notesAndAssignments/NOTES/OPERATING SYSTEMS_chapter1_1_note_2024-10-18_07-26-34 AM.pdf', '2024-10-18 05:26:34'),
(51, 8, 96, 1, 'chapter-1', 'java basics', 'NOTE', '../notesAndAssignments/NOTES/JAVA PROGRMMING USING LINUX_chapter-1_1_note_2024-10-20_07-29-59 AM.pdf', '2024-10-20 05:29:59'),
(52, 6, 96, 1, 'chapter-1', 'network introduction', 'NOTE', '../notesAndAssignments/NOTES/COMPUTER NETWORKS_chapter-1_1_note_2024-10-20_07-31-44 AM.pdf', '2024-10-20 05:31:44');

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
(88, 94, 'OPERATING SYSTEMS', 'BCA', 2023),
(89, 95, 'DATA STRUCTURE USING C++', 'BCA', 2023),
(90, 96, 'WEB PROGRAMING USING PHP', 'BCA', 2023),
(91, 96, 'JAVA PROGRMMING USING LINUX', 'BCA', 2022),
(92, 97, 'DESIGN AND ANALYSIS OF ALGORITHM', 'BCA', 2023),
(93, 98, 'COMPUTER GRAPHICS', 'BCA', 2023),
(94, 98, 'ADVANCED STATISTICAL METHODS', 'BCA', 2023),
(95, 99, 'IT AND ENVIRONMENT', 'BCA', 2022),
(96, 100, 'IT AND ENVIRONMENT', 'BCA', 2022),
(97, 101, 'DESIGN AND ANALYSIS OF ALGORITHM', 'BCA', 2023),
(98, 102, 'ADVANCED STATISTICAL METHODS', 'BCA', 2023),
(99, 94, 'DATA STRUCTURE USING C++', 'BCA', 2023);

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
(75, 178, 'AADIL SAKEER', 'BCA', '9876676511', 3),
(76, 179, 'AAFTHAB K I', 'BCA', '2233445544', 3),
(77, 180, 'ABDULRAUOF', 'BCA', '5466457746', 3),
(78, 181, 'ABHIN K S', 'BCA', '6567768775', 3),
(79, 182, 'ABID NAJEEB', 'BCA', '7788567473', 3),
(80, 183, 'ADITHYA  P V', 'BCA', '7477889364', 3),
(81, 184, 'AFSAL V N', 'BCA', '9967463567', 3),
(82, 185, 'AJMI T S', 'BCA', '3547899546', 3),
(83, 186, 'ALTHAF JAMAL', 'BCA', '7868675657', 3),
(84, 187, 'AMAL SAJI', 'BCA', '7788887776', 3),
(85, 188, 'ANAMIKA V U', 'BCA', '5895644658', 3),
(86, 189, 'ANAND O G', 'BCA', '5757688797', 3),
(87, 190, 'ANJALI PAI T S', 'BCA', '5756435333', 3),
(88, 191, 'ANU M A', 'BCA', '7879654323', 3),
(89, 192, 'APARNA  MOHAN', 'BCA', '4354466777', 3),
(90, 193, 'ARJUN P S', 'BCA', '6666464656', 3),
(91, 194, 'ARYA P S', 'BCA', '4646789988', 3),
(92, 195, 'ASNA T I', 'BCA', '9909868688', 3),
(93, 196, 'AYSHA SANJUNA', 'BCA', '6766788888', 3),
(94, 197, 'BHARATH  K M', 'BCA', '7767689797', 3),
(95, 198, 'DEVI CHANDANA  S', 'BCA', '6890809978', 3),
(96, 199, 'DIYA ZAINAB K A', 'BCA', '8798865645', 3),
(97, 200, 'FABIN PAUL FRANCIS', 'BCA', '4647586887', 3),
(98, 201, 'FAMIS NOUSHAD  T N', 'BCA', '5758687989', 3),
(99, 202, 'FARISA C A', 'BCA', '7466444444', 3),
(100, 203, 'FARISHA N A', 'BCA', '4546666666', 3),
(101, 204, 'FARSANA P S', 'BCA', '5466643555', 3),
(102, 205, 'FATHIMA ASHITHA  P A', 'BCA', '9876676546', 3),
(103, 206, 'FATHIMA C I', 'BCA', '6646677777', 3),
(104, 207, 'FATHIMA K B', 'BCA', '5635334234', 3),
(105, 208, 'FATHIMA K S', 'BCA', '4776544433', 3),
(106, 209, 'FATHIMA P A', 'BCA', '5367788888', 3),
(107, 210, 'FATHIMA SALIM ', 'BCA', '7866677777', 3),
(108, 211, 'FATHIMATH FASMINA V T', 'BCA', '4555556666', 3),
(109, 212, 'GASHIYA NAZRIN ', 'BCA', '7776655555', 3),
(110, 213, 'HARIKRISHNAN  U K', 'BCA', '7778888876', 3),
(111, 214, 'JASNAMOL E S', 'BCA', '4456655556', 3),
(112, 215, 'KADEEJA SHAMEER', 'BCA', '6646577577', 3),
(113, 216, 'KIRAN BABU', 'BCA', '4666677776', 3),
(114, 217, 'MAHIN C R', 'BCA', '7654445546', 3),
(115, 218, 'MALAVIKA SHIBU', 'BCA', '7777611111', 3),
(116, 219, 'MOHAMMED IQBAL  M A', 'BCA', '3323333444', 3),
(117, 220, 'MUHAMAD USMAN', 'BCA', '5555332224', 3),
(118, 221, 'MUHAMMAD P K', 'BCA', '5554333566', 3),
(119, 222, 'MUHAMMED ADHIL K R', 'BCA', '7776655554', 3),
(120, 223, 'MUHAMMED ANEES V N', 'BCA', '7778899998', 3),
(121, 224, 'MUHAMMED SUHAIL A M', 'BCA', '7666788996', 3),
(122, 225, 'MUHAMMED SWALIH  T L', 'BCA', '4333556777', 3),
(123, 226, 'NADIYA IBRAHIM', 'BCA', '5578900998', 3),
(124, 227, 'NAJITHA K N', 'BCA', '9990988877', 3),
(125, 228, 'NEHA T', 'BCA', '8098908789', 3),
(126, 229, 'NIMITHRA T S', 'BCA', '9098899099', 3),
(127, 230, 'PRATHAP', 'BCA', '6600676567', 3),
(128, 231, 'RAASHID V Z', 'BCA', '8877067667', 3),
(129, 232, 'RIHAN A M', 'BCA', '5067657906', 3),
(130, 233, 'RISWANA PARVIN K S', 'BCA', '8907980695', 3),
(131, 234, 'RITHU T R', 'BCA', '7908866079', 3),
(132, 235, 'SAFNA K S', 'BCA', '7909765546', 3),
(133, 236, 'SAFNA V A', 'BCA', '6767098909', 3),
(134, 237, 'SANA FATHIMA P S', 'BCA', '4095867855', 3),
(135, 238, 'SETHULAKSHMI A S', 'BCA', '3409678493', 3),
(136, 239, 'SHAHANA SALIM', 'BCA', '1298490380', 3),
(137, 240, 'SHAMSUDHEEN S', 'BCA', '5867302984', 3),
(138, 241, 'SREETHUMOL P B', 'BCA', '3049804886', 3),
(139, 242, 'SULFATH P M', 'BCA', '3848590303', 3),
(140, 243, 'SUSMIN GEORGE', 'BCA', '5767739003', 3),
(141, 244, 'SWETHA BABU', 'BCA', '5678849947', 3),
(142, 245, 'AKHEEL', 'BCA', '6676789009', 4),
(143, 246, 'SALMAN', 'BCA', '6756789090', 4),
(144, 247, 'FAYIS', 'BCA', '8878878980', 4),
(145, 248, 'JUNAID', 'BCA', '6789889890', 4),
(146, 249, 'ZOHAN', 'BCA', '8908786765', 4),
(147, 250, 'MUEEN', 'BCA', '4567678789', 4),
(148, 251, 'IKRU', 'BCA', '8765435287', 4);

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
(1, 'ADVANCED STATISTICAL METHODS', 'BCA', 3, 4, NULL, NULL),
(2, 'COMPUTER GRAPHICS', 'BCA', 3, 4, 98, NULL),
(3, 'MICROPROCESSOR AND PC HARDWARE', 'BCA', 3, 5, NULL, NULL),
(4, 'OPERATING SYSTEMS', 'BCA', 3, 5, 94, NULL),
(5, 'DATA STRUCTURE USING C++', 'BCA', 3, 5, 95, 94),
(6, 'COMPUTER NETWORKS', 'BCA', 5, 5, 95, 96),
(7, 'IT AND ENVIRONMENT', 'BCA', 5, 5, 99, NULL),
(8, 'JAVA PROGRMMING USING LINUX', 'BCA', 5, 5, 96, NULL),
(9, 'OPEN COURSE', 'BCA', 5, 5, NULL, NULL),
(10, 'SYSTEM ANALYSIS AND SOFTWARE ENGINEERING', 'BCA', 4, 5, 101, NULL),
(11, 'LINUX ADMINISTRATION', 'BCA', 4, 5, 99, NULL),
(12, 'DESIGN AND ANALYSIS OF ALGORITHM', 'BCA', 4, 5, NULL, 101),
(13, 'WEB PROGRAMING USING PHP', 'BCA', 4, 5, 96, NULL),
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
(94, 169, 'DR. LEENA C. SEKHAR', 'BCA', 'JULY 14, 2022'),
(95, 170, 'SRI. JOSEPH DERIL K S ', 'BCA', 'JULY 14, 2022'),
(96, 171, 'LT. IBRAHIM SALIM M', 'BCA', 'JULY 14, 2022'),
(97, 172, 'DR. JASEENA K U', 'BCA', 'JULY 14, 2022'),
(98, 173, 'DR. BISMIN', 'BCA', 'JULY 14, 2022'),
(99, 174, 'DR. SHAREENA V B ', 'BCA', 'JULY 14, 2022'),
(100, 175, 'DR. JULIE M DAVID', 'BCA', 'JULY 14, 2022'),
(101, 176, 'SRI. JASIR M P', 'BCA', 'JULY 14, 2022'),
(102, 177, 'SMT. SUFAIRA SHAMSUDHEEN', 'BCA', 'JULY 14, 2022');

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
(169, '192022', '192022', 'leena@gmail.com', 'TEACHERS', 'ACTIVE'),
(170, '192023', '192023', 'deril@gmail.com', 'TEACHERS', 'ACTIVE'),
(171, '192024', '192024', 'salim@gmail.com', 'TEACHERS', 'ACTIVE'),
(172, '192025', '192025', 'JASEENA@gmail.com', 'TEACHERS', 'INACTIVE'),
(173, '192026', '192026', 'bismin@gmail.com', 'TEACHERS', 'ACTIVE'),
(174, '192027', '192027', 'shareena@gmail.com', 'TEACHERS', 'ACTIVE'),
(175, '192028', '192028', 'julie@gmail.com', 'TEACHERS', 'INACTIVE'),
(176, '192029', '192029', 'jasir@gmail.com', 'TEACHERS', 'ACTIVE'),
(177, '192030', '192030', 'sufaira@gmail.com', 'TEACHERS', 'INACTIVE'),
(178, '220101', '220101', 'AADILSAKEER@gmail.com', 'STUDENTS', 'INACTIVE'),
(179, '220102', '220102', 'aafthab@gmail.com', 'STUDENTS', 'INACTIVE'),
(180, '220103', '220103', 'ABDULRAUOF@gmail.com', 'STUDENTS', 'INACTIVE'),
(181, '220104', '220104', 'ABHIN@gmail.com', 'STUDENTS', 'ACTIVE'),
(182, '220105', '220105', 'ABID@gmail.com', 'STUDENTS', 'ACTIVE'),
(183, '220107', '220107', 'ADITHYA@gmail.com', 'STUDENTS', 'ACTIVE'),
(184, '220108', '220108', 'AFSAL@gmail.com', 'STUDENTS', 'ACTIVE'),
(185, '220109', '220109', 'AJMI@gmail.com', 'STUDENTS', 'ACTIVE'),
(186, '220111', '220111', 'ALTHAF@gmail.com', 'STUDENTS', 'ACTIVE'),
(187, '220112', '220112', 'AMAL@gmail.com', 'STUDENTS', 'ACTIVE'),
(188, '220113', '220113', 'ANAMIKA@gmail.com', 'STUDENTS', 'ACTIVE'),
(189, '220114', '220114', 'ANAND@gmail.com', 'STUDENTS', 'ACTIVE'),
(190, '220115', '220115', 'ANJALI@gmail.com', 'STUDENTS', 'ACTIVE'),
(191, '220116', '220116', 'ANU@gmail.com', 'STUDENTS', 'ACTIVE'),
(192, '220117', '220117', 'APARNA@gmail.com', 'STUDENTS', 'ACTIVE'),
(193, '220118', '220118', 'ARJUN@gmail.com', 'STUDENTS', 'ACTIVE'),
(194, '220119', '220119', 'ARYA@gmail.com', 'STUDENTS', 'ACTIVE'),
(195, '220120', '220120', 'ASNA@gmail.com', 'STUDENTS', 'ACTIVE'),
(196, '220121', '220121', 'AYSHA@gmail.com', 'STUDENTS', 'ACTIVE'),
(197, '220122', '220122', 'BHARATH@gmail.com', 'STUDENTS', 'ACTIVE'),
(198, '220123', '220123', 'DEVI@gmail.com', 'STUDENTS', 'ACTIVE'),
(199, '220124', '220124', 'DIYA@gmail.com', 'STUDENTS', 'ACTIVE'),
(200, '220125', '220125', 'FABIN@gmail.com', 'STUDENTS', 'ACTIVE'),
(201, '220126', '220126', 'FAMIS@gmail.com', 'STUDENTS', 'ACTIVE'),
(202, '220127', '220127', 'FARISA@gmail.com', 'STUDENTS', 'ACTIVE'),
(203, '220128', '220128', 'FARISHA@gmail.com', 'STUDENTS', 'ACTIVE'),
(204, '220129', '220129', 'FARSANA@gmail.com', 'STUDENTS', 'ACTIVE'),
(205, '220130', '220130', 'ASHITHA@gmail.com', 'STUDENTS', 'ACTIVE'),
(206, '220131', '220131', 'CI@gmail.com', 'STUDENTS', 'ACTIVE'),
(207, '220132', '220132', 'KB@gmail.com', 'STUDENTS', 'ACTIVE'),
(208, '220133', '220133', 'KS@gmail.com', 'STUDENTS', 'ACTIVE'),
(209, '220134', '220134', 'PA@gmail.com', 'STUDENTS', 'ACTIVE'),
(210, '220135', '220135', 'SALIM@gmail.com', 'STUDENTS', 'ACTIVE'),
(211, '220136', '220136', 'FASMINA@gmail.com', 'STUDENTS', 'ACTIVE'),
(212, '220137', '220137', 'GASHIYA@gmail.com', 'STUDENTS', 'ACTIVE'),
(213, '220139', '220139', 'HARIKRISHNAN@gmail.com', 'STUDENTS', 'ACTIVE'),
(214, '220140', '220140', 'JASNA@gmail.com', 'STUDENTS', 'ACTIVE'),
(215, '220141', '220141', 'KADEEJA@gmail.com', 'STUDENTS', 'ACTIVE'),
(216, '220142', '220142', 'KIRAN@gmail.com', 'STUDENTS', 'ACTIVE'),
(217, '220143', '220143', 'MAHIN@gmail.com', 'STUDENTS', 'ACTIVE'),
(218, '220144', '220144', 'MALAVIKA@gmail.com', 'STUDENTS', 'ACTIVE'),
(219, '220145', '220145', 'IQBAL@gmail.com', 'STUDENTS', 'ACTIVE'),
(220, '220146', '220146', 'USMAN@gmail.com', 'STUDENTS', 'ACTIVE'),
(221, '220147', '220147', 'PK@gmail.com', 'STUDENTS', 'ACTIVE'),
(222, '220148', '220148', 'ADHILKR@gmail.com', 'STUDENTS', 'ACTIVE'),
(223, '220149', '220149', 'ANEES@gmail.com', 'STUDENTS', 'ACTIVE'),
(224, '220150', '220150', 'SUHAIL@gmail.com', 'STUDENTS', 'ACTIVE'),
(225, '220151', '220151', 'SWALIH@gmail.com', 'STUDENTS', 'ACTIVE'),
(226, '220152', '220152', 'NADIYA@gmail.com', 'STUDENTS', 'ACTIVE'),
(227, '220153', '220153', 'NAJITHA@gmail.com', 'STUDENTS', 'ACTIVE'),
(228, '220154', '220154', 'NEHA@gmail.com', 'STUDENTS', 'ACTIVE'),
(229, '220155', '220155', 'NIMITHRA@gmail.com', 'STUDENTS', 'ACTIVE'),
(230, '220156', '220156', 'PRATHAP@gmail.com', 'STUDENTS', 'ACTIVE'),
(231, '220157', '220157', 'RAASHID@gmail.com', 'STUDENTS', 'ACTIVE'),
(232, '220158', '220158', 'RIHAN@gmail.com', 'STUDENTS', 'ACTIVE'),
(233, '220159', '220159', 'RISWANA@gmail.com', 'STUDENTS', 'ACTIVE'),
(234, '220160', '220160', 'RITHU@gmail.com', 'STUDENTS', 'ACTIVE'),
(235, '220161', '220161', 'SAFNA@gmail.com', 'STUDENTS', 'ACTIVE'),
(236, '220162', '220162', 'SAFNA@gmail.com', 'STUDENTS', 'ACTIVE'),
(237, '220163', '220163', 'SANA@gmail.com', 'STUDENTS', 'ACTIVE'),
(238, '220164', '220164', 'SETHULAKSHMI@gmail.com', 'STUDENTS', 'ACTIVE'),
(239, '220165', '220165', 'SHAHANA@gmail.com', 'STUDENTS', 'ACTIVE'),
(240, '220166', '220166', 'SHAMSUDHEEN@gmail.com', 'STUDENTS', 'INACTIVE'),
(241, '220167', '220167', 'SREETHUMOL@gmail.com', 'STUDENTS', 'ACTIVE'),
(242, '220168', '220168', 'SULFA@gmail.com', 'STUDENTS', 'ACTIVE'),
(243, '220169', '220169', 'SUSMIN@gmail.com', 'STUDENTS', 'ACTIVE'),
(244, '220170', '220170', 'SWETHA@gmail.com', 'STUDENTS', 'INACTIVE'),
(245, '230101', '230101', 'akheel@gmail.com', 'STUDENTS', 'ACTIVE'),
(246, '230102', '230102', 'salman@gmail.com', 'STUDENTS', 'ACTIVE'),
(247, '230103', '230103', 'fayis@gmail.com', 'STUDENTS', 'ACTIVE'),
(248, '230104', '230104', 'junaid@gmail.com', 'STUDENTS', 'ACTIVE'),
(249, '230105', '230105', 'zohan@gmail.com', 'STUDENTS', 'ACTIVE'),
(250, '230106', '230106', 'mueen@gmail.com', 'STUDENTS', 'ACTIVE'),
(251, '230107', '230107', 'ikru@gmail.com', 'STUDENTS', 'ACTIVE');

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
  ADD PRIMARY KEY (`id`),
  ADD KEY `TEACHER_ID` (`TEACHER_ID`);

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
  MODIFY `BATCH_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `classes`
--
ALTER TABLE `classes`
  MODIFY `CLASS_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `events`
--
ALTER TABLE `events`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `notes`
--
ALTER TABLE `notes`
  MODIFY `NOTE_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT for table `routemap`
--
ALTER TABLE `routemap`
  MODIFY `R_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=100;

--
-- AUTO_INCREMENT for table `students`
--
ALTER TABLE `students`
  MODIFY `STUDENT_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=149;

--
-- AUTO_INCREMENT for table `subjects`
--
ALTER TABLE `subjects`
  MODIFY `SUBJECT_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `teachers`
--
ALTER TABLE `teachers`
  MODIFY `TEACHER_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=103;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `USER_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=252;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `classes`
--
ALTER TABLE `classes`
  ADD CONSTRAINT `classes_ibfk_1` FOREIGN KEY (`SUBJECT_ID`) REFERENCES `subjects` (`SUBJECT_ID`);

--
-- Constraints for table `events`
--
ALTER TABLE `events`
  ADD CONSTRAINT `events_ibfk_1` FOREIGN KEY (`TEACHER_ID`) REFERENCES `teachers` (`TEACHER_ID`);

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
