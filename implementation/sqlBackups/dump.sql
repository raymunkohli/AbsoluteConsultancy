-- MySQL dump 10.13  Distrib 5.7.21, for Win32 (AMD64)
--
-- Host: localhost    Database: sys
-- ------------------------------------------------------
-- Server version	5.7.21-log

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
-- Table structure for table `band`
--

DROP TABLE IF EXISTS `band`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `band` (
  `BandID` int(10) NOT NULL AUTO_INCREMENT,
  `lowerBound` double NOT NULL,
  `upperBound` double NOT NULL,
  `discount` double NOT NULL,
  PRIMARY KEY (`BandID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `band`
--

LOCK TABLES `band` WRITE;
/*!40000 ALTER TABLE `band` DISABLE KEYS */;
INSERT INTO `band` VALUES (1,0,10,2.75),(2,11,20,3.53);
/*!40000 ALTER TABLE `band` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `basetask`
--

DROP TABLE IF EXISTS `basetask`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `basetask` (
  `taskName` varchar(255) NOT NULL,
  `department` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `price` double NOT NULL,
  `baseTaskID` int(10) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`baseTaskID`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `basetask`
--

LOCK TABLES `basetask` WRITE;
/*!40000 ALTER TABLE `basetask` DISABLE KEYS */;
INSERT INTO `basetask` VALUES ('use printer','Copy','using the printer',5.2,1),('12321','Development','123131',3.2,9),('21314','Finishing','12321312',4,10),('12312','Packaging','2131',5,11);
/*!40000 ALTER TABLE `basetask` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cardpayment`
--

DROP TABLE IF EXISTS `cardpayment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cardpayment` (
  `PaymentJobJobID` int(10) NOT NULL,
  `cardNo` int(10) NOT NULL,
  `expDate` varchar(5) NOT NULL,
  `type` varchar(30) NOT NULL,
  PRIMARY KEY (`PaymentJobJobID`),
  KEY `FKcardPaymen338903` (`PaymentJobJobID`),
  CONSTRAINT `FKcardPaymen338903` FOREIGN KEY (`PaymentJobJobID`) REFERENCES `payment` (`JobJobID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cardpayment`
--

LOCK TABLES `cardpayment` WRITE;
/*!40000 ALTER TABLE `cardpayment` DISABLE KEYS */;
/*!40000 ALTER TABLE `cardpayment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer` (
  `customerID` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `surname` varchar(255) NOT NULL,
  `phoneNo` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `postcode` varchar(255) NOT NULL,
  `holder` varchar(45) NOT NULL,
  PRIMARY KEY (`customerID`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (15,'test man','test person','1231312','123@1231','r12312','21312','boss man 2'),(16,'fixeddiscount','123','123','123','123','123','123'),(17,'flexdiscount','123','123','123','123','123','123'),(18,'variablediscount','123','1231312','123','123','123','123');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `defaultcustomer`
--

DROP TABLE IF EXISTS `defaultcustomer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `defaultcustomer` (
  `suspendedCustomerValuedCustomerCustomercustomerID` int(10) NOT NULL,
  PRIMARY KEY (`suspendedCustomerValuedCustomerCustomercustomerID`),
  KEY `FKdefaultCus575149` (`suspendedCustomerValuedCustomerCustomercustomerID`),
  CONSTRAINT `FKdefaultCus575149` FOREIGN KEY (`suspendedCustomerValuedCustomerCustomercustomerID`) REFERENCES `suspendedcustomer` (`ValuedCustomerCustomercustomerID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `defaultcustomer`
--

LOCK TABLES `defaultcustomer` WRITE;
/*!40000 ALTER TABLE `defaultcustomer` DISABLE KEYS */;
/*!40000 ALTER TABLE `defaultcustomer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `discount`
--

DROP TABLE IF EXISTS `discount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `discount` (
  `discountID` int(10) NOT NULL AUTO_INCREMENT,
  `discountType` varchar(255) NOT NULL,
  PRIMARY KEY (`discountID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `discount`
--

LOCK TABLES `discount` WRITE;
/*!40000 ALTER TABLE `discount` DISABLE KEYS */;
INSERT INTO `discount` VALUES (1,'Fixed'),(2,'Flexible'),(3,'Variable');
/*!40000 ALTER TABLE `discount` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enquire`
--

DROP TABLE IF EXISTS `enquire`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enquire` (
  `TasktaskID` int(10) NOT NULL,
  `enquireNumber` int(11) NOT NULL,
  `information` varchar(255) NOT NULL,
  PRIMARY KEY (`TasktaskID`,`enquireNumber`),
  KEY `FKenquire217603` (`TasktaskID`),
  CONSTRAINT `FKenquire217603` FOREIGN KEY (`TasktaskID`) REFERENCES `task` (`taskID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enquire`
--

LOCK TABLES `enquire` WRITE;
/*!40000 ALTER TABLE `enquire` DISABLE KEYS */;
/*!40000 ALTER TABLE `enquire` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fixeddiscount`
--

DROP TABLE IF EXISTS `fixeddiscount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fixeddiscount` (
  `DiscountdiscountID` int(10) NOT NULL,
  `percentDiscount` int(10) DEFAULT NULL,
  PRIMARY KEY (`DiscountdiscountID`),
  KEY `FKFixedDisco316205` (`DiscountdiscountID`),
  CONSTRAINT `FKFixedDisco316205` FOREIGN KEY (`DiscountdiscountID`) REFERENCES `discount` (`discountID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fixeddiscount`
--

LOCK TABLES `fixeddiscount` WRITE;
/*!40000 ALTER TABLE `fixeddiscount` DISABLE KEYS */;
INSERT INTO `fixeddiscount` VALUES (1,3);
/*!40000 ALTER TABLE `fixeddiscount` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flexiblediscount`
--

DROP TABLE IF EXISTS `flexiblediscount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `flexiblediscount` (
  `DiscountdiscountID` int(10) NOT NULL,
  `aquiredValue` int(10) NOT NULL,
  `bandBandID` int(10) NOT NULL,
  PRIMARY KEY (`DiscountdiscountID`),
  KEY `FKflexibleDi276331` (`DiscountdiscountID`),
  KEY `FKflexibleDi397436` (`bandBandID`),
  CONSTRAINT `FKflexibleDi276331` FOREIGN KEY (`DiscountdiscountID`) REFERENCES `discount` (`discountID`),
  CONSTRAINT `FKflexibleDi397436` FOREIGN KEY (`bandBandID`) REFERENCES `band` (`BandID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flexiblediscount`
--

LOCK TABLES `flexiblediscount` WRITE;
/*!40000 ALTER TABLE `flexiblediscount` DISABLE KEYS */;
INSERT INTO `flexiblediscount` VALUES (2,17,2);
/*!40000 ALTER TABLE `flexiblediscount` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job`
--

DROP TABLE IF EXISTS `job`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `job` (
  `JobID` int(10) NOT NULL AUTO_INCREMENT,
  `CustomercustomerID` int(10) NOT NULL,
  `orderDate` datetime NOT NULL,
  `collectionDate` datetime DEFAULT NULL,
  `specInstructions` varchar(255) NOT NULL,
  `deadline` datetime NOT NULL,
  `value` decimal(10,2) NOT NULL,
  `finished` tinyint(4) DEFAULT '0',
  `surcharge` varchar(45) NOT NULL,
  PRIMARY KEY (`JobID`),
  KEY `FKJob102033` (`CustomercustomerID`),
  CONSTRAINT `FKJob102033` FOREIGN KEY (`CustomercustomerID`) REFERENCES `customer` (`customerID`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job`
--

LOCK TABLES `job` WRITE;
/*!40000 ALTER TABLE `job` DISABLE KEYS */;
INSERT INTO `job` VALUES (44,18,'2018-04-08 20:24:37',NULL,'1231231','2018-04-07 20:24:37',17.00,1,'0.0'),(45,15,'2018-04-06 20:25:51',NULL,'123412','2018-04-07 20:25:51',17.00,1,'0.0'),(47,15,'2018-04-06 20:26:08',NULL,'1231','2018-04-07 02:26:08',17.00,1,'0.0'),(48,16,'2018-04-06 20:26:23',NULL,'123123','2018-04-07 02:26:23',17.00,1,'0.0'),(49,17,'2018-04-06 20:26:35',NULL,'123213','2018-04-07 02:26:35',17.00,1,'0.0'),(50,18,'2018-04-06 20:26:49',NULL,'1231231','2018-04-07 02:26:49',17.00,1,'0.0');
/*!40000 ALTER TABLE `job` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payment` (
  `JobJobID` int(10) NOT NULL,
  `paymentDate` date NOT NULL,
  PRIMARY KEY (`JobJobID`),
  KEY `FKPayment170102` (`JobJobID`),
  CONSTRAINT `FKPayment170102` FOREIGN KEY (`JobJobID`) REFERENCES `job` (`JobID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment`
--

LOCK TABLES `payment` WRITE;
/*!40000 ALTER TABLE `payment` DISABLE KEYS */;
INSERT INTO `payment` VALUES (44,'2018-03-28'),(45,'2018-04-03'),(47,'2018-04-03'),(49,'2018-04-10'),(50,'2018-03-28');
/*!40000 ALTER TABLE `payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staff`
--

DROP TABLE IF EXISTS `staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `staff` (
  `staffID` int(10) NOT NULL AUTO_INCREMENT,
  `firstName` varchar(255) NOT NULL,
  `surName` varchar(255) NOT NULL,
  `employeeType` varchar(255) NOT NULL,
  `password` varchar(45) NOT NULL,
  PRIMARY KEY (`staffID`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff`
--

LOCK TABLES `staff` WRITE;
/*!40000 ALTER TABLE `staff` DISABLE KEYS */;
INSERT INTO `staff` VALUES (1,'ray','kohli','ShiftManager','123'),(2,'bob','ross','OfficeManager','123'),(3,'tech bro','minglee','Technician','123'),(5,'213','123','Receptionist','233'),(6,'213','123','Receptionist','233'),(7,'213123','123213','Technician','233'),(19,'1231','123','Technician','123');
/*!40000 ALTER TABLE `staff` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `suspendedcustomer`
--

DROP TABLE IF EXISTS `suspendedcustomer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `suspendedcustomer` (
  `ValuedCustomerCustomercustomerID` int(10) NOT NULL,
  PRIMARY KEY (`ValuedCustomerCustomercustomerID`),
  KEY `FKsuspendedC671399` (`ValuedCustomerCustomercustomerID`),
  CONSTRAINT `FKsuspendedC671399` FOREIGN KEY (`ValuedCustomerCustomercustomerID`) REFERENCES `valuedcustomer` (`CustomercustomerID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `suspendedcustomer`
--

LOCK TABLES `suspendedcustomer` WRITE;
/*!40000 ALTER TABLE `suspendedcustomer` DISABLE KEYS */;
/*!40000 ALTER TABLE `suspendedcustomer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `task`
--

DROP TABLE IF EXISTS `task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task` (
  `taskID` int(10) NOT NULL AUTO_INCREMENT,
  `shelf` varchar(10) DEFAULT NULL,
  `startDate` datetime DEFAULT NULL,
  `endDate` datetime DEFAULT NULL,
  `StaffstaffID` int(10) DEFAULT NULL,
  `JobJobID` int(10) NOT NULL,
  `baseTaskbaseTaskID` int(10) NOT NULL,
  PRIMARY KEY (`taskID`),
  KEY `FKTask954031` (`StaffstaffID`),
  KEY `FKTask543586` (`JobJobID`),
  KEY `FKTask168614` (`baseTaskbaseTaskID`),
  CONSTRAINT `FKTask168614` FOREIGN KEY (`baseTaskbaseTaskID`) REFERENCES `basetask` (`baseTaskID`),
  CONSTRAINT `FKTask543586` FOREIGN KEY (`JobJobID`) REFERENCES `job` (`JobID`),
  CONSTRAINT `FKTask954031` FOREIGN KEY (`StaffstaffID`) REFERENCES `staff` (`staffID`)
) ENGINE=InnoDB AUTO_INCREMENT=98 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `task`
--

LOCK TABLES `task` WRITE;
/*!40000 ALTER TABLE `task` DISABLE KEYS */;
INSERT INTO `task` VALUES (74,NULL,'2016-02-02 10:44:59','2016-02-02 12:24:59',1,44,1),(75,NULL,'2016-04-02 12:44:59','2016-04-02 17:24:59',1,44,9),(76,NULL,'2016-02-02 12:44:59','2016-02-02 17:24:59',2,44,10),(77,NULL,'2016-03-02 22:44:59','2016-03-02 23:24:59',2,44,11),(78,NULL,'2017-02-02 12:44:59','2017-02-02 13:00:00',1,45,1),(79,NULL,'2017-07-02 12:44:59','2017-07-02 13:00:00',2,45,9),(80,NULL,'2017-12-02 12:44:59','2017-12-02 13:00:00',2,45,10),(81,NULL,'2017-05-02 12:44:59','2017-05-02 13:00:00',1,45,11),(82,NULL,NULL,NULL,NULL,47,1),(83,NULL,NULL,NULL,NULL,47,9),(84,NULL,NULL,NULL,NULL,47,10),(85,NULL,NULL,NULL,NULL,47,11),(86,NULL,NULL,NULL,NULL,48,1),(87,NULL,NULL,NULL,NULL,48,9),(88,NULL,NULL,NULL,NULL,48,10),(89,NULL,NULL,NULL,NULL,48,11),(90,NULL,NULL,NULL,NULL,49,1),(91,NULL,NULL,NULL,NULL,49,9),(92,NULL,NULL,NULL,NULL,49,10),(93,NULL,NULL,NULL,NULL,49,11),(94,NULL,NULL,NULL,NULL,50,1),(95,NULL,NULL,NULL,NULL,50,9),(96,NULL,NULL,NULL,NULL,50,10),(97,NULL,NULL,NULL,NULL,50,11);
/*!40000 ALTER TABLE `task` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `technicianroom`
--

DROP TABLE IF EXISTS `technicianroom`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `technicianroom` (
  `staff_staffID` int(10) NOT NULL,
  `technicianroom` varchar(45) NOT NULL,
  PRIMARY KEY (`staff_staffID`),
  KEY `fk_technicianroom_staff1_idx` (`staff_staffID`),
  CONSTRAINT `fk_technicianroom_staff1` FOREIGN KEY (`staff_staffID`) REFERENCES `staff` (`staffID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `technicianroom`
--

LOCK TABLES `technicianroom` WRITE;
/*!40000 ALTER TABLE `technicianroom` DISABLE KEYS */;
INSERT INTO `technicianroom` VALUES (3,'Copy'),(7,'Packaging'),(19,'Copy');
/*!40000 ALTER TABLE `technicianroom` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `valuedcustomer`
--

DROP TABLE IF EXISTS `valuedcustomer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `valuedcustomer` (
  `CustomercustomerID` int(10) NOT NULL,
  `DiscountdiscountID` int(10) DEFAULT NULL,
  PRIMARY KEY (`CustomercustomerID`),
  KEY `FKValuedCust496434` (`DiscountdiscountID`),
  KEY `FKValuedCust741192` (`CustomercustomerID`),
  CONSTRAINT `FKValuedCust496434` FOREIGN KEY (`DiscountdiscountID`) REFERENCES `discount` (`discountID`),
  CONSTRAINT `FKValuedCust741192` FOREIGN KEY (`CustomercustomerID`) REFERENCES `customer` (`customerID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `valuedcustomer`
--

LOCK TABLES `valuedcustomer` WRITE;
/*!40000 ALTER TABLE `valuedcustomer` DISABLE KEYS */;
INSERT INTO `valuedcustomer` VALUES (16,1),(17,2),(18,3);
/*!40000 ALTER TABLE `valuedcustomer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `variablediscount`
--

DROP TABLE IF EXISTS `variablediscount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `variablediscount` (
  `DiscountdiscountID` int(10) NOT NULL,
  `amount` double NOT NULL,
  `basetask_baseTaskID` int(10) NOT NULL,
  PRIMARY KEY (`DiscountdiscountID`,`basetask_baseTaskID`),
  KEY `FKvariableDi1347` (`DiscountdiscountID`),
  KEY `fk_variablediscount_basetask1_idx` (`basetask_baseTaskID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `variablediscount`
--

LOCK TABLES `variablediscount` WRITE;
/*!40000 ALTER TABLE `variablediscount` DISABLE KEYS */;
INSERT INTO `variablediscount` VALUES (3,2,1),(3,1.5,9),(3,2.75,10),(3,2.23,11);
/*!40000 ALTER TABLE `variablediscount` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-04-11  9:23:27
