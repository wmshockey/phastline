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
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `elevations`
--

LOCK TABLES `elevations` WRITE;
/*!40000 ALTER TABLE `elevations` DISABLE KEYS */;
INSERT INTO `elevations` VALUES (1,0,684.28,1,'2016-04-02 02:40:32','2016-04-02 02:40:32'),(2,48.27,792.48,1,'2016-04-02 02:40:55','2016-04-02 02:40:55'),(3,173.77,792.48,1,'2016-04-02 14:01:16','2016-04-02 14:01:16'),(4,194.69,724.81,1,'2016-04-02 14:01:40','2016-04-02 14:01:40'),(5,392.6,603.5,1,'2016-04-02 14:02:01','2016-04-02 14:02:01'),(6,466.95,548.94,1,'2016-04-02 14:02:23','2016-04-02 14:02:23'),(7,485.92,661.11,1,'2016-04-02 14:02:41','2016-04-02 14:02:41'),(8,503.62,526.39,1,'2016-04-02 14:03:01','2016-04-02 14:03:01'),(9,532.42,609.6,1,'2016-04-02 14:03:35','2016-04-02 14:03:35'),(10,566.63,580.34,1,'2016-04-02 14:03:49','2016-04-02 14:03:49'),(11,704.48,585.83,1,'2016-04-02 14:04:09','2016-04-02 14:04:09'),(12,822.2,698.6,1,'2016-04-02 14:04:21','2016-04-02 14:04:21'),(13,992.75,429.77,1,'2016-04-02 14:04:42','2016-04-02 14:04:42'),(14,1073.2,356.62,1,'2016-04-02 14:04:58','2016-04-02 14:04:58'),(15,1164.92,491.95,1,'2016-04-02 14:05:13','2016-04-02 14:05:13'),(16,1289.97,227.99,1,'2016-04-02 14:05:31','2016-04-02 14:05:31'),(17,1478.67,441.96,1,'2016-04-02 14:05:47','2016-04-02 14:05:47'),(18,1538.2,396.85,1,'2016-04-02 14:06:04','2016-04-02 14:06:04'),(19,1718.41,399.29,1,'2016-04-02 14:06:21','2016-04-02 14:06:21'),(20,1766.84,199.34,1,'2016-04-02 14:06:34','2016-04-02 14:06:34'),(21,0,684.28,6,'2016-05-30 16:52:41','2016-05-30 16:52:41'),(22,30,900,6,'2016-05-30 16:52:50','2016-12-15 16:09:54'),(23,60,700,6,'2016-05-30 16:52:57','2016-12-15 16:10:10'),(24,0,1000,7,'2016-12-03 05:34:58','2016-12-03 05:34:58'),(25,100,1200,7,'2016-12-03 05:35:06','2016-12-03 05:35:06'),(28,654.86,502.31,1,'2016-12-15 17:19:31','2016-12-15 17:19:31');
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
INSERT INTO `headpoints` VALUES (5,'1',2000,1108,'2016-12-02 02:19:25','2016-12-02 02:19:25'),(7,'1',3000,1100,'2016-12-02 02:56:53','2016-12-02 02:56:53'),(8,'1',4000,1087,'2016-12-02 13:17:00','2016-12-02 13:17:00'),(9,'1',5000,1070,'2016-12-02 13:17:13','2016-12-02 13:17:13'),(10,'1',6000,1048,'2016-12-02 13:17:58','2016-12-02 13:17:58'),(11,'1',7000,1015,'2016-12-02 13:51:18','2016-12-02 13:51:18'),(12,'1',8000,977,'2016-12-02 13:51:30','2016-12-02 13:51:30'),(13,'1',9000,920,'2016-12-02 13:51:46','2016-12-02 13:51:46'),(14,'1',9500,880,'2016-12-02 13:52:00','2016-12-03 15:19:46'),(16,'1',10000,840,'2016-12-02 14:15:22','2016-12-02 14:15:22'),(17,'1',10500,790,'2016-12-02 14:25:34','2016-12-02 14:25:34'),(18,'1',11000,715,'2016-12-02 14:25:45','2016-12-02 14:25:45'),(19,'1',11500,590,'2016-12-02 14:26:01','2016-12-02 14:26:01'),(26,'2',1750,936,'2016-12-05 18:05:44','2016-12-05 18:05:44'),(27,'2',2000,931,'2016-12-05 18:05:55','2016-12-05 18:05:55'),(28,'2',2250,924,'2016-12-05 18:06:24','2016-12-05 18:06:24'),(29,'2',2500,918,'2016-12-05 18:06:40','2016-12-05 18:06:40'),(30,'2',2750,909,'2016-12-05 18:07:03','2016-12-05 18:07:03'),(31,'2',3000,900,'2016-12-05 18:07:34','2016-12-05 18:07:34'),(32,'2',3250,889,'2016-12-05 18:10:08','2016-12-05 18:10:08'),(33,'2',3500,878,'2016-12-05 18:10:42','2016-12-05 18:10:42'),(34,'2',3750,864,'2016-12-05 18:11:06','2016-12-05 18:11:06'),(35,'2',4000,850,'2016-12-05 18:11:17','2016-12-05 18:11:17'),(36,'2',4250,834,'2016-12-05 18:11:33','2016-12-05 18:11:33'),(37,'2',4500,817,'2016-12-05 18:11:47','2016-12-05 18:11:47'),(38,'2',4750,797,'2016-12-05 18:12:11','2016-12-05 18:12:11'),(39,'2',5000,773,'2016-12-05 18:12:24','2016-12-05 18:12:24'),(40,'3',0,1380,'2016-12-15 15:52:30','2016-12-15 16:20:42'),(41,'3',1000,1370,'2016-12-15 15:52:45','2016-12-15 15:52:45'),(42,'3',2000,1360,'2016-12-15 15:52:58','2016-12-15 15:52:58'),(43,'3',3000,1352,'2016-12-15 15:53:09','2016-12-15 15:53:09'),(44,'3',4000,1350,'2016-12-15 15:53:21','2016-12-15 15:53:21'),(45,'3',5000,1340,'2016-12-15 15:53:30','2016-12-15 15:53:30'),(46,'3',6000,1330,'2016-12-15 15:53:40','2016-12-15 15:53:40'),(47,'3',7000,1305,'2016-12-15 15:53:52','2016-12-15 15:53:52'),(48,'3',8000,1270,'2016-12-15 15:54:23','2016-12-15 15:54:23'),(49,'3',9000,1225,'2016-12-15 15:54:37','2016-12-15 15:54:37'),(50,'3',10000,1170,'2016-12-15 15:57:28','2016-12-15 15:57:28'),(51,'3',10600,1130,'2016-12-15 15:57:45','2016-12-15 15:57:45'),(52,'3',11200,1080,'2016-12-15 15:58:01','2016-12-15 15:58:01'),(53,'3',11800,1035,'2016-12-15 15:58:15','2016-12-15 15:58:15'),(54,'4',0,752,'2016-12-15 16:00:04','2016-12-15 16:00:04'),(55,'4',1000,750,'2016-12-15 16:00:16','2016-12-15 16:00:16'),(56,'4',2000,748,'2016-12-15 16:00:36','2016-12-15 16:00:36'),(57,'4',3000,742,'2016-12-15 16:00:45','2016-12-15 16:00:45'),(58,'4',3900,740,'2016-12-15 16:00:58','2016-12-15 16:00:58'),(59,'4',4800,740,'2016-12-15 16:01:09','2016-12-15 16:01:09'),(60,'4',5700,730,'2016-12-15 16:01:20','2016-12-15 16:01:20'),(61,'4',6600,718,'2016-12-15 16:01:32','2016-12-15 16:01:32'),(62,'4',7500,700,'2016-12-15 16:01:44','2016-12-15 16:01:44'),(63,'4',8400,670,'2016-12-15 16:01:56','2016-12-15 16:01:56'),(64,'4',9300,632,'2016-12-15 16:02:07','2016-12-15 16:02:07'),(65,'4',10200,585,'2016-12-15 16:02:19','2016-12-15 16:02:19'),(66,'4',11100,530,'2016-12-15 16:02:31','2016-12-15 16:02:31'),(67,'4',12000,460,'2016-12-15 16:02:41','2016-12-15 16:02:41'),(68,'5',200,1794,'2016-12-15 16:04:09','2016-12-15 16:04:09'),(69,'5',600,1794,'2016-12-15 16:04:21','2016-12-15 16:04:21'),(70,'5',1000,1768,'2016-12-15 16:04:32','2016-12-15 16:04:32'),(71,'5',1400,1738,'2016-12-15 16:04:42','2016-12-15 16:04:42'),(72,'5',1800,1715,'2016-12-15 16:04:53','2016-12-15 16:04:53'),(73,'5',2200,1690,'2016-12-15 16:05:03','2016-12-15 16:05:03'),(74,'5',2600,1652,'2016-12-15 16:05:14','2016-12-15 16:05:14'),(75,'5',3000,1590,'2016-12-15 16:05:24','2016-12-15 16:05:24'),(76,'5',3400,1504,'2016-12-15 16:05:36','2016-12-15 16:05:36'),(77,'5',3800,1400,'2016-12-15 16:05:47','2016-12-15 16:05:47'),(78,'5',4200,1288,'2016-12-15 16:05:57','2016-12-15 16:05:57'),(79,'5',4600,1169,'2016-12-15 16:06:10','2016-12-15 16:06:10'),(80,'5',5000,1029,'2016-12-15 16:06:22','2016-12-15 16:06:22'),(81,'5',5275,815,'2016-12-15 16:06:33','2016-12-15 16:06:33'),(82,'6',0,1275,'2016-12-15 17:39:59','2016-12-15 17:39:59'),(83,'6',750,1265,'2016-12-15 17:40:12','2016-12-15 17:40:12'),(84,'6',1500,1260,'2016-12-15 17:40:23','2016-12-15 17:40:23'),(85,'6',2000,1260,'2016-12-15 17:40:37','2016-12-15 17:40:37'),(86,'6',2500,1260,'2016-12-15 17:40:52','2016-12-15 17:40:52'),(87,'6',3000,1260,'2016-12-15 17:41:07','2016-12-15 17:41:07'),(88,'6',3500,1250,'2016-12-15 17:41:19','2016-12-15 17:41:19'),(89,'6',4000,1235,'2016-12-15 17:41:30','2016-12-15 17:41:30'),(90,'6',4500,1220,'2016-12-15 17:41:44','2016-12-15 17:41:44'),(91,'6',5000,1200,'2016-12-15 17:41:58','2016-12-15 17:41:58'),(92,'6',5750,1145,'2016-12-15 17:42:10','2016-12-15 17:42:10'),(93,'6',6500,1080,'2016-12-15 17:42:22','2016-12-15 17:42:22'),(94,'6',7500,990,'2016-12-15 17:42:35','2016-12-15 17:42:35'),(95,'6',8500,875,'2016-12-15 17:42:47','2016-12-15 17:42:47'),(96,'7',0,290,'2016-12-15 21:22:54','2016-12-15 21:22:54'),(97,'7',750,920,'2016-12-15 21:23:20','2016-12-15 21:23:20'),(98,'7',1500,920,'2016-12-15 21:23:50','2016-12-15 21:23:50'),(99,'7',2000,920,'2016-12-15 21:24:00','2016-12-15 21:24:00'),(100,'7',2500,920,'2016-12-15 21:24:09','2016-12-15 21:24:09'),(101,'7',3000,920,'2016-12-15 21:24:17','2016-12-15 21:24:17'),(102,'7',3500,910,'2016-12-15 21:24:26','2016-12-15 21:24:26'),(103,'7',4000,895,'2016-12-15 21:24:33','2016-12-15 21:24:33'),(104,'7',4500,865,'2016-12-15 21:24:42','2016-12-15 21:24:42'),(105,'7',5000,840,'2016-12-15 21:24:50','2016-12-15 21:24:50'),(106,'7',5500,800,'2016-12-15 21:25:07','2016-12-15 21:25:07'),(107,'7',6000,765,'2016-12-15 21:25:25','2016-12-15 21:25:25'),(108,'7',6500,720,'2016-12-15 21:25:35','2016-12-15 21:25:35'),(109,'7',7000,670,'2016-12-15 21:25:44','2016-12-15 21:25:44'),(110,'8',0,990,'2016-12-15 21:30:46','2016-12-15 21:30:46'),(111,'8',1000,990,'2016-12-15 21:30:56','2016-12-15 21:30:56'),(112,'8',1500,990,'2016-12-15 21:31:10','2016-12-15 21:31:10'),(113,'8',2000,990,'2016-12-15 21:31:33','2016-12-15 21:31:33'),(114,'8',2500,984,'2016-12-15 21:31:42','2016-12-15 21:31:42'),(115,'8',3000,980,'2016-12-15 21:31:52','2016-12-15 21:31:52'),(116,'8',3500,975,'2016-12-15 21:32:02','2016-12-15 21:32:02'),(117,'8',4000,958,'2016-12-15 21:32:12','2016-12-15 21:32:12'),(118,'8',4500,925,'2016-12-15 21:32:21','2016-12-15 21:32:21'),(119,'8',5000,900,'2016-12-15 21:32:29','2016-12-15 21:32:29'),(120,'8',5500,860,'2016-12-15 21:32:38','2016-12-15 21:32:38'),(121,'8',6000,822,'2016-12-15 21:32:45','2016-12-15 21:32:45'),(122,'8',6500,767,'2016-12-15 21:32:54','2016-12-15 21:32:54'),(123,'8',7000,698,'2016-12-15 21:33:03','2016-12-15 21:33:03'),(124,'9',0,1450,'2016-12-15 21:35:36','2016-12-15 21:35:36'),(125,'9',500,1440,'2016-12-15 21:35:49','2016-12-15 21:35:49'),(126,'9',1000,1430,'2016-12-15 21:35:58','2016-12-15 21:35:58'),(127,'9',1500,1422,'2016-12-15 21:36:05','2016-12-15 21:36:05'),(128,'9',2000,1415,'2016-12-15 21:36:14','2016-12-15 21:36:14'),(129,'9',2500,1405,'2016-12-15 21:36:22','2016-12-15 21:36:22'),(130,'9',3000,1400,'2016-12-15 21:36:28','2016-12-15 21:36:28'),(131,'9',3500,1390,'2016-12-15 21:36:36','2016-12-15 21:36:36'),(132,'9',4000,1378,'2016-12-15 21:36:46','2016-12-15 21:36:46'),(133,'9',4500,1360,'2016-12-15 21:36:59','2016-12-15 21:36:59'),(134,'9',5000,1340,'2016-12-15 21:37:07','2016-12-15 21:37:07'),(135,'9',5500,1315,'2016-12-15 21:37:26','2016-12-15 21:37:26'),(136,'9',6000,1270,'2016-12-15 21:37:35','2016-12-15 21:37:35'),(137,'9',6500,1210,'2016-12-15 21:37:51','2016-12-15 21:37:51'),(138,'10',0,1900,'2016-12-15 21:41:13','2016-12-15 21:41:13'),(139,'10',500,1890,'2016-12-15 21:41:29','2016-12-15 21:41:29'),(140,'10',1000,1880,'2016-12-15 21:41:43','2016-12-15 21:41:43'),(141,'10',1500,1860,'2016-12-15 21:41:54','2016-12-15 21:41:54'),(142,'10',2000,1840,'2016-12-15 21:42:10','2016-12-15 21:42:10'),(143,'10',2500,1820,'2016-12-15 21:42:23','2016-12-15 21:42:23'),(144,'10',3000,1780,'2016-12-15 21:42:48','2016-12-15 21:42:48'),(145,'10',3500,1710,'2016-12-15 21:46:26','2016-12-15 21:46:26'),(146,'10',4000,1640,'2016-12-15 21:46:45','2016-12-15 21:46:45'),(147,'10',4500,1550,'2016-12-15 21:46:54','2016-12-15 21:46:54'),(148,'10',5000,1450,'2016-12-15 21:47:01','2016-12-15 21:47:01'),(149,'10',5500,1320,'2016-12-15 21:50:03','2016-12-15 21:50:03'),(150,'10',6000,1155,'2016-12-15 21:51:22','2016-12-15 21:51:22'),(151,'10',6500,900,'2016-12-15 21:51:38','2016-12-15 21:51:38'),(152,'11',0,1020,'2016-12-15 22:04:21','2016-12-15 22:04:21'),(153,'11',500,1020,'2016-12-15 22:04:29','2016-12-15 22:04:29'),(154,'11',1000,1020,'2016-12-15 22:04:37','2016-12-15 22:04:37'),(155,'11',1500,1020,'2016-12-15 22:04:47','2016-12-15 22:04:47'),(156,'11',2000,1015,'2016-12-15 22:04:59','2016-12-15 22:04:59'),(157,'11',2500,1005,'2016-12-15 22:05:10','2016-12-15 22:05:10'),(158,'11',3000,1000,'2016-12-15 22:05:18','2016-12-15 22:05:18'),(159,'11',3500,995,'2016-12-15 22:05:24','2016-12-15 22:05:24'),(160,'11',4000,980,'2016-12-15 22:05:46','2016-12-15 22:05:46'),(161,'11',4500,955,'2016-12-15 22:06:00','2016-12-15 22:06:00'),(162,'11',5000,930,'2016-12-15 22:06:07','2016-12-15 22:06:07'),(163,'11',5500,880,'2016-12-15 22:06:16','2016-12-15 22:06:16'),(164,'11',6000,830,'2016-12-15 22:06:26','2016-12-15 22:06:26'),(165,'11',6250,795,'2016-12-15 22:06:36','2016-12-15 22:06:36'),(166,'12',450,2150,'2016-12-15 22:11:23','2016-12-15 22:11:23'),(167,'12',800,2145,'2016-12-15 22:11:35','2016-12-15 22:11:35'),(168,'12',1150,2140,'2016-12-15 22:11:48','2016-12-15 22:11:48'),(169,'12',1500,2125,'2016-12-15 22:12:02','2016-12-15 22:12:02'),(170,'12',1850,2100,'2016-12-15 22:12:12','2016-12-15 22:12:12'),(171,'12',2200,2065,'2016-12-15 22:12:21','2016-12-15 22:12:21'),(172,'12',2550,2030,'2016-12-15 22:12:36','2016-12-15 22:12:36'),(173,'12',2900,1970,'2016-12-15 22:12:46','2016-12-15 22:12:46'),(174,'12',3250,1910,'2016-12-15 22:12:56','2016-12-15 22:12:56'),(175,'12',3600,1860,'2016-12-15 22:13:11','2016-12-15 22:13:11'),(176,'12',3950,1745,'2016-12-15 22:13:35','2016-12-15 22:13:35'),(177,'12',4300,1630,'2016-12-15 22:13:45','2016-12-15 22:13:45'),(178,'12',4650,1500,'2016-12-15 22:13:54','2016-12-15 22:13:54'),(179,'12',5000,1325,'2016-12-15 22:14:03','2016-12-15 22:14:03');
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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nominations`
--

LOCK TABLES `nominations` WRITE;
/*!40000 ALTER TABLE `nominations` DISABLE KEYS */;
INSERT INTO `nominations` VALUES (1,'2016-04','test nomination','2016-04-01',30,'2016-03-24 02:26:37','2016-03-24 02:26:37'),(2,'2016-05','May 2016 Nominations','2016-05-01',31,'2016-05-26 13:16:20','2016-05-26 13:16:20'),(3,'1WMS01','Test Nominations for 1wms01','2016-05-30',31,'2016-05-30 16:56:20','2016-05-30 16:56:20'),(4,'2016-11','Test nomination used after Nov 25th, 2016','2016-11-26',30,'2016-11-26 23:02:55','2016-11-28 02:32:51'),(5,'My Test 02 Nom','Testing entry of nomination','2016-12-03',31,'2016-12-03 05:36:12','2016-12-03 05:36:12'),(6,'Line 1 Test 2016-12','Testing against BPFLOW results','2016-12-01',31,'2016-12-15 22:33:05','2016-12-15 22:33:05'),(7,'Line 1 simple 1 nom','Test with just one nomination','2016-12-01',31,'2016-12-15 23:10:46','2016-12-15 23:11:50');
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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pipelines`
--

