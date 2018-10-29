CREATE DATABASE  IF NOT EXISTS `project_ite442` /*!40100 DEFAULT CHARACTER SET utf32 COLLATE utf32_unicode_ci */;
USE `project_ite442`;
-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: project_ite442
-- ------------------------------------------------------
-- Server version	5.5.5-10.1.19-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer` (
  `Customer_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `Phone_Number` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`Customer_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (1,'pavin','1234'),(2,'sai','5678'),(3,'Ajarn','1233'),(4,'??????','1232');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `main`
--

DROP TABLE IF EXISTS `main`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `main` (
  `Repair_Num` int(11) NOT NULL AUTO_INCREMENT,
  `Repair_Form` varchar(45) NOT NULL,
  `Product_Code` varchar(45) NOT NULL,
  `Warranty_Code` int(11) NOT NULL,
  `Pro_Num` int(11) DEFAULT NULL,
  `Customer_ID` int(11) NOT NULL,
  `Tracking_Id` int(11) NOT NULL,
  `Department_Store` varchar(45) NOT NULL,
  `Repair_Detail` varchar(45) NOT NULL,
  PRIMARY KEY (`Repair_Num`),
  UNIQUE KEY `Tracking_Id_UNIQUE` (`Tracking_Id`),
  UNIQUE KEY `Pro_Num_UNIQUE` (`Pro_Num`),
  KEY `Warranty_idx` (`Warranty_Code`),
  KEY `Product_idx` (`Product_Code`),
  KEY `Customer_idx` (`Customer_ID`),
  KEY `Tracking_idx` (`Tracking_Id`),
  KEY `Pro_idx` (`Pro_Num`),
  CONSTRAINT `Customer` FOREIGN KEY (`Customer_ID`) REFERENCES `customer` (`Customer_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Pro` FOREIGN KEY (`Pro_Num`) REFERENCES `repair_cost` (`Pro_Number`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Product` FOREIGN KEY (`Product_Code`) REFERENCES `product` (`Product_Code`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `ToWarranty` FOREIGN KEY (`Warranty_Code`) REFERENCES `warranty` (`Warranty_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Tracking` FOREIGN KEY (`Tracking_Id`) REFERENCES `tracking` (`Tracking_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `main`
--

LOCK TABLES `main` WRITE;
/*!40000 ALTER TABLE `main` DISABLE KEYS */;
INSERT INTO `main` VALUES (0,'222','ABAC00200',1,NULL,1,1001,'Bangna','peal');
/*!40000 ALTER TABLE `main` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product` (
  `Product_Code` varchar(45) NOT NULL,
  `Size` varchar(45) NOT NULL,
  `Product_description` varchar(45) DEFAULT NULL,
  `Collection` varchar(45) NOT NULL,
  `Warranty` int(11) NOT NULL,
  PRIMARY KEY (`Product_Code`),
  KEY `FromproducttoWarranty_idx` (`Warranty`),
  CONSTRAINT `productToWarranty` FOREIGN KEY (`Warranty`) REFERENCES `warranty` (`Warranty_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES ('ABAC00200','A',NULL,'AC',1),('ABAC00255','A',NULL,'AC',1);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `purchased`
--

DROP TABLE IF EXISTS `purchased`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `purchased` (
  `Purchase_ID` int(11) NOT NULL,
  `Date_of_purchase` datetime NOT NULL,
  `Customer_id` int(11) NOT NULL,
  `Product_Num` varchar(45) NOT NULL,
  PRIMARY KEY (`Purchase_ID`),
  UNIQUE KEY `Purchase_ID_UNIQUE` (`Purchase_ID`),
  KEY `Customer_num_idx` (`Customer_id`),
  KEY `ToProduct_idx` (`Product_Num`),
  CONSTRAINT `Customer_num` FOREIGN KEY (`Customer_id`) REFERENCES `customer` (`Customer_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `ToProduct` FOREIGN KEY (`Product_Num`) REFERENCES `product` (`Product_Code`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `purchased`
--

LOCK TABLES `purchased` WRITE;
/*!40000 ALTER TABLE `purchased` DISABLE KEYS */;
INSERT INTO `purchased` VALUES (1,'2018-10-03 00:00:00',1,'ABAC00200'),(2,'2018-10-03 00:00:00',2,'ABAC00255'),(3,'2018-10-03 00:00:00',1,'ABAC00200');
/*!40000 ALTER TABLE `purchased` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `repair_cost`
--

DROP TABLE IF EXISTS `repair_cost`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `repair_cost` (
  `Pro_Number` int(11) NOT NULL AUTO_INCREMENT,
  `Repair_price` int(11) NOT NULL,
  `Money_receivePRO` date DEFAULT NULL,
  `Warranty_Num` int(11) NOT NULL,
  PRIMARY KEY (`Pro_Number`),
  KEY `FK_warranty_idx` (`Warranty_Num`),
  CONSTRAINT `FK_warranty` FOREIGN KEY (`Warranty_Num`) REFERENCES `warranty` (`Warranty_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `repair_cost`
--

LOCK TABLES `repair_cost` WRITE;
/*!40000 ALTER TABLE `repair_cost` DISABLE KEYS */;
INSERT INTO `repair_cost` VALUES (1,100,'2018-09-17',2),(2,100,'2018-09-17',2);
/*!40000 ALTER TABLE `repair_cost` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tracking`
--

DROP TABLE IF EXISTS `tracking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tracking` (
  `Tracking_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Date_cust_Receive` date DEFAULT NULL,
  `Date_Arrive_Comp` date DEFAULT NULL,
  `Send_To_Factory` date DEFAULT NULL,
  `Receive_Back_Factory` date DEFAULT NULL,
  `Date_Return_Dept` date DEFAULT NULL,
  `Send_Method` varchar(45) DEFAULT NULL,
  `Person_Sent` varchar(45) DEFAULT NULL,
  `SendTo_Customer` int(11) NOT NULL,
  `Purchase` int(11) NOT NULL,
  `Repair_Location` varchar(45) NOT NULL,
  `Product_ID` varchar(45) NOT NULL,
  PRIMARY KEY (`Tracking_ID`),
  KEY `Purchase_idx` (`Purchase`),
  KEY `Tracking_Purchase_idx` (`Purchase`),
  KEY `sendto_customer_idx` (`SendTo_Customer`),
  KEY `product_ID_idx` (`Product_ID`),
  CONSTRAINT `Product_FK` FOREIGN KEY (`Product_ID`) REFERENCES `product` (`Product_Code`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `SendCust` FOREIGN KEY (`SendTo_Customer`) REFERENCES `customer` (`Customer_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Tracking_Purchase` FOREIGN KEY (`Purchase`) REFERENCES `purchased` (`Purchase_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=1004 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tracking`
--

LOCK TABLES `tracking` WRITE;
/*!40000 ALTER TABLE `tracking` DISABLE KEYS */;
INSERT INTO `tracking` VALUES (1001,'2018-10-03','2018-10-03','2018-10-03','2018-10-03','2018-10-03','EMS','Pavin',1,1,'Pong','ABAC00200'),(1002,'2018-10-03','2018-10-03','2018-10-03','2018-10-03','2018-10-03','Plan','Pavin',2,2,'pong','ABAC00255'),(1003,'2018-10-03','2018-10-03','2018-10-03','2018-10-03','2018-10-03','EMS','Pavin',1,3,'Pong','ABAC00200');
/*!40000 ALTER TABLE `tracking` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `warranty`
--

DROP TABLE IF EXISTS `warranty`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `warranty` (
  `Warranty_ID` int(11) NOT NULL,
  `Warranty_Type` varchar(45) NOT NULL,
  PRIMARY KEY (`Warranty_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `warranty`
--

LOCK TABLES `warranty` WRITE;
/*!40000 ALTER TABLE `warranty` DISABLE KEYS */;
INSERT INTO `warranty` VALUES (1,'in warranty'),(2,'no warranty');
/*!40000 ALTER TABLE `warranty` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-10-07 14:56:54
