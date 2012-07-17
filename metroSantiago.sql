-- phpMyAdmin SQL Dump
-- version 3.4.5
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 16-07-2012 a las 17:39:04
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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=29 ;

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
(13, 1, 13, 2),
(14, 1, 1, 2),
(15, 1, 14, 2),
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
(27, 2, 12, 1);

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=24 ;

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
(23, '1973-01-01', 1, 7);

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
(10, 3);

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=15 ;

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
(13, 'Toesca', 2),
(14, 'Parque O''Higgins', 1);

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `Linea`
--

INSERT INTO `Linea` (`num_linea`, `id_color_linea`) VALUES
(1, 1),
(2, 6);

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
(3, 2, 2, '2012-07-16 06:30:00');

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
(1, 1),
(2, 15),
(1, 27);

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=4 ;

--
-- Volcado de datos para la tabla `Tren`
--

INSERT INTO `Tren` (`id_tren`, `num_convoy`, `fecha_hora_inicio`, `fecha_hora_termino`, `id_estado_tren`) VALUES
(2, 101, '2012-07-16 06:30:00', '2012-07-16 09:00:00', 1),
(3, 102, '2012-07-16 06:30:00', '2012-07-16 09:00:00', 1);

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
(15, 13),
(13, 14),
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
(17, 16);

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
