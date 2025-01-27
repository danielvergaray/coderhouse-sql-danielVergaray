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
-- Temporary view structure for view `vista_resumen_citas`
--

DROP TABLE IF EXISTS `vista_resumen_citas`;
/*!50001 DROP VIEW IF EXISTS `vista_resumen_citas`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_resumen_citas` AS SELECT 
 1 AS `paciente_nombre`,
 1 AS `paciente_distrito`,
 1 AS `dentista_nombre`,
 1 AS `fecha_cita`,
 1 AS `hora_cita`,
 1 AS `tipo_pago`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vista_materiales_y_proveedores`
--

DROP TABLE IF EXISTS `vista_materiales_y_proveedores`;
/*!50001 DROP VIEW IF EXISTS `vista_materiales_y_proveedores`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_materiales_y_proveedores` AS SELECT 
 1 AS `material_nombre`,
 1 AS `precio`,
 1 AS `unidad_medida`,
 1 AS `stock`,
 1 AS `fecha_vencimiento`,
 1 AS `proveedor_nombre`,
 1 AS `proveedor_email`,
 1 AS `proveedor_persona_encargada`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `vista_resumen_citas`
--

/*!50001 DROP VIEW IF EXISTS `vista_resumen_citas`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_resumen_citas` AS select `p`.`nombre` AS `paciente_nombre`,`p`.`distrito` AS `paciente_distrito`,`d`.`nombre` AS `dentista_nombre`,`c`.`fecha_cita` AS `fecha_cita`,`c`.`hora_cita` AS `hora_cita`,`c`.`tipo_pago` AS `tipo_pago` from ((`citas_agendadas` `c` join `paciente` `p` on((`c`.`id_paciente` = `p`.`id_paciente`))) join `dentista` `d` on((`c`.`id_dentista` = `d`.`id_dentista`))) order by `c`.`fecha_cita`,`c`.`hora_cita` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_materiales_y_proveedores`
--

/*!50001 DROP VIEW IF EXISTS `vista_materiales_y_proveedores`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_materiales_y_proveedores` AS select `m`.`nombre` AS `material_nombre`,`m`.`precio` AS `precio`,`m`.`unidad_medida` AS `unidad_medida`,`m`.`stock` AS `stock`,`m`.`fecha_vencimiento` AS `fecha_vencimiento`,`p`.`nombre` AS `proveedor_nombre`,`p`.`email` AS `proveedor_email`,`p`.`persona_encargada` AS `proveedor_persona_encargada` from (`materiales_dentales` `m` join `proveedores` `p` on((`m`.`id_materiales_dentales` = `p`.`id_proveedores`))) where (`m`.`stock` < 50) order by `m`.`stock` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Dumping events for database 'dentosmart_bd'
--

--
-- Dumping routines for database 'dentosmart_bd'
--
/*!50003 DROP FUNCTION IF EXISTS `buscar_proveedor_por_encargado` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `buscar_proveedor_por_encargado`(encargado_param VARCHAR(200)) RETURNS varchar(400) CHARSET utf8mb4
    DETERMINISTIC
BEGIN
    DECLARE resultado VARCHAR(400);

    SELECT CONCAT('Proveedor: ', nombre, ', Email: ', email)
    INTO resultado
    FROM dentosmart_bd.proveedores
    WHERE persona_encargada = encargado_param;

    IF resultado IS NULL THEN
        RETURN 'No se encontró ningún proveedor para la persona encargada proporcionada.';
    END IF;

    RETURN resultado;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `obtener_dentista_por_sexo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `obtener_dentista_por_sexo`(sexo_param VARCHAR(10)) RETURNS varchar(255) CHARSET utf8mb4
    DETERMINISTIC
BEGIN
    DECLARE resultado VARCHAR(255);

    SET resultado = CASE
        WHEN sexo_param = 'femenino' THEN 
            (SELECT nombre FROM dentista WHERE sexo = 'femenino' LIMIT 1)
        WHEN sexo_param = 'masculino' THEN 
            (SELECT nombre FROM dentista WHERE sexo = 'masculino' LIMIT 1)
        ELSE 
            'Sexo no válido'
    END;

    RETURN resultado;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `agrupar_pacientes_por_distrito` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `agrupar_pacientes_por_distrito`()
BEGIN
    SELECT 
        distrito, 
        COUNT(*) AS cantidad_pacientes
    FROM 
        dentosmart_bd.paciente
    GROUP BY 
        distrito
    ORDER BY 
        cantidad_pacientes DESC;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `obtener_materiales_bajo_stock` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `obtener_materiales_bajo_stock`()
BEGIN
    SELECT 
        nombre AS NombreMaterial, 
        precio AS Precio, 
        unidad_medida AS Unidad, 
        fecha_vencimiento AS FechaVencimiento, 
        stock AS Stock 
    FROM dentosmart_bd.materiales_dentales
    WHERE stock < 50
    ORDER BY stock DESC;
END ;;
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
