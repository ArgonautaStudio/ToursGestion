-- MySQL dump 10.13  Distrib 5.7.12, for Win64 (x86_64)
--
-- Host: localhost    Database: marina
-- ------------------------------------------------------
-- Server version	5.7.17-log

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
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cliente` (
  `idCliente` int(11) NOT NULL AUTO_INCREMENT,
  `correo` varchar(200) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `apellido` varchar(200) NOT NULL,
  `telefono` mediumtext NOT NULL,
  `direccion` varchar(300) NOT NULL,
  PRIMARY KEY (`idCliente`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='Tabla de registro de un cliente y cantidad de personas que lo acompañaran \n';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (1,'roman_fg97@hotmail.com','Roman','Falcon ','9932138805','Montebello Calle 20-A #311-A por 23 y 25');
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `login`
--

DROP TABLE IF EXISTS `login`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `login` (
  `idLogIn` int(11) NOT NULL AUTO_INCREMENT,
  `correo` varchar(200) NOT NULL,
  `password` varchar(35) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `apellido` varchar(200) NOT NULL,
  `nivel` tinyint(1) NOT NULL,
  PRIMARY KEY (`idLogIn`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='Tabla en donde se almacenaran los datos de inicio de sesion de un administrador o un vendedor, asi como tambien su nivel  de acceso.\n';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `login`
--

LOCK TABLES `login` WRITE;
/*!40000 ALTER TABLE `login` DISABLE KEYS */;
INSERT INTO `login` VALUES (1,'foncho@gmail.com','pollito','Alberto','Fonco ',1),(2,'tronc@hotmail.com','pollita','Poncho','Troncho',0);
/*!40000 ALTER TABLE `login` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tour`
--

DROP TABLE IF EXISTS `tour`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tour` (
  `idTour` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(200) NOT NULL,
  `horario` time NOT NULL,
  `fecha` date NOT NULL,
  `capacidad` tinyint(4) NOT NULL,
  `precioAdulto` int(11) NOT NULL,
  `precioNino` int(11) NOT NULL,
  `descripcion` varchar(500) NOT NULL,
  `multimedia` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`idTour`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='Tabla para registrar los tours disponibles con precio fecha y capacidad\n';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tour`
--

LOCK TABLES `tour` WRITE;
/*!40000 ALTER TABLE `tour` DISABLE KEYS */;
INSERT INTO `tour` VALUES (1,'Paseo del tiburon','14:00:00','2017-09-05',20,1500,1000,'Paseo con tiburones ballena','git.gtas.co'),(2,'Paseo del cangrejo','14:00:00','2017-09-06',30,2500,1500,'Paseo con vista a isla Cangrejo','git.gtam.xa');
/*!40000 ALTER TABLE `tour` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vendedor`
--

DROP TABLE IF EXISTS `vendedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vendedor` (
  `idVendedor` int(11) NOT NULL AUTO_INCREMENT,
  `idLogIn` int(11) NOT NULL,
  `telefono` mediumtext NOT NULL,
  `direccion` varchar(300) DEFAULT NULL,
  `edad` int(11) DEFAULT NULL,
  `genero` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`idVendedor`,`idLogIn`),
  KEY `idLogIn_idx` (`idLogIn`),
  CONSTRAINT `idLogIn` FOREIGN KEY (`idLogIn`) REFERENCES `login` (`idLogIn`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='Tabla en donde se almacenaran los datos adicionales de un vendedor.\n';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vendedor`
--

LOCK TABLES `vendedor` WRITE;
/*!40000 ALTER TABLE `vendedor` DISABLE KEYS */;
INSERT INTO `vendedor` VALUES (1,2,'993213456','Colonia Hidalgo calle 20 num 30',30,1);
/*!40000 ALTER TABLE `vendedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vendido`
--

DROP TABLE IF EXISTS `vendido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vendido` (
  `idCliente` int(11) NOT NULL,
  `idTour` int(11) NOT NULL,
  `numpersonas` tinyint(4) NOT NULL,
  `pagado` tinyint(1) DEFAULT NULL,
  `cantNino` tinyint(4) DEFAULT NULL,
  `cantAdultos` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`idCliente`,`idTour`),
  KEY `IdTour_idx` (`idTour`),
  CONSTRAINT `IdTour` FOREIGN KEY (`idTour`) REFERENCES `tour` (`idTour`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `idCliente` FOREIGN KEY (`idCliente`) REFERENCES `cliente` (`idCliente`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tabla para relacionar clientes con los tours que han comprado y confirmar si han sido pagados.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vendido`
--

LOCK TABLES `vendido` WRITE;
/*!40000 ALTER TABLE `vendido` DISABLE KEYS */;
INSERT INTO `vendido` VALUES (1,1,3,0,1,2),(1,2,4,0,2,2);
/*!40000 ALTER TABLE `vendido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'marina'
--

--
-- Dumping routines for database 'marina'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-08-07 16:31:05
