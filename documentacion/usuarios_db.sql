-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 02-12-2024 a las 23:05:05
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
  `fecha_entrevista` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `entrevista_barreras`
--

INSERT INTO `entrevista_barreras` (`id_entrevista`, `id_escuela`, `infraestructura_basica`, `barreras_economicas`, `acceso_recursos`, `alimentacion`, `entorno_familiar`, `grado_aspirado`, `problemas_salud`, `barreras_emocionales`, `transporte`, `tiempo_recreativo`, `fecha_entrevista`) VALUES
(2, 1, 'si', 'si', 'si', 'si', 'si', 'secundaria', 'si', 'si', 'si', 'si', '2024-12-02 17:13:25');

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
  `fecha_entrevista` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `entrevista_infraestructura`
--

INSERT INTO `entrevista_infraestructura` (`id_infraestructura`, `id_escuela`, `agua_potable`, `servicios_sanitarios`, `electricidad`, `mobiliario`, `internet`, `espacios_extra`, `seguridad`, `acceso_discapacidad`, `ventilacion`, `estado_edificio`, `fecha_entrevista`) VALUES
(1, 1, 'si', 'si', 'si', 'si', 'si', 'si', 'si', 'si', 'si', 'si', '2024-12-02 18:23:34');

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
  `fecha_entrevista` timestamp NOT NULL DEFAULT current_timestamp()
) ;

--
-- Volcado de datos para la tabla `entrevista_rezago`
--

INSERT INTO `entrevista_rezago` (`id_rezago`, `id_escuela`, `nivel_academico_profesor`, `grado_curso`, `turno`, `num_alumnos`, `habilidades_lectura`, `habilidades_matematicas`, `conocimientos_adecuados`, `rendimiento_por_bajo`, `metodo_ensenanza`, `recursos_didacticos`, `fecha_entrevista`) VALUES
(1, 1, 'secundaria', 4, 'vespertino', 45, 57, 78, 78, 66, 'aprendizaje_colaborativo', 'si', '2024-12-02 21:16:52'),
(2, 1, 'sin_estudios', 4, 'matutino', 90, 80, 1, 0, 99, 'exposicion', 'si', '2024-12-02 21:59:58');

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
  `fecha_registro` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `escuelas`
--

INSERT INTO `escuelas` (`id_escuela`, `nombre`, `municipio`, `direccion`, `num_maestros`, `num_alumnos`, `fecha_registro`) VALUES
(1, 'Rafael', 'Ocoyucan', 'hsdhsh', 10, 150, '2024-12-02 17:03:19'),
(2, 'asd', 'Puebla', 'csdfds', 13, 13, '2024-12-02 21:46:03');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id_usuario` int(11) NOT NULL,
  `correo` varchar(100) NOT NULL,
  `contraseña` varchar(255) NOT NULL,
  `fecha_creacion` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id_usuario`, `correo`, `contraseña`, `fecha_creacion`) VALUES
(1, 'saul.tl0307@gmail.com', '123456789a', '2024-12-02 07:54:09');

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
  MODIFY `id_entrevista` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `entrevista_infraestructura`
--
ALTER TABLE `entrevista_infraestructura`
  MODIFY `id_infraestructura` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `entrevista_rezago`
--
ALTER TABLE `entrevista_rezago`
  MODIFY `id_rezago` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `escuelas`
--
ALTER TABLE `escuelas`
  MODIFY `id_escuela` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

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
