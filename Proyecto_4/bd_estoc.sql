-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 20-12-2016 a las 19:21:26
-- Versión del servidor: 10.1.16-MariaDB
-- Versión de PHP: 5.6.24

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `bd_estoc`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_categoria`
--

CREATE TABLE `tbl_categoria` (
  `categoria_id` int(11) NOT NULL,
  `categoria_nom` varchar(20) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `tbl_categoria`
--

INSERT INTO `tbl_categoria` (`categoria_id`, `categoria_nom`) VALUES
(1, 'Utilitarios'),
(2, '4x4'),
(3, 'Deportivos'),
(4, 'Berlinas');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_comanda`
--

CREATE TABLE `tbl_comanda` (
  `comanda_id` int(11) NOT NULL,
  `comanda_quantitat` int(5) NOT NULL,
  `comanda_data` date NOT NULL,
  `prov_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_detall_com`
--

CREATE TABLE `tbl_detall_com` (
  `detall_com_id` int(11) NOT NULL,
  `comanda_id` int(11) NOT NULL,
  `prod_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_estoc`
--

CREATE TABLE `tbl_estoc` (
  `estoc_id` int(11) NOT NULL,
  `estoc_q_actual` int(5) NOT NULL,
  `estoc_q_min` int(5) NOT NULL,
  `estoc_q_max` int(5) NOT NULL,
  `prod_id` int(11) DEFAULT NULL,
  `lloc_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `tbl_estoc`
--

INSERT INTO `tbl_estoc` (`estoc_id`, `estoc_q_actual`, `estoc_q_min`, `estoc_q_max`, `prod_id`, `lloc_id`) VALUES
(1, 5, 1, 10, 1, NULL),
(2, 1, 1, 3, 2, NULL),
(3, 3, 2, 5, 3, NULL),
(4, 3, 2, 5, 4, NULL),
(5, 4, 1, 5, 5, NULL),
(6, 0, 0, 0, 6, NULL),
(7, 9, 2, 22, 7, NULL),
(8, 2, 1, 6, 8, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_lloc`
--

CREATE TABLE `tbl_lloc` (
  `lloc_id` int(11) NOT NULL,
  `num_bloc` enum('Bloc 1','Bloc 2','Bloc3','Bloc 4','Bloc 5','Bloc 6','Bloc 7','Bloc 8') COLLATE utf8_unicode_ci NOT NULL,
  `num_passadis` enum('passadis 1','passadis 2','passadis 3','passadis 4','passadis 5','passadis 6','passadis 7','passadis 8','passadis 9','passadis 10','passadis 11','passadis 12') COLLATE utf8_unicode_ci NOT NULL,
  `num_lleixa` enum('lleixa 1','lleixa 2','lleixa 3','lleixa 4','lleixa 5','lleixa 6','lleixa 7','lleixa 8') COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_persona`
--

CREATE TABLE `tbl_persona` (
  `pers_id` int(11) NOT NULL,
  `pers_nom` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `pers_pass` varchar(20) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `tbl_persona`
--

INSERT INTO `tbl_persona` (`pers_id`, `pers_nom`, `pers_pass`) VALUES
(1, 'Musta', '123'),
(2, 'Alejandro', '123');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_producte`
--

CREATE TABLE `tbl_producte` (
  `prod_id` int(11) NOT NULL,
  `prod_nom` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `prod_preu` decimal(8,0) NOT NULL,
  `prod_foto` varchar(300) COLLATE utf8_unicode_ci NOT NULL,
  `categoria_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `tbl_producte`
--

INSERT INTO `tbl_producte` (`prod_id`, `prod_nom`, `prod_preu`, `prod_foto`, `categoria_id`) VALUES
(1, 'Audi A5', '41000', 'C:\\Users\\Tafo\\Documents\\NetBeansProjects\\Proyecto_4\\FotosProyecto4\\audia5.jpg', 1),
(2, 'Jeep Grand Cherokee', '51000', 'C:\\Users\\Tafo\\Documents\\NetBeansProjects\\Proyecto_4\\FotosProyecto4\\jeep.jpg', 2),
(3, 'BMW 645', '90590', 'C:\\Users\\Tafo\\Documents\\NetBeansProjects\\Proyecto_4\\FotosProyecto4\\bmw645.jpg', 3),
(4, 'Porsche Panamera', '90000', 'C:\\Users\\Tafo\\Documents\\NetBeansProjects\\Proyecto_4\\FotosProyecto4\\panamera.jpg', 4),
(5, 'Mercedes CLk', '49800', 'C:\\Users\\Tafo\\Documents\\NetBeansProjects\\Proyecto_4\\FotosProyecto4\\mercedesclk.jpg', 4),
(6, 'Mercedes ML', '63200', 'C:\\Users\\Tafo\\Documents\\NetBeansProjects\\Proyecto_4\\FotosProyecto4\\mercedesml.jpg', 2),
(7, 'Audi R8 3.0', '73100', 'C:\\Users\\Tafo\\Documents\\NetBeansProjects\\Proyecto_4\\FotosProyecto4\\r8.jpg', 3),
(8, 'Bentley Continental', '120500', 'C:UsersTafoDocumentsNetBeansProjectsProyecto_4FotosProyecto4entley.jpg', 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_proveidor`
--

CREATE TABLE `tbl_proveidor` (
  `prov_id` int(11) NOT NULL,
  `prov_nom` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `prov_adre` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `prov_email` varchar(100) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `tbl_categoria`
--
ALTER TABLE `tbl_categoria`
  ADD PRIMARY KEY (`categoria_id`);

--
-- Indices de la tabla `tbl_comanda`
--
ALTER TABLE `tbl_comanda`
  ADD PRIMARY KEY (`comanda_id`),
  ADD KEY `FK_comanda_prov` (`prov_id`);

--
-- Indices de la tabla `tbl_detall_com`
--
ALTER TABLE `tbl_detall_com`
  ADD PRIMARY KEY (`detall_com_id`),
  ADD KEY `FK_detall_com_prod` (`prod_id`),
  ADD KEY `FK_detall_com_comanda` (`comanda_id`);

--
-- Indices de la tabla `tbl_estoc`
--
ALTER TABLE `tbl_estoc`
  ADD PRIMARY KEY (`estoc_id`),
  ADD KEY `FK_estoc_prod` (`prod_id`),
  ADD KEY `FK_estoc_lloc` (`lloc_id`);

--
-- Indices de la tabla `tbl_lloc`
--
ALTER TABLE `tbl_lloc`
  ADD PRIMARY KEY (`lloc_id`);

--
-- Indices de la tabla `tbl_persona`
--
ALTER TABLE `tbl_persona`
  ADD PRIMARY KEY (`pers_id`);

--
-- Indices de la tabla `tbl_producte`
--
ALTER TABLE `tbl_producte`
  ADD PRIMARY KEY (`prod_id`),
  ADD KEY `FK_producte_categoria` (`categoria_id`);

--
-- Indices de la tabla `tbl_proveidor`
--
ALTER TABLE `tbl_proveidor`
  ADD PRIMARY KEY (`prov_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `tbl_categoria`
--
ALTER TABLE `tbl_categoria`
  MODIFY `categoria_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT de la tabla `tbl_comanda`
--
ALTER TABLE `tbl_comanda`
  MODIFY `comanda_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `tbl_detall_com`
--
ALTER TABLE `tbl_detall_com`
  MODIFY `detall_com_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `tbl_estoc`
--
ALTER TABLE `tbl_estoc`
  MODIFY `estoc_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT de la tabla `tbl_lloc`
--
ALTER TABLE `tbl_lloc`
  MODIFY `lloc_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `tbl_persona`
--
ALTER TABLE `tbl_persona`
  MODIFY `pers_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `tbl_producte`
--
ALTER TABLE `tbl_producte`
  MODIFY `prod_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT de la tabla `tbl_proveidor`
--
ALTER TABLE `tbl_proveidor`
  MODIFY `prov_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `tbl_comanda`
--
ALTER TABLE `tbl_comanda`
  ADD CONSTRAINT `FK_comanda_prov` FOREIGN KEY (`prov_id`) REFERENCES `tbl_proveidor` (`prov_id`);

--
-- Filtros para la tabla `tbl_detall_com`
--
ALTER TABLE `tbl_detall_com`
  ADD CONSTRAINT `FK_detall_com_comanda` FOREIGN KEY (`comanda_id`) REFERENCES `tbl_comanda` (`comanda_id`),
  ADD CONSTRAINT `FK_detall_com_prod` FOREIGN KEY (`prod_id`) REFERENCES `tbl_producte` (`prod_id`);

--
-- Filtros para la tabla `tbl_estoc`
--
ALTER TABLE `tbl_estoc`
  ADD CONSTRAINT `FK_estoc_lloc` FOREIGN KEY (`lloc_id`) REFERENCES `tbl_lloc` (`lloc_id`),
  ADD CONSTRAINT `FK_estoc_prod` FOREIGN KEY (`prod_id`) REFERENCES `tbl_producte` (`prod_id`);

--
-- Filtros para la tabla `tbl_producte`
--
ALTER TABLE `tbl_producte`
  ADD CONSTRAINT `FK_producte_categoria` FOREIGN KEY (`categoria_id`) REFERENCES `tbl_categoria` (`categoria_id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
