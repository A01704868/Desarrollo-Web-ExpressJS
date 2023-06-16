-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 06, 2021 at 09:01 PM
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
-- Database: `uma_rbac`
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
(10, 'JuAnPerez@itesm.comx', 'Juan perez o', '$2a$12$JNvpB23hSDSOCejY4CDzB.moBPZ9LKY2n5.Si1U7RlLwsKIXtiPXK'),
(11, 'T@hotmail.com', 'Temporal', '$2a$12$Qm2UFS3MQsm.bgnDBjfkbuJocEG/nHfxY7bg53tCJK6YR4s/ro0Q2'),
(12, 'A01173530@itesm.mx', 'Adrián Torres', '$2a$12$xMz1EsIbu5t3d4YUvnFiKeOamUbz72ivmVDU9NfADcu/sNXY3pTIy'),
(13, 'JuAnPerez@itesm.mx', 'Juan', '$2a$12$SnYrQoGOLDRHzjDfzYKwvuA6RnCunroR/Cjior4sjzXvAPIwUBYwu'),
(14, 'LUexiste@hotmail.com', 'Luis Lopez', '$2a$12$LEV8vSeICDPW3V6QoN806.PV.ukK3.xti96eX8qHl9yiFGZv.ZSq.'),
(15, 'Jl@hotmail.com', 'Juan luis g', '$2a$12$/a/W5Pfqdqyf8nDlZwzW4ey5WtGzKLCfmjrEv9EBammY0bCoR30Ee');

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
(19, 'Girasol', 'uploads\\43_K5ES7QQOERAEVJKBDJPOVI6JDQ.jpg'),
(20, 'Orquídea', 'uploads\\787_orquidea.jpg'),
(21, 'Ematacantus', NULL),
(22, 'girasol', 'uploads\\917_download.jpg'),
(24, 'Rosa', 'uploads\\367_rosa.jpg');

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
('2021-05-31 02:25:52', 6, 3),
('2021-06-06 18:29:14', 7, 6),
('2021-06-06 18:29:14', 8, 6);

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
('2021-05-31 02:27:14', 6, 3),
('2021-06-06 18:12:13', 7, 5),
('2021-06-06 18:12:13', 8, 5);

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
(6, '2021-05-31 02:25:52', 7, 1, 3),
(7, '2021-06-06 18:29:14', 7, 1, 1),
(8, '2021-06-06 18:30:21', 1, 1, 1);

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
(6, '2021-05-31 02:27:14', 7, 1, 3),
(7, '2021-06-06 18:12:13', 6, 2, 1),
(8, '2021-06-06 18:12:13', 6, 2, 1);

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

--
-- Dumping data for table `permisos_roles`
--

INSERT INTO `permisos_roles` (`permisosID`, `rollID`, `fecha`) VALUES
(1, 1, '2021-06-02 15:05:42'),
(2, 1, '2021-06-02 15:05:42'),
(2, 2, '2021-06-02 15:05:42');

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
('2021-05-31 02:16:38', 6, 3),
('2021-06-06 01:15:02', 7, 4),
('2021-06-06 01:15:02', 8, 4),
('2021-06-06 04:39:33', 9, 5),
('2021-06-06 04:39:33', 10, 5),
('2021-06-06 19:00:23', 11, 3),
('2021-06-06 19:00:23', 12, 3),
('2021-06-06 19:00:23', 13, 3);

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
(5, '2021-05-31 02:13:30', 1, 1, 3),
(6, '2021-05-31 02:13:30', 1, 1, 3),
(7, '2021-05-31 03:45:47', 1, 1, 3),
(8, '2021-06-05 23:23:04', 9, 1, 3),
(9, '2021-06-05 23:23:04', 9, 1, 3),
(10, '2021-05-31 03:45:47', 10, 1, 3),
(11, '2021-05-31 03:45:47', 10, 1, 3),
(12, '2021-05-31 03:45:47', 7, 1, 3),
(13, '2021-05-31 04:10:28', 7, 5, 1),
(14, '2021-05-31 04:13:43', 7, 5, 1),
(15, '2021-05-31 04:13:43', 7, 5, 1),
(16, '2021-05-31 04:13:43', 5, 5, 1),
(17, '2021-06-06 18:38:36', 7, 4, 1),
(18, '2021-06-06 18:38:36', 7, 4, 1),
(19, '2021-06-06 18:38:36', 7, 4, 1);

-- --------------------------------------------------------

