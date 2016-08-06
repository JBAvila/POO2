-- phpMyAdmin SQL Dump
-- version 3.5.1
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 06-08-2016 a las 02:05:13
-- Versión del servidor: 5.5.24-log
-- Versión de PHP: 5.4.3

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `proyecto_poo2`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `archivo`
--

CREATE TABLE IF NOT EXISTS `archivo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_de_solicitud` int(11) DEFAULT NULL,
  `nombre_archivo` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `archivo_solitud` (`id_de_solicitud`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `departamento`
--

CREATE TABLE IF NOT EXISTS `departamento` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_del_departmento` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Volcado de datos para la tabla `departamento`
--

INSERT INTO `departamento` (`id`, `nombre_del_departmento`) VALUES
(1, 'desarrollo'),
(2, 'ventas'),
(3, 'recursos humanos');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estado`
--

CREATE TABLE IF NOT EXISTS `estado` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `estado` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Volcado de datos para la tabla `estado`
--

INSERT INTO `estado` (`id`, `estado`) VALUES
(1, 'Pendiente'),
(2, 'Aprovada'),
(3, 'rechazada'),
(4, 'terminada');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE IF NOT EXISTS `roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre del rol` varchar(200) NOT NULL,
  `pagina` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`id`, `nombre del rol`, `pagina`) VALUES
(1, 'administrador', 'sv-admin/inicio.jsp'),
(2, 'empleado', 'empleado.jsp'),
(3, 'jefe', 'jefe.jsp'),
(4, 'jefe seccion', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `secciones`
--

CREATE TABLE IF NOT EXISTS `secciones` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_de_seccion` varchar(200) DEFAULT NULL,
  `id_de_departamento` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `departamento_Secciones` (`id_de_departamento`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `secciones`
--

INSERT INTO `secciones` (`id`, `nombre_de_seccion`, `id_de_departamento`) VALUES
(1, 'desarrolladores moviles', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `solicitudes`
--

CREATE TABLE IF NOT EXISTS `solicitudes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_de_empleado_generador` int(11) DEFAULT NULL,
  `id_de_departamento` int(11) NOT NULL,
  `id_De_seccion` int(11) NOT NULL,
  `descripcion` varchar(200) DEFAULT NULL,
  `id_De_archivo` int(11) DEFAULT NULL,
  `id_de_Estado` int(11) DEFAULT NULL,
  `asignada` varchar(100) DEFAULT NULL,
  `fecha_de_aceptacion` date DEFAULT NULL,
  `fecha_plazo_terminacion` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `estado` (`id_de_Estado`),
  KEY `id_empleado` (`id_de_empleado_generador`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `trabajadores`
--

CREATE TABLE IF NOT EXISTS `trabajadores` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `1Nombre` varchar(200) NOT NULL,
  `2Nombre` varchar(200) NOT NULL,
  `1Apellido` varchar(200) NOT NULL,
  `2Apellido` varchar(200) NOT NULL,
  `dui` varchar(11) NOT NULL,
  `nit` varchar(20) NOT NULL,
  `Departamento` int(11) DEFAULT NULL,
  `rol` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `trabajadores_roles` (`rol`),
  KEY `trabajadore_departamento` (`Departamento`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Volcado de datos para la tabla `trabajadores`
--

INSERT INTO `trabajadores` (`id`, `1Nombre`, `2Nombre`, `1Apellido`, `2Apellido`, `dui`, `nit`, `Departamento`, `rol`) VALUES
(2, 'root', 'root', 'root', 'root', '05354839-0', '0604-220596-101-8', NULL, 1),
(3, 'luis', 'moises', 'castillo', 'arriola', '05324849-0', '0604-040257-102-9', NULL, 2),
(4, 'arquimides', 'alberto', 'gonzales', 'dueñas', '0489-562-6', '1-562656-103-36', 1, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `trabajo_empleado`
--

CREATE TABLE IF NOT EXISTS `trabajo_empleado` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_de_empleado` int(11) DEFAULT NULL,
  `id_de_Estado` int(11) DEFAULT NULL,
  `fecha_rechivida` date DEFAULT NULL,
  `fecha_plazo_terminacion` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `trabajo_estado` (`id_de_Estado`),
  KEY `trabajo_empleado` (`id_de_empleado`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `archivo`
--
ALTER TABLE `archivo`
  ADD CONSTRAINT `archivo_solitud` FOREIGN KEY (`id_de_solicitud`) REFERENCES `solicitudes` (`id`);

--
-- Filtros para la tabla `secciones`
--
ALTER TABLE `secciones`
  ADD CONSTRAINT `departamento_Secciones` FOREIGN KEY (`id_de_departamento`) REFERENCES `departamento` (`id`);

--
-- Filtros para la tabla `solicitudes`
--
ALTER TABLE `solicitudes`
  ADD CONSTRAINT `estado` FOREIGN KEY (`id_de_Estado`) REFERENCES `estado` (`id`),
  ADD CONSTRAINT `id_empleado` FOREIGN KEY (`id_de_empleado_generador`) REFERENCES `trabajadores` (`id`);

--
-- Filtros para la tabla `trabajadores`
--
ALTER TABLE `trabajadores`
  ADD CONSTRAINT `trabajadores_roles` FOREIGN KEY (`rol`) REFERENCES `roles` (`id`),
  ADD CONSTRAINT `trabajadore_departamento` FOREIGN KEY (`Departamento`) REFERENCES `departamento` (`id`);

--
-- Filtros para la tabla `trabajo_empleado`
--
ALTER TABLE `trabajo_empleado`
  ADD CONSTRAINT `trabajo_empleado` FOREIGN KEY (`id_de_empleado`) REFERENCES `trabajadores` (`id`),
  ADD CONSTRAINT `trabajo_estado` FOREIGN KEY (`id_de_Estado`) REFERENCES `estado` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
