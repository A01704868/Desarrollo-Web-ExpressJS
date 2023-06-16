-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 09, 2021 at 05:44 AM
-- Server version: 10.4.18-MariaDB
-- PHP Version: 8.0.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `uma_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `bitacora`
--

CREATE TABLE `bitacora` (
  `bitacoraID` int(11) NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  `trasladoID` int(11) NOT NULL,
  `zonaID` int(11) NOT NULL,
  `cuentaID` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `bitacora`
--

INSERT INTO `bitacora` (`bitacoraID`, `fecha`, `trasladoID`, `zonaID`, `cuentaID`, `cantidad`) VALUES
(1, '2021-04-14 23:19:00', 7, 4, 1, 9),
(2, '2021-04-14 23:26:06', 7, 4, 1, 26),
(3, '2021-04-14 23:27:41', 7, 4, 1, 50),
(4, '2021-04-15 00:08:02', 6, 4, 1, 5),
(5, '2021-04-15 00:08:02', 6, 1, 1, 20),
(6, '2021-04-15 00:08:02', 6, 3, 1, 842),
(7, '2021-04-15 00:08:02', 6, 4, 1, 10),
(8, '2021-04-15 00:08:02', 6, 5, 1, 100),
(9, '2021-04-15 00:08:02', 6, 1, 1, 140),
(10, '2021-04-15 00:08:02', 6, 1, 1, 300),
(11, '2021-04-15 00:08:02', 6, 1, 1, 60),
(12, '2021-04-15 00:08:02', 6, 4, 1, 60),
(13, '2021-04-15 00:08:02', 6, 1, 1, 100),
(14, '2021-04-15 00:09:00', 6, 1, 3, 100),
(15, '2021-04-15 00:09:00', 6, 1, 3, 75),
(16, '2021-04-15 00:09:00', 6, 1, 3, 100),
(17, '2021-04-15 00:09:01', 6, 1, 3, 91),
(18, '2021-04-15 00:09:01', 6, 1, 3, 93),
(19, '2021-04-15 00:09:01', 6, 1, 3, 30),
(20, '2021-04-15 00:09:01', 6, 1, 3, 184),
(21, '2021-04-15 00:09:01', 6, 1, 3, 76),
(22, '2021-04-15 00:09:01', 6, 1, 3, 100),
(23, '2021-04-15 00:09:01', 6, 1, 3, 43),
(24, '2021-04-15 00:28:05', 7, 1, 3, 5),
(25, '2021-04-15 00:28:05', 7, 1, 3, 38),
(26, '2021-04-15 00:28:05', 7, 1, 3, 21),
(27, '2021-04-15 00:28:05', 7, 1, 3, 44),
(28, '2021-04-15 00:28:05', 7, 1, 3, 90),
(29, '2021-04-15 00:28:05', 7, 1, 3, 3);

-- --------------------------------------------------------

--
-- Table structure for table `bitacora_etapa`
--

CREATE TABLE `bitacora_etapa` (
  `Fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  `bitacoraID` int(11) NOT NULL,
  `etapaID` varchar(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `bitacora_etapa`
--

INSERT INTO `bitacora_etapa` (`Fecha`, `bitacoraID`, `etapaID`) VALUES
('2021-04-14 23:19:00', 1, 'MP'),
('2021-04-14 23:26:06', 2, 'MP'),
('2021-04-14 23:27:41', 3, 'MP'),
('2021-04-15 00:08:02', 4, 'MP'),
('2021-04-15 00:08:02', 5, 'MP'),
('2021-04-15 00:08:02', 6, 'MP'),
('2021-04-15 00:08:02', 7, 'MP'),
('2021-04-15 00:08:02', 8, 'MP'),
('2021-04-15 00:08:02', 9, 'MP'),
('2021-04-15 00:08:02', 10, 'MP'),
('2021-04-15 00:08:02', 11, 'MP'),
('2021-04-15 00:08:02', 12, 'MP'),
('2021-04-15 00:08:02', 13, 'MP'),
('2021-04-15 00:09:00', 14, 'MP'),
('2021-04-15 00:09:00', 15, 'MP'),
('2021-04-15 00:09:01', 16, 'MP'),
('2021-04-15 00:09:01', 17, 'MP'),
('2021-04-15 00:09:01', 18, 'MP'),
('2021-04-15 00:09:01', 19, 'MP'),
('2021-04-15 00:09:01', 20, 'MP'),
('2021-04-15 00:09:01', 21, 'MP'),
('2021-04-15 00:09:01', 22, 'MP'),
('2021-04-15 00:09:01', 23, 'MP'),
('2021-04-15 00:28:05', 24, 'MP'),
('2021-04-15 00:28:05', 25, 'MP'),
('2021-04-15 00:28:05', 26, 'MP'),
('2021-04-15 00:28:05', 27, 'MP'),
('2021-04-15 00:28:05', 28, 'MP'),
('2021-04-15 00:28:05', 29, 'MP');

-- --------------------------------------------------------

--
-- Table structure for table `cuentas`
--

CREATE TABLE `cuentas` (
  `cuentaID` int(11) NOT NULL,
  `correo` varchar(50) DEFAULT NULL,
  `nombre` varchar(50) NOT NULL,
  `contrasena` varchar(400) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `cuentas`
--

INSERT INTO `cuentas` (`cuentaID`, `correo`, `nombre`, `contrasena`) VALUES
(1, 'A01704868@itesm.mx', 'Alexander Delgado', '$2a$12$vt0MbOvrxWDzYvSQH6fKIunLq2TzFEKhkJwrpTOG18sceflWeETVm'),
(3, 'A01705071@itesm.mx', 'Rodolfo', '$2a$12$7Tno8W6yhb9e5vBZOR24V.OA38p10GaIYB4qap9Kah7JExZTNpK6a');

-- --------------------------------------------------------

--
-- Table structure for table `especie`
--

CREATE TABLE `especie` (
  `EspID` int(11) NOT NULL,
  `NombreEsp` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `especie`
--

INSERT INTO `especie` (`EspID`, `NombreEsp`) VALUES
(1, 'Echynocatus platyacantus'),
(2, 'Dasylirion acrotrichum'),
(3, 'Astrophytum ornatum'),
(4, 'Cephalocereus senilis'),
(5, 'Ferocactus histrix'),
(6, 'Mammillaria hahniana'),
(7, 'Mammillaria herrerae'),
(8, 'Mammillaria longimamma'),
(9, 'Mammillaria nana'),
(10, 'Mammillaria parkinsonii'),
(11, 'Mammillaria schiedeana'),
(12, 'Mammillaria schwarzii'),
(13, 'Mammillaria zeilmanniana'),
(14, 'Mammillaria zephyranthoides'),
(15, 'Stenocactus coptogonus'),
(16, 'Strombocactus disciformis'),
(17, 'Echynocatus grusonii'),
(18, 'Ferocactus pilosus');

-- --------------------------------------------------------

--
-- Table structure for table `etapa`
--

CREATE TABLE `etapa` (
  `etapaID` varchar(2) NOT NULL,
  `nombreEtapa` varchar(26) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `etapa`
--

INSERT INTO `etapa` (`etapaID`, `nombreEtapa`) VALUES
('LP', 'Lote Plantulas'),
('LS', 'Lote Semillas'),
('MP', 'Planta Madre'),
('P', 'Plantas');

-- --------------------------------------------------------

--
-- Table structure for table `permisos`
--

CREATE TABLE `permisos` (
  `permisosID` int(11) NOT NULL,
  `permiso` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `permisos`
--

INSERT INTO `permisos` (`permisosID`, `permiso`) VALUES
(1, 'editar'),
(2, 'escribir');

-- --------------------------------------------------------

--
-- Table structure for table `permisos_roles`
--

CREATE TABLE `permisos_roles` (
  `permisosID` int(11) NOT NULL,
  `rollID` int(11) NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `registro_especie`
--

CREATE TABLE `registro_especie` (
  `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  `bitacoraID` int(11) NOT NULL,
  `EspID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `registro_especie`
--

INSERT INTO `registro_especie` (`fecha`, `bitacoraID`, `EspID`) VALUES
('2021-04-14 23:25:30', 1, 1),
('2021-04-14 23:26:06', 2, 2),
('2021-04-14 23:27:41', 3, 5),
('2021-04-15 00:08:02', 4, 1),
('2021-04-15 00:08:02', 5, 2),
('2021-04-15 00:08:02', 6, 2),
('2021-04-15 00:08:02', 7, 2),
('2021-04-15 00:08:02', 8, 2),
('2021-04-15 00:08:02', 9, 3),
('2021-04-15 00:08:02', 10, 4),
('2021-04-15 00:08:02', 11, 5),
('2021-04-15 00:08:02', 12, 5),
('2021-04-15 00:08:02', 13, 6),
('2021-04-15 00:09:00', 14, 7),
('2021-04-15 00:09:00', 15, 8),
('2021-04-15 00:09:01', 16, 9),
('2021-04-15 00:09:01', 17, 10),
('2021-04-15 00:09:01', 18, 11),
('2021-04-15 00:09:01', 19, 12),
('2021-04-15 00:09:01', 20, 13),
('2021-04-15 00:09:01', 21, 14),
('2021-04-15 00:09:01', 22, 15),
('2021-04-15 00:09:01', 23, 16),
('2021-04-15 00:28:05', 24, 3),
('2021-04-15 00:28:05', 25, 4),
('2021-04-15 00:28:05', 26, 8),
('2021-04-15 00:28:05', 27, 10),
('2021-04-15 00:28:05', 28, 12),
('2021-04-15 00:28:05', 29, 14);

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `rollID` int(11) NOT NULL,
  `rol` varchar(13) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`rollID`, `rol`) VALUES
(1, 'administrador'),
(2, 'colaborador');

-- --------------------------------------------------------

--
-- Table structure for table `roles_cuentas`
--

CREATE TABLE `roles_cuentas` (
  `rollID` int(11) NOT NULL,
  `cuentaID` int(11) NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `traslado`
--

CREATE TABLE `traslado` (
  `trasladoID` int(11) NOT NULL,
  `razonTraslado` varchar(26) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `traslado`
--

INSERT INTO `traslado` (`trasladoID`, `razonTraslado`) VALUES
(1, 'venta'),
(2, 'traslado a plantulas'),
(3, 'traslado a plantas'),
(4, 'traslado de plantas madres'),
(5, 'donacion recibida'),
(6, 'comprada'),
(7, 'colecta'),
(8, 'donacion enviada'),
(9, 'muerte'),
(10, 'robo');

-- --------------------------------------------------------

--
-- Table structure for table `zonas`
--

CREATE TABLE `zonas` (
  `zonaID` int(11) NOT NULL,
  `nombreZona` varchar(26) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `zonas`
--

INSERT INTO `zonas` (`zonaID`, `nombreZona`) VALUES
(1, 'Invernadero 1'),
(2, 'Invernadero 2'),
(3, 'Malla Sombra'),
(4, 'Jardin Xenofilo 1'),
(5, 'Jardin Xenofilo 2'),
(6, 'Jardin Xenofilo 3'),
(7, 'Zona Siembra Intensiva');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bitacora`
--
ALTER TABLE `bitacora`
  ADD PRIMARY KEY (`bitacoraID`),
  ADD UNIQUE KEY `bitacoraID` (`bitacoraID`),
  ADD KEY `trasladoID` (`trasladoID`),
  ADD KEY `zonaID` (`zonaID`),
  ADD KEY `cuentaID` (`cuentaID`);

--
-- Indexes for table `bitacora_etapa`
--
ALTER TABLE `bitacora_etapa`
  ADD PRIMARY KEY (`Fecha`,`bitacoraID`,`etapaID`),
  ADD UNIQUE KEY `bitacoraID` (`bitacoraID`),
  ADD KEY `etapaID` (`etapaID`);

--
-- Indexes for table `cuentas`
--
ALTER TABLE `cuentas`
  ADD PRIMARY KEY (`cuentaID`),
  ADD UNIQUE KEY `cuentaID` (`cuentaID`);

--
-- Indexes for table `especie`
--
ALTER TABLE `especie`
  ADD PRIMARY KEY (`EspID`),
  ADD UNIQUE KEY `EspID` (`EspID`);

--
-- Indexes for table `etapa`
--
ALTER TABLE `etapa`
  ADD PRIMARY KEY (`etapaID`);

--
-- Indexes for table `permisos`
--
ALTER TABLE `permisos`
  ADD PRIMARY KEY (`permisosID`),
  ADD UNIQUE KEY `permisosID` (`permisosID`);

--
-- Indexes for table `permisos_roles`
--
ALTER TABLE `permisos_roles`
  ADD PRIMARY KEY (`permisosID`),
  ADD UNIQUE KEY `permisosID` (`permisosID`);

--
-- Indexes for table `registro_especie`
--
ALTER TABLE `registro_especie`
  ADD PRIMARY KEY (`bitacoraID`,`EspID`,`fecha`),
  ADD UNIQUE KEY `bitacoraID` (`bitacoraID`),
  ADD KEY `EspID` (`EspID`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`rollID`),
  ADD UNIQUE KEY `rollID` (`rollID`);

--
-- Indexes for table `roles_cuentas`
--
ALTER TABLE `roles_cuentas`
  ADD PRIMARY KEY (`rollID`,`cuentaID`,`fecha`),
  ADD KEY `cuentaID` (`cuentaID`);

--
-- Indexes for table `traslado`
--
ALTER TABLE `traslado`
  ADD PRIMARY KEY (`trasladoID`),
  ADD UNIQUE KEY `trasladoID` (`trasladoID`);

--
-- Indexes for table `zonas`
--
ALTER TABLE `zonas`
  ADD PRIMARY KEY (`zonaID`),
  ADD UNIQUE KEY `zonaID` (`zonaID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bitacora`
--
ALTER TABLE `bitacora`
  MODIFY `bitacoraID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `bitacora_etapa`
--
ALTER TABLE `bitacora_etapa`
  MODIFY `bitacoraID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `cuentas`
--
ALTER TABLE `cuentas`
  MODIFY `cuentaID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `especie`
--
ALTER TABLE `especie`
  MODIFY `EspID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `permisos_roles`
--
ALTER TABLE `permisos_roles`
  MODIFY `permisosID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `registro_especie`
--
ALTER TABLE `registro_especie`
  MODIFY `bitacoraID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `rollID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `traslado`
--
ALTER TABLE `traslado`
  MODIFY `trasladoID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `zonas`
--
ALTER TABLE `zonas`
  MODIFY `zonaID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bitacora`
--
ALTER TABLE `bitacora`
  ADD CONSTRAINT `bitacora_ibfk_1` FOREIGN KEY (`trasladoID`) REFERENCES `traslado` (`trasladoID`),
  ADD CONSTRAINT `bitacora_ibfk_2` FOREIGN KEY (`zonaID`) REFERENCES `zonas` (`zonaID`),
  ADD CONSTRAINT `bitacora_ibfk_3` FOREIGN KEY (`cuentaID`) REFERENCES `cuentas` (`cuentaID`);

--
-- Constraints for table `bitacora_etapa`
--
ALTER TABLE `bitacora_etapa`
  ADD CONSTRAINT `bitacora_etapa_ibfk_1` FOREIGN KEY (`bitacoraID`) REFERENCES `bitacora` (`bitacoraID`),
  ADD CONSTRAINT `bitacora_etapa_ibfk_2` FOREIGN KEY (`etapaID`) REFERENCES `etapa` (`etapaID`);

--
-- Constraints for table `registro_especie`
--
ALTER TABLE `registro_especie`
  ADD CONSTRAINT `registro_especie_ibfk_1` FOREIGN KEY (`bitacoraID`) REFERENCES `bitacora` (`bitacoraID`),
  ADD CONSTRAINT `registro_especie_ibfk_2` FOREIGN KEY (`EspID`) REFERENCES `especie` (`EspID`);

--
-- Constraints for table `roles_cuentas`
--
ALTER TABLE `roles_cuentas`
  ADD CONSTRAINT `roles_cuentas_ibfk_1` FOREIGN KEY (`rollID`) REFERENCES `roles` (`rollID`),
  ADD CONSTRAINT `roles_cuentas_ibfk_2` FOREIGN KEY (`cuentaID`) REFERENCES `cuentas` (`cuentaID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
