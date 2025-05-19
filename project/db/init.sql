-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: jwxt
-- ------------------------------------------------------
-- Server version	8.0.36

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

ALTER USER 'root'@'%' IDENTIFIED WITH mysql_native_password BY '123456';
FLUSH PRIVILEGES;

--
-- Table structure for table `course`
--
CREATE DATABASE testdb;
USE testdb;

DROP TABLE IF EXISTS `course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `course` (
  `cno` varchar(20) NOT NULL COMMENT '课程号（主键）',
  `cname` varchar(20) DEFAULT NULL COMMENT '课程名称',
  `tno` varchar(20) DEFAULT NULL COMMENT '教工编号',
  PRIMARY KEY (`cno`),
  KEY `course_teacher_FK` (`tno`),
  CONSTRAINT `course_teacher_FK` FOREIGN KEY (`tno`) REFERENCES `teacher` (`tno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='课程表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course`
--

LOCK TABLES `course` WRITE;
/*!40000 ALTER TABLE `course` DISABLE KEYS */;
INSERT INTO `course` VALUES ('3-105','计算机导论','825'),('3-245','操作系统','804'),('6-166','数字电路','856'),('6-167','数据库技术',NULL),('9-888','高等数学','831');
/*!40000 ALTER TABLE `course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `score`
--

DROP TABLE IF EXISTS `score`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `score` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键自增',
  `sno` varchar(20) DEFAULT NULL COMMENT '学号',
  `cno` varchar(20) DEFAULT NULL COMMENT '课程号',
  `degree` decimal(4,1) DEFAULT NULL COMMENT '成绩',
  PRIMARY KEY (`id`),
  KEY `score_student_FK` (`sno`),
  KEY `score_course_FK` (`cno`),
  CONSTRAINT `score_course_FK` FOREIGN KEY (`cno`) REFERENCES `course` (`cno`),
  CONSTRAINT `score_student_FK` FOREIGN KEY (`sno`) REFERENCES `student` (`sno`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='成绩表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `score`
--

LOCK TABLES `score` WRITE;
/*!40000 ALTER TABLE `score` DISABLE KEYS */;
INSERT INTO `score` VALUES (1,'103','3-245',80.0),(2,'105','3-245',75.0),(3,'109','9-888',60.0),(4,'103','3-105',92.0),(5,'105','3-105',88.0),(6,'109','3-105',76.0),(7,'101','3-105',64.0),(8,'107','3-105',91.0),(9,'108','3-105',78.0),(10,'101','6-166',85.0),(11,'107','6-166',79.0),(12,'108','6-166',81.0);
/*!40000 ALTER TABLE `score` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student` (
  `sno` varchar(20) NOT NULL COMMENT '学号(主键)',
  `sname` varchar(20) DEFAULT NULL COMMENT '姓名',
  `ssex` varchar(20) DEFAULT NULL COMMENT '学生性别',
  `sbirthday` date DEFAULT NULL COMMENT '学生出生年月',
  `class` varchar(20) DEFAULT NULL COMMENT '学生所在班级',
  `monitor_sno` varchar(20) DEFAULT NULL COMMENT '班长学号',
  PRIMARY KEY (`sno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='学生信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` VALUES ('101','李军','男','2002-09-01','23033','101'),('103','陆君','男','2002-09-01','23031','103'),('105','匡明','男','2001-09-01','23031','103'),('107','王丽','女','2001-09-01','23033','101'),('108','曾华','男','2003-09-01','23033','101'),('109','王芳','女','2001-09-01','23031','103');
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teacher`
--

DROP TABLE IF EXISTS `teacher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teacher` (
  `tno` varchar(20) NOT NULL COMMENT '教工编号(主键)',
  `tname` varchar(20) DEFAULT NULL COMMENT '教工姓名',
  `tsex` varchar(20) DEFAULT NULL COMMENT '教工性别',
  `tbirthday` date DEFAULT NULL COMMENT '教工出生年月',
  `prof` varchar(20) DEFAULT NULL COMMENT '职称',
  `depart` varchar(20) DEFAULT NULL COMMENT '教工所在部门',
  PRIMARY KEY (`tno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='教师表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teacher`
--

LOCK TABLES `teacher` WRITE;
/*!40000 ALTER TABLE `teacher` DISABLE KEYS */;
INSERT INTO `teacher` VALUES ('804','李诚','男','1975-12-02','副教授','计算机系'),('825','王萍','女','1992-05-05','助教','计算机系'),('831','刘冰','女','1988-08-14','助教','电子工程系'),('856','张旭','男','1989-03-12','讲师','电子工程系'),('859','张兰','女','1989-03-12','讲师','电子工程系'),('868','胡洋','女','1983-06-20','助教','计算机系');
/*!40000 ALTER TABLE `teacher` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-03-22 11:35:24
