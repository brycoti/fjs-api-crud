CREATE DATABASE  IF NOT EXISTS `academica` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `academica`;
-- MySQL dump 10.13  Distrib 8.0.28, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: academica
-- ------------------------------------------------------
-- Server version	5.7.28

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `alumnes`
--

DROP TABLE IF EXISTS `alumnes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `alumnes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alumnes`
--

LOCK TABLES `alumnes` WRITE;
/*!40000 ALTER TABLE `alumnes` DISABLE KEYS */;
INSERT INTO `alumnes` VALUES (1,'Toni'),(2,'Ramon'),(3,'Laia'),(4,'Anna'),(5,'David'),(6,'Pau'),(7,'Alex'),(8,'Kim'),(9,'Alex'),(10,'Bernardo');
/*!40000 ALTER TABLE `alumnes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assistencies`
--

DROP TABLE IF EXISTS `assistencies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `assistencies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tard` tinyint(4) DEFAULT NULL,
  `matricula_id` int(11) NOT NULL,
  `dies_classe_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_assistencies_matricula1_idx` (`matricula_id`),
  KEY `fk_assistencies_dies_classe1_idx` (`dies_classe_id`),
  CONSTRAINT `fk_assistencies_dies_classe1` FOREIGN KEY (`dies_classe_id`) REFERENCES `dies_classe` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fk_assistencies_matricula1` FOREIGN KEY (`matricula_id`) REFERENCES `matricula` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=163 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assistencies`
--

