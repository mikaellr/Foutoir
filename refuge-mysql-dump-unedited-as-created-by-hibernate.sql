-- MySQL dump 10.16  Distrib 10.1.41-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: refuge
-- ------------------------------------------------------
-- Server version	10.1.41-MariaDB-0+deb9u1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `refuge_animals`
--

DROP TABLE IF EXISTS `refuge_animals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `refuge_animals` (
  `id` int(11) NOT NULL,
  `adoptable` bit(1) NOT NULL,
  `birthYear` int(11) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `photo` tinyblob,
  `photoContentLength` int(11) NOT NULL,
  `photoContentType` varchar(255) DEFAULT NULL,
  `sex` char(1) NOT NULL,
  `sterilized` bit(1) NOT NULL,
  `fk_color` int(11) DEFAULT NULL,
  `fk_race` int(11) DEFAULT NULL,
  `fk_species` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK86gmxk28fbbvlhwimehul9r5k` (`fk_color`),
  KEY `FKdbi5sacy1cpgcy3tdw8ii3vwg` (`fk_race`),
  KEY `FKanmoe18quwvrg4epx9skjk6sg` (`fk_species`),
  CONSTRAINT `FK86gmxk28fbbvlhwimehul9r5k` FOREIGN KEY (`fk_color`) REFERENCES `refuge_colors` (`id`),
  CONSTRAINT `FKanmoe18quwvrg4epx9skjk6sg` FOREIGN KEY (`fk_species`) REFERENCES `refuge_species` (`id`),
  CONSTRAINT `FKdbi5sacy1cpgcy3tdw8ii3vwg` FOREIGN KEY (`fk_race`) REFERENCES `refuge_races` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `refuge_animals`
--

LOCK TABLES `refuge_animals` WRITE;
/*!40000 ALTER TABLE `refuge_animals` DISABLE KEYS */;
INSERT INTO `refuge_animals` VALUES (1,'',0,NULL,'Caroline',NULL,0,NULL,'\0','\0',NULL,NULL,3),(2,'',0,NULL,'Bill',NULL,0,NULL,'\0','\0',NULL,2,2),(3,'',0,NULL,'Carne',NULL,0,NULL,'\0','\0',3,NULL,4),(4,'',0,NULL,'Luc',NULL,0,NULL,'\0','\0',4,7,6);
/*!40000 ALTER TABLE `refuge_animals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `refuge_colors`
--

DROP TABLE IF EXISTS `refuge_colors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `refuge_colors` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `refuge_colors`
--

LOCK TABLES `refuge_colors` WRITE;
/*!40000 ALTER TABLE `refuge_colors` DISABLE KEYS */;
INSERT INTO `refuge_colors` VALUES (1,'blanc'),(2,'noir'),(3,'alezan'),(4,'bizarre');
/*!40000 ALTER TABLE `refuge_colors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `refuge_contact_requests`
--

DROP TABLE IF EXISTS `refuge_contact_requests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `refuge_contact_requests` (
  `id` int(11) NOT NULL,
  `date` datetime(6) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `firstName` varchar(255) DEFAULT NULL,
  `lastName` varchar(255) DEFAULT NULL,
  `message` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `treated` bit(1) NOT NULL,
  `fk_species` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK1g38erxr6m54g5r8argdubkxg` (`fk_species`),
  CONSTRAINT `FK1g38erxr6m54g5r8argdubkxg` FOREIGN KEY (`fk_species`) REFERENCES `refuge_animals` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `refuge_contact_requests`
--

LOCK TABLES `refuge_contact_requests` WRITE;
/*!40000 ALTER TABLE `refuge_contact_requests` DISABLE KEYS */;
INSERT INTO `refuge_contact_requests` VALUES (1,'2019-09-22 19:39:29.174000','leon.duschmol@gmail.com','Léon','Duschmol','Je veux la tortue','081/451212','\0',1),(2,'2019-09-22 19:39:29.274000','leon.duschmol@gmail.com','Léon','Duschmol','Je veux un programmeur Fortran','081/451212','\0',4),(3,'2019-09-22 19:39:29.341000','rene.martin@gmail.com','René','Martin','Le truc, là, ça m\'intéresse','081/451212','\0',4);
/*!40000 ALTER TABLE `refuge_contact_requests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `refuge_races`
--

DROP TABLE IF EXISTS `refuge_races`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `refuge_races` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `fk_species` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKbt7rljikniuv7nhpan9hq7yl0` (`fk_species`),
  CONSTRAINT `FKbt7rljikniuv7nhpan9hq7yl0` FOREIGN KEY (`fk_species`) REFERENCES `refuge_species` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `refuge_races`
--

LOCK TABLES `refuge_races` WRITE;
/*!40000 ALTER TABLE `refuge_races` DISABLE KEYS */;
INSERT INTO `refuge_races` VALUES (1,'Malinois',2),(2,'Cocker',2),(3,'Angora',1),(4,'Siamois',1),(5,'Programmeur Java',6),(6,'Programmeur Cobol',6),(7,'Programmeur Fortran',6),(8,'Programmeurs PHP',6);
/*!40000 ALTER TABLE `refuge_races` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `refuge_roles`
--

DROP TABLE IF EXISTS `refuge_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `refuge_roles` (
  `id` int(11) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `refuge_roles`
--

LOCK TABLES `refuge_roles` WRITE;
/*!40000 ALTER TABLE `refuge_roles` DISABLE KEYS */;
INSERT INTO `refuge_roles` VALUES (1,'Les employés du refuge','employe');
/*!40000 ALTER TABLE `refuge_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `refuge_species`
--

DROP TABLE IF EXISTS `refuge_species`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `refuge_species` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `refuge_species`
--

LOCK TABLES `refuge_species` WRITE;
/*!40000 ALTER TABLE `refuge_species` DISABLE KEYS */;
INSERT INTO `refuge_species` VALUES (1,'Chat'),(2,'Chien'),(3,'Tortue'),(4,'Cheval'),(5,'Python'),(6,'Progammeur');
/*!40000 ALTER TABLE `refuge_species` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `refuge_users`
--

DROP TABLE IF EXISTS `refuge_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `refuge_users` (
  `id` int(11) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `firstName` varchar(255) DEFAULT NULL,
  `hash` varchar(255) DEFAULT NULL,
  `lastName` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `salt` varchar(255) DEFAULT NULL,
  `fk_role` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKpemcxfh7pbce60kt5ew67vr8` (`fk_role`),
  CONSTRAINT `FKpemcxfh7pbce60kt5ew67vr8` FOREIGN KEY (`fk_role`) REFERENCES `refuge_roles` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `refuge_users`
--

LOCK TABLES `refuge_users` WRITE;
/*!40000 ALTER TABLE `refuge_users` DISABLE KEYS */;
INSERT INTO `refuge_users` VALUES (1,'roger.dupont@gmail.com','Roger',NULL,'Dupont',NULL,NULL,1),(2,'gisele.martin@gmail.com','Gisele',NULL,'Martin',NULL,NULL,1);
/*!40000 ALTER TABLE `refuge_users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-09-26 13:09:31
