-- MySQL dump 10.13  Distrib 8.0.40, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: dentosmart_bd
-- ------------------------------------------------------
-- Server version	8.0.40

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
-- Table structure for table `materiales_dentales_citas_agendadas`
--

DROP TABLE IF EXISTS `materiales_dentales_citas_agendadas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `materiales_dentales_citas_agendadas` (
  `id_materiales_dentales_citas_agendadas` int NOT NULL AUTO_INCREMENT,
  `id_materiales_dentales` int DEFAULT NULL,
  `id_citas_agendadas` int DEFAULT NULL,
  `materiales_usados` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id_materiales_dentales_citas_agendadas`),
  KEY `fk_materiales_dentales_citas_agendadas_materiales_dentales` (`id_materiales_dentales`),
  KEY `fk_materiales_dentales_citas_agendadas_citas_agendadas` (`id_citas_agendadas`),
  CONSTRAINT `fk_materiales_dentales_citas_agendadas_citas_agendadas` FOREIGN KEY (`id_citas_agendadas`) REFERENCES `citas_agendadas` (`id_citas_agendadas`),
  CONSTRAINT `fk_materiales_dentales_citas_agendadas_materiales_dentales` FOREIGN KEY (`id_materiales_dentales`) REFERENCES `materiales_dentales` (`id_materiales_dentales`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `materiales_dentales_citas_agendadas`
--

LOCK TABLES `materiales_dentales_citas_agendadas` WRITE;
/*!40000 ALTER TABLE `materiales_dentales_citas_agendadas` DISABLE KEYS */;
/*!40000 ALTER TABLE `materiales_dentales_citas_agendadas` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-01-27 14:14:59
