-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 03-10-2020 a las 02:31:49
-- Versión del servidor: 10.4.11-MariaDB
-- Versión de PHP: 7.2.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `katalog`
--

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `addProducto` (`_short_name` VARCHAR(20), `_code` VARCHAR(200), `_name` VARCHAR(200), `_description` VARCHAR(1000), `_image` VARCHAR(255), `_link` VARCHAR(255), `_category_id` INT(11), `_is_public` TINYINT(1), `_is_featured` TINYINT(1), `_created_at` DATETIME, `_preciopost` VARCHAR(255), `_marca` VARCHAR(255), `_idUsuario` INT(11))  BEGIN
START TRANSACTION;
insert into post (short_name,code,name,description,image,link,category_id,is_public,is_featured,created_at,preciopost,marca) 
values (_short_name,_code,_name,_description,_image,_link,_category_id,_is_public,_is_featured,_created_at,_preciopost,_marca);
insert post_view (viewer_id,post_id,created_at,realip)
values ( _idUsuario ,LAST_INSERT_ID(),_created_at,'rr');
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `name` varchar(200) DEFAULT NULL,
  `short_name` varchar(200) DEFAULT NULL,
  `in_home` tinyint(1) DEFAULT 0,
  `in_menu` tinyint(1) DEFAULT 0,
  `is_active` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `category`
--

