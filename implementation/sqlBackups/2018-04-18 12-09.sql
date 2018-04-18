-- MySQL dump 10.13  Distrib 5.7.21, for Win64 (x86_64)
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
  `disabled` varchar(45) NOT NULL DEFAULT '0',
  PRIMARY KEY (`baseTaskID`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `basetask`
--

LOCK TABLES `basetask` WRITE;
/*!40000 ALTER TABLE `basetask` DISABLE KEYS */;
INSERT INTO `basetask` VALUES ('use printer','Copy','using the printer',5.2,1,30,'0'),('12321','Development','123131',3.2,9,40,'0'),('21314','Finishing','12321312',4,10,20,'0'),('12312','Packaging','2131',5,11,10,'0'),('fake','Copy','123123',2.99,12,300,'0'),('fake','Copy','123123',2.99,13,300,'1'),('cartman','Development','use laptop',2.3,14,25,'1');
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
INSERT INTO `cardpayment` VALUES (81,9887,'01/19','Visa');
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
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (21,'qwerty','qwert','0784598565','raymun1@hotmail.co.uk','123 qwerty way','n12 q23','741'),(22,'nonvalued','132','12341','raymun1@hotmail.co.uk','123','123','123'),(23,'suspended guy','123','123','raymun1@hotmail.co.uk','123','123','123'),(24,'Timmy','Turner','07496968229','raymun1@hotmail.co.uk','111111','SL3 1LX','4890'),(25,'Gonzolo','john','074969682291','raymun1@hotmail.co.uk','123 la lane','SL3 1LX','5632'),(26,'suspended test','123','123','raymun1@hotmail.co.uk','123','123','123123123'),(27,'123','123','123','raymun1@hotmail.co.uk','aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa','123','123'),(28,'gucci','gang','07123456789','raymun1@hotmail.co.uk','12 gucci way','n11 1qw','gang'),(29,'Eric','Cartman','07496839558','raymun1@hotmail.co.uk','64 Colorado lane','Sl5 H3P','123');
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
  `alert` varchar(45) NOT NULL DEFAULT '0',
  `paid` varchar(45) NOT NULL DEFAULT '0',
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
INSERT INTO `defaultcustomer` VALUES (21,'1','1');
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
) ENGINE=InnoDB AUTO_INCREMENT=93 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `discount`
--

