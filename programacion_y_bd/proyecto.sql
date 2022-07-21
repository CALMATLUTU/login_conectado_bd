-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 21-07-2022 a las 08:20:57
-- Versión del servidor: 10.4.24-MariaDB
-- Versión de PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `proyecto`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `persona`
--

CREATE TABLE `persona` (
  `CI` int(8) NOT NULL,
  `NOMBRE` varchar(15) NOT NULL,
  `APELLIDO` varchar(20) NOT NULL,
  `LOCALIDAD` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `persona`
--

INSERT INTO `persona` (`CI`, `NOMBRE`, `APELLIDO`, `LOCALIDAD`) VALUES
(53181172, 'Agustin', 'Ituarte', 'Neptunia'),
(53774264, 'Ezequiel', 'Morales', 'Atlántida'),
(55054034, 'Facundo', 'Cuello', 'Marindia'),
(56340728, 'Juan Manuel', 'Acero', 'Atlántida'),
(56344414, 'Ignacio', 'Laguarda', 'Las vegas.');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `USERNAME` varchar(16) NOT NULL,
  `PASSWD` varchar(16) NOT NULL,
  `CI` int(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`USERNAME`, `PASSWD`, `CI`) VALUES
('agustin1', 'sistemaso', 53181172),
('El_stali', '...13125', 56340728),
('eze_morales', 'quetepasabo', 53774264),
('facu_cuello', 'facundop', 55054034),
('nachoo_lag', 'daleman12', 56344414),
('root', '10293847', 55054034);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario_administrador`
--

CREATE TABLE `usuario_administrador` (
  `USERNAME` varchar(16) NOT NULL,
  `SUCURSAL` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `usuario_administrador`
--

INSERT INTO `usuario_administrador` (`USERNAME`, `SUCURSAL`) VALUES
('root', 'SEDE CENTRAL');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario_cliente`
--

CREATE TABLE `usuario_cliente` (
  `USERNAME` varchar(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `usuario_cliente`
--

INSERT INTO `usuario_cliente` (`USERNAME`) VALUES
('El_stali'),
('eze_morales'),
('nachoo_lag');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario_empleado`
--

CREATE TABLE `usuario_empleado` (
  `USERNAME` varchar(16) NOT NULL,
  `SUCURSAL` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `usuario_empleado`
--

INSERT INTO `usuario_empleado` (`USERNAME`, `SUCURSAL`) VALUES
('eze_morales', 'SEDE CENTRAL'),
('facu_cuello', 'SEDE CENTRAL');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `persona`
--
ALTER TABLE `persona`
  ADD PRIMARY KEY (`CI`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`USERNAME`),
  ADD KEY `CI` (`CI`);

--
-- Indices de la tabla `usuario_administrador`
--
ALTER TABLE `usuario_administrador`
  ADD PRIMARY KEY (`USERNAME`);

--
-- Indices de la tabla `usuario_cliente`
--
ALTER TABLE `usuario_cliente`
  ADD PRIMARY KEY (`USERNAME`);

--
-- Indices de la tabla `usuario_empleado`
--
ALTER TABLE `usuario_empleado`
  ADD PRIMARY KEY (`USERNAME`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `usuario_ibfk_1` FOREIGN KEY (`CI`) REFERENCES `persona` (`CI`);

--
-- Filtros para la tabla `usuario_administrador`
--
ALTER TABLE `usuario_administrador`
  ADD CONSTRAINT `usuario_administrador_ibfk_1` FOREIGN KEY (`USERNAME`) REFERENCES `usuario` (`USERNAME`);

--
-- Filtros para la tabla `usuario_cliente`
--
ALTER TABLE `usuario_cliente`
  ADD CONSTRAINT `usuario_cliente_ibfk_3` FOREIGN KEY (`USERNAME`) REFERENCES `usuario` (`USERNAME`);

--
-- Filtros para la tabla `usuario_empleado`
--
ALTER TABLE `usuario_empleado`
  ADD CONSTRAINT `usuario_empleado_ibfk_1` FOREIGN KEY (`USERNAME`) REFERENCES `usuario` (`USERNAME`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
