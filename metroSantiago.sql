-- phpMyAdmin SQL Dump
-- version 3.4.5
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 19-07-2012 a las 08:52:43
-- Versión del servidor: 5.5.16
-- Versión de PHP: 5.3.8

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `metroSantiago`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Anden`
--

CREATE TABLE IF NOT EXISTS `Anden` (
  `id_anden` int(11) NOT NULL AUTO_INCREMENT,
  `via` smallint(6) NOT NULL,
  `id_estacion` int(11) NOT NULL,
  `num_linea` int(11) NOT NULL,
  PRIMARY KEY (`id_anden`),
  KEY `id_estacion` (`id_estacion`),
  KEY `id_linea` (`num_linea`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=202 ;

--
-- Volcado de datos para la tabla `Anden`
--

INSERT INTO `Anden` (`id_anden`, `via`, `id_estacion`, `num_linea`) VALUES
(1, 1, 1, 1),
(2, 1, 2, 1),
(3, 1, 3, 1),
(4, 1, 4, 1),
(5, 1, 5, 1),
(6, 1, 6, 1),
(7, 1, 7, 1),
(8, 1, 8, 1),
(9, 1, 9, 1),
(10, 1, 10, 1),
(11, 1, 11, 1),
(12, 1, 12, 1),
(16, 2, 1, 1),
(17, 2, 2, 1),
(18, 2, 3, 1),
(19, 2, 4, 1),
(20, 2, 5, 1),
(21, 2, 6, 1),
(22, 2, 7, 1),
(23, 2, 8, 1),
(24, 2, 9, 1),
(25, 2, 10, 1),
(26, 2, 11, 1),
(27, 2, 12, 1),
(80, 1, 41, 5),
(81, 2, 41, 5),
(82, 1, 42, 5),
(83, 2, 42, 5),
(84, 1, 43, 5),
(85, 2, 43, 5),
(86, 1, 44, 5),
(87, 2, 44, 5),
(88, 1, 45, 5),
(89, 2, 45, 5),
(90, 1, 46, 5),
(91, 2, 46, 5),
(92, 1, 47, 5),
(93, 2, 47, 5),
(94, 1, 48, 5),
(95, 2, 48, 5),
(96, 1, 49, 5),
(97, 2, 49, 5),
(98, 1, 50, 5),
(99, 2, 50, 5),
(100, 1, 51, 5),
(101, 2, 51, 5),
(102, 1, 52, 5),
(103, 2, 52, 5),
(104, 1, 6, 5),
(105, 2, 6, 5),
(106, 1, 53, 5),
(107, 2, 53, 5),
(108, 1, 54, 5),
(109, 2, 54, 5),
(110, 1, 55, 5),
(111, 2, 55, 5),
(170, 1, 79, 1),
(171, 2, 79, 1),
(172, 1, 80, 1),
(173, 2, 80, 1),
(174, 1, 81, 1),
(175, 2, 81, 1),
(176, 1, 82, 1),
(177, 2, 82, 1),
(178, 1, 83, 1),
(179, 2, 83, 1),
(180, 1, 84, 1),
(181, 2, 84, 1),
(182, 1, 11, 4),
(183, 2, 11, 4),
(184, 1, 85, 4),
(185, 2, 85, 4),
(186, 1, 86, 4),
(187, 2, 86, 4),
(188, 1, 87, 4),
(189, 2, 87, 4),
(190, 1, 88, 4),
(191, 2, 88, 4),
(192, 1, 89, 4),
(193, 2, 89, 4),
(194, 1, 90, 4),
(195, 2, 90, 4),
(196, 1, 91, 4),
(197, 2, 91, 4),
(198, 1, 92, 4),
(199, 2, 92, 4),
(200, 1, 93, 4),
(201, 2, 93, 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Carro`
--

