CREATE DATABASE  IF NOT EXISTS `dswii_pj` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `dswii_pj`;
-- MySQL dump 10.13  Distrib 8.0.22, for Win64 (x86_64)
--
-- Host: localhost    Database: dswii_pj
-- ------------------------------------------------------
-- Server version	8.0.22

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
-- Table structure for table `categoria`
--

DROP TABLE IF EXISTS `categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categoria` (
  `cod_categoria` int NOT NULL AUTO_INCREMENT,
  `nombre_categoria` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`cod_categoria`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria`
--

LOCK TABLES `categoria` WRITE;
/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;
INSERT INTO `categoria` VALUES (1,'Bebidas'),(2,'Snacks'),(7,'Electrodomésticos'),(8,'Medicamentos'),(9,'Lácteos'),(11,'Cuidado Personal'),(12,'Deportes'),(46,'gaseosas'),(47,'Zapatillas');
/*!40000 ALTER TABLE `categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `producto`
--

DROP TABLE IF EXISTS `producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `producto` (
  `cod_producto` int NOT NULL AUTO_INCREMENT,
  `nombre_producto` varchar(100) DEFAULT NULL,
  `precio` decimal(9,2) DEFAULT NULL,
  `stock` int DEFAULT NULL,
  `cod_categoria` int DEFAULT NULL,
  `cod_proveedor` int DEFAULT NULL,
  `imagen` text,
  PRIMARY KEY (`cod_producto`),
  KEY `FK01` (`cod_categoria`),
  KEY `FK02_idx` (`cod_proveedor`),
  CONSTRAINT `FK01` FOREIGN KEY (`cod_categoria`) REFERENCES `categoria` (`cod_categoria`),
  CONSTRAINT `FK02` FOREIGN KEY (`cod_proveedor`) REFERENCES `proveedor` (`cod_proveedor`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producto`
--

LOCK TABLES `producto` WRITE;
/*!40000 ALTER TABLE `producto` DISABLE KEYS */;
INSERT INTO `producto` VALUES (1,'INCA KOLA 3 LT',12.50,40,1,1,'https://cdn.discordapp.com/attachments/1121629434340970516/1121911342413119598/inca-kola-3-litros_web_1000x.png'),(2,'GASEOSA FANTA 3 LT',10.50,30,1,2,'https://cdn.discordapp.com/attachments/1121629434340970516/1121911574316191776/7750182220378.png'),(3,'PAPAS FRITAS INKA CHIPS BOLSA 142G',8.00,30,2,3,'https://plazavea.vteximg.com.br/arquivos/ids/22928417-1000-1000/20070825.jpg'),(8,'Paracetamol 1g',3.50,100,8,4,'https://cdn.shopify.com/s/files/1/0579/1947/1767/products/9342026347_345x@2x.png?v=1654017776'),(9,'GLORIA YOGURT BEBIBLE VAINILLA*185G',1.50,100,9,4,'https://aceleralastatic.nyc3.cdn.digitaloceanspaces.com/files/uploads/1499/1601096980-69-img-5118-jpg.jpg'),(10,'Zapatillas Naranjas Deportivas',166.50,25,12,4,'https://home.ripley.com.pe/Attachment/WOP_5/2084306792782/2084306792782-1.jpg'),(11,'Pan Integral bolsa x15 tajadas',20.50,50,2,2,'https://www.libreriahuequito.com/public/images/productos/default.png');
/*!40000 ALTER TABLE `producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proveedor`
--

DROP TABLE IF EXISTS `proveedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proveedor` (
  `cod_proveedor` int NOT NULL AUTO_INCREMENT,
  `nombre_proveedor` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`cod_proveedor`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveedor`
--

LOCK TABLES `proveedor` WRITE;
/*!40000 ALTER TABLE `proveedor` DISABLE KEYS */;
INSERT INTO `proveedor` VALUES (1,'Umbrella Industries'),(2,'Laboratorios Farmaceuticos Peruanos'),(3,'P&G'),(4,'Johnson y Johnson'),(15,'Laive SAC');
/*!40000 ALTER TABLE `proveedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rol`
--

DROP TABLE IF EXISTS `rol`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rol` (
  `id_rol` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  `id_usuario` int DEFAULT NULL,
  PRIMARY KEY (`id_rol`),
  KEY `id_rol_usuario_idx` (`id_usuario`),
  CONSTRAINT `id_rol_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rol`
--

LOCK TABLES `rol` WRITE;
/*!40000 ALTER TABLE `rol` DISABLE KEYS */;
INSERT INTO `rol` VALUES (1,'ROLE_ADMIN',1),(2,'ROLE_USER',1),(3,'ROLE_COMPRADOR',2),(4,'ROLE_COMPRADOR',3);
/*!40000 ALTER TABLE `rol` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `id_usuario` int NOT NULL AUTO_INCREMENT,
  `username` varchar(45) DEFAULT NULL,
  `password` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,'admin','$2a$10$gW7HKYXyi7cZWx3pX9iCZO0dN7D0vLyAtbIht30ZV0TukebSG2/tO'),(2,'user','$2a$10$gW7HKYXyi7cZWx3pX9iCZO0dN7D0vLyAtbIht30ZV0TukebSG2/tO'),(3,'juan','$2a$10$Mwv3vCVa6yYMCEub8qGmGOkMoSLt7mLofd2xwSqjF7nNhxClAkjyu');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `venta`
--

DROP TABLE IF EXISTS `venta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `venta` (
  `cod_venta` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) DEFAULT NULL,
  `precio` decimal(9,2) DEFAULT NULL,
  `cantidad` int DEFAULT NULL,
  PRIMARY KEY (`cod_venta`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `venta`
--

LOCK TABLES `venta` WRITE;
/*!40000 ALTER TABLE `venta` DISABLE KEYS */;
INSERT INTO `venta` VALUES (3,'PAPAS FRITAS INKA CHIPS BOLSA 142G',8.00,2),(4,'INCA KOLA 3 LT',12.50,2),(5,'Paracetamol 1g',3.50,10),(6,'PAPAS FRITAS INKA CHIPS BOLSA 142G',8.00,9),(7,'GLORIA YOGURT BEBIBLE VAINILLA*185G',1.50,5),(8,'GLORIA YOGURT BEBIBLE VAINILLA*185G',1.50,10),(9,'Zapatillas Naranjas Deportivas',166.50,2);
/*!40000 ALTER TABLE `venta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'dswii_pj'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-06-28 20:24:46
