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
-- Table structure for table `citas_agendadas`
--

DROP TABLE IF EXISTS `citas_agendadas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `citas_agendadas` (
  `id_citas_agendadas` int NOT NULL AUTO_INCREMENT,
  `id_paciente` int DEFAULT NULL,
  `id_dentista` int DEFAULT NULL,
  `tipo_pago` enum('yape','plin','efectivo','transferencia') DEFAULT NULL,
  `fecha_cita` varchar(200) DEFAULT NULL,
  `hora_cita` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id_citas_agendadas`),
  KEY `fk_citas_agendadas_paciente` (`id_paciente`),
  KEY `fk_citas_agendadas_dentista` (`id_dentista`),
  CONSTRAINT `fk_citas_agendadas_dentista` FOREIGN KEY (`id_dentista`) REFERENCES `dentista` (`id_dentista`),
  CONSTRAINT `fk_citas_agendadas_paciente` FOREIGN KEY (`id_paciente`) REFERENCES `paciente` (`id_paciente`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `citas_agendadas`
--

LOCK TABLES `citas_agendadas` WRITE;
/*!40000 ALTER TABLE `citas_agendadas` DISABLE KEYS */;
INSERT INTO `citas_agendadas` VALUES (1,1,1,'efectivo','2024-12-22','10:00'),(2,2,2,'yape','2024-12-22','11:30'),(3,3,1,'plin','2024-12-22','12:30'),(4,4,2,'transferencia','2024-12-23','09:00'),(5,5,1,'efectivo','2024-12-23','10:30'),(6,6,2,'yape','2024-12-23','11:00'),(7,7,1,'plin','2024-12-24','08:00'),(8,8,2,'transferencia','2024-12-24','09:30'),(9,9,1,'efectivo','2024-12-24','10:00'),(10,10,2,'yape','2024-12-24','12:00');
/*!40000 ALTER TABLE `citas_agendadas` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `verificar_fecha_hora` BEFORE INSERT ON `citas_agendadas` FOR EACH ROW BEGIN
    IF STR_TO_DATE(NEW.fecha_cita, '%Y-%m-%d') < CURDATE() OR (STR_TO_DATE(NEW.fecha_cita, '%Y-%m-%d') = CURDATE() AND STR_TO_DATE(NEW.hora_cita, '%H:%i') < CURTIME()) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'No se puede agendar una cita en el pasado.';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `actualizar_dentista` AFTER UPDATE ON `citas_agendadas` FOR EACH ROW BEGIN
    DECLARE nuevo_nombre_dentista VARCHAR(200);

    -- Obtener el nuevo nombre del dentista
    SELECT nombre INTO nuevo_nombre_dentista 
    FROM dentosmart_bd.dentista
    WHERE id_dentista = NEW.id_dentista;
    
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-01-27 14:15:00
