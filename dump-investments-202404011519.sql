-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: localhost    Database: investments
-- ------------------------------------------------------
-- Server version	8.0.35

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

--
-- Table structure for table `crypto`
--

DROP TABLE IF EXISTS `crypto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `crypto` (
  `Ticker` char(3) NOT NULL,
  `Date_time` date NOT NULL,
  `price` int DEFAULT NULL,
  `Volume` int DEFAULT NULL,
  `Market_cap` int DEFAULT NULL,
  `opens` int DEFAULT NULL,
  `High` int DEFAULT NULL,
  `low` int DEFAULT NULL,
  `closes` int DEFAULT NULL,
  PRIMARY KEY (`Ticker`),
  KEY `Date_time` (`Date_time`),
  CONSTRAINT `crypto_ibfk_1` FOREIGN KEY (`Date_time`) REFERENCES `dates` (`Date_Time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `crypto`
--

LOCK TABLES `crypto` WRITE;
/*!40000 ALTER TABLE `crypto` DISABLE KEYS */;
INSERT INTO `crypto` VALUES ('BTC','2019-03-13',10000,100000,1000000,9999,10000,8000,10000);
/*!40000 ALTER TABLE `crypto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dates`
--

DROP TABLE IF EXISTS `dates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dates` (
  `Date_Time` date NOT NULL,
  PRIMARY KEY (`Date_Time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dates`
--

LOCK TABLES `dates` WRITE;
/*!40000 ALTER TABLE `dates` DISABLE KEYS */;
INSERT INTO `dates` VALUES ('2019-03-13'),('2020-03-13'),('2021-03-13');
/*!40000 ALTER TABLE `dates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `money_tran`
--

DROP TABLE IF EXISTS `money_tran`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `money_tran` (
  `Amount_tran` int NOT NULL,
  `Location_id` int DEFAULT NULL,
  `Name_location` char(10) DEFAULT NULL,
  `Money_type_id` int DEFAULT NULL,
  `Date_Time` date NOT NULL,
  PRIMARY KEY (`Amount_tran`),
  KEY `Date_Time` (`Date_Time`),
  KEY `Money_type_id` (`Money_type_id`),
  CONSTRAINT `money_tran_ibfk_1` FOREIGN KEY (`Date_Time`) REFERENCES `dates` (`Date_Time`),
  CONSTRAINT `money_tran_ibfk_2` FOREIGN KEY (`Money_type_id`) REFERENCES `money_type` (`Money_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `money_tran`
--

LOCK TABLES `money_tran` WRITE;
/*!40000 ALTER TABLE `money_tran` DISABLE KEYS */;
INSERT INTO `money_tran` VALUES (2000,1,'Santander',2,'2019-03-13'),(3000,2,'BBVA',2,'2019-03-13'),(4000,3,'Vault',1,'2019-03-13');
/*!40000 ALTER TABLE `money_tran` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `money_type`
--

DROP TABLE IF EXISTS `money_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `money_type` (
  `Money_type_id` int NOT NULL,
  `Name` char(8) DEFAULT NULL,
  PRIMARY KEY (`Money_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `money_type`
--

LOCK TABLES `money_type` WRITE;
/*!40000 ALTER TABLE `money_type` DISABLE KEYS */;
INSERT INTO `money_type` VALUES (1,'Physical'),(2,'virtual');
/*!40000 ALTER TABLE `money_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `savings`
--

DROP TABLE IF EXISTS `savings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `savings` (
  `Amount_savings` int NOT NULL,
  `Location_id` int DEFAULT NULL,
  `Name_location` char(10) DEFAULT NULL,
  `Money_type_id` int DEFAULT NULL,
  `Date_Time` date NOT NULL,
  PRIMARY KEY (`Amount_savings`),
  KEY `Date_Time` (`Date_Time`),
  KEY `Money_type_id` (`Money_type_id`),
  CONSTRAINT `savings_ibfk_1` FOREIGN KEY (`Date_Time`) REFERENCES `dates` (`Date_Time`),
  CONSTRAINT `savings_ibfk_2` FOREIGN KEY (`Money_type_id`) REFERENCES `money_type` (`Money_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `savings`
--

LOCK TABLES `savings` WRITE;
/*!40000 ALTER TABLE `savings` DISABLE KEYS */;
INSERT INTO `savings` VALUES (2000,1,'Santander',2,'2019-03-13'),(3000,2,'BBVA',2,'2019-03-13'),(4000,3,'Vault',1,'2019-03-13');
/*!40000 ALTER TABLE `savings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transactions`
--

DROP TABLE IF EXISTS `transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transactions` (
  `Transactions_id` int NOT NULL,
  `Date_time` date NOT NULL,
  `Transactions_type_id` int DEFAULT NULL,
  `Ticker` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`Transactions_id`),
  KEY `Ticker` (`Ticker`),
  KEY `Date_time` (`Date_time`),
  KEY `Transactions_type_id` (`Transactions_type_id`),
  CONSTRAINT `transactions_ibfk_1` FOREIGN KEY (`Ticker`) REFERENCES `crypto` (`Ticker`),
  CONSTRAINT `transactions_ibfk_2` FOREIGN KEY (`Date_time`) REFERENCES `dates` (`Date_Time`),
  CONSTRAINT `transactions_ibfk_3` FOREIGN KEY (`Transactions_type_id`) REFERENCES `transactions_type` (`Transactions_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transactions`
--

LOCK TABLES `transactions` WRITE;
/*!40000 ALTER TABLE `transactions` DISABLE KEYS */;
INSERT INTO `transactions` VALUES (1,'2021-03-13',1,'BTC');
/*!40000 ALTER TABLE `transactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transactions_type`
--

DROP TABLE IF EXISTS `transactions_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transactions_type` (
  `Transactions_type_id` int NOT NULL,
  `Name` char(3) DEFAULT NULL,
  PRIMARY KEY (`Transactions_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transactions_type`
--

LOCK TABLES `transactions_type` WRITE;
/*!40000 ALTER TABLE `transactions_type` DISABLE KEYS */;
INSERT INTO `transactions_type` VALUES (1,'BUY');
/*!40000 ALTER TABLE `transactions_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'investments'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-04-01 15:19:23