LOCK TABLES `assistencies` WRITE;
/*!40000 ALTER TABLE `assistencies` DISABLE KEYS */;
INSERT INTO `assistencies` VALUES (1,0,1,1),(2,1,1,2),(3,0,1,3),(4,0,1,4),(5,0,1,5),(6,1,1,6),(7,0,1,7),(8,0,1,8),(9,0,1,9),(10,1,1,10),(11,0,2,1),(12,1,2,2),(13,0,2,3),(14,0,2,4),(15,0,2,5),(16,1,2,6),(17,0,2,7),(18,0,2,8),(19,0,2,9),(20,1,2,10),(21,0,3,1),(22,1,3,2),(23,0,3,3),(24,0,3,4),(25,0,3,5),(26,1,3,6),(27,0,3,7),(28,0,3,8),(29,0,3,9),(30,1,3,10),(31,0,4,1),(32,0,4,3),(33,0,4,4),(34,0,4,5),(35,1,4,6),(36,0,4,7),(37,0,4,8),(38,0,4,9),(39,1,4,10),(40,0,5,1),(41,1,5,2),(42,0,5,3),(43,0,5,4),(44,0,5,5),(45,1,5,6),(46,0,5,7),(47,0,5,8),(48,0,5,9),(49,1,5,10),(50,0,6,1),(51,1,6,2),(52,0,6,3),(53,0,6,4),(54,0,6,5),(55,1,6,6),(56,0,6,7),(57,0,6,8),(58,0,7,1),(59,1,7,2),(60,0,7,3),(61,0,7,4),(62,0,7,5),(63,1,7,6),(64,0,7,7),(65,0,7,8),(66,0,7,9),(67,1,7,10),(68,0,8,1),(69,1,8,2),(70,0,8,3),(71,0,8,4),(72,0,8,5),(73,1,8,6),(74,0,8,7),(75,0,8,8),(76,0,8,9),(77,1,8,10),(78,0,9,1),(79,1,9,2),(80,0,9,3),(81,0,9,4),(82,0,9,5),(83,1,9,6),(84,0,9,7),(85,0,9,8),(86,0,9,9),(87,1,9,10),(88,0,10,11),(89,1,10,12),(90,0,10,13),(91,0,10,14),(92,0,10,15),(93,1,10,16),(94,0,10,17),(95,0,10,18),(96,0,10,19),(97,1,10,20),(98,0,11,11),(99,1,11,12),(100,0,11,13),(101,0,11,14),(102,0,11,15),(103,1,11,16),(104,0,11,17),(105,0,11,18),(106,0,11,19),(107,1,11,20),(108,0,12,11),(109,1,12,12),(110,0,12,14),(111,0,12,15),(112,1,12,16),(113,0,12,17),(114,0,12,18),(115,0,12,19),(116,1,12,20),(117,0,13,11),(118,1,13,12),(119,0,13,13),(120,0,13,14),(121,0,13,15),(122,1,13,16),(123,0,13,17),(124,0,13,18),(125,0,13,19),(126,0,14,11),(127,1,14,12),(128,0,14,13),(129,0,14,14),(130,0,14,15),(131,1,14,16),(132,0,14,17),(133,0,14,18),(134,0,14,19),(135,1,14,20),(136,0,15,11),(137,0,15,13),(138,0,15,14),(139,0,15,15),(140,1,15,16),(141,0,15,17),(142,0,15,18),(143,0,15,19),(144,1,15,20),(145,0,16,11),(146,1,16,12),(147,0,16,13),(148,0,16,14),(149,0,16,15),(150,1,16,16),(151,0,16,17),(152,0,16,18),(153,0,16,19),(154,1,16,20),(155,0,17,13),(156,0,17,14),(157,0,17,15),(158,1,17,16),(159,0,17,17),(160,0,17,18),(161,0,17,19),(162,1,17,20);
/*!40000 ALTER TABLE `assistencies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cursos`
--

DROP TABLE IF EXISTS `cursos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cursos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `informacio` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cursos`
--

LOCK TABLES `cursos` WRITE;
/*!40000 ALTER TABLE `cursos` DISABLE KEYS */;
INSERT INTO `cursos` VALUES (1,'Java'),(2,'.NET'),(3,'WEB');
/*!40000 ALTER TABLE `cursos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dies_classe`
--

DROP TABLE IF EXISTS `dies_classe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dies_classe` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `data` date DEFAULT NULL,
  `edicions_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_dies_classe_edicions1_idx` (`edicions_id`),
  CONSTRAINT `fk_dies_classe_edicions1` FOREIGN KEY (`edicions_id`) REFERENCES `edicions` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dies_classe`
--

LOCK TABLES `dies_classe` WRITE;
/*!40000 ALTER TABLE `dies_classe` DISABLE KEYS */;
INSERT INTO `dies_classe` VALUES (1,'2019-07-01',1),(2,'2019-07-02',1),(3,'2019-07-03',1),(4,'2019-07-04',1),(5,'2019-07-05',1),(6,'2019-07-06',1),(7,'2019-07-07',1),(8,'2019-07-08',1),(9,'2019-07-09',1),(10,'2019-07-10',1),(11,'2019-08-01',2),(12,'2019-08-02',2),(13,'2019-08-03',2),(14,'2019-08-04',2),(15,'2019-08-05',2),(16,'2019-08-06',2),(17,'2019-08-08',2),(18,'2019-08-08',2),(19,'2019-08-09',2),(20,'2019-08-10',2);
/*!40000 ALTER TABLE `dies_classe` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `edicions`
--

DROP TABLE IF EXISTS `edicions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `edicions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `titol` varchar(45) DEFAULT NULL,
  `datainici` date DEFAULT NULL,
  `cursos_id` int(11) NOT NULL,
  `professors_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_edicions_cursos_idx` (`cursos_id`),
  KEY `fk_edicions_professors1_idx` (`professors_id`),
  CONSTRAINT `fk_edicions_cursos` FOREIGN KEY (`cursos_id`) REFERENCES `cursos` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fk_edicions_professors1` FOREIGN KEY (`professors_id`) REFERENCES `professors` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `edicions`
--

LOCK TABLES `edicions` WRITE;
/*!40000 ALTER TABLE `edicions` DISABLE KEYS */;
INSERT INTO `edicions` VALUES (1,'Java matins 200h','2019-07-01',1,1),(2,'React estiu 200h','2019-08-01',3,2),(3,'java tardes setembre',NULL,1,NULL),(4,'react setembre',NULL,2,NULL);
/*!40000 ALTER TABLE `edicions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `examens`
--

DROP TABLE IF EXISTS `examens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `examens` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(45) DEFAULT NULL,
  `edicions_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_examens_edicions1_idx` (`edicions_id`),
  CONSTRAINT `fk_examens_edicions1` FOREIGN KEY (`edicions_id`) REFERENCES `edicions` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `examens`
--

LOCK TABLES `examens` WRITE;
/*!40000 ALTER TABLE `examens` DISABLE KEYS */;
INSERT INTO `examens` VALUES (1,'Conceptes generals',1),(2,'Conceptes generals',2),(3,'Java OOP',1),(4,'Programació web',2);
/*!40000 ALTER TABLE `examens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `matricula`
--

DROP TABLE IF EXISTS `matricula`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `matricula` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `edicions_id` int(11) NOT NULL,
  `alumnes_id` int(11) NOT NULL,
  `ordinadors_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_matricula_edicions1_idx` (`edicions_id`),
  KEY `fk_matricula_alumnes1_idx` (`alumnes_id`),
  KEY `fk_matricula_ordinadors1_idx` (`ordinadors_id`),
  CONSTRAINT `fk_matricula_alumnes1` FOREIGN KEY (`alumnes_id`) REFERENCES `alumnes` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fk_matricula_edicions1` FOREIGN KEY (`edicions_id`) REFERENCES `edicions` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fk_matricula_ordinadors1` FOREIGN KEY (`ordinadors_id`) REFERENCES `ordinadors` (`id`) ON DELETE SET NULL ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `matricula`
--

LOCK TABLES `matricula` WRITE;
/*!40000 ALTER TABLE `matricula` DISABLE KEYS */;
INSERT INTO `matricula` VALUES (1,1,1,1),(2,1,2,2),(3,1,3,3),(4,1,4,4),(5,1,5,5),(6,1,6,6),(7,1,8,7),(8,1,9,10),(9,1,10,3),(10,2,1,1),(11,2,2,2),(12,2,8,7),(13,2,9,10),(14,2,10,3),(15,2,4,3),(16,2,5,4),(17,2,6,5);
/*!40000 ALTER TABLE `matricula` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notes`
--

DROP TABLE IF EXISTS `notes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nota` int(11) DEFAULT NULL,
  `examens_id` int(11) NOT NULL,
  `matricula_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_notes_examens1_idx` (`examens_id`),
  KEY `fk_notes_matricula1_idx` (`matricula_id`),
  CONSTRAINT `fk_notes_examens1` FOREIGN KEY (`examens_id`) REFERENCES `examens` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fk_notes_matricula1` FOREIGN KEY (`matricula_id`) REFERENCES `matricula` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notes`
--

LOCK TABLES `notes` WRITE;
/*!40000 ALTER TABLE `notes` DISABLE KEYS */;
INSERT INTO `notes` VALUES (1,7,1,1),(2,6,1,2),(3,8,1,3),(4,7,1,4),(5,5,1,5),(6,7,1,6),(7,4,1,7),(8,5,1,8),(9,10,1,9),(10,8,2,10),(11,8,2,11),(12,4,2,12),(13,5,2,13),(14,7,2,14),(15,4,2,15),(16,5,2,16),(17,8,2,17);
/*!40000 ALTER TABLE `notes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ordinadors`
--

DROP TABLE IF EXISTS `ordinadors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ordinadors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `model` varchar(45) DEFAULT NULL,
  `numero` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ordinadors`
--

LOCK TABLES `ordinadors` WRITE;
/*!40000 ALTER TABLE `ordinadors` DISABLE KEYS */;
INSERT INTO `ordinadors` VALUES (1,'Lenovo G50',10),(2,'Lenovo G50',11),(3,'Lenovo G50',12),(4,'Lenovo G50',13),(5,'Lenovo G50',14),(6,'Lenovo G50',15),(7,'Dell P10',20),(8,'Dell P10',21),(9,'Dell P10',22),(10,'Dell P10',23),(11,'Dell P10',24),(12,'Dell P10',25);
/*!40000 ALTER TABLE `ordinadors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `professors`
--

DROP TABLE IF EXISTS `professors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `professors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `professors`
--

LOCK TABLES `professors` WRITE;
/*!40000 ALTER TABLE `professors` DISABLE KEYS */;
INSERT INTO `professors` VALUES (1,'adrià'),(2,'ricard'),(3,'robert'),(4,'cristina'),(5,'marta');
/*!40000 ALTER TABLE `professors` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-08-19 13:36:24
