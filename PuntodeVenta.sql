CREATE DATABASE  IF NOT EXISTS `mydb` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `mydb`;
-- MySQL dump 10.13  Distrib 5.6.17, for Win32 (x86)
--
-- Host: localhost    Database: mydb
-- ------------------------------------------------------
-- Server version	5.6.43-log

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
-- Table structure for table `almacen`
--

DROP TABLE IF EXISTS `almacen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `almacen` (
  `id_Almacen` int(11) NOT NULL,
  `Direccion` varchar(45) DEFAULT NULL,
  `Descripcion` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_Almacen`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `almacen`
--

LOCK TABLES `almacen` WRITE;
/*!40000 ALTER TABLE `almacen` DISABLE KEYS */;
/*!40000 ALTER TABLE `almacen` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cliente` (
  `id_Cliente` int(11) NOT NULL,
  `Nombre` varchar(45) DEFAULT NULL,
  `Apellido_Materno` varchar(45) DEFAULT NULL,
  `Telefono` varchar(45) DEFAULT NULL,
  `Email` varchar(45) DEFAULT NULL,
  `RFC` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_Cliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `datos compra`
--

DROP TABLE IF EXISTS `datos compra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `datos compra` (
  `id_Datos_Compra` int(11) NOT NULL,
  `Fecha_Compra` varchar(45) DEFAULT NULL,
  `Total` varchar(45) DEFAULT NULL,
  `Pago_id_Pago` int(11) NOT NULL,
  `Proveedores_id_Proveedor` int(11) NOT NULL,
  PRIMARY KEY (`id_Datos_Compra`),
  KEY `fk_Datos Compra_Pago1_idx` (`Pago_id_Pago`),
  KEY `fk_Datos Compra_Proveedores1_idx` (`Proveedores_id_Proveedor`),
  CONSTRAINT `fk_Datos Compra_Pago1` FOREIGN KEY (`Pago_id_Pago`) REFERENCES `pago` (`id_Pago`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Datos Compra_Proveedores1` FOREIGN KEY (`Proveedores_id_Proveedor`) REFERENCES `proveedores` (`id_Proveedor`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `datos compra`
--

LOCK TABLES `datos compra` WRITE;
/*!40000 ALTER TABLE `datos compra` DISABLE KEYS */;
/*!40000 ALTER TABLE `datos compra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `datos de venta`
--

DROP TABLE IF EXISTS `datos de venta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `datos de venta` (
  `idDatos_Venta` int(11) NOT NULL,
  `Fecha_Venta` varchar(45) DEFAULT NULL,
  `Total` varchar(45) DEFAULT NULL,
  `Detalle de Venta_id_Detalle_Venta` int(11) NOT NULL,
  `Empleados_id_Empleado` int(11) NOT NULL,
  `Pago_id_Pago` int(11) NOT NULL,
  `Productos_id_Producto` int(11) NOT NULL,
  `Cliente_id_Cliente` int(11) NOT NULL,
  PRIMARY KEY (`idDatos_Venta`),
  KEY `fk_Datos de Venta_Detalle de Venta1_idx` (`Detalle de Venta_id_Detalle_Venta`),
  KEY `fk_Datos de Venta_Empleados1_idx` (`Empleados_id_Empleado`),
  KEY `fk_Datos de Venta_Pago1_idx` (`Pago_id_Pago`),
  KEY `fk_Datos de Venta_Productos1_idx` (`Productos_id_Producto`),
  KEY `fk_Datos de Venta_Cliente1_idx` (`Cliente_id_Cliente`),
  CONSTRAINT `fk_Datos de Venta_Cliente1` FOREIGN KEY (`Cliente_id_Cliente`) REFERENCES `cliente` (`id_Cliente`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Datos de Venta_Detalle de Venta1` FOREIGN KEY (`Detalle de Venta_id_Detalle_Venta`) REFERENCES `detalle de venta` (`id_Detalle_Venta`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Datos de Venta_Empleados1` FOREIGN KEY (`Empleados_id_Empleado`) REFERENCES `empleados` (`id_Empleado`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Datos de Venta_Pago1` FOREIGN KEY (`Pago_id_Pago`) REFERENCES `pago` (`id_Pago`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Datos de Venta_Productos1` FOREIGN KEY (`Productos_id_Producto`) REFERENCES `productos` (`id_Producto`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `datos de venta`
--

LOCK TABLES `datos de venta` WRITE;
/*!40000 ALTER TABLE `datos de venta` DISABLE KEYS */;
/*!40000 ALTER TABLE `datos de venta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalle compra`
--

DROP TABLE IF EXISTS `detalle compra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `detalle compra` (
  `id_Detalle_Compra` int(11) NOT NULL,
  `Cantidad` varchar(45) DEFAULT NULL,
  `Impuesto` varchar(45) DEFAULT NULL,
  `Descuento` varchar(45) DEFAULT NULL,
  `Datos Compra_id_Datos_Compra` int(11) NOT NULL,
  `Productos_id_Producto` int(11) NOT NULL,
  PRIMARY KEY (`id_Detalle_Compra`),
  KEY `fk_Detalle Compra_Datos Compra1_idx` (`Datos Compra_id_Datos_Compra`),
  KEY `fk_Detalle Compra_Productos1_idx` (`Productos_id_Producto`),
  CONSTRAINT `fk_Detalle Compra_Datos Compra1` FOREIGN KEY (`Datos Compra_id_Datos_Compra`) REFERENCES `datos compra` (`id_Datos_Compra`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Detalle Compra_Productos1` FOREIGN KEY (`Productos_id_Producto`) REFERENCES `productos` (`id_Producto`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalle compra`
--

LOCK TABLES `detalle compra` WRITE;
/*!40000 ALTER TABLE `detalle compra` DISABLE KEYS */;
/*!40000 ALTER TABLE `detalle compra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalle de venta`
--

DROP TABLE IF EXISTS `detalle de venta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `detalle de venta` (
  `id_Detalle_Venta` int(11) NOT NULL,
  `Cantidad` varchar(45) DEFAULT NULL,
  `Impuesto` varchar(45) DEFAULT NULL,
  `Descuento` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_Detalle_Venta`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalle de venta`
--

LOCK TABLES `detalle de venta` WRITE;
/*!40000 ALTER TABLE `detalle de venta` DISABLE KEYS */;
/*!40000 ALTER TABLE `detalle de venta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalle inventario`
--

DROP TABLE IF EXISTS `detalle inventario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `detalle inventario` (
  `id_Detalle_Inventario` int(11) NOT NULL,
  `Cantidad_Existente` varchar(45) DEFAULT NULL,
  `Status` varchar(45) DEFAULT NULL,
  `Inventario_id_Inventario` int(11) NOT NULL,
  PRIMARY KEY (`id_Detalle_Inventario`),
  KEY `fk_Detalle Inventario_Inventario1_idx` (`Inventario_id_Inventario`),
  CONSTRAINT `fk_Detalle Inventario_Inventario1` FOREIGN KEY (`Inventario_id_Inventario`) REFERENCES `inventario` (`id_Inventario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalle inventario`
--

LOCK TABLES `detalle inventario` WRITE;
/*!40000 ALTER TABLE `detalle inventario` DISABLE KEYS */;
/*!40000 ALTER TABLE `detalle inventario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalle producto`
--

DROP TABLE IF EXISTS `detalle producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `detalle producto` (
  `id_Detalle_Producto` int(11) NOT NULL,
  `Condicion` varchar(45) DEFAULT NULL,
  `Productos_id_Producto` int(11) NOT NULL,
  `Marcas_id_Marca` int(11) NOT NULL,
  `Proveedores_id_Proveedor` int(11) NOT NULL,
  `Almacen_id_Almacen` int(11) NOT NULL,
  PRIMARY KEY (`id_Detalle_Producto`),
  KEY `fk_Detalle Producto_Productos1_idx` (`Productos_id_Producto`),
  KEY `fk_Detalle Producto_Marcas1_idx` (`Marcas_id_Marca`),
  KEY `fk_Detalle Producto_Proveedores1_idx` (`Proveedores_id_Proveedor`),
  KEY `fk_Detalle Producto_Almacen1_idx` (`Almacen_id_Almacen`),
  CONSTRAINT `fk_Detalle Producto_Almacen1` FOREIGN KEY (`Almacen_id_Almacen`) REFERENCES `almacen` (`id_Almacen`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Detalle Producto_Marcas1` FOREIGN KEY (`Marcas_id_Marca`) REFERENCES `marcas` (`id_Marca`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Detalle Producto_Productos1` FOREIGN KEY (`Productos_id_Producto`) REFERENCES `productos` (`id_Producto`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Detalle Producto_Proveedores1` FOREIGN KEY (`Proveedores_id_Proveedor`) REFERENCES `proveedores` (`id_Proveedor`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalle producto`
--

LOCK TABLES `detalle producto` WRITE;
/*!40000 ALTER TABLE `detalle producto` DISABLE KEYS */;
/*!40000 ALTER TABLE `detalle producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empleados`
--

DROP TABLE IF EXISTS `empleados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `empleados` (
  `id_Empleado` int(11) NOT NULL,
  `Nombre` varchar(45) DEFAULT NULL,
  `Apellido_Materno` varchar(45) DEFAULT NULL,
  `Apellido_Paterno` varchar(45) DEFAULT NULL,
  `Telefono` varchar(45) DEFAULT NULL,
  `Direccion` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_Empleado`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleados`
--

LOCK TABLES `empleados` WRITE;
/*!40000 ALTER TABLE `empleados` DISABLE KEYS */;
/*!40000 ALTER TABLE `empleados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventario`
--

DROP TABLE IF EXISTS `inventario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inventario` (
  `id_Inventario` int(11) NOT NULL,
  `Tipo_Inventario` varchar(45) DEFAULT NULL,
  `Fecha_Inventario` varchar(45) DEFAULT NULL,
  `Total_Inventario` varchar(45) DEFAULT NULL,
  `Almacen_id_Almacen` int(11) NOT NULL,
  `Empleados_id_Empleado` int(11) NOT NULL,
  PRIMARY KEY (`id_Inventario`),
  KEY `fk_Inventario_Almacen1_idx` (`Almacen_id_Almacen`),
  KEY `fk_Inventario_Empleados1_idx` (`Empleados_id_Empleado`),
  CONSTRAINT `fk_Inventario_Almacen1` FOREIGN KEY (`Almacen_id_Almacen`) REFERENCES `almacen` (`id_Almacen`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Inventario_Empleados1` FOREIGN KEY (`Empleados_id_Empleado`) REFERENCES `empleados` (`id_Empleado`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventario`
--

LOCK TABLES `inventario` WRITE;
/*!40000 ALTER TABLE `inventario` DISABLE KEYS */;
/*!40000 ALTER TABLE `inventario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `marcas`
--

DROP TABLE IF EXISTS `marcas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `marcas` (
  `id_Marca` int(11) NOT NULL,
  `Compatibilidad` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_Marca`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `marcas`
--

LOCK TABLES `marcas` WRITE;
/*!40000 ALTER TABLE `marcas` DISABLE KEYS */;
/*!40000 ALTER TABLE `marcas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pago`
--

DROP TABLE IF EXISTS `pago`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pago` (
  `id_Pago` int(11) NOT NULL,
  `Tipo_Pago` varchar(45) DEFAULT NULL,
  `Condicion` varchar(45) DEFAULT NULL,
  `Vigencia` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_Pago`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pago`
--

LOCK TABLES `pago` WRITE;
/*!40000 ALTER TABLE `pago` DISABLE KEYS */;
/*!40000 ALTER TABLE `pago` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productos`
--

DROP TABLE IF EXISTS `productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `productos` (
  `id_Producto` int(11) NOT NULL,
  `Descripcion` varchar(45) DEFAULT NULL,
  `Precio_Venta` varchar(45) DEFAULT NULL,
  `Precio_Mayoreo` varchar(45) DEFAULT NULL,
  `Precio_Compra` varchar(45) DEFAULT NULL,
  `Punto_Reorden` varchar(45) DEFAULT NULL,
  `Stock_Maximo` varchar(45) DEFAULT NULL,
  `Cantidad_Mayoreo` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_Producto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productos`
--

LOCK TABLES `productos` WRITE;
/*!40000 ALTER TABLE `productos` DISABLE KEYS */;
/*!40000 ALTER TABLE `productos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proveedores`
--

DROP TABLE IF EXISTS `proveedores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `proveedores` (
  `id_Proveedor` int(11) NOT NULL,
  `Telefono` varchar(45) DEFAULT NULL,
  `Nombre` varchar(45) DEFAULT NULL,
  `Email` varchar(45) DEFAULT NULL,
  `Direccion` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_Proveedor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveedores`
--

LOCK TABLES `proveedores` WRITE;
/*!40000 ALTER TABLE `proveedores` DISABLE KEYS */;
/*!40000 ALTER TABLE `proveedores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `servicios`
--

DROP TABLE IF EXISTS `servicios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `servicios` (
  `id_Servicio` int(11) NOT NULL,
  `Tipo_Servicio` varchar(45) DEFAULT NULL,
  `Costo` varchar(45) DEFAULT NULL,
  `Empleados_id_Empleado` int(11) NOT NULL,
  PRIMARY KEY (`id_Servicio`),
  KEY `fk_Servicios_Empleados1_idx` (`Empleados_id_Empleado`),
  CONSTRAINT `fk_Servicios_Empleados1` FOREIGN KEY (`Empleados_id_Empleado`) REFERENCES `empleados` (`id_Empleado`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `servicios`
--

LOCK TABLES `servicios` WRITE;
/*!40000 ALTER TABLE `servicios` DISABLE KEYS */;
/*!40000 ALTER TABLE `servicios` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-08-07 12:46:08