INSERT INTO `category` (`id`, `name`, `short_name`, `in_home`, `in_menu`, `is_active`) VALUES
(1, 'Cereales', 'Cereales', 0, 0, 1),
(2, 'Granos', 'Granos', 0, 0, 1),
(3, 'Lacteos', 'Lacteos', 0, 0, 1),
(6, 'Aseo', 'Aseo', 0, 0, 1),
(10, 'Dulces', 'Dulces', 0, 0, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `configuration`
--

CREATE TABLE `configuration` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `label` varchar(200) DEFAULT NULL,
  `kind` int(11) DEFAULT NULL,
  `val` text DEFAULT NULL,
  `cfg_id` int(11) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `configuration`
--

INSERT INTO `configuration` (`id`, `name`, `label`, `kind`, `val`, `cfg_id`) VALUES
(1, 'general_main_title', 'Titulo Principal', 1, 'TEACERCA', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `post`
--

CREATE TABLE `post` (
  `id` int(11) NOT NULL,
  `short_name` varchar(20) DEFAULT NULL,
  `name` varchar(200) DEFAULT NULL,
  `code` varchar(200) DEFAULT NULL,
  `description` varchar(1000) DEFAULT NULL,
  `offer_txt` varchar(1000) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `link` varchar(255) DEFAULT NULL,
  `is_featured` tinyint(1) DEFAULT 0,
  `is_public` tinyint(1) DEFAULT 0,
  `created_at` datetime DEFAULT NULL,
  `order_at` datetime DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `preciopost` varchar(255) DEFAULT NULL,
  `marca` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `post`
--

INSERT INTO `post` (`id`, `short_name`, `name`, `code`, `description`, `offer_txt`, `image`, `link`, `is_featured`, `is_public`, `created_at`, `order_at`, `category_id`, `preciopost`, `marca`) VALUES
(36, 'mv9IeP-u6lM', 'BonBonBum', '1', 'Bonbonbun rojo sabor a fresa \r\nx 24 unidades\r\n\r\n', NULL, 'thumbnail.jpg', '', 1, 1, '2020-09-20 19:28:58', NULL, 10, '10.000', 'Colombina'),
(37, 'Z2kl4SMpbfg', 'MaX combi', '2', 'Paquete de 100 Dulces extra deliciosos\r\n', NULL, 'thumbnail_1.jpg', '', 1, 0, '2020-09-21 00:17:11', NULL, 10, '5.600', 'Colombina'),
(40, 'rxVSujkEQio', 'Colombinas', '3', 'Paquete de 25 colombinas en forma de corazón \r\n', NULL, 'colombina.jpg', '', 1, 1, '2020-09-21 21:09:39', NULL, 10, '5000', 'Colombina'),
(42, 'NuzmtuHRcaD', 'Barrilete ', '4', 'Paquete de Bariletes x 50 unidades ', NULL, 'barrilete_50-_super.jpg', '', 0, 1, '2020-09-22 23:19:45', NULL, 10, '1000', 'Super'),
(43, '8cOeKkooQbD', 'BonBonBum', '5', 'BonBonbum Hielo x 24 unidades', NULL, 'bombonbum_Hielo-_colombina_24_unidades.jpg', '', 0, 1, '2020-09-22 23:21:57', NULL, 10, '10.000', 'Colombina'),
(44, 'KfWiEqimvi6', 'BonBonBum', '6', 'BonBonBum surtido x 24 unidades ', NULL, 'bombonbum_surtido-_colombina_24_unidades.jpg', '', 0, 1, '2020-09-22 23:24:07', NULL, 10, '10.000', 'Colombina'),
(45, 'rTQcl2BzCHy', 'Big Ben', '7', 'Caramelos Big Ben\r\n', NULL, 'caramelos_big_ben-super.jpg', '', 0, 1, '2020-09-22 23:25:41', NULL, 10, '1.500', 'Super'),
(46, 'nPqHSt04w6I', 'Chocolates M&M', '8', 'Delicioso Chocolates M&M ', NULL, 'chocolate_mym.jpg', '', 0, 1, '2020-09-22 23:29:57', NULL, 10, '2.800', 'm&m\'s'),
(47, 'b1lhaLtjJDL', 'Frunas', '9', 'Paquete de frunas mixto x 12 unidades\r\n', NULL, 'frunas_12.jpg', '', 0, 1, '2020-09-22 23:32:25', NULL, 10, '5000', 'Colombina'),
(48, 'dK2vTLMyIZ0', 'Ositos de Goma', '10', 'Paquete de ositos de goma ', NULL, 'grissly_oso-colombina.jpg', '', 0, 1, '2020-09-22 23:33:59', NULL, 10, '1.500', 'Colombina'),
(49, 'YU289d7xOKr', 'Bananitas de Goma', '11', 'Paquete de Bananitas de Goma \r\n', NULL, 'troli_banana-colombina.jpg', '', 0, 1, '2020-09-22 23:35:51', NULL, 10, '1.500', 'Colombina'),
(50, '5v2mz3rBz3U', 'Gomitas de Aros', '12', 'Paquete de Gomitas De Aros', NULL, 'trululu_aros-Super.jpg', '', 0, 1, '2020-09-22 23:38:34', NULL, 10, '1.500', 'Super'),
(51, 'oQuATV_AH1Y', 'Masmelos ', '13', 'Paquete de delicioso Mamelos x 15 unidades\r\n', NULL, 'masmelos_15-colombina.jpg', '', 0, 1, '2020-09-22 23:43:14', NULL, 10, '2.500', 'Colombina'),
(52, 'RlWjIrIMmtD', 'Cereales Choco Krispis', '1', 'Caja de Choco Krispis de 375g \r\n', NULL, 'cereales-choco_krispis-caja_kelloggs_375gr.jpg', '', 1, 1, '2020-09-23 13:08:56', NULL, 1, '20.000', 'Kelloggs'),
(53, 'lm1hffMKeuO', 'Cereales Froot Loops ', '2', 'Caja de Froot Loops de 375g\r\n\r\n', NULL, 'cereales-froot-loops-caja_kelloggs_375gr.jpg', '', 1, 1, '2020-09-23 13:11:01', NULL, 1, '20.000', 'Kelloggs'),
(54, 'GOW-t3fJ7lS', 'Cereales Froties', '3', 'Caja  de Froties  de 375g  ', NULL, 'cereales-frosties-caja_kelloggs_375gr.jpg', '', 0, 1, '2020-09-23 13:14:19', NULL, 1, '20.000', 'Kelloggs'),
(55, 'J4Bwmivv2qn', 'Cereales Nesquik', '4', 'Caja de  Nesquik de 375g  ', NULL, 'cereales-Nesquik-caja_Nestle_375gr.jpg', '', 0, 1, '2020-09-23 13:19:29', NULL, 1, '20.000', 'Nestle'),
(56, 'IRKT8lomAI1', 'Leche', '1', 'Bolsa de leche Alqueria entera cremosa  de 1100ml \r\n', NULL, 'leche_alqueria_1100ml.jpg', '', 0, 1, '2020-09-23 14:14:38', NULL, 3, '2.500', 'Alquería'),
(57, '4Y9zW5OAYkA', 'Leche', '2', 'Bolsa de leche Alqueria Deslactosada de fácil digestión  de 1100ml\r\n', NULL, 'leche_alqueria_deslactosada_1100ml.jpg', '', 0, 1, '2020-09-23 14:16:36', NULL, 3, '3.000', 'Alquería'),
(58, 'BH41PHZZOWr', 'Leche', '3', 'Bolsa de leche  entera de 1100ml\r\n', NULL, 'leche_parmalat_1100ml.jpg', '', 0, 1, '2020-09-23 14:19:09', NULL, 3, '2.000', 'Parmalat'),
(59, '94IFqnhTbYY', 'Leche', '4', 'Bolsa de leche entera de 900ml\r\n', NULL, 'Lechel_colanta_900m.jpg', '', 0, 1, '2020-09-23 14:21:15', NULL, 3, '2.500', 'Colanta'),
(60, 'DoWCCP2SQDJ', 'Leche en polvo ', '5', 'Leche en polvo Alqueria de 330g\r\n', NULL, 'leche_en_polvo_alqueria_330g.jpg', '', 0, 1, '2020-09-23 14:23:17', NULL, 3, '10.000', 'Alquería'),
(61, '1AhHcQqh_zM', 'Leche en polvo ', '6', 'Leche en polvo klim de 790g\r\n', NULL, 'leche_klim_Nestle_790g.jpg', '', 0, 1, '2020-09-23 14:26:35', NULL, 3, '15.000', 'Nestle'),
(62, 'CegKkLv35Bi', 'Leche en polvo ', '7', 'Leche en polvo de 500g\r\n', NULL, 'leche_en_polvo_colanta_500gr.jpg', '', 0, 1, '2020-09-23 14:28:54', NULL, 3, '11.000', 'Colanta'),
(63, 'gC03owa6bbj', 'Leche en polvo ', '8', 'Leche en polvo El Rodeo de 380g\r\n', NULL, 'leche_El_Rodeo_nestle_380g.jpg', '', 0, 1, '2020-09-23 14:30:13', NULL, 3, '8.000', 'Nestle'),
(64, 'nsT5u_5-Be8', 'Arroz', '1', 'Arroz Diana 500g ', NULL, 'Arroz_500g_Diana.jpg', '', 0, 1, '2020-09-29 12:29:05', NULL, 2, '1.900', 'Diana'),
(65, 'Y7kdooPxF_U', 'Arroz', '2', 'Arroz de calidad 500g', NULL, 'Arroz_500g_Roa.jpg', '', 0, 1, '2020-09-29 12:30:24', NULL, 2, '2.000', 'roa'),
(66, 'g5TUR7VA-jk', 'Arroz', '3', 'El mejor Arroz 500g', NULL, 'Arroz_500g_Florihula.jpg', '', 0, 1, '2020-09-29 12:31:43', NULL, 2, '2.000', 'Florhuila'),
(67, 'i3HyLMKU0QS', 'Arroz', '3', 'Arroz buen 500g', NULL, 'Arroz_500g_Supremo.png', '', 0, 1, '2020-09-29 12:32:09', NULL, 2, '1.900', 'Supremo'),
(68, '5cysHjDiyxo', 'Frijol', '5', 'Frijol bola rojo de la mejor calidad de 500g', NULL, 'Frijol_500g_El_trece.png', '', 0, 1, '2020-09-29 12:35:34', NULL, 2, '2.500', 'el Trece'),
(69, 'm9vgGaohqo5', 'Frijol', '6', 'Frijol Diana de calidad bola roja 500g', NULL, 'Frijol_500g_Diana.png', '', 0, 1, '2020-09-29 12:37:03', NULL, 2, '2.800', 'Frijol'),
(70, 'u8alTWoUAOZ', 'Frijol', '7', 'La mejor calidad en Frijoles 500g', NULL, 'Frijol_500g_Maritza.png', '', 0, 1, '2020-09-29 12:40:22', NULL, 2, '2.700', 'Maritza'),
(71, 'r5gyDrM_l4-', 'Frijol', '8', 'Frijoles deliciosos de 500g', NULL, 'Frijol_500g_Marca_SuDepensa.jpg', '', 0, 1, '2020-09-29 12:43:37', NULL, 2, '2.500', 'SuDespensa'),
(72, 'm6lWqLh4Rio', 'Lentejas', '9', 'La mejor calidad en lentejas de 500g', NULL, 'Lentejas_500g_Marca_DEREYES.jpg', '', 0, 1, '2020-09-29 12:50:24', NULL, 2, '2.300', 'DEREYES'),
(73, '4iRdnmE5u28', 'Lentejas', '11', 'Diana las mejores Lentejas 500g', NULL, 'Lentejas_500g_Marca_Diana.jpg', '', 0, 1, '2020-09-29 13:13:43', NULL, 2, '2.700', 'Diana'),
(75, 'ka-RpM-MyUJ', 'Pastilas', '20', 'Patillas super dulces x 24', NULL, 'Pastille_mega_Dulce_440g_Docile.jpg', '', 0, 1, '2020-09-30 14:34:38', NULL, 10, '5.000', 'Colombina');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `post_view`
--

CREATE TABLE `post_view` (
  `id` int(11) NOT NULL,
  `viewer_id` int(11) DEFAULT NULL,
  `post_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `realip` varchar(16) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `post_view`
--

INSERT INTO `post_view` (`id`, `viewer_id`, `post_id`, `created_at`, `realip`) VALUES
(16, 8, 36, '0000-00-00 00:00:00', '\'rr\''),
(17, 8, 37, '0000-00-00 00:00:00', '\'rr\''),
(20, 8, 40, '0000-00-00 00:00:00', '\'rr\''),
(22, 8, 42, '0000-00-00 00:00:00', '\'rr\''),
(23, 8, 43, '0000-00-00 00:00:00', '\'rr\''),
(24, 8, 44, '0000-00-00 00:00:00', '\'rr\''),
(25, 8, 45, '0000-00-00 00:00:00', '\'rr\''),
(26, 8, 46, '0000-00-00 00:00:00', '\'rr\''),
(27, 8, 47, '0000-00-00 00:00:00', '\'rr\''),
(28, 8, 48, '0000-00-00 00:00:00', '\'rr\''),
(29, 8, 49, '0000-00-00 00:00:00', '\'rr\''),
(30, 8, 50, '0000-00-00 00:00:00', '\'rr\''),
(31, 8, 51, '0000-00-00 00:00:00', '\'rr\''),
(32, 15, 52, '0000-00-00 00:00:00', '\'rr\''),
(33, 15, 53, '0000-00-00 00:00:00', '\'rr\''),
(34, 15, 54, '0000-00-00 00:00:00', '\'rr\''),
(35, 15, 55, '0000-00-00 00:00:00', '\'rr\''),
(36, 20, 56, '0000-00-00 00:00:00', '\'rr\''),
(37, 20, 57, '0000-00-00 00:00:00', '\'rr\''),
(38, 20, 58, '0000-00-00 00:00:00', '\'rr\''),
(39, 20, 59, '0000-00-00 00:00:00', '\'rr\''),
(40, 20, 60, '0000-00-00 00:00:00', '\'rr\''),
(41, 20, 61, '0000-00-00 00:00:00', '\'rr\''),
(42, 20, 62, '0000-00-00 00:00:00', '\'rr\''),
(43, 20, 63, '0000-00-00 00:00:00', '\'rr\''),
(44, 23, 64, '0000-00-00 00:00:00', '\'rr\''),
(45, 23, 65, '0000-00-00 00:00:00', '\'rr\''),
(46, 23, 66, '0000-00-00 00:00:00', '\'rr\''),
(47, 23, 67, '0000-00-00 00:00:00', '\'rr\''),
(48, 23, 68, '0000-00-00 00:00:00', '\'rr\''),
(49, 23, 69, '0000-00-00 00:00:00', '\'rr\''),
(50, 23, 70, '0000-00-00 00:00:00', '\'rr\''),
(51, 23, 71, '0000-00-00 00:00:00', '\'rr\''),
(52, 23, 72, '0000-00-00 00:00:00', '\'rr\''),
(53, 23, 73, '0000-00-00 00:00:00', '\'rr\''),
(55, 8, 75, '0000-00-00 00:00:00', '\'rr\'');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `slide`
--

CREATE TABLE `slide` (
  `id` int(11) NOT NULL,
  `title` varchar(200) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `is_public` tinyint(1) DEFAULT 0,
  `position` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `slide`
--

INSERT INTO `slide` (`id`, `title`, `image`, `is_public`, `position`, `created_at`) VALUES
(1, 'Endulza tu día', 'dulces.jpg', 1, NULL, '2020-09-08 19:18:33'),
(2, 'Los Mejores Productos', 'slider_Lechel.jpg', 1, NULL, '2020-09-10 16:32:51'),
(3, 'Protege tu Hogar', 'Productos-de-aseo.jpg', 1, NULL, '2020-09-15 15:42:48'),
(4, 'Las Mejores Marcas ', 'slider_cereales.jpg', 1, NULL, '2020-09-23 13:20:38'),
(5, 'Bienvenido!!!', 'shop.jpg', 1, NULL, '2020-09-30 14:37:24');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `lastname` varchar(50) DEFAULT NULL,
  `username` varchar(50) DEFAULT NULL,
  `nameshop` varchar(100) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT 1,
  `is_admin` tinyint(1) DEFAULT 0,
  `created_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `user`
--

INSERT INTO `user` (`id`, `name`, `lastname`, `username`, `nameshop`, `address`, `email`, `password`, `is_active`, `is_admin`, `created_at`) VALUES
(1, 'Admin', '', 'admin', NULL, 'Transversal 142 # 150 - 50', '', '90b9aa7e25f80cf4f64e990b78a9fc5ebd6cecad', 1, 1, '2020-09-08 18:14:59'),
(8, 'Daniel', 'Castañeda', 'Danni', 'Surti Max', 'Soacha diagonal 28 #29-27', 'danielescobarcerrato@outlook.com', 'fe703d258c7ef5f50b71e06565a65aa07194907f', 1, 0, '2020-09-15 15:40:59'),
(15, 'Breyner', 'Blandon', 'Breyner', 'Maxti', 'Bogota Calle 52 # 13 - 65', 'bblandon30@misena.edu.co', 'fe703d258c7ef5f50b71e06565a65aa07194907f', 1, 0, '2020-09-20 14:54:03'),
(17, 'Jonnys', 'Garcias', 'Jonny', 'Dulces', 'BogotaTransversal142 # 150 - 50', 'jonnyal96@gmail.com', 'df58771e89ee0c1c30f9950398cdb31e7130d51f', 1, 0, '2020-09-20 15:11:32'),
(20, 'Sebastian', 'Vanegas', 'sebastian', 'Surti ', 'BogotaCalle138 # 152 - 14', 'sebastian@gmail.com', 'fe703d258c7ef5f50b71e06565a65aa07194907f', 1, 0, '2020-09-21 15:27:08'),
(21, 'Leixer', 'Cardona', 'Leixer', 'Dónde leixer', 'Bogota Calle 145 # 12 - 12', 'leixercardona@gmail.com', '90b9aa7e25f80cf4f64e990b78a9fc5ebd6cecad', 1, 0, '2020-09-21 20:43:19'),
(23, 'Rafael', 'Ortega', 'Rafael ', 'Surty Rafa', 'Bogota Calle 138 # 152 - 14', 'rafaelortega@gmail.com', 'fe703d258c7ef5f50b71e06565a65aa07194907f', 1, 0, '2020-09-22 21:11:52'),
(25, 'Romeo', 'Castañeda', 'Romeo', 'Surti todo', 'BogotaCalle156 # 45 - 14', 'danielricardoromeo@outlook.com', 'fe703d258c7ef5f50b71e06565a65aa07194907f', 1, 0, '2020-09-30 14:40:04'),
(26, 'Katherin', 'Vanegas', 'Teacerca', 'Teacerca', 'BogotaDiagonal145 # 125 - 75', 'paulamontealegre17@gmail.com', '10470c3b4b1fed12c3baac014be15fac67c6e815', 1, 0, '2020-10-01 15:37:19');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `configuration`
--
ALTER TABLE `configuration`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indices de la tabla `post`
--
ALTER TABLE `post`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`category_id`);

--
-- Indices de la tabla `post_view`
--
ALTER TABLE `post_view`
  ADD PRIMARY KEY (`id`),
  ADD KEY `viewer_id` (`viewer_id`),
  ADD KEY `post_id` (`post_id`);

--
-- Indices de la tabla `slide`
--
ALTER TABLE `slide`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `configuration`
--
ALTER TABLE `configuration`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `post`
--
ALTER TABLE `post`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=78;

--
-- AUTO_INCREMENT de la tabla `post_view`
--
ALTER TABLE `post_view`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;

--
-- AUTO_INCREMENT de la tabla `slide`
--
ALTER TABLE `slide`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `post`
--
ALTER TABLE `post`
  ADD CONSTRAINT `post_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`);

--
-- Filtros para la tabla `post_view`
--
ALTER TABLE `post_view`
  ADD CONSTRAINT `post_view_ibfk_1` FOREIGN KEY (`viewer_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `post_view_ibfk_2` FOREIGN KEY (`post_id`) REFERENCES `post` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
