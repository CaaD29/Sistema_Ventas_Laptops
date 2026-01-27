CREATE DATABASE  IF NOT EXISTS "SistemaVentas" /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `SistemaVentas`;
-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: mysql-f4befb1-n00324471-543f.c.aivencloud.com    Database: SistemaVentas
-- ------------------------------------------------------
-- Server version	8.0.35

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
SET @MYSQLDUMP_TEMP_LOG_BIN = @@SESSION.SQL_LOG_BIN;
SET @@SESSION.SQL_LOG_BIN= 0;

--
-- GTID state at the beginning of the backup 
--

SET @@GLOBAL.GTID_PURGED=/*!80000 '+'*/ '0f38894d-eb4b-11f0-a7cc-4a1df467075e:1-19,
149379ec-ea58-11f0-8ed6-1a489bb15f39:1-42,
3d373bae-efc8-11f0-86e2-7271b790a4dc:1-28,
66e68a11-ea77-11f0-aa18-b685e37bfede:1-16,
944268bb-edb0-11f0-bbed-62c17c9b3939:1-33,
ec79cb5e-f0be-11f0-8715-0685ebf533a9:1-19';

--
-- Table structure for table `Clientes`
--

DROP TABLE IF EXISTS `Clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Clientes` (
  `id_cliente` varchar(50) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id_cliente`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Clientes`
--

LOCK TABLES `Clientes` WRITE;
/*!40000 ALTER TABLE `Clientes` DISABLE KEYS */;
INSERT INTO `Clientes` VALUES ('1','Cris','cristhian.andriu@gmail.com','983675546'),('575b464e','Manuel','manuelito@gmail.com','987456547'),('94bea3fb','Andres','andriu.daza@outlook.com','987546879'),('a154e2f4','Pedro','raincliff4@gmail.com','993827116'),('cfefd33f','Marco','christian.ayala@ico.com.pe','988774451');
/*!40000 ALTER TABLE `Clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Productos`
--

DROP TABLE IF EXISTS `Productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Productos` (
  `id_producto` varchar(50) NOT NULL,
  `nombre_producto` varchar(100) NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  `stock` int NOT NULL,
  `Estado` varchar(20) DEFAULT 'Activo',
  PRIMARY KEY (`id_producto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Productos`
--

LOCK TABLES `Productos` WRITE;
/*!40000 ALTER TABLE `Productos` DISABLE KEYS */;
INSERT INTO `Productos` VALUES ('1','Laptop Pro',1200.00,10,'Eliminado'),('2','Laptop ASUS',2000.00,5,'Eliminado'),('38e53d22','Laptop Asus Zenbook 14 OLED de 14\"',5699.00,6,'Activo'),('4f9affd2','Laptop Gamer HP OMEN MAX de 16\"',7500.00,6,'Activo'),('62024932','Laptop HP Pavilion',3000.00,5,'Eliminado'),('d68222c4','Laptop 2 en 1 HP Omnibook 5 Flip de 14\"',4000.00,5,'Activo');
/*!40000 ALTER TABLE `Productos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Ventas`
--

DROP TABLE IF EXISTS `Ventas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Ventas` (
  `id_venta` varchar(50) NOT NULL,
  `fecha` datetime DEFAULT CURRENT_TIMESTAMP,
  `id_cliente` varchar(50) DEFAULT NULL,
  `id_producto` varchar(50) DEFAULT NULL,
  `cantidad` int NOT NULL,
  `total` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id_venta`),
  KEY `Ventas_ibfk_1` (`id_cliente`),
  KEY `Ventas_ibfk_2` (`id_producto`),
  CONSTRAINT `Ventas_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `Clientes` (`id_cliente`),
  CONSTRAINT `Ventas_ibfk_2` FOREIGN KEY (`id_producto`) REFERENCES `Productos` (`id_producto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Ventas`
--

LOCK TABLES `Ventas` WRITE;
/*!40000 ALTER TABLE `Ventas` DISABLE KEYS */;
INSERT INTO `Ventas` VALUES ('1','2026-01-07 18:49:51',NULL,NULL,2,0.00),('1c0f643a','2026-01-12 12:36:10','94bea3fb','38e53d22',3,17097.00),('1fddd98f','2026-01-06 16:22:58','94bea3fb','d68222c4',2,8000.00),('1fe72c35','2026-01-10 13:01:50','94bea3fb','4f9affd2',2,15000.00),('2','2026-01-06 18:52:53','1','2',2,4000.00),('2247be58','2026-01-10 15:46:02','94bea3fb','62024932',5,15000.00),('3219d91d','2026-01-10 12:36:54','1','1',3,3600.00),('3415d3d9','2026-01-12 09:37:08','1','38e53d22',1,5699.00),('477d037c','2026-01-06 18:22:49','1','d68222c4',3,12000.00),('6f7ab815','2026-01-10 11:36:13',NULL,'1',3,3600.00),('72d24af7','2026-01-07 14:39:34','1','4f9affd2',1,7500.00),('79001c24','2026-01-10 11:37:15',NULL,NULL,2,0.00),('9a1e51af','2026-01-10 15:26:48','94bea3fb','2',5,10000.00),('bca56c30','2026-01-10 15:11:52','575b464e','62024932',3,9000.00),('d6828506','2026-01-09 16:06:54','a154e2f4','4f9affd2',3,22500.00),('f42820c7','2026-01-13 16:09:01','cfefd33f','d68222c4',1,4000.00);
/*!40000 ALTER TABLE `Ventas` ENABLE KEYS */;
UNLOCK TABLES;
SET @@SESSION.SQL_LOG_BIN = @MYSQLDUMP_TEMP_LOG_BIN;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-01-27 16:13:12
