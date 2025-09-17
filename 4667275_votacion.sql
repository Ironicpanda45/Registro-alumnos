-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: fdb1034.awardspace.net
-- Generation Time: Sep 17, 2025 at 03:52 PM
-- Server version: 8.0.32
-- PHP Version: 8.1.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `4667275_votacion`
--

-- --------------------------------------------------------

--
-- Table structure for table `alumnos`
--

CREATE TABLE `alumnos` (
  `Codigo` int NOT NULL,
  `Nombre` varchar(50) NOT NULL,
  `Apellidos` varchar(50) NOT NULL,
  `Edad` int NOT NULL,
  `Telefono` varchar(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `alumnos`
--

INSERT INTO `alumnos` (`Codigo`, `Nombre`, `Apellidos`, `Edad`, `Telefono`) VALUES
(223637, 'Federico', 'Garcia Lorca', 30, '6562342234');

-- --------------------------------------------------------

--
-- Table structure for table `carreras`
--

CREATE TABLE `carreras` (
  `Codigo` int NOT NULL,
  `Nombre` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `carreras`
--

INSERT INTO `carreras` (`Codigo`, `Nombre`) VALUES
(1, 'Ing. en software'),
(2, 'Ing. biomedica'),
(3, 'Diseño digital'),
(4, 'Diseño grafico'),
(5, 'Arquitectura');

-- --------------------------------------------------------

--
-- Table structure for table `empleados`
--

CREATE TABLE `empleados` (
  `id_empleado` int NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `apellido` varchar(100) NOT NULL,
  `puesto` varchar(100) NOT NULL,
  `piso` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `empleados`
--

INSERT INTO `empleados` (`id_empleado`, `nombre`, `apellido`, `puesto`, `piso`) VALUES
(1, 'Uziel', 'Rivera Pulgarin', 'Editor', 6),
(2, 'Jose', 'Martinez', 'Editor', 5),
(3, 'Jose', 'Lopez', 'Auxiliar administrativo', 3);

-- --------------------------------------------------------

--
-- Table structure for table `inscripciones`
--

CREATE TABLE `inscripciones` (
  `Id` int NOT NULL,
  `Fecha` date NOT NULL,
  `CodigoAlumno` int DEFAULT NULL,
  `CodigoCarrera` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `inscripciones`
--

INSERT INTO `inscripciones` (`Id`, `Fecha`, `CodigoAlumno`, `CodigoCarrera`) VALUES
(0, '2025-09-17', 223637, 1);

-- --------------------------------------------------------

--
-- Table structure for table `registros`
--

CREATE TABLE `registros` (
  `id_registro` int NOT NULL,
  `id_persona` int NOT NULL,
  `tipo_persona` enum('empleado','visitante') NOT NULL,
  `fecha_hora_entrada` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `registros`
--

INSERT INTO `registros` (`id_registro`, `id_persona`, `tipo_persona`, `fecha_hora_entrada`) VALUES
(1, 1, 'empleado', '2025-09-07 19:56:59'),
(2, 2, 'empleado', '2025-09-08 15:29:09'),
(3, 3, 'empleado', '2025-09-08 15:39:15'),
(4, 1, 'visitante', '2025-09-08 15:39:52');

-- --------------------------------------------------------

--
-- Table structure for table `usuario`
--

CREATE TABLE `usuario` (
  `id` int NOT NULL,
  `correo` varchar(40) NOT NULL,
  `contrasena` varchar(255) NOT NULL,
  `fecha_registro` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `usuario`
--

INSERT INTO `usuario` (`id`, `correo`, `contrasena`, `fecha_registro`) VALUES
(8, 'Zahiragarcia@gmail.com', '$2y$10$j7mm46Cf3uKoBaz.VNC8UOYlklCxM.8su0B6AXJAlsadzEVAGKb.2', '2025-09-01 15:37:47'),
(9, 'brayan@gomail.com', '$2y$10$Mk8NwF5Cq40/5.PW3Vhz..BKx05mLzHbTcvOntZZYEc.mr7Ru5GZq', '2025-09-01 15:37:52'),
(10, 'f.palacios@gmail.com', '$2y$10$ePwAEJPqBO2HzttUfUaf1.mqPmuem9URYacPgpCPpNpt5XtSUo34O', '2025-09-01 15:37:57'),
(11, 'janeth@holi.com', '$2y$10$.9emgIRFxRbg2Jefwsf2JefoAvMV2wwcpQOsiQeRmkbp2q3Ame3nu', '2025-09-01 15:38:20'),
(12, 'alain.ac@gmail.com', '$2y$10$TIpRnYvwjk5fNvltMGeGNOCMaAWqBxxryEWFOYVLe4jzvPzzmoapa', '2025-09-01 15:38:44'),
(13, 'itzel123@gmail.com', '$2y$10$inrAurI6NwzFSaS8UVpc0.xT3vrcc.iNosDB/46QOEOIMwE0//aH.', '2025-09-01 15:40:06'),
(14, 'mariano@gmail.com', '$2y$10$ajfzTOjppN2W8GsKk8qeVekhCI1tfcWl4hVYWbVkpee9Q8awirEku', '2025-09-07 04:49:26'),
(15, 'nicacio@gmail.com', '$2y$10$55PRaA9CKilKlUIzAWQxPualIPS/2yI3CLOj2AGQ/2TouzGt97JnK', '2025-09-07 05:42:01'),
(16, 'norma@gmail.com', '$2y$10$2ld4cYjnv39iKywR8DoGWO5E2bDWmJdYHvhhb58nXngLCvLQflVwW', '2025-09-08 02:07:09');

-- --------------------------------------------------------

--
-- Table structure for table `visitantes`
--

CREATE TABLE `visitantes` (
  `id_visitante` int NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `apellido` varchar(100) NOT NULL,
  `motivo_visita` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `visitantes`
--

INSERT INTO `visitantes` (`id_visitante`, `nombre`, `apellido`, `motivo_visita`) VALUES
(1, 'Eduardo', 'Martinez', 'Presupuesto');

-- --------------------------------------------------------

--
-- Table structure for table `votos`
--

CREATE TABLE `votos` (
  `id` int NOT NULL,
  `universidad` varchar(50) NOT NULL,
  `correo` varchar(255) NOT NULL,
  `fecha_voto` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `votos`
--

INSERT INTO `votos` (`id`, `universidad`, `correo`, `fecha_voto`) VALUES
(5, 'uacj', 'brayan@gomail.com', '0000-00-00 00:00:00'),
(6, 'urn', 'f.palacios@gmail.com', '0000-00-00 00:00:00'),
(7, 'urn', 'janeth@holi.com', '0000-00-00 00:00:00'),
(8, 'uach', 'alain.ac@gmail.com', '0000-00-00 00:00:00'),
(9, 'uacj', 'Zahiragarcia@gmail.com', '0000-00-00 00:00:00'),
(10, 'uacj', 'itzel123@gmail.com', '0000-00-00 00:00:00'),
(11, 'urn', 'mariano@gmail.com', '0000-00-00 00:00:00'),
(12, 'uacj', 'nicacio@gmail.com', '0000-00-00 00:00:00'),
(13, 'uach', 'norma@gmail.com', '0000-00-00 00:00:00');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `alumnos`
--
ALTER TABLE `alumnos`
  ADD PRIMARY KEY (`Codigo`);

--
-- Indexes for table `carreras`
--
ALTER TABLE `carreras`
  ADD PRIMARY KEY (`Codigo`);

--
-- Indexes for table `empleados`
--
ALTER TABLE `empleados`
  ADD PRIMARY KEY (`id_empleado`);

--
-- Indexes for table `inscripciones`
--
ALTER TABLE `inscripciones`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `CodigoAlumno` (`CodigoAlumno`),
  ADD KEY `CodigoCarrera` (`CodigoCarrera`);

--
-- Indexes for table `registros`
--
ALTER TABLE `registros`
  ADD PRIMARY KEY (`id_registro`);

--
-- Indexes for table `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `visitantes`
--
ALTER TABLE `visitantes`
  ADD PRIMARY KEY (`id_visitante`);

--
-- Indexes for table `votos`
--
ALTER TABLE `votos`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_voto` (`correo`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `empleados`
--
ALTER TABLE `empleados`
  MODIFY `id_empleado` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `registros`
--
ALTER TABLE `registros`
  MODIFY `id_registro` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `visitantes`
--
ALTER TABLE `visitantes`
  MODIFY `id_visitante` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `votos`
--
ALTER TABLE `votos`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `inscripciones`
--
ALTER TABLE `inscripciones`
  ADD CONSTRAINT `inscripciones_ibfk_1` FOREIGN KEY (`CodigoAlumno`) REFERENCES `alumnos` (`Codigo`),
  ADD CONSTRAINT `inscripciones_ibfk_2` FOREIGN KEY (`CodigoCarrera`) REFERENCES `carreras` (`Codigo`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
