CREATE DATABASE `Pizzeria` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin */ /*!80016 DEFAULT ENCRYPTION='N' */;

-- Pizzeria.Categoria definition
CREATE TABLE `Categoria` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
);

-- Pizzeria.Cliente definition
CREATE TABLE `Cliente` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL,
  `apellidos` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL,
  `direccion` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL,
  `codigo_postal` char(5) COLLATE utf8mb4_bin DEFAULT NULL,
  `localidad` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL,
  `provincia` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL,
  `telefono` varchar(15) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
);

-- Pizzeria.Tienda definition
CREATE TABLE `Tienda` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL,
  `direccion` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL,
  `codigo_postal` char(5) COLLATE utf8mb4_bin DEFAULT NULL,
  `localidad` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL,
  `provincia` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
);

-- Pizzeria.Empleado definition
CREATE TABLE `Empleado` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL,
  `apellidos` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL,
  `nif` char(9) COLLATE utf8mb4_bin DEFAULT NULL,
  `telefono` varchar(15) COLLATE utf8mb4_bin DEFAULT NULL,
  `tipo` varchar(45) COLLATE utf8mb4_bin DEFAULT NULL,
  `id_tienda` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_tienda_idx` (`id_tienda`),
  CONSTRAINT `id_tienda` FOREIGN KEY (`id_tienda`) REFERENCES `Tienda` (`id`)
);

-- Pizzeria.Comanda definition
CREATE TABLE `Comanda` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_cliente` int DEFAULT NULL,
  `id_tienda` int DEFAULT NULL,
  `fecha_hora` datetime(6) DEFAULT NULL,
  `a_domicilio` tinyint(1) DEFAULT NULL,
  `recogida_en_tienda` tinyint(1) DEFAULT NULL,
  `precio_total` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_cliente_idx` (`id_cliente`),
  KEY `id_tienda_idx` (`id_tienda`),
  CONSTRAINT `fk_comanda_cliente` FOREIGN KEY (`id_cliente`) REFERENCES `Cliente` (`id`),
  CONSTRAINT `fk_comanda_tienda` FOREIGN KEY (`id_tienda`) REFERENCES `Tienda` (`id`)
);

-- Pizzeria.Producto definition
CREATE TABLE `Producto` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_categoria` int DEFAULT NULL,
  `nombre` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL,
  `descripcion` text COLLATE utf8mb4_bin DEFAULT NULL,
  `imagen` blob,
  `precio` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_categoria_idx` (`id_categoria`),
  CONSTRAINT `id_categoria` FOREIGN KEY (`id_categoria`) REFERENCES `Categoria` (`id`)
);

-- Pizzeria.Detalle_comanda definition
CREATE TABLE `Detalle_comanda` (
  `id_comanda` int NOT NULL,
  `id_producto` int NOT NULL,
  `cantidad_productos` int NOT NULL,
  PRIMARY KEY (`id_comanda`, `id_producto`),
  KEY `id_comanda_idx` (`id_comanda`),
  KEY `id_producto_idx` (`id_producto`),
  CONSTRAINT `id_comanda` FOREIGN KEY (`id_comanda`) REFERENCES `Comanda` (`id`),
  CONSTRAINT `id_producto` FOREIGN KEY (`id_producto`) REFERENCES `Producto` (`id`)
);

-- Pizzeria.Domicilio definition
CREATE TABLE `Domicilio` (
  `id_comanda` int NOT NULL,
  `id_repartidor` int NOT NULL,
  `fecha_hora` timestamp(6) NULL DEFAULT NULL,
  PRIMARY KEY (`id_comanda`, `id_repartidor`),
  KEY `id_repartidor_idx` (`id_repartidor`),
  CONSTRAINT `fk_comanda` FOREIGN KEY (`id_comanda`) REFERENCES `Comanda` (`id`),
  CONSTRAINT `fk_repartidor` FOREIGN KEY (`id_repartidor`) REFERENCES `Empleado` (`id`)
);
