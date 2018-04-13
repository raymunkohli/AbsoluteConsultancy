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
  `flexiblediscount_DiscountdiscountID` int(10) NOT NULL,
  PRIMARY KEY (`BandID`),
  KEY `fk_band_flexiblediscount1_idx` (`flexiblediscount_DiscountdiscountID`),
  CONSTRAINT `fk_band_flexiblediscount1` FOREIGN KEY (`flexiblediscount_DiscountdiscountID`) REFERENCES `flexiblediscount` (`DiscountdiscountID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `band`
--

LOCK TABLES `band` WRITE;
/*!40000 ALTER TABLE `band` DISABLE KEYS */;
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
  `duration` int(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`baseTaskID`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `basetask`
--

LOCK TABLES `basetask` WRITE;
/*!40000 ALTER TABLE `basetask` DISABLE KEYS */;
INSERT INTO `basetask` VALUES ('use printer','Copy','using the printer',5.2,1,30),('12321','Development','123131',3.2,9,40),('21314','Finishing','12321312',4,10,20),('12312','Packaging','2131',5,11,10);
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
INSERT INTO `cardpayment` VALUES (57,7,'01/19','Visa'),(58,4422,'01/19','Visa'),(59,145,'01/19','Visa');
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
  PRIMARY KEY (`DiscountdiscountID`),
  KEY `FKflexibleDi276331` (`DiscountdiscountID`),
  CONSTRAINT `FKflexibleDi276331` FOREIGN KEY (`DiscountdiscountID`) REFERENCES `discount` (`discountID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flexiblediscount`
--

LOCK TABLES `flexiblediscount` WRITE;
/*!40000 ALTER TABLE `flexiblediscount` DISABLE KEYS */;
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
  `alert` tinyint(4) DEFAULT '0',
  `deadlineExceed` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`JobID`),
  KEY `FKJob102033` (`CustomercustomerID`),
  CONSTRAINT `FKJob102033` FOREIGN KEY (`CustomercustomerID`) REFERENCES `customer` (`customerID`)
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job`
--

LOCK TABLES `job` WRITE;
/*!40000 ALTER TABLE `job` DISABLE KEYS */;
INSERT INTO `job` VALUES (51,17,'2018-04-12 10:18:45',NULL,'print on a5 paper in black and white','2018-04-12 11:18:45',33.58,1,'16.79',1,0),(52,17,'2018-04-12 10:30:08',NULL,'123123','2018-04-12 16:30:08',16.79,1,'0.0',1,0),(53,15,'2018-04-12 14:27:40',NULL,'dfdf','2018-04-13 00:27:40',19.00,1,'10.0',1,0),(54,16,'2018-04-12 14:45:47',NULL,'n/a','2018-04-13 14:45:47',12.02,0,'0.0',1,0),(55,15,'2018-04-12 15:37:46',NULL,'12321312321312321','2018-04-12 15:37:46',37.40,0,'20.0',1,0),(56,15,'2018-04-12 15:43:48',NULL,'123112','2018-04-12 16:45:48',140.40,0,'123.0',1,0),(57,15,'2018-04-12 15:44:13',NULL,'early deadline','2018-04-13 15:44:13',17.40,0,'0.0',1,0),(58,15,'2018-04-13 12:46:41',NULL,'n/a','2018-04-14 12:46:41',8.40,0,'0.0',0,0),(59,15,'2018-04-13 13:05:55',NULL,'n/a','2018-04-14 13:05:55',4.00,0,'0.0',0,0);
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
INSERT INTO `payment` VALUES (51,'2018-04-02'),(52,'2018-04-02'),(57,'2018-04-03'),(58,'2017-11-09'),(59,'2017-10-13');
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
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff`
--

LOCK TABLES `staff` WRITE;
/*!40000 ALTER TABLE `staff` DISABLE KEYS */;
INSERT INTO `staff` VALUES (1,'ray','kohli','ShiftManager','123'),(2,'bob','ross','OfficeManager','123'),(3,'tech bro','minglee','Technician','123'),(5,'213','123','Receptionist','233'),(6,'213','123','Receptionist','233'),(7,'213123','123213','Technician','233'),(19,'1231','123','Technician','123'),(20,'mayur','depala','Technician','12345'),(21,'parmveer','johal','Office Manager','abc123'),(22,'mayur','depala','Technician','12345'),(23,'ash','a','Shift Manager','0901'),(24,'john','smith','Receptionist','999');
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
) ENGINE=InnoDB AUTO_INCREMENT=126 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `task`
--

LOCK TABLES `task` WRITE;
/*!40000 ALTER TABLE `task` DISABLE KEYS */;
INSERT INTO `task` VALUES (98,NULL,NULL,NULL,NULL,51,1),(99,NULL,NULL,NULL,NULL,51,9),(100,NULL,NULL,NULL,NULL,51,10),(101,NULL,NULL,NULL,NULL,51,11),(102,NULL,NULL,NULL,NULL,52,1),(103,NULL,NULL,NULL,NULL,52,9),(104,NULL,NULL,NULL,NULL,52,10),(105,NULL,NULL,NULL,NULL,52,11),(106,NULL,NULL,NULL,NULL,53,10),(107,NULL,NULL,NULL,NULL,53,11),(108,NULL,NULL,NULL,NULL,54,1),(109,NULL,NULL,NULL,NULL,54,9),(110,NULL,NULL,NULL,NULL,54,10),(111,NULL,NULL,NULL,NULL,55,1),(112,NULL,NULL,NULL,NULL,55,9),(113,NULL,NULL,NULL,NULL,55,10),(114,NULL,NULL,NULL,NULL,55,11),(115,NULL,NULL,NULL,NULL,56,1),(116,NULL,NULL,NULL,NULL,56,9),(117,NULL,NULL,NULL,NULL,56,10),(118,NULL,NULL,NULL,NULL,56,11),(119,NULL,NULL,NULL,NULL,57,1),(120,NULL,NULL,NULL,NULL,57,9),(121,NULL,NULL,NULL,NULL,57,10),(122,NULL,NULL,NULL,NULL,57,11),(123,NULL,NULL,NULL,NULL,58,1),(124,NULL,NULL,NULL,NULL,58,9),(125,NULL,NULL,NULL,NULL,59,10);
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
INSERT INTO `technicianroom` VALUES (3,'Copy'),(7,'Packaging'),(19,'Copy'),(20,'Finishing'),(22,'Finishing');
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

-- Dump completed on 2018-04-13 14:42:39
