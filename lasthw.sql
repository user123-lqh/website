-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: lasthw
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

DROP DATABASE IF EXISTS lasthw;

CREATE DATABASE lasthw CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

USE lasthw;
--
-- Table structure for table `counter`
--

DROP TABLE IF EXISTS `counter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `counter` (
  `count` bigint(8) NOT NULL,
  PRIMARY KEY (`count`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `counter`
--

LOCK TABLES `counter` WRITE;
/*!40000 ALTER TABLE `counter` DISABLE KEYS */;
INSERT INTO `counter` VALUES (31);
/*!40000 ALTER TABLE `counter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `member`
--

DROP TABLE IF EXISTS `member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `member` (
  `name` varchar(255) NOT NULL,
  `id` varchar(255) NOT NULL,
  `pwd` varchar(255) NOT NULL,
  `tel` varchar(255) NOT NULL,
  `mail` varchar(255) NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member`
--

LOCK TABLES `member` WRITE;
/*!40000 ALTER TABLE `member` DISABLE KEYS */;
INSERT INTO `member` VALUES ('admin','administrator','1234','0987654321','123@gmail.com'),('盧啟輝','10744171','1234','0965441928','1@gmail.com');
/*!40000 ALTER TABLE `member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `message`
DROP TABLE IF EXISTS guestbook1;
CREATE TABLE guestbook1(
  `GBNO` TINYINT(4) AUTO_INCREMENT,
  `GBName` VARCHAR(10),
  `Mail` VARCHAR(30),
  `Content` TEXT,
  `Putdate` DATE,
  primary key(GBNO)
);

DROP TABLE IF EXISTS guestbook2;
CREATE TABLE guestbook2(
  `GBNO` TINYINT(4) AUTO_INCREMENT,
  `GBName` VARCHAR(10),
  `Mail` VARCHAR(30),
  `Content` TEXT,
  `Putdate` DATE,
  primary key(GBNO)
);

DROP TABLE IF EXISTS guestbook3;
CREATE TABLE guestbook3(
  `GBNO` TINYINT(4) AUTO_INCREMENT,
  `GBName` VARCHAR(10),
  `Mail` VARCHAR(30),
  `Content` TEXT,
  `Putdate` DATE,
  primary key(GBNO)
);

DROP TABLE IF EXISTS guestbook4;
CREATE TABLE guestbook4(
  `GBNO` TINYINT(4) AUTO_INCREMENT,
  `GBName` VARCHAR(10),
  `Mail` VARCHAR(30),
  `Content` TEXT,
  `Putdate` DATE,
  primary key(GBNO)
);

DROP TABLE IF EXISTS guestbook5;
CREATE TABLE guestbook5(
  `GBNO` TINYINT(4) AUTO_INCREMENT,
  `GBName` VARCHAR(10),
  `Mail` VARCHAR(30),
  `Content` TEXT,
  `Putdate` DATE,
  primary key(GBNO)
);

DROP TABLE IF EXISTS guestbook6;
CREATE TABLE guestbook6(
  `GBNO` TINYINT(4) AUTO_INCREMENT,
  `GBName` VARCHAR(10),
  `Mail` VARCHAR(30),
  `Content` TEXT,
  `Putdate` DATE,
  primary key(GBNO)
);

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `price` varchar(255) DEFAULT NULL,
  `amount` varchar(255) DEFAULT NULL,
  `img` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  `path` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,'220','99','l1.jpg','聖誕小夜燈','燈光從漫天大雪中緩緩流淌出來，那橙色的光芒匯聚成一陣陣暖流，像極了冬日裡的太陽，溫暖了我們的內心。','img1/'),(2,'320','99','l3.jpg','狗狗小夜燈','第一眼看到這個小狗的時候，心都要被萌化了。它就安靜的趴在桌子上守護著你，讓你享受一個安靜美好的夜晚。','img1/'),(3,'300','99','l4.jpg','幽靈小夜燈','這款小夜燈設計很新奇，是以幽靈為原型做成的。幽靈是種恐怖的東西，但把他做成這種萌萌的感覺，有種反差美。','img1/'),(4,'330','99','t1.jpg','兔兔小夜燈','當你睡覺前看一眼這個無比可愛的小兔子，心情是不是都會好起來，相信它定會帶給你一個好夢。','img1/'),(5,'310','99','t2.jpg','月球小夜燈','月球造型的小夜燈，燈的表面用斑駁來模擬月球的表面，十分的逼真。底部的木頭支架微微翹起一個角度，讓球體更加得迷人。','img1/'),(6,'320','99','t4.jpg','貓爪小夜燈','質感極為柔軟，就像在摸貓咪的爪子一樣。內部放置磁鐵，不易掉落。輕拍手掌就會亮燈，使用便利。','img1/'),(7,'220','99','choujiang.jpg','幸運抽獎獎品','你就是幸運兒','img1/');
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shopcart`
--

DROP TABLE IF EXISTS `shopcart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shopcart` (
  `no` int(11) NOT NULL AUTO_INCREMENT,
  `ID` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `price` varchar(255) NOT NULL,
  `total` varchar(255) NOT NULL,
  `payment` varchar(255) DEFAULT NULL,
  `tel` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `quality` int(11) DEFAULT NULL,
  PRIMARY KEY (`no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shopcart`
--

LOCK TABLES `shopcart` WRITE;
/*!40000 ALTER TABLE `shopcart` DISABLE KEYS */;
/*!40000 ALTER TABLE `shopcart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stock`
--

DROP TABLE IF EXISTS `stock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stock` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `price` varchar(255) NOT NULL,
  `img` varchar(255) NOT NULL,
  `amount` varchar(255) NOT NULL,
  `SID` bigint(8) NOT NULL AUTO_INCREMENT,
  `total` varchar(255) NOT NULL,
  `PID` varchar(255) NOT NULL,
  PRIMARY KEY (`SID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stock`
--

LOCK TABLES `stock` WRITE;
/*!40000 ALTER TABLE `stock` DISABLE KEYS */;
/*!40000 ALTER TABLE `stock` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-12-30 14:43:14
