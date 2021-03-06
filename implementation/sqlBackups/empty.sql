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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `basetask`
--

LOCK TABLES `basetask` WRITE;
/*!40000 ALTER TABLE `basetask` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `discount`
--

LOCK TABLES `discount` WRITE;
/*!40000 ALTER TABLE `discount` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job`
--

LOCK TABLES `job` WRITE;
/*!40000 ALTER TABLE `job` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff`
--

LOCK TABLES `staff` WRITE;
/*!40000 ALTER TABLE `staff` DISABLE KEYS */;
INSERT INTO `staff` VALUES (1,'Manager','0','OfficeManager','Get_it_done');
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `task`
--

LOCK TABLES `task` WRITE;
/*!40000 ALTER TABLE `task` DISABLE KEYS */;
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

-- Dump completed on 2018-04-18 13:43:45