CREATE TABLE IF NOT EXISTS `Carro` (
  `id_carro` int(11) NOT NULL AUTO_INCREMENT,
  `fecha_fabricacion` date NOT NULL,
  `id_modelo_carro` int(11) NOT NULL,
  `id_color` int(11) NOT NULL,
  PRIMARY KEY (`id_carro`),
  KEY `id_color` (`id_color`),
  KEY `id_modelo_carro` (`id_modelo_carro`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=26 ;

--
-- Volcado de datos para la tabla `Carro`
--

INSERT INTO `Carro` (`id_carro`, `fecha_fabricacion`, `id_modelo_carro`, `id_color`) VALUES
(1, '1973-01-01', 1, 7),
(2, '1973-01-01', 1, 7),
(3, '1973-01-01', 1, 7),
(4, '1973-01-01', 1, 7),
(5, '1973-01-01', 1, 7),
(6, '1973-01-01', 1, 7),
(7, '1973-01-01', 1, 7),
(8, '1973-01-01', 1, 7),
(9, '1973-01-01', 1, 7),
(10, '1973-01-01', 1, 7),
(11, '1973-01-01', 1, 7),
(12, '1973-01-01', 1, 7),
(13, '1973-01-01', 1, 7),
(14, '1973-01-01', 1, 7),
(15, '1973-01-01', 1, 7),
(16, '1973-01-01', 1, 7),
(17, '1973-01-01', 1, 7),
(18, '1973-01-01', 1, 7),
(19, '1973-01-01', 1, 7),
(20, '1973-01-01', 1, 7),
(21, '1973-01-01', 1, 7),
(22, '1973-01-01', 1, 7),
(23, '1973-01-01', 1, 7),
(24, '1973-01-01', 1, 7),
(25, '1973-01-01', 1, 7);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Carro_forma_tren`
--

CREATE TABLE IF NOT EXISTS `Carro_forma_tren` (
  `id_carro` int(11) NOT NULL,
  `num_tren` int(11) NOT NULL,
  KEY `id_carro` (`id_carro`),
  KEY `num_tren` (`num_tren`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `Carro_forma_tren`
--

INSERT INTO `Carro_forma_tren` (`id_carro`, `num_tren`) VALUES
(1, 2),
(2, 2),
(3, 2),
(4, 2),
(5, 2),
(6, 3),
(7, 3),
(8, 3),
(9, 3),
(10, 3),
(11, 4),
(12, 4),
(13, 4),
(14, 4),
(15, 4),
(16, 5),
(17, 5),
(18, 5),
(19, 5),
(20, 5),
(21, 6),
(22, 6),
(23, 6),
(24, 6),
(25, 6);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Color`
--

CREATE TABLE IF NOT EXISTS `Color` (
  `id_color` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_color` varchar(25) COLLATE utf8_spanish_ci NOT NULL,
  `cod_color` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`id_color`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=10 ;

--
-- Volcado de datos para la tabla `Color`
--

INSERT INTO `Color` (`id_color`, `nombre_color`, `cod_color`) VALUES
(1, 'Rojo', 'red'),
(2, 'verde', 'green'),
(3, 'Azul', 'blue'),
(4, 'Negro', 'black'),
(5, 'Naranjo', 'orange'),
(6, 'Amarillo', '#FFC515'),
(7, 'celeste', '#27E6FF'),
(8, 'blanco', 'white'),
(9, 'cafe', '#6D3E12');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Conductor`
--

CREATE TABLE IF NOT EXISTS `Conductor` (
  `id_conductor` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_conductor` varchar(40) COLLATE utf8_spanish_ci NOT NULL,
  `edad_conductor` smallint(6) NOT NULL,
  `sueldo_conductor` int(11) NOT NULL,
  `horas_contrato` int(11) NOT NULL,
  PRIMARY KEY (`id_conductor`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `Conductor`
--

INSERT INTO `Conductor` (`id_conductor`, `nombre_conductor`, `edad_conductor`, `sueldo_conductor`, `horas_contrato`) VALUES
(1, 'Cristobal sanchez', 23, 200000, 50),
(2, 'Mario Moreno Cantinfla', 30, 2000000, 49);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Estacion`
--

CREATE TABLE IF NOT EXISTS `Estacion` (
  `id_estacion` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_estacion` varchar(30) CHARACTER SET latin1 NOT NULL,
  `id_ruta` int(11) NOT NULL,
  PRIMARY KEY (`id_estacion`),
  KEY `id_ruta` (`id_ruta`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=94 ;

--
-- Volcado de datos para la tabla `Estacion`
--

INSERT INTO `Estacion` (`id_estacion`, `nombre_estacion`, `id_ruta`) VALUES
(1, 'Los Heroes', 3),
(2, 'La Moneda', 3),
(3, 'Universidad de Chile', 3),
(4, 'Santa Lucia', 3),
(5, 'Universidad Cat&oacute;lica', 3),
(6, 'Baquedano', 3),
(7, 'Salvador', 3),
(8, 'Manuel Montt', 3),
(9, 'Pedro de Valdivia', 3),
(10, 'Los Leones', 3),
(11, 'Tobalaba', 3),
(12, 'El golf', 3),
(41, 'Vicente Valdes', 3),
(42, 'Bellavista de la Florida', 3),
(43, 'Mirador', 3),
(44, 'Pedrero', 3),
(45, 'San JoaquÃ­n', 3),
(46, 'Camino Agricola', 3),
(47, 'Carlos Valdovinos', 3),
(48, 'Rodrigo de Araya', 3),
(49, 'Ã‘uble', 3),
(50, 'IrarrÃ¡zabal', 3),
(51, 'Santa Isabel', 3),
(52, 'Parque Bustamante', 3),
(53, 'Bellas Artes', 3),
(54, 'Plaza de Armas', 3),
(55, 'Santa Ana', 3),
(79, 'Republica', 3),
(80, 'ULA', 3),
(81, 'AlcÃ¡ntara', 3),
(82, 'Escuela Militar', 3),
(83, 'Manquehue', 3),
(84, 'Hernando deagallanes', 3),
(85, 'CristÃ³bal Colon', 3),
(86, 'Francisco Bilbao', 3),
(87, 'Principe de Gales', 3),
(88, 'Simon Bolivar', 3),
(89, 'Plaza EgaÃ±a', 3),
(90, 'Los Orientales', 3),
(91, 'Grecia', 3),
(92, 'Los Presidentes', 3),
(93, 'QuilÃ­n', 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Estado_tren`
--

CREATE TABLE IF NOT EXISTS `Estado_tren` (
  `id_estado_tren` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_estado_tren` varchar(25) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`id_estado_tren`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=5 ;

--
-- Volcado de datos para la tabla `Estado_tren`
--

INSERT INTO `Estado_tren` (`id_estado_tren`, `nombre_estado_tren`) VALUES
(1, 'En anden'),
(2, 'En tunel'),
(3, 'En cochera'),
(4, 'En mantencion');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Fabricante`
--

CREATE TABLE IF NOT EXISTS `Fabricante` (
  `id_fabricante` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_fabricante` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
  `nacionalidad_fabricante` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`id_fabricante`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=4 ;

--
-- Volcado de datos para la tabla `Fabricante`
--

INSERT INTO `Fabricante` (`id_fabricante`, `nombre_fabricante`, `nacionalidad_fabricante`) VALUES
(1, 'ALSTHOM', 'Francia'),
(2, 'CONCARRIL', 'México'),
(3, 'CAF', 'España');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Horario`
--

CREATE TABLE IF NOT EXISTS `Horario` (
  `id_horario` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_horario` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
  `precio_pasaje` int(11) NOT NULL,
  PRIMARY KEY (`id_horario`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=4 ;

--
-- Volcado de datos para la tabla `Horario`
--

INSERT INTO `Horario` (`id_horario`, `nombre_horario`, `precio_pasaje`) VALUES
(1, 'punta', 670),
(2, 'valle', 610),
(3, 'bajo', 560);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Linea`
--

CREATE TABLE IF NOT EXISTS `Linea` (
  `num_linea` int(11) NOT NULL AUTO_INCREMENT,
  `id_color_linea` int(11) NOT NULL,
  PRIMARY KEY (`num_linea`),
  KEY `id_color_linea` (`id_color_linea`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=9 ;

--
-- Volcado de datos para la tabla `Linea`
--

INSERT INTO `Linea` (`num_linea`, `id_color_linea`) VALUES
(1, 1),
(5, 2),
(4, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Linea_horario`
--

CREATE TABLE IF NOT EXISTS `Linea_horario` (
  `num_linea` int(11) NOT NULL,
  `id_horario` int(11) NOT NULL,
  KEY `num_linea` (`num_linea`),
  KEY `id_horario` (`id_horario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Mantencion`
--

CREATE TABLE IF NOT EXISTS `Mantencion` (
  `id_mantencion` int(11) NOT NULL AUTO_INCREMENT,
  `fecha_mantencion` date NOT NULL,
  `id_carro` int(11) NOT NULL,
  PRIMARY KEY (`id_mantencion`),
  KEY `id_carro` (`id_carro`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Modelo_carro`
--

CREATE TABLE IF NOT EXISTS `Modelo_carro` (
  `id_modelo_carro` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_modelo_carro` varchar(40) COLLATE utf8_spanish_ci NOT NULL,
  `tiene_aire_acondicionado` tinyint(1) NOT NULL,
  `id_fabricante` int(11) NOT NULL,
  PRIMARY KEY (`id_modelo_carro`),
  KEY `id_fabricante` (`id_fabricante`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=6 ;

--
-- Volcado de datos para la tabla `Modelo_carro`
--

INSERT INTO `Modelo_carro` (`id_modelo_carro`, `nombre_modelo_carro`, `tiene_aire_acondicionado`, `id_fabricante`) VALUES
(1, 'NS-74', 0, 1),
(2, 'NS-88', 0, 2),
(3, 'NS-93', 0, 1),
(4, 'NS-04', 0, 1),
(5, 'NS-2007', 0, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Posicion_tren`
--

CREATE TABLE IF NOT EXISTS `Posicion_tren` (
  `id_tren` int(11) NOT NULL,
  `id_anden` int(11) NOT NULL,
  `id_conductor` int(11) NOT NULL,
  `fecha_hora_posicion` datetime NOT NULL,
  KEY `id_tren` (`id_tren`),
  KEY `id_anden` (`id_anden`),
  KEY `id_conductor` (`id_conductor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `Posicion_tren`
--

INSERT INTO `Posicion_tren` (`id_tren`, `id_anden`, `id_conductor`, `fecha_hora_posicion`) VALUES
(2, 1, 1, '2012-07-16 06:30:00'),
(3, 2, 2, '2012-07-16 06:30:00'),
(4, 3, 2, '2012-07-16 06:30:00'),
(5, 4, 2, '2012-07-16 06:30:00'),
(6, 5, 2, '2012-07-16 06:30:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Primer_anden_linea`
--

CREATE TABLE IF NOT EXISTS `Primer_anden_linea` (
  `num_linea` int(11) NOT NULL,
  `id_anden` int(11) NOT NULL,
  KEY `id_anden` (`id_anden`),
  KEY `num_linea` (`num_linea`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `Primer_anden_linea`
--

INSERT INTO `Primer_anden_linea` (`num_linea`, `id_anden`) VALUES
(1, 172),
(1, 181),
(5, 80),
(5, 111),
(4, 182),
(4, 201);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Rango_horario`
--

CREATE TABLE IF NOT EXISTS `Rango_horario` (
  `id_rango_horario` int(11) NOT NULL AUTO_INCREMENT,
  `inicio_horario` time NOT NULL,
  `termino_horario` time NOT NULL,
  `id_horario` int(11) NOT NULL,
  PRIMARY KEY (`id_rango_horario`),
  KEY `id_horario` (`id_horario`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=8 ;

--
-- Volcado de datos para la tabla `Rango_horario`
--

INSERT INTO `Rango_horario` (`id_rango_horario`, `inicio_horario`, `termino_horario`, `id_horario`) VALUES
(1, '07:00:00', '08:59:59', 1),
(2, '18:00:00', '19:59:59', 1),
(3, '06:30:00', '06:59:00', 2),
(4, '09:00:00', '17:59:59', 2),
(5, '20:00:00', '20:44:59', 2),
(6, '06:00:00', '06:29:59', 3),
(7, '20:45:00', '23:00:00', 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Ruta`
--

CREATE TABLE IF NOT EXISTS `Ruta` (
  `id_ruta` int(11) NOT NULL,
  `id_color_ruta` int(11) NOT NULL,
  PRIMARY KEY (`id_ruta`),
  KEY `id_color_ruta` (`id_color_ruta`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `Ruta`
--

INSERT INTO `Ruta` (`id_ruta`, `id_color_ruta`) VALUES
(1, 1),
(2, 2),
(3, 8);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Tren`
--

CREATE TABLE IF NOT EXISTS `Tren` (
  `id_tren` int(11) NOT NULL AUTO_INCREMENT,
  `num_convoy` int(11) NOT NULL,
  `fecha_hora_inicio` datetime NOT NULL,
  `fecha_hora_termino` datetime NOT NULL,
  `id_estado_tren` int(11) NOT NULL,
  PRIMARY KEY (`id_tren`),
  KEY `id_estado_tren` (`id_estado_tren`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=7 ;

--
-- Volcado de datos para la tabla `Tren`
--

INSERT INTO `Tren` (`id_tren`, `num_convoy`, `fecha_hora_inicio`, `fecha_hora_termino`, `id_estado_tren`) VALUES
(2, 101, '2012-07-16 06:30:00', '2012-07-16 09:00:00', 1),
(3, 102, '2012-07-16 06:30:00', '2012-07-16 09:00:00', 1),
(4, 103, '2012-07-16 06:30:00', '2012-07-16 09:00:00', 1),
(5, 104, '2012-07-16 06:30:00', '2012-07-16 09:00:00', 1),
(6, 105, '2012-07-16 06:30:00', '2012-07-16 09:00:00', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Tunel`
--

CREATE TABLE IF NOT EXISTS `Tunel` (
  `id_anden_origen` int(11) NOT NULL,
  `id_anden_destino` int(11) NOT NULL,
  KEY `id_anden_origen` (`id_anden_origen`),
  KEY `id_anden_destino` (`id_anden_destino`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `Tunel`
--

INSERT INTO `Tunel` (`id_anden_origen`, `id_anden_destino`) VALUES
(1, 2),
(2, 3),
(3, 4),
(4, 5),
(5, 6),
(7, 8),
(8, 9),
(9, 10),
(10, 11),
(11, 12),
(6, 7),
(27, 26),
(26, 25),
(25, 24),
(24, 23),
(23, 22),
(22, 21),
(21, 20),
(20, 19),
(19, 18),
(18, 17),
(17, 16),
(80, 82),
(82, 84),
(84, 86),
(86, 88),
(88, 90),
(90, 92),
(92, 94),
(94, 96),
(96, 98),
(98, 100),
(100, 102),
(102, 104),
(104, 106),
(106, 108),
(108, 110),
(170, 1),
(172, 170),
(12, 174),
(174, 176),
(176, 178),
(178, 180),
(182, 184),
(184, 186),
(186, 188),
(188, 190),
(190, 192),
(192, 194),
(194, 196),
(196, 198),
(198, 200);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `Anden`
--
ALTER TABLE `Anden`
  ADD CONSTRAINT `Anden_ibfk_3` FOREIGN KEY (`id_estacion`) REFERENCES `Estacion` (`id_estacion`),
  ADD CONSTRAINT `Anden_ibfk_4` FOREIGN KEY (`num_linea`) REFERENCES `Linea` (`num_linea`);

--
-- Filtros para la tabla `Carro`
--
ALTER TABLE `Carro`
  ADD CONSTRAINT `Carro_ibfk_2` FOREIGN KEY (`id_modelo_carro`) REFERENCES `Modelo_carro` (`id_modelo_carro`),
  ADD CONSTRAINT `Carro_ibfk_3` FOREIGN KEY (`id_color`) REFERENCES `Color` (`id_color`);

--
-- Filtros para la tabla `Carro_forma_tren`
--
ALTER TABLE `Carro_forma_tren`
  ADD CONSTRAINT `Carro_forma_tren_ibfk_1` FOREIGN KEY (`id_carro`) REFERENCES `Carro` (`id_carro`),
  ADD CONSTRAINT `Carro_forma_tren_ibfk_2` FOREIGN KEY (`num_tren`) REFERENCES `Tren` (`id_tren`);

--
-- Filtros para la tabla `Estacion`
--
ALTER TABLE `Estacion`
  ADD CONSTRAINT `Estacion_ibfk_1` FOREIGN KEY (`id_ruta`) REFERENCES `Ruta` (`id_ruta`);

--
-- Filtros para la tabla `Linea`
--
ALTER TABLE `Linea`
  ADD CONSTRAINT `Linea_ibfk_1` FOREIGN KEY (`id_color_linea`) REFERENCES `Color` (`id_color`);

--
-- Filtros para la tabla `Linea_horario`
--
ALTER TABLE `Linea_horario`
  ADD CONSTRAINT `Linea_horario_ibfk_1` FOREIGN KEY (`num_linea`) REFERENCES `Linea` (`num_linea`),
  ADD CONSTRAINT `Linea_horario_ibfk_2` FOREIGN KEY (`id_horario`) REFERENCES `Horario` (`id_horario`);

--
-- Filtros para la tabla `Mantencion`
--
ALTER TABLE `Mantencion`
  ADD CONSTRAINT `Mantencion_ibfk_1` FOREIGN KEY (`id_carro`) REFERENCES `Carro` (`id_carro`);

--
-- Filtros para la tabla `Modelo_carro`
--
ALTER TABLE `Modelo_carro`
  ADD CONSTRAINT `Modelo_carro_ibfk_1` FOREIGN KEY (`id_fabricante`) REFERENCES `Fabricante` (`id_fabricante`);

--
-- Filtros para la tabla `Posicion_tren`
--
ALTER TABLE `Posicion_tren`
  ADD CONSTRAINT `Posicion_tren_ibfk_1` FOREIGN KEY (`id_tren`) REFERENCES `Tren` (`id_tren`),
  ADD CONSTRAINT `Posicion_tren_ibfk_2` FOREIGN KEY (`id_anden`) REFERENCES `Anden` (`id_anden`),
  ADD CONSTRAINT `Posicion_tren_ibfk_3` FOREIGN KEY (`id_conductor`) REFERENCES `Conductor` (`id_conductor`);

--
-- Filtros para la tabla `Primer_anden_linea`
--
ALTER TABLE `Primer_anden_linea`
  ADD CONSTRAINT `Primer_anden_linea_ibfk_1` FOREIGN KEY (`num_linea`) REFERENCES `Linea` (`num_linea`),
  ADD CONSTRAINT `Primer_anden_linea_ibfk_2` FOREIGN KEY (`id_anden`) REFERENCES `Anden` (`id_anden`);

--
-- Filtros para la tabla `Rango_horario`
--
ALTER TABLE `Rango_horario`
  ADD CONSTRAINT `Rango_horario_ibfk_1` FOREIGN KEY (`id_horario`) REFERENCES `Horario` (`id_horario`);

--
-- Filtros para la tabla `Ruta`
--
ALTER TABLE `Ruta`
  ADD CONSTRAINT `Ruta_ibfk_1` FOREIGN KEY (`id_color_ruta`) REFERENCES `Color` (`id_color`);

--
-- Filtros para la tabla `Tren`
--
ALTER TABLE `Tren`
  ADD CONSTRAINT `Tren_ibfk_1` FOREIGN KEY (`id_estado_tren`) REFERENCES `Estado_tren` (`id_estado_tren`);

--
-- Filtros para la tabla `Tunel`
--
ALTER TABLE `Tunel`
  ADD CONSTRAINT `Tunel_ibfk_1` FOREIGN KEY (`id_anden_origen`) REFERENCES `Anden` (`id_anden`),
  ADD CONSTRAINT `Tunel_ibfk_2` FOREIGN KEY (`id_anden_destino`) REFERENCES `Anden` (`id_anden`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