LOCK TABLES `pipelines` WRITE;
/*!40000 ALTER TABLE `pipelines` DISABLE KEYS */;
INSERT INTO `pipelines` VALUES (1,'Line 1','Enbridge line 01.  This is the first line used for testing the application.','2016-04-02 02:25:58','2016-04-03 15:02:45'),(6,'1WMS01','Simple Test Line - same used with BPFLOW','2016-05-30 16:50:15','2016-12-16 00:50:20'),(7,'Test02','My Test Line 02','2016-12-03 05:21:06','2016-12-03 05:21:06'),(8,'Test03','My Test Line 03','2016-12-04 23:17:20','2016-12-16 00:49:35');
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
  `simulation_id_id` int(11) DEFAULT NULL,
  `simulation_name` varchar(255) DEFAULT NULL,
  `step` int(11) DEFAULT NULL,
  `timestamp` float DEFAULT NULL,
  `kmp` float DEFAULT NULL,
  `station_id_id` int(11) DEFAULT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=152690 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `results`
--

LOCK TABLES `results` WRITE;
/*!40000 ALTER TABLE `results` DISABLE KEYS */;
INSERT INTO `results` VALUES (152594,6,'1WMS01',1,0,0,25,'S1',897.805,0,' ','41E-00002  1000.0',200,200,5431.32,5631.32,5631.32,10000,8.50623,30,-4368.68,0,1209.67,4230.16,'2016-12-16 16:25:47','2016-12-16 16:25:47','---\n- !ruby/object:Stationcurverec\n  station_id: 25\n  station_name: S1\n  flow: 0.0\n  head: 987.552\n- !ruby/object:Stationcurverec\n  station_id: 25\n  station_name: S1\n  flow: 227.1253\n  head: 983.8944\n- !ruby/object:Stationcurverec\n  station_id: 25\n  station_name: S1\n  flow: 454.2506\n  head: 980.2368\n- !ruby/object:Stationcurverec\n  station_id: 25\n  station_name: S1\n  flow: 681.3759\n  head: 973.5312\n- !ruby/object:Stationcurverec\n  station_id: 25\n  station_name: S1\n  flow: 885.78867\n  head: 968.8068000000001\n- !ruby/object:Stationcurverec\n  station_id: 25\n  station_name: S1\n  flow: 908.5012\n  head: 968.3496000000001\n- !ruby/object:Stationcurverec\n  station_id: 25\n  station_name: S1\n  flow: 1090.20144\n  head: 961.76592\n- !ruby/object:Stationcurverec\n  station_id: 25\n  station_name: S1\n  flow: 1135.6265\n  head: 959.4426666666667\n- !ruby/object:Stationcurverec\n  station_id: 25\n  station_name: S1\n  flow: 1294.61421\n  head: 950.2444800000001\n- !ruby/object:Stationcurverec\n  station_id: 25\n  station_name: S1\n  flow: 1362.7518\n  head: 946.0992\n- !ruby/object:Stationcurverec\n  station_id: 25\n  station_name: S1\n  flow: 1499.02698\n  head: 933.05376\n- !ruby/object:Stationcurverec\n  station_id: 25\n  station_name: S1\n  flow: 1589.8771\n  head: 923.544\n- !ruby/object:Stationcurverec\n  station_id: 25\n  station_name: S1\n  flow: 1703.43975\n  head: 909.3708\n- !ruby/object:Stationcurverec\n  station_id: 25\n  station_name: S1\n  flow: 1817.0024\n  head: 893.1656\n- !ruby/object:Stationcurverec\n  station_id: 25\n  station_name: S1\n  flow: 1907.85252\n  head: 876.66576\n- !ruby/object:Stationcurverec\n  station_id: 25\n  station_name: S1\n  flow: 2044.1277\n  head: 850.2904000000001\n- !ruby/object:Stationcurverec\n  station_id: 25\n  station_name: S1\n  flow: 2112.26529\n  head: 834.0852000000001\n- !ruby/object:Stationcurverec\n  station_id: 25\n  station_name: S1\n  flow: 2157.69035\n  head: 822.6721333333334\n- !ruby/object:Stationcurverec\n  station_id: 25\n  station_name: S1\n  flow: 2271.253\n  head: 794.1394666666667\n- !ruby/object:Stationcurverec\n  station_id: 25\n  station_name: S1\n  flow: 2316.67806\n  head: 780.796\n- !ruby/object:Stationcurverec\n  station_id: 25\n  station_name: S1\n  flow: 2384.81565\n  head: 759.9680000000001\n- !ruby/object:Stationcurverec\n  station_id: 25\n  station_name: S1\n  flow: 2407.5281800000002\n  head: 751.5013333333334\n- !ruby/object:Stationcurverec\n  station_id: 25\n  station_name: S1\n  flow: 2498.3783\n  head: 715.6026666666669\n- !ruby/object:Stationcurverec\n  station_id: 25\n  station_name: S1\n  flow: 2521.09083\n  head: 703.5799999999999\n- !ruby/object:Stationcurverec\n  station_id: 25\n  station_name: S1\n  flow: 2543.80336\n  head: 691.0493333333335\n- !ruby/object:Stationcurverec\n  station_id: 25\n  station_name: S1\n  flow: 2611.94095\n  head: 654.2193333333333\n- !ruby/object:Stationcurverec\n  station_id: 25\n  station_name: S1\n  flow: 2680.07854\n  head: 460.4173333333333\n- !ruby/object:Stationcurverec\n  station_id: 25\n  station_name: S1\n  flow: 2725.5036\n  head: 140.208\n','---\n- !ruby/object:Batchrec\n  batch_number: 1\n  commodity_id: 41E\n  volume: 10000.0\n  start_location: S1\n  end_location: S3\n  shipper: IOL\n  shipment_number: 1\n  batch_id: 41E-00001\n- !ruby/object:Batchrec\n  batch_number: 2\n  commodity_id: 41E\n  volume: 10000.0\n  start_location: S1\n  end_location: S3\n  shipper: IOL\n  shipment_number: 1\n  batch_id: 41E-00002\n- !ruby/object:Batchrec\n  batch_number: 3\n  commodity_id: 41E\n  volume: 10000.0\n  start_location: S1\n  end_location: S3\n  shipper: IOL\n  shipment_number: 1\n  batch_id: 41E-00003\n- !ruby/object:Batchrec\n  batch_number: 4\n  commodity_id: 41E\n  volume: 10000.0\n  start_location: S1\n  end_location: S3\n  shipper: IOL\n  shipment_number: 1\n  batch_id: 41E-00004\n- !ruby/object:Batchrec\n  batch_number: 5\n  commodity_id: 41E\n  volume: 10000.0\n  start_location: S1\n  end_location: S3\n  shipper: IOL\n  shipment_number: 1\n  batch_id: 41E-00005\n- !ruby/object:Batchrec\n  batch_number: 6\n  commodity_id: 41E\n  volume: 10000.0\n  start_location: S1\n  end_location: S3\n  shipper: IOL\n  shipment_number: 1\n  batch_id: 41E-00006\n- !ruby/object:Batchrec\n  batch_number: 7\n  commodity_id: 41E\n  volume: 10000.0\n  start_location: S1\n  end_location: S3\n  shipper: IOL\n  shipment_number: 1\n  batch_id: 41E-00007\n- !ruby/object:Batchrec\n  batch_number: 8\n  commodity_id: 41E\n  volume: 10000.0\n  start_location: S1\n  end_location: S3\n  shipper: IOL\n  shipment_number: 1\n  batch_id: 41E-00008\n- !ruby/object:Batchrec\n  batch_number: 9\n  commodity_id: 41E\n  volume: 10000.0\n  start_location: S1\n  end_location: S3\n  shipper: IOL\n  shipment_number: 1\n  batch_id: 41E-00009\n- !ruby/object:Batchrec\n  batch_number: 10\n  commodity_id: 41E\n  volume: 10000.0\n  start_location: S1\n  end_location: S3\n  shipper: IOL\n  shipment_number: 1\n  batch_id: 41E-00010\n',1354.52,1.09329),(152595,6,'1WMS01',1,0,30,26,'S2',897.805,0,'41E-00001  981.56','41E-00001  9018.44',191.494,191.494,4639.4,4830.89,4830.89,10000,-1522.25,60,-5169.11,30,-1121.52,4230.16,'2016-12-16 16:25:47','2016-12-16 16:25:47','---\n- !ruby/object:Stationcurverec\n  station_id: 26\n  station_name: S2\n  flow: 45.42506\n  head: 1093.6224\n- !ruby/object:Stationcurverec\n  station_id: 26\n  station_name: S2\n  flow: 136.27518\n  head: 1093.6224\n- !ruby/object:Stationcurverec\n  station_id: 26\n  station_name: S2\n  flow: 227.1253\n  head: 1077.7728\n- !ruby/object:Stationcurverec\n  station_id: 26\n  station_name: S2\n  flow: 317.97542\n  head: 1059.4848\n- !ruby/object:Stationcurverec\n  station_id: 26\n  station_name: S2\n  flow: 408.82554\n  head: 1045.464\n- !ruby/object:Stationcurverec\n  station_id: 26\n  station_name: S2\n  flow: 499.67566\n  head: 1030.2240000000002\n- !ruby/object:Stationcurverec\n  station_id: 26\n  station_name: S2\n  flow: 590.52578\n  head: 1007.0592\n- !ruby/object:Stationcurverec\n  station_id: 26\n  station_name: S2\n  flow: 681.3759\n  head: 969.264\n- !ruby/object:Stationcurverec\n  station_id: 26\n  station_name: S2\n  flow: 772.2260200000001\n  head: 916.8384000000001\n- !ruby/object:Stationcurverec\n  station_id: 26\n  station_name: S2\n  flow: 863.07614\n  head: 853.44\n- !ruby/object:Stationcurverec\n  station_id: 26\n  station_name: S2\n  flow: 953.92626\n  head: 785.1648\n- !ruby/object:Stationcurverec\n  station_id: 26\n  station_name: S2\n  flow: 1044.77638\n  head: 712.6224000000001\n- !ruby/object:Stationcurverec\n  station_id: 26\n  station_name: S2\n  flow: 1135.6265\n  head: 627.2784\n- !ruby/object:Stationcurverec\n  station_id: 26\n  station_name: S2\n  flow: 1198.0859575\n  head: 496.824\n','---\n- !ruby/object:Batchrec\n  batch_number: 1\n  commodity_id: 41E\n  volume: 10000.0\n  start_location: S1\n  end_location: S3\n  shipper: IOL\n  shipment_number: 1\n  batch_id: 41E-00001\n- !ruby/object:Batchrec\n  batch_number: 2\n  commodity_id: 41E\n  volume: 10000.0\n  start_location: S1\n  end_location: S3\n  shipper: IOL\n  shipment_number: 1\n  batch_id: 41E-00002\n- !ruby/object:Batchrec\n  batch_number: 3\n  commodity_id: 41E\n  volume: 10000.0\n  start_location: S1\n  end_location: S3\n  shipper: IOL\n  shipment_number: 1\n  batch_id: 41E-00003\n- !ruby/object:Batchrec\n  batch_number: 4\n  commodity_id: 41E\n  volume: 10000.0\n  start_location: S1\n  end_location: S3\n  shipper: IOL\n  shipment_number: 1\n  batch_id: 41E-00004\n- !ruby/object:Batchrec\n  batch_number: 5\n  commodity_id: 41E\n  volume: 10000.0\n  start_location: S1\n  end_location: S3\n  shipper: IOL\n  shipment_number: 1\n  batch_id: 41E-00005\n- !ruby/object:Batchrec\n  batch_number: 6\n  commodity_id: 41E\n  volume: 10000.0\n  start_location: S1\n  end_location: S3\n  shipper: IOL\n  shipment_number: 1\n  batch_id: 41E-00006\n- !ruby/object:Batchrec\n  batch_number: 7\n  commodity_id: 41E\n  volume: 10000.0\n  start_location: S1\n  end_location: S3\n  shipper: IOL\n  shipment_number: 1\n  batch_id: 41E-00007\n- !ruby/object:Batchrec\n  batch_number: 8\n  commodity_id: 41E\n  volume: 10000.0\n  start_location: S1\n  end_location: S3\n  shipper: IOL\n  shipment_number: 1\n  batch_id: 41E-00008\n- !ruby/object:Batchrec\n  batch_number: 9\n  commodity_id: 41E\n  volume: 10000.0\n  start_location: S1\n  end_location: S3\n  shipper: IOL\n  shipment_number: 1\n  batch_id: 41E-00009\n- !ruby/object:Batchrec\n  batch_number: 10\n  commodity_id: 41E\n  volume: 10000.0\n  start_location: S1\n  end_location: S3\n  shipper: IOL\n  shipment_number: 1\n  batch_id: 41E-00010\n',1157.02,1.09329),(152596,6,'1WMS01',1,0,60,19,'S3',897.805,0,'41E-00001  2963.12',NULL,1722.25,0,0,0,0,NULL,0,0,0,0,0,0,'2016-12-16 16:25:47','2016-12-16 16:25:47','--- []\n',NULL,0,1.09329),(152597,6,'1WMS01',2,1.09329,0,25,'S1',897.805,981.56,' ','41E-00002  1981.56',200,200,5431.32,5631.32,5631.32,10000,8.50623,30,-4368.68,0,1209.67,4230.16,'2016-12-16 16:25:47','2016-12-16 16:25:47',NULL,NULL,1354.52,2.20712),(152598,6,'1WMS01',2,1.09329,30,26,'S2',897.805,981.56,'41E-00002  10000.0','41E-00001  10000.0',191.494,191.494,4639.4,4830.89,4830.89,10000,-1522.25,60,-5169.11,30,-1121.52,4230.16,'2016-12-16 16:25:47','2016-12-16 16:25:47',NULL,NULL,1157.02,2.20712),(152599,6,'1WMS01',2,1.09329,60,19,'S3',897.805,0,'41E-00001  1981.56',NULL,1722.25,0,0,0,0,NULL,0,0,0,0,0,0,'2016-12-16 16:25:47','2016-12-16 16:25:47',NULL,NULL,0,2.20712),(152600,6,'1WMS01',3,3.3004,0,25,'S1',897.805,2963.12,' ','41E-00002  3963.12',200,200,5431.32,5631.32,5631.32,10000,8.50623,30,-4368.68,0,1209.67,4230.16,'2016-12-16 16:25:47','2016-12-16 16:25:47',NULL,NULL,1354.52,6.72404),(152601,6,'1WMS01',3,3.3004,30,26,'S2',897.805,2963.12,'41E-00002  8018.44','41E-00002  1981.56',191.494,191.494,4639.4,4830.89,4830.89,10000,-1522.25,60,-5169.11,30,-1121.52,4230.16,'2016-12-16 16:25:47','2016-12-16 16:25:47',NULL,NULL,1157.02,6.72404),(152602,6,'1WMS01',3,3.3004,60,19,'S3',897.805,0,'41E-00002  10000.0',NULL,1722.25,0,0,0,0,NULL,0,0,0,0,0,0,'2016-12-16 16:25:47','2016-12-16 16:25:47',NULL,NULL,0,6.72404),(152603,6,'1WMS01',4,10.0244,0,25,'S1',897.805,9000,' ','41E-00002  10000.0',200,200,5431.32,5631.32,5631.32,10000,8.50623,30,-4368.68,0,1209.67,4230.16,'2016-12-16 16:25:47','2016-12-16 16:25:47',NULL,NULL,1354.52,2.20712),(152604,6,'1WMS01',4,10.0244,30,26,'S2',897.805,9000,'41E-00002  1981.56','41E-00002  8018.44',191.494,191.494,4639.4,4830.89,4830.89,10000,-1522.25,60,-5169.11,30,-1121.52,4230.16,'2016-12-16 16:25:47','2016-12-16 16:25:47',NULL,NULL,1157.02,2.20712),(152605,6,'1WMS01',4,10.0244,60,19,'S3',897.805,0,'41E-00002  3963.12',NULL,1722.25,0,0,0,0,NULL,0,0,0,0,0,0,'2016-12-16 16:25:47','2016-12-16 16:25:47',NULL,NULL,0,2.20712),(152606,6,'1WMS01',5,12.2316,0,25,'S1',897.805,10981.6,' ','41E-00003  1981.56',200,200,5431.32,5631.32,5631.32,10000,8.50623,30,-4368.68,0,1209.67,4230.16,'2016-12-16 16:25:47','2016-12-16 16:25:47',NULL,NULL,1354.52,2.20712),(152607,6,'1WMS01',5,12.2316,30,26,'S2',897.805,10981.6,'41E-00003  10000.0','41E-00002  10000.0',191.494,191.494,4639.4,4830.89,4830.89,10000,-1522.25,60,-5169.11,30,-1121.52,4230.16,'2016-12-16 16:25:47','2016-12-16 16:25:47',NULL,NULL,1157.02,2.20712),(152608,6,'1WMS01',5,12.2316,60,19,'S3',897.805,0,'41E-00002  1981.56',NULL,1722.25,0,0,0,0,NULL,0,0,0,0,0,0,'2016-12-16 16:25:47','2016-12-16 16:25:47',NULL,NULL,0,2.20712),(152609,6,'1WMS01',6,14.4387,0,25,'S1',897.805,12963.1,' ','41E-00003  3963.12',200,200,5431.32,5631.32,5631.32,10000,8.50623,30,-4368.68,0,1209.67,4230.16,'2016-12-16 16:25:47','2016-12-16 16:25:47',NULL,NULL,1354.52,6.72404),(152610,6,'1WMS01',6,14.4387,30,26,'S2',897.805,12963.1,'41E-00003  8018.44','41E-00003  1981.56',191.494,191.494,4639.4,4830.89,4830.89,10000,-1522.25,60,-5169.11,30,-1121.52,4230.16,'2016-12-16 16:25:47','2016-12-16 16:25:47',NULL,NULL,1157.02,6.72404),(152611,6,'1WMS01',6,14.4387,60,19,'S3',897.805,0,'41E-00003  10000.0',NULL,1722.25,0,0,0,0,NULL,0,0,0,0,0,0,'2016-12-16 16:25:47','2016-12-16 16:25:47',NULL,NULL,0,6.72404),(152612,6,'1WMS01',7,21.1627,0,25,'S1',897.805,19000,' ','41E-00003  10000.0',200,200,5431.32,5631.32,5631.32,10000,8.50623,30,-4368.68,0,1209.67,4230.16,'2016-12-16 16:25:47','2016-12-16 16:25:47',NULL,NULL,1354.52,2.20712),(152613,6,'1WMS01',7,21.1627,30,26,'S2',897.805,19000,'41E-00003  1981.56','41E-00003  8018.44',191.494,191.494,4639.4,4830.89,4830.89,10000,-1522.25,60,-5169.11,30,-1121.52,4230.16,'2016-12-16 16:25:47','2016-12-16 16:25:47',NULL,NULL,1157.02,2.20712),(152614,6,'1WMS01',7,21.1627,60,19,'S3',897.805,0,'41E-00003  3963.12',NULL,1722.25,0,0,0,0,NULL,0,0,0,0,0,0,'2016-12-16 16:25:47','2016-12-16 16:25:47',NULL,NULL,0,2.20712),(152615,6,'1WMS01',8,23.3698,0,25,'S1',897.805,20981.6,' ','41E-00004  1981.56',200,200,5431.32,5631.32,5631.32,10000,8.50623,30,-4368.68,0,1209.67,4230.16,'2016-12-16 16:25:47','2016-12-16 16:25:47',NULL,NULL,1354.52,2.20712),(152616,6,'1WMS01',8,23.3698,30,26,'S2',897.805,20981.6,'41E-00004  10000.0','41E-00003  10000.0',191.494,191.494,4639.4,4830.89,4830.89,10000,-1522.25,60,-5169.11,30,-1121.52,4230.16,'2016-12-16 16:25:47','2016-12-16 16:25:47',NULL,NULL,1157.02,2.20712),(152617,6,'1WMS01',8,23.3698,60,19,'S3',897.805,0,'41E-00003  1981.56',NULL,1722.25,0,0,0,0,NULL,0,0,0,0,0,0,'2016-12-16 16:25:47','2016-12-16 16:25:47',NULL,NULL,0,2.20712),(152618,6,'1WMS01',9,25.577,0,25,'S1',897.805,22963.1,' ','41E-00004  3963.12',200,200,5431.32,5631.32,5631.32,10000,8.50623,30,-4368.68,0,1209.67,4230.16,'2016-12-16 16:25:47','2016-12-16 16:25:47',NULL,NULL,1354.52,6.72404),(152619,6,'1WMS01',9,25.577,30,26,'S2',897.805,22963.1,'41E-00004  8018.44','41E-00004  1981.56',191.494,191.494,4639.4,4830.89,4830.89,10000,-1522.25,60,-5169.11,30,-1121.52,4230.16,'2016-12-16 16:25:47','2016-12-16 16:25:47',NULL,NULL,1157.02,6.72404),(152620,6,'1WMS01',9,25.577,60,19,'S3',897.805,0,'41E-00004  10000.0',NULL,1722.25,0,0,0,0,NULL,0,0,0,0,0,0,'2016-12-16 16:25:47','2016-12-16 16:25:47',NULL,NULL,0,6.72404),(152621,6,'1WMS01',10,32.301,0,25,'S1',897.805,29000,' ','41E-00004  10000.0',200,200,5431.32,5631.32,5631.32,10000,8.50623,30,-4368.68,0,1209.67,4230.16,'2016-12-16 16:25:47','2016-12-16 16:25:47',NULL,NULL,1354.52,2.20712),(152622,6,'1WMS01',10,32.301,30,26,'S2',897.805,29000,'41E-00004  1981.56','41E-00004  8018.44',191.494,191.494,4639.4,4830.89,4830.89,10000,-1522.25,60,-5169.11,30,-1121.52,4230.16,'2016-12-16 16:25:47','2016-12-16 16:25:47',NULL,NULL,1157.02,2.20712),(152623,6,'1WMS01',10,32.301,60,19,'S3',897.805,0,'41E-00004  3963.12',NULL,1722.25,0,0,0,0,NULL,0,0,0,0,0,0,'2016-12-16 16:25:47','2016-12-16 16:25:47',NULL,NULL,0,2.20712),(152624,6,'1WMS01',11,34.5081,0,25,'S1',897.805,30981.6,' ','41E-00005  1981.56',200,200,5431.32,5631.32,5631.32,10000,8.50623,30,-4368.68,0,1209.67,4230.16,'2016-12-16 16:25:47','2016-12-16 16:25:47',NULL,NULL,1354.52,2.20712),(152625,6,'1WMS01',11,34.5081,30,26,'S2',897.805,30981.6,'41E-00005  10000.0','41E-00004  10000.0',191.494,191.494,4639.4,4830.89,4830.89,10000,-1522.25,60,-5169.11,30,-1121.52,4230.16,'2016-12-16 16:25:47','2016-12-16 16:25:47',NULL,NULL,1157.02,2.20712),(152626,6,'1WMS01',11,34.5081,60,19,'S3',897.805,0,'41E-00004  1981.56',NULL,1722.25,0,0,0,0,NULL,0,0,0,0,0,0,'2016-12-16 16:25:47','2016-12-16 16:25:47',NULL,NULL,0,2.20712),(152627,6,'1WMS01',12,36.7152,0,25,'S1',897.805,32963.1,' ','41E-00005  3963.12',200,200,5431.32,5631.32,5631.32,10000,8.50623,30,-4368.68,0,1209.67,4230.16,'2016-12-16 16:25:47','2016-12-16 16:25:47',NULL,NULL,1354.52,6.72404),(152628,6,'1WMS01',12,36.7152,30,26,'S2',897.805,32963.1,'41E-00005  8018.44','41E-00005  1981.56',191.494,191.494,4639.4,4830.89,4830.89,10000,-1522.25,60,-5169.11,30,-1121.52,4230.16,'2016-12-16 16:25:47','2016-12-16 16:25:47',NULL,NULL,1157.02,6.72404),(152629,6,'1WMS01',12,36.7152,60,19,'S3',897.805,0,'41E-00005  10000.0',NULL,1722.25,0,0,0,0,NULL,0,0,0,0,0,0,'2016-12-16 16:25:47','2016-12-16 16:25:47',NULL,NULL,0,6.72404),(152630,6,'1WMS01',13,43.4393,0,25,'S1',897.805,39000,' ','41E-00005  10000.0',200,200,5431.32,5631.32,5631.32,10000,8.50623,30,-4368.68,0,1209.67,4230.16,'2016-12-16 16:25:47','2016-12-16 16:25:47',NULL,NULL,1354.52,2.20712),(152631,6,'1WMS01',13,43.4393,30,26,'S2',897.805,39000,'41E-00005  1981.56','41E-00005  8018.44',191.494,191.494,4639.4,4830.89,4830.89,10000,-1522.25,60,-5169.11,30,-1121.52,4230.16,'2016-12-16 16:25:47','2016-12-16 16:25:47',NULL,NULL,1157.02,2.20712),(152632,6,'1WMS01',13,43.4393,60,19,'S3',897.805,0,'41E-00005  3963.12',NULL,1722.25,0,0,0,0,NULL,0,0,0,0,0,0,'2016-12-16 16:25:47','2016-12-16 16:25:47',NULL,NULL,0,2.20712),(152633,6,'1WMS01',14,45.6464,0,25,'S1',897.805,40981.6,' ','41E-00006  1981.56',200,200,5431.32,5631.32,5631.32,10000,8.50623,30,-4368.68,0,1209.67,4230.16,'2016-12-16 16:25:47','2016-12-16 16:25:47',NULL,NULL,1354.52,2.20712),(152634,6,'1WMS01',14,45.6464,30,26,'S2',897.805,40981.6,'41E-00006  10000.0','41E-00005  10000.0',191.494,191.494,4639.4,4830.89,4830.89,10000,-1522.25,60,-5169.11,30,-1121.52,4230.16,'2016-12-16 16:25:47','2016-12-16 16:25:47',NULL,NULL,1157.02,2.20712),(152635,6,'1WMS01',14,45.6464,60,19,'S3',897.805,0,'41E-00005  1981.56',NULL,1722.25,0,0,0,0,NULL,0,0,0,0,0,0,'2016-12-16 16:25:47','2016-12-16 16:25:47',NULL,NULL,0,2.20712),(152636,6,'1WMS01',15,47.8535,0,25,'S1',897.805,42963.1,' ','41E-00006  3963.12',200,200,5431.32,5631.32,5631.32,10000,8.50623,30,-4368.68,0,1209.67,4230.16,'2016-12-16 16:25:47','2016-12-16 16:25:47',NULL,NULL,1354.52,6.72404),(152637,6,'1WMS01',15,47.8535,30,26,'S2',897.805,42963.1,'41E-00006  8018.44','41E-00006  1981.56',191.494,191.494,4639.4,4830.89,4830.89,10000,-1522.25,60,-5169.11,30,-1121.52,4230.16,'2016-12-16 16:25:47','2016-12-16 16:25:47',NULL,NULL,1157.02,6.72404),(152638,6,'1WMS01',15,47.8535,60,19,'S3',897.805,0,'41E-00006  10000.0',NULL,1722.25,0,0,0,0,NULL,0,0,0,0,0,0,'2016-12-16 16:25:47','2016-12-16 16:25:47',NULL,NULL,0,6.72404),(152639,6,'1WMS01',16,54.5775,0,25,'S1',897.805,49000,' ','41E-00006  10000.0',200,200,5431.32,5631.32,5631.32,10000,8.50623,30,-4368.68,0,1209.67,4230.16,'2016-12-16 16:25:47','2016-12-16 16:25:47',NULL,NULL,1354.52,2.20712),(152640,6,'1WMS01',16,54.5775,30,26,'S2',897.805,49000,'41E-00006  1981.56','41E-00006  8018.44',191.494,191.494,4639.4,4830.89,4830.89,10000,-1522.25,60,-5169.11,30,-1121.52,4230.16,'2016-12-16 16:25:47','2016-12-16 16:25:47',NULL,NULL,1157.02,2.20712),(152641,6,'1WMS01',16,54.5775,60,19,'S3',897.805,0,'41E-00006  3963.12',NULL,1722.25,0,0,0,0,NULL,0,0,0,0,0,0,'2016-12-16 16:25:47','2016-12-16 16:25:47',NULL,NULL,0,2.20712),(152642,6,'1WMS01',17,56.7847,0,25,'S1',897.805,50981.6,' ','41E-00007  1981.56',200,200,5431.32,5631.32,5631.32,10000,8.50623,30,-4368.68,0,1209.67,4230.16,'2016-12-16 16:25:47','2016-12-16 16:25:47',NULL,NULL,1354.52,2.20712),(152643,6,'1WMS01',17,56.7847,30,26,'S2',897.805,50981.6,'41E-00007  10000.0','41E-00006  10000.0',191.494,191.494,4639.4,4830.89,4830.89,10000,-1522.25,60,-5169.11,30,-1121.52,4230.16,'2016-12-16 16:25:47','2016-12-16 16:25:47',NULL,NULL,1157.02,2.20712),(152644,6,'1WMS01',17,56.7847,60,19,'S3',897.805,0,'41E-00006  1981.56',NULL,1722.25,0,0,0,0,NULL,0,0,0,0,0,0,'2016-12-16 16:25:47','2016-12-16 16:25:47',NULL,NULL,0,2.20712),(152645,6,'1WMS01',18,58.9918,0,25,'S1',897.805,52963.1,' ','41E-00007  3963.12',200,200,5431.32,5631.32,5631.32,10000,8.50623,30,-4368.68,0,1209.67,4230.16,'2016-12-16 16:25:47','2016-12-16 16:25:47',NULL,NULL,1354.52,6.72404),(152646,6,'1WMS01',18,58.9918,30,26,'S2',897.805,52963.1,'41E-00007  8018.44','41E-00007  1981.56',191.494,191.494,4639.4,4830.89,4830.89,10000,-1522.25,60,-5169.11,30,-1121.52,4230.16,'2016-12-16 16:25:47','2016-12-16 16:25:47',NULL,NULL,1157.02,6.72404),(152647,6,'1WMS01',18,58.9918,60,19,'S3',897.805,0,'41E-00007  10000.0',NULL,1722.25,0,0,0,0,NULL,0,0,0,0,0,0,'2016-12-16 16:25:47','2016-12-16 16:25:47',NULL,NULL,0,6.72404),(152648,6,'1WMS01',19,65.7158,0,25,'S1',897.805,59000,' ','41E-00007  10000.0',200,200,5431.32,5631.32,5631.32,10000,8.50623,30,-4368.68,0,1209.67,4230.16,'2016-12-16 16:25:47','2016-12-16 16:25:47',NULL,NULL,1354.52,2.20712),(152649,6,'1WMS01',19,65.7158,30,26,'S2',897.805,59000,'41E-00007  1981.56','41E-00007  8018.44',191.494,191.494,4639.4,4830.89,4830.89,10000,-1522.25,60,-5169.11,30,-1121.52,4230.16,'2016-12-16 16:25:47','2016-12-16 16:25:47',NULL,NULL,1157.02,2.20712),(152650,6,'1WMS01',19,65.7158,60,19,'S3',897.805,0,'41E-00007  3963.12',NULL,1722.25,0,0,0,0,NULL,0,0,0,0,0,0,'2016-12-16 16:25:47','2016-12-16 16:25:47',NULL,NULL,0,2.20712),(152651,6,'1WMS01',20,67.9229,0,25,'S1',897.805,60981.6,' ','41E-00008  1981.56',200,200,5431.32,5631.32,5631.32,10000,8.50623,30,-4368.68,0,1209.67,4230.16,'2016-12-16 16:25:47','2016-12-16 16:25:47',NULL,NULL,1354.52,2.20712),(152652,6,'1WMS01',20,67.9229,30,26,'S2',897.805,60981.6,'41E-00008  10000.0','41E-00007  10000.0',191.494,191.494,4639.4,4830.89,4830.89,10000,-1522.25,60,-5169.11,30,-1121.52,4230.16,'2016-12-16 16:25:47','2016-12-16 16:25:47',NULL,NULL,1157.02,2.20712),(152653,6,'1WMS01',20,67.9229,60,19,'S3',897.805,0,'41E-00007  1981.56',NULL,1722.25,0,0,0,0,NULL,0,0,0,0,0,0,'2016-12-16 16:25:47','2016-12-16 16:25:47',NULL,NULL,0,2.20712),(152654,6,'1WMS01',21,70.1301,0,25,'S1',897.805,62963.1,' ','41E-00008  3963.12',200,200,5431.32,5631.32,5631.32,10000,8.50623,30,-4368.68,0,1209.67,4230.16,'2016-12-16 16:25:47','2016-12-16 16:25:47',NULL,NULL,1354.52,6.72404),(152655,6,'1WMS01',21,70.1301,30,26,'S2',897.805,62963.1,'41E-00008  8018.44','41E-00008  1981.56',191.494,191.494,4639.4,4830.89,4830.89,10000,-1522.25,60,-5169.11,30,-1121.52,4230.16,'2016-12-16 16:25:47','2016-12-16 16:25:47',NULL,NULL,1157.02,6.72404),(152656,6,'1WMS01',21,70.1301,60,19,'S3',897.805,0,'41E-00008  10000.0',NULL,1722.25,0,0,0,0,NULL,0,0,0,0,0,0,'2016-12-16 16:25:47','2016-12-16 16:25:47',NULL,NULL,0,6.72404),(152657,6,'1WMS01',22,76.8541,0,25,'S1',897.805,69000,' ','41E-00008  10000.0',200,200,5431.32,5631.32,5631.32,10000,8.50623,30,-4368.68,0,1209.67,4230.16,'2016-12-16 16:25:47','2016-12-16 16:25:47',NULL,NULL,1354.52,2.20712),(152658,6,'1WMS01',22,76.8541,30,26,'S2',897.805,69000,'41E-00008  1981.56','41E-00008  8018.44',191.494,191.494,4639.4,4830.89,4830.89,10000,-1522.25,60,-5169.11,30,-1121.52,4230.16,'2016-12-16 16:25:47','2016-12-16 16:25:47',NULL,NULL,1157.02,2.20712),(152659,6,'1WMS01',22,76.8541,60,19,'S3',897.805,0,'41E-00008  3963.12',NULL,1722.25,0,0,0,0,NULL,0,0,0,0,0,0,'2016-12-16 16:25:48','2016-12-16 16:25:48',NULL,NULL,0,2.20712),(152660,6,'1WMS01',23,79.0612,0,25,'S1',897.805,70981.6,' ','41E-00009  1981.56',200,200,5431.32,5631.32,5631.32,10000,8.50623,30,-4368.68,0,1209.67,4230.16,'2016-12-16 16:25:48','2016-12-16 16:25:48',NULL,NULL,1354.52,2.20712),(152661,6,'1WMS01',23,79.0612,30,26,'S2',897.805,70981.6,'41E-00009  10000.0','41E-00008  10000.0',191.494,191.494,4639.4,4830.89,4830.89,10000,-1522.25,60,-5169.11,30,-1121.52,4230.16,'2016-12-16 16:25:48','2016-12-16 16:25:48',NULL,NULL,1157.02,2.20712),(152662,6,'1WMS01',23,79.0612,60,19,'S3',897.805,0,'41E-00008  1981.56',NULL,1722.25,0,0,0,0,NULL,0,0,0,0,0,0,'2016-12-16 16:25:48','2016-12-16 16:25:48',NULL,NULL,0,2.20712),(152663,6,'1WMS01',24,81.2683,0,25,'S1',897.805,72963.1,' ','41E-00009  3963.12',200,200,5431.32,5631.32,5631.32,10000,8.50623,30,-4368.68,0,1209.67,4230.16,'2016-12-16 16:25:48','2016-12-16 16:25:48',NULL,NULL,1354.52,6.72404),(152664,6,'1WMS01',24,81.2683,30,26,'S2',897.805,72963.1,'41E-00009  8018.44','41E-00009  1981.56',191.494,191.494,4639.4,4830.89,4830.89,10000,-1522.25,60,-5169.11,30,-1121.52,4230.16,'2016-12-16 16:25:48','2016-12-16 16:25:48',NULL,NULL,1157.02,6.72404),(152665,6,'1WMS01',24,81.2683,60,19,'S3',897.805,0,'41E-00009  10000.0',NULL,1722.25,0,0,0,0,NULL,0,0,0,0,0,0,'2016-12-16 16:25:48','2016-12-16 16:25:48',NULL,NULL,0,6.72404),(152666,6,'1WMS01',25,87.9924,0,25,'S1',897.805,79000,' ','41E-00009  10000.0',200,200,5431.32,5631.32,5631.32,10000,8.50623,30,-4368.68,0,1209.67,4230.16,'2016-12-16 16:25:48','2016-12-16 16:25:48',NULL,NULL,1354.52,2.20712),(152667,6,'1WMS01',25,87.9924,30,26,'S2',897.805,79000,'41E-00009  1981.56','41E-00009  8018.44',191.494,191.494,4639.4,4830.89,4830.89,10000,-1522.25,60,-5169.11,30,-1121.52,4230.16,'2016-12-16 16:25:48','2016-12-16 16:25:48',NULL,NULL,1157.02,2.20712),(152668,6,'1WMS01',25,87.9924,60,19,'S3',897.805,0,'41E-00009  3963.12',NULL,1722.25,0,0,0,0,NULL,0,0,0,0,0,0,'2016-12-16 16:25:48','2016-12-16 16:25:48',NULL,NULL,0,2.20712),(152669,6,'1WMS01',26,90.1995,0,25,'S1',897.805,80981.6,' ','41E-00010  1981.56',200,200,5431.32,5631.32,5631.32,10000,8.50623,30,-4368.68,0,1209.67,4230.16,'2016-12-16 16:25:48','2016-12-16 16:25:48',NULL,NULL,1354.52,2.20712),(152670,6,'1WMS01',26,90.1995,30,26,'S2',897.805,80981.6,'41E-00010  10000.0','41E-00009  10000.0',191.494,191.494,4639.4,4830.89,4830.89,10000,-1522.25,60,-5169.11,30,-1121.52,4230.16,'2016-12-16 16:25:48','2016-12-16 16:25:48',NULL,NULL,1157.02,2.20712),(152671,6,'1WMS01',26,90.1995,60,19,'S3',897.805,0,'41E-00009  1981.56',NULL,1722.25,0,0,0,0,NULL,0,0,0,0,0,0,'2016-12-16 16:25:48','2016-12-16 16:25:48',NULL,NULL,0,2.20712),(152672,6,'1WMS01',27,92.4066,0,25,'S1',897.805,82963.1,' ','41E-00010  3963.12',200,200,5431.32,5631.32,5631.32,10000,8.50623,30,-4368.68,0,1209.67,4230.16,'2016-12-16 16:25:48','2016-12-16 16:25:48',NULL,NULL,1354.52,6.72404),(152673,6,'1WMS01',27,92.4066,30,26,'S2',897.805,82963.1,'41E-00010  8018.44','41E-00010  1981.56',191.494,191.494,4639.4,4830.89,4830.89,10000,-1522.25,60,-5169.11,30,-1121.52,4230.16,'2016-12-16 16:25:48','2016-12-16 16:25:48',NULL,NULL,1157.02,6.72404),(152674,6,'1WMS01',27,92.4066,60,19,'S3',897.805,0,'41E-00010  10000.0',NULL,1722.25,0,0,0,0,NULL,0,0,0,0,0,0,'2016-12-16 16:25:48','2016-12-16 16:25:48',NULL,NULL,0,6.72404),(152675,6,'1WMS01',28,99.1307,0,25,'S1',897.805,89000,' ','41E-00010  10000.0',200,200,5431.32,5631.32,5631.32,10000,8.50623,30,-4368.68,0,1209.67,4230.16,'2016-12-16 16:25:48','2016-12-16 16:25:48',NULL,NULL,1354.52,2.20712),(152676,6,'1WMS01',28,99.1307,30,26,'S2',897.805,89000,'41E-00010  1981.56','41E-00010  8018.44',191.494,191.494,4639.4,4830.89,4830.89,10000,-1522.25,60,-5169.11,30,-1121.52,4230.16,'2016-12-16 16:25:48','2016-12-16 16:25:48',NULL,NULL,1157.02,2.20712),(152677,6,'1WMS01',28,99.1307,60,19,'S3',897.805,0,'41E-00010  3963.12',NULL,1722.25,0,0,0,0,NULL,0,0,0,0,0,0,'2016-12-16 16:25:48','2016-12-16 16:25:48',NULL,NULL,0,2.20712),(152678,6,'1WMS01',29,101.338,0,25,'S1',897.805,90981.6,' ','41E-00001  1981.56',200,200,5431.32,5631.32,5631.32,10000,8.50623,30,-4368.68,0,1209.67,4230.16,'2016-12-16 16:25:48','2016-12-16 16:25:48',NULL,NULL,1354.52,2.20712),(152679,6,'1WMS01',29,101.338,30,26,'S2',897.805,90981.6,'41E-00001  10000.0','41E-00010  10000.0',191.494,191.494,4639.4,4830.89,4830.89,10000,-1522.25,60,-5169.11,30,-1121.52,4230.16,'2016-12-16 16:25:48','2016-12-16 16:25:48',NULL,NULL,1157.02,2.20712),(152680,6,'1WMS01',29,101.338,60,19,'S3',897.805,0,'41E-00010  1981.56',NULL,1722.25,0,0,0,0,NULL,0,0,0,0,0,0,'2016-12-16 16:25:48','2016-12-16 16:25:48',NULL,NULL,0,2.20712),(152681,6,'1WMS01',30,103.545,0,25,'S1',897.805,92963.1,' ','41E-00001  3963.12',200,200,5431.32,5631.32,5631.32,10000,8.50623,30,-4368.68,0,1209.67,4230.16,'2016-12-16 16:25:48','2016-12-16 16:25:48',NULL,NULL,1354.52,6.72404),(152682,6,'1WMS01',30,103.545,30,26,'S2',897.805,92963.1,'41E-00001  8018.44','41E-00001  1981.56',191.494,191.494,4639.4,4830.89,4830.89,10000,-1522.25,60,-5169.11,30,-1121.52,4230.16,'2016-12-16 16:25:48','2016-12-16 16:25:48',NULL,NULL,1157.02,6.72404),(152683,6,'1WMS01',30,103.545,60,19,'S3',897.805,0,'41E-00001  10000.0',NULL,1722.25,0,0,0,0,NULL,0,0,0,0,0,0,'2016-12-16 16:25:48','2016-12-16 16:25:48',NULL,NULL,0,6.72404),(152684,6,'1WMS01',31,110.269,0,25,'S1',897.805,99000,' ','41E-00001  10000.0',200,200,5431.32,5631.32,5631.32,10000,8.50623,30,-4368.68,0,1209.67,4230.16,'2016-12-16 16:25:48','2016-12-16 16:25:48',NULL,NULL,1354.52,1.11383),(152685,6,'1WMS01',31,110.269,30,26,'S2',897.805,99000,'41E-00001  1981.56','41E-00001  8018.44',191.494,191.494,4639.4,4830.89,4830.89,10000,-1522.25,60,-5169.11,30,-1121.52,4230.16,'2016-12-16 16:25:48','2016-12-16 16:25:48',NULL,NULL,1157.02,1.11383),(152686,6,'1WMS01',31,110.269,60,19,'S3',897.805,0,'41E-00001  3963.12',NULL,1722.25,0,0,0,0,NULL,0,0,0,0,0,0,'2016-12-16 16:25:48','2016-12-16 16:25:48',NULL,NULL,0,1.11383),(152687,6,'1WMS01',32,111.383,0,25,'S1',897.805,100000,' ','41E-00002  1000.0',200,200,5431.32,5631.32,5631.32,10000,8.50623,30,-4368.68,0,1209.67,4230.16,'2016-12-16 16:25:48','2016-12-16 16:25:48',NULL,NULL,1354.52,1.09329),(152688,6,'1WMS01',32,111.383,30,26,'S2',897.805,100000,'41E-00001  981.56','41E-00001  9018.44',191.494,191.494,4639.4,4830.89,4830.89,10000,-1522.25,60,-5169.11,30,-1121.52,4230.16,'2016-12-16 16:25:48','2016-12-16 16:25:48',NULL,NULL,1157.02,1.09329),(152689,6,'1WMS01',32,111.383,60,19,'S3',897.805,0,'41E-00001  2963.12',NULL,1722.25,0,0,0,0,NULL,0,0,0,0,0,0,'2016-12-16 16:25:48','2016-12-16 16:25:48',NULL,NULL,0,1.09329);
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
INSERT INTO `schema_migrations` VALUES ('20160316204320'),('20160316230347'),('20160318143858'),('20160320011737'),('20160321011250'),('20160321012411'),('20160321013825'),('20160321020204'),('20160321023024'),('20160321025902'),('20160321144602'),('20160321225915'),('20160322133222'),('20160323010450'),('20160323213503'),('20160324005925'),('20160324011230'),('20160324140620'),('20160520003845'),('20160522004715'),('20161130002858'),('20161201002244'),('20161201011832'),('20161201151138'),('20161201163219'),('20161204013321'),('20161205171241'),('20161205172258'),('20161207213530'),('20161213023235'),('20161213192606'),('20161214000606'),('20161216020716'),('20161216051932');
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
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `segments`
--

