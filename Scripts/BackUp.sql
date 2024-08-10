-- MySQL dump 10.13  Distrib 8.0.36, for macos14 (x86_64)
--
-- Host: 127.0.0.1    Database: vynil
-- ------------------------------------------------------
-- Server version	8.3.0

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
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `cliente_id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) DEFAULT NULL,
  `apellido` varchar(50) DEFAULT NULL,
  `tipo_documento` varchar(50) NOT NULL,
  `numero_docuento` int NOT NULL,
  `email` varchar(50) NOT NULL,
  `calle_nombre` varchar(50) DEFAULT NULL,
  `numero` int DEFAULT NULL,
  `piso` varchar(10) DEFAULT NULL,
  `dpto` varchar(10) DEFAULT NULL,
  `ciudad` varchar(50) DEFAULT NULL,
  `codigo_postal` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`cliente_id`),
  UNIQUE KEY `numero_docuento` (`numero_docuento`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (1,'Michelangelo','Caravaggio','DNI',12345678,'cara@mail.com','Colon',1221,'A','3','Cordoba','5000'),(2,'El','Greco','DNI',32348628,'el.greco@mail.com','Belgrano',153,NULL,NULL,'Santiago del Estero','5000'),(3,'Vincent','Van Goth','DNI',11385978,'vincent@mail.com','General Paz',121,'E','1',' Buenos Aires','5000'),(4,'Eugene','Delacroix','DNI',10445578,'eugene@mail.com','Santa Rosa',21,NULL,NULL,'Cordoba','5000'),(5,'Jackson','Pollock','DNI',14395677,'jackson.pollock@mail.com','Humberto Primero',214,'C','8','Salta','5000'),(6,'Mark','Rothko','DNI',13568749,'rothko@mail.com','Colon',2536,NULL,NULL,'Jujuy','5000'),(7,'Gustave','Courbet','DNI',11284658,'courbet@mail.com','Entre Rios',11,'D','5','Jujuy','5000'),(8,'Gerardo','Gomez','DNI',12345878,'ggomez@mail.com','Colon',1221,'A','3','Cordoba','5000'),(9,'Edouard','Manet','DNI',32358628,'manet@mail.com','Belgrano',153,NULL,NULL,'Santiago del Estero','5000'),(10,'Claude','Monet','DNI',10385978,'konet@mail.com','General Paz',121,'E','1',' Buenos Aires','5000'),(11,'Leonardo','Da Vinci','DNI',9445578,'frias@mail.com','Santa Rosa',21,NULL,NULL,'Cordoba','5000'),(12,'Gutav','Klint','DNI',30395677,'klint@mail.com','Humberto Primero',214,'C','8','Salta','5000'),(13,'Pablo','Picasso','DNI',3568749,'ppicasso@mail.com','Colon',2536,NULL,NULL,'Jujuy','5000'),(14,'Henry','Matisse','DNI',27284658,'matisse@mail.com','Entre Rios',11,'D','5','Jujuy','5000');
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tr_audit_table_cliente` AFTER INSERT ON `cliente` FOR EACH ROW BEGIN
	INSERT INTO master_table_audit 
    (table_audit_name,  
	user_name, 
	inserts, 
	cliente_id)
    VALUES
    (
    'cliente', 
    USER(), 
    TRUE, 
    new.cliente_id    
    );
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tr_audit_table_d_cliente` AFTER DELETE ON `cliente` FOR EACH ROW BEGIN
	INSERT INTO master_table_audit 
    (table_audit_name,  
	user_name, 
	deletes, 
	cliente_id)
    VALUES
    (
    'cliente', 
    USER(), 
    TRUE, 
    old.cliente_id    
    );
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `compra`
--

DROP TABLE IF EXISTS `compra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `compra` (
  `compra_id` int NOT NULL AUTO_INCREMENT,
  `cliente_id` int NOT NULL,
  `fecha_compra` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `total` decimal(9,2) DEFAULT NULL,
  PRIMARY KEY (`compra_id`),
  KEY `cliente_id` (`cliente_id`),
  CONSTRAINT `compra_ibfk_1` FOREIGN KEY (`cliente_id`) REFERENCES `cliente` (`cliente_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compra`
--

LOCK TABLES `compra` WRITE;
/*!40000 ALTER TABLE `compra` DISABLE KEYS */;
INSERT INTO `compra` VALUES (1,1,'2024-08-10 03:13:20',NULL),(2,5,'2024-08-10 03:13:20',NULL),(3,2,'2024-08-10 03:13:20',NULL),(4,3,'2024-08-10 03:13:20',NULL),(5,1,'2024-08-10 03:13:20',NULL),(6,7,'2024-08-10 03:13:20',NULL),(7,3,'2024-08-10 03:13:20',NULL),(8,4,'2024-08-10 03:13:20',NULL),(9,6,'2024-08-10 03:13:20',NULL),(10,10,'2024-08-10 03:13:20',NULL);
/*!40000 ALTER TABLE `compra` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tr_audit_table_compra` AFTER INSERT ON `compra` FOR EACH ROW BEGIN
	INSERT INTO master_table_audit 
    (table_audit_name,  
	user_name, 
	inserts,
    cliente_id,
	compra_id)
    VALUES
    (
    'compra', 
    USER(), 
    TRUE, 
    new.cliente_id,
    new.compra_id
    );
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tr_audit_table_d_compra` AFTER DELETE ON `compra` FOR EACH ROW BEGIN
	INSERT INTO master_table_audit 
    (table_audit_name,  
	user_name, 
	deletes,
    cliente_id,
	compra_id)
    VALUES
    (
    'compra', 
    USER(), 
    TRUE, 
    old.cliente_id,
    old.compra_id
    );
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `empresa_entrega`
--

DROP TABLE IF EXISTS `empresa_entrega`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empresa_entrega` (
  `empresa_entrega_id` int NOT NULL AUTO_INCREMENT,
  `nombre_empresa` varchar(50) DEFAULT NULL,
  `precio_km` decimal(9,2) DEFAULT NULL,
  `fecha_alta` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`empresa_entrega_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empresa_entrega`
--

LOCK TABLES `empresa_entrega` WRITE;
/*!40000 ALTER TABLE `empresa_entrega` DISABLE KEYS */;
INSERT INTO `empresa_entrega` VALUES (1,'Transporte El Loco',20.00,'2024-08-10 03:13:20'),(2,'Entregas Siempre Tarde SA',22.00,'2024-08-10 03:13:20');
/*!40000 ALTER TABLE `empresa_entrega` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tr_audit_table_empresa_entrega` AFTER INSERT ON `empresa_entrega` FOR EACH ROW BEGIN
	INSERT INTO master_table_audit 
    (table_audit_name,  
	user_name, 
	inserts, 
	empresa_entrega_id)
    VALUES
    (
    'empresa_entrega', 
    USER(), 
    TRUE, 
    new.empresa_entrega_id    
    );
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tr_audit_table_d_empresa_entrega` AFTER DELETE ON `empresa_entrega` FOR EACH ROW BEGIN
	INSERT INTO master_table_audit 
    (table_audit_name,  
	user_name, 
	deletes, 
	empresa_entrega_id)
    VALUES
    (
    'empresa_entrega', 
    USER(), 
    TRUE, 
    old.empresa_entrega_id    
    );
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `envio`
--

DROP TABLE IF EXISTS `envio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `envio` (
  `envio_id` int NOT NULL AUTO_INCREMENT,
  `empresa_entrega_id` int NOT NULL,
  `compra_id` int NOT NULL,
  `kilometros` decimal(10,0) NOT NULL,
  `fecha_envio` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `total_envio` decimal(9,2) NOT NULL,
  PRIMARY KEY (`envio_id`),
  KEY `empresa_entrega_id` (`empresa_entrega_id`),
  KEY `compra_id` (`compra_id`),
  CONSTRAINT `envio_ibfk_1` FOREIGN KEY (`empresa_entrega_id`) REFERENCES `empresa_entrega` (`empresa_entrega_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `envio_ibfk_2` FOREIGN KEY (`compra_id`) REFERENCES `compra` (`compra_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `envio`
--

LOCK TABLES `envio` WRITE;
/*!40000 ALTER TABLE `envio` DISABLE KEYS */;
INSERT INTO `envio` VALUES (1,1,1,35,'2024-08-10 03:13:20',700.00),(2,1,2,18,'2024-08-10 03:13:20',360.00),(3,2,3,7,'2024-08-10 03:13:20',154.00),(4,1,4,9,'2024-08-10 03:13:20',180.00),(5,1,5,3,'2024-08-10 03:13:20',60.00),(6,2,6,4,'2024-08-10 03:13:20',88.00),(7,1,7,6,'2024-08-10 03:13:20',120.00);
/*!40000 ALTER TABLE `envio` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tr_audit_table_envio` AFTER INSERT ON `envio` FOR EACH ROW BEGIN
	INSERT INTO master_table_audit 
    (table_audit_name,  
	user_name, 
	inserts, 
	envio_id,
    empresa_entrega_id)
    VALUES
    (
    'envio', 
    USER(), 
    TRUE, 
    new.envio_id,
    new.empresa_entrega_id
    );
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tr_audit_table_d_envio` AFTER DELETE ON `envio` FOR EACH ROW BEGIN
	INSERT INTO master_table_audit 
    (table_audit_name,  
	user_name, 
	deletes, 
	envio_id,
    empresa_entrega_id)
    VALUES
    (
    'envio', 
    USER(), 
    TRUE, 
    old.envio_id,
    old.empresa_entrega_id
    );
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `lista_compra`
--

DROP TABLE IF EXISTS `lista_compra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lista_compra` (
  `lista_compra_id` int NOT NULL AUTO_INCREMENT,
  `compra_id` int NOT NULL,
  `producto_id` int NOT NULL,
  `cantidad_producto` int NOT NULL,
  `sub_total` decimal(9,2) NOT NULL,
  PRIMARY KEY (`lista_compra_id`),
  KEY `compra_id` (`compra_id`),
  KEY `producto_id` (`producto_id`),
  CONSTRAINT `lista_compra_ibfk_1` FOREIGN KEY (`compra_id`) REFERENCES `compra` (`compra_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `lista_compra_ibfk_2` FOREIGN KEY (`producto_id`) REFERENCES `producto` (`producto_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lista_compra`
--

LOCK TABLES `lista_compra` WRITE;
/*!40000 ALTER TABLE `lista_compra` DISABLE KEYS */;
INSERT INTO `lista_compra` VALUES (1,1,2,5,9398.25),(2,1,4,3,5694.03),(3,1,1,2,3376.50),(4,5,4,3,5694.03),(5,2,6,3,5040.75),(6,3,6,8,13442.00),(7,5,4,5,9490.05),(8,4,2,3,5638.95),(9,4,1,2,3376.50),(10,6,1,2,3376.50),(11,7,1,2,3376.50),(12,8,1,2,3376.50),(13,9,1,2,3376.50),(14,10,6,4,6721.00);
/*!40000 ALTER TABLE `lista_compra` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tr_audit_table_lista_compra` AFTER INSERT ON `lista_compra` FOR EACH ROW BEGIN
	INSERT INTO master_table_audit 
    (table_audit_name,  
	user_name, 
	inserts,
    lista_compra_id,
	compra_id,
    producto_id)
    VALUES
    (
    'lista_compra', 
    USER(), 
    TRUE, 
    new.lista_compra_id,
    new.compra_id,
    new.producto_id
    );
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `update_table_compra` AFTER INSERT ON `lista_compra` FOR EACH ROW BEGIN
	UPDATE masala.compra
		SET total = (SELECT SUM(sub_total) FROM lista_compra
	WHERE compra_id = new.compra_id)
			WHERE compra_id = new.compra_id
    ;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tr_audit_table_d_lista_compra` AFTER DELETE ON `lista_compra` FOR EACH ROW BEGIN
	INSERT INTO master_table_audit 
    (table_audit_name,  
	user_name, 
	deletes,
    lista_compra_id,
	compra_id,
    producto_id)
    VALUES
    (
    'lista_compra', 
    USER(), 
    TRUE, 
    old.lista_compra_id,
    old.compra_id,
    old.producto_id
    );
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `master_table_audit`
--

DROP TABLE IF EXISTS `master_table_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `master_table_audit` (
  `master_table_id` int NOT NULL AUTO_INCREMENT,
  `table_audit_name` varchar(50) NOT NULL,
  `user_name` varchar(100) NOT NULL,
  `date_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `deletes` tinyint(1) DEFAULT NULL,
  `updates` tinyint(1) DEFAULT NULL,
  `inserts` tinyint(1) DEFAULT NULL,
  `cliente_id` int DEFAULT NULL,
  `compra_id` int DEFAULT NULL,
  `empresa_entrega_id` int DEFAULT NULL,
  `envio_id` int DEFAULT NULL,
  `lista_compra_id` int DEFAULT NULL,
  `producto_id` int DEFAULT NULL,
  `producto_proveedor_id` int DEFAULT NULL,
  `proveedor_id` int DEFAULT NULL,
  PRIMARY KEY (`master_table_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `master_table_audit`
--

LOCK TABLES `master_table_audit` WRITE;
/*!40000 ALTER TABLE `master_table_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `master_table_audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `producto`
--

DROP TABLE IF EXISTS `producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `producto` (
  `producto_id` int NOT NULL AUTO_INCREMENT,
  `nombre_producto` varchar(50) NOT NULL,
  `descripcion` varchar(500) DEFAULT NULL,
  `precio_producto` decimal(9,2) NOT NULL,
  `stock` int NOT NULL,
  `stock_minimo` int NOT NULL,
  `fecha_alta` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`producto_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producto`
--

LOCK TABLES `producto` WRITE;
/*!40000 ALTER TABLE `producto` DISABLE KEYS */;
INSERT INTO `producto` VALUES (1,'Miles Davis Kind of Blue','',1688.25,4,2,'2024-08-10 03:13:20'),(2,'Bill Evans at the Villaga Vanguard','',1879.65,2,5,'2024-08-10 03:13:20'),(3,'Giant Step John Coltrane','',1778.75,4,2,'2024-08-10 03:13:20'),(4,'Charlie Parker Standards','',1898.01,4,2,'2024-08-10 03:13:20'),(5,'Headhunters Herbie Hancock','',1956.00,6,2,'2024-08-10 03:13:20'),(6,'Largo Brad Melhdau','',1680.25,5,2,'2024-08-10 03:13:20');
/*!40000 ALTER TABLE `producto` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tr_audit_table_producto` AFTER INSERT ON `producto` FOR EACH ROW BEGIN
	INSERT INTO master_table_audit 
    (table_audit_name,  
	user_name, 
	inserts, 
	producto_id)
    VALUES
    (
    'producto', 
    USER(), 
    TRUE, 
    new.producto_id    
    );
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tr_audit_table_d_producto` AFTER DELETE ON `producto` FOR EACH ROW BEGIN
	INSERT INTO master_table_audit 
    (table_audit_name,  
	user_name, 
	deletes, 
	producto_id)
    VALUES
    (
    'producto', 
    USER(), 
    TRUE, 
    old.producto_id    
    );
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `producto_x_proveedor`
--

DROP TABLE IF EXISTS `producto_x_proveedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `producto_x_proveedor` (
  `producto_proveedor_id` int NOT NULL AUTO_INCREMENT,
  `proveedor_id` int NOT NULL,
  `producto_id` int NOT NULL,
  `cantidad_producto` int NOT NULL,
  `fecha_compra` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `sub_total` decimal(9,2) DEFAULT NULL,
  PRIMARY KEY (`producto_proveedor_id`),
  KEY `proveedor_id` (`proveedor_id`),
  KEY `producto_id` (`producto_id`),
  CONSTRAINT `producto_x_proveedor_ibfk_1` FOREIGN KEY (`proveedor_id`) REFERENCES `proveedor` (`proveedor_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `producto_x_proveedor_ibfk_2` FOREIGN KEY (`producto_id`) REFERENCES `producto` (`producto_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producto_x_proveedor`
--

LOCK TABLES `producto_x_proveedor` WRITE;
/*!40000 ALTER TABLE `producto_x_proveedor` DISABLE KEYS */;
INSERT INTO `producto_x_proveedor` VALUES (25,1,3,25,'2024-08-10 03:13:20',14650.00),(26,1,1,25,'2024-08-10 03:13:20',11568.00),(27,2,4,25,'2024-08-10 03:13:20',16200.00),(28,1,2,25,'2024-08-10 03:13:20',13846.00),(29,2,1,25,'2024-08-10 03:13:20',17258.00),(30,1,5,25,'2024-08-10 03:13:20',13664.00);
/*!40000 ALTER TABLE `producto_x_proveedor` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tr_audit_table_producto_x_proveedor` AFTER INSERT ON `producto_x_proveedor` FOR EACH ROW BEGIN
	INSERT INTO master_table_audit 
    (table_audit_name,  
	user_name, 
	inserts, 
	producto_proveedor_id,
    proveedor_id,
    producto_id)
    VALUES
    (
    'producto_x_proveedor', 
    USER(), 
    TRUE, 
    new.producto_proveedor_id,
    new.proveedor_id,
    new.producto_id
    );
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tr_audit_table_d_producto_x_proveedor` AFTER DELETE ON `producto_x_proveedor` FOR EACH ROW BEGIN
	INSERT INTO master_table_audit 
    (table_audit_name,  
	user_name, 
	deletes, 
	producto_proveedor_id,
    proveedor_id,
    producto_id)
    VALUES
    (
    'producto_x_proveedor', 
    USER(), 
    TRUE, 
    old.producto_proveedor_id,
    old.proveedor_id,
    old.producto_id
    );
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `proveedor`
--

DROP TABLE IF EXISTS `proveedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proveedor` (
  `proveedor_id` int NOT NULL AUTO_INCREMENT,
  `nombre_proveedor` varchar(150) DEFAULT NULL,
  `fecha_alta` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `direccion` varchar(150) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `ciudad` varchar(150) DEFAULT NULL,
  `provincia` varchar(150) DEFAULT NULL,
  `telefono` int DEFAULT NULL,
  PRIMARY KEY (`proveedor_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveedor`
--

LOCK TABLES `proveedor` WRITE;
/*!40000 ALTER TABLE `proveedor` DISABLE KEYS */;
INSERT INTO `proveedor` VALUES (1,'Sorny International','2024-08-10 03:13:20','Calle falsa 123','Sorny@mail.com','NYC','NY',NULL),(2,'Universal','2024-08-10 03:13:20','Calle falsa 356','uniuni@gmail.com','L.A','California',NULL);
/*!40000 ALTER TABLE `proveedor` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tr_audit_table_proveedor` AFTER INSERT ON `proveedor` FOR EACH ROW BEGIN
	INSERT INTO master_table_audit 
    (table_audit_name,  
	user_name, 
	inserts, 
	proveedor_id)
    VALUES
    (
    'proveedor', 
    USER(), 
    TRUE, 
    new.proveedor_id    
    );
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tr_audit_table_d_proveedor` AFTER DELETE ON `proveedor` FOR EACH ROW BEGIN
	INSERT INTO master_table_audit 
    (table_audit_name,  
	user_name, 
	deletes, 
	proveedor_id)
    VALUES
    (
    'proveedor', 
    USER(), 
    TRUE, 
    old.proveedor_id    
    );
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Temporary view structure for view `v_lista_precios`
--

DROP TABLE IF EXISTS `v_lista_precios`;
/*!50001 DROP VIEW IF EXISTS `v_lista_precios`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `v_lista_precios` AS SELECT 
 1 AS `nombre_producto`,
 1 AS `precio_lista`,
 1 AS `precio_mayorista`,
 1 AS `precio_minorista`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `v_ofertas_vendida_cliente`
--

DROP TABLE IF EXISTS `v_ofertas_vendida_cliente`;
/*!50001 DROP VIEW IF EXISTS `v_ofertas_vendida_cliente`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `v_ofertas_vendida_cliente` AS SELECT 
 1 AS `producto_id`,
 1 AS `cantidad_producto`,
 1 AS `nombre_producto`,
 1 AS `fecha_compra`,
 1 AS `Cliente`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `v_ofertas_vendidas_mes`
--

DROP TABLE IF EXISTS `v_ofertas_vendidas_mes`;
/*!50001 DROP VIEW IF EXISTS `v_ofertas_vendidas_mes`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `v_ofertas_vendidas_mes` AS SELECT 
 1 AS `producto_id`,
 1 AS `cantidad_producto`,
 1 AS `nombre_producto`,
 1 AS `fecha_compra`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `v_producto_cliente`
--

DROP TABLE IF EXISTS `v_producto_cliente`;
/*!50001 DROP VIEW IF EXISTS `v_producto_cliente`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `v_producto_cliente` AS SELECT 
 1 AS `productos`,
 1 AS `cantidad`,
 1 AS `fecha`,
 1 AS `cliente`,
 1 AS `total`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `v_producto_proveedor`
--

DROP TABLE IF EXISTS `v_producto_proveedor`;
/*!50001 DROP VIEW IF EXISTS `v_producto_proveedor`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `v_producto_proveedor` AS SELECT 
 1 AS `codigo`,
 1 AS `productos`,
 1 AS `proveedor`,
 1 AS `fecha`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping events for database 'vynil'
--

--
-- Dumping routines for database 'vynil'
--
/*!50003 DROP FUNCTION IF EXISTS `f_aleatoio` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `f_aleatoio`(min INT, max INT) RETURNS int
    DETERMINISTIC
BEGIN
		DECLARE aleatorio INT;
        SET aleatorio = (SELECT FLOOR(RAND() * (max - min)) + min );
        
        RETURN aleatorio ;
    END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `f_iva` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `f_iva`(precio DECIMAL(7,2)) RETURNS decimal(7,2)
    DETERMINISTIC
BEGIN
	DECLARE iva DECIMAL(3,2);
    DECLARE precio_con_iva DECIMAL(7,2);
    SET iva = 1.21;
    SET precio_con_iva = precio * iva;
RETURN precio_con_iva ;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `f_nombreCompleto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `f_nombreCompleto`(nombre VARCHAR(50), apellido VARCHAR(50)) RETURNS varchar(200) CHARSET utf8mb4
    DETERMINISTIC
BEGIN

	DECLARE nombre_completo VARCHAR(200);
    SET nombre_completo = CONCAT(nombre, ',', apellido);

RETURN nombre_completo;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `f_total_compra` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `f_total_compra`(in_producto_id INT, cantidad_producto INT) RETURNS decimal(7,2)
    READS SQL DATA
BEGIN
	DECLARE precio_producto DECIMAL(7,2);
    DECLARE total DECIMAL(7,2);
    SET precio_producto = (SELECT p.precio_producto FROM producto AS p WHERE p.producto_id = in_producto_id);
    SET total = precio_producto * cantidad_producto;
   
	RETURN total ;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `f_total_delivery` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `f_total_delivery`(in_empresa_entrega_id INT, kilometros DECIMAL) RETURNS decimal(7,2)
    READS SQL DATA
BEGIN
	DECLARE precio_km DECIMAL(7,2);
    DECLARE total DECIMAL(7,2);
    SET precio_km = (
		SELECT emp.precio_km 
		FROM empresa_entrega AS emp 
		WHERE emp.empresa_entrega_id = in_empresa_entrega_id
    );
    SET total = kilometros * precio_km;
   
	RETURN total ;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `precio_X_mayor` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `precio_X_mayor`(precio DECIMAL(7,2)) RETURNS decimal(7,2)
    DETERMINISTIC
BEGIN
	DECLARE mayor DECIMAL(3,2);
    DECLARE precio_por_mayor DECIMAL(7,2);
    SET mayor = 1.16 ;
    SET precio_por_mayor = precio * mayor;

RETURN precio_por_mayor;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `precio_X_menor` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `precio_X_menor`(precio DECIMAL(7,2)) RETURNS decimal(7,2)
    DETERMINISTIC
BEGIN
	DECLARE menor DECIMAL(3,2);
    DECLARE precio_por_menor DECIMAL(7,2);
    SET menor = 1.31 ;
    SET precio_por_menor = precio * menor;

RETURN precio_por_menor;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_carga_stock` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_carga_stock`(IN producto_id INT, IN cantidad_producto INT)
BEGIN
	UPDATE masala.producto AS p
		SET p.stock = p.stock + cantidad_producto
        WHERE p.producto_id = producto_id;	

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_order_by_param` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_order_by_param`(IN column_param VARCHAR(50), in table_param VARCHAR(50), IN order_param BOOLEAN)
BEGIN
	SET @ascendent = 'ASC';
    SET @descendent = 'DESC';
	IF order_param = 1 THEN
		SET @order_by = CONCAT('ORDER BY ',column_param, ' ', @ascendent);
        SELECT @order_by;
	ELSE 
		SET @order_by = CONCAT('ORDER BY ', column_param, ' ', @descendent);        
	END IF;
	
    SET @consult = CONCAT('SELECT * FROM ', table_param, ' ', @order_by);
		SELECT @consult;
    
    PREPARE querySQL FROM @consult;
    EXECUTE querySQL;
    
    DEALLOCATE PREPARE querySQL;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_verificacion_stock` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_verificacion_stock`(IN compra_id INT, IN in_producto_id INT, IN cantidad_producto INT)
BEGIN
	SET @stock = (SELECT p.stock FROM producto AS p WHERE producto_id = in_producto_id);
    SET @stock_minimo = (SELECT p.stock_minimo FROM producto AS p WHERE producto_id = in_producto_id);
    
    IF @stock <= @stock_minimo THEN
		INSERT INTO producto_x_proveedor (proveedor_id, producto_id, cantidad_producto, sub_total)
			VALUES (f_aleatorio(1,2), in_producto_id, 25, f_total_compra(in_producto_id, 25));		
	ELSEIF (@stock - cantidad_producto) >= 0 THEN
		
        INSERT INTO lista_compra (compra_id, producto_id, cantidad_producto, sub_total) 
        VALUE (compra_id, in_producto_id, cantidad_producto, f_total_compra(in_producto_id, cantidad_producto));
        
        UPDATE producto AS p SET p.stock = @stock_update WHERE p.producto_id = in_producto_id;
        
		IF @stock <= @stock_minimo THEN
			INSERT INTO producto_x_proveedor (proveedor_id, producto_id, cantidad_producto, sub_total)
			VALUES (f_aleatorio(1,3), in_producto_id, 25, f_total_compra(in_producto_id, 25));
		END IF;
    ELSE 
		SELECT 'ERROR: no se pudo crear la compra indicado' AS message FROM DUAL;    
    END IF;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `v_lista_precios`
--

/*!50001 DROP VIEW IF EXISTS `v_lista_precios`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_lista_precios` AS select `producto`.`nombre_producto` AS `nombre_producto`,`f_iva`(`producto`.`precio_producto`) AS `precio_lista`,`precio_X_mayor`(`f_iva`(`producto`.`precio_producto`)) AS `precio_mayorista`,`precio_X_menor`(`f_iva`(`producto`.`precio_producto`)) AS `precio_minorista` from `producto` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_ofertas_vendida_cliente`
--

/*!50001 DROP VIEW IF EXISTS `v_ofertas_vendida_cliente`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_ofertas_vendida_cliente` AS select `lc`.`producto_id` AS `producto_id`,`lc`.`cantidad_producto` AS `cantidad_producto`,`p`.`nombre_producto` AS `nombre_producto`,`co`.`fecha_compra` AS `fecha_compra`,`f_nombrecompleto`(`cl`.`nombre`,`cl`.`apellido`) AS `Cliente` from (((`lista_compra` `lc` join `compra` `co` on((`lc`.`compra_id` = `co`.`compra_id`))) join `cliente` `cl` on((`co`.`cliente_id` = `cl`.`cliente_id`))) join `producto` `p` on((`lc`.`producto_id` = `p`.`producto_id`))) where ((`p`.`producto_id` = 1) and ((`lc`.`cantidad_producto` % 2) = 0)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_ofertas_vendidas_mes`
--

/*!50001 DROP VIEW IF EXISTS `v_ofertas_vendidas_mes`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_ofertas_vendidas_mes` AS select `lc`.`producto_id` AS `producto_id`,sum(`lc`.`cantidad_producto`) AS `cantidad_producto`,`p`.`nombre_producto` AS `nombre_producto`,`co`.`fecha_compra` AS `fecha_compra` from ((`lista_compra` `lc` join `compra` `co` on((`lc`.`compra_id` = `co`.`compra_id`))) join `producto` `p` on((`lc`.`producto_id` = `p`.`producto_id`))) where ((`p`.`producto_id` = 1) and (`co`.`fecha_compra` between '2022-10-01' and '2022-10-31')) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_producto_cliente`
--

/*!50001 DROP VIEW IF EXISTS `v_producto_cliente`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_producto_cliente` AS select `prod`.`nombre_producto` AS `productos`,`lc`.`cantidad_producto` AS `cantidad`,`co`.`fecha_compra` AS `fecha`,`f_nombreCompleto`(`cl`.`nombre`,`cl`.`apellido`) AS `cliente`,`lc`.`sub_total` AS `total` from (((`lista_compra` `lc` join `compra` `co` on((`lc`.`compra_id` = `co`.`compra_id`))) join `producto` `prod` on((`lc`.`producto_id` = `prod`.`producto_id`))) join `cliente` `cl` on((`co`.`cliente_id` = `cl`.`cliente_id`))) where ((`co`.`cliente_id` >= 1) and (`co`.`fecha_compra` between '2022-10-01' and '2022-10-31')) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_producto_proveedor`
--

/*!50001 DROP VIEW IF EXISTS `v_producto_proveedor`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_producto_proveedor` AS select `pxp`.`producto_id` AS `codigo`,`prod`.`nombre_producto` AS `productos`,`prov`.`nombre_proveedor` AS `proveedor`,`pxp`.`fecha_compra` AS `fecha` from ((`producto_x_proveedor` `pxp` join `proveedor` `prov` on((`pxp`.`proveedor_id` = `prov`.`proveedor_id`))) join `producto` `prod` on((`pxp`.`producto_id` = `prod`.`producto_id`))) where (`pxp`.`producto_id` >= 1) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-08-10  1:26:17