--
-- Stand-in structure for view `plantasactivas`
-- (See below for the actual view)
--
CREATE TABLE `plantasactivas` (
`plantaID` int(11)
,`fecha` timestamp
,`trasladoID` int(11)
,`zonaID` int(11)
,`cuentaID` int(11)
);

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
(5, '2021-06-06 18:39:14', 9, 1, 3),
(6, '2021-06-06 18:39:14', 9, 1, 3),
(7, '2021-06-06 01:15:02', 7, 4, 1),
(8, '2021-06-06 01:15:02', 7, 4, 1),
(9, '2021-06-06 04:40:01', 8, 5, 1),
(10, '2021-06-06 04:40:01', 8, 5, 1),
(11, '2021-06-06 19:00:23', 6, 4, 1),
(12, '2021-06-06 19:00:54', 1, 4, 1),
(13, '2021-06-06 19:00:54', 1, 4, 1);

-- --------------------------------------------------------

--
-- Stand-in structure for view `plantasmadreactivas`
-- (See below for the actual view)
--
CREATE TABLE `plantasmadreactivas` (
`plantaMadreID` int(11)
,`fecha` timestamp
,`trasladoID` int(11)
,`zonaID` int(11)
,`cuentaID` int(11)
);

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
('2021-05-31 04:13:43', 16, 22),
('2021-06-06 18:38:36', 17, 3),
('2021-06-06 18:38:36', 18, 3),
('2021-06-06 18:38:36', 19, 3);

-- --------------------------------------------------------

--
-- Stand-in structure for view `plantulasactivas`
-- (See below for the actual view)
--
CREATE TABLE `plantulasactivas` (
`lotePlantulaID` int(11)
,`fecha` timestamp
,`trasladoID` int(11)
,`zonaID` int(11)
,`cuentaID` int(11)
);

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

--
-- Dumping data for table `roles_cuentas`
--

INSERT INTO `roles_cuentas` (`rollID`, `cuentaID`, `fecha`) VALUES
(1, 1, '2021-06-04 21:41:54'),
(1, 10, '2021-06-01 17:05:50'),
(1, 11, '2021-06-03 04:47:30'),
(1, 12, '2021-06-03 04:48:23'),
(1, 13, '2021-06-03 04:53:11'),
(2, 14, '2021-06-03 23:09:39'),
(2, 15, '2021-06-04 18:14:07');

-- --------------------------------------------------------

--
-- Stand-in structure for view `semillasactivas`
-- (See below for the actual view)
--
CREATE TABLE `semillasactivas` (
`loteSemillaID` int(11)
,`fecha` timestamp
,`trasladoID` int(11)
,`zonaID` int(11)
,`cuentaID` int(11)
);

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
(8, 'Invernadero 3'),
(9, ''),
(10, ''),
(11, ''),
(12, ''),
(13, ''),
(14, ''),
(15, ''),
(16, ''),
(20, 'Jardín 4'),
(21, 'Jardín 4');

-- --------------------------------------------------------

--
-- Structure for view `lotes_plantula`
--
DROP TABLE IF EXISTS `lotes_plantula`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `lotes_plantula`  AS SELECT `e`.`NombreEsp` AS `NombreEsp`, count(`lp`.`lotePlantulaID`) AS `cantidadLotesPlantulas` FROM ((`especie` `e` join `plantulasactivas` `lp`) join `loteplantula_especie` `lpe`) WHERE `e`.`EspID` = `lpe`.`EspID` AND `lp`.`lotePlantulaID` = `lpe`.`lotePlantulaID` GROUP BY `e`.`EspID` ;

-- --------------------------------------------------------

--
-- Structure for view `plantasactivas`
--
DROP TABLE IF EXISTS `plantasactivas`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `plantasactivas`  AS SELECT `plantas`.`plantaID` AS `plantaID`, `plantas`.`fecha` AS `fecha`, `plantas`.`trasladoID` AS `trasladoID`, `plantas`.`zonaID` AS `zonaID`, `plantas`.`cuentaID` AS `cuentaID` FROM `plantas` WHERE `plantas`.`trasladoID` = '5' OR `plantas`.`trasladoID` = '6' OR `plantas`.`trasladoID` = '7' ;

-- --------------------------------------------------------

--
-- Structure for view `plantasmadreactivas`
--
DROP TABLE IF EXISTS `plantasmadreactivas`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `plantasmadreactivas`  AS SELECT `plantasmadre`.`plantaMadreID` AS `plantaMadreID`, `plantasmadre`.`fecha` AS `fecha`, `plantasmadre`.`trasladoID` AS `trasladoID`, `plantasmadre`.`zonaID` AS `zonaID`, `plantasmadre`.`cuentaID` AS `cuentaID` FROM `plantasmadre` WHERE `plantasmadre`.`trasladoID` = '5' OR `plantasmadre`.`trasladoID` = '6' OR `plantasmadre`.`trasladoID` = '7' ;