LOCK TABLES `segments` WRITE;
/*!40000 ALTER TABLE `segments` DISABLE KEYS */;
INSERT INTO `segments` VALUES (1,0.49,0.05,0.00000381,10000,1,'2016-04-02 02:29:45','2016-04-02 02:29:45',0),(2,0.492,0.05,0.00000381,10000,1,'2016-04-02 02:30:31','2016-04-02 02:30:31',14.34),(3,0.49,0.05,0.00000381,10000,1,'2016-04-02 02:30:58','2016-04-02 02:30:58',176),(4,0.492,0.05,0.00000381,10000,1,'2016-04-02 02:31:56','2016-04-02 02:31:56',188.4),(5,0.49,0.05,0.00000381,10000,1,'2016-04-02 02:33:32','2016-04-02 02:33:32',351.95),(6,0.492,0.05,0.00000381,10000,1,'2016-04-02 02:34:02','2016-04-02 02:34:02',428.24),(7,0.4874,0.05,0.00000381,10000,1,'2016-04-02 02:35:03','2016-04-02 02:35:03',538.18),(8,0.49,0.05,0.00000381,10000,1,'2016-04-02 02:35:37','2016-04-02 02:35:37',538.24),(9,0.492,0.05,0.00000381,10000,1,'2016-04-02 02:36:09','2016-04-02 02:36:09',566.63),(10,0.39,0.05,0.00000381,10000,1,'2016-04-02 02:37:30','2016-04-02 02:37:30',704.48),(11,0.443,0.05,0.00000381,10000,1,'2016-04-02 02:37:51','2016-04-02 02:37:51',899.74),(12,0.39,0.05,0.00000381,10000,1,'2016-04-02 02:38:17','2016-04-02 02:38:17',959.77),(13,0.443,0.05,0.00000381,10000,1,'2016-04-02 02:38:37','2016-04-02 02:38:37',1242.61),(14,0.443,0.05,0.00000381,10000,1,'2016-04-02 02:38:58','2016-04-02 02:38:58',1766.84),(36,0.3,0.005,0.00000381,10000,6,'2016-05-30 16:51:39','2016-05-31 13:58:12',0),(37,0.3,0.005,0.00000381,10000,6,'2016-05-30 16:52:00','2016-10-06 18:16:41',60),(38,0.5,0.0005,0.000005,8000,7,'2016-12-03 05:33:14','2016-12-03 05:33:14',0),(39,0.5,0.0005,0.000005,8000,7,'2016-12-03 05:34:24','2016-12-03 05:34:46',100),(40,0.3,0.005,0.00000381,10000,6,'2016-12-15 16:09:22','2016-12-15 16:09:22',30);
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
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shipments`
--

LOCK TABLES `shipments` WRITE;
/*!40000 ALTER TABLE `shipments` DISABLE KEYS */;
INSERT INTO `shipments` VALUES (1,'Edmonton','Superior','IOL','63E',1000,'2016-03-24 13:22:48','2016-11-26 23:01:32',1),(2,'Edmonton','Regina','PETCN','SYN',5000,'2016-03-24 13:32:01','2016-10-18 15:24:31',1),(3,'Edmonton','Superior','SHELL','41E',6000,'2016-03-24 16:00:36','2016-10-18 15:24:40',1),(4,'Edmonton','H2','IOL','SYN',50000,'2016-05-26 13:16:42','2016-05-26 13:16:42',2),(5,'S1','S3','IOL','41E',100000,'2016-05-30 16:56:44','2016-12-15 16:13:21',3),(7,'Kerrobert','Superior','TEX','NGL',10000,'2016-10-29 13:12:55','2016-10-29 13:12:55',1),(8,'Edmonton','Superior','IOL','63E',60000,'2016-11-26 23:03:26','2016-11-26 23:03:26',4),(9,'Edmonton','Regina','PETCN','SYN',55000,'2016-11-26 23:03:50','2016-11-30 03:45:28',4),(10,'Edmonton','Superior','SHELL','41E',75000,'2016-11-26 23:04:20','2016-11-26 23:04:20',4),(11,'Kerrobert','Superior','TEX','NGL',120000,'2016-11-26 23:04:45','2016-11-30 03:45:40',4),(12,'Edmonton','Hardisty','WMS','63E',40000,'2016-12-03 05:36:47','2016-12-03 23:37:06',5),(14,'Edmonton','Superior','IOL','63E',10000,'2016-12-15 22:56:46','2016-12-15 22:56:46',6),(15,'Edmonton','Gretna','IOL','SYN',2000,'2016-12-15 22:57:11','2016-12-15 22:59:17',6),(16,'Regina','Superior','PETCN','63E',60000,'2016-12-15 22:57:53','2016-12-15 22:57:53',6),(17,'Edmonton','Superior','SHELL','SYN',2000,'2016-12-15 22:58:37','2016-12-15 22:58:37',6),(18,'Edmonton','Superior','PEN','63E',30000,'2016-12-15 23:01:00','2016-12-15 23:01:00',6),(19,'Edmonton','Superior','HUSKY','41E',55000,'2016-12-15 23:02:09','2016-12-15 23:02:09',6),(20,'Edmonton','Superior','IOL','41E',100000,'2016-12-15 23:11:04','2016-12-15 23:11:04',7);
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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `simulations`
--

LOCK TABLES `simulations` WRITE;
/*!40000 ALTER TABLE `simulations` DISABLE KEYS */;
INSERT INTO `simulations` VALUES (3,'Line 1 First','First simulation ever performed','Line 1',1000,'2016-03-24 14:14:10','2016-12-16 16:30:15','2016-04',10000),(6,'1WMS01','Test Simulation','1WMS01',1200,'2016-05-30 16:59:15','2016-12-15 16:14:04','1WMS01',10000),(7,'Line 1 Benchmark','Line 1 Benchmark Test from Nov 25th','Line 1',600,'2016-11-26 23:05:48','2016-12-16 15:12:01','2016-11',10000),(8,'My Test 02 Sim','Testing entry of simulation','Test02',9000,'2016-12-03 05:38:07','2016-12-03 05:38:07','My Test 02 Nom',10000),(9,'Line 1 Comparison','Line 1 Test comparing results against BPFLOW output','Line 1',800,'2016-12-15 22:37:10','2016-12-16 16:29:13','Line 1 Test 2016-12',10000);
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
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stations`
--

