-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 31, 2021 at 06:58 AM
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
-- Database: `uma_pruebas`
--

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
(3, 'A01705071@itesm.mx', 'Rodolfo', '$2a$12$7Tno8W6yhb9e5vBZOR24V.OA38p10GaIYB4qap9Kah7JExZTNpK6a'),
(4, 'uma@dehesasanisidro.com', 'audelio hernandez', '$2a$12$hPbf7B4TbIbsb.NgXrQ5O.ymDtTyaWbLvB5Tn1UcqFKk1Oo3spV1G');

-- --------------------------------------------------------

--
-- Table structure for table `especie`
--

CREATE TABLE `especie` (
  `EspID` int(11) NOT NULL,
  `NombreEsp` varchar(40) NOT NULL,
  `imagen` varchar(300) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `especie`
--

INSERT INTO `especie` (`EspID`, `NombreEsp`, `imagen`) VALUES
(1, 'Echinocactus platyacanthus', 'uploads\\E_plathyacanthus.jpg'),
(2, 'Dasylirion acrotrichum', 'uploads\\D_acrotichum.jpg'),
(3, 'Astrophytum ornatum', 'uploads\\A_ornatum.jpeg'),
(4, 'Cephalocereus senilis', 'uploads\\C_senilis.jpg'),
(5, 'Ferocactus histrix', 'uploads\\F_histrix.jpg'),
(6, 'Mammillaria hahniana', 'uploads\\M_hahniana.jpeg'),
(7, 'Mammillaria herrerae', NULL),
(8, 'Mammillaria longimamma', NULL),
(9, 'Mammillaria nana', NULL),
(10, 'Mammillaria parkinsonii', NULL),
(11, 'Mammillaria schiedeana', NULL),
(12, 'Mammillaria schwarzii', NULL),
(13, 'Mammillaria zeilmanniana', NULL),
(14, 'Mammillaria zephyranthoides', NULL),
(15, 'Stenocactus coptogonus', NULL),
(16, 'Strombocactus disciformis', NULL),
(17, 'Echinocactus grusonii', NULL),
(18, 'Ferocactus pilosus', NULL),
(21, 'Ematacantus', NULL),
(22, 'girasol', 'uploads\\917_download.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `loteplantula_especie`
--

CREATE TABLE `loteplantula_especie` (
  `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  `lotePlantulaID` int(11) NOT NULL,
  `EspID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `loteplantula_especie`
--

INSERT INTO `loteplantula_especie` (`fecha`, `lotePlantulaID`, `EspID`) VALUES
('2021-05-31 02:25:52', 1, 1),
('2021-05-31 02:25:52', 2, 1),
('2021-05-31 02:25:52', 3, 2),
('2021-05-31 02:25:52', 4, 2),
('2021-05-31 02:25:52', 5, 3),
('2021-05-31 02:25:52', 6, 3);

-- --------------------------------------------------------

--
-- Table structure for table `lotesemillas_especie`
--

CREATE TABLE `lotesemillas_especie` (
  `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  `loteSemillaID` int(11) NOT NULL,
  `EspID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `lotesemillas_especie`
--

INSERT INTO `lotesemillas_especie` (`fecha`, `loteSemillaID`, `EspID`) VALUES
('2021-05-31 02:27:14', 1, 1),
('2021-05-31 02:27:14', 2, 1),
('2021-05-31 02:27:14', 3, 2),
('2021-05-31 02:27:14', 4, 2),
('2021-05-31 02:27:14', 5, 3),
('2021-05-31 02:27:14', 6, 3);

-- --------------------------------------------------------

--
-- Table structure for table `lotesplantula`
--

CREATE TABLE `lotesplantula` (
  `lotePlantulaID` int(11) NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  `trasladoID` int(11) NOT NULL,
  `zonaID` int(11) NOT NULL,
  `cuentaID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `lotesplantula`
--

INSERT INTO `lotesplantula` (`lotePlantulaID`, `fecha`, `trasladoID`, `zonaID`, `cuentaID`) VALUES
(1, '2021-05-31 02:25:52', 6, 1, 3),
(2, '2021-05-31 02:25:52', 7, 1, 3),
(3, '2021-05-31 02:25:52', 6, 1, 3),
(4, '2021-05-31 02:25:52', 7, 1, 3),
(5, '2021-05-31 02:25:52', 6, 1, 3),
(6, '2021-05-31 02:25:52', 7, 1, 3);

-- --------------------------------------------------------

--
-- Table structure for table `lotessemillas`
--

CREATE TABLE `lotessemillas` (
  `loteSemillaID` int(11) NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  `trasladoID` int(11) NOT NULL,
  `zonaID` int(11) NOT NULL,
  `cuentaID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `lotessemillas`
--

INSERT INTO `lotessemillas` (`loteSemillaID`, `fecha`, `trasladoID`, `zonaID`, `cuentaID`) VALUES
(1, '2021-05-31 02:27:14', 6, 1, 3),
(2, '2021-05-31 02:27:14', 7, 1, 3),
(3, '2021-05-31 02:27:14', 6, 1, 3),
(4, '2021-05-31 02:27:14', 7, 1, 3),
(5, '2021-05-31 02:27:14', 6, 1, 3),
(6, '2021-05-31 02:27:14', 7, 1, 3);

-- --------------------------------------------------------

--
-- Stand-in structure for view `lotes_plantula`
-- (See below for the actual view)
--
CREATE TABLE `lotes_plantula` (
`NombreEsp` varchar(40)
,`cantidadLotesPlantulas` bigint(21)
);

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
-- Table structure for table `plantamadre_especie`
--

CREATE TABLE `plantamadre_especie` (
  `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  `plantaMadreID` int(11) NOT NULL,
  `EspID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `plantamadre_especie`
--

INSERT INTO `plantamadre_especie` (`fecha`, `plantaMadreID`, `EspID`) VALUES
('2021-05-31 02:16:38', 1, 1),
('2021-05-31 02:16:38', 2, 1),
('2021-05-31 02:16:38', 3, 2),
('2021-05-31 02:16:38', 4, 2),
('2021-05-31 02:16:38', 5, 3),
('2021-05-31 02:16:38', 6, 3);

-- --------------------------------------------------------

--
-- Table structure for table `plantas`
--

CREATE TABLE `plantas` (
  `plantaID` int(11) NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  `trasladoID` int(11) NOT NULL,
  `zonaID` int(11) NOT NULL,
  `cuentaID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `plantas`
--

INSERT INTO `plantas` (`plantaID`, `fecha`, `trasladoID`, `zonaID`, `cuentaID`) VALUES
(1, '2021-05-31 02:13:30', 6, 1, 3),
(2, '2021-05-31 02:13:30', 7, 1, 3),
(3, '2021-05-31 02:13:30', 6, 1, 3),
(4, '2021-05-31 02:13:30', 7, 1, 3),
(5, '2021-05-31 02:13:30', 6, 1, 3),
(6, '2021-05-31 02:13:30', 7, 1, 3),
(7, '2021-05-31 03:45:47', 7, 1, 3),
(8, '2021-05-31 03:45:47', 7, 1, 3),
(9, '2021-05-31 03:45:47', 7, 1, 3),
(10, '2021-05-31 03:45:47', 7, 1, 3),
(11, '2021-05-31 03:45:47', 7, 1, 3),
(12, '2021-05-31 03:45:47', 7, 1, 3),
(13, '2021-05-31 04:10:28', 7, 5, 1),
(14, '2021-05-31 04:13:43', 7, 5, 1),
(15, '2021-05-31 04:13:43', 7, 5, 1),
(16, '2021-05-31 04:13:43', 7, 5, 1);

-- --------------------------------------------------------

--
-- Table structure for table `plantasmadre`
--

CREATE TABLE `plantasmadre` (
  `plantaMadreID` int(11) NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  `trasladoID` int(11) NOT NULL,
  `zonaID` int(11) NOT NULL,
  `cuentaID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `plantasmadre`
--

INSERT INTO `plantasmadre` (`plantaMadreID`, `fecha`, `trasladoID`, `zonaID`, `cuentaID`) VALUES
(1, '2021-05-31 02:16:38', 6, 1, 3),
(2, '2021-05-31 02:16:38', 7, 1, 3),
(3, '2021-05-31 02:16:38', 6, 1, 3),
(4, '2021-05-31 02:16:38', 7, 1, 3),
(5, '2021-05-31 02:16:38', 6, 1, 3),
(6, '2021-05-31 02:16:38', 7, 1, 3);

-- --------------------------------------------------------

--
-- Stand-in structure for view `plantas_madre2`
-- (See below for the actual view)
--
CREATE TABLE `plantas_madre2` (
`NombreEsp` varchar(40)
,`cantidadPlantasMadre` bigint(21)
,`imagen` varchar(300)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `plantas_reproducidas`
-- (See below for the actual view)
--
CREATE TABLE `plantas_reproducidas` (
`NombreEsp` varchar(40)
,`cantidadPlantasReproducidas` bigint(21)
);

-- --------------------------------------------------------

--
-- Table structure for table `planta_especie`
--

CREATE TABLE `planta_especie` (
  `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  `plantaID` int(11) NOT NULL,
  `EspID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `planta_especie`
--

INSERT INTO `planta_especie` (`fecha`, `plantaID`, `EspID`) VALUES
('2021-05-31 02:13:30', 1, 1),
('2021-05-31 02:13:30', 2, 1),
('2021-05-31 02:13:30', 3, 2),
('2021-05-31 02:13:30', 4, 2),
('2021-05-31 02:13:30', 5, 3),
('2021-05-31 02:13:30', 6, 3),
('2021-05-31 03:45:47', 7, 4),
('2021-05-31 03:45:47', 8, 4),
('2021-05-31 03:45:47', 9, 4),
('2021-05-31 03:45:47', 10, 4),
('2021-05-31 03:45:47', 11, 6),
('2021-05-31 03:45:47', 12, 2),
('2021-05-31 04:10:28', 13, 4),
('2021-05-31 04:13:43', 14, 22),
('2021-05-31 04:13:43', 15, 22),
('2021-05-31 04:13:43', 16, 22);

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
-- Stand-in structure for view `tarjetas`
-- (See below for the actual view)
--
CREATE TABLE `tarjetas` (
`NombreEsp` varchar(40)
,`cantidadPlantasMadre` bigint(21)
,`cantidadPlantasReproducidas` bigint(21)
,`cantidadLotesPlantulas` bigint(21)
,`imagen` varchar(300)
);

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
(6, 'adquirida'),
(7, 'reproduccion'),
(8, 'donacion otorgada'),
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
(7, 'Zona Siembra Intensiva'),
(8, 'Invernadero 3');

-- --------------------------------------------------------

--
-- Structure for view `lotes_plantula`
--
DROP TABLE IF EXISTS `lotes_plantula`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `lotes_plantula`  AS SELECT `e`.`NombreEsp` AS `NombreEsp`, count(`lp`.`lotePlantulaID`) AS `cantidadLotesPlantulas` FROM ((`especie` `e` join `lotesplantula` `lp`) join `loteplantula_especie` `lpe`) WHERE `e`.`EspID` = `lpe`.`EspID` AND `lp`.`lotePlantulaID` = `lpe`.`lotePlantulaID` GROUP BY `e`.`EspID` ;

-- --------------------------------------------------------

--
-- Structure for view `plantas_madre2`
--
DROP TABLE IF EXISTS `plantas_madre2`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `plantas_madre2`  AS SELECT `e`.`NombreEsp` AS `NombreEsp`, count(`pm`.`plantaMadreID`) AS `cantidadPlantasMadre`, `e`.`imagen` AS `imagen` FROM ((`especie` `e` join `plantasmadre` `pm`) join `plantamadre_especie` `pme`) WHERE `e`.`EspID` = `pme`.`EspID` AND `pm`.`plantaMadreID` = `pme`.`plantaMadreID` GROUP BY `e`.`EspID` ;

-- --------------------------------------------------------

--
-- Structure for view `plantas_reproducidas`
--
DROP TABLE IF EXISTS `plantas_reproducidas`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `plantas_reproducidas`  AS SELECT `e`.`NombreEsp` AS `NombreEsp`, count(`p`.`plantaID`) AS `cantidadPlantasReproducidas` FROM ((`especie` `e` join `plantas` `p`) join `planta_especie` `pe`) WHERE `e`.`EspID` = `pe`.`EspID` AND `p`.`plantaID` = `pe`.`plantaID` AND `p`.`trasladoID` = '7' GROUP BY `e`.`EspID` ;

-- --------------------------------------------------------

--
-- Structure for view `tarjetas`
--
DROP TABLE IF EXISTS `tarjetas`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `tarjetas`  AS SELECT `plantas_madre2`.`NombreEsp` AS `NombreEsp`, `plantas_madre2`.`cantidadPlantasMadre` AS `cantidadPlantasMadre`, ifnull(`plantas_reproducidas`.`cantidadPlantasReproducidas`,0) AS `cantidadPlantasReproducidas`, ifnull(`lotes_plantula`.`cantidadLotesPlantulas`,0) AS `cantidadLotesPlantulas`, `plantas_madre2`.`imagen` AS `imagen` FROM ((`plantas_madre2` left join `plantas_reproducidas` on(`plantas_madre2`.`NombreEsp` = `plantas_reproducidas`.`NombreEsp`)) left join `lotes_plantula` on(`plantas_madre2`.`NombreEsp` = `lotes_plantula`.`NombreEsp`)) ;

--
-- Indexes for dumped tables
--

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
-- Indexes for table `loteplantula_especie`
--
ALTER TABLE `loteplantula_especie`
  ADD PRIMARY KEY (`lotePlantulaID`,`EspID`,`fecha`),
  ADD UNIQUE KEY `lotePlantulaID` (`lotePlantulaID`),
  ADD KEY `EspID` (`EspID`);

--
-- Indexes for table `lotesemillas_especie`
--
ALTER TABLE `lotesemillas_especie`
  ADD PRIMARY KEY (`loteSemillaID`,`EspID`,`fecha`),
  ADD UNIQUE KEY `loteSemillaID` (`loteSemillaID`),
  ADD KEY `EspID` (`EspID`);

--
-- Indexes for table `lotesplantula`
--
ALTER TABLE `lotesplantula`
  ADD PRIMARY KEY (`lotePlantulaID`),
  ADD UNIQUE KEY `lotePlantulaID` (`lotePlantulaID`),
  ADD KEY `trasladoID` (`trasladoID`),
  ADD KEY `zonaID` (`zonaID`),
  ADD KEY `cuentaID` (`cuentaID`);

--
-- Indexes for table `lotessemillas`
--
ALTER TABLE `lotessemillas`
  ADD PRIMARY KEY (`loteSemillaID`),
  ADD UNIQUE KEY `loteSemillaID` (`loteSemillaID`),
  ADD KEY `trasladoID` (`trasladoID`),
  ADD KEY `zonaID` (`zonaID`),
  ADD KEY `cuentaID` (`cuentaID`);

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
-- Indexes for table `plantamadre_especie`
--
ALTER TABLE `plantamadre_especie`
  ADD PRIMARY KEY (`plantaMadreID`,`EspID`,`fecha`),
  ADD UNIQUE KEY `plantaMadreID` (`plantaMadreID`),
  ADD KEY `EspID` (`EspID`);

--
-- Indexes for table `plantas`
--
ALTER TABLE `plantas`
  ADD PRIMARY KEY (`plantaID`),
  ADD UNIQUE KEY `plantaID` (`plantaID`),
  ADD KEY `trasladoID` (`trasladoID`),
  ADD KEY `zonaID` (`zonaID`),
  ADD KEY `cuentaID` (`cuentaID`);

--
-- Indexes for table `plantasmadre`
--
ALTER TABLE `plantasmadre`
  ADD PRIMARY KEY (`plantaMadreID`),
  ADD UNIQUE KEY `plantaMadreID` (`plantaMadreID`),
  ADD KEY `trasladoID` (`trasladoID`),
  ADD KEY `zonaID` (`zonaID`),
  ADD KEY `cuentaID` (`cuentaID`);

--
-- Indexes for table `planta_especie`
--
ALTER TABLE `planta_especie`
  ADD PRIMARY KEY (`plantaID`,`EspID`,`fecha`),
  ADD UNIQUE KEY `plantaID` (`plantaID`),
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
-- AUTO_INCREMENT for table `cuentas`
--
ALTER TABLE `cuentas`
  MODIFY `cuentaID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `especie`
--
ALTER TABLE `especie`
  MODIFY `EspID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `loteplantula_especie`
--
ALTER TABLE `loteplantula_especie`
  MODIFY `lotePlantulaID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `lotesemillas_especie`
--
ALTER TABLE `lotesemillas_especie`
  MODIFY `loteSemillaID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `lotesplantula`
--
ALTER TABLE `lotesplantula`
  MODIFY `lotePlantulaID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `lotessemillas`
--
ALTER TABLE `lotessemillas`
  MODIFY `loteSemillaID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `permisos_roles`
--
ALTER TABLE `permisos_roles`
  MODIFY `permisosID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `plantamadre_especie`
--
ALTER TABLE `plantamadre_especie`
  MODIFY `plantaMadreID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `plantas`
--
ALTER TABLE `plantas`
  MODIFY `plantaID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `plantasmadre`
--
ALTER TABLE `plantasmadre`
  MODIFY `plantaMadreID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `planta_especie`
--
ALTER TABLE `planta_especie`
  MODIFY `plantaID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

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
  MODIFY `zonaID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `loteplantula_especie`
--
ALTER TABLE `loteplantula_especie`
  ADD CONSTRAINT `loteplantula_especie_ibfk_1` FOREIGN KEY (`lotePlantulaID`) REFERENCES `lotesplantula` (`lotePlantulaID`),
  ADD CONSTRAINT `loteplantula_especie_ibfk_2` FOREIGN KEY (`EspID`) REFERENCES `especie` (`EspID`);

--
-- Constraints for table `lotesemillas_especie`
--
ALTER TABLE `lotesemillas_especie`
  ADD CONSTRAINT `lotesemillas_especie_ibfk_1` FOREIGN KEY (`loteSemillaID`) REFERENCES `lotessemillas` (`loteSemillaID`),
  ADD CONSTRAINT `lotesemillas_especie_ibfk_2` FOREIGN KEY (`EspID`) REFERENCES `especie` (`EspID`);

--
-- Constraints for table `lotesplantula`
--
ALTER TABLE `lotesplantula`
  ADD CONSTRAINT `lotesplantula_ibfk_1` FOREIGN KEY (`trasladoID`) REFERENCES `traslado` (`trasladoID`),
  ADD CONSTRAINT `lotesplantula_ibfk_2` FOREIGN KEY (`zonaID`) REFERENCES `zonas` (`zonaID`) ON DELETE CASCADE,
  ADD CONSTRAINT `lotesplantula_ibfk_3` FOREIGN KEY (`cuentaID`) REFERENCES `cuentas` (`cuentaID`) ON DELETE CASCADE;

--
-- Constraints for table `lotessemillas`
--
ALTER TABLE `lotessemillas`
  ADD CONSTRAINT `lotessemillas_ibfk_1` FOREIGN KEY (`trasladoID`) REFERENCES `traslado` (`trasladoID`),
  ADD CONSTRAINT `lotessemillas_ibfk_2` FOREIGN KEY (`zonaID`) REFERENCES `zonas` (`zonaID`) ON DELETE CASCADE,
  ADD CONSTRAINT `lotessemillas_ibfk_3` FOREIGN KEY (`cuentaID`) REFERENCES `cuentas` (`cuentaID`) ON DELETE CASCADE;

--
-- Constraints for table `plantamadre_especie`
--
ALTER TABLE `plantamadre_especie`
  ADD CONSTRAINT `plantamadre_especie_ibfk_1` FOREIGN KEY (`plantaMadreID`) REFERENCES `plantasmadre` (`plantaMadreID`),
  ADD CONSTRAINT `plantamadre_especie_ibfk_2` FOREIGN KEY (`EspID`) REFERENCES `especie` (`EspID`);

--
-- Constraints for table `plantas`
--
ALTER TABLE `plantas`
  ADD CONSTRAINT `plantas_ibfk_1` FOREIGN KEY (`trasladoID`) REFERENCES `traslado` (`trasladoID`),
  ADD CONSTRAINT `plantas_ibfk_2` FOREIGN KEY (`zonaID`) REFERENCES `zonas` (`zonaID`) ON DELETE CASCADE,
  ADD CONSTRAINT `plantas_ibfk_3` FOREIGN KEY (`cuentaID`) REFERENCES `cuentas` (`cuentaID`) ON DELETE CASCADE;

--
-- Constraints for table `plantasmadre`
--
ALTER TABLE `plantasmadre`
  ADD CONSTRAINT `plantasmadre_ibfk_1` FOREIGN KEY (`trasladoID`) REFERENCES `traslado` (`trasladoID`),
  ADD CONSTRAINT `plantasmadre_ibfk_2` FOREIGN KEY (`zonaID`) REFERENCES `zonas` (`zonaID`) ON DELETE CASCADE,
  ADD CONSTRAINT `plantasmadre_ibfk_3` FOREIGN KEY (`cuentaID`) REFERENCES `cuentas` (`cuentaID`) ON DELETE CASCADE;

--
-- Constraints for table `planta_especie`
--
ALTER TABLE `planta_especie`
  ADD CONSTRAINT `planta_especie_ibfk_1` FOREIGN KEY (`plantaID`) REFERENCES `plantas` (`plantaID`),
  ADD CONSTRAINT `planta_especie_ibfk_2` FOREIGN KEY (`EspID`) REFERENCES `especie` (`EspID`);

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