-- --------------------------------------------------------

--
-- Structure for view `plantas_madre2`
--
DROP TABLE IF EXISTS `plantas_madre2`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `plantas_madre2`  AS SELECT `e`.`NombreEsp` AS `NombreEsp`, count(`pm`.`plantaMadreID`) AS `cantidadPlantasMadre`, `e`.`imagen` AS `imagen` FROM ((`especie` `e` join `plantasmadreactivas` `pm`) join `plantamadre_especie` `pme`) WHERE `e`.`EspID` = `pme`.`EspID` AND `pm`.`plantaMadreID` = `pme`.`plantaMadreID` GROUP BY `e`.`EspID` ;

-- --------------------------------------------------------

--
-- Structure for view `plantas_reproducidas`
--
DROP TABLE IF EXISTS `plantas_reproducidas`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `plantas_reproducidas`  AS SELECT `e`.`NombreEsp` AS `NombreEsp`, count(`p`.`plantaID`) AS `cantidadPlantasReproducidas` FROM ((`especie` `e` join `plantas` `p`) join `planta_especie` `pe`) WHERE `e`.`EspID` = `pe`.`EspID` AND `p`.`plantaID` = `pe`.`plantaID` AND `p`.`trasladoID` = '7' GROUP BY `e`.`EspID` ;

-- --------------------------------------------------------

--
-- Structure for view `plantulasactivas`
--
DROP TABLE IF EXISTS `plantulasactivas`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `plantulasactivas`  AS SELECT `lotesplantula`.`lotePlantulaID` AS `lotePlantulaID`, `lotesplantula`.`fecha` AS `fecha`, `lotesplantula`.`trasladoID` AS `trasladoID`, `lotesplantula`.`zonaID` AS `zonaID`, `lotesplantula`.`cuentaID` AS `cuentaID` FROM `lotesplantula` WHERE `lotesplantula`.`trasladoID` = '5' OR `lotesplantula`.`trasladoID` = '6' OR `lotesplantula`.`trasladoID` = '7' ;

-- --------------------------------------------------------

--
-- Structure for view `semillasactivas`
--
DROP TABLE IF EXISTS `semillasactivas`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `semillasactivas`  AS SELECT `lotessemillas`.`loteSemillaID` AS `loteSemillaID`, `lotessemillas`.`fecha` AS `fecha`, `lotessemillas`.`trasladoID` AS `trasladoID`, `lotessemillas`.`zonaID` AS `zonaID`, `lotessemillas`.`cuentaID` AS `cuentaID` FROM `lotessemillas` WHERE `lotessemillas`.`trasladoID` = '5' OR `lotessemillas`.`trasladoID` = '6' OR `lotessemillas`.`trasladoID` = '7' ;

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
  ADD PRIMARY KEY (`permisosID`,`rollID`) USING BTREE,
  ADD KEY `rollID` (`rollID`);

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
  MODIFY `cuentaID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `especie`
--
ALTER TABLE `especie`
  MODIFY `EspID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `loteplantula_especie`
--
ALTER TABLE `loteplantula_especie`
  MODIFY `lotePlantulaID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `lotesemillas_especie`
--
ALTER TABLE `lotesemillas_especie`
  MODIFY `loteSemillaID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `lotesplantula`
--
ALTER TABLE `lotesplantula`
  MODIFY `lotePlantulaID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `lotessemillas`
--
ALTER TABLE `lotessemillas`
  MODIFY `loteSemillaID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `permisos_roles`
--
ALTER TABLE `permisos_roles`
  MODIFY `permisosID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `plantamadre_especie`
--
ALTER TABLE `plantamadre_especie`
  MODIFY `plantaMadreID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `plantas`
--
ALTER TABLE `plantas`
  MODIFY `plantaID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `plantasmadre`
--
ALTER TABLE `plantasmadre`
  MODIFY `plantaMadreID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `planta_especie`
--
ALTER TABLE `planta_especie`
  MODIFY `plantaID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

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
  MODIFY `zonaID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

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
-- Constraints for table `permisos_roles`
--
ALTER TABLE `permisos_roles`
  ADD CONSTRAINT `permisos_roles_ibfk_1` FOREIGN KEY (`permisosID`) REFERENCES `permisos` (`permisosID`),
  ADD CONSTRAINT `permisos_roles_ibfk_2` FOREIGN KEY (`rollID`) REFERENCES `roles` (`rollID`);

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