LOCK TABLES `stations` WRITE;
/*!40000 ALTER TABLE `stations` DISABLE KEYS */;
INSERT INTO `stations` VALUES (1,'Edmonton',0,'2016-04-02 02:26:24','2016-04-02 02:26:24',1),(2,'Hardisty',176,'2016-04-02 02:26:35','2016-04-02 02:26:35',1),(3,'Kerrobert',351.95,'2016-04-02 02:26:49','2016-04-02 02:26:49',1),(4,'Regina',704.48,'2016-04-02 02:27:01','2016-04-02 02:27:01',1),(5,'Cromer',959.77,'2016-04-02 02:27:13','2016-04-02 02:27:13',1),(6,'West Souris',1031.9,'2016-04-02 02:27:34','2016-04-02 02:27:34',1),(7,'Gretna',1242.61,'2016-04-02 02:27:58','2016-04-02 02:27:58',1),(8,'Clearbrook',1463.39,'2016-04-02 02:28:15','2016-04-02 02:28:15',1),(9,'Superior',1766.84,'2016-04-02 02:28:29','2016-04-02 02:28:29',1),(19,'S3',60,'2016-05-30 16:51:07','2016-10-06 18:15:57',6),(20,'Edmonton',0,'2016-12-03 05:21:22','2016-12-03 23:36:14',7),(21,'Hardisty',100,'2016-12-03 05:21:32','2016-12-03 23:36:27',7),(25,'S1',0,'2016-12-04 17:48:35','2016-12-04 17:48:35',6),(26,'S2',30,'2016-12-15 16:08:30','2016-12-15 16:08:30',6);
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
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `temperatures`
--

