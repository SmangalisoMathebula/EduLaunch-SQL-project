-- MySQL dump 10.13  Distrib 8.0.46, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: edulaunch
-- ------------------------------------------------------
-- Server version	26.7.0

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
SET @MYSQLDUMP_TEMP_LOG_BIN = @@SESSION.SQL_LOG_BIN;
SET @@SESSION.SQL_LOG_BIN= 0;

--
-- GTID state at the beginning of the backup 
--

SET @@GLOBAL.GTID_PURGED=/*!80000 '+'*/ '9d4a6f8b-9f16-11f1-a458-40c2bae551d3:1-52';

--
-- Table structure for table `assessmentresults`
--

DROP TABLE IF EXISTS `assessmentresults`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `assessmentresults` (
  `result_id` int NOT NULL AUTO_INCREMENT,
  `assessment_id` int NOT NULL,
  `student_id` int NOT NULL,
  `marks_obtained` decimal(5,2) NOT NULL,
  `career_readiness_score` decimal(5,2) DEFAULT NULL,
  PRIMARY KEY (`result_id`),
  KEY `assessment_id` (`assessment_id`),
  KEY `student_id` (`student_id`),
  CONSTRAINT `assessmentresults_ibfk_1` FOREIGN KEY (`assessment_id`) REFERENCES `assessments` (`assessment_id`),
  CONSTRAINT `assessmentresults_ibfk_2` FOREIGN KEY (`student_id`) REFERENCES `students` (`student_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assessmentresults`
--

LOCK TABLES `assessmentresults` WRITE;
/*!40000 ALTER TABLE `assessmentresults` DISABLE KEYS */;
INSERT INTO `assessmentresults` VALUES (1,1,1,88.00,85.50),(2,1,2,76.00,72.00),(3,2,4,95.00,93.00),(4,3,2,65.00,60.00),(5,4,4,78.00,75.00),(6,1,1,88.00,85.50),(7,1,2,76.00,72.00),(8,2,4,95.00,93.00),(9,3,2,65.00,60.00),(10,4,4,78.00,75.00);
/*!40000 ALTER TABLE `assessmentresults` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assessments`
--

DROP TABLE IF EXISTS `assessments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `assessments` (
  `assessment_id` int NOT NULL AUTO_INCREMENT,
  `programme_id` int NOT NULL,
  `assessment_name` varchar(150) NOT NULL,
  `max_marks` decimal(5,2) NOT NULL,
  PRIMARY KEY (`assessment_id`),
  KEY `programme_id` (`programme_id`),
  CONSTRAINT `assessments_ibfk_1` FOREIGN KEY (`programme_id`) REFERENCES `programmes` (`programme_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assessments`
--

LOCK TABLES `assessments` WRITE;
/*!40000 ALTER TABLE `assessments` DISABLE KEYS */;
INSERT INTO `assessments` VALUES (1,1,'CV Quality Review',100.00),(2,2,'Mock Interview Evaluation',100.00),(3,3,'Career Plan Assessment',100.00),(4,4,'Workplace Readiness Test',100.00),(5,1,'CV Quality Review',100.00),(6,2,'Mock Interview Evaluation',100.00),(7,3,'Career Plan Assessment',100.00),(8,4,'Workplace Readiness Test',100.00);
/*!40000 ALTER TABLE `assessments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `careeradvisers`
--

DROP TABLE IF EXISTS `careeradvisers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `careeradvisers` (
  `adviser_id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `specialisation` varchar(100) DEFAULT NULL,
  `hire_date` date NOT NULL,
  PRIMARY KEY (`adviser_id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `careeradvisers`
--

LOCK TABLES `careeradvisers` WRITE;
/*!40000 ALTER TABLE `careeradvisers` DISABLE KEYS */;
INSERT INTO `careeradvisers` VALUES (1,'Naledi','Khumalo','naledi@edulaunch.co.za','CV Writing','2021-02-01'),(2,'Thabo','Mokoena','thabo@edulaunch.co.za','Interview Coaching','2020-06-15'),(3,'Priya','Naidoo','priya@edulaunch.co.za','Career Guidance','2019-09-01'),(4,'Sipho','Dlamini','sipho@edulaunch.co.za','Workplace Readiness','2022-01-10');
/*!40000 ALTER TABLE `careeradvisers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `digitalresources`
--

DROP TABLE IF EXISTS `digitalresources`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `digitalresources` (
  `resource_id` int NOT NULL AUTO_INCREMENT,
  `resource_name` varchar(150) NOT NULL,
  `resource_type` varchar(50) NOT NULL,
  `file_size_mb` decimal(8,2) NOT NULL,
  `adviser_id` int NOT NULL,
  PRIMARY KEY (`resource_id`),
  KEY `adviser_id` (`adviser_id`),
  CONSTRAINT `digitalresources_ibfk_1` FOREIGN KEY (`adviser_id`) REFERENCES `careeradvisers` (`adviser_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `digitalresources`
--

LOCK TABLES `digitalresources` WRITE;
/*!40000 ALTER TABLE `digitalresources` DISABLE KEYS */;
INSERT INTO `digitalresources` VALUES (1,'CV Template - Professional','CV Template',2.50,1),(2,'Interview Preparation Video','Video',85.00,2),(3,'Career Pathways Presentation','Presentation Slides',12.50,3),(4,'Workplace Etiquette Guide','PDF Guide',4.00,4);
/*!40000 ALTER TABLE `digitalresources` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enrolments`
--

DROP TABLE IF EXISTS `enrolments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `enrolments` (
  `enrolment_id` int NOT NULL AUTO_INCREMENT,
  `student_id` int NOT NULL,
  `programme_id` int NOT NULL,
  `enrolment_date` date NOT NULL DEFAULT (curdate()),
  `enrolment_status` varchar(20) NOT NULL DEFAULT 'Active',
  `completion_status` varchar(20) NOT NULL DEFAULT 'Not Started',
  `career_readiness_points` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`enrolment_id`),
  UNIQUE KEY `student_id` (`student_id`,`programme_id`),
  KEY `programme_id` (`programme_id`),
  CONSTRAINT `enrolments_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `students` (`student_id`),
  CONSTRAINT `enrolments_ibfk_2` FOREIGN KEY (`programme_id`) REFERENCES `programmes` (`programme_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enrolments`
--

LOCK TABLES `enrolments` WRITE;
/*!40000 ALTER TABLE `enrolments` DISABLE KEYS */;
INSERT INTO `enrolments` VALUES (1,1,1,'2026-08-28','Active','Completed',35),(2,1,2,'2026-08-28','Active','In Progress',15),(3,2,1,'2026-08-28','Active','Completed',30),(4,2,3,'2026-08-28','Active','In Progress',10),(5,4,2,'2026-08-28','Active','Completed',40),(6,4,4,'2026-08-28','Active','In Progress',15),(13,2,4,'2026-08-29','Active','Not Started',0),(14,1,3,'2026-08-29','Active','Not Started',0);
/*!40000 ALTER TABLE `enrolments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `learningactivities`
--

DROP TABLE IF EXISTS `learningactivities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `learningactivities` (
  `activity_id` int NOT NULL AUTO_INCREMENT,
  `programme_id` int NOT NULL,
  `activity_name` varchar(150) NOT NULL,
  `activity_type` varchar(50) NOT NULL,
  `points_available` int NOT NULL DEFAULT '10',
  PRIMARY KEY (`activity_id`),
  KEY `programme_id` (`programme_id`),
  CONSTRAINT `learningactivities_ibfk_1` FOREIGN KEY (`programme_id`) REFERENCES `programmes` (`programme_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `learningactivities`
--

LOCK TABLES `learningactivities` WRITE;
/*!40000 ALTER TABLE `learningactivities` DISABLE KEYS */;
INSERT INTO `learningactivities` VALUES (1,1,'CV Structure Workshop','Workshop',15),(2,1,'CV Draft Submission','Assignment',20),(3,2,'Interview Technique Workshop','Workshop',15),(4,2,'Recorded Mock Interview','Assignment',25),(5,3,'Strengths Assessment Session','Session',10),(6,4,'Workplace Etiquette Workshop','Workshop',15);
/*!40000 ALTER TABLE `learningactivities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `programmes`
--

DROP TABLE IF EXISTS `programmes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `programmes` (
  `programme_id` int NOT NULL AUTO_INCREMENT,
  `programme_name` varchar(100) NOT NULL,
  `programme_type` varchar(50) NOT NULL,
  `adviser_id` int NOT NULL,
  `capacity` int NOT NULL,
  `current_enrolled` int NOT NULL DEFAULT '0',
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  PRIMARY KEY (`programme_id`),
  KEY `adviser_id` (`adviser_id`),
  CONSTRAINT `programmes_ibfk_1` FOREIGN KEY (`adviser_id`) REFERENCES `careeradvisers` (`adviser_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `programmes`
--

LOCK TABLES `programmes` WRITE;
/*!40000 ALTER TABLE `programmes` DISABLE KEYS */;
INSERT INTO `programmes` VALUES (1,'CV Writing Essentials','CV Support',1,20,0,'2026-01-15','2026-03-15'),(2,'Mock Interview Bootcamp','Interview Preparation',2,25,0,'2026-01-10','2026-04-10'),(3,'Career Direction Workshop','Career Guidance',3,30,1,'2026-01-20','2026-05-20'),(4,'Workplace Readiness Programme','Workplace Readiness',4,20,0,'2026-02-05','2026-06-05'),(5,'CV Writing Essentials','CV Support',1,20,0,'2026-01-15','2026-03-15'),(6,'Mock Interview Bootcamp','Interview Preparation',2,25,0,'2026-01-10','2026-04-10'),(7,'Career Direction Workshop','Career Guidance',3,30,0,'2026-01-20','2026-05-20'),(8,'Workplace Readiness Programme','Workplace Readiness',4,20,0,'2026-02-05','2026-06-05'),(9,'CV Writing Essentials','CV Support',1,20,0,'2026-01-15','2026-03-15'),(10,'Mock Interview Bootcamp','Interview Preparation',2,25,0,'2026-01-10','2026-04-10'),(11,'Career Direction Workshop','Career Guidance',3,30,0,'2026-01-20','2026-05-20'),(12,'Workplace Readiness Programme','Workplace Readiness',4,20,0,'2026-02-05','2026-06-05');
/*!40000 ALTER TABLE `programmes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resourcedownloads`
--

DROP TABLE IF EXISTS `resourcedownloads`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `resourcedownloads` (
  `download_id` int NOT NULL AUTO_INCREMENT,
  `resource_id` int NOT NULL,
  `student_id` int NOT NULL,
  `download_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`download_id`),
  KEY `resource_id` (`resource_id`),
  KEY `student_id` (`student_id`),
  CONSTRAINT `resourcedownloads_ibfk_1` FOREIGN KEY (`resource_id`) REFERENCES `digitalresources` (`resource_id`),
  CONSTRAINT `resourcedownloads_ibfk_2` FOREIGN KEY (`student_id`) REFERENCES `students` (`student_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resourcedownloads`
--

LOCK TABLES `resourcedownloads` WRITE;
/*!40000 ALTER TABLE `resourcedownloads` DISABLE KEYS */;
INSERT INTO `resourcedownloads` VALUES (1,1,1,'2026-08-28 21:53:00'),(2,1,2,'2026-08-28 21:53:00'),(3,2,4,'2026-08-28 21:53:00'),(4,3,2,'2026-08-28 21:53:00'),(5,3,4,'2026-08-28 21:53:00'),(6,1,1,'2026-08-28 21:53:02'),(7,1,2,'2026-08-28 21:53:02'),(8,2,4,'2026-08-28 21:53:02'),(9,3,2,'2026-08-28 21:53:02'),(10,3,4,'2026-08-28 21:53:02'),(11,2,1,'2026-08-29 02:04:03'),(12,2,1,'2026-08-29 02:04:04'),(13,2,1,'2026-08-29 02:04:05'),(14,3,2,'2026-08-29 02:44:48'),(15,3,2,'2026-08-29 02:44:51');
/*!40000 ALTER TABLE `resourcedownloads` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `studentprogress`
--

DROP TABLE IF EXISTS `studentprogress`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `studentprogress` (
  `progress_id` int NOT NULL AUTO_INCREMENT,
  `enrolment_id` int NOT NULL,
  `activity_id` int NOT NULL,
  `status` varchar(20) NOT NULL DEFAULT 'Not Started',
  `points_earned` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`progress_id`),
  KEY `enrolment_id` (`enrolment_id`),
  KEY `activity_id` (`activity_id`),
  CONSTRAINT `studentprogress_ibfk_1` FOREIGN KEY (`enrolment_id`) REFERENCES `enrolments` (`enrolment_id`),
  CONSTRAINT `studentprogress_ibfk_2` FOREIGN KEY (`activity_id`) REFERENCES `learningactivities` (`activity_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `studentprogress`
--

LOCK TABLES `studentprogress` WRITE;
/*!40000 ALTER TABLE `studentprogress` DISABLE KEYS */;
/*!40000 ALTER TABLE `studentprogress` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `students`
--

DROP TABLE IF EXISTS `students`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `students` (
  `student_id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `account_status` varchar(20) NOT NULL DEFAULT 'Active',
  `account_expiry_date` date NOT NULL,
  `storage_limit_mb` decimal(8,2) NOT NULL DEFAULT '500.00',
  `storage_used_mb` decimal(8,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`student_id`),
  UNIQUE KEY `email` (`email`),
  KEY `idx_students_status` (`account_status`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `students`
--

LOCK TABLES `students` WRITE;
/*!40000 ALTER TABLE `students` DISABLE KEYS */;
INSERT INTO `students` VALUES (1,'Amahle','Zulu','amahle@student.edulaunch.co.za','hash1','Active','2027-01-15',500.00,0.00),(2,'Kagiso','Mahlangu','kagiso@student.edulaunch.co.za','hash2','Active','2027-02-20',500.00,25.00),(3,'Lerato','Sithole','lerato@student.edulaunch.co.za','hash3','Expired','2025-11-01',500.00,0.00),(4,'Sipho','Nkosi','sipho@student.edulaunch.co.za','hash4','Active','2026-12-01',10.00,0.00),(5,'Zanele','Botha','zanele@student.edulaunch.co.za','hash5','Blocked','2025-06-01',500.00,0.00);
/*!40000 ALTER TABLE `students` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `systemevents`
--

DROP TABLE IF EXISTS `systemevents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `systemevents` (
  `event_id` int NOT NULL AUTO_INCREMENT,
  `event_type` varchar(50) NOT NULL,
  `event_description` varchar(255) DEFAULT NULL,
  `student_id` int DEFAULT NULL,
  `event_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`event_id`),
  KEY `student_id` (`student_id`),
  KEY `idx_events_type` (`event_type`),
  CONSTRAINT `systemevents_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `students` (`student_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `systemevents`
--

LOCK TABLES `systemevents` WRITE;
/*!40000 ALTER TABLE `systemevents` DISABLE KEYS */;
INSERT INTO `systemevents` VALUES (1,'Unsuccessful Enrolment','Account is not active',3,'2026-08-29 01:36:11'),(2,'Unsuccessful Enrolment','Account is not active',3,'2026-08-29 01:36:12'),(3,'Unsuccessful Enrolment','Account is not active',3,'2026-08-29 01:36:14'),(4,'Storage Error','Not enough storage space remaining',4,'2026-08-29 02:04:46'),(5,'Storage Error','Not enough storage space remaining',4,'2026-08-29 02:04:51');
/*!40000 ALTER TABLE `systemevents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `vw_blockedaccounts`
--

DROP TABLE IF EXISTS `vw_blockedaccounts`;
/*!50001 DROP VIEW IF EXISTS `vw_blockedaccounts`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_blockedaccounts` AS SELECT 
 1 AS `student_id`,
 1 AS `first_name`,
 1 AS `last_name`,
 1 AS `account_status`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_frequentlydownloadedresources`
--

DROP TABLE IF EXISTS `vw_frequentlydownloadedresources`;
/*!50001 DROP VIEW IF EXISTS `vw_frequentlydownloadedresources`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_frequentlydownloadedresources` AS SELECT 
 1 AS `resource_id`,
 1 AS `resource_name`,
 1 AS `resource_type`,
 1 AS `total_downloads`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_popularprogrammes`
--

DROP TABLE IF EXISTS `vw_popularprogrammes`;
/*!50001 DROP VIEW IF EXISTS `vw_popularprogrammes`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_popularprogrammes` AS SELECT 
 1 AS `programme_id`,
 1 AS `programme_name`,
 1 AS `programme_type`,
 1 AS `capacity`,
 1 AS `total_enrolments`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_topperformingstudents`
--

DROP TABLE IF EXISTS `vw_topperformingstudents`;
/*!50001 DROP VIEW IF EXISTS `vw_topperformingstudents`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_topperformingstudents` AS SELECT 
 1 AS `student_id`,
 1 AS `first_name`,
 1 AS `last_name`,
 1 AS `average_marks`,
 1 AS `average_readiness_score`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `vw_blockedaccounts`
--

/*!50001 DROP VIEW IF EXISTS `vw_blockedaccounts`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_blockedaccounts` AS select `students`.`student_id` AS `student_id`,`students`.`first_name` AS `first_name`,`students`.`last_name` AS `last_name`,`students`.`account_status` AS `account_status` from `students` where (`students`.`account_status` in ('Blocked','Expired')) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_frequentlydownloadedresources`
--

/*!50001 DROP VIEW IF EXISTS `vw_frequentlydownloadedresources`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_frequentlydownloadedresources` AS select `r`.`resource_id` AS `resource_id`,`r`.`resource_name` AS `resource_name`,`r`.`resource_type` AS `resource_type`,count(`d`.`download_id`) AS `total_downloads` from (`digitalresources` `r` left join `resourcedownloads` `d` on((`r`.`resource_id` = `d`.`resource_id`))) group by `r`.`resource_id`,`r`.`resource_name`,`r`.`resource_type` order by `total_downloads` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_popularprogrammes`
--

/*!50001 DROP VIEW IF EXISTS `vw_popularprogrammes`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_popularprogrammes` AS select `p`.`programme_id` AS `programme_id`,`p`.`programme_name` AS `programme_name`,`p`.`programme_type` AS `programme_type`,`p`.`capacity` AS `capacity`,count(`e`.`enrolment_id`) AS `total_enrolments` from (`programmes` `p` left join `enrolments` `e` on((`p`.`programme_id` = `e`.`programme_id`))) group by `p`.`programme_id`,`p`.`programme_name`,`p`.`programme_type`,`p`.`capacity` order by `total_enrolments` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_topperformingstudents`
--

/*!50001 DROP VIEW IF EXISTS `vw_topperformingstudents`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_topperformingstudents` AS select `s`.`student_id` AS `student_id`,`s`.`first_name` AS `first_name`,`s`.`last_name` AS `last_name`,round(avg(`ar`.`marks_obtained`),2) AS `average_marks`,round(avg(`ar`.`career_readiness_score`),2) AS `average_readiness_score` from (`students` `s` join `assessmentresults` `ar` on((`s`.`student_id` = `ar`.`student_id`))) group by `s`.`student_id`,`s`.`first_name`,`s`.`last_name` order by `average_marks` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
SET @@SESSION.SQL_LOG_BIN = @MYSQLDUMP_TEMP_LOG_BIN;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-08-29  3:32:55