LOCK TABLES `discount` WRITE;
/*!40000 ALTER TABLE `discount` DISABLE KEYS */;
INSERT INTO `discount` VALUES (77,'Variable'),(78,'Variable'),(79,'Fixed'),(80,'Variable'),(81,'Variable'),(82,'Fixed'),(83,'Fixed'),(84,'Fixed'),(85,'Variable'),(86,'Fixed'),(87,'Flexible'),(88,'Flexible'),(89,'Flexible'),(90,'Flexible'),(91,'Variable'),(92,'Variable');
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
INSERT INTO `fixeddiscount` VALUES (79,10),(84,30);
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
  `aquiredValue` int(10) NOT NULL DEFAULT '0',
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
  `number` int(11) DEFAULT '1',
  `started` varchar(45) NOT NULL DEFAULT '0',
  PRIMARY KEY (`JobID`),
  KEY `FKJob102033` (`CustomercustomerID`),
  CONSTRAINT `FKJob102033` FOREIGN KEY (`CustomercustomerID`) REFERENCES `customer` (`customerID`)
) ENGINE=InnoDB AUTO_INCREMENT=99 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job`
--

LOCK TABLES `job` WRITE;
/*!40000 ALTER TABLE `job` DISABLE KEYS */;
INSERT INTO `job` VALUES (74,21,'2018-04-15 06:51:06',NULL,'123123','2018-04-16 06:51:06',50.00,0,'0.0',1,0,1,'0'),(75,21,'2018-04-15 06:51:12',NULL,'123123','2018-04-16 06:51:12',50.00,0,'0.0',1,0,1,'0'),(76,21,'2018-04-15 06:52:00','2018-04-16 21:23:32','213123','2018-04-16 06:52:00',17.40,1,'0.0',1,0,1,'0'),(77,22,'2018-04-15 06:52:45','2018-04-18 10:18:30','123123','2018-04-16 06:52:45',17.40,1,'0.0',1,0,1,'0'),(78,23,'2018-04-15 06:52:45','2018-04-18 10:18:32','123123','2018-04-16 06:52:45',17.40,1,'0.0',1,0,1,'0'),(79,22,'2018-04-15 12:30:21',NULL,'n/a','2018-04-16 12:30:21',9.20,0,'0.0',1,0,1,'0'),(80,23,'2018-04-15 12:45:51',NULL,'n/a','2018-04-16 12:45:51',5.20,0,'0.0',1,0,1,'0'),(81,22,'2018-04-15 12:46:55',NULL,'n/a','2018-04-16 12:46:55',17.40,1,'0.0',1,0,1,'0'),(82,24,'2018-04-15 12:48:07',NULL,'n/a','2018-04-15 18:48:07',5.00,0,'0.0',1,0,1,'0'),(83,24,'2018-04-15 12:52:16',NULL,'n/a','2018-04-16 12:52:16',0.00,0,'0.0',1,0,1,'0'),(84,25,'2018-04-15 12:58:03',NULL,'n/a','2018-04-16 12:58:03',9.00,1,'0.0',1,0,1,'0'),(85,26,'2018-04-16 09:21:28',NULL,'123123','2018-04-17 09:21:28',17.40,1,'0.0',1,0,1,'0'),(86,26,'2018-04-16 09:22:27',NULL,'suspended test','2018-04-17 09:22:27',17.40,0,'0.0',1,0,1,'0'),(87,24,'2018-04-16 14:31:27',NULL,'n/a','2018-04-17 14:31:27',5.88,0,'0.0',1,0,1,'0'),(88,24,'2018-04-16 14:53:57',NULL,'n/a','2018-04-17 14:53:57',3.50,0,'0.0',1,0,1,'0'),(89,24,'2018-04-16 15:11:33',NULL,'n/a','2018-04-17 15:11:33',3.50,0,'0.0',1,0,1,'0'),(90,28,'2018-04-16 21:16:42',NULL,'please do in red','2018-04-17 03:16:42',12.40,0,'0.0',1,0,1,'0'),(91,28,'2018-04-16 21:27:10',NULL,'blue edge','2018-04-17 03:27:10',12.40,0,'0.0',1,0,1,'0'),(92,29,'2018-04-16 21:28:59',NULL,'Please complete urgently','2018-04-17 03:28:59',7.99,0,'0.0',1,0,1,'0'),(93,23,'2018-04-17 10:30:09',NULL,'123','2018-04-17 10:30:09',20.40,0,'12.0',1,0,1,'0'),(94,23,'2018-04-18 10:06:08',NULL,'1321','2018-04-19 10:06:08',12.40,0,'0.0',0,0,1,'0'),(95,23,'2018-04-18 10:12:02',NULL,'1231','2018-04-18 16:12:02',12.40,0,'0.0',0,0,1,'0'),(96,23,'2018-04-18 10:16:57',NULL,'1231231','2018-04-19 10:16:57',0.00,0,'0.0',0,0,1,'0'),(97,23,'2018-04-18 10:17:07',NULL,'1231231','2018-04-19 10:17:07',0.00,0,'0.0',0,0,1,'0'),(98,23,'2018-04-18 10:18:16',NULL,'21312','2018-04-19 10:18:16',12.40,0,'0.0',0,0,1,'0');
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
INSERT INTO `payment` VALUES (77,'2018-04-15'),(78,'2018-04-24'),(81,'2018-04-06'),(82,'2018-04-15'),(83,'2018-04-15'),(84,'2018-04-15');
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
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff`
--

