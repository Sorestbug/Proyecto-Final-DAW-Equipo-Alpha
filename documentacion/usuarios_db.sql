-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 04-12-2024 a las 12:11:57
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `usuarios_db`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `entrevista_barreras`
--

CREATE TABLE `entrevista_barreras` (
  `id_entrevista` int(11) NOT NULL,
  `id_escuela` int(11) NOT NULL,
  `infraestructura_basica` enum('si','no','intermitente') NOT NULL,
  `barreras_economicas` enum('si','no','a_veces') NOT NULL,
  `acceso_recursos` enum('si','le_falta','no') NOT NULL,
  `alimentacion` enum('si','no','intermitente') NOT NULL,
  `entorno_familiar` enum('si','no','a_veces') NOT NULL,
  `grado_aspirado` enum('secundaria','preparatoria','universidad','posgrado','no_claro') NOT NULL,
  `problemas_salud` enum('si','no','no_seguro') NOT NULL,
  `barreras_emocionales` enum('si','no','a_veces') NOT NULL,
  `transporte` enum('si','no','a_veces') NOT NULL,
  `tiempo_recreativo` enum('si','no','a_veces') NOT NULL,
  `fecha_entrevista` timestamp NOT NULL DEFAULT current_timestamp(),
  `eliminado` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `entrevista_barreras`
--

INSERT INTO `entrevista_barreras` (`id_entrevista`, `id_escuela`, `infraestructura_basica`, `barreras_economicas`, `acceso_recursos`, `alimentacion`, `entorno_familiar`, `grado_aspirado`, `problemas_salud`, `barreras_emocionales`, `transporte`, `tiempo_recreativo`, `fecha_entrevista`, `eliminado`) VALUES
(2, 1, 'si', 'si', 'si', 'si', 'si', 'secundaria', 'si', 'si', 'si', 'si', '2024-12-02 17:13:25', 1),
(3, 3, 'si', 'si', 'le_falta', 'si', 'a_veces', 'preparatoria', 'no', 'a_veces', 'si', 'a_veces', '2024-12-04 17:52:14', 0),
(4, 3, 'si', 'si', 'le_falta', 'si', 'si', 'universidad', 'no_seguro', 'si', 'a_veces', 'si', '2024-12-04 17:53:04', 0),
(5, 3, 'intermitente', 'a_veces', 'le_falta', 'intermitente', 'si', 'preparatoria', 'no', 'si', 'si', 'a_veces', '2024-12-04 17:53:47', 0),
(6, 3, 'si', 'a_veces', 'no', 'si', 'si', 'secundaria', 'no', 'a_veces', 'si', 'si', '2024-12-04 17:54:58', 0),
(7, 3, 'si', 'no', 'si', 'si', 'si', 'posgrado', 'no', 'no', 'si', 'si', '2024-12-04 17:55:43', 0),
(8, 3, 'intermitente', 'a_veces', 'le_falta', 'si', 'a_veces', 'universidad', 'no', 'si', 'no', 'a_veces', '2024-12-04 17:56:56', 0),
(9, 3, 'si', 'no', 'si', 'si', 'si', 'no_claro', 'no_seguro', 'a_veces', 'si', 'a_veces', '2024-12-04 17:58:23', 0),
(10, 3, 'si', 'a_veces', 'le_falta', 'si', 'a_veces', 'universidad', 'no', 'no', 'si', 'si', '2024-12-04 18:00:09', 0),
(11, 3, 'intermitente', 'no', 'no', 'no', 'si', 'secundaria', 'no_seguro', 'si', 'a_veces', 'si', '2024-12-04 18:00:38', 0),
(12, 3, 'si', 'a_veces', 'le_falta', 'intermitente', 'no', 'posgrado', 'no', 'no', 'si', 'si', '2024-12-04 18:00:57', 0),
(13, 3, 'no', 'no', 'si', 'intermitente', 'si', 'universidad', 'si', 'a_veces', 'a_veces', 'a_veces', '2024-12-04 18:01:33', 0),
(14, 3, 'si', 'si', 'le_falta', 'si', 'no', 'posgrado', 'no_seguro', 'si', 'no', 'si', '2024-12-04 18:01:52', 0),
(15, 4, 'no', 'si', 'si', 'no', 'a_veces', 'universidad', 'no', 'si', 'no', 'no', '2024-12-04 18:02:29', 0),
(16, 4, 'si', 'no', 'le_falta', 'intermitente', 'si', 'preparatoria', 'no_seguro', 'a_veces', 'si', 'no', '2024-12-04 18:02:44', 0),
(17, 4, 'intermitente', 'no', 'si', 'si', 'no', 'universidad', 'si', 'no', 'si', 'si', '2024-12-04 18:03:05', 0),
(18, 4, 'si', 'si', 'le_falta', 'si', 'a_veces', 'posgrado', 'si', 'si', 'no', 'a_veces', '2024-12-04 18:03:25', 0),
(19, 4, 'no', 'a_veces', 'si', 'no', 'si', 'preparatoria', 'no_seguro', 'si', 'si', 'a_veces', '2024-12-04 18:03:43', 0),
(20, 4, 'si', 'si', 'le_falta', 'intermitente', 'no', 'no_claro', 'si', 'si', 'si', 'si', '2024-12-04 18:04:19', 0),
(21, 4, 'no', 'si', 'si', 'no', 'si', 'posgrado', 'no', 'a_veces', 'a_veces', 'no', '2024-12-04 18:04:38', 0),
(22, 4, 'si', 'si', 'si', 'si', 'no', 'universidad', 'no_seguro', 'si', 'no', 'a_veces', '2024-12-04 18:04:57', 0),
(23, 4, 'intermitente', 'a_veces', 'no', 'si', 'a_veces', 'secundaria', 'no', 'a_veces', 'si', 'si', '2024-12-04 18:05:18', 0),
(24, 4, 'si', 'si', 'le_falta', 'intermitente', 'si', 'preparatoria', 'si', 'no', 'a_veces', 'no', '2024-12-04 18:05:50', 0),
(25, 4, 'intermitente', 'no', 'si', 'intermitente', 'si', 'universidad', 'no_seguro', 'no', 'si', 'si', '2024-12-04 18:06:09', 0),
(26, 4, 'no', 'si', 'si', 'si', 'no', 'preparatoria', 'si', 'a_veces', 'a_veces', 'si', '2024-12-04 18:06:31', 0),
(27, 5, 'si', 'si', 'le_falta', 'si', 'si', 'posgrado', 'no', 'si', 'si', 'si', '2024-12-04 18:07:14', 0),
(28, 5, 'si', 'a_veces', 'si', 'si', 'a_veces', 'universidad', 'si', 'no', 'a_veces', 'no', '2024-12-04 18:07:35', 0),
(29, 5, 'intermitente', 'no', 'le_falta', 'si', 'si', 'universidad', 'no', 'a_veces', 'si', 'si', '2024-12-04 18:07:54', 0),
(30, 5, 'intermitente', 'no', 'le_falta', 'intermitente', 'si', 'universidad', 'no', 'si', 'a_veces', 'no', '2024-12-04 18:08:21', 0),
(31, 5, 'no', 'si', 'si', 'si', 'no', 'no_claro', 'si', 'si', 'si', 'si', '2024-12-04 18:08:38', 0),
(32, 5, 'si', 'a_veces', 'si', 'intermitente', 'a_veces', 'posgrado', 'no', 'si', 'no', 'si', '2024-12-04 18:08:59', 0),
(33, 5, 'intermitente', 'no', 'le_falta', 'si', 'no', 'secundaria', 'si', 'si', 'si', 'a_veces', '2024-12-04 18:09:27', 0),
(34, 5, 'si', 'si', 'si', 'intermitente', 'a_veces', 'universidad', 'no', 'si', 'a_veces', 'no', '2024-12-04 18:09:49', 0),
(35, 5, 'si', 'no', 'le_falta', 'si', 'no', 'preparatoria', 'si', 'no', 'si', 'a_veces', '2024-12-04 18:10:07', 0),
(36, 5, 'intermitente', 'no', 'si', 'no', 'a_veces', 'posgrado', 'no_seguro', 'si', 'si', 'si', '2024-12-04 18:10:36', 0),
(37, 5, 'si', 'si', 'le_falta', 'intermitente', 'si', 'universidad', 'si', 'a_veces', 'no', 'a_veces', '2024-12-04 18:10:52', 0),
(38, 5, 'si', 'no', 'si', 'intermitente', 'si', 'posgrado', 'no', 'no', 'si', 'si', '2024-12-04 18:11:25', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `entrevista_infraestructura`
--

CREATE TABLE `entrevista_infraestructura` (
  `id_infraestructura` int(11) NOT NULL,
  `id_escuela` int(11) NOT NULL,
  `agua_potable` enum('si','intermitente','no') NOT NULL,
  `servicios_sanitarios` enum('si','parcialmente','no') NOT NULL,
  `electricidad` enum('si','intermitente','no') NOT NULL,
  `mobiliario` enum('si','parcialmente','no') NOT NULL,
  `internet` enum('si','solo_maestros','solo_laboratorios','no') NOT NULL,
  `espacios_extra` enum('si','parcialmente','no') NOT NULL,
  `seguridad` enum('si','parcialmente','no') NOT NULL,
  `acceso_discapacidad` enum('si','parcialmente','no') NOT NULL,
  `ventilacion` enum('si','parcialmente','no') NOT NULL,
  `estado_edificio` enum('si','parcialmente','no') NOT NULL,
  `fecha_entrevista` timestamp NOT NULL DEFAULT current_timestamp(),
  `eliminado` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `entrevista_infraestructura`
--

INSERT INTO `entrevista_infraestructura` (`id_infraestructura`, `id_escuela`, `agua_potable`, `servicios_sanitarios`, `electricidad`, `mobiliario`, `internet`, `espacios_extra`, `seguridad`, `acceso_discapacidad`, `ventilacion`, `estado_edificio`, `fecha_entrevista`, `eliminado`) VALUES
(1, 1, 'si', 'si', 'si', 'si', 'si', 'si', 'si', 'si', 'si', 'si', '2024-12-02 18:23:34', 1),
(2, 3, 'si', 'parcialmente', 'si', 'parcialmente', 'solo_maestros', 'si', 'no', 'no', 'parcialmente', 'parcialmente', '2024-12-04 17:04:52', 0),
(3, 4, 'intermitente', 'no', 'si', 'parcialmente', 'solo_laboratorios', 'parcialmente', 'no', 'no', 'parcialmente', 'parcialmente', '2024-12-04 17:05:55', 0),
(4, 5, 'si', 'parcialmente', 'si', 'si', 'no', 'parcialmente', 'parcialmente', 'si', 'parcialmente', 'si', '2024-12-04 17:07:28', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `entrevista_rezago`
--

CREATE TABLE `entrevista_rezago` (
  `id_rezago` int(11) NOT NULL,
  `id_escuela` int(11) NOT NULL,
  `nivel_academico_profesor` enum('sin_estudios','primaria','secundaria','preparatoria','licenciatura','maestria','doctorado') NOT NULL,
  `grado_curso` int(11) NOT NULL,
  `turno` enum('matutino','vespertino') NOT NULL,
  `num_alumnos` int(11) NOT NULL,
  `habilidades_lectura` tinyint(4) NOT NULL,
  `habilidades_matematicas` tinyint(4) NOT NULL,
  `conocimientos_adecuados` tinyint(4) NOT NULL,
  `rendimiento_por_bajo` tinyint(4) NOT NULL,
  `metodo_ensenanza` enum('exposicion','aprendizaje_proyectos','aprendizaje_colaborativo','estudio_independiente','otro') NOT NULL,
  `recursos_didacticos` enum('si','no','parcialmente') NOT NULL,
  `fecha_entrevista` timestamp NOT NULL DEFAULT current_timestamp(),
  `eliminado` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `entrevista_rezago`
--

INSERT INTO `entrevista_rezago` (`id_rezago`, `id_escuela`, `nivel_academico_profesor`, `grado_curso`, `turno`, `num_alumnos`, `habilidades_lectura`, `habilidades_matematicas`, `conocimientos_adecuados`, `rendimiento_por_bajo`, `metodo_ensenanza`, `recursos_didacticos`, `fecha_entrevista`, `eliminado`) VALUES
(1, 1, 'secundaria', 4, 'vespertino', 45, 57, 78, 78, 66, 'aprendizaje_colaborativo', 'si', '2024-12-02 21:16:52', 1),
(2, 1, 'sin_estudios', 4, 'matutino', 90, 80, 1, 0, 99, 'exposicion', 'si', '2024-12-02 21:59:58', 1),
(3, 3, 'preparatoria', 1, 'matutino', 36, 36, 44, 61, 72, 'exposicion', 'parcialmente', '2024-12-04 17:17:29', 0),
(4, 3, 'preparatoria', 2, 'vespertino', 32, 47, 58, 68, 56, 'exposicion', 'parcialmente', '2024-12-04 17:18:37', 0),
(5, 3, 'licenciatura', 3, 'vespertino', 36, 51, 55, 70, 23, 'aprendizaje_colaborativo', 'si', '2024-12-04 17:19:49', 0),
(6, 3, 'licenciatura', 4, 'matutino', 34, 66, 67, 72, 11, 'aprendizaje_colaborativo', 'si', '2024-12-04 17:21:06', 0),
(7, 3, 'maestria', 5, 'matutino', 38, 58, 44, 62, 43, 'aprendizaje_proyectos', 'no', '2024-12-04 17:22:26', 0),
(8, 3, 'licenciatura', 6, 'matutino', 35, 52, 82, 78, 38, 'estudio_independiente', 'parcialmente', '2024-12-04 17:23:20', 0),
(9, 4, 'secundaria', 1, 'vespertino', 43, 26, 12, 46, 83, 'exposicion', 'no', '2024-12-04 17:25:09', 0),
(10, 4, 'secundaria', 2, 'matutino', 46, 44, 55, 69, 27, 'aprendizaje_colaborativo', 'parcialmente', '2024-12-04 17:26:51', 0),
(11, 4, 'preparatoria', 3, 'matutino', 39, 75, 62, 68, 27, 'estudio_independiente', 'parcialmente', '2024-12-04 17:28:01', 0),
(12, 4, 'preparatoria', 4, 'vespertino', 41, 72, 67, 70, 23, 'aprendizaje_proyectos', 'parcialmente', '2024-12-04 17:29:06', 0),
(13, 4, 'licenciatura', 5, 'vespertino', 43, 68, 59, 67, 33, 'estudio_independiente', 'no', '2024-12-04 17:29:59', 0),
(14, 4, 'licenciatura', 6, 'matutino', 38, 55, 59, 64, 41, 'exposicion', 'si', '2024-12-04 17:30:45', 0),
(15, 5, 'licenciatura', 1, 'vespertino', 32, 20, 18, 30, 84, 'exposicion', 'si', '2024-12-04 17:33:23', 0),
(16, 5, 'licenciatura', 2, 'vespertino', 34, 44, 56, 68, 37, 'estudio_independiente', 'parcialmente', '2024-12-04 17:34:19', 0),
(17, 5, 'maestria', 3, 'matutino', 29, 78, 81, 86, 12, 'aprendizaje_proyectos', 'parcialmente', '2024-12-04 17:35:08', 0),
(18, 5, 'maestria', 4, 'matutino', 37, 75, 82, 78, 23, 'aprendizaje_colaborativo', 'no', '2024-12-04 17:35:50', 0),
(19, 5, 'maestria', 5, 'matutino', 40, 81, 74, 83, 17, 'otro', 'no', '2024-12-04 17:37:14', 0),
(20, 5, 'doctorado', 6, 'vespertino', 39, 78, 78, 8, 17, 'otro', 'no', '2024-12-04 17:37:45', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `escuelas`
--

CREATE TABLE `escuelas` (
  `id_escuela` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `municipio` varchar(25) NOT NULL,
  `direccion` varchar(150) NOT NULL,
  `num_maestros` smallint(6) NOT NULL,
  `num_alumnos` smallint(6) NOT NULL,
  `fecha_registro` timestamp NOT NULL DEFAULT current_timestamp(),
  `eliminado` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `escuelas`
--

INSERT INTO `escuelas` (`id_escuela`, `nombre`, `municipio`, `direccion`, `num_maestros`, `num_alumnos`, `fecha_registro`, `eliminado`) VALUES
(1, 'Rafael', 'Ocoyucan', 'hsdhsh', 10, 150, '2024-12-02 17:03:19', 1),
(2, 'asd', 'Puebla', 'csdfds', 13, 13, '2024-12-02 21:46:03', 1),
(3, 'C.E.N.H.CH', 'Puebla', 'C. 10 Sur 1501, El Ángel, 72500 Heroica Puebla de Zaragoza, Pue.', 36, 1440, '2024-12-02 22:24:19', 0),
(4, 'Héroes de la Reforma', 'Puebla', 'Av. 13 Poniente #902 Col. Centro C.P. 72000 Puebla Pue. ', 42, 1764, '2024-12-04 16:56:50', 0),
(5, 'CEM', 'Puebla', 'Av. Jesús Reyes Heroles No. 4402 Col. Jesús González Ortega Puebla, Pue. Mex. C.P. 72040', 48, 1680, '2024-12-04 17:00:43', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id_usuario` int(11) NOT NULL,
  `correo` varchar(100) NOT NULL,
  `contraseña` varchar(255) NOT NULL,
  `fecha_creacion` timestamp NOT NULL DEFAULT current_timestamp(),
  `eliminado` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id_usuario`, `correo`, `contraseña`, `fecha_creacion`, `eliminado`) VALUES
(1, 'saul.tl0307@gmail.com', '123456789a', '2024-12-02 07:54:09', 0),
(2, 'sorestbug@gmail.com', '4321', '2024-12-02 22:14:19', 0);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `entrevista_barreras`
--
ALTER TABLE `entrevista_barreras`
  ADD PRIMARY KEY (`id_entrevista`),
  ADD KEY `id_escuela` (`id_escuela`);

--
-- Indices de la tabla `entrevista_infraestructura`
--
ALTER TABLE `entrevista_infraestructura`
  ADD PRIMARY KEY (`id_infraestructura`),
  ADD KEY `id_escuela` (`id_escuela`);

--
-- Indices de la tabla `entrevista_rezago`
--
ALTER TABLE `entrevista_rezago`
  ADD PRIMARY KEY (`id_rezago`),
  ADD KEY `id_escuela` (`id_escuela`);

--
-- Indices de la tabla `escuelas`
--
ALTER TABLE `escuelas`
  ADD PRIMARY KEY (`id_escuela`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id_usuario`),
  ADD UNIQUE KEY `correo` (`correo`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `entrevista_barreras`
--
ALTER TABLE `entrevista_barreras`
  MODIFY `id_entrevista` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT de la tabla `entrevista_infraestructura`
--
ALTER TABLE `entrevista_infraestructura`
  MODIFY `id_infraestructura` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `entrevista_rezago`
--
ALTER TABLE `entrevista_rezago`
  MODIFY `id_rezago` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de la tabla `escuelas`
--
ALTER TABLE `escuelas`
  MODIFY `id_escuela` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `entrevista_barreras`
--
ALTER TABLE `entrevista_barreras`
  ADD CONSTRAINT `entrevista_barreras_ibfk_1` FOREIGN KEY (`id_escuela`) REFERENCES `escuelas` (`id_escuela`);

--
-- Filtros para la tabla `entrevista_infraestructura`
--
ALTER TABLE `entrevista_infraestructura`
  ADD CONSTRAINT `entrevista_infraestructura_ibfk_1` FOREIGN KEY (`id_escuela`) REFERENCES `escuelas` (`id_escuela`);

--
-- Filtros para la tabla `entrevista_rezago`
--
ALTER TABLE `entrevista_rezago`
  ADD CONSTRAINT `entrevista_rezago_ibfk_1` FOREIGN KEY (`id_escuela`) REFERENCES `escuelas` (`id_escuela`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
