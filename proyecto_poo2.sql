-- phpMyAdmin SQL Dump
-- version 3.5.1
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 03-08-2016 a las 01:30:51
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
-- Estructura de tabla para la tabla `solicitudes`
--

CREATE TABLE IF NOT EXISTS `solicitudes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_de_empleado_generador` int(11) DEFAULT NULL,
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

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `solicitudes`
--
ALTER TABLE `solicitudes`
  ADD CONSTRAINT `estado` FOREIGN KEY (`id_de_Estado`) REFERENCES `estado` (`id`),
  ADD CONSTRAINT `id_empleado` FOREIGN KEY (`id_de_empleado_generador`) REFERENCES `trabajadores` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
