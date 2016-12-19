-- MySQL dump 10.13  Distrib 5.7.11, for osx10.11 (x86_64)
--
-- Host: localhost    Database: PipeCom_development
-- ------------------------------------------------------
-- Server version	5.7.11

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
-- Table structure for table `commodities`
--

DROP TABLE IF EXISTS `commodities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `commodities` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `commodity_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `commodity_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `temp1` float DEFAULT NULL,
  `visc1` float DEFAULT NULL,
  `temp2` float DEFAULT NULL,
  `visc2` float DEFAULT NULL,
  `density` float DEFAULT NULL,
  `density_cf` float DEFAULT NULL,
  `vapor` float DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `acoef` float DEFAULT NULL,
  `bcoef` float DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `commodities`
--

LOCK TABLES `commodities` WRITE;
/*!40000 ALTER TABLE `commodities` DISABLE KEYS */;
INSERT INTO `commodities` VALUES (1,'63E','Gasoline',5,0.94,37.8,0.66,732,0.99875,200,'2016-03-22 15:21:55','2016-12-15 22:47:58',7.81437,3.46469),(2,'SYN','Synthetic',5,20.57,15,14.05,892.1,0.99837,200,'2016-03-22 15:29:25','2016-05-20 16:15:53',8.9484,3.61059),(3,'41E','Gasoline',5,0.29,15,0.26,561.67,0.99821,200,'2016-03-22 15:30:26','2016-05-20 16:15:40',11.7827,5.35673),(4,'42E','Gasoline',5,0.28,15,0.27,560,0.99822,200,'2016-03-22 15:42:54','2016-05-20 16:15:45',3.01669,1.78091),(5,'NGL','Natural Gas Liquid',5,0.29,15,0.26,550,0.99821,100,'2016-10-29 13:20:52','2016-10-29 13:20:52',11.7827,5.35673),(6,'AHS','Albian Heavy Synthetic',10,254,30,72.6,934.6,0.998,61.4,'2016-12-16 00:29:06','2016-12-16 00:29:06',9.53037,3.73124),(7,'BR','Bow River',10,184,30,59,918.1,0.998,64.3,'2016-12-16 00:30:30','2016-12-16 00:30:30',9.11685,3.57318),(8,'CL','Cold Lake',10,289,30,86.6,923.4,0.998,57.5,'2016-12-16 00:31:38','2016-12-16 00:31:38',8.93253,3.48336),(9,'CRW','Condensate Blend',10,0.977,30,0.783,712.1,0.998,85.1,'2016-12-16 00:33:03','2016-12-16 00:33:03',7.73087,3.41274),(10,'F','Fosterton',10,187,30,60,924.2,0.998,43.6,'2016-12-16 00:34:09','2016-12-16 00:34:09',9.08329,3.55895),(11,'HSB','Husky Synthetic Blend',10,17.9,30,8.46,869.1,0.998,36.4,'2016-12-16 00:35:28','2016-12-16 00:35:28',10.0726,4.06563),(12,'LLB','Lloydminster Blend',10,311,30,92.5,926.5,0.998,62.3,'2016-12-16 00:36:56','2016-12-16 00:36:56',8.87713,3.45849),(13,'M','Midale Blend',10,22.7,30,8.91,871.7,0.998,54.3,'2016-12-16 00:37:59','2016-12-16 00:37:59',12.0521,4.85951),(14,'MML','Manitoba Light',10,8.64,30,4.53,839.4,0.998,83.3,'2016-12-16 00:39:18','2016-12-16 00:39:18',10.7823,4.40266),(15,'OSH','Suncor OSH',10,154,30,42.8,933.6,0.998,16.7,'2016-12-16 00:40:25','2016-12-16 00:40:25',10.7552,4.24747),(16,'P','Pembina',10,6.03,30,3.55,822.1,0.998,88,'2016-12-16 00:41:35','2016-12-16 00:41:35',9.82915,4.04202),(17,'RSW','Rangeland Sweet',10,5.89,30,3.37,819.1,0.998,87.8,'2016-12-16 00:42:45','2016-12-16 00:42:45',10.5169,4.32448),(18,'SLD','Southern Lights Diluent',10,0.479,30,0.406,664.3,0.998,95,'2016-12-16 00:43:56','2016-12-16 00:43:56',6.98889,3.25519),(19,'SO','Mixed Blend Sour',10,11.9,30,6.37,867.2,0.998,84.7,'2016-12-16 00:44:53','2016-12-16 00:44:53',9.34108,3.79261),(20,'WCB','Western Canadian Blend',10,296,30,88.6,929,0.998,37.9,'2016-12-16 00:45:59','2016-12-16 00:45:59',8.90373,3.47087),(21,'WH','Wabasca Heavy',10,238,30,75.2,932.4,0.998,49,'2016-12-16 00:47:01','2016-12-16 00:47:01',8.81163,3.44021),(22,'ZA','Zama',10,4.86,30,3.06,826.2,0.998,96.5,'2016-12-16 00:48:03','2016-12-16 00:48:03',9.16949,3.79169);
/*!40000 ALTER TABLE `commodities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `elevations`
--

DROP TABLE IF EXISTS `elevations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `elevations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `kmp` float DEFAULT NULL,
  `elevation` float DEFAULT NULL,
  `pipeline_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_elevations_on_pipeline_id` (`pipeline_id`),
  CONSTRAINT `fk_rails_d287de2f63` FOREIGN KEY (`pipeline_id`) REFERENCES `pipelines` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `elevations`
--