LOCK TABLES `staff` WRITE;
/*!40000 ALTER TABLE `staff` DISABLE KEYS */;
INSERT INTO `staff` VALUES (1,'ray','kohli','ShiftManager','123'),(2,'bob','ross','OfficeManager','123'),(3,'tech bro','minglee','Technician','123'),(5,'213','123','Receptionist','233'),(6,'213','123','Receptionist','233'),(7,'213123','123213','Technician','233'),(19,'1231','123','Technician','123'),(20,'mayur','depala','Technician','12345'),(21,'parmveer','johal','Office Manager','abc123'),(22,'mayur','depala','Technician','12345'),(23,'ash','a','Shift Manager','0901'),(24,'john','smith','Receptionist','999'),(25,'Jimmy','Gill','Receptionist','123'),(26,'Jimmy','Gill','Receptionist','123'),(27,'mayur','depala','Technician','123');
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
  `alert` varchar(45) NOT NULL DEFAULT '0',
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
INSERT INTO `suspendedcustomer` VALUES (21,'1'),(26,'1');
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
) ENGINE=InnoDB AUTO_INCREMENT=345 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `task`
--

LOCK TABLES `task` WRITE;
/*!40000 ALTER TABLE `task` DISABLE KEYS */;
INSERT INTO `task` VALUES (164,NULL,'2001-03-04 00:00:00','2001-03-04 00:00:00',NULL,76,1),(165,'123','2018-04-17 11:58:44','2018-04-17 11:58:48',2,76,9),(166,NULL,'2001-03-04 00:00:00','2001-03-04 00:00:00',NULL,76,10),(167,NULL,'2001-03-04 00:00:00','2001-03-04 00:00:00',NULL,76,11),(168,'123','2018-04-17 12:03:01','2018-04-17 12:03:03',2,77,1),(169,'123','2018-04-17 12:05:45','2018-04-17 12:05:47',2,77,9),(170,NULL,NULL,NULL,NULL,77,10),(171,NULL,NULL,NULL,NULL,77,11),(300,NULL,'2018-04-17 11:06:37','2001-03-04 00:00:00',1,78,1),(301,'123','2018-04-17 12:03:06','2018-04-17 12:03:08',2,78,9),(302,'123','2018-04-17 12:05:49','2018-04-17 12:05:51',2,78,10),(303,NULL,NULL,NULL,NULL,78,11),(304,'`12213','2018-04-17 12:03:10','2018-04-17 12:03:12',2,79,1),(305,'123','2018-04-17 12:09:09','2018-04-17 12:09:12',2,79,10),(306,'123','2018-04-17 12:03:15','2018-04-17 12:03:18',2,80,1),(307,'2342','2018-04-17 12:03:20','2018-04-17 12:03:21',2,81,1),(308,'123','2018-04-17 12:10:07','2018-04-17 12:10:10',2,81,9),(309,NULL,NULL,NULL,NULL,81,10),(310,NULL,NULL,NULL,NULL,81,11),(311,'243','2018-04-17 12:03:23','2018-04-17 12:03:25',2,82,11),(312,'123','2018-04-17 12:10:34','2018-04-17 12:10:36',2,84,10),(313,NULL,NULL,NULL,NULL,84,11),(314,'123','2018-04-17 12:11:16','2018-04-17 12:11:18',2,85,1),(315,'123','2018-04-17 12:11:20','2018-04-17 12:11:21',2,85,9),(316,'123','2018-04-17 12:11:23','2018-04-17 12:11:25',2,85,10),(317,'123','2018-04-17 12:11:26','2018-04-17 12:11:28',2,85,11),(318,NULL,'2018-04-17 12:11:58',NULL,2,86,1),(319,NULL,NULL,NULL,NULL,86,9),(320,NULL,NULL,NULL,NULL,86,10),(321,NULL,NULL,NULL,NULL,86,11),(322,NULL,NULL,NULL,NULL,87,1),(323,NULL,NULL,NULL,NULL,87,9),(324,NULL,NULL,NULL,NULL,88,11),(325,NULL,NULL,NULL,NULL,89,11),(326,NULL,NULL,NULL,NULL,90,1),(327,NULL,NULL,NULL,NULL,90,9),(328,NULL,NULL,NULL,NULL,90,10),(329,NULL,NULL,NULL,NULL,91,1),(330,NULL,NULL,NULL,NULL,91,9),(331,NULL,NULL,NULL,NULL,91,10),(332,NULL,NULL,NULL,NULL,92,11),(333,NULL,NULL,NULL,NULL,92,12),(334,NULL,NULL,NULL,NULL,93,1),(335,NULL,NULL,NULL,NULL,93,9),(336,NULL,NULL,NULL,NULL,94,1),(337,NULL,NULL,NULL,NULL,94,9),(338,NULL,NULL,NULL,NULL,94,10),(339,NULL,NULL,NULL,NULL,95,1),(340,NULL,NULL,NULL,NULL,95,9),(341,NULL,NULL,NULL,NULL,95,10),(342,NULL,NULL,NULL,NULL,98,1),(343,NULL,NULL,NULL,NULL,98,9),(344,NULL,NULL,NULL,NULL,98,10);
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
INSERT INTO `technicianroom` VALUES (3,'Copy'),(7,'Packaging'),(19,'Copy'),(20,'Finishing'),(22,'Finishing'),(27,'Finishing');
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
INSERT INTO `valuedcustomer` VALUES (21,NULL),(23,NULL),(26,NULL),(22,90),(28,92);
/*!40000 ALTER TABLE `valuedcustomer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `valuedjob`
--

DROP TABLE IF EXISTS `valuedjob`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `valuedjob` (
  `job_JobID` int(10) NOT NULL,
  `alertdate` date NOT NULL,
  `alertknown` tinyint(4) NOT NULL DEFAULT '0',
  `firstreminder` date NOT NULL,
  `firstalert` varchar(45) NOT NULL DEFAULT '0',
  `firstbulk` varchar(45) NOT NULL DEFAULT '0',
  `secondreminder` date NOT NULL,
  `defaultd` date NOT NULL,
  `secondbulk` varchar(45) NOT NULL DEFAULT '0',
  PRIMARY KEY (`job_JobID`),
  KEY `fk_valuedJob_job1_idx` (`job_JobID`),
  CONSTRAINT `fk_valuedJob_job1` FOREIGN KEY (`job_JobID`) REFERENCES `job` (`JobID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `valuedjob`
--

LOCK TABLES `valuedjob` WRITE;
/*!40000 ALTER TABLE `valuedjob` DISABLE KEYS */;
INSERT INTO `valuedjob` VALUES (74,'2018-01-10',1,'2018-02-20','1','1','2018-03-20','2018-03-22','0'),(75,'2018-01-10',1,'2018-02-20','1','1','2018-08-20','2018-08-20','0'),(76,'2018-01-10',1,'2018-06-20','0','0','2018-07-20','2018-08-20','0'),(80,'2018-05-10',0,'2018-01-20','1','1','2018-07-20','2018-08-20','0'),(86,'2018-05-09',1,'2018-01-19','1','1','2018-01-19','2018-08-19','0'),(87,'2018-05-09',0,'2018-06-19','0','0','2018-07-19','2018-08-19','0'),(88,'2018-05-09',0,'2018-06-19','0','0','2018-07-19','2018-08-19','0'),(89,'2018-05-09',0,'2018-06-19','0','0','2018-07-19','2018-08-19','0'),(93,'2018-05-09',0,'2018-06-19','0','0','2018-07-19','2018-08-19','0'),(94,'2018-05-09',0,'2018-06-19','0','0','2018-07-19','2018-08-19','0'),(95,'2018-05-09',0,'2018-06-19','0','0','2018-07-19','2018-08-19','0'),(96,'2018-05-09',0,'2018-06-19','0','0','2018-07-19','2018-08-19','0'),(97,'2018-05-09',0,'2018-06-19','0','0','2018-07-19','2018-08-19','0'),(98,'2018-05-09',0,'2018-06-19','0','0','2018-07-19','2018-08-19','0');
/*!40000 ALTER TABLE `valuedjob` ENABLE KEYS */;
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
INSERT INTO `variablediscount` VALUES (81,10,11),(81,10,10),(81,10,9),(81,10,1),(77,0,11),(77,1,10),(77,0,9),(77,1,1),(91,10,1),(91,10,9),(91,10,10),(91,10,11),(91,10,12);
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

-- Dump completed on 2018-04-18 12:09:55
