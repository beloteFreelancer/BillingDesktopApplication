-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: Swayam_main
-- ------------------------------------------------------
-- Server version	8.0.34

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
-- Table structure for table `access_requests`
--

DROP TABLE IF EXISTS `access_requests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `access_requests` (
  `hwid` varchar(255) NOT NULL,
  `label` varchar(255) DEFAULT NULL,
  `request_time` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`hwid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `access_requests`
--

LOCK TABLES `access_requests` WRITE;
/*!40000 ALTER TABLE `access_requests` DISABLE KEYS */;
/*!40000 ALTER TABLE `access_requests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `account_master`
--

DROP TABLE IF EXISTS `account_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `account_master` (
  `head` varchar(100) NOT NULL,
  `under` varchar(25) NOT NULL,
  `debit` double NOT NULL DEFAULT '0',
  `credit` double NOT NULL DEFAULT '0',
  PRIMARY KEY (`head`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_master`
--

LOCK TABLES `account_master` WRITE;
/*!40000 ALTER TABLE `account_master` DISABLE KEYS */;
/*!40000 ALTER TABLE `account_master` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `account_transfer`
--

DROP TABLE IF EXISTS `account_transfer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `account_transfer` (
  `billno` int NOT NULL,
  `dat` date NOT NULL,
  `category` varchar(25) NOT NULL,
  `account` varchar(100) NOT NULL,
  `amount` double NOT NULL DEFAULT '0',
  `remarks` varchar(100) NOT NULL,
  `user` varchar(15) NOT NULL,
  `last` varchar(25) NOT NULL,
  PRIMARY KEY (`billno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_transfer`
--

LOCK TABLES `account_transfer` WRITE;
/*!40000 ALTER TABLE `account_transfer` DISABLE KEYS */;
/*!40000 ALTER TABLE `account_transfer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `account_voucher`
--

DROP TABLE IF EXISTS `account_voucher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `account_voucher` (
  `billno` int NOT NULL,
  `dat` date NOT NULL,
  `whom` varchar(100) NOT NULL,
  `what` varchar(100) NOT NULL,
  `amount` double NOT NULL,
  `pby` varchar(15) NOT NULL,
  `ano` varchar(25) NOT NULL,
  `account` varchar(100) NOT NULL,
  `entry` varchar(10) NOT NULL,
  `remarks` varchar(100) NOT NULL,
  `user` varchar(15) NOT NULL,
  `last` varchar(25) NOT NULL,
  `under` varchar(25) NOT NULL,
  PRIMARY KEY (`billno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_voucher`
--

LOCK TABLES `account_voucher` WRITE;
/*!40000 ALTER TABLE `account_voucher` DISABLE KEYS */;
/*!40000 ALTER TABLE `account_voucher` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `alter_estimate`
--

DROP TABLE IF EXISTS `alter_estimate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `alter_estimate` (
  `billno` int NOT NULL,
  `dat` date NOT NULL,
  `tim` varchar(15) NOT NULL,
  `cashier` varchar(20) NOT NULL,
  `terminal` varchar(20) NOT NULL,
  `cid` varchar(20) NOT NULL,
  `cname` varchar(100) NOT NULL,
  `pby` varchar(20) NOT NULL,
  `amount` double NOT NULL,
  `newamount` double NOT NULL,
  `reason` varchar(100) NOT NULL,
  `user` varchar(15) NOT NULL,
  `last` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alter_estimate`
--

LOCK TABLES `alter_estimate` WRITE;
/*!40000 ALTER TABLE `alter_estimate` DISABLE KEYS */;
/*!40000 ALTER TABLE `alter_estimate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `alter_estimate_delete`
--

DROP TABLE IF EXISTS `alter_estimate_delete`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `alter_estimate_delete` (
  `billno` int NOT NULL,
  `dat` date NOT NULL,
  `tim` varchar(15) NOT NULL,
  `cashier` varchar(20) NOT NULL,
  `terminal` varchar(20) NOT NULL,
  `cid` varchar(20) NOT NULL,
  `cname` varchar(100) NOT NULL,
  `pby` varchar(20) NOT NULL,
  `amount` double NOT NULL,
  `newamount` double NOT NULL,
  `reason` varchar(100) NOT NULL,
  `user` varchar(15) NOT NULL,
  `last` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alter_estimate_delete`
--

LOCK TABLES `alter_estimate_delete` WRITE;
/*!40000 ALTER TABLE `alter_estimate_delete` DISABLE KEYS */;
/*!40000 ALTER TABLE `alter_estimate_delete` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `alter_sales`
--

DROP TABLE IF EXISTS `alter_sales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `alter_sales` (
  `billno` int NOT NULL,
  `dat` date NOT NULL,
  `tim` varchar(15) NOT NULL,
  `cashier` varchar(20) NOT NULL,
  `terminal` varchar(20) NOT NULL,
  `cid` varchar(20) NOT NULL,
  `cname` varchar(100) NOT NULL,
  `pby` varchar(20) NOT NULL,
  `amount` double NOT NULL,
  `newamount` double NOT NULL,
  `reason` varchar(100) NOT NULL,
  `user` varchar(15) NOT NULL,
  `last` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alter_sales`
--

LOCK TABLES `alter_sales` WRITE;
/*!40000 ALTER TABLE `alter_sales` DISABLE KEYS */;
/*!40000 ALTER TABLE `alter_sales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `alter_sales_delete`
--

DROP TABLE IF EXISTS `alter_sales_delete`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `alter_sales_delete` (
  `billno` int NOT NULL,
  `dat` date NOT NULL,
  `tim` varchar(15) NOT NULL,
  `cashier` varchar(20) NOT NULL,
  `terminal` varchar(20) NOT NULL,
  `cid` varchar(20) NOT NULL,
  `cname` varchar(100) NOT NULL,
  `pby` varchar(20) NOT NULL,
  `amount` double NOT NULL,
  `newamount` double NOT NULL,
  `reason` varchar(100) NOT NULL,
  `user` varchar(15) NOT NULL,
  `last` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alter_sales_delete`
--

LOCK TABLES `alter_sales_delete` WRITE;
/*!40000 ALTER TABLE `alter_sales_delete` DISABLE KEYS */;
/*!40000 ALTER TABLE `alter_sales_delete` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_sync_status`
--

DROP TABLE IF EXISTS `app_sync_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app_sync_status` (
  `id` int NOT NULL AUTO_INCREMENT,
  `license_uname` varchar(255) DEFAULT NULL,
  `license_cid` varchar(100) DEFAULT NULL,
  `last_cloud_sync` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_sync_status`
--

LOCK TABLES `app_sync_status` WRITE;
/*!40000 ALTER TABLE `app_sync_status` DISABLE KEYS */;
/*!40000 ALTER TABLE `app_sync_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `atten_entry`
--

DROP TABLE IF EXISTS `atten_entry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `atten_entry` (
  `dat` date NOT NULL,
  `sid` varchar(20) NOT NULL DEFAULT '',
  `sname` varchar(100) NOT NULL DEFAULT '',
  `desig` varchar(100) NOT NULL DEFAULT '',
  `status` varchar(100) NOT NULL DEFAULT '',
  `value` varchar(100) NOT NULL DEFAULT '',
  `remarks` varchar(100) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `atten_entry`
--

LOCK TABLES `atten_entry` WRITE;
/*!40000 ALTER TABLE `atten_entry` DISABLE KEYS */;
/*!40000 ALTER TABLE `atten_entry` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `authorized_terminals`
--

DROP TABLE IF EXISTS `authorized_terminals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `authorized_terminals` (
  `hwid` varchar(255) NOT NULL,
  `label` varchar(255) DEFAULT NULL,
  `first_seen` datetime DEFAULT NULL,
  PRIMARY KEY (`hwid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authorized_terminals`
--

LOCK TABLES `authorized_terminals` WRITE;
/*!40000 ALTER TABLE `authorized_terminals` DISABLE KEYS */;
/*!40000 ALTER TABLE `authorized_terminals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bank`
--

DROP TABLE IF EXISTS `bank`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bank` (
  `ano` varchar(20) NOT NULL,
  `aname` varchar(100) NOT NULL,
  `bank` varchar(100) NOT NULL,
  `branch` varchar(100) NOT NULL,
  `ifsc` varchar(20) NOT NULL,
  `remarks` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bank`
--

LOCK TABLES `bank` WRITE;
/*!40000 ALTER TABLE `bank` DISABLE KEYS */;
/*!40000 ALTER TABLE `bank` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `barcode`
--

DROP TABLE IF EXISTS `barcode`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `barcode` (
  `barcode` varchar(20) NOT NULL,
  `ino` int NOT NULL,
  `iname` varchar(100) NOT NULL,
  `mrp` varchar(30) NOT NULL,
  `retail_price` varchar(30) NOT NULL,
  `wholesale_price` varchar(30) NOT NULL,
  `iname1` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `barcode`
--

LOCK TABLES `barcode` WRITE;
/*!40000 ALTER TABLE `barcode` DISABLE KEYS */;
INSERT INTO `barcode` VALUES ('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D'),('1000',1,'PAN D','MRP: 200.00','S.Price: 180.00','S.Price: 150.00','PAN D');
/*!40000 ALTER TABLE `barcode` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `barcode_layout_settings`
--

DROP TABLE IF EXISTS `barcode_layout_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `barcode_layout_settings` (
  `company_name` varchar(100) NOT NULL,
  `barcode_type` varchar(20) DEFAULT NULL,
  `barcode_width` double DEFAULT NULL,
  `barcode_height` double DEFAULT NULL,
  `font_size` double DEFAULT NULL,
  `is_auto_layout` tinyint(1) DEFAULT '1',
  `stickers_per_column` int DEFAULT '10',
  `stickers_per_row` int DEFAULT '3',
  `horizontal_gap` double DEFAULT '2',
  `vertical_gap` double DEFAULT '2',
  `page_width` double DEFAULT '210',
  `page_type` varchar(30) DEFAULT 'A4 Sheet (Full Page)',
  `margin_left` double DEFAULT '0',
  `margin_top` double DEFAULT '0',
  PRIMARY KEY (`company_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `barcode_layout_settings`
--

LOCK TABLES `barcode_layout_settings` WRITE;
/*!40000 ALTER TABLE `barcode_layout_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `barcode_layout_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `barcode_settings`
--

DROP TABLE IF EXISTS `barcode_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `barcode_settings` (
  `company_name` varchar(100) NOT NULL,
  `field_name` varchar(50) NOT NULL,
  `include` tinyint(1) DEFAULT NULL,
  `x_pos` int DEFAULT '10',
  `y_pos` int DEFAULT '10',
  `font_size` int DEFAULT '10',
  PRIMARY KEY (`company_name`,`field_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `barcode_settings`
--

LOCK TABLES `barcode_settings` WRITE;
/*!40000 ALTER TABLE `barcode_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `barcode_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `barcode_templates`
--

DROP TABLE IF EXISTS `barcode_templates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `barcode_templates` (
  `name` varchar(255) NOT NULL,
  `jrxml_data` text NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `barcode_templates`
--

LOCK TABLES `barcode_templates` WRITE;
/*!40000 ALTER TABLE `barcode_templates` DISABLE KEYS */;
/*!40000 ALTER TABLE `barcode_templates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `company`
--

DROP TABLE IF EXISTS `company`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `company` (
  `cname` varchar(250) NOT NULL,
  `add1` varchar(250) NOT NULL,
  `add2` varchar(250) NOT NULL,
  `add3` varchar(250) NOT NULL,
  `add4` varchar(250) NOT NULL,
  `state` varchar(50) NOT NULL,
  `scode` varchar(10) NOT NULL,
  `ttype` varchar(25) NOT NULL,
  `letter` varchar(10) NOT NULL,
  `bformat` varchar(40) NOT NULL,
  `bhead` varchar(100) NOT NULL,
  `sms1` varchar(250) NOT NULL,
  `sms2` varchar(250) NOT NULL,
  `sms3` varchar(250) NOT NULL,
  `sms4` varchar(250) NOT NULL,
  `lmargin` double NOT NULL,
  `maxdis` double NOT NULL,
  `lines1` int NOT NULL,
  `port` varchar(10) NOT NULL,
  `rprice` varchar(30) NOT NULL,
  `wprice` varchar(30) NOT NULL,
  `stock_bill` varchar(5) NOT NULL,
  `print_name` varchar(25) NOT NULL,
  `less_prate` varchar(5) NOT NULL,
  `last` varchar(25) NOT NULL,
  `rdis` double NOT NULL,
  `wdis` double NOT NULL,
  `entry_mode` varchar(10) NOT NULL,
  `bformat1` varchar(40) NOT NULL,
  `pur_rate_edit` varchar(5) NOT NULL,
  `cust_details` varchar(5) NOT NULL,
  `dsales` varchar(10) NOT NULL,
  `ehead` varchar(100) NOT NULL,
  `eformat1` varchar(40) NOT NULL,
  `eformat2` varchar(40) NOT NULL,
  `hmany` int NOT NULL DEFAULT '0',
  `round` varchar(5) NOT NULL DEFAULT '0',
  `cur_name` varchar(20) NOT NULL DEFAULT '0',
  `cur_symbol` varchar(10) NOT NULL DEFAULT '0',
  `upi_id` varchar(150) DEFAULT NULL,
  `batch` varchar(10) DEFAULT 'Batch',
  `exp` tinyint(1) DEFAULT NULL,
  `mfg` tinyint(1) DEFAULT NULL,
  `weighing_button` varchar(5) NOT NULL DEFAULT 'Yes',
  `logo_path` varchar(255) DEFAULT NULL,
  `companyID` varchar(50) DEFAULT NULL,
  `shop_type` varchar(30) DEFAULT 'General',
  `bank_name` varchar(150) DEFAULT '',
  `bank_acc_no` varchar(50) DEFAULT '',
  `bank_ifsc` varchar(20) DEFAULT '',
  `bank_branch` varchar(150) DEFAULT '',
  `bank_holder` varchar(150) DEFAULT '',
  `sales_terms` text,
  `estimate_terms` text,
  `estimate_stock_minus` varchar(5) NOT NULL DEFAULT 'No',
  `privacy_mode` varchar(5) NOT NULL DEFAULT 'No',
  `dl` varchar(100) NOT NULL DEFAULT '',
  CONSTRAINT `company_chk_1` CHECK ((`batch` in (_utf8mb4'Batch',_utf8mb4'Size')))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `company`
--

LOCK TABLES `company` WRITE;
/*!40000 ALTER TABLE `company` DISABLE KEYS */;
INSERT INTO `company` VALUES ('Ambika store','S no 29/1 ,anandnagar ,manajri road','Pune 411039','.','123456789','Maharashtra','.','Inclusive of Tax','.','Sales 3-Inch (Thermal)','Invoice ','','','','',0,0,11,'PRN','MRP Price','MRP Price','No','Same as Item Name','No','21-03-2026 06:35:26 pm',0,0,'Auto','Sales 3-Inch (Thermal)','No','Yes','Retail','Estimate','Thermal 4-Inch','Thermal 4-Inch',2,'Yes','.','.','7588168856-2@ibl','Batch',0,0,'No','D:\\\\\\\\\\\\\\\\icon.png','1','Clothing','PAYTM BANK','7588168856','PAYTM123456','Noida','Sandip','Payment is due within 30 days of the invoice date [Net 30].\nAccepted payment methods: Bank Transfer, Credit Card, or Check.\nAll payments must be made in ','This estimate is valid for 30 days from the date issued. Prices are subject to change after this period.','No','Yes',''),('Om Sai pharama','Mumbai','.','.','.','Maharashtra','.','Inclusive of Tax','.','Sales A4','.','','','','',0,0,11,'PRN','MRP Price','MRP Price','No','Same as Item Name','No','21-03-2026 08:20:30 pm',0,0,'Auto','Sales A4','No','Yes','Retail','.','A4','A4',2,'Yes','.','.','7588168856-2@ibl','Batch',1,1,'No','D:icon.png','2','Pharmacy','','','','','',NULL,NULL,'No','Yes','');
/*!40000 ALTER TABLE `company` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cust`
--

DROP TABLE IF EXISTS `cust`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cust` (
  `cid` int NOT NULL,
  `ctype` varchar(15) NOT NULL,
  `cardno` varchar(20) NOT NULL,
  `cname` varchar(100) NOT NULL,
  `add1` varchar(250) NOT NULL,
  `add2` varchar(250) NOT NULL,
  `add3` varchar(250) NOT NULL,
  `city` varchar(100) NOT NULL,
  `mobile` varchar(10) NOT NULL,
  `phone` varchar(60) NOT NULL,
  `gstno` varchar(15) NOT NULL,
  `sname` varchar(50) NOT NULL,
  `scode` varchar(5) NOT NULL,
  `climit` double NOT NULL,
  `duedays` int NOT NULL,
  `interest_rate` double NOT NULL DEFAULT '0',
  `remarks` varchar(250) NOT NULL,
  `email` varchar(100) NOT NULL,
  `company_id` varchar(50) NOT NULL DEFAULT '',
  `dl` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`cid`,`company_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cust`
--

LOCK TABLES `cust` WRITE;
/*!40000 ALTER TABLE `cust` DISABLE KEYS */;
INSERT INTO `cust` VALUES (1,'General','1','Sandip Belote','.','.','.','.','7588168856','.','.','Maharashtra','.',10000,30,10,'.','.','1','.'),(1,'General','1','shital Belote','.','.','.','.','7581435456','.','.','Maharashtra','.',10000,30,10,'.','.','2','.');
/*!40000 ALTER TABLE `cust` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cust_bal`
--

DROP TABLE IF EXISTS `cust_bal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cust_bal` (
  `billno` varchar(20) NOT NULL DEFAULT '',
  `dat` date NOT NULL,
  `ddate` date NOT NULL,
  `cid` varchar(20) NOT NULL,
  `cname` varchar(100) NOT NULL,
  `tot` double NOT NULL,
  `paid` double NOT NULL,
  `last` varchar(25) NOT NULL DEFAULT '',
  `company_id` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cust_bal`
--

LOCK TABLES `cust_bal` WRITE;
/*!40000 ALTER TABLE `cust_bal` DISABLE KEYS */;
INSERT INTO `cust_bal` VALUES ('105','2026-03-29','2026-04-28','1','Sandip Belote',2250,2250,'29/03/2026 09:39:27 pm','1'),('33','2026-03-29','2026-04-28','1','shital Belote',162,162,'29/03/2026 10:40:04 pm','2');
/*!40000 ALTER TABLE `cust_bal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cust_bill`
--

DROP TABLE IF EXISTS `cust_bill`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cust_bill` (
  `sno` int NOT NULL,
  `cid` varchar(20) NOT NULL DEFAULT '',
  `cname` varchar(100) NOT NULL DEFAULT '',
  `billno` varchar(100) NOT NULL DEFAULT '',
  `dat` date NOT NULL,
  `ddate` date NOT NULL,
  `amount` double NOT NULL DEFAULT '0',
  `user` varchar(15) NOT NULL DEFAULT '0',
  `last` varchar(25) NOT NULL DEFAULT '0',
  `company_id` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`sno`,`company_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cust_bill`
--

LOCK TABLES `cust_bill` WRITE;
/*!40000 ALTER TABLE `cust_bill` DISABLE KEYS */;
/*!40000 ALTER TABLE `cust_bill` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cust_pay`
--

DROP TABLE IF EXISTS `cust_pay`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cust_pay` (
  `sno` int NOT NULL,
  `dat` date NOT NULL,
  `tim` varchar(15) NOT NULL,
  `cid` varchar(20) NOT NULL,
  `cname` varchar(100) NOT NULL,
  `billno` varchar(20) NOT NULL,
  `amount` double NOT NULL,
  `net` double NOT NULL,
  `pby` varchar(10) NOT NULL,
  `remarks` varchar(100) NOT NULL,
  `user` varchar(15) NOT NULL,
  `last` varchar(25) NOT NULL,
  `dis` double NOT NULL,
  `tot` double NOT NULL,
  `company_id` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cust_pay`
--

LOCK TABLES `cust_pay` WRITE;
/*!40000 ALTER TABLE `cust_pay` DISABLE KEYS */;
INSERT INTO `cust_pay` VALUES (1,'2026-03-28','03:51:18 pm','1','Sandip Belote','87',2250,6750,'Cash','.','','28/03/2026  03:51:30 pm',6750,0,'1'),(1,'2026-03-28','03:51:18 pm','1','Sandip Belote','90',2250,6750,'Cash','.','','28/03/2026  03:51:30 pm',6750,0,'1'),(1,'2026-03-28','03:51:18 pm','1','Sandip Belote','96',2250,6750,'Cash','.','','28/03/2026  03:51:30 pm',6750,0,'1'),(2,'2026-03-28','03:53:51 pm','1','Sandip Belote','97',97,97,'Cash','.','','28/03/2026  03:54:02 pm',0,97,'1'),(3,'2026-03-28','04:11:51 pm','1','Sandip Belote','97',300,300,'Cash','.','','28/03/2026  04:12:11 pm',0,300,'1'),(4,'2026-03-28','04:19:09 pm','1','Sandip Belote','97',53,53,'Cash','.','','28/03/2026  04:19:32 pm',0,53,'1'),(5,'2026-03-28','04:20:33 pm','1','Sandip Belote','98',200,200,'Cash','.','','28/03/2026  04:21:25 pm',0,200,'1'),(6,'2026-03-28','04:29:46 pm','1','Sandip Belote','98',200,200,'Cash','.','','28/03/2026  04:29:59 pm',0,200,'1'),(7,'2026-03-29','09:39:47 pm','1','shital Belote','105',2250,2250,'Cash','.','','29/03/2026  09:40:01 pm',0,0,'1'),(8,'2026-03-29','09:47:05 pm','1','Sandip Belote','105',2250,2250,'Cash','.','','29/03/2026  09:47:19 pm',0,2250,'1'),(9,'2026-03-29','10:40:27 pm','1','shital Belote','33',162,162,'Cash','.','','29/03/2026  10:40:43 pm',0,162,'2');
/*!40000 ALTER TABLE `cust_pay` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cust_points`
--

DROP TABLE IF EXISTS `cust_points`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cust_points` (
  `cid` int NOT NULL,
  `points` double NOT NULL,
  PRIMARY KEY (`cid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cust_points`
--

LOCK TABLES `cust_points` WRITE;
/*!40000 ALTER TABLE `cust_points` DISABLE KEYS */;
/*!40000 ALTER TABLE `cust_points` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cust_points1`
--

DROP TABLE IF EXISTS `cust_points1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cust_points1` (
  `sno` int NOT NULL,
  `dat` date NOT NULL,
  `tim` varchar(15) NOT NULL,
  `cid` int NOT NULL,
  `mobile` varchar(10) NOT NULL,
  `points` double NOT NULL,
  `remarks` varchar(150) NOT NULL,
  `user` varchar(15) NOT NULL,
  `last` varchar(25) NOT NULL,
  PRIMARY KEY (`sno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cust_points1`
--

LOCK TABLES `cust_points1` WRITE;
/*!40000 ALTER TABLE `cust_points1` DISABLE KEYS */;
/*!40000 ALTER TABLE `cust_points1` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ereturn`
--

DROP TABLE IF EXISTS `ereturn`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ereturn` (
  `billno` int NOT NULL,
  `dat` date NOT NULL,
  `tim` varchar(15) NOT NULL,
  `location` varchar(20) NOT NULL,
  `cashier` varchar(20) NOT NULL,
  `terminal` varchar(20) NOT NULL,
  `items` int NOT NULL,
  `quans` double NOT NULL,
  `sub` double NOT NULL,
  `disp` double NOT NULL,
  `disamt` double NOT NULL,
  `gross` double NOT NULL,
  `taxamt` double NOT NULL,
  `addamt` double NOT NULL,
  `round` double NOT NULL,
  `net` double NOT NULL,
  `pby` varchar(10) NOT NULL,
  `paid` double NOT NULL,
  `bal` double NOT NULL,
  `cash` double NOT NULL,
  `card` double NOT NULL,
  `credit` double NOT NULL,
  `others` double NOT NULL,
  `upi` double NOT NULL DEFAULT '0',
  `price_type` varchar(10) NOT NULL,
  `tax_type` varchar(25) NOT NULL,
  `tax` varchar(10) NOT NULL,
  `cid` varchar(10) NOT NULL DEFAULT '',
  `cardno` varchar(20) NOT NULL,
  `cname` varchar(100) NOT NULL,
  `mobile` varchar(10) NOT NULL,
  `user` varchar(15) NOT NULL,
  `last` varchar(25) NOT NULL,
  `company_id` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`billno`,`company_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ereturn`
--

LOCK TABLES `ereturn` WRITE;
/*!40000 ALTER TABLE `ereturn` DISABLE KEYS */;
/*!40000 ALTER TABLE `ereturn` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ereturn_items`
--

DROP TABLE IF EXISTS `ereturn_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ereturn_items` (
  `billno` int NOT NULL,
  `dat` date NOT NULL,
  `cid` varchar(10) NOT NULL DEFAULT '',
  `serial` int NOT NULL,
  `ino` int NOT NULL,
  `iname` varchar(100) NOT NULL,
  `quan` double NOT NULL,
  `mrp` double NOT NULL,
  `price` double NOT NULL,
  `amount` double NOT NULL,
  `disp` double NOT NULL,
  `disamt` double NOT NULL,
  `sub` double NOT NULL,
  `taxp` double NOT NULL,
  `taxamt` double NOT NULL,
  `total` double NOT NULL,
  `udes` varchar(10) NOT NULL,
  `barcode` varchar(20) NOT NULL,
  `hsn` varchar(10) NOT NULL,
  `tax` varchar(10) NOT NULL,
  `entry` varchar(12) NOT NULL,
  `cost_rate` double NOT NULL,
  `profit` double NOT NULL,
  `iname1` varchar(100) NOT NULL,
  `price_type` varchar(10) NOT NULL,
  `tax_type` varchar(25) NOT NULL,
  `item_type` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ereturn_items`
--

LOCK TABLES `ereturn_items` WRITE;
/*!40000 ALTER TABLE `ereturn_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `ereturn_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estimate`
--

DROP TABLE IF EXISTS `estimate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estimate` (
  `billno` int NOT NULL,
  `dat` date NOT NULL,
  `tim` varchar(15) NOT NULL,
  `location` varchar(20) NOT NULL,
  `cashier` varchar(20) NOT NULL,
  `terminal` varchar(20) NOT NULL,
  `items` int NOT NULL,
  `quans` double NOT NULL,
  `sub` double NOT NULL,
  `disp` double NOT NULL,
  `disamt` double NOT NULL,
  `gross` double NOT NULL,
  `taxamt` double NOT NULL,
  `addamt` double NOT NULL,
  `round` double NOT NULL,
  `net` double NOT NULL,
  `pby` varchar(10) NOT NULL,
  `paid` double NOT NULL,
  `bal` double NOT NULL,
  `cash` double NOT NULL,
  `card` double NOT NULL,
  `credit` double NOT NULL,
  `others` double NOT NULL,
  `upi` double NOT NULL DEFAULT '0',
  `price_type` varchar(10) NOT NULL,
  `tax_type` varchar(25) NOT NULL,
  `tax` varchar(10) NOT NULL,
  `cid` varchar(10) NOT NULL DEFAULT '',
  `cardno` varchar(20) NOT NULL,
  `cname` varchar(100) NOT NULL,
  `mobile` varchar(10) NOT NULL,
  `user` varchar(15) NOT NULL,
  `last` varchar(25) NOT NULL,
  `today_points` double NOT NULL DEFAULT '0',
  `total_points` double NOT NULL DEFAULT '0',
  `cost_rate` double NOT NULL DEFAULT '0',
  `company_id` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`billno`,`company_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estimate`
--

LOCK TABLES `estimate` WRITE;
/*!40000 ALTER TABLE `estimate` DISABLE KEYS */;
INSERT INTO `estimate` VALUES (1,'2026-03-27','06:54:22 pm','MainStore','','Terminal1',1,1,2500,10,250,2250,107.14,0,0,2250,'Multi Pay',0,0,0,0,0,0,0,'Retail','Inclusive of Tax','Local','1','1','Sandip Belote','7588168856','','27/03/2026  06:54:26 pm',0,0,2000,'1'),(2,'2026-03-27','07:08:30 pm','MainStore','','Terminal1',1,1,2500,10,250,2250,107.14,0,0,2250,'Cash',0,0,2250,0,0,0,0,'Retail','Inclusive of Tax','Local','1','1','Sandip Belote','7588168856','','27/03/2026  07:08:31 pm',0,0,2000,'1'),(3,'2026-03-27','07:29:01 pm','MainStore','','Terminal1',1,1,2500,10,250,2250,107.14,0,0,2250,'Cash',0,0,2250,0,0,0,0,'Retail','Inclusive of Tax','Local','1','1','Sandip Belote','7588168856','','27/03/2026  07:29:04 pm',0,0,2000,'1'),(4,'2026-03-27','07:29:44 pm','MainStore','','Terminal1',1,1,2500,10,250,2250,107.14,0,0,2250,'Cash',0,0,2250,0,0,0,0,'Retail','Inclusive of Tax','Local','1','1','Sandip Belote','7588168856','','27/03/2026  07:29:47 pm',0,0,2000,'1'),(5,'2026-03-27','07:43:57 pm','MainStore','','Terminal1',1,1,2500,10,250,2250,107.14,0,0,2250,'Cash',0,0,2250,0,0,0,0,'Retail','Inclusive of Tax','Local','1','1','Sandip Belote','7588168856','','27/03/2026  07:44:00 pm',0,0,2000,'1'),(6,'2026-03-27','08:07:44 pm','MainStore','','Terminal1',1,1,2500,10,250,2250,107.14,0,0,2250,'Cash',0,0,2250,0,0,0,0,'Retail','Inclusive of Tax','Local','1','1','Sandip Belote','7588168856','','27/03/2026  08:07:45 pm',0,0,2000,'1'),(7,'2026-03-27','08:41:28 pm','MainStore','','Terminal1',1,1,2500,10,250,2250,107.14,0,0,2250,'Cash',0,0,2250,0,0,0,0,'Retail','Inclusive of Tax','Local','1','1','Sandip Belote','7588168856','','27/03/2026  08:41:28 pm',0,0,2000,'1'),(8,'2026-03-27','09:05:14 pm','MainStore','','Terminal1',1,1,2500,10,250,2250,107.14,0,0,2250,'Cash',0,0,2250,0,0,0,0,'Retail','Inclusive of Tax','Local','1','1','Sandip Belote','7588168856','','27/03/2026  09:05:16 pm',0,0,2000,'1'),(9,'2026-03-27','09:08:47 pm','MainStore','','Terminal1',1,1,2500,10,250,2250,107.14,0,0,2250,'Cash',0,0,2250,0,0,0,0,'Retail','Inclusive of Tax','Local','1','1','Sandip Belote','7588168856','','27/03/2026  09:08:47 pm',0,0,2000,'1'),(10,'2026-03-27','09:10:13 pm','MainStore','','Terminal1',1,1,2500,10,250,2250,107.14,0,0,2250,'Cash',0,0,2250,0,0,0,0,'Retail','Inclusive of Tax','Local','1','1','Sandip Belote','7588168856','','27/03/2026  09:10:16 pm',0,0,2000,'1'),(11,'2026-03-27','09:13:57 pm','MainStore','','Terminal1',1,1,2500,10,250,2250,107.14,0,0,2250,'Cash',0,0,2250,0,0,0,0,'Retail','Inclusive of Tax','Local','1','1','Sandip Belote','7588168856','','27/03/2026  09:14:00 pm',0,0,2000,'1'),(12,'2026-03-27','09:29:21 pm','MainStore','','Terminal1',1,1,2500,10,250,2250,107.14,0,0,2250,'Cash',0,0,2250,0,0,0,0,'Retail','Inclusive of Tax','Local','1','1','Sandip Belote','7588168856','','27/03/2026  09:29:22 pm',0,0,2000,'1'),(13,'2026-03-27','09:46:05 pm','MainStore','','Terminal1',1,1,2500,10,250,2250,107.14,0,0,2250,'Cash',0,0,2250,0,0,0,0,'Retail','Inclusive of Tax','Local','1','1','Sandip Belote','7588168856','','27/03/2026  09:46:06 pm',0,0,2000,'1'),(14,'2026-03-27','09:49:25 pm','MainStore','','Terminal1',1,1,2500,10,250,2250,107.14,0,0,2250,'Cash',0,0,2250,0,0,0,0,'Retail','Inclusive of Tax','Local','1','1','Sandip Belote','7588168856','','27/03/2026  09:49:26 pm',0,0,2000,'1'),(15,'2026-03-27','09:58:53 pm','MainStore','','Terminal1',1,1,2500,10,250,2250,107.14,0,0,2250,'Cash',0,0,2250,0,0,0,0,'Retail','Inclusive of Tax','Local','1','1','Sandip Belote','7588168856','','27/03/2026  09:58:54 pm',0,0,2000,'1'),(16,'2026-03-27','10:08:17 pm','MainStore','','Terminal1',1,1,2500,10,250,2250,107.14,0,0,2250,'Cash',0,0,2250,0,0,0,0,'Retail','Inclusive of Tax','Local','1','1','Sandip Belote','7588168856','','27/03/2026  10:08:17 pm',0,0,2000,'1'),(17,'2026-03-28','12:00:59 pm','MainStore','','Terminal1',1,1,2500,10,250,2250,107.14,0,0,2250,'Cash',0,0,2250,0,0,0,0,'Retail','Inclusive of Tax','Local','1','1','Sandip Belote','7588168856','','28/03/2026  12:01:00 pm',0,0,2000,'1'),(18,'2026-03-29','10:52:46 pm','MainStore','','Terminal1',1,1,500,10,50,450,21.43,0,0,450,'Cash',0,0,450,0,0,0,0,'Retail','Inclusive of Tax','Local','1','1','Sandip Belote','7588168856','','29/03/2026  10:52:48 pm',0,0,200,'1');
/*!40000 ALTER TABLE `estimate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estimate_hold`
--

DROP TABLE IF EXISTS `estimate_hold`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estimate_hold` (
  `billno` int NOT NULL,
  `location` varchar(20) NOT NULL DEFAULT '',
  `terminal` varchar(20) NOT NULL DEFAULT '',
  `cashier` varchar(20) NOT NULL DEFAULT '',
  `items` int NOT NULL,
  `quans` double NOT NULL DEFAULT '0',
  `net` double NOT NULL DEFAULT '0',
  `cname` varchar(100) NOT NULL DEFAULT '0',
  `barcode` varchar(20) NOT NULL DEFAULT '0',
  `ino` int NOT NULL DEFAULT '0',
  `iname` varchar(100) NOT NULL DEFAULT '0',
  `price` double NOT NULL DEFAULT '0',
  `quan` double NOT NULL DEFAULT '0',
  `udes` varchar(10) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estimate_hold`
--

LOCK TABLES `estimate_hold` WRITE;
/*!40000 ALTER TABLE `estimate_hold` DISABLE KEYS */;
/*!40000 ALTER TABLE `estimate_hold` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estimate_items`
--

DROP TABLE IF EXISTS `estimate_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estimate_items` (
  `billno` int NOT NULL,
  `dat` date NOT NULL,
  `cid` varchar(10) NOT NULL DEFAULT '',
  `serial` int NOT NULL,
  `ino` int NOT NULL,
  `iname` varchar(100) NOT NULL,
  `quan` double NOT NULL,
  `mrp` double NOT NULL,
  `price` double NOT NULL,
  `amount` double NOT NULL,
  `disp` double NOT NULL,
  `disamt` double NOT NULL,
  `sub` double NOT NULL,
  `taxp` double NOT NULL,
  `taxamt` double NOT NULL,
  `total` double NOT NULL,
  `udes` varchar(10) NOT NULL,
  `barcode` varchar(20) NOT NULL,
  `hsn` varchar(10) NOT NULL,
  `tax` varchar(10) NOT NULL,
  `entry` varchar(12) NOT NULL,
  `cost_rate` double NOT NULL,
  `profit` double NOT NULL,
  `iname1` varchar(100) NOT NULL,
  `price_type` varchar(10) NOT NULL,
  `tax_type` varchar(25) NOT NULL,
  `item_type` varchar(10) NOT NULL,
  `prate` double NOT NULL DEFAULT '0',
  `rprice` double NOT NULL DEFAULT '0',
  `wprice` double NOT NULL DEFAULT '0',
  `remarks` varchar(80) DEFAULT NULL,
  `size` varchar(50) DEFAULT NULL,
  `color` varchar(50) DEFAULT NULL,
  `brand` varchar(100) DEFAULT NULL,
  `company_id` varchar(50) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estimate_items`
--

LOCK TABLES `estimate_items` WRITE;
/*!40000 ALTER TABLE `estimate_items` DISABLE KEYS */;
INSERT INTO `estimate_items` VALUES (18,'2026-03-29','1',1,3,'PANT',1,500,500,500,10,50,428.57,5,21.43,450,'.','1001','321456','Local','purchase',200,228.57,'PANT','Retail','Inclusive of Tax','Old',200,500,500,'','XXS','RED','','1');
/*!40000 ALTER TABLE `estimate_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `invoice_columns`
--

DROP TABLE IF EXISTS `invoice_columns`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `invoice_columns` (
  `doc_type` varchar(20) NOT NULL,
  `col_key` varchar(30) NOT NULL,
  `col_header` varchar(50) NOT NULL,
  `col_visible` tinyint(1) NOT NULL DEFAULT '1',
  `col_order` int NOT NULL DEFAULT '0',
  `company_id` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`doc_type`,`col_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invoice_columns`
--

LOCK TABLES `invoice_columns` WRITE;
/*!40000 ALTER TABLE `invoice_columns` DISABLE KEYS */;
INSERT INTO `invoice_columns` VALUES ('estimate','amount','AMOUNT',0,6,''),('estimate','brand','BRAND',1,9,''),('estimate','color','COLOR',1,8,''),('estimate','disc','DISC',1,6,''),('estimate','disc_amt','DISC_AMT',1,7,''),('estimate','exp_date','EXP_DATE',1,15,''),('estimate','hsn','HSN',1,11,''),('estimate','mfg_date','MFG_DATE',1,14,''),('estimate','mrp','MRP',1,3,''),('estimate','net_rate','NET_RATE',1,5,''),('estimate','price','PRICE',1,6,''),('estimate','product_name','PRODUCT_NAME',1,2,''),('estimate','qty','QTY',1,4,''),('estimate','rate','RATE',1,5,''),('estimate','size','SIZE',1,7,''),('estimate','sno','SNO',1,1,''),('estimate','sub_total','SUB_TOTAL',1,8,''),('estimate','tax_amt','TAX_AMT',1,9,''),('estimate','tax_pct','TAX_PCT',0,10,''),('estimate','total','TOTAL',1,16,''),('invoice','amount','AMOUNT',0,7,''),('invoice','brand','BRAND',1,12,''),('invoice','color','COLOR',1,11,''),('invoice','disc','DISC',1,7,''),('invoice','disc_amt','DISC_AMT',1,8,''),('invoice','exp_date','EXP_DATE',1,9,''),('invoice','hsn','HSN',1,3,''),('invoice','mfg_date','MFG_DATE',1,8,''),('invoice','mrp','MRP',1,4,''),('invoice','net_rate','NET_RATE',1,5,''),('invoice','price','PRICE',0,6,''),('invoice','product_name','PRODUCT_NAME',1,2,''),('invoice','qty','QTY',1,4,''),('invoice','rate','RATE',1,5,''),('invoice','size','SIZE',1,10,''),('invoice','sno','SNO',1,1,''),('invoice','sub_total','SUB_TOTAL',1,9,''),('invoice','tax','TAX',0,6,''),('invoice','tax_amt','TAX_AMT',1,11,''),('invoice','tax_pct','TAX_PCT',0,10,''),('invoice','total','TOTAL',1,16,''),('po','brand','BRAND',0,9,''),('po','color','COLOR',0,8,''),('po','mrp','MRP',1,1,''),('po','reorder_level','REORDER_LEVEL',1,2,''),('po','size','SIZE',0,7,''),('po','stock_hand','STOCK_HAND',1,3,''),('po','tax_amt','TAX_AMT',1,5,''),('po','tax_pct','TAX_PCT',1,4,''),('po','total','TOTAL',1,6,''),('purchase','brand','BRAND',0,15,''),('purchase','category','CATEGORY',1,11,''),('purchase','color','COLOR',0,14,''),('purchase','disc','DISC',1,4,''),('purchase','disc_amt','DISC_AMT',1,5,''),('purchase','hsn','HSN',1,9,''),('purchase','manufacturer','MANUFACTURER',1,12,''),('purchase','mrp','MRP',1,1,''),('purchase','rprice','RPRICE',1,2,''),('purchase','size','SIZE',0,13,''),('purchase','sub_total','SUB_TOTAL',1,6,''),('purchase','tax_amt','TAX_AMT',1,8,''),('purchase','tax_pct','TAX_PCT',1,7,''),('purchase','tax_type','TAX_TYPE',1,10,''),('purchase','wprice','WPRICE',0,3,'');
/*!40000 ALTER TABLE `invoice_columns` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item`
--

DROP TABLE IF EXISTS `item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `item` (
  `ino` int NOT NULL,
  `barcode` varchar(20) NOT NULL,
  `iname` varchar(100) NOT NULL,
  `iname1` varchar(100) NOT NULL,
  `prate` double NOT NULL,
  `taxp` int NOT NULL,
  `mrp` double NOT NULL,
  `rprice` double NOT NULL,
  `wprice` double NOT NULL,
  `cat` varchar(100) NOT NULL,
  `manu` varchar(100) NOT NULL,
  `hsn` varchar(10) NOT NULL,
  `udes` varchar(10) NOT NULL,
  `minstock` double NOT NULL,
  `maxstock` double NOT NULL,
  `rack` varchar(30) NOT NULL,
  `disp` double NOT NULL,
  `ostock` double NOT NULL,
  `subunit` varchar(10) DEFAULT NULL,
  `subconv` double DEFAULT NULL,
  `batch` varchar(50) DEFAULT NULL,
  `size` varchar(50) DEFAULT NULL,
  `exp_date` date DEFAULT NULL,
  `mfg_date` date DEFAULT NULL,
  `color` varchar(50) DEFAULT NULL,
  `brand` varchar(100) DEFAULT NULL,
  `tax_inclusion` varchar(30) NOT NULL DEFAULT 'Inclusive of Tax',
  `company_id` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`ino`,`company_id`),
  UNIQUE KEY `item_barcode_company` (`barcode`,`company_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item`
--

LOCK TABLES `item` WRITE;
/*!40000 ALTER TABLE `item` DISABLE KEYS */;
INSERT INTO `item` VALUES (1,'1','Tshirt','Tshirt',850,5,900,800,800,'cloths','DD','.','.',0,0,'.',10,1000,NULL,NULL,NULL,'XXS',NULL,NULL,'RED',NULL,'Inclusive of Tax','1'),(1,'1000','PAN D','PAN D',100,5,200,180,150,'tabs','.','.','.',0,0,'.',10,0,NULL,NULL,'1248736',NULL,'2027-03-10','2026-03-03',NULL,NULL,'Inclusive of Tax','2'),(2,'1000','mens jeans','mens jeans',2000,5,3000,2500,2250,'cloths','DD','.','.',0,0,'.',10,500,NULL,NULL,NULL,'XXS',NULL,NULL,'RED',NULL,'Inclusive of Tax','1'),(3,'1001','PANT','PANT',200,5,500,500,500,'cloths','DD','321456','.',10,0,'.',10,0,NULL,NULL,NULL,'XXS',NULL,NULL,'RED',NULL,'Inclusive of Tax','1'),(4,'1002','PANT','PANT',4000,5,500,500,500,'cloths','DD','321456','.',10,0,'.',10,0,NULL,NULL,NULL,'XS',NULL,NULL,'BLUE',NULL,'Inclusive of Tax','1');
/*!40000 ALTER TABLE `item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `packing`
--

DROP TABLE IF EXISTS `packing`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `packing` (
  `sno` int NOT NULL,
  `dat` date NOT NULL,
  `ino` int NOT NULL,
  `iname` varchar(100) NOT NULL,
  `quan` double NOT NULL DEFAULT '0',
  `weight` double NOT NULL DEFAULT '0',
  `items` int NOT NULL DEFAULT '0',
  `quans` double NOT NULL DEFAULT '0',
  `weights` double NOT NULL DEFAULT '0',
  `user` varchar(15) NOT NULL DEFAULT '0',
  `last` varchar(25) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `packing`
--

LOCK TABLES `packing` WRITE;
/*!40000 ALTER TABLE `packing` DISABLE KEYS */;
/*!40000 ALTER TABLE `packing` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `packing_items`
--

DROP TABLE IF EXISTS `packing_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `packing_items` (
  `sno` int NOT NULL,
  `ino` int NOT NULL,
  `iname` varchar(100) NOT NULL,
  `quan` int NOT NULL DEFAULT '0',
  `weight` double NOT NULL DEFAULT '0',
  `tweight` double NOT NULL DEFAULT '0',
  `barcode` varchar(20) NOT NULL DEFAULT '0',
  `mrp` double NOT NULL DEFAULT '0',
  `rprice` double NOT NULL DEFAULT '0',
  `wprice` double NOT NULL DEFAULT '0',
  `entry` varchar(10) NOT NULL DEFAULT '0',
  `cat` varchar(100) NOT NULL DEFAULT '0',
  `prate` double NOT NULL DEFAULT '0',
  `stock_type` varchar(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `packing_items`
--

LOCK TABLES `packing_items` WRITE;
/*!40000 ALTER TABLE `packing_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `packing_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pay_advance`
--

DROP TABLE IF EXISTS `pay_advance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pay_advance` (
  `sno` int NOT NULL,
  `dat` date NOT NULL,
  `cid` varchar(20) NOT NULL DEFAULT '',
  `cname` varchar(100) NOT NULL DEFAULT '',
  `amount` double NOT NULL DEFAULT '0',
  `remarks` varchar(100) NOT NULL DEFAULT '0',
  `last` varchar(25) NOT NULL DEFAULT '0',
  PRIMARY KEY (`sno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pay_advance`
--

LOCK TABLES `pay_advance` WRITE;
/*!40000 ALTER TABLE `pay_advance` DISABLE KEYS */;
/*!40000 ALTER TABLE `pay_advance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pay_bill`
--

DROP TABLE IF EXISTS `pay_bill`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pay_bill` (
  `sno` int NOT NULL,
  `dfrom` date NOT NULL,
  `dto` date NOT NULL,
  `cid` varchar(20) NOT NULL DEFAULT '',
  `cname` varchar(100) NOT NULL DEFAULT '',
  `salary` double NOT NULL DEFAULT '0',
  `days` int NOT NULL DEFAULT '0',
  `gross` double NOT NULL DEFAULT '0',
  `lpay` double NOT NULL DEFAULT '0',
  `lopay` double NOT NULL DEFAULT '0',
  `net` double NOT NULL DEFAULT '0',
  `mobile` varchar(15) NOT NULL DEFAULT '0',
  `lno` int NOT NULL DEFAULT '0',
  `balance` double NOT NULL DEFAULT '0',
  `last` varchar(25) NOT NULL DEFAULT '0',
  `dat` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pay_bill`
--

LOCK TABLES `pay_bill` WRITE;
/*!40000 ALTER TABLE `pay_bill` DISABLE KEYS */;
/*!40000 ALTER TABLE `pay_bill` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pay_loan`
--

DROP TABLE IF EXISTS `pay_loan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pay_loan` (
  `sno` int NOT NULL,
  `dat` date NOT NULL,
  `cid` varchar(20) NOT NULL DEFAULT '',
  `cname` varchar(100) NOT NULL DEFAULT '',
  `tot` double NOT NULL DEFAULT '0',
  `paid` double NOT NULL DEFAULT '0',
  `remarks` varchar(100) NOT NULL DEFAULT '0',
  `status` varchar(10) NOT NULL DEFAULT '0',
  `last` varchar(25) NOT NULL DEFAULT '0',
  PRIMARY KEY (`sno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pay_loan`
--

LOCK TABLES `pay_loan` WRITE;
/*!40000 ALTER TABLE `pay_loan` DISABLE KEYS */;
/*!40000 ALTER TABLE `pay_loan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `peracc`
--

DROP TABLE IF EXISTS `peracc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `peracc` (
  `sno` int NOT NULL AUTO_INCREMENT,
  `billno` varchar(50) NOT NULL DEFAULT '',
  `dat` date NOT NULL,
  `part` varchar(100) NOT NULL DEFAULT '',
  `debit` double NOT NULL DEFAULT '0',
  `credit` double NOT NULL DEFAULT '0',
  `account` varchar(50) NOT NULL DEFAULT '0',
  `under` varchar(50) NOT NULL DEFAULT '0',
  `type1` varchar(50) NOT NULL DEFAULT '0',
  `ano` varchar(50) NOT NULL DEFAULT '0',
  PRIMARY KEY (`sno`),
  KEY `sno` (`sno`)
) ENGINE=InnoDB AUTO_INCREMENT=106 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `peracc`
--

LOCK TABLES `peracc` WRITE;
/*!40000 ALTER TABLE `peracc` DISABLE KEYS */;
INSERT INTO `peracc` VALUES (1,'SALE-1','2026-03-21','Sales Account',0,130,'Sales Account','Primary Account','cash','-'),(2,'SALE-2','2026-03-21','Sales Account',0,1300,'Sales Account','Primary Account','cash','-'),(3,'SALE-3','2026-03-21','Sales Account',0,650,'Sales Account','Primary Account','cash','-'),(4,'SALE-4','2026-03-21','Sales Account',0,1300,'Sales Account','Primary Account','cash','-'),(5,'SALE-5','2026-03-21','Sales Account',0,1300,'Sales Account','Primary Account','cash','-'),(6,'SALE-6','2026-03-21','Sales Account',0,1300,'Sales Account','Primary Account','cash','-'),(7,'SALE-7','2026-03-22','Sales Account',0,1300,'Sales Account','Primary Account','cash','-'),(8,'SALE-8','2026-03-22','Sales Account',0,1300,'Sales Account','Primary Account','cash','-'),(9,'SALE-9','2026-03-22','Sales Account',0,1300,'Sales Account','Primary Account','cash','-'),(10,'SALE-11','2026-03-22','Sales Account',0,1300,'Sales Account','Primary Account','cash','-'),(11,'SALE-12','2026-03-22','Sales Account',0,1300,'Sales Account','Primary Account','cash','-'),(12,'SALE-13','2026-03-22','Sales Account',0,1300,'Sales Account','Primary Account','cash','-'),(13,'SALE-14','2026-03-22','Sales Account',0,1300,'Sales Account','Primary Account','cash','-'),(14,'SALE-16','2026-03-22','Sales Account',0,1300,'Sales Account','Primary Account','cash','-'),(15,'SALE-18','2026-03-22','Sales Account',0,1300,'Sales Account','Primary Account','cash','-'),(16,'SALE-21','2026-03-22','Sales Account',0,650,'Sales Account','Primary Account','cash','-'),(17,'SALE-22','2026-03-22','Sales Account',0,650,'Sales Account','Primary Account','cash','-'),(18,'SALE-23','2026-03-22','Sales Account',0,650,'Sales Account','Primary Account','cash','-'),(19,'SALE-24','2026-03-22','Sales Account',0,260,'Sales Account','Primary Account','cash','-'),(20,'SALE-25','2026-03-22','Sales Account',0,260,'Sales Account','Primary Account','cash','-'),(21,'SALE-26','2026-03-22','Sales Account',0,390,'Sales Account','Primary Account','cash','-'),(22,'SALE-27','2026-03-22','Sales Account',0,520,'Sales Account','Primary Account','cash','-'),(23,'SALE-28','2026-03-22','Sales Account',0,780,'Sales Account','Primary Account','cash','-'),(24,'SALE-29','2026-03-22','Sales Account',0,260,'Sales Account','Primary Account','cash','-'),(25,'SALE-30','2026-03-22','Sales Account',0,390,'Sales Account','Primary Account','cash','-'),(26,'SALE-31','2026-03-22','Sales Account',0,650,'Sales Account','Primary Account','cash','-'),(27,'SALE-32','2026-03-22','Sales Account',0,1430,'Sales Account','Primary Account','cash','-'),(28,'SALE-34','2026-03-22','Sales Account',0,1300,'Sales Account','Primary Account','cash','-'),(29,'SALE-35','2026-03-22','Sales Account',0,650,'Sales Account','Primary Account','cash','-'),(30,'SALE-36','2026-03-22','Sales Account',0,390,'Sales Account','Primary Account','cash','-'),(31,'SALE-37','2026-03-23','Sales Account',0,1300,'Sales Account','Primary Account','cash','-'),(32,'SALE-38','2026-03-23','Sales Account',0,390,'Sales Account','Primary Account','cash','-'),(33,'SALE-39','2026-03-23','Sales Account',0,260,'Sales Account','Primary Account','cash','-'),(34,'SALE-40','2026-03-23','Sales Account',0,2250,'Sales Account','Primary Account','cash','-'),(35,'SALE-41','2026-03-23','Sales Account',0,2250,'Sales Account','Primary Account','cash','-'),(36,'SALE-42','2026-03-23','Sales Account',0,2250,'Sales Account','Primary Account','cash','-'),(37,'SALE-43','2026-03-23','Sales Account',0,900,'Sales Account','Primary Account','cash','-'),(38,'SALE-44','2026-03-23','Sales Account',0,450,'Sales Account','Primary Account','cash','-'),(39,'SALE-45','2026-03-23','Sales Account',0,3150,'Sales Account','Primary Account','cash','-'),(40,'SALE-46','2026-03-23','Sales Account',0,1323,'Sales Account','Primary Account','cash','-'),(41,'SALE-47','2026-03-23','Sales Account',0,1260,'Sales Account','Primary Account','cash','-'),(42,'SALE-48','2026-03-23','Sales Account',0,3308,'Sales Account','Primary Account','cash','-'),(43,'SALE-49','2026-03-23','Sales Account',0,1400,'Sales Account','Primary Account','cash','-'),(44,'SALE-52','2026-03-24','Sales Account',0,630,'Sales Account','Primary Account','cash','-'),(45,'SALE-53','2026-03-24','Sales Account',0,630,'Sales Account','Primary Account','cash','-'),(46,'SALE-54','2026-03-24','Sales Account',0,630,'Sales Account','Primary Account','cash','-'),(47,'SALE-55','2026-03-24','Sales Account',0,760,'Sales Account','Primary Account','cash','-'),(48,'SALE-56','2026-03-24','Sales Account',0,630,'Sales Account','Primary Account','cash','-'),(49,'SALE-57','2026-03-24','Sales Account',0,630,'Sales Account','Primary Account','cash','-'),(50,'SALE-58','2026-03-24','Sales Account',0,630,'Sales Account','Primary Account','cash','-'),(51,'SALE-59','2026-03-24','Sales Account',0,630,'Sales Account','Primary Account','cash','-'),(52,'SALE-60','2026-03-24','Sales Account',0,630,'Sales Account','Primary Account','cash','-'),(53,'SALE-61','2026-03-24','Sales Account',0,630,'Sales Account','Primary Account','cash','-'),(54,'SALE-62','2026-03-24','Sales Account',0,630,'Sales Account','Primary Account','cash','-'),(55,'SALE-63','2026-03-24','Sales Account',0,630,'Sales Account','Primary Account','cash','-'),(56,'SALE-64','2026-03-24','Sales Account',0,630,'Sales Account','Primary Account','cash','-'),(57,'SALE-65','2026-03-24','Sales Account',0,630,'Sales Account','Primary Account','cash','-'),(58,'SALE-66','2026-03-25','Sales Account',0,630,'Sales Account','Primary Account','cash','-'),(59,'SALE-67','2026-03-25','Sales Account',0,662,'Sales Account','Primary Account','cash','-'),(60,'SALE-68','2026-03-25','Sales Account',0,630,'Sales Account','Primary Account','cash','-'),(61,'SALE-69','2026-03-25','Sales Account',0,630,'Sales Account','Primary Account','cash','-'),(62,'SALE-70','2026-03-25','Sales Account',0,630,'Sales Account','Primary Account','cash','-'),(63,'SALE-71','2026-03-25','Sales Account',0,630,'Sales Account','Primary Account','cash','-'),(64,'SALE-72','2026-03-25','Sales Account',0,630,'Sales Account','Primary Account','cash','-'),(65,'SALE-73','2026-03-25','Sales Account',0,630,'Sales Account','Primary Account','cash','-'),(66,'SALE-74','2026-03-25','Sales Account',0,630,'Sales Account','Primary Account','cash','-'),(67,'SALE-75','2026-03-25','Sales Account',0,630,'Sales Account','Primary Account','cash','-'),(68,'SALE-76','2026-03-25','Sales Account',0,630,'Sales Account','Primary Account','cash','-'),(69,'SALE-78','2026-03-25','Sales Account',0,630,'Sales Account','Primary Account','cash','-'),(70,'SALE-79','2026-03-26','Sales Account',0,720,'Sales Account','Primary Account','cash','-'),(71,'SALE-80','2026-03-26','Sales Account',0,5000,'Sales Account','Primary Account','cash','-'),(72,'SALE-81','2026-03-27','Sales Account',0,2500,'Sales Account','Primary Account','cash','-'),(73,'SALE-82','2026-03-27','Sales Account',0,2500,'Sales Account','Primary Account','cash','-'),(74,'SALE-83','2026-03-27','Sales Account',0,2250,'Sales Account','Primary Account','cash','-'),(75,'SALE-84','2026-03-27','Sales Account',0,2250,'Sales Account','Primary Account','cash','-'),(76,'SALE-85','2026-03-27','Sales Account',0,2250,'Sales Account','Primary Account','cash','-'),(77,'SALE-88','2026-03-27','Sales Account',0,2250,'Sales Account','Primary Account','cash','-'),(78,'SALE-89','2026-03-27','Sales Account',0,2250,'Sales Account','Primary Account','cash','-'),(79,'SALE-91','2026-03-27','Sales Account',0,2250,'Sales Account','Primary Account','cash','-'),(80,'SALE-92','2026-03-27','Sales Account',0,450,'Sales Account','Primary Account','cash','-'),(81,'SALE-93','2026-03-27','Sales Account',0,450,'Sales Account','Primary Account','cash','-'),(82,'SALE-94','2026-03-27','Sales Account',0,2250,'Sales Account','Primary Account','cash','-'),(83,'SALE-95','2026-03-28','Sales Account',0,2250,'Sales Account','Primary Account','cash','-'),(84,'SALE-99','2026-03-29','Sales Account',0,450,'Sales Account','Primary Account','cash','-'),(85,'SALE-18','2026-03-29','Sales Account',0,117,'Sales Account','Primary Account','cash','-'),(86,'SALE-19','2026-03-29','Sales Account',0,117,'Sales Account','Primary Account','cash','-'),(87,'SALE-20','2026-03-29','Sales Account',0,117,'Sales Account','Primary Account','cash','-'),(88,'SALE-21','2026-03-29','Sales Account',0,117,'Sales Account','Primary Account','cash','-'),(89,'SALE-22','2026-03-29','Sales Account',0,117,'Sales Account','Primary Account','cash','-'),(90,'SALE-23','2026-03-29','Sales Account',0,117,'Sales Account','Primary Account','cash','-'),(91,'SALE-24','2026-03-29','Sales Account',0,117,'Sales Account','Primary Account','cash','-'),(92,'SALE-25','2026-03-29','Sales Account',0,117,'Sales Account','Primary Account','cash','-'),(93,'SALE-26','2026-03-29','Sales Account',0,117,'Sales Account','Primary Account','cash','-'),(94,'SALE-27','2026-03-29','Sales Account',0,117,'Sales Account','Primary Account','cash','-'),(95,'SALE-101','2026-03-29','Sales Account',0,450,'Sales Account','Primary Account','cash','-'),(96,'SALE-28','2026-03-29','Sales Account',0,162,'Sales Account','Primary Account','cash','-'),(97,'SALE-29','2026-03-29','Sales Account',0,162,'Sales Account','Primary Account','cash','-'),(98,'SALE-30','2026-03-29','Sales Account',0,162,'Sales Account','Primary Account','cash','-'),(99,'SALE-31','2026-03-29','Sales Account',0,162,'Sales Account','Primary Account','cash','-'),(100,'SALE-102','2026-03-29','Sales Account',0,2250,'Sales Account','Primary Account','cash','-'),(101,'SALE-103','2026-03-29','Sales Account',0,2250,'Sales Account','Primary Account','cash','-'),(102,'SALE-104','2026-03-29','Sales Account',0,2250,'Sales Account','Primary Account','cash','-'),(103,'SALE-32','2026-03-29','Sales Account',0,162,'Sales Account','Primary Account','cash','-'),(104,'SALE-106','2026-03-29','Sales Account',0,450,'Sales Account','Primary Account','cash','-'),(105,'SALE-107','2026-03-29','Sales Account',0,2250,'Sales Account','Primary Account','cash','-');
/*!40000 ALTER TABLE `peracc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `po_entry`
--

DROP TABLE IF EXISTS `po_entry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `po_entry` (
  `grn` int NOT NULL,
  `dat` date NOT NULL,
  `cname` varchar(100) NOT NULL DEFAULT '',
  `items` int NOT NULL DEFAULT '0',
  `quans` double NOT NULL DEFAULT '0',
  `sub` double NOT NULL DEFAULT '0',
  `taxamt` double NOT NULL DEFAULT '0',
  `round` double NOT NULL DEFAULT '0',
  `net` double NOT NULL DEFAULT '0',
  `status` varchar(15) NOT NULL DEFAULT '0',
  `pstatus` varchar(15) NOT NULL DEFAULT '0',
  `user` varchar(15) NOT NULL DEFAULT '0',
  `last` varchar(25) NOT NULL DEFAULT '0',
  `ttype` varchar(20) NOT NULL DEFAULT '0',
  `rdate` date NOT NULL,
  `term1` varchar(200) NOT NULL DEFAULT '',
  `term2` varchar(200) NOT NULL DEFAULT '',
  `term3` varchar(200) NOT NULL DEFAULT '',
  `term4` varchar(200) NOT NULL DEFAULT '',
  `company_id` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `po_entry`
--

LOCK TABLES `po_entry` WRITE;
/*!40000 ALTER TABLE `po_entry` DISABLE KEYS */;
/*!40000 ALTER TABLE `po_entry` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `po_items`
--

DROP TABLE IF EXISTS `po_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `po_items` (
  `grn` int NOT NULL,
  `dat` date NOT NULL,
  `cname` varchar(100) NOT NULL DEFAULT '',
  `ino` int NOT NULL DEFAULT '0',
  `iname` varchar(100) NOT NULL DEFAULT '0',
  `mrp` double NOT NULL DEFAULT '0',
  `minstock` double NOT NULL DEFAULT '0',
  `stock` double NOT NULL DEFAULT '0',
  `quan` double NOT NULL DEFAULT '0',
  `free_qty` double NOT NULL DEFAULT '0',
  `price` double NOT NULL DEFAULT '0',
  `amount` double NOT NULL DEFAULT '0',
  `taxp` int NOT NULL DEFAULT '0',
  `taxamt` double NOT NULL DEFAULT '0',
  `total` double NOT NULL DEFAULT '0',
  `ttype` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `po_items`
--

LOCK TABLES `po_items` WRITE;
/*!40000 ALTER TABLE `po_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `po_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `points_redemption`
--

DROP TABLE IF EXISTS `points_redemption`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `points_redemption` (
  `redemption_id` int NOT NULL AUTO_INCREMENT,
  `dat` date NOT NULL,
  `tim` varchar(15) NOT NULL,
  `cid` int NOT NULL,
  `cname` varchar(100) NOT NULL,
  `mobile` varchar(15) NOT NULL,
  `points_redeemed` double NOT NULL,
  `cash_amount` decimal(10,2) NOT NULL,
  `conversion_rate` decimal(5,2) NOT NULL,
  `redemption_type` varchar(20) DEFAULT 'CASH',
  `user` varchar(15) NOT NULL,
  `last` varchar(25) NOT NULL,
  `company_id` varchar(50) DEFAULT '',
  PRIMARY KEY (`redemption_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `points_redemption`
--

LOCK TABLES `points_redemption` WRITE;
/*!40000 ALTER TABLE `points_redemption` DISABLE KEYS */;
/*!40000 ALTER TABLE `points_redemption` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `preturn`
--

DROP TABLE IF EXISTS `preturn`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `preturn` (
  `grn` int NOT NULL,
  `dat` date NOT NULL,
  `cname` varchar(100) NOT NULL,
  `billno` varchar(20) NOT NULL,
  `bdate` date NOT NULL,
  `bamount` double NOT NULL,
  `items` int NOT NULL,
  `quans` double NOT NULL,
  `sub` double NOT NULL,
  `dis` double NOT NULL,
  `gross` double NOT NULL,
  `tax` double NOT NULL,
  `fright` double NOT NULL,
  `other` double NOT NULL,
  `gt` double NOT NULL,
  `round` double NOT NULL,
  `net` double NOT NULL,
  `pby` varchar(10) NOT NULL,
  `user` varchar(15) NOT NULL,
  `last` varchar(25) NOT NULL,
  `ttype` varchar(20) NOT NULL,
  `company_id` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`grn`,`company_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `preturn`
--

LOCK TABLES `preturn` WRITE;
/*!40000 ALTER TABLE `preturn` DISABLE KEYS */;
/*!40000 ALTER TABLE `preturn` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `preturn_items`
--

DROP TABLE IF EXISTS `preturn_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `preturn_items` (
  `grn` int NOT NULL,
  `dat` date NOT NULL,
  `cname` varchar(100) NOT NULL,
  `billno` varchar(20) NOT NULL,
  `bdate` date NOT NULL,
  `barcode` varchar(20) NOT NULL,
  `ino` int NOT NULL,
  `iname` varchar(100) NOT NULL,
  `mrp` double NOT NULL,
  `rprice` double NOT NULL,
  `wprice` double NOT NULL,
  `price` double NOT NULL,
  `quan` double NOT NULL,
  `amount` double NOT NULL,
  `disp` double NOT NULL,
  `disamt` double NOT NULL,
  `sub` double NOT NULL,
  `taxp` int NOT NULL,
  `taxamt` double NOT NULL,
  `total` double NOT NULL,
  `hsn` varchar(10) NOT NULL,
  `ttype` varchar(10) NOT NULL,
  `cat` varchar(100) NOT NULL,
  `manu` varchar(100) NOT NULL,
  `ttype1` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `preturn_items`
--

LOCK TABLES `preturn_items` WRITE;
/*!40000 ALTER TABLE `preturn_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `preturn_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `purchase`
--

DROP TABLE IF EXISTS `purchase`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `purchase` (
  `grn` int NOT NULL,
  `dat` date NOT NULL,
  `cname` varchar(100) NOT NULL,
  `billno` varchar(20) NOT NULL,
  `bdate` date NOT NULL,
  `bamount` double NOT NULL,
  `items` int NOT NULL,
  `quans` double NOT NULL,
  `sub` double NOT NULL,
  `dis` double NOT NULL,
  `gross` double NOT NULL,
  `tax` double NOT NULL,
  `fright` double NOT NULL,
  `other` double NOT NULL,
  `gt` double NOT NULL,
  `round` double NOT NULL,
  `net` double NOT NULL,
  `pby` varchar(10) NOT NULL,
  `user` varchar(15) NOT NULL,
  `last` varchar(25) NOT NULL,
  `ttype` varchar(20) NOT NULL,
  `po_no` varchar(15) NOT NULL,
  `company_id` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`grn`,`company_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `purchase`
--

LOCK TABLES `purchase` WRITE;
/*!40000 ALTER TABLE `purchase` DISABLE KEYS */;
/*!40000 ALTER TABLE `purchase` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `purchase_items`
--

DROP TABLE IF EXISTS `purchase_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `purchase_items` (
  `grn` int NOT NULL,
  `dat` date NOT NULL,
  `cname` varchar(100) NOT NULL,
  `billno` varchar(20) NOT NULL,
  `bdate` date NOT NULL,
  `barcode` varchar(20) NOT NULL,
  `ino` int NOT NULL,
  `iname` varchar(100) NOT NULL,
  `mrp` double NOT NULL,
  `rprice` double NOT NULL,
  `wprice` double NOT NULL,
  `price` double NOT NULL,
  `quan` double NOT NULL,
  `free_qty` double NOT NULL DEFAULT '0',
  `amount` double NOT NULL,
  `disp` double NOT NULL,
  `disamt` double NOT NULL,
  `sub` double NOT NULL,
  `taxp` int NOT NULL,
  `taxamt` double NOT NULL,
  `total` double NOT NULL,
  `hsn` varchar(10) NOT NULL,
  `ttype` varchar(10) NOT NULL,
  `cat` varchar(100) NOT NULL,
  `manu` varchar(100) NOT NULL,
  `ttype1` varchar(20) NOT NULL,
  `iname1` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `purchase_items`
--

LOCK TABLES `purchase_items` WRITE;
/*!40000 ALTER TABLE `purchase_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `purchase_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales`
--

DROP TABLE IF EXISTS `sales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sales` (
  `billno` int NOT NULL,
  `dat` date NOT NULL,
  `tim` varchar(15) NOT NULL,
  `location` varchar(20) NOT NULL,
  `cashier` varchar(20) NOT NULL,
  `terminal` varchar(20) NOT NULL,
  `items` int NOT NULL,
  `quans` double NOT NULL,
  `sub` double NOT NULL,
  `disp` double NOT NULL,
  `disamt` double NOT NULL,
  `gross` double NOT NULL,
  `taxamt` double NOT NULL,
  `addamt` double NOT NULL,
  `round` double NOT NULL,
  `net` double NOT NULL,
  `pby` varchar(10) NOT NULL,
  `paid` double NOT NULL,
  `bal` double NOT NULL,
  `cash` double NOT NULL,
  `card` double NOT NULL,
  `credit` double NOT NULL,
  `others` double NOT NULL,
  `upi` double NOT NULL DEFAULT '0',
  `price_type` varchar(10) NOT NULL,
  `tax_type` varchar(25) NOT NULL,
  `tax` varchar(10) NOT NULL,
  `cid` varchar(10) NOT NULL DEFAULT '',
  `cardno` varchar(20) NOT NULL,
  `cname` varchar(100) NOT NULL,
  `mobile` varchar(10) NOT NULL,
  `user` varchar(15) NOT NULL,
  `last` varchar(25) NOT NULL,
  `today_points` double NOT NULL DEFAULT '0',
  `total_points` double NOT NULL DEFAULT '0',
  `cost_rate` double NOT NULL DEFAULT '0',
  `company_id` varchar(50) NOT NULL DEFAULT '',
  `loyalty_points` varchar(10) DEFAULT '0.00',
  PRIMARY KEY (`billno`,`company_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales`
--

LOCK TABLES `sales` WRITE;
/*!40000 ALTER TABLE `sales` DISABLE KEYS */;
/*!40000 ALTER TABLE `sales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales_hold`
--

DROP TABLE IF EXISTS `sales_hold`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sales_hold` (
  `billno` int NOT NULL,
  `location` varchar(20) NOT NULL DEFAULT '',
  `terminal` varchar(20) NOT NULL DEFAULT '',
  `cashier` varchar(20) NOT NULL DEFAULT '',
  `items` int NOT NULL,
  `quans` double NOT NULL DEFAULT '0',
  `net` double NOT NULL DEFAULT '0',
  `cname` varchar(100) NOT NULL DEFAULT '0',
  `barcode` varchar(20) NOT NULL DEFAULT '0',
  `ino` int NOT NULL DEFAULT '0',
  `iname` varchar(100) NOT NULL DEFAULT '0',
  `price` double NOT NULL DEFAULT '0',
  `quan` double NOT NULL DEFAULT '0',
  `remarks` varchar(80) DEFAULT NULL,
  `unit` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales_hold`
--

LOCK TABLES `sales_hold` WRITE;
/*!40000 ALTER TABLE `sales_hold` DISABLE KEYS */;
/*!40000 ALTER TABLE `sales_hold` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales_items`
--

DROP TABLE IF EXISTS `sales_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sales_items` (
  `billno` int NOT NULL,
  `dat` date NOT NULL,
  `cid` varchar(10) NOT NULL DEFAULT '',
  `serial` int NOT NULL,
  `ino` int NOT NULL,
  `iname` varchar(100) NOT NULL,
  `quan` double NOT NULL,
  `mrp` double NOT NULL,
  `price` double NOT NULL,
  `amount` double NOT NULL,
  `disp` double NOT NULL,
  `disamt` double NOT NULL,
  `sub` double NOT NULL,
  `taxp` double NOT NULL,
  `taxamt` double NOT NULL,
  `total` double NOT NULL,
  `udes` varchar(10) NOT NULL,
  `barcode` varchar(20) NOT NULL,
  `hsn` varchar(10) NOT NULL,
  `tax` varchar(10) NOT NULL,
  `entry` varchar(12) NOT NULL,
  `cost_rate` double NOT NULL,
  `profit` double NOT NULL,
  `iname1` varchar(100) NOT NULL,
  `price_type` varchar(10) NOT NULL,
  `tax_type` varchar(25) NOT NULL,
  `item_type` varchar(10) NOT NULL,
  `prate` double NOT NULL DEFAULT '0',
  `rprice` double NOT NULL DEFAULT '0',
  `wprice` double NOT NULL DEFAULT '0',
  `remarks` varchar(80) DEFAULT NULL,
  `size` varchar(50) DEFAULT NULL,
  `color` varchar(50) DEFAULT NULL,
  `brand` varchar(100) DEFAULT NULL,
  `company_id` varchar(50) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales_items`
--

LOCK TABLES `sales_items` WRITE;
/*!40000 ALTER TABLE `sales_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `sales_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `setting_email`
--

DROP TABLE IF EXISTS `setting_email`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `setting_email` (
  `user` varchar(100) NOT NULL,
  `pass` varchar(100) NOT NULL,
  `backup_option` varchar(5) NOT NULL,
  `statement_option` varchar(5) NOT NULL,
  `email1` varchar(100) NOT NULL,
  PRIMARY KEY (`user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `setting_email`
--

LOCK TABLES `setting_email` WRITE;
/*!40000 ALTER TABLE `setting_email` DISABLE KEYS */;
/*!40000 ALTER TABLE `setting_email` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `setting_points`
--

DROP TABLE IF EXISTS `setting_points`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `setting_points` (
  `points_option` varchar(5) NOT NULL,
  `hmuch` int NOT NULL DEFAULT '0',
  `pfor` int NOT NULL DEFAULT '0',
  `min_redemption` int NOT NULL DEFAULT '100',
  `conversion_rate` decimal(5,2) NOT NULL DEFAULT '1.00',
  `redemption_enabled` varchar(5) NOT NULL DEFAULT 'Yes',
  PRIMARY KEY (`points_option`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `setting_points`
--

LOCK TABLES `setting_points` WRITE;
/*!40000 ALTER TABLE `setting_points` DISABLE KEYS */;
/*!40000 ALTER TABLE `setting_points` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `setting_sms`
--

DROP TABLE IF EXISTS `setting_sms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `setting_sms` (
  `sender` varchar(6) NOT NULL,
  `user` varchar(100) NOT NULL,
  `pass` varchar(100) NOT NULL,
  `sms_alert` varchar(5) NOT NULL,
  `alter_sms` varchar(5) NOT NULL,
  `statement_sms` varchar(5) NOT NULL,
  `mobile1` varchar(10) NOT NULL,
  `mobile2` varchar(10) NOT NULL,
  `smsfoot1` varchar(100) NOT NULL,
  `smsfoot2` varchar(100) NOT NULL,
  PRIMARY KEY (`user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `setting_sms`
--

LOCK TABLES `setting_sms` WRITE;
/*!40000 ALTER TABLE `setting_sms` DISABLE KEYS */;
/*!40000 ALTER TABLE `setting_sms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `setting_user`
--

DROP TABLE IF EXISTS `setting_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `setting_user` (
  `status` varchar(100) NOT NULL,
  `dat` varchar(50) NOT NULL DEFAULT '',
  `vname` varchar(150) NOT NULL,
  `hname` varchar(500) NOT NULL,
  `mname` varchar(500) NOT NULL,
  `cid` varchar(100) NOT NULL DEFAULT '',
  `cname` varchar(500) NOT NULL,
  `uname` varchar(300) NOT NULL,
  `eno` varchar(100) NOT NULL DEFAULT '0',
  `vdate` date DEFAULT NULL,
  `log` varchar(5000) DEFAULT NULL,
  `pass` varchar(100) DEFAULT NULL,
  `user_valid_date` date DEFAULT NULL,
  `create_date` date DEFAULT NULL,
  PRIMARY KEY (`uname`),
  UNIQUE KEY `status` (`status`),
  UNIQUE KEY `cname` (`cname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `setting_user`
--

LOCK TABLES `setting_user` WRITE;
/*!40000 ALTER TABLE `setting_user` DISABLE KEYS */;
INSERT INTO `setting_user` VALUES ('Hx46xdMqKQ9yrkzEuG2jlQ==','ot7VZQh9pb0DMgAgqBI13A==','A2SdZIEqa8gJiyMJXZcF+A==','DSFN+BRsGpLEvJ2XmFqJug==','xyh/4Qi0uzc342FCgRfUkA==','zuFKOiUYDg3ZMgLmDnzpcA==','rLhPzZSh8ngyVMEqc72cVg==','tEePkj9B4Wv81qMEF6kgw2ge16BYhEKSPRz9AA0D2oTJ9cFhYz6JEQpzyFcDNBMF','rlOakNF6y1mMESXIBsyXkg==',NULL,NULL,NULL,NULL,'2026-03-21');
/*!40000 ALTER TABLE `setting_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sreturn`
--

DROP TABLE IF EXISTS `sreturn`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sreturn` (
  `billno` int NOT NULL,
  `dat` date NOT NULL,
  `tim` varchar(15) NOT NULL,
  `location` varchar(20) NOT NULL,
  `cashier` varchar(20) NOT NULL,
  `terminal` varchar(20) NOT NULL,
  `items` int NOT NULL,
  `quans` double NOT NULL,
  `sub` double NOT NULL,
  `disp` double NOT NULL,
  `disamt` double NOT NULL,
  `gross` double NOT NULL,
  `taxamt` double NOT NULL,
  `addamt` double NOT NULL,
  `round` double NOT NULL,
  `net` double NOT NULL,
  `pby` varchar(10) NOT NULL,
  `paid` double NOT NULL,
  `bal` double NOT NULL,
  `cash` double NOT NULL,
  `card` double NOT NULL,
  `credit` double NOT NULL,
  `others` double NOT NULL,
  `upi` double NOT NULL DEFAULT '0',
  `price_type` varchar(10) NOT NULL,
  `tax_type` varchar(25) NOT NULL,
  `tax` varchar(10) NOT NULL,
  `cid` varchar(10) NOT NULL DEFAULT '',
  `cardno` varchar(20) NOT NULL,
  `cname` varchar(100) NOT NULL,
  `mobile` varchar(10) NOT NULL,
  `user` varchar(15) NOT NULL,
  `last` varchar(25) NOT NULL,
  `company_id` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`billno`,`company_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sreturn`
--

LOCK TABLES `sreturn` WRITE;
/*!40000 ALTER TABLE `sreturn` DISABLE KEYS */;
/*!40000 ALTER TABLE `sreturn` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sreturn_items`
--

DROP TABLE IF EXISTS `sreturn_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sreturn_items` (
  `billno` int NOT NULL,
  `dat` date NOT NULL,
  `cid` varchar(10) NOT NULL DEFAULT '',
  `serial` int NOT NULL,
  `ino` int NOT NULL,
  `iname` varchar(100) NOT NULL,
  `quan` double NOT NULL,
  `mrp` double NOT NULL,
  `price` double NOT NULL,
  `amount` double NOT NULL,
  `disp` double NOT NULL,
  `disamt` double NOT NULL,
  `sub` double NOT NULL,
  `taxp` double NOT NULL,
  `taxamt` double NOT NULL,
  `total` double NOT NULL,
  `udes` varchar(10) NOT NULL,
  `barcode` varchar(20) NOT NULL,
  `hsn` varchar(10) NOT NULL,
  `tax` varchar(10) NOT NULL,
  `entry` varchar(12) NOT NULL,
  `cost_rate` double NOT NULL,
  `profit` double NOT NULL,
  `iname1` varchar(100) NOT NULL,
  `price_type` varchar(10) NOT NULL,
  `tax_type` varchar(25) NOT NULL,
  `item_type` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sreturn_items`
--

LOCK TABLES `sreturn_items` WRITE;
/*!40000 ALTER TABLE `sreturn_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `sreturn_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staff_entry`
--

DROP TABLE IF EXISTS `staff_entry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `staff_entry` (
  `sno` int NOT NULL,
  `dat` date NOT NULL,
  `tim` varchar(15) NOT NULL,
  `account` varchar(100) NOT NULL,
  `desig` varchar(100) NOT NULL,
  `sid` varchar(20) NOT NULL,
  `jdate` date NOT NULL,
  `sname` varchar(100) NOT NULL,
  `fname` varchar(100) NOT NULL,
  `gender` varchar(10) NOT NULL,
  `bg` varchar(20) NOT NULL,
  `dob` date NOT NULL,
  `religion` varchar(50) NOT NULL DEFAULT '',
  `nation` varchar(50) NOT NULL DEFAULT '',
  `add1` varchar(250) NOT NULL DEFAULT '',
  `add2` varchar(250) NOT NULL DEFAULT '',
  `add3` varchar(250) NOT NULL DEFAULT '',
  `area` varchar(100) NOT NULL DEFAULT '',
  `pincode` varchar(10) NOT NULL DEFAULT '',
  `mobile` varchar(10) NOT NULL DEFAULT '',
  `phone` varchar(60) NOT NULL DEFAULT '',
  `email` varchar(100) NOT NULL DEFAULT '',
  `mstatus` varchar(10) NOT NULL DEFAULT '',
  `family` varchar(150) NOT NULL DEFAULT '',
  `edu` varchar(150) NOT NULL DEFAULT '',
  `exp` varchar(150) NOT NULL DEFAULT '',
  `job` varchar(150) NOT NULL DEFAULT '',
  `langu` varchar(100) NOT NULL DEFAULT '',
  `adhaar` varchar(20) NOT NULL DEFAULT '',
  `acno` varchar(20) NOT NULL DEFAULT '',
  `remarks` varchar(150) NOT NULL DEFAULT '',
  `status` varchar(10) NOT NULL DEFAULT '',
  `edate` date NOT NULL,
  `salary` double NOT NULL DEFAULT '0',
  PRIMARY KEY (`sid`),
  UNIQUE KEY `sno` (`sno`),
  UNIQUE KEY `staff_entry_sid` (`sid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff_entry`
--

LOCK TABLES `staff_entry` WRITE;
/*!40000 ALTER TABLE `staff_entry` DISABLE KEYS */;
/*!40000 ALTER TABLE `staff_entry` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staff_photo`
--

DROP TABLE IF EXISTS `staff_photo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `staff_photo` (
  `sid` varchar(20) NOT NULL,
  `photo` blob NOT NULL,
  UNIQUE KEY `staff_photo_sid` (`sid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff_photo`
--

LOCK TABLES `staff_photo` WRITE;
/*!40000 ALTER TABLE `staff_photo` DISABLE KEYS */;
/*!40000 ALTER TABLE `staff_photo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stock`
--

DROP TABLE IF EXISTS `stock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stock` (
  `barcode` varchar(20) NOT NULL,
  `ino` int NOT NULL,
  `iname` varchar(100) NOT NULL,
  `mrp` double NOT NULL,
  `rprice` double NOT NULL,
  `wprice` double NOT NULL,
  `prate` double NOT NULL,
  `quan` double NOT NULL,
  `cat` varchar(100) NOT NULL,
  `entry` varchar(12) NOT NULL,
  `company_id` varchar(50) NOT NULL DEFAULT '',
  UNIQUE KEY `stock_ino_company` (`ino`,`company_id`),
  UNIQUE KEY `stock_barcode_company` (`barcode`,`company_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stock`
--

LOCK TABLES `stock` WRITE;
/*!40000 ALTER TABLE `stock` DISABLE KEYS */;
INSERT INTO `stock` VALUES ('1',1,'Tshirt',900,800,800,850,999,'cloths','purchase','1'),('1000',1,'PAN D',200,180,150,100,994,'tabs','purchase','2'),('1000',2,'mens jeans',3000,2500,2250,2000,683,'cloths','purchase','1'),('1001',3,'PANT',500,500,500,200,497,'cloths','purchase','1'),('1002',4,'PANT',500,500,500,4000,200,'cloths','purchase','1');
/*!40000 ALTER TABLE `stock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stock_alter`
--

DROP TABLE IF EXISTS `stock_alter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stock_alter` (
  `sno` int NOT NULL,
  `dat` date NOT NULL,
  `etype` varchar(5) NOT NULL,
  `ino` int NOT NULL,
  `iname` varchar(100) NOT NULL,
  `quan` double NOT NULL DEFAULT '0',
  `entry` varchar(10) NOT NULL DEFAULT '0',
  `stock_type` varchar(10) NOT NULL DEFAULT '0',
  `items` int NOT NULL DEFAULT '0',
  `quans` double NOT NULL DEFAULT '0',
  `user` varchar(15) NOT NULL DEFAULT '0',
  `last` varchar(25) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stock_alter`
--

LOCK TABLES `stock_alter` WRITE;
/*!40000 ALTER TABLE `stock_alter` DISABLE KEYS */;
/*!40000 ALTER TABLE `stock_alter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stock_entry`
--

DROP TABLE IF EXISTS `stock_entry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stock_entry` (
  `grn` int NOT NULL,
  `dat` date NOT NULL,
  `cname` varchar(100) NOT NULL,
  `billno` varchar(20) NOT NULL,
  `bdate` date NOT NULL,
  `bamount` double NOT NULL,
  `items` int NOT NULL,
  `quans` double NOT NULL,
  `sub` double NOT NULL,
  `dis` double NOT NULL,
  `gross` double NOT NULL,
  `tax` double NOT NULL,
  `fright` double NOT NULL,
  `other` double NOT NULL,
  `gt` double NOT NULL,
  `round` double NOT NULL,
  `net` double NOT NULL,
  `pby` varchar(10) NOT NULL,
  `user` varchar(15) NOT NULL,
  `last` varchar(25) NOT NULL,
  `ttype` varchar(25) NOT NULL,
  `dis1` double NOT NULL DEFAULT '0',
  `company_id` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`grn`,`company_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stock_entry`
--

LOCK TABLES `stock_entry` WRITE;
/*!40000 ALTER TABLE `stock_entry` DISABLE KEYS */;
INSERT INTO `stock_entry` VALUES (1,'2026-03-26','sandip Belote','123456','2026-03-26',765000,1,1000,850000,85000,765000,0,0,0,765000,0,765000,'Credit','','26/03/2026  03:39:26 pm','No Tax',0,'1'),(1,'2026-03-29','Rohit pharama','123456','2026-03-29',108000,1,1000,120000,12000,108000,0,0,0,108000,0,108000,'Credit','','29/03/2026  01:29:39 pm','No Tax',0,'2'),(2,'2026-03-26','sandip','124563.','2026-03-26',400000,1,200,400000,0,400000,0,0,0,400000,0,400000,'Credit','','26/03/2026  04:33:43 pm','No Tax',0,'1'),(2,'2026-03-29','Rohit pharama','4578914','2026-03-29',90000,1,1000,100000,10000,90000,0,0,0,90000,0,90000,'Credit','','29/03/2026  05:09:25 pm','No Tax',0,'2'),(3,'2026-03-27','sandip','1451662','2026-03-27',360000,1,200,400000,40000,360000,0,0,0,360000,0,360000,'Credit','','27/03/2026  10:11:13 pm','No Tax',0,'1'),(4,'2026-03-27','sandip','1233335','2026-03-27',90000,1,500,100000,10000,90000,0,0,0,90000,0,90000,'Credit','','27/03/2026  10:14:58 pm','No Tax',0,'1');
/*!40000 ALTER TABLE `stock_entry` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stock_entry_items`
--

DROP TABLE IF EXISTS `stock_entry_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stock_entry_items` (
  `grn` int NOT NULL,
  `dat` date NOT NULL,
  `cname` varchar(100) NOT NULL,
  `billno` varchar(20) NOT NULL,
  `bdate` date NOT NULL,
  `barcode` varchar(20) NOT NULL,
  `ino` int NOT NULL,
  `iname` varchar(100) NOT NULL,
  `mrp` double NOT NULL,
  `rprice` double NOT NULL,
  `wprice` double NOT NULL,
  `price` double NOT NULL,
  `quan` double NOT NULL,
  `amount` double NOT NULL,
  `disp` double NOT NULL,
  `disamt` double NOT NULL,
  `sub` double NOT NULL,
  `taxp` int NOT NULL,
  `taxamt` double NOT NULL,
  `total` double NOT NULL,
  `hsn` varchar(10) NOT NULL,
  `ttype` varchar(10) NOT NULL,
  `cat` varchar(100) NOT NULL,
  `manu` varchar(100) NOT NULL,
  `ttype1` varchar(25) NOT NULL,
  `iname1` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stock_entry_items`
--

LOCK TABLES `stock_entry_items` WRITE;
/*!40000 ALTER TABLE `stock_entry_items` DISABLE KEYS */;
INSERT INTO `stock_entry_items` VALUES (1,'2026-03-26','sandip Belote','123456','2026-03-26','1',1,'Tshirt',900,800,800,850,1000,850000,10,85000,765000,5,0,765000,'.','Local','cloths','DD','No Tax','Tshirt'),(2,'2026-03-26','sandip','124563.','2026-03-26','1000',2,'mens jeans',3000,2500,2250,2000,200,400000,0,0,400000,0,0,400000,'.','Local','cloths','DD','No Tax','mens jeans'),(3,'2026-03-27','sandip','1451662','2026-03-27','1000',2,'mens jeans',3000,2500,2250,2000,200,400000,10,40000,360000,5,0,360000,'.','Local','cloths','DD','No Tax','mens jeans'),(4,'2026-03-27','sandip','1233335','2026-03-27','1001',3,'PANT',500,500,500,200,500,100000,10,10000,90000,5,0,90000,'321456','Local','cloths','DD','No Tax','PANT'),(1,'2026-03-29','Rohit pharama','123456','2026-03-29','1000',1,'DOLO',130,130,125,120,1000,120000,10,12000,108000,0,0,108000,'1234562','Local','tab','.','No Tax','DOLO'),(2,'2026-03-29','Rohit pharama','4578914','2026-03-29','1000',1,'PAN D',200,180,150,100,1000,100000,10,10000,90000,5,0,90000,'.','Local','tabs','.','No Tax','PAN D');
/*!40000 ALTER TABLE `stock_entry_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_features`
--

DROP TABLE IF EXISTS `user_features`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_features` (
  `sno` int NOT NULL DEFAULT '0',
  `fname` varchar(25) NOT NULL,
  PRIMARY KEY (`fname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_features`
--

LOCK TABLES `user_features` WRITE;
/*!40000 ALTER TABLE `user_features` DISABLE KEYS */;
INSERT INTO `user_features` VALUES (8,'Accounts'),(17,'Backup'),(10,'Customer'),(14,'Email'),(3,'Estimate'),(18,'Home Page Display'),(11,'HR'),(4,'Item'),(16,'Loyalty'),(15,'Manual Barcode'),(7,'Packing'),(6,'PO'),(2,'Purchase'),(1,'Sales'),(13,'SMS'),(5,'Stock'),(9,'Supplier'),(12,'Tax Reports');
/*!40000 ALTER TABLE `user_features` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `utype` varchar(150) NOT NULL,
  `user` varchar(150) NOT NULL,
  `pass` varchar(100) NOT NULL,
  `last` varchar(100) NOT NULL,
  KEY `idx_user` (`user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES ('License Owner','ambika','xybmkiJRwwRMDjHP45xVWQ==$OEvdb4YyL3hLix3kwmaYrc+Wa/BDg2g5SDNtZeTZd4s=','21/03/2026 05:20:39 pm'),('Super Admin','sambika','SQx9hfFMoSvAG/JmTZqKdw==$LMkXTjTPvWmPECVgY0hRs/E7mN5IuHB3n679wKK5Gg0=','21/03/2026  05:23:22 pm');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_permissions`
--

DROP TABLE IF EXISTS `users_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_permissions` (
  `user` varchar(15) NOT NULL,
  `fname` varchar(25) NOT NULL,
  `option1` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_permissions`
--

LOCK TABLES `users_permissions` WRITE;
/*!40000 ALTER TABLE `users_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `users_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ven_bal`
--

DROP TABLE IF EXISTS `ven_bal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ven_bal` (
  `billno` varchar(20) NOT NULL DEFAULT '',
  `dat` date NOT NULL,
  `ddate` date NOT NULL,
  `cname` varchar(100) NOT NULL,
  `tot` double NOT NULL,
  `paid` double NOT NULL,
  `last` varchar(25) NOT NULL DEFAULT '',
  `company_id` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ven_bal`
--

LOCK TABLES `ven_bal` WRITE;
/*!40000 ALTER TABLE `ven_bal` DISABLE KEYS */;
INSERT INTO `ven_bal` VALUES ('123456','2026-03-26','2026-03-26','sandip Belote',765000,0,'26/03/2026  03:39:26 pm','1'),('124563.','2026-03-26','2026-03-26','sandip',400000,0,'26/03/2026  04:33:43 pm','1'),('1451662','2026-03-27','2026-03-27','sandip',360000,0,'27/03/2026  10:11:13 pm','1'),('1233335','2026-03-27','2026-03-27','sandip',90000,0,'27/03/2026  10:14:58 pm','1'),('1234523','2026-03-27','2026-03-27','sandip',840000,0,'27/03/2026  10:23:38 pm','1'),('1245361','2026-03-28','2026-03-28','sandip',1050,0,'28/03/2026  10:29:08 pm','1'),('123456','2026-03-29','2026-03-29','Rohit pharama',108000,108000,'29/03/2026  01:29:39 pm','2'),('4578914','2026-03-29','2026-03-29','Rohit pharama',90000,90000,'29/03/2026  05:09:25 pm','2');
/*!40000 ALTER TABLE `ven_bal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ven_bill`
--

DROP TABLE IF EXISTS `ven_bill`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ven_bill` (
  `sno` int NOT NULL,
  `cname` varchar(100) NOT NULL DEFAULT '',
  `billno` varchar(100) NOT NULL DEFAULT '',
  `dat` date NOT NULL,
  `ddate` date NOT NULL,
  `amount` double NOT NULL DEFAULT '0',
  `remarks` varchar(150) NOT NULL DEFAULT '0',
  `user` varchar(15) NOT NULL DEFAULT '0',
  `last` varchar(25) NOT NULL DEFAULT '0',
  `company_id` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`sno`,`company_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ven_bill`
--

LOCK TABLES `ven_bill` WRITE;
/*!40000 ALTER TABLE `ven_bill` DISABLE KEYS */;
/*!40000 ALTER TABLE `ven_bill` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ven_pay`
--

DROP TABLE IF EXISTS `ven_pay`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ven_pay` (
  `sno` int NOT NULL,
  `dat` date NOT NULL,
  `tim` varchar(15) NOT NULL,
  `cname` varchar(100) NOT NULL,
  `billno` varchar(20) NOT NULL,
  `amount` double NOT NULL,
  `net` double NOT NULL,
  `pby` varchar(10) NOT NULL,
  `remarks` varchar(100) NOT NULL,
  `user` varchar(15) NOT NULL,
  `last` varchar(25) NOT NULL,
  `company_id` varchar(50) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ven_pay`
--

LOCK TABLES `ven_pay` WRITE;
/*!40000 ALTER TABLE `ven_pay` DISABLE KEYS */;
INSERT INTO `ven_pay` VALUES (1,'2026-03-29','10:41:57 pm','Rohit pharama','123456',108000,198000,'Cash','.','','29/03/2026  10:42:06 pm','2'),(1,'2026-03-29','10:41:57 pm','Rohit pharama','4578914',90000,198000,'Cash','.','','29/03/2026  10:42:06 pm','2');
/*!40000 ALTER TABLE `ven_pay` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vendor`
--

DROP TABLE IF EXISTS `vendor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vendor` (
  `cname` varchar(100) NOT NULL DEFAULT '',
  `add1` varchar(250) NOT NULL DEFAULT '',
  `add2` varchar(250) NOT NULL DEFAULT '',
  `add3` varchar(250) NOT NULL DEFAULT '',
  `city` varchar(100) NOT NULL DEFAULT '',
  `mobile` varchar(10) NOT NULL DEFAULT '',
  `phone` varchar(60) NOT NULL DEFAULT '',
  `gstno` varchar(15) NOT NULL DEFAULT '',
  `sname` varchar(50) NOT NULL,
  `scode` varchar(5) NOT NULL,
  `duedays` int NOT NULL DEFAULT '0',
  `remarks` varchar(250) NOT NULL DEFAULT '0',
  `email` varchar(100) NOT NULL DEFAULT '0',
  `company_id` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`cname`,`company_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vendor`
--

LOCK TABLES `vendor` WRITE;
/*!40000 ALTER TABLE `vendor` DISABLE KEYS */;
INSERT INTO `vendor` VALUES ('Rohit pharama','Pune','.','.','.','7588168856','.','.','.','.',0,'.','.','2'),('sandip','Pune','.','.','.','.','.','.','.','.',0,'.','.','1');
/*!40000 ALTER TABLE `vendor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vendor_link`
--

DROP TABLE IF EXISTS `vendor_link`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vendor_link` (
  `cname` varchar(100) NOT NULL,
  `ino` int NOT NULL,
  `iname` varchar(100) NOT NULL,
  `cat` varchar(100) NOT NULL,
  `manu` varchar(100) NOT NULL,
  `taxp` int NOT NULL DEFAULT '0',
  `minstock` double NOT NULL DEFAULT '0',
  `last` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vendor_link`
--

LOCK TABLES `vendor_link` WRITE;
/*!40000 ALTER TABLE `vendor_link` DISABLE KEYS */;
/*!40000 ALTER TABLE `vendor_link` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-03-30  7:06:16