LOCK TABLES `elevations` WRITE;
/*!40000 ALTER TABLE `elevations` DISABLE KEYS */;
INSERT INTO `elevations` VALUES (1,0,684.28,1,'2016-04-02 02:40:32','2016-04-02 02:40:32'),(2,48.27,792.48,1,'2016-04-02 02:40:55','2016-04-02 02:40:55'),(3,173.77,792.48,1,'2016-04-02 14:01:16','2016-04-02 14:01:16'),(4,194.69,724.81,1,'2016-04-02 14:01:40','2016-04-02 14:01:40'),(5,392.6,603.5,1,'2016-04-02 14:02:01','2016-04-02 14:02:01'),(6,466.95,548.94,1,'2016-04-02 14:02:23','2016-04-02 14:02:23'),(7,485.92,661.11,1,'2016-04-02 14:02:41','2016-04-02 14:02:41'),(8,503.62,526.39,1,'2016-04-02 14:03:01','2016-04-02 14:03:01'),(9,532.42,609.6,1,'2016-04-02 14:03:35','2016-04-02 14:03:35'),(10,566.63,580.34,1,'2016-04-02 14:03:49','2016-04-02 14:03:49'),(11,704.48,585.83,1,'2016-04-02 14:04:09','2016-04-02 14:04:09'),(12,822.2,698.6,1,'2016-04-02 14:04:21','2016-04-02 14:04:21'),(13,992.75,429.77,1,'2016-04-02 14:04:42','2016-04-02 14:04:42'),(14,1073.2,356.62,1,'2016-04-02 14:04:58','2016-04-02 14:04:58'),(15,1164.92,491.95,1,'2016-04-02 14:05:13','2016-04-02 14:05:13'),(16,1289.97,227.99,1,'2016-04-02 14:05:31','2016-04-02 14:05:31'),(17,1478.67,441.96,1,'2016-04-02 14:05:47','2016-04-02 14:05:47'),(18,1538.2,396.85,1,'2016-04-02 14:06:04','2016-04-02 14:06:04'),(19,1718.41,399.29,1,'2016-04-02 14:06:21','2016-04-02 14:06:21'),(20,1766.84,199.34,1,'2016-04-02 14:06:34','2016-04-02 14:06:34'),(21,0,684.28,6,'2016-05-30 16:52:41','2016-12-19 03:59:50'),(22,30,900,6,'2016-05-30 16:52:50','2016-12-15 16:09:54'),(23,60,700,6,'2016-05-30 16:52:57','2016-12-15 16:10:10'),(28,654.86,502.31,1,'2016-12-15 17:19:31','2016-12-15 17:19:31'),(29,0,400,9,'2016-12-16 20:18:20','2016-12-16 20:18:20'),(30,120,350,9,'2016-12-16 20:18:32','2016-12-16 20:18:32');
/*!40000 ALTER TABLE `elevations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `headpoints`
--

DROP TABLE IF EXISTS `headpoints`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `headpoints` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pump_id` varchar(255) DEFAULT NULL,
  `flow` float DEFAULT NULL,
  `head` float DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_headpoints_on_pump_id` (`pump_id`)
) ENGINE=InnoDB AUTO_INCREMENT=180 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `headpoints`
--

LOCK TABLES `headpoints` WRITE;
/*!40000 ALTER TABLE `headpoints` DISABLE KEYS */;
INSERT INTO `headpoints` VALUES (5,'1',2000,1108,'2016-12-02 02:19:25','2016-12-02 02:19:25'),(7,'1',3000,1100,'2016-12-02 02:56:53','2016-12-02 02:56:53'),(8,'1',4000,1087,'2016-12-02 13:17:00','2016-12-02 13:17:00'),(9,'1',5000,1070,'2016-12-02 13:17:13','2016-12-02 13:17:13'),(10,'1',6000,1048,'2016-12-02 13:17:58','2016-12-02 13:17:58'),(11,'1',7000,1015,'2016-12-02 13:51:18','2016-12-02 13:51:18'),(12,'1',8000,977,'2016-12-02 13:51:30','2016-12-02 13:51:30'),(13,'1',9000,920,'2016-12-02 13:51:46','2016-12-02 13:51:46'),(14,'1',9500,880,'2016-12-02 13:52:00','2016-12-03 15:19:46'),(16,'1',10000,840,'2016-12-02 14:15:22','2016-12-02 14:15:22'),(17,'1',10500,790,'2016-12-02 14:25:34','2016-12-02 14:25:34'),(18,'1',11000,715,'2016-12-02 14:25:45','2016-12-02 14:25:45'),(19,'1',11500,590,'2016-12-02 14:26:01','2016-12-02 14:26:01'),(26,'2',1750,936,'2016-12-05 18:05:44','2016-12-05 18:05:44'),(27,'2',2000,931,'2016-12-05 18:05:55','2016-12-05 18:05:55'),(28,'2',2250,924,'2016-12-05 18:06:24','2016-12-05 18:06:24'),(29,'2',2500,918,'2016-12-05 18:06:40','2016-12-05 18:06:40'),(30,'2',2750,909,'2016-12-05 18:07:03','2016-12-05 18:07:03'),(31,'2',3000,900,'2016-12-05 18:07:34','2016-12-05 18:07:34'),(32,'2',3250,889,'2016-12-05 18:10:08','2016-12-05 18:10:08'),(33,'2',3500,878,'2016-12-05 18:10:42','2016-12-05 18:10:42'),(34,'2',3750,864,'2016-12-05 18:11:06','2016-12-05 18:11:06'),(35,'2',4000,850,'2016-12-05 18:11:17','2016-12-05 18:11:17'),(36,'2',4250,834,'2016-12-05 18:11:33','2016-12-05 18:11:33'),(37,'2',4500,817,'2016-12-05 18:11:47','2016-12-05 18:11:47'),(38,'2',4750,797,'2016-12-05 18:12:11','2016-12-05 18:12:11'),(39,'2',5000,773,'2016-12-05 18:12:24','2016-12-05 18:12:24'),(40,'3',0,1380,'2016-12-15 15:52:30','2016-12-15 16:20:42'),(41,'3',1000,1370,'2016-12-15 15:52:45','2016-12-15 15:52:45'),(42,'3',2000,1360,'2016-12-15 15:52:58','2016-12-15 15:52:58'),(43,'3',3000,1352,'2016-12-15 15:53:09','2016-12-15 15:53:09'),(44,'3',4000,1350,'2016-12-15 15:53:21','2016-12-15 15:53:21'),(45,'3',5000,1340,'2016-12-15 15:53:30','2016-12-15 15:53:30'),(46,'3',6000,1330,'2016-12-15 15:53:40','2016-12-15 15:53:40'),(47,'3',7000,1305,'2016-12-15 15:53:52','2016-12-15 15:53:52'),(48,'3',8000,1270,'2016-12-15 15:54:23','2016-12-15 15:54:23'),(49,'3',9000,1225,'2016-12-15 15:54:37','2016-12-15 15:54:37'),(50,'3',10000,1170,'2016-12-15 15:57:28','2016-12-15 15:57:28'),(51,'3',10600,1130,'2016-12-15 15:57:45','2016-12-15 15:57:45'),(52,'3',11200,1080,'2016-12-15 15:58:01','2016-12-15 15:58:01'),(53,'3',11800,1035,'2016-12-15 15:58:15','2016-12-15 15:58:15'),(54,'4',0,752,'2016-12-15 16:00:04','2016-12-15 16:00:04'),(55,'4',1000,750,'2016-12-15 16:00:16','2016-12-15 16:00:16'),(56,'4',2000,748,'2016-12-15 16:00:36','2016-12-15 16:00:36'),(57,'4',3000,742,'2016-12-15 16:00:45','2016-12-15 16:00:45'),(58,'4',3900,740,'2016-12-15 16:00:58','2016-12-15 16:00:58'),(59,'4',4800,740,'2016-12-15 16:01:09','2016-12-15 16:01:09'),(60,'4',5700,730,'2016-12-15 16:01:20','2016-12-15 16:01:20'),(61,'4',6600,718,'2016-12-15 16:01:32','2016-12-15 16:01:32'),(62,'4',7500,700,'2016-12-15 16:01:44','2016-12-15 16:01:44'),(63,'4',8400,670,'2016-12-15 16:01:56','2016-12-15 16:01:56'),(64,'4',9300,632,'2016-12-15 16:02:07','2016-12-15 16:02:07'),(65,'4',10200,585,'2016-12-15 16:02:19','2016-12-15 16:02:19'),(66,'4',11100,530,'2016-12-15 16:02:31','2016-12-15 16:02:31'),(67,'4',12000,460,'2016-12-15 16:02:41','2016-12-15 16:02:41'),(68,'5',200,1794,'2016-12-15 16:04:09','2016-12-15 16:04:09'),(69,'5',600,1794,'2016-12-15 16:04:21','2016-12-15 16:04:21'),(70,'5',1000,1768,'2016-12-15 16:04:32','2016-12-15 16:04:32'),(71,'5',1400,1738,'2016-12-15 16:04:42','2016-12-15 16:04:42'),(72,'5',1800,1715,'2016-12-15 16:04:53','2016-12-15 16:04:53'),(73,'5',2200,1690,'2016-12-15 16:05:03','2016-12-15 16:05:03'),(74,'5',2600,1652,'2016-12-15 16:05:14','2016-12-15 16:05:14'),(75,'5',3000,1590,'2016-12-15 16:05:24','2016-12-15 16:05:24'),(76,'5',3400,1504,'2016-12-15 16:05:36','2016-12-15 16:05:36'),(77,'5',3800,1400,'2016-12-15 16:05:47','2016-12-15 16:05:47'),(78,'5',4200,1288,'2016-12-15 16:05:57','2016-12-15 16:05:57'),(79,'5',4600,1169,'2016-12-15 16:06:10','2016-12-15 16:06:10'),(80,'5',5000,1029,'2016-12-15 16:06:22','2016-12-15 16:06:22'),(81,'5',5275,815,'2016-12-15 16:06:33','2016-12-15 16:06:33'),(82,'6',0,1275,'2016-12-15 17:39:59','2016-12-15 17:39:59'),(83,'6',750,1265,'2016-12-15 17:40:12','2016-12-15 17:40:12'),(84,'6',1500,1260,'2016-12-15 17:40:23','2016-12-15 17:40:23'),(85,'6',2000,1260,'2016-12-15 17:40:37','2016-12-15 17:40:37'),(86,'6',2500,1260,'2016-12-15 17:40:52','2016-12-15 17:40:52'),(87,'6',3000,1260,'2016-12-15 17:41:07','2016-12-15 17:41:07'),(88,'6',3500,1250,'2016-12-15 17:41:19','2016-12-15 17:41:19'),(89,'6',4000,1235,'2016-12-15 17:41:30','2016-12-15 17:41:30'),(90,'6',4500,1220,'2016-12-15 17:41:44','2016-12-15 17:41:44'),(91,'6',5000,1200,'2016-12-15 17:41:58','2016-12-15 17:41:58'),(92,'6',5750,1145,'2016-12-15 17:42:10','2016-12-15 17:42:10'),(93,'6',6500,1080,'2016-12-15 17:42:22','2016-12-15 17:42:22'),(94,'6',7500,990,'2016-12-15 17:42:35','2016-12-15 17:42:35'),(95,'6',8500,875,'2016-12-15 17:42:47','2016-12-15 17:42:47'),(96,'7',0,920,'2016-12-15 21:22:54','2016-12-18 13:34:26'),(97,'7',750,920,'2016-12-15 21:23:20','2016-12-15 21:23:20'),(98,'7',1500,920,'2016-12-15 21:23:50','2016-12-15 21:23:50'),(99,'7',2000,920,'2016-12-15 21:24:00','2016-12-15 21:24:00'),(100,'7',2500,920,'2016-12-15 21:24:09','2016-12-15 21:24:09'),(101,'7',3000,920,'2016-12-15 21:24:17','2016-12-15 21:24:17'),(102,'7',3500,910,'2016-12-15 21:24:26','2016-12-15 21:24:26'),(103,'7',4000,895,'2016-12-15 21:24:33','2016-12-15 21:24:33'),(104,'7',4500,865,'2016-12-15 21:24:42','2016-12-15 21:24:42'),(105,'7',5000,840,'2016-12-15 21:24:50','2016-12-15 21:24:50'),(106,'7',5500,800,'2016-12-15 21:25:07','2016-12-15 21:25:07'),(107,'7',6000,765,'2016-12-15 21:25:25','2016-12-15 21:25:25'),(108,'7',6500,720,'2016-12-15 21:25:35','2016-12-15 21:25:35'),(109,'7',7000,670,'2016-12-15 21:25:44','2016-12-15 21:25:44'),(110,'8',0,990,'2016-12-15 21:30:46','2016-12-15 21:30:46'),(111,'8',1000,990,'2016-12-15 21:30:56','2016-12-15 21:30:56'),(112,'8',1500,990,'2016-12-15 21:31:10','2016-12-15 21:31:10'),(113,'8',2000,990,'2016-12-15 21:31:33','2016-12-15 21:31:33'),(114,'8',2500,984,'2016-12-15 21:31:42','2016-12-15 21:31:42'),(115,'8',3000,980,'2016-12-15 21:31:52','2016-12-15 21:31:52'),(116,'8',3500,975,'2016-12-15 21:32:02','2016-12-15 21:32:02'),(117,'8',4000,958,'2016-12-15 21:32:12','2016-12-15 21:32:12'),(118,'8',4500,925,'2016-12-15 21:32:21','2016-12-15 21:32:21'),(119,'8',5000,900,'2016-12-15 21:32:29','2016-12-15 21:32:29'),(120,'8',5500,860,'2016-12-15 21:32:38','2016-12-15 21:32:38'),(121,'8',6000,822,'2016-12-15 21:32:45','2016-12-15 21:32:45'),(122,'8',6500,767,'2016-12-15 21:32:54','2016-12-15 21:32:54'),(123,'8',7000,698,'2016-12-15 21:33:03','2016-12-15 21:33:03'),(124,'9',0,1450,'2016-12-15 21:35:36','2016-12-15 21:35:36'),(125,'9',500,1440,'2016-12-15 21:35:49','2016-12-15 21:35:49'),(126,'9',1000,1430,'2016-12-15 21:35:58','2016-12-15 21:35:58'),(127,'9',1500,1422,'2016-12-15 21:36:05','2016-12-15 21:36:05'),(128,'9',2000,1415,'2016-12-15 21:36:14','2016-12-15 21:36:14'),(129,'9',2500,1405,'2016-12-15 21:36:22','2016-12-15 21:36:22'),(130,'9',3000,1400,'2016-12-15 21:36:28','2016-12-15 21:36:28'),(131,'9',3500,1390,'2016-12-15 21:36:36','2016-12-15 21:36:36'),(132,'9',4000,1378,'2016-12-15 21:36:46','2016-12-15 21:36:46'),(133,'9',4500,1360,'2016-12-15 21:36:59','2016-12-15 21:36:59'),(134,'9',5000,1340,'2016-12-15 21:37:07','2016-12-15 21:37:07'),(135,'9',5500,1315,'2016-12-15 21:37:26','2016-12-15 21:37:26'),(136,'9',6000,1270,'2016-12-15 21:37:35','2016-12-15 21:37:35'),(137,'9',6500,1210,'2016-12-15 21:37:51','2016-12-15 21:37:51'),(138,'10',0,1900,'2016-12-15 21:41:13','2016-12-15 21:41:13'),(139,'10',500,1890,'2016-12-15 21:41:29','2016-12-15 21:41:29'),(140,'10',1000,1880,'2016-12-15 21:41:43','2016-12-15 21:41:43'),(141,'10',1500,1860,'2016-12-15 21:41:54','2016-12-15 21:41:54'),(142,'10',2000,1840,'2016-12-15 21:42:10','2016-12-15 21:42:10'),(143,'10',2500,1820,'2016-12-15 21:42:23','2016-12-15 21:42:23'),(144,'10',3000,1780,'2016-12-15 21:42:48','2016-12-15 21:42:48'),(145,'10',3500,1710,'2016-12-15 21:46:26','2016-12-15 21:46:26'),(146,'10',4000,1640,'2016-12-15 21:46:45','2016-12-15 21:46:45'),(147,'10',4500,1550,'2016-12-15 21:46:54','2016-12-15 21:46:54'),(148,'10',5000,1450,'2016-12-15 21:47:01','2016-12-15 21:47:01'),(149,'10',5500,1320,'2016-12-15 21:50:03','2016-12-15 21:50:03'),(150,'10',6000,1155,'2016-12-15 21:51:22','2016-12-15 21:51:22'),(151,'10',6500,900,'2016-12-15 21:51:38','2016-12-15 21:51:38'),(152,'11',0,1020,'2016-12-15 22:04:21','2016-12-15 22:04:21'),(153,'11',500,1020,'2016-12-15 22:04:29','2016-12-15 22:04:29'),(154,'11',1000,1020,'2016-12-15 22:04:37','2016-12-15 22:04:37'),(155,'11',1500,1020,'2016-12-15 22:04:47','2016-12-15 22:04:47'),(156,'11',2000,1015,'2016-12-15 22:04:59','2016-12-15 22:04:59'),(157,'11',2500,1005,'2016-12-15 22:05:10','2016-12-15 22:05:10'),(158,'11',3000,1000,'2016-12-15 22:05:18','2016-12-15 22:05:18'),(159,'11',3500,995,'2016-12-15 22:05:24','2016-12-15 22:05:24'),(160,'11',4000,980,'2016-12-15 22:05:46','2016-12-15 22:05:46'),(161,'11',4500,955,'2016-12-15 22:06:00','2016-12-15 22:06:00'),(162,'11',5000,930,'2016-12-15 22:06:07','2016-12-15 22:06:07'),(163,'11',5500,880,'2016-12-15 22:06:16','2016-12-15 22:06:16'),(164,'11',6000,830,'2016-12-15 22:06:26','2016-12-15 22:06:26'),(165,'11',6250,795,'2016-12-15 22:06:36','2016-12-15 22:06:36'),(166,'12',450,2150,'2016-12-15 22:11:23','2016-12-15 22:11:23'),(167,'12',800,2145,'2016-12-15 22:11:35','2016-12-15 22:11:35'),(168,'12',1150,2140,'2016-12-15 22:11:48','2016-12-15 22:11:48'),(169,'12',1500,2125,'2016-12-15 22:12:02','2016-12-15 22:12:02'),(170,'12',1850,2100,'2016-12-15 22:12:12','2016-12-15 22:12:12'),(171,'12',2200,2065,'2016-12-15 22:12:21','2016-12-15 22:12:21'),(172,'12',2550,2030,'2016-12-15 22:12:36','2016-12-15 22:12:36'),(173,'12',2900,1970,'2016-12-15 22:12:46','2016-12-15 22:12:46'),(174,'12',3250,1910,'2016-12-15 22:12:56','2016-12-15 22:12:56'),(175,'12',3600,1860,'2016-12-15 22:13:11','2016-12-15 22:13:11'),(176,'12',3950,1745,'2016-12-15 22:13:35','2016-12-15 22:13:35'),(177,'12',4300,1630,'2016-12-15 22:13:45','2016-12-15 22:13:45'),(178,'12',4650,1500,'2016-12-15 22:13:54','2016-12-15 22:13:54'),(179,'12',5000,1325,'2016-12-15 22:14:03','2016-12-15 22:14:03');
/*!40000 ALTER TABLE `headpoints` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nominations`
--

DROP TABLE IF EXISTS `nominations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nominations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `nom_date` date DEFAULT NULL,
  `period` float DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nominations`
--

LOCK TABLES `nominations` WRITE;
/*!40000 ALTER TABLE `nominations` DISABLE KEYS */;
INSERT INTO `nominations` VALUES (1,'2016-04','test nomination','2016-04-01',30,'2016-03-24 02:26:37','2016-03-24 02:26:37'),(2,'2016-05','May 2016 Nominations','2016-05-01',31,'2016-05-26 13:16:20','2016-05-26 13:16:20'),(3,'1WMS01','Test Nominations for 1wms01','2016-05-30',31,'2016-05-30 16:56:20','2016-05-30 16:56:20'),(4,'2016-11','Test nomination used after Nov 25th, 2016','2016-11-26',30,'2016-11-26 23:02:55','2016-11-28 02:32:51'),(5,'My Test 02 Nom','Testing entry of nomination','2016-12-03',31,'2016-12-03 05:36:12','2016-12-03 05:36:12'),(6,'Line 1 Test 2016-12','Testing against BPFLOW results','2016-12-01',31,'2016-12-15 22:33:05','2016-12-15 22:33:05'),(7,'Line 1 simple 1 nom','Test with just one nomination','2016-12-01',31,'2016-12-15 23:10:46','2016-12-15 23:11:50'),(8,'TimBuckTwo Nom','Testing','2016-12-01',31,'2016-12-16 20:20:48','2016-12-16 20:20:48');
/*!40000 ALTER TABLE `nominations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pipelines`
--

DROP TABLE IF EXISTS `pipelines`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pipelines` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pipelines`
--

LOCK TABLES `pipelines` WRITE;
/*!40000 ALTER TABLE `pipelines` DISABLE KEYS */;
INSERT INTO `pipelines` VALUES (1,'Line 1','Enbridge line 01.  This is the first line used for testing the application.','2016-04-02 02:25:58','2016-04-03 15:02:45'),(6,'1WMS01','Simple Test Line - same used with BPFLOW','2016-05-30 16:50:15','2016-12-16 00:50:20'),(9,'Big Pipeline','Test','2016-12-16 20:16:54','2016-12-16 20:16:54');
/*!40000 ALTER TABLE `pipelines` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pumps`
--

DROP TABLE IF EXISTS `pumps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pumps` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pump_id` varchar(255) DEFAULT NULL,
  `description` text,
  `flow_units` varchar(255) DEFAULT NULL,
  `head_units` varchar(255) DEFAULT NULL,
  `pressure_units` varchar(255) DEFAULT NULL,
  `minimum_suction` float DEFAULT NULL,
  `stages` int(11) DEFAULT NULL,
  `impeller_diameter` float DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `efficiency_correction_factor` float DEFAULT NULL,
  `capacity_correction_factor` float DEFAULT NULL,
  `head_correction_factor` float DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pumps`
--

LOCK TABLES `pumps` WRITE;
/*!40000 ALTER TABLE `pumps` DISABLE KEYS */;
INSERT INTO `pumps` VALUES (1,'B-23674A','Bingham pump for testing','gallons/min','feet','psi',50,1,1,'2016-12-01 01:31:13','2016-12-01 15:25:56',1,1,1),(2,'B-24324A','Bingham pump for testing','gallons/min','feet','psi',50,1,1,'2016-12-01 01:33:38','2016-12-01 15:26:11',1,1,1),(3,'B-C-567','','gallons/min','feet','psi',50,1,1,'2016-12-15 15:51:40','2016-12-15 15:51:40',1,1,1),(4,'B-C-568','','gallons/min','feet','psi',50,1,1,'2016-12-15 15:59:36','2016-12-15 15:59:36',1,1,1),(5,'B-33118A','','gallons/min','feet','psi',50,1,1,'2016-12-15 16:03:56','2016-12-15 16:06:55',1,1,1),(6,'B-C-3712','','gallons/min','feet','psi',50,1,1,'2016-12-15 17:39:40','2016-12-15 17:39:40',1,1,1),(7,'B-C-3692','','gallons/min','feet','psi',50,1,1,'2016-12-15 21:19:26','2016-12-15 21:19:26',1,1,1),(8,'B-C3699','','gallons/min','feet','psi',1,1,1,'2016-12-15 21:28:28','2016-12-15 21:28:28',1,1,1),(9,'BJTC4102','','gallons/min','feet','psi',50,1,1,'2016-12-15 21:35:21','2016-12-15 21:35:21',1,1,1),(10,'B-E213','','gallons/min','feet','psi',50,1,1,'2016-12-15 21:40:52','2016-12-15 21:40:52',1,1,1),(11,'B-C-572','','gallons/min','feet','kpa',50,1,1,'2016-12-15 22:04:11','2016-12-15 22:04:11',1,1,1),(12,'B-27874','','gallons/min','feet','psi',50,1,1,'2016-12-15 22:11:06','2016-12-15 22:11:06',1,1,1);
/*!40000 ALTER TABLE `pumps` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `results`
--

DROP TABLE IF EXISTS `results`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `results` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `simulation_id` int(11) DEFAULT NULL,
  `simulation_name` varchar(255) DEFAULT NULL,
  `step` int(11) DEFAULT NULL,
  `timestamp` float DEFAULT NULL,
  `kmp` float DEFAULT NULL,
  `station_id` int(11) DEFAULT NULL,
  `stat` varchar(255) DEFAULT NULL,
  `flow` float DEFAULT NULL,
  `pumped_volume` float DEFAULT NULL,
  `upstream_batch` varchar(255) DEFAULT NULL,
  `downstream_batch` varchar(255) DEFAULT NULL,
  `hold` float DEFAULT NULL,
  `suct` float DEFAULT NULL,
  `head` float DEFAULT NULL,
  `casep` float DEFAULT NULL,
  `disc` float DEFAULT NULL,
  `max_disc_pressure` float DEFAULT NULL,
  `min_pressure_violation` float DEFAULT NULL,
  `min_pressure_point` float DEFAULT NULL,
  `max_pressure_violation` float DEFAULT NULL,
  `max_pressure_point` float DEFAULT NULL,
  `total_static_loss` float DEFAULT NULL,
  `total_dynamic_loss` float DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `station_curve_data` text,
  `batch_sequence_data` text,
  `hhp` float DEFAULT NULL,
  `step_time` float DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=218927 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `results`
--

LOCK TABLES `results` WRITE;
/*!40000 ALTER TABLE `results` DISABLE KEYS */;
INSERT INTO `results` VALUES (218879,10,'TimBuckTwo Sim',1,0,0,27,'Tim',1261.67,0,' ','63E-00002  10000.0',200,200,7814.42,8014.42,8014.42,20000,-3804.47,50,-11985.6,0,-151.432,4161.39,'2016-12-19 04:04:20','2016-12-19 04:04:20','---\n- !ruby/object:Stationcurverec\n  station_id: 27\n  station_name: Tim\n  flow: 0.0\n  head: 1168.2984000000001\n- !ruby/object:Stationcurverec\n  station_id: 27\n  station_name: Tim\n  flow: 113.56265\n  head: 1163.2184000000002\n- !ruby/object:Stationcurverec\n  station_id: 27\n  station_name: Tim\n  flow: 170.343975\n  head: 1160.6784000000002\n- !ruby/object:Stationcurverec\n  station_id: 27\n  station_name: Tim\n  flow: 227.1253\n  head: 1158.6464\n- !ruby/object:Stationcurverec\n  station_id: 27\n  station_name: Tim\n  flow: 340.68795\n  head: 1155.192\n- !ruby/object:Stationcurverec\n  station_id: 27\n  station_name: Tim\n  flow: 454.2506\n  head: 1153.0584\n- !ruby/object:Stationcurverec\n  station_id: 27\n  station_name: Tim\n  flow: 567.81325\n  head: 1148.7912000000001\n- !ruby/object:Stationcurverec\n  station_id: 27\n  station_name: Tim\n  flow: 681.3759\n  head: 1146.048\n- !ruby/object:Stationcurverec\n  station_id: 27\n  station_name: Tim\n  flow: 794.93855\n  head: 1137.9708\n- !ruby/object:Stationcurverec\n  station_id: 27\n  station_name: Tim\n  flow: 908.5012\n  head: 1127.76\n- !ruby/object:Stationcurverec\n  station_id: 27\n  station_name: Tim\n  flow: 1022.06385\n  head: 1115.1108\n- !ruby/object:Stationcurverec\n  station_id: 27\n  station_name: Tim\n  flow: 1135.6265\n  head: 1100.328\n- !ruby/object:Stationcurverec\n  station_id: 27\n  station_name: Tim\n  flow: 1249.18915\n  head: 1078.1792\n- !ruby/object:Stationcurverec\n  station_id: 27\n  station_name: Tim\n  flow: 1305.970475\n  head: 1064.0568\n- !ruby/object:Stationcurverec\n  station_id: 27\n  station_name: Tim\n  flow: 1362.7518\n  head: 1048.9184\n- !ruby/object:Stationcurverec\n  station_id: 27\n  station_name: Tim\n  flow: 1476.31445\n  head: 1012.3932\n- !ruby/object:Stationcurverec\n  station_id: 27\n  station_name: Tim\n  flow: 1589.8771\n  head: 624.84\n- !ruby/object:Stationcurverec\n  station_id: 27\n  station_name: Tim\n  flow: 1703.43975\n  head: 605.3328\n- !ruby/object:Stationcurverec\n  station_id: 27\n  station_name: Tim\n  flow: 1817.0024\n  head: 582.0156\n- !ruby/object:Stationcurverec\n  station_id: 27\n  station_name: Tim\n  flow: 1930.56505\n  head: 555.8027999999999\n- !ruby/object:Stationcurverec\n  station_id: 27\n  station_name: Tim\n  flow: 2044.1277\n  head: 280.416\n- !ruby/object:Stationcurverec\n  station_id: 27\n  station_name: Tim\n  flow: 2157.69035\n  head: 268.224\n- !ruby/object:Stationcurverec\n  station_id: 27\n  station_name: Tim\n  flow: 2271.253\n  head: 256.03200000000004\n- !ruby/object:Stationcurverec\n  station_id: 27\n  station_name: Tim\n  flow: 2384.81565\n  head: 240.792\n- !ruby/object:Stationcurverec\n  station_id: 27\n  station_name: Tim\n  flow: 2498.3783\n  head: 217.93200000000002\n- !ruby/object:Stationcurverec\n  station_id: 27\n  station_name: Tim\n  flow: 2611.94095\n  head: 179.83200000000002\n','---\n- !ruby/object:Batchrec\n  batch_number: 1\n  commodity_id: BR\n  volume: 10000.0\n  start_location: Tim\n  end_location: Two Town\n  shipper: SHELL\n  shipment_number: 1\n  batch_id: BR-00001\n- !ruby/object:Batchrec\n  batch_number: 2\n  commodity_id: 63E\n  volume: 10000.0\n  start_location: Tim\n  end_location: Two Town\n  shipper: IOL\n  shipment_number: 2\n  batch_id: 63E-00002\n- !ruby/object:Batchrec\n  batch_number: 3\n  commodity_id: BR\n  volume: 10000.0\n  start_location: Tim\n  end_location: Two Town\n  shipper: SHELL\n  shipment_number: 1\n  batch_id: BR-00003\n- !ruby/object:Batchrec\n  batch_number: 4\n  commodity_id: 63E\n  volume: 10000.0\n  start_location: Tim\n  end_location: Two Town\n  shipper: IOL\n  shipment_number: 2\n  batch_id: 63E-00004\n- !ruby/object:Batchrec\n  batch_number: 5\n  commodity_id: BR\n  volume: 10000.0\n  start_location: Tim\n  end_location: Two Town\n  shipper: SHELL\n  shipment_number: 1\n  batch_id: BR-00005\n- !ruby/object:Batchrec\n  batch_number: 6\n  commodity_id: BR\n  volume: 10000.0\n  start_location: Tim\n  end_location: Two Town\n  shipper: SHELL\n  shipment_number: 1\n  batch_id: BR-00006\n- !ruby/object:Batchrec\n  batch_number: 7\n  commodity_id: 63E\n  volume: 10000.0\n  start_location: Tim\n  end_location: Two Town\n  shipper: IOL\n  shipment_number: 2\n  batch_id: 63E-00007\n- !ruby/object:Batchrec\n  batch_number: 8\n  commodity_id: BR\n  volume: 10000.0\n  start_location: Tim\n  end_location: Two Town\n  shipper: SHELL\n  shipment_number: 1\n  batch_id: BR-00008\n- !ruby/object:Batchrec\n  batch_number: 9\n  commodity_id: BR\n  volume: 10000.0\n  start_location: Tim\n  end_location: Two Town\n  shipper: SHELL\n  shipment_number: 1\n  batch_id: BR-00009\n- !ruby/object:Batchrec\n  batch_number: 10\n  commodity_id: 63E\n  volume: 10000.0\n  start_location: Tim\n  end_location: Two Town\n  shipper: IOL\n  shipment_number: 2\n  batch_id: 63E-00010\n- !ruby/object:Batchrec\n  batch_number: 11\n  commodity_id: BR\n  volume: 10000.0\n  start_location: Tim\n  end_location: Two Town\n  shipper: SHELL\n  shipment_number: 1\n  batch_id: BR-00011\n- !ruby/object:Batchrec\n  batch_number: 12\n  commodity_id: 63E\n  volume: 10000.0\n  start_location: Tim\n  end_location: Two Town\n  shipper: IOL\n  shipment_number: 2\n  batch_id: 63E-00012\n- !ruby/object:Batchrec\n  batch_number: 13\n  commodity_id: BR\n  volume: 10000.0\n  start_location: Tim\n  end_location: Two Town\n  shipper: SHELL\n  shipment_number: 1\n  batch_id: BR-00013\n- !ruby/object:Batchrec\n  batch_number: 14\n  commodity_id: BR\n  volume: 10000.0\n  start_location: Tim\n  end_location: Two Town\n  shipper: SHELL\n  shipment_number: 1\n  batch_id: BR-00014\n- !ruby/object:Batchrec\n  batch_number: 15\n  commodity_id: BR\n  volume: 10000.0\n  start_location: Tim\n  end_location: Two Town\n  shipper: SHELL\n  shipment_number: 1\n  batch_id: BR-00015\n',2738.67,7.92601),(218880,10,'TimBuckTwo Sim',1,0,50,28,'Buck',1261.67,0,'BR-00001  10000.0','63E-00002  10000.0',4004.47,4004.47,1763.88,5768.35,5768.35,20000,0.53629,120,-14231.7,50,-211.324,5780.21,'2016-12-19 04:04:20','2016-12-19 04:04:20','---\n- !ruby/object:Stationcurverec\n  station_id: 28\n  station_name: Buck\n  flow: 0.0\n  head: 1112.52\n- !ruby/object:Stationcurverec\n  station_id: 28\n  station_name: Buck\n  flow: 45.42506\n  head: 1112.52\n- !ruby/object:Stationcurverec\n  station_id: 28\n  station_name: Buck\n  flow: 136.27518\n  head: 1112.52\n- !ruby/object:Stationcurverec\n  station_id: 28\n  station_name: Buck\n  flow: 170.343975\n  head: 1109.5482\n- !ruby/object:Stationcurverec\n  station_id: 28\n  station_name: Buck\n  flow: 227.1253\n  head: 1104.5952\n- !ruby/object:Stationcurverec\n  station_id: 28\n  station_name: Buck\n  flow: 317.97542\n  head: 1095.4512\n- !ruby/object:Stationcurverec\n  station_id: 28\n  station_name: Buck\n  flow: 340.68795\n  head: 1093.6986\n- !ruby/object:Stationcurverec\n  station_id: 28\n  station_name: Buck\n  flow: 397.469275\n  head: 1089.3171\n- !ruby/object:Stationcurverec\n  station_id: 28\n  station_name: Buck\n  flow: 408.82554\n  head: 1088.136\n- !ruby/object:Stationcurverec\n  station_id: 28\n  station_name: Buck\n  flow: 454.2506\n  head: 1083.1068\n- !ruby/object:Stationcurverec\n  station_id: 28\n  station_name: Buck\n  flow: 499.67566\n  head: 1077.5899200000001\n- !ruby/object:Stationcurverec\n  station_id: 28\n  station_name: Buck\n  flow: 511.031925\n  head: 1075.7154\n- !ruby/object:Stationcurverec\n  station_id: 28\n  station_name: Buck\n  flow: 567.81325\n  head: 1066.6476\n- !ruby/object:Stationcurverec\n  station_id: 28\n  station_name: Buck\n  flow: 590.52578\n  head: 1062.65472\n- !ruby/object:Stationcurverec\n  station_id: 28\n  station_name: Buck\n  flow: 624.594575\n  head: 1053.9222\n- !ruby/object:Stationcurverec\n  station_id: 28\n  station_name: Buck\n  flow: 681.3759\n  head: 1039.368\n- !ruby/object:Stationcurverec\n  station_id: 28\n  station_name: Buck\n  flow: 738.157225\n  head: 1018.1082000000001\n- !ruby/object:Stationcurverec\n  station_id: 28\n  station_name: Buck\n  flow: 772.2260200000001\n  head: 1005.35232\n- !ruby/object:Stationcurverec\n  station_id: 28\n  station_name: Buck\n  flow: 794.93855\n  head: 995.4768000000001\n- !ruby/object:Stationcurverec\n  station_id: 28\n  station_name: Buck\n  flow: 851.719875\n  head: 969.1116000000001\n- !ruby/object:Stationcurverec\n  station_id: 28\n  station_name: Buck\n  flow: 863.07614\n  head: 963.8385600000001\n- !ruby/object:Stationcurverec\n  station_id: 28\n  station_name: Buck\n  flow: 908.5012\n  head: 941.5272\n- !ruby/object:Stationcurverec\n  station_id: 28\n  station_name: Buck\n  flow: 953.92626\n  head: 916.8993600000001\n- !ruby/object:Stationcurverec\n  station_id: 28\n  station_name: Buck\n  flow: 965.282525\n  head: 910.4757\n- !ruby/object:Stationcurverec\n  station_id: 28\n  station_name: Buck\n  flow: 1022.06385\n  head: 878.0526\n- !ruby/object:Stationcurverec\n  station_id: 28\n  station_name: Buck\n  flow: 1044.77638\n  head: 865.0224000000001\n- !ruby/object:Stationcurverec\n  station_id: 28\n  station_name: Buck\n  flow: 1078.845175\n  head: 843.0768\n- !ruby/object:Stationcurverec\n  station_id: 28\n  station_name: Buck\n  flow: 1135.6265\n  head: 805.2816\n- !ruby/object:Stationcurverec\n  station_id: 28\n  station_name: Buck\n  flow: 1198.0859575\n  head: 497.73840000000007\n- !ruby/object:Stationcurverec\n  station_id: 28\n  station_name: Buck\n  flow: 1249.18915\n  head: 243.84\n- !ruby/object:Stationcurverec\n  station_id: 28\n  station_name: Buck\n  flow: 1362.7518\n  head: 233.17200000000003\n- !ruby/object:Stationcurverec\n  station_id: 28\n  station_name: Buck\n  flow: 1476.31445\n  head: 219.45600000000002\n- !ruby/object:Stationcurverec\n  station_id: 28\n  station_name: Buck\n  flow: 1589.8771\n  head: 204.216\n','---\n- !ruby/object:Batchrec\n  batch_number: 1\n  commodity_id: BR\n  volume: 10000.0\n  start_location: Tim\n  end_location: Two Town\n  shipper: SHELL\n  shipment_number: 1\n  batch_id: BR-00001\n- !ruby/object:Batchrec\n  batch_number: 2\n  commodity_id: 63E\n  volume: 10000.0\n  start_location: Tim\n  end_location: Two Town\n  shipper: IOL\n  shipment_number: 2\n  batch_id: 63E-00002\n- !ruby/object:Batchrec\n  batch_number: 3\n  commodity_id: BR\n  volume: 10000.0\n  start_location: Tim\n  end_location: Two Town\n  shipper: SHELL\n  shipment_number: 1\n  batch_id: BR-00003\n- !ruby/object:Batchrec\n  batch_number: 4\n  commodity_id: 63E\n  volume: 10000.0\n  start_location: Tim\n  end_location: Two Town\n  shipper: IOL\n  shipment_number: 2\n  batch_id: 63E-00004\n- !ruby/object:Batchrec\n  batch_number: 5\n  commodity_id: BR\n  volume: 10000.0\n  start_location: Tim\n  end_location: Two Town\n  shipper: SHELL\n  shipment_number: 1\n  batch_id: BR-00005\n- !ruby/object:Batchrec\n  batch_number: 6\n  commodity_id: BR\n  volume: 10000.0\n  start_location: Tim\n  end_location: Two Town\n  shipper: SHELL\n  shipment_number: 1\n  batch_id: BR-00006\n- !ruby/object:Batchrec\n  batch_number: 7\n  commodity_id: 63E\n  volume: 10000.0\n  start_location: Tim\n  end_location: Two Town\n  shipper: IOL\n  shipment_number: 2\n  batch_id: 63E-00007\n- !ruby/object:Batchrec\n  batch_number: 8\n  commodity_id: BR\n  volume: 10000.0\n  start_location: Tim\n  end_location: Two Town\n  shipper: SHELL\n  shipment_number: 1\n  batch_id: BR-00008\n- !ruby/object:Batchrec\n  batch_number: 9\n  commodity_id: BR\n  volume: 10000.0\n  start_location: Tim\n  end_location: Two Town\n  shipper: SHELL\n  shipment_number: 1\n  batch_id: BR-00009\n- !ruby/object:Batchrec\n  batch_number: 10\n  commodity_id: 63E\n  volume: 10000.0\n  start_location: Tim\n  end_location: Two Town\n  shipper: IOL\n  shipment_number: 2\n  batch_id: 63E-00010\n- !ruby/object:Batchrec\n  batch_number: 11\n  commodity_id: BR\n  volume: 10000.0\n  start_location: Tim\n  end_location: Two Town\n  shipper: SHELL\n  shipment_number: 1\n  batch_id: BR-00011\n- !ruby/object:Batchrec\n  batch_number: 12\n  commodity_id: 63E\n  volume: 10000.0\n  start_location: Tim\n  end_location: Two Town\n  shipper: IOL\n  shipment_number: 2\n  batch_id: 63E-00012\n- !ruby/object:Batchrec\n  batch_number: 13\n  commodity_id: BR\n  volume: 10000.0\n  start_location: Tim\n  end_location: Two Town\n  shipper: SHELL\n  shipment_number: 1\n  batch_id: BR-00013\n- !ruby/object:Batchrec\n  batch_number: 14\n  commodity_id: BR\n  volume: 10000.0\n  start_location: Tim\n  end_location: Two Town\n  shipper: SHELL\n  shipment_number: 1\n  batch_id: BR-00014\n- !ruby/object:Batchrec\n  batch_number: 15\n  commodity_id: BR\n  volume: 10000.0\n  start_location: Tim\n  end_location: Two Town\n  shipper: SHELL\n  shipment_number: 1\n  batch_id: BR-00015\n',618.177,7.92601),(218881,10,'TimBuckTwo Sim',1,0,120,29,'Two Town',0,0,'BR-00003  10000.0',NULL,199.464,0,0,0,0,NULL,0,0,0,0,0,0,'2016-12-19 04:04:20','2016-12-19 04:04:20','--- []\n',NULL,0,7.92601),(218882,10,'TimBuckTwo Sim',2,7.92601,0,27,'Tim',820.366,10000,' ','BR-00001  10000.0',64.3,64.3,10431.8,10496.1,10496.1,20000,-2066.58,50,-9503.95,0,-191.363,8556.53,'2016-12-19 04:04:20','2016-12-19 04:04:20',NULL,NULL,2377.18,12.1897),(218883,10,'TimBuckTwo Sim',2,7.92601,50,28,'Buck',820.366,10000,'63E-00002  10000.0','BR-00003  10000.0',2130.88,2130.88,9035.43,11166.3,11166.3,20000,3.78428,120,-8833.69,50,-266.534,11372.3,'2016-12-19 04:04:20','2016-12-19 04:04:20',NULL,NULL,2058.99,12.1897),(218884,10,'TimBuckTwo Sim',2,7.92601,120,29,'Two Town',0,0,'63E-00004  10000.0',NULL,60.5157,0,0,0,0,NULL,0,0,0,0,0,0,'2016-12-19 04:04:20','2016-12-19 04:04:20',NULL,NULL,0,12.1897),(218885,10,'TimBuckTwo Sim',3,20.1157,0,27,'Tim',1261.67,20000,' ','63E-00002  10000.0',200,200,7814.42,8014.42,8014.42,20000,-3804.47,50,-11985.6,0,-151.432,4161.39,'2016-12-19 04:04:20','2016-12-19 04:04:20',NULL,NULL,2738.67,7.92601),(218886,10,'TimBuckTwo Sim',3,20.1157,50,28,'Buck',1261.67,20000,'BR-00003  10000.0','63E-00004  10000.0',4004.47,4004.47,1763.88,5768.35,5768.35,20000,0.53629,120,-14231.7,50,-211.324,5780.21,'2016-12-19 04:04:20','2016-12-19 04:04:20',NULL,NULL,618.177,7.92601),(218887,10,'TimBuckTwo Sim',3,20.1157,120,29,'Two Town',0,0,'BR-00005  10000.0',NULL,199.464,0,0,0,0,NULL,0,0,0,0,0,0,'2016-12-19 04:04:20','2016-12-19 04:04:20',NULL,NULL,0,7.92601),(218888,10,'TimBuckTwo Sim',4,28.0417,0,27,'Tim',820.366,30000,' ','BR-00003  10000.0',64.3,64.3,10431.8,10496.1,10496.1,20000,-2066.58,50,-9503.95,0,-191.363,8556.53,'2016-12-19 04:04:20','2016-12-19 04:04:20',NULL,NULL,2377.18,12.1897),(218889,10,'TimBuckTwo Sim',4,28.0417,50,28,'Buck',820.366,30000,'63E-00004  10000.0','BR-00005  10000.0',2130.88,2130.88,9035.43,11166.3,11166.3,20000,3.78428,120,-8833.69,50,-266.534,11372.3,'2016-12-19 04:04:20','2016-12-19 04:04:20',NULL,NULL,2058.99,12.1897),(218890,10,'TimBuckTwo Sim',4,28.0417,120,29,'Two Town',0,0,'BR-00006  10000.0',NULL,60.5157,0,0,0,0,NULL,0,0,0,0,0,0,'2016-12-19 04:04:20','2016-12-19 04:04:20',NULL,NULL,0,12.1897),(218891,10,'TimBuckTwo Sim',5,40.2314,0,27,'Tim',1261.67,40000,' ','63E-00004  10000.0',200,200,7814.42,8014.42,8014.42,20000,-3804.47,50,-11985.6,0,-151.432,4161.39,'2016-12-19 04:04:20','2016-12-19 04:04:20',NULL,NULL,2738.67,7.92601),(218892,10,'TimBuckTwo Sim',5,40.2314,50,28,'Buck',1261.67,40000,'BR-00005  10000.0','BR-00006  10000.0',4004.47,4004.47,1763.88,5768.35,5768.35,20000,0.53629,120,-14231.7,50,-211.324,5780.21,'2016-12-19 04:04:20','2016-12-19 04:04:20',NULL,NULL,618.177,7.92601),(218893,10,'TimBuckTwo Sim',5,40.2314,120,29,'Two Town',0,0,'63E-00007  10000.0',NULL,199.464,0,0,0,0,NULL,0,0,0,0,0,0,'2016-12-19 04:04:20','2016-12-19 04:04:20',NULL,NULL,0,7.92601),(218894,10,'TimBuckTwo Sim',6,48.1574,0,27,'Tim',820.366,50000,' ','BR-00005  10000.0',64.3,64.3,10431.8,10496.1,10496.1,20000,-2066.58,50,-9503.95,0,-191.363,8556.53,'2016-12-19 04:04:20','2016-12-19 04:04:20',NULL,NULL,2377.18,12.1897),(218895,10,'TimBuckTwo Sim',6,48.1574,50,28,'Buck',820.366,50000,'BR-00006  10000.0','63E-00007  10000.0',2130.88,2130.88,9035.43,11166.3,11166.3,20000,3.78428,120,-8833.69,50,-266.534,11372.3,'2016-12-19 04:04:20','2016-12-19 04:04:20',NULL,NULL,2058.99,12.1897),(218896,10,'TimBuckTwo Sim',6,48.1574,120,29,'Two Town',0,0,'BR-00008  10000.0',NULL,60.5157,0,0,0,0,NULL,0,0,0,0,0,0,'2016-12-19 04:04:20','2016-12-19 04:04:20',NULL,NULL,0,12.1897),(218897,10,'TimBuckTwo Sim',7,60.3471,0,27,'Tim',820.366,60000,' ','BR-00006  10000.0',64.3,64.3,10431.8,10496.1,10496.1,20000,-2066.58,50,-9503.95,0,-191.363,8556.53,'2016-12-19 04:04:20','2016-12-19 04:04:20',NULL,NULL,2377.18,12.1897),(218898,10,'TimBuckTwo Sim',7,60.3471,50,28,'Buck',820.366,60000,'63E-00007  10000.0','BR-00008  10000.0',2130.88,2130.88,9035.43,11166.3,11166.3,20000,3.78428,120,-8833.69,50,-266.534,11372.3,'2016-12-19 04:04:20','2016-12-19 04:04:20',NULL,NULL,2058.99,12.1897),(218899,10,'TimBuckTwo Sim',7,60.3471,120,29,'Two Town',0,0,'BR-00009  10000.0',NULL,60.5157,0,0,0,0,NULL,0,0,0,0,0,0,'2016-12-19 04:04:20','2016-12-19 04:04:20',NULL,NULL,0,12.1897),(218900,10,'TimBuckTwo Sim',8,72.5368,0,27,'Tim',1261.67,70000,' ','63E-00007  10000.0',200,200,7814.42,8014.42,8014.42,20000,-3804.47,50,-11985.6,0,-151.432,4161.39,'2016-12-19 04:04:20','2016-12-19 04:04:20',NULL,NULL,2738.67,7.92601),(218901,10,'TimBuckTwo Sim',8,72.5368,50,28,'Buck',1261.67,70000,'BR-00008  10000.0','BR-00009  10000.0',4004.47,4004.47,1763.88,5768.35,5768.35,20000,0.53629,120,-14231.7,50,-211.324,5780.21,'2016-12-19 04:04:20','2016-12-19 04:04:20',NULL,NULL,618.177,7.92601),(218902,10,'TimBuckTwo Sim',8,72.5368,120,29,'Two Town',0,0,'63E-00010  10000.0',NULL,199.464,0,0,0,0,NULL,0,0,0,0,0,0,'2016-12-19 04:04:20','2016-12-19 04:04:20',NULL,NULL,0,7.92601),(218903,10,'TimBuckTwo Sim',9,80.4628,0,27,'Tim',820.366,80000,' ','BR-00008  10000.0',64.3,64.3,10431.8,10496.1,10496.1,20000,-2066.58,50,-9503.95,0,-191.363,8556.53,'2016-12-19 04:04:20','2016-12-19 04:04:20',NULL,NULL,2377.18,12.1897),(218904,10,'TimBuckTwo Sim',9,80.4628,50,28,'Buck',820.366,80000,'BR-00009  10000.0','63E-00010  10000.0',2130.88,2130.88,9035.43,11166.3,11166.3,20000,3.78428,120,-8833.69,50,-266.534,11372.3,'2016-12-19 04:04:20','2016-12-19 04:04:20',NULL,NULL,2058.99,12.1897),(218905,10,'TimBuckTwo Sim',9,80.4628,120,29,'Two Town',0,0,'BR-00011  10000.0',NULL,60.5157,0,0,0,0,NULL,0,0,0,0,0,0,'2016-12-19 04:04:20','2016-12-19 04:04:20',NULL,NULL,0,12.1897),(218906,10,'TimBuckTwo Sim',10,92.6525,0,27,'Tim',820.366,90000,' ','BR-00009  10000.0',64.3,64.3,10431.8,10496.1,10496.1,20000,-2066.58,50,-9503.95,0,-191.363,8556.53,'2016-12-19 04:04:20','2016-12-19 04:04:20',NULL,NULL,2377.18,12.1897),(218907,10,'TimBuckTwo Sim',10,92.6525,50,28,'Buck',820.366,90000,'63E-00010  10000.0','BR-00011  10000.0',2130.88,2130.88,9035.43,11166.3,11166.3,20000,3.78428,120,-8833.69,50,-266.534,11372.3,'2016-12-19 04:04:20','2016-12-19 04:04:20',NULL,NULL,2058.99,12.1897),(218908,10,'TimBuckTwo Sim',10,92.6525,120,29,'Two Town',0,0,'63E-00012  10000.0',NULL,60.5157,0,0,0,0,NULL,0,0,0,0,0,0,'2016-12-19 04:04:20','2016-12-19 04:04:20',NULL,NULL,0,12.1897),(218909,10,'TimBuckTwo Sim',11,104.842,0,27,'Tim',1261.67,100000,' ','63E-00010  10000.0',200,200,7814.42,8014.42,8014.42,20000,-3804.47,50,-11985.6,0,-151.432,4161.39,'2016-12-19 04:04:20','2016-12-19 04:04:20',NULL,NULL,2738.67,7.92601),(218910,10,'TimBuckTwo Sim',11,104.842,50,28,'Buck',1261.67,100000,'BR-00011  10000.0','63E-00012  10000.0',4004.47,4004.47,1763.88,5768.35,5768.35,20000,0.53629,120,-14231.7,50,-211.324,5780.21,'2016-12-19 04:04:20','2016-12-19 04:04:20',NULL,NULL,618.177,7.92601),(218911,10,'TimBuckTwo Sim',11,104.842,120,29,'Two Town',0,0,'BR-00013  10000.0',NULL,199.464,0,0,0,0,NULL,0,0,0,0,0,0,'2016-12-19 04:04:20','2016-12-19 04:04:20',NULL,NULL,0,7.92601),(218912,10,'TimBuckTwo Sim',12,112.768,0,27,'Tim',820.366,110000,' ','BR-00011  10000.0',64.3,64.3,10431.8,10496.1,10496.1,20000,-2066.58,50,-9503.95,0,-191.363,8556.53,'2016-12-19 04:04:20','2016-12-19 04:04:20',NULL,NULL,2377.18,12.1897),(218913,10,'TimBuckTwo Sim',12,112.768,50,28,'Buck',820.366,110000,'63E-00012  10000.0','BR-00013  10000.0',2130.88,2130.88,9035.43,11166.3,11166.3,20000,3.78428,120,-8833.69,50,-266.534,11372.3,'2016-12-19 04:04:20','2016-12-19 04:04:20',NULL,NULL,2058.99,12.1897),(218914,10,'TimBuckTwo Sim',12,112.768,120,29,'Two Town',0,0,'BR-00014  10000.0',NULL,60.5157,0,0,0,0,NULL,0,0,0,0,0,0,'2016-12-19 04:04:20','2016-12-19 04:04:20',NULL,NULL,0,12.1897),(218915,10,'TimBuckTwo Sim',13,124.958,0,27,'Tim',1261.67,120000,' ','63E-00012  10000.0',200,200,7814.42,8014.42,8014.42,20000,-3804.47,50,-11985.6,0,-151.432,4161.39,'2016-12-19 04:04:20','2016-12-19 04:04:20',NULL,NULL,2738.67,7.92601),(218916,10,'TimBuckTwo Sim',13,124.958,50,28,'Buck',1261.67,120000,'BR-00013  10000.0','BR-00014  10000.0',4004.47,4004.47,1763.88,5768.35,5768.35,20000,0.53629,120,-14231.7,50,-211.324,5780.21,'2016-12-19 04:04:20','2016-12-19 04:04:20',NULL,NULL,618.177,7.92601),(218917,10,'TimBuckTwo Sim',13,124.958,120,29,'Two Town',0,0,'BR-00015  10000.0',NULL,199.464,0,0,0,0,NULL,0,0,0,0,0,0,'2016-12-19 04:04:20','2016-12-19 04:04:20',NULL,NULL,0,7.92601),(218918,10,'TimBuckTwo Sim',14,132.884,0,27,'Tim',820.366,130000,' ','BR-00013  10000.0',64.3,64.3,10431.8,10496.1,10496.1,20000,-2066.58,50,-9503.95,0,-191.363,8556.53,'2016-12-19 04:04:20','2016-12-19 04:04:20',NULL,NULL,2377.18,12.1897),(218919,10,'TimBuckTwo Sim',14,132.884,50,28,'Buck',820.366,130000,'BR-00014  10000.0','BR-00015  10000.0',2130.88,2130.88,9035.43,11166.3,11166.3,20000,3.78428,120,-8833.69,50,-266.534,11372.3,'2016-12-19 04:04:20','2016-12-19 04:04:20',NULL,NULL,2058.99,12.1897),(218920,10,'TimBuckTwo Sim',14,132.884,120,29,'Two Town',0,0,'BR-00001  10000.0',NULL,60.5157,0,0,0,0,NULL,0,0,0,0,0,0,'2016-12-19 04:04:20','2016-12-19 04:04:20',NULL,NULL,0,12.1897),(218921,10,'TimBuckTwo Sim',15,145.074,0,27,'Tim',820.366,140000,' ','BR-00014  10000.0',64.3,64.3,10431.8,10496.1,10496.1,20000,-2066.58,50,-9503.95,0,-191.363,8556.53,'2016-12-19 04:04:20','2016-12-19 04:04:20',NULL,NULL,2377.18,12.1897),(218922,10,'TimBuckTwo Sim',15,145.074,50,28,'Buck',820.366,140000,'BR-00015  10000.0','BR-00001  10000.0',2130.88,2130.88,9035.43,11166.3,11166.3,20000,3.78428,120,-8833.69,50,-266.534,11372.3,'2016-12-19 04:04:20','2016-12-19 04:04:20',NULL,NULL,2058.99,12.1897),(218923,10,'TimBuckTwo Sim',15,145.074,120,29,'Two Town',0,0,'63E-00002  10000.0',NULL,60.5157,0,0,0,0,NULL,0,0,0,0,0,0,'2016-12-19 04:04:20','2016-12-19 04:04:20',NULL,NULL,0,12.1897),(218924,10,'TimBuckTwo Sim',16,157.263,0,27,'Tim',820.366,150000,' ','BR-00015  10000.0',64.3,64.3,10431.8,10496.1,10496.1,20000,-2066.58,50,-9503.95,0,-191.363,8556.53,'2016-12-19 04:04:20','2016-12-19 04:04:20',NULL,NULL,2377.18,12.1897),(218925,10,'TimBuckTwo Sim',16,157.263,50,28,'Buck',820.366,150000,'BR-00001  10000.0','63E-00002  10000.0',2130.88,2130.88,9035.43,11166.3,11166.3,20000,3.78428,120,-8833.69,50,-266.534,11372.3,'2016-12-19 04:04:20','2016-12-19 04:04:20',NULL,NULL,2058.99,12.1897),(218926,10,'TimBuckTwo Sim',16,157.263,120,29,'Two Town',0,0,'BR-00003  10000.0',NULL,60.5157,0,0,0,0,NULL,0,0,0,0,0,0,'2016-12-19 04:04:20','2016-12-19 04:04:20',NULL,NULL,0,12.1897);
/*!40000 ALTER TABLE `results` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schema_migrations`
--

DROP TABLE IF EXISTS `schema_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schema_migrations` (
  `version` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  UNIQUE KEY `unique_schema_migrations` (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schema_migrations`
--

LOCK TABLES `schema_migrations` WRITE;
/*!40000 ALTER TABLE `schema_migrations` DISABLE KEYS */;
INSERT INTO `schema_migrations` VALUES ('20160316204320'),('20160316230347'),('20160318143858'),('20160320011737'),('20160321011250'),('20160321012411'),('20160321013825'),('20160321020204'),('20160321023024'),('20160321025902'),('20160321144602'),('20160321225915'),('20160322133222'),('20160323010450'),('20160323213503'),('20160324005925'),('20160324011230'),('20160324140620'),('20160520003845'),('20160522004715'),('20161130002858'),('20161201002244'),('20161201011832'),('20161201151138'),('20161201163219'),('20161204013321'),('20161205171241'),('20161205172258'),('20161207213530'),('20161213023235'),('20161213192606'),('20161214000606'),('20161216020716'),('20161216051932'),('20161216164204');
/*!40000 ALTER TABLE `schema_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `segments`
--

DROP TABLE IF EXISTS `segments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `segments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `diameter` float DEFAULT NULL,
  `thickness` float DEFAULT NULL,
  `roughness` float DEFAULT NULL,
  `mawp` float DEFAULT NULL,
  `pipeline_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `kmp` float DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_segments_on_pipeline_id` (`pipeline_id`),
  CONSTRAINT `fk_rails_ffb59fe1d0` FOREIGN KEY (`pipeline_id`) REFERENCES `pipelines` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `segments`
--

LOCK TABLES `segments` WRITE;
/*!40000 ALTER TABLE `segments` DISABLE KEYS */;
INSERT INTO `segments` VALUES (1,0.49,0.05,0.00000381,10000,1,'2016-04-02 02:29:45','2016-04-02 02:29:45',0),(2,0.492,0.05,0.00000381,10000,1,'2016-04-02 02:30:31','2016-04-02 02:30:31',14.34),(3,0.49,0.05,0.00000381,10000,1,'2016-04-02 02:30:58','2016-04-02 02:30:58',176),(4,0.492,0.05,0.00000381,10000,1,'2016-04-02 02:31:56','2016-04-02 02:31:56',188.4),(5,0.49,0.05,0.00000381,10000,1,'2016-04-02 02:33:32','2016-04-02 02:33:32',351.95),(6,0.492,0.05,0.00000381,10000,1,'2016-04-02 02:34:02','2016-04-02 02:34:02',428.24),(7,0.4874,0.05,0.00000381,10000,1,'2016-04-02 02:35:03','2016-04-02 02:35:03',538.18),(8,0.49,0.05,0.00000381,10000,1,'2016-04-02 02:35:37','2016-04-02 02:35:37',538.24),(9,0.492,0.05,0.00000381,10000,1,'2016-04-02 02:36:09','2016-04-02 02:36:09',566.63),(10,0.39,0.05,0.00000381,10000,1,'2016-04-02 02:37:30','2016-04-02 02:37:30',704.48),(11,0.443,0.05,0.00000381,10000,1,'2016-04-02 02:37:51','2016-04-02 02:37:51',899.74),(12,0.39,0.05,0.00000381,10000,1,'2016-04-02 02:38:17','2016-04-02 02:38:17',959.77),(13,0.443,0.05,0.00000381,10000,1,'2016-04-02 02:38:37','2016-04-02 02:38:37',1242.61),(14,0.443,0.05,0.00000381,10000,1,'2016-04-02 02:38:58','2016-04-02 02:38:58',1766.84),(36,0.3,0.005,0.00000381,10000,6,'2016-05-30 16:51:39','2016-05-31 13:58:12',0),(37,0.3,0.005,0.00000381,10000,6,'2016-05-30 16:52:00','2016-10-06 18:16:41',60),(40,0.3,0.005,0.00000381,10000,6,'2016-12-15 16:09:22','2016-12-15 16:09:22',30),(41,0.5,0.05,0.00000381,20000,9,'2016-12-16 20:18:01','2016-12-16 20:18:01',0);
/*!40000 ALTER TABLE `segments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shipments`
--

DROP TABLE IF EXISTS `shipments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shipments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `start_location` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `end_location` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `shipper` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `commodity_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `volume` float DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `nomination_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_shipments_on_nomination_id` (`nomination_id`),
  CONSTRAINT `fk_rails_4e48662adc` FOREIGN KEY (`nomination_id`) REFERENCES `nominations` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shipments`
--

LOCK TABLES `shipments` WRITE;
/*!40000 ALTER TABLE `shipments` DISABLE KEYS */;
INSERT INTO `shipments` VALUES (1,'Edmonton','Superior','IOL','63E',1000,'2016-03-24 13:22:48','2016-11-26 23:01:32',1),(2,'Edmonton','Regina','PETCN','SYN',5000,'2016-03-24 13:32:01','2016-10-18 15:24:31',1),(3,'Edmonton','Superior','SHELL','41E',6000,'2016-03-24 16:00:36','2016-10-18 15:24:40',1),(5,'S1','S3','IOL','41E',100000,'2016-05-30 16:56:44','2016-12-15 16:13:21',3),(7,'Kerrobert','Superior','TEX','NGL',10000,'2016-10-29 13:12:55','2016-10-29 13:12:55',1),(8,'Edmonton','Superior','IOL','63E',60000,'2016-11-26 23:03:26','2016-11-26 23:03:26',4),(9,'Edmonton','Regina','PETCN','SYN',55000,'2016-11-26 23:03:50','2016-11-30 03:45:28',4),(10,'Edmonton','Superior','SHELL','41E',75000,'2016-11-26 23:04:20','2016-11-26 23:04:20',4),(11,'Kerrobert','Superior','TEX','NGL',120000,'2016-11-26 23:04:45','2016-11-30 03:45:40',4),(12,'Edmonton','Hardisty','WMS','63E',40000,'2016-12-03 05:36:47','2016-12-03 23:37:06',5),(14,'Edmonton','Superior','IOL','63E',10000,'2016-12-15 22:56:46','2016-12-15 22:56:46',6),(15,'Edmonton','Gretna','IOL','SYN',2000,'2016-12-15 22:57:11','2016-12-15 22:59:17',6),(16,'Regina','Superior','PETCN','63E',60000,'2016-12-15 22:57:53','2016-12-15 22:57:53',6),(17,'Edmonton','Superior','SHELL','SYN',2000,'2016-12-15 22:58:37','2016-12-15 22:58:37',6),(18,'Edmonton','Superior','PEN','63E',30000,'2016-12-15 23:01:00','2016-12-15 23:01:00',6),(19,'Edmonton','Superior','HUSKY','41E',55000,'2016-12-15 23:02:09','2016-12-15 23:02:09',6),(20,'Edmonton','Superior','IOL','41E',100000,'2016-12-15 23:11:04','2016-12-15 23:11:04',7),(21,'Tim','Two Town','SHELL','BR',100000,'2016-12-16 20:21:14','2016-12-16 20:27:06',8),(22,'Tim','Two Town','IOL','63E',50000,'2016-12-16 20:21:38','2016-12-16 20:21:38',8),(23,'Edmonton','Superior','IOL','63E',50000,'2016-12-16 23:22:34','2016-12-16 23:22:34',2);
/*!40000 ALTER TABLE `shipments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `simulations`
--

DROP TABLE IF EXISTS `simulations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `simulations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pipeline_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `max_flowrate` float DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `nomination_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `max_batchsize` float DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `simulations`
--

LOCK TABLES `simulations` WRITE;
/*!40000 ALTER TABLE `simulations` DISABLE KEYS */;
INSERT INTO `simulations` VALUES (3,'Line 1 First','First simulation ever performed','Line 1',1000,'2016-03-24 14:14:10','2016-12-16 23:13:31','2016-05',10000),(6,'1WMS01','Test Simulation','1WMS01',1200,'2016-05-30 16:59:15','2016-12-15 16:14:04','1WMS01',10000),(7,'Line 1 Benchmark','Line 1 Benchmark Test from Nov 25th','Line 1',600,'2016-11-26 23:05:48','2016-12-16 15:12:01','2016-11',10000),(9,'Line 1 Comparison','Line 1 Test comparing results against BPFLOW output','Line 1',800,'2016-12-15 22:37:10','2016-12-16 16:29:13','Line 1 Test 2016-12',10000),(10,'TimBuckTwo Sim','Testing','Big Pipeline',2000,'2016-12-16 20:22:22','2016-12-16 20:22:22','TimBuckTwo Nom',10000);
/*!40000 ALTER TABLE `simulations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stations`
--

DROP TABLE IF EXISTS `stations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `kmp` float DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `pipeline_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_stations_on_pipeline_id` (`pipeline_id`),
  CONSTRAINT `fk_rails_f1f74b6021` FOREIGN KEY (`pipeline_id`) REFERENCES `pipelines` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stations`
--

LOCK TABLES `stations` WRITE;
/*!40000 ALTER TABLE `stations` DISABLE KEYS */;
INSERT INTO `stations` VALUES (1,'Edmonton',0,'2016-04-02 02:26:24','2016-04-02 02:26:24',1),(2,'Hardisty',176,'2016-04-02 02:26:35','2016-04-02 02:26:35',1),(3,'Kerrobert',351.95,'2016-04-02 02:26:49','2016-04-02 02:26:49',1),(4,'Regina',704.48,'2016-04-02 02:27:01','2016-04-02 02:27:01',1),(5,'Cromer',959.77,'2016-04-02 02:27:13','2016-04-02 02:27:13',1),(6,'West Souris',1031.9,'2016-04-02 02:27:34','2016-04-02 02:27:34',1),(7,'Gretna',1242.61,'2016-04-02 02:27:58','2016-04-02 02:27:58',1),(8,'Clearbrook',1463.39,'2016-04-02 02:28:15','2016-04-02 02:28:15',1),(9,'Superior',1766.84,'2016-04-02 02:28:29','2016-04-02 02:28:29',1),(19,'S3',60,'2016-05-30 16:51:07','2016-10-06 18:15:57',6),(25,'S1',0,'2016-12-04 17:48:35','2016-12-04 17:48:35',6),(26,'S2',30,'2016-12-15 16:08:30','2016-12-15 16:08:30',6),(27,'Tim',0,'2016-12-16 20:17:03','2016-12-16 20:17:03',9),(28,'Buck',50,'2016-12-16 20:17:18','2016-12-16 20:17:18',9),(29,'Two Town',120,'2016-12-16 20:17:32','2016-12-16 20:17:32',9);
/*!40000 ALTER TABLE `stations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `temperatures`
--

DROP TABLE IF EXISTS `temperatures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `temperatures` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `kmp` float DEFAULT NULL,
  `temperature` float DEFAULT NULL,
  `pipeline_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_temperatures_on_pipeline_id` (`pipeline_id`),
  CONSTRAINT `fk_rails_5e307a552d` FOREIGN KEY (`pipeline_id`) REFERENCES `pipelines` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `temperatures`
--

LOCK TABLES `temperatures` WRITE;
/*!40000 ALTER TABLE `temperatures` DISABLE KEYS */;
INSERT INTO `temperatures` VALUES (1,0,5,1,'2016-04-02 14:07:09','2016-04-02 14:07:09'),(2,100,15,1,'2016-04-02 14:07:25','2016-04-02 14:07:25'),(3,321.8,5,1,'2016-04-02 14:07:34','2016-04-02 14:07:34'),(4,1766.84,5,1,'2016-04-02 14:07:44','2016-04-02 14:07:44'),(11,0,5,6,'2016-05-30 16:54:02','2016-12-19 03:59:10'),(12,30,5,6,'2016-05-30 16:54:10','2016-05-30 16:54:10'),(13,60,5,6,'2016-05-30 16:54:15','2016-10-06 18:16:59'),(16,0,5,9,'2016-12-16 20:18:48','2016-12-16 20:18:48'),(17,60,7,9,'2016-12-16 20:18:57','2016-12-16 20:18:57'),(18,100,10,9,'2016-12-16 20:19:04','2016-12-16 20:19:04');
/*!40000 ALTER TABLE `temperatures` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `units`
--

DROP TABLE IF EXISTS `units`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `units` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `station_id` int(11) DEFAULT NULL,
  `pump_id` varchar(255) DEFAULT NULL,
  `unit_row` int(11) DEFAULT NULL,
  `unit_column` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_units_on_station_id` (`station_id`)
) ENGINE=InnoDB AUTO_INCREMENT=81 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `units`
--

LOCK TABLES `units` WRITE;
/*!40000 ALTER TABLE `units` DISABLE KEYS */;
INSERT INTO `units` VALUES (25,25,'B-23674A',1,1,'2016-12-04 17:50:04','2016-12-15 16:38:30'),(26,25,'B-C-567',1,2,'2016-12-04 17:50:10','2016-12-15 16:11:20'),(27,25,'B-C-568',1,3,'2016-12-04 17:50:14','2016-12-15 16:11:34'),(32,1,'B-23674A',1,1,'2016-12-06 00:24:21','2016-12-06 00:24:21'),(33,1,'B-C-567',1,1,'2016-12-06 00:24:36','2016-12-15 21:54:43'),(34,2,'B-C-3712',1,1,'2016-12-06 00:24:48','2016-12-15 21:55:41'),(35,3,'B-C-3712',1,1,'2016-12-06 00:24:59','2016-12-15 21:57:58'),(36,4,'B-C3699',1,1,'2016-12-06 00:25:11','2016-12-15 21:59:14'),(38,6,'BJTC4102',1,1,'2016-12-06 00:25:39','2016-12-15 22:02:06'),(39,7,'B-24324A',1,1,'2016-12-06 00:25:56','2016-12-15 22:08:23'),(40,8,'B-23674A',1,1,'2016-12-06 00:26:08','2016-12-06 00:26:08'),(41,1,'B-C-568',1,1,'2016-12-07 18:37:29','2016-12-15 21:54:59'),(42,8,'B-24324A',1,2,'2016-12-07 18:42:04','2016-12-08 02:16:23'),(43,8,'B-23674A',1,3,'2016-12-07 18:43:35','2016-12-08 02:16:30'),(44,2,'B-C-3712',1,2,'2016-12-08 01:57:42','2016-12-15 21:56:52'),(45,3,'B-C-3712',1,2,'2016-12-08 01:58:02','2016-12-15 21:58:10'),(46,4,'B-C3699',1,2,'2016-12-08 01:58:13','2016-12-15 21:59:26'),(48,6,'B-C-572',1,2,'2016-12-08 01:58:39','2016-12-15 22:07:31'),(50,8,'B-23674A',1,4,'2016-12-08 01:59:03','2016-12-08 02:16:38'),(51,7,'B-E213',1,2,'2016-12-08 02:11:46','2016-12-15 22:08:44'),(56,5,'BJTC4102',1,1,'2016-12-09 17:05:22','2016-12-15 22:00:39'),(61,26,'B-33118A',1,1,'2016-12-15 16:12:25','2016-12-15 16:12:25'),(62,26,'B-33118A',1,2,'2016-12-15 16:12:39','2016-12-15 16:12:39'),(63,2,'B-C-3692',1,3,'2016-12-15 21:56:31','2016-12-15 21:56:31'),(64,3,'B-C-3692',1,3,'2016-12-15 21:58:37','2016-12-15 21:58:37'),(65,5,'B-24324A',1,2,'2016-12-15 22:01:00','2016-12-15 22:01:00'),(66,5,'B-E213',1,3,'2016-12-15 22:01:28','2016-12-15 22:01:28'),(75,27,'B-23674A',1,1,'2016-12-16 23:54:24','2016-12-16 23:54:24'),(76,27,'B-C-3712',1,2,'2016-12-16 23:54:35','2016-12-16 23:54:35'),(77,27,'BJTC4102',1,3,'2016-12-16 23:54:44','2016-12-16 23:54:44'),(78,28,'B-24324A',1,1,'2016-12-16 23:55:01','2016-12-16 23:55:01'),(79,28,'B-33118A',1,2,'2016-12-16 23:55:10','2016-12-16 23:55:10'),(80,28,'B-C-3692',1,3,'2016-12-16 23:55:18','2016-12-16 23:55:18');
/*!40000 ALTER TABLE `units` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-12-18 21:06:58
