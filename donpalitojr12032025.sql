-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Apr 05, 2025 at 04:20 AM
-- Server version: 8.0.30
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `donpalitojrbd`
--

-- --------------------------------------------------------

--
-- Table structure for table `calificaciones`
--

CREATE TABLE `calificaciones` (
  `idCalificacion` int NOT NULL,
  `idUsuario` int NOT NULL,
  `idProducto` int NOT NULL,
  `calificacion` int NOT NULL,
  `comentario` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `fecha` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `calificaciones`
--

INSERT INTO `calificaciones` (`idCalificacion`, `idUsuario`, `idProducto`, `calificacion`, `comentario`, `fecha`) VALUES
(1, 1036, 1, 5, 'Los palitos de cocteleros son deliciosos, perfectos para incluir en cualquier reunión.  ', '2025-03-19 02:26:00');

-- --------------------------------------------------------

--
-- Table structure for table `carrito`
--

CREATE TABLE `carrito` (
  `idCarrito` int NOT NULL,
  `idUsuario` int NOT NULL,
  `idProducto` int NOT NULL,
  `cantidad` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `carrito`
--

INSERT INTO `carrito` (`idCarrito`, `idUsuario`, `idProducto`, `cantidad`) VALUES
(1, 1, 1, 2),
(7, 3, 1, 90);

-- --------------------------------------------------------

--
-- Table structure for table `categorias`
--

CREATE TABLE `categorias` (
  `idCategoria` int NOT NULL,
  `nombreCategoria` varchar(100) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categorias`
--

INSERT INTO `categorias` (`idCategoria`, `nombreCategoria`) VALUES
(1, 'Palitos');

-- --------------------------------------------------------

--
-- Table structure for table `detallespedido`
--

CREATE TABLE `detallespedido` (
  `idDetalle` int NOT NULL,
  `idPedido` int NOT NULL,
  `idProducto` int NOT NULL,
  `cantidad` int NOT NULL,
  `precioUnitario` decimal(10,2) NOT NULL,
  `subtotal` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `detallespedido`
--

INSERT INTO `detallespedido` (`idDetalle`, `idPedido`, `idProducto`, `cantidad`, `precioUnitario`, `subtotal`) VALUES
(1, 123, 1, 2, 2500.00, 5000.00);

-- --------------------------------------------------------

--
-- Table structure for table `inventario`
--

CREATE TABLE `inventario` (
  `idInventario` int NOT NULL,
  `idProducto` int NOT NULL,
  `cantidadActual` int NOT NULL,
  `fechaActualizacion` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `inventario`
--

INSERT INTO `inventario` (`idInventario`, `idProducto`, `cantidadActual`, `fechaActualizacion`) VALUES
(1, 1, 9, '2025-03-19 02:02:52');

-- --------------------------------------------------------

--
-- Table structure for table `pedidos`
--

CREATE TABLE `pedidos` (
  `idPedido` int NOT NULL,
  `documento` varchar(10) COLLATE utf8mb4_general_ci NOT NULL,
  `fechaPedido` datetime NOT NULL,
  `estadoPedido` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `totalPedido` decimal(10,2) NOT NULL,
  `metodoPago` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `direccionEntrega` varchar(255) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pedidos`
--

INSERT INTO `pedidos` (`idPedido`, `documento`, `fechaPedido`, `estadoPedido`, `totalPedido`, `metodoPago`, `direccionEntrega`) VALUES
(1, '1036615535', '2025-03-19 20:41:16', 'Enviado', 10500.00, 'Transferencia', 'Calle 50 # 50 - 13');

-- --------------------------------------------------------

--
-- Table structure for table `productos`
--

CREATE TABLE `productos` (
  `idProducto` int NOT NULL,
  `nombreProducto` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `descripcionProducto` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `precioProducto` decimal(10,2) NOT NULL,
  `stockProducto` int NOT NULL,
  `imagenUrl` longblob NOT NULL,
  `estadoProducto` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `idCategoria` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `productos`
--

INSERT INTO `productos` (`idProducto`, `nombreProducto`, `descripcionProducto`, `precioProducto`, `stockProducto`, `imagenUrl`, `estadoProducto`, `idCategoria`) VALUES
(1, 'Palito Premium Puro Queso', 'Palito premium de queso mozzarella.', 2500.00, 10, '', 'Disponible', 1);

-- --------------------------------------------------------

--
-- Table structure for table `promociones`
--

CREATE TABLE `promociones` (
  `idPromocion` int NOT NULL,
  `idProducto` int NOT NULL,
  `descuento` decimal(5,2) NOT NULL,
  `codigo` varchar(10) COLLATE utf8mb4_general_ci NOT NULL,
  `fechaInicio` datetime NOT NULL,
  `fechaFin` datetime NOT NULL,
  `estadoPromocion` varchar(10) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `usuarios`
--

CREATE TABLE `usuarios` (
  `idUsuario` int NOT NULL,
  `documento` varchar(10) COLLATE utf8mb4_general_ci NOT NULL,
  `nombreCompleto` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `telefono` varchar(10) COLLATE utf8mb4_general_ci NOT NULL,
  `correo` varchar(200) COLLATE utf8mb4_general_ci NOT NULL,
  `contrasena` varchar(250) COLLATE utf8mb4_general_ci NOT NULL,
  `rol` varchar(15) COLLATE utf8mb4_general_ci NOT NULL,
  `estado` varchar(15) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `usuarios`
--

INSERT INTO `usuarios` (`idUsuario`, `documento`, `nombreCompleto`, `telefono`, `correo`, `contrasena`, `rol`, `estado`) VALUES
(1, '100', 'Andrea Arcila Cano', '3207194098', 'andreaac777@gmail.com', '12345', 'Cliente', 'Activo'),
(2, '1036458791', 'Ana Gil', '3104501040', 'ana3567@gmail.com', '$2b$10$mo7oaq.CBVFzqVpSvHRg/uwY5SSb.WqlczKVdJHmgQBpIMvWLmgoK', 'Cliente', 'Activo'),
(3, '1017200166', 'David Santamaria', '3052928524', 'davidutsuka@gmail.com', '$2b$10$XfNJ4jnM3TuvPu7wRiAR0O2MV4Yn3wN.ta2bOHk5f4MmyzEXjl2qC', 'Cliente', 'Activo');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `calificaciones`
--
ALTER TABLE `calificaciones`
  ADD PRIMARY KEY (`idCalificacion`),
  ADD UNIQUE KEY `idUsuario` (`idUsuario`),
  ADD UNIQUE KEY `idProducto` (`idProducto`);

--
-- Indexes for table `carrito`
--
ALTER TABLE `carrito`
  ADD PRIMARY KEY (`idCarrito`),
  ADD KEY `idProducto` (`idProducto`) USING BTREE,
  ADD KEY `idUsuario` (`idUsuario`) USING BTREE;

--
-- Indexes for table `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`idCategoria`),
  ADD UNIQUE KEY `nombreCategoria` (`nombreCategoria`);

--
-- Indexes for table `detallespedido`
--
ALTER TABLE `detallespedido`
  ADD PRIMARY KEY (`idDetalle`),
  ADD UNIQUE KEY `idPedido` (`idPedido`),
  ADD UNIQUE KEY `idProducto` (`idProducto`);

--
-- Indexes for table `inventario`
--
ALTER TABLE `inventario`
  ADD PRIMARY KEY (`idInventario`),
  ADD UNIQUE KEY `idProducto` (`idProducto`);

--
-- Indexes for table `pedidos`
--
ALTER TABLE `pedidos`
  ADD PRIMARY KEY (`idPedido`),
  ADD UNIQUE KEY `documento` (`documento`),
  ADD UNIQUE KEY `direccionEntrega` (`direccionEntrega`);

--
-- Indexes for table `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`idProducto`),
  ADD UNIQUE KEY `nombreProducto` (`nombreProducto`);

--
-- Indexes for table `promociones`
--
ALTER TABLE `promociones`
  ADD PRIMARY KEY (`idPromocion`),
  ADD UNIQUE KEY `idProducto` (`idProducto`),
  ADD UNIQUE KEY `codigo` (`codigo`);

--
-- Indexes for table `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`idUsuario`),
  ADD UNIQUE KEY `documento` (`documento`),
  ADD UNIQUE KEY `correo` (`correo`),
  ADD UNIQUE KEY `telefono` (`telefono`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `calificaciones`
--
ALTER TABLE `calificaciones`
  MODIFY `idCalificacion` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `carrito`
--
ALTER TABLE `carrito`
  MODIFY `idCarrito` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `categorias`
--
ALTER TABLE `categorias`
  MODIFY `idCategoria` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `detallespedido`
--
ALTER TABLE `detallespedido`
  MODIFY `idDetalle` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `inventario`
--
ALTER TABLE `inventario`
  MODIFY `idInventario` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `pedidos`
--
ALTER TABLE `pedidos`
  MODIFY `idPedido` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `productos`
--
ALTER TABLE `productos`
  MODIFY `idProducto` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `promociones`
--
ALTER TABLE `promociones`
  MODIFY `idPromocion` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `idUsuario` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
