CREATE DATABASE  IF NOT EXISTS `gogomoney03-02` /*!40100 DEFAULT CHARACTER SET utf8 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `gogomoney03-02`;
-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: localhost    Database: gogomoney03-02
-- ------------------------------------------------------
-- Server version	8.0.28

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

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `category_id` int NOT NULL AUTO_INCREMENT,
  `category_name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'Housing'),(2,'Insurance'),(3,'Savings'),(4,'Utilities'),(5,'Essentials'),(6,'Healthcare'),(7,'Transportation'),(8,'Recreation/Entertainment'),(9,'Personal'),(10,'Other'),(11,'Income');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `income`
--

DROP TABLE IF EXISTS `income`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `income` (
  `income_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `amount` double DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `category_id` int DEFAULT NULL,
  `recurring` varchar(25) DEFAULT 'FALSE',
  `recur_interval` varchar(25) NOT NULL,
  `recurr_day` int DEFAULT NULL,
  `recurr_count` int DEFAULT NULL,
  `transaction_date` date DEFAULT NULL,
  `entry_date` date DEFAULT NULL,
  PRIMARY KEY (`income_id`),
  KEY `in_category_key_idx` (`category_id`),
  KEY `in_user_key_idx` (`user_id`),
  CONSTRAINT `in_category_fkey` FOREIGN KEY (`category_id`) REFERENCES `category` (`category_id`),
  CONSTRAINT `in_user_fkey` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `income`
--

LOCK TABLES `income` WRITE;
/*!40000 ALTER TABLE `income` DISABLE KEYS */;
INSERT INTO `income` VALUES (1,'Pay-Check',400,1,11,'FALSE','Once',0,0,'2022-03-01','2022-04-01'),(2,'Pay-Check',390,1,11,'FALSE','Once',0,0,'2022-03-08','2022-04-01'),(3,'Pay-Check',440,1,11,'FALSE','Once',0,0,'2022-03-15','2022-04-01'),(4,'Gift',20,1,11,'FALSE','Once',0,0,'2022-03-17','2022-04-01'),(5,'Royalties',500,2,11,'FALSE','Once',0,0,'2022-03-19','2022-04-01');
/*!40000 ALTER TABLE `income` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `outcome`
--

DROP TABLE IF EXISTS `outcome`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `outcome` (
  `outcome_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `amount` double DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `category_id` int DEFAULT NULL,
  `recurring` varchar(25) DEFAULT 'FALSE',
  `recur_interval` varchar(25) NOT NULL,
  `recurr_day` int DEFAULT NULL,
  `recurr_count` int DEFAULT NULL,
  `transaction_date` date DEFAULT NULL,
  `entry_date` date DEFAULT NULL,
  PRIMARY KEY (`outcome_id`),
  KEY `out_category_key_idx` (`category_id`),
  KEY `in_user_key_idx` (`user_id`),
  CONSTRAINT `out_category_fkey` FOREIGN KEY (`category_id`) REFERENCES `category` (`category_id`),
  CONSTRAINT `out_user_fkey` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `outcome`
--

LOCK TABLES `outcome` WRITE;
/*!40000 ALTER TABLE `outcome` DISABLE KEYS */;
INSERT INTO `outcome` VALUES (1,'Rent',1200,1,1,'TRUE','Monthly',1,11,'2022-04-01','2022-04-01'),(2,'Netflix',20,1,8,'TRUE','Monthly',15,5,'2022-03-15','2022-04-01'),(3,'Groceries',55,1,5,'FALSE','Once',0,0,'2022-03-28','2022-04-01'),(4,'Gas',80,2,7,'FALSE','Once',0,0,'2022-03-17','2022-04-01'),(5,'Charitable Donation',3000,3,10,'FALSE','Once',0,0,'2022-03-19','2022-04-01');
/*!40000 ALTER TABLE `outcome` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `user_first_name` varchar(45) DEFAULT NULL,
  `user_last_name` varchar(45) DEFAULT NULL,
  `password` varchar(250) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `start_balance` double DEFAULT NULL,
  `amount_to_save` double DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'Henry','Mangelsdorf','washtenaw123','henry@gmail.com',0,NULL),(2,'David','Bowie','labryinth44','goblinking@msn.com',0,NULL),(3,'Keanu','Reeves','billandted3','reeves@gmail.com',0,NULL);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-04-06 18:57:52