LOCK TABLES `temperatures` WRITE;
/*!40000 ALTER TABLE `temperatures` DISABLE KEYS */;
INSERT INTO `temperatures` VALUES (1,0,5,1,'2016-04-02 14:07:09','2016-04-02 14:07:09'),(2,100,15,1,'2016-04-02 14:07:25','2016-04-02 14:07:25'),(3,321.8,5,1,'2016-04-02 14:07:34','2016-04-02 14:07:34'),(4,1766.84,5,1,'2016-04-02 14:07:44','2016-04-02 14:07:44'),(11,0,5,6,'2016-05-30 16:54:02','2016-06-04 00:18:38'),(12,30,5,6,'2016-05-30 16:54:10','2016-05-30 16:54:10'),(13,60,5,6,'2016-05-30 16:54:15','2016-10-06 18:16:59'),(14,0,10,7,'2016-12-03 05:35:20','2016-12-03 05:35:20'),(15,100,5,7,'2016-12-03 05:35:27','2016-12-03 05:35:27');
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
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `units`
--

LOCK TABLES `units` WRITE;
/*!40000 ALTER TABLE `units` DISABLE KEYS */;
INSERT INTO `units` VALUES (25,25,'B-23674A',1,1,'2016-12-04 17:50:04','2016-12-15 16:38:30'),(26,25,'B-C-567',1,2,'2016-12-04 17:50:10','2016-12-15 16:11:20'),(27,25,'B-C-568',1,3,'2016-12-04 17:50:14','2016-12-15 16:11:34'),(32,1,'B-23674A',1,1,'2016-12-06 00:24:21','2016-12-06 00:24:21'),(33,1,'B-C-567',1,1,'2016-12-06 00:24:36','2016-12-15 21:54:43'),(34,2,'B-C-3712',1,1,'2016-12-06 00:24:48','2016-12-15 21:55:41'),(35,3,'B-C-3712',1,1,'2016-12-06 00:24:59','2016-12-15 21:57:58'),(36,4,'B-C3699',1,1,'2016-12-06 00:25:11','2016-12-15 21:59:14'),(38,6,'BJTC4102',1,1,'2016-12-06 00:25:39','2016-12-15 22:02:06'),(39,7,'B-24324A',1,1,'2016-12-06 00:25:56','2016-12-15 22:08:23'),(40,8,'B-23674A',1,1,'2016-12-06 00:26:08','2016-12-06 00:26:08'),(41,1,'B-C-568',1,1,'2016-12-07 18:37:29','2016-12-15 21:54:59'),(42,8,'B-24324A',1,2,'2016-12-07 18:42:04','2016-12-08 02:16:23'),(43,8,'B-23674A',1,3,'2016-12-07 18:43:35','2016-12-08 02:16:30'),(44,2,'B-C-3712',1,2,'2016-12-08 01:57:42','2016-12-15 21:56:52'),(45,3,'B-C-3712',1,2,'2016-12-08 01:58:02','2016-12-15 21:58:10'),(46,4,'B-C3699',1,2,'2016-12-08 01:58:13','2016-12-15 21:59:26'),(48,6,'B-C-572',1,2,'2016-12-08 01:58:39','2016-12-15 22:07:31'),(50,8,'B-23674A',1,4,'2016-12-08 01:59:03','2016-12-08 02:16:38'),(51,7,'B-E213',1,2,'2016-12-08 02:11:46','2016-12-15 22:08:44'),(56,5,'BJTC4102',1,1,'2016-12-09 17:05:22','2016-12-15 22:00:39'),(57,20,'B-24324A',1,1,'2016-12-09 23:18:11','2016-12-09 23:18:11'),(61,26,'B-33118A',1,1,'2016-12-15 16:12:25','2016-12-15 16:12:25'),(62,26,'B-33118A',1,2,'2016-12-15 16:12:39','2016-12-15 16:12:39'),(63,2,'B-C-3692',1,3,'2016-12-15 21:56:31','2016-12-15 21:56:31'),(64,3,'B-C-3692',1,3,'2016-12-15 21:58:37','2016-12-15 21:58:37'),(65,5,'B-24324A',1,2,'2016-12-15 22:01:00','2016-12-15 22:01:00'),(66,5,'B-E213',1,3,'2016-12-15 22:01:28','2016-12-15 22:01:28');
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

-- Dump completed on 2016-12-16  9:39:33
