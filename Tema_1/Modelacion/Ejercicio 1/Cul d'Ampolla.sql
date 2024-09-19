CREATE DATABASE `Cul d'Ampolla` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin */ /*!80016 DEFAULT ENCRYPTION='N' */;

-- `Cul d'Ampolla`.Cliente definition
CREATE TABLE `Cliente` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(65) COLLATE utf8mb4_bin DEFAULT NULL,
  `direccion` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `telefono` int DEFAULT NULL,
  `email` varchar(65) COLLATE utf8mb4_bin DEFAULT NULL,
  `fecha_registro` date DEFAULT NULL,
  `cliente_recomendado_por` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`cliente_recomendado_por`) REFERENCES `Cliente`(`id`)
);

-- `Cul d'Ampolla`.Proveedor definition
CREATE TABLE `Proveedor` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(65) COLLATE utf8mb4_bin DEFAULT NULL,
  `direccion` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `telefono` int DEFAULT NULL,
  `fax` int DEFAULT NULL,
  `nif` char(8) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
);

-- `Cul d'Ampolla`.Empleado definition
CREATE TABLE `Empleado` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(65) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
);

-- `Cul d'Ampolla`.Gafa definition
CREATE TABLE `Gafa` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_proveedor` int NOT NULL,
  `marca` varchar(65) COLLATE utf8mb4_bin DEFAULT NULL,
  `graduacion` float DEFAULT NULL,
  `tipo_montura` ENUM('redonda', 'cuadrada', 'aviador', 'otra') COLLATE utf8mb4_bin DEFAULT NULL,
  `color_montura` ENUM('negro', 'blanco', 'rojo', 'azul', 'otro') COLLATE utf8mb4_bin DEFAULT NULL,
  `color_cristal` ENUM('transparente', 'oscuro', 'polarizado', 'otro') COLLATE utf8mb4_bin DEFAULT NULL,
  `precio` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_proveedor` (`id_proveedor`),
  CONSTRAINT `id_proveedor` FOREIGN KEY (`id_proveedor`) REFERENCES `Proveedor` (`id`)
);

-- `Cul d'Ampolla`.Venta definition
CREATE TABLE `Venta` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_cliente` int NOT NULL,
  `id_empleado` int NOT NULL,
  `id_gafa` int NOT NULL,
  `cantidad_gafas` int DEFAULT 1,
  `fecha` varchar(45) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`id`, `id_empleado`, `id_cliente`),
  KEY `id_cliente_idx` (`id_cliente`),
  KEY `id_empleado_idx` (`id_empleado`),
  KEY `id_gafa_idx` (`id_gafa`),
  CONSTRAINT `id_cliente` FOREIGN KEY (`id_cliente`) REFERENCES `Cliente` (`id`),
  CONSTRAINT `id_empleado` FOREIGN KEY (`id_empleado`) REFERENCES `Empleado` (`id`),
  CONSTRAINT `id_gafa` FOREIGN KEY (`id_gafa`) REFERENCES `Gafa` (`id`)
);

