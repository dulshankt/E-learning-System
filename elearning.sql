-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Mar 08, 2019 at 09:22 AM
-- Server version: 5.7.19
-- PHP Version: 5.6.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `elearning`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
CREATE TABLE IF NOT EXISTS `admin` (
  `adminid` int(11) NOT NULL AUTO_INCREMENT,
  `aname` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  PRIMARY KEY (`adminid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `admin_has_student`
--

DROP TABLE IF EXISTS `admin_has_student`;
CREATE TABLE IF NOT EXISTS `admin_has_student` (
  `admin_adminid` int(11) NOT NULL,
  `student_studentid` int(11) NOT NULL,
  PRIMARY KEY (`admin_adminid`,`student_studentid`),
  KEY `fk_admin_has_student_student1_idx` (`student_studentid`),
  KEY `fk_admin_has_student_admin1_idx` (`admin_adminid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `course`
--

DROP TABLE IF EXISTS `course`;
CREATE TABLE IF NOT EXISTS `course` (
  `courseid` int(11) NOT NULL,
  `cname` varchar(45) DEFAULT NULL,
  `cfaculty` varchar(45) DEFAULT NULL,
  `cyear` varchar(45) DEFAULT NULL,
  `csemeseter` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`courseid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `enrolment`
--

DROP TABLE IF EXISTS `enrolment`;
CREATE TABLE IF NOT EXISTS `enrolment` (
  `enrolmentid` int(11) NOT NULL,
  `enroll` varchar(45) DEFAULT NULL,
  `student_studentid` int(11) NOT NULL,
  `course_courseid` int(11) NOT NULL,
  PRIMARY KEY (`enrolmentid`),
  KEY `fk_enrolment_student_idx` (`student_studentid`),
  KEY `fk_enrolment_course1_idx` (`course_courseid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `feedback`
--

DROP TABLE IF EXISTS `feedback`;
CREATE TABLE IF NOT EXISTS `feedback` (
  `feedbackid` int(11) NOT NULL,
  `fnote` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`feedbackid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `notice`
--

DROP TABLE IF EXISTS `notice`;
CREATE TABLE IF NOT EXISTS `notice` (
  `noticeid` int(11) NOT NULL,
  `note` varchar(200) DEFAULT NULL,
  `admin_adminid` int(11) NOT NULL,
  PRIMARY KEY (`noticeid`),
  KEY `fk_notice_admin1_idx` (`admin_adminid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
CREATE TABLE IF NOT EXISTS `student` (
  `studentid` int(11) NOT NULL AUTO_INCREMENT,
  `sname` varchar(45) DEFAULT NULL,
  `sno` varchar(45) DEFAULT NULL,
  `semail` varchar(45) DEFAULT NULL,
  `sfaculty` varchar(45) DEFAULT NULL,
  `sbirthday` date DEFAULT NULL,
  `user_userid` int(11) NOT NULL,
  PRIMARY KEY (`studentid`),
  KEY `fk_student_user1_idx` (`user_userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `student_has_course`
--

DROP TABLE IF EXISTS `student_has_course`;
CREATE TABLE IF NOT EXISTS `student_has_course` (
  `student_studentid` int(11) NOT NULL,
  `course_courseid` int(11) NOT NULL,
  PRIMARY KEY (`student_studentid`,`course_courseid`),
  KEY `fk_student_has_course_course1_idx` (`course_courseid`),
  KEY `fk_student_has_course_student1_idx` (`student_studentid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `student_has_feedback`
--

DROP TABLE IF EXISTS `student_has_feedback`;
CREATE TABLE IF NOT EXISTS `student_has_feedback` (
  `student_studentid` int(11) NOT NULL,
  `feedback_feedbackid` int(11) NOT NULL,
  PRIMARY KEY (`student_studentid`,`feedback_feedbackid`),
  KEY `fk_student_has_feedback_feedback1_idx` (`feedback_feedbackid`),
  KEY `fk_student_has_feedback_student1_idx` (`student_studentid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `userid` int(11) NOT NULL AUTO_INCREMENT,
  `urname` varchar(45) NOT NULL,
  `username` varchar(45) NOT NULL,
  `upassword` varchar(10) NOT NULL,
  `usertype` varchar(45) NOT NULL,
  `admin_adminid` int(11) NOT NULL,
  PRIMARY KEY (`userid`),
  KEY `fk_user_admin1_idx` (`admin_adminid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `admin_has_student`
--
ALTER TABLE `admin_has_student`
  ADD CONSTRAINT `fk_admin_has_student_admin1` FOREIGN KEY (`admin_adminid`) REFERENCES `admin` (`adminid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_admin_has_student_student1` FOREIGN KEY (`student_studentid`) REFERENCES `student` (`studentid`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `enrolment`
--
ALTER TABLE `enrolment`
  ADD CONSTRAINT `fk_enrolment_course1` FOREIGN KEY (`course_courseid`) REFERENCES `course` (`courseid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_enrolment_student` FOREIGN KEY (`student_studentid`) REFERENCES `student` (`studentid`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `notice`
--
ALTER TABLE `notice`
  ADD CONSTRAINT `fk_notice_admin1` FOREIGN KEY (`admin_adminid`) REFERENCES `admin` (`adminid`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `student`
--
ALTER TABLE `student`
  ADD CONSTRAINT `fk_student_user1` FOREIGN KEY (`user_userid`) REFERENCES `user` (`userid`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `student_has_course`
--
ALTER TABLE `student_has_course`
  ADD CONSTRAINT `fk_student_has_course_course1` FOREIGN KEY (`course_courseid`) REFERENCES `course` (`courseid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_student_has_course_student1` FOREIGN KEY (`student_studentid`) REFERENCES `student` (`studentid`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `student_has_feedback`
--
ALTER TABLE `student_has_feedback`
  ADD CONSTRAINT `fk_student_has_feedback_feedback1` FOREIGN KEY (`feedback_feedbackid`) REFERENCES `feedback` (`feedbackid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_student_has_feedback_student1` FOREIGN KEY (`student_studentid`) REFERENCES `student` (`studentid`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `fk_user_admin1` FOREIGN KEY (`admin_adminid`) REFERENCES `admin` (`adminid`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
