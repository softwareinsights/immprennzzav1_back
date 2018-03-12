-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 12-03-2018 a las 20:39:28
-- Versión del servidor: 10.1.9-MariaDB
-- Versión de PHP: 5.6.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `immprenzzaconstock`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `abono`
--

CREATE TABLE `abono` (
  `idabono` int(11) NOT NULL COMMENT '0|',
  `orden_idorden` int(11) NOT NULL COMMENT '1|Número de Orden|idorden',
  `adeudoAnterior` float NOT NULL COMMENT '1|Adeudo Anterior',
  `montoPagado` float NOT NULL COMMENT '1|Monto Abonando',
  `adeudoActual` float NOT NULL COMMENT '1|Adeudo Actual',
  `fecha` date NOT NULL COMMENT '1|Fecha',
  `hora` time NOT NULL COMMENT '1|Hora',
  `baja` tinyint(1) DEFAULT NULL COMMENT '0|',
  `created_by` int(11) DEFAULT NULL COMMENT '0|',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '0|',
  `modified_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '0|'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='1|1|Abono||fecha.Fecha';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `accuracyestimacion`
--

CREATE TABLE `accuracyestimacion` (
  `idaccuracyestimacion` int(11) NOT NULL COMMENT '0|Idaccuracytiempo',
  `empleado_idempleado` int(11) NOT NULL COMMENT '1|Empleado|**nombre persona.idpersona empleado.persona_idpersona',
  `ordentarea_idordentarea` int(11) NOT NULL COMMENT '1|Tarea|**nombre tarea.idtarea ordentarea.tarea_idtarea',
  `retraso` time NOT NULL COMMENT '1|Retraso en Miinutos',
  `accuracy` int(2) DEFAULT NULL COMMENT '1|Tino',
  `baja` tinyint(1) DEFAULT NULL COMMENT '0|',
  `created_by` int(11) DEFAULT NULL COMMENT '0|',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '0|',
  `modified_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '0|'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='1|1|Presición de Empleados en Estimación de Tareas||fecha.Fecha,empleado_empleado_idempleado.Empleado';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `accuracytiempo`
--

CREATE TABLE `accuracytiempo` (
  `idaccuracytiempo` int(11) NOT NULL COMMENT '0|Idaccuracytiempo',
  `empleado_idempleado` int(11) NOT NULL COMMENT '1|Empleado|**nombre persona.idpersona empleado.persona_idpersona',
  `fecha` date DEFAULT NULL COMMENT '1|Fecha Evaluando',
  `retraso` int(8) NOT NULL DEFAULT '0',
  `accuracy` float DEFAULT NULL COMMENT '1|Tino',
  `baja` tinyint(1) DEFAULT NULL COMMENT '0|',
  `created_by` int(11) DEFAULT NULL COMMENT '0|',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '0|',
  `modified_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '0|'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='1|1|Presición de Empleados en Tiempos Laborados||fecha.Fecha,empleado_empleado_idempleado.Empleado';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alerta`
--

CREATE TABLE `alerta` (
  `idalerta` int(11) NOT NULL COMMENT '0|',
  `empleado_idempleado` int(11) NOT NULL COMMENT '1|Dirigido a Empleado|**nombre persona.idpersona empleado.persona_idpersona',
  `tipoalerta_idtipoalerta` int(11) NOT NULL COMMENT '1|Tipo de Alerta|nombre',
  `mensaje` varchar(345) NOT NULL COMMENT '1|Mensaje',
  `vista` tinyint(1) DEFAULT NULL COMMENT '1|Vista',
  `leida` tinyint(1) DEFAULT NULL COMMENT '1|Leida',
  `baja` tinyint(1) DEFAULT NULL COMMENT '0|',
  `created_by` int(11) DEFAULT NULL COMMENT '0|',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '0|',
  `modified_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '0|'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='1|1|Alerta||empleado_empleado_idempleado.Empleado,tipoalerta_tipoalerta_idtipoalerta.Tipo de Alerta';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `archivo`
--

CREATE TABLE `archivo` (
  `idarchivo` int(11) NOT NULL COMMENT '0|',
  `ordentarea_idordentarea` int(11) NOT NULL COMMENT '1|Tarea|**nombre tarea.idtarea ordentarea.tarea_idtarea',
  `url` varchar(255) NOT NULL COMMENT '1|Url',
  `tipo` varchar(65) NOT NULL COMMENT '1|Tipo de Archivo',
  `baja` tinyint(1) DEFAULT NULL COMMENT '0|',
  `created_by` int(11) DEFAULT NULL COMMENT '0|',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '0|',
  `modified_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '0|'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='1|1|Archivo||url.URL,tipo.Tipo de Archivo,ordentarea_ordentarea_idordentarea.Tarea';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `area`
--

CREATE TABLE `area` (
  `idarea` int(11) NOT NULL COMMENT '0|',
  `nombre` varchar(45) NOT NULL COMMENT '1|Nombre',
  `baja` tinyint(1) DEFAULT NULL COMMENT '0|',
  `created_by` int(11) DEFAULT NULL COMMENT '0|',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '0|',
  `modified_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '0|'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='1|1|Área||nombre.Nombre';

--
-- Volcado de datos para la tabla `area`
--

INSERT INTO `area` (`idarea`, `nombre`, `baja`, `created_by`, `created_at`, `modified_at`) VALUES
(39, 'Administracion', NULL, NULL, '2018-03-03 06:06:52', '2018-03-03 06:06:52'),
(40, 'Produccion', NULL, NULL, '2018-03-03 06:06:52', '2018-03-03 06:06:52'),
(41, 'Diseno', NULL, NULL, '2018-03-03 06:06:52', '2018-03-03 06:06:52'),
(45, 'Recepcion', NULL, NULL, '2018-03-03 06:06:52', '2018-03-03 06:06:52');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `checkout`
--

CREATE TABLE `checkout` (
  `idcheckout` int(11) NOT NULL COMMENT '0|',
  `empleado_idempleado` int(11) NOT NULL COMMENT '1|Empleado|**nombre persona.idpersona empleado.persona_idpersona',
  `fecha` date DEFAULT NULL COMMENT '1|Fecha',
  `horaEntra` time DEFAULT NULL COMMENT '1|Hora de Entrada',
  `horaSale` time DEFAULT NULL COMMENT '1|Hora de Salida',
  `checkoutestado_idcheckoutestado` int(11) NOT NULL COMMENT '1|Estado|nombre',
  `baja` tinyint(1) DEFAULT NULL COMMENT '0|',
  `created_by` int(11) DEFAULT NULL COMMENT '0|',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '0|',
  `modified_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '0|'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='1|1|Checkout||fecha.Fecha,empleado_empleado_idempleado.Empleado';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `checkoutestado`
--

CREATE TABLE `checkoutestado` (
  `idcheckoutestado` int(11) NOT NULL COMMENT '0|',
  `nombre` varchar(15) NOT NULL COMMENT '1|Nombre',
  `baja` tinyint(1) DEFAULT NULL COMMENT '0|',
  `created_by` int(11) DEFAULT NULL COMMENT '0|',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '0|',
  `modified_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '0|'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ciudad`
--

CREATE TABLE `ciudad` (
  `idciudad` int(11) NOT NULL COMMENT '0|',
  `nombre` varchar(45) NOT NULL COMMENT '1|Ciudad',
  `baja` tinyint(1) DEFAULT NULL COMMENT '0|',
  `created_by` int(11) DEFAULT NULL COMMENT '0|',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '0|',
  `modified_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '0|'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='1|1|Ciudad';

--
-- Volcado de datos para la tabla `ciudad`
--

INSERT INTO `ciudad` (`idciudad`, `nombre`, `baja`, `created_by`, `created_at`, `modified_at`) VALUES
(1, 'CIUDAD GUZMÁN', NULL, 1, '2018-02-28 17:20:03', '2018-02-28 17:20:03');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `idcliente` int(11) NOT NULL COMMENT '0|',
  `persona_idpersona` int(11) NOT NULL COMMENT '1|Datos Personales|nombre',
  `rfc` varchar(45) DEFAULT NULL COMMENT '1|RFC',
  `razonsocial` varchar(45) DEFAULT NULL COMMENT '1|Razón Social',
  `email` varchar(45) DEFAULT NULL COMMENT '1|Email',
  `baja` tinyint(1) DEFAULT NULL COMMENT '0|',
  `created_by` int(11) DEFAULT NULL COMMENT '0|',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '0|',
  `modified_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '0|'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='1|1|Cliente||persona_persona_idpersona.Cliente,rfc.RFC,razonsocial.Razón Social,email.Email';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `concepto`
--

CREATE TABLE `concepto` (
  `idconcepto` int(11) NOT NULL COMMENT '0|',
  `nombre` varchar(45) NOT NULL COMMENT '1|Nombre',
  `baja` tinyint(1) DEFAULT NULL COMMENT '0|',
  `created_by` int(11) DEFAULT NULL COMMENT '0|',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '0|',
  `modified_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '0|'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='1|1|Concepto||nombre.Concepto';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `egresoconcepto`
--

CREATE TABLE `egresoconcepto` (
  `idegresoconcepto` int(11) NOT NULL COMMENT '0|',
  `concepto_idconcepto` int(11) NOT NULL COMMENT '1|Concepto|nombre',
  `fecha` date NOT NULL COMMENT '1|Fecha',
  `hora` time NOT NULL COMMENT '1|Hora',
  `precioSinIva` float DEFAULT NULL COMMENT '1|Precio Sin Iva',
  `precioConIva` float DEFAULT NULL COMMENT '1|Precio Con Iva',
  `cantidad` int(4) DEFAULT NULL COMMENT '1|Cantidad',
  `subtotal` float DEFAULT NULL COMMENT '1|Subtotal',
  `total` float NOT NULL COMMENT '1|Total',
  `empleado_idempleado` int(11) NOT NULL COMMENT '1|Empleado Que Realiza|**nombre persona.idpersona empleado.persona_idpersona',
  `baja` tinyint(1) DEFAULT NULL COMMENT '0|',
  `created_by` int(11) DEFAULT NULL COMMENT '0|',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '0|',
  `modified_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '0|'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='1|1|Egreso||fecha.Fecha,concepto_concepto_idconcepto.Concepto';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleado`
--

CREATE TABLE `empleado` (
  `idempleado` int(11) NOT NULL COMMENT '0|',
  `area_idarea` int(11) NOT NULL COMMENT '1|Área|nombre',
  `persona_idpersona` int(11) NOT NULL COMMENT '1|Datos Personales|nombre',
  `idlector` int(4) DEFAULT NULL COMMENT '1|ID de Lector',
  `fechaIngreso` date NOT NULL COMMENT '1|Fecha de Ingreso',
  `eficiencia` float DEFAULT NULL COMMENT '1|Eficiencia 0-5',
  `si_user_idsi_user` int(4) NOT NULL COMMENT '1|Usuario del Sistema|email',
  `horaEntrada` time NOT NULL COMMENT '1|Hora de Entrada a Laborar',
  `horaSalida` time NOT NULL COMMENT '1|Hora de Salida de Laborar',
  `horaComidaInicia` time DEFAULT NULL COMMENT '1|Hora de Inicio de Comida',
  `horaComidaTermina` time DEFAULT NULL COMMENT '1|Hora de Fin de Comida',
  `baja` tinyint(1) DEFAULT NULL COMMENT '0|',
  `created_by` int(11) DEFAULT NULL COMMENT '0|',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '0|',
  `modified_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '0|'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='1|1|Empleado||fechaIngreso.Fecha de Ingreso,persona_persona_idpersona.Empleado,area_area_idarea.Área';

--
-- Volcado de datos para la tabla `empleado`
--

INSERT INTO `empleado` (`idempleado`, `area_idarea`, `persona_idpersona`, `idlector`, `fechaIngreso`, `eficiencia`, `si_user_idsi_user`, `horaEntrada`, `horaSalida`, `horaComidaInicia`, `horaComidaTermina`, `baja`, `created_by`, `created_at`, `modified_at`) VALUES
(74, 39, 60, 1, '2017-06-01', NULL, 7, '09:00:00', '18:00:00', '14:00:00', '15:00:00', NULL, NULL, '2018-03-03 06:30:13', '2018-03-09 04:47:39'),
(75, 40, 61, 18, '2017-01-05', 44.62, 8, '09:00:00', '17:00:00', '13:00:00', '14:00:00', NULL, NULL, '2018-03-03 06:30:13', '2018-03-09 21:15:43'),
(76, 41, 62, 14, '2018-02-21', 83.02, 9, '09:00:00', '18:00:00', '14:00:00', '15:00:00', NULL, NULL, '2018-03-03 06:30:13', '2018-03-09 21:15:43'),
(77, 40, 63, 19, '2017-11-30', 32.38, 10, '09:00:00', '18:00:00', '14:00:00', '15:00:00', NULL, NULL, '2018-03-03 06:30:13', '2018-03-09 21:15:43'),
(78, 40, 64, 5, '2018-03-09', NULL, 11, '09:00:00', '18:00:00', '14:00:00', '15:00:00', NULL, NULL, '2018-03-03 06:30:13', '2018-03-09 18:10:56'),
(79, 39, 65, 6, '0000-00-00', 76.79, 12, '09:00:00', '18:00:00', '14:00:00', '15:00:00', NULL, NULL, '2018-03-03 06:30:13', '2018-03-09 21:15:43'),
(80, 45, 66, 7, '2018-01-11', 99.4, 13, '09:00:00', '18:00:00', '02:00:00', '15:00:00', NULL, NULL, '2018-03-03 06:30:13', '2018-03-09 21:15:43'),
(81, 45, 67, 8, '2018-03-02', 66.38, 14, '09:00:00', '18:00:00', '14:00:00', '15:00:00', NULL, NULL, '2018-03-03 06:30:13', '2018-03-09 21:15:43'),
(82, 40, 68, 9, '0000-00-00', 62.55, 15, '09:00:00', '18:00:00', '14:00:00', '15:00:00', NULL, NULL, '2018-03-03 06:30:13', '2018-03-09 21:15:43'),
(83, 39, 69, 10, '2018-03-07', 51.03, 16, '09:00:00', '18:00:00', '14:00:00', '15:00:00', NULL, NULL, '2018-03-03 06:30:13', '2018-03-09 21:15:43'),
(84, 39, 70, 11, '0000-00-00', NULL, 17, '09:00:00', '18:00:00', '14:00:00', '15:00:00', NULL, NULL, '2018-03-03 06:30:13', '2018-03-09 18:14:18'),
(85, 40, 71, 12, '0000-00-00', 78.96, 18, '09:00:00', '18:00:00', '14:00:00', '15:00:00', NULL, NULL, '2018-03-03 06:30:13', '2018-03-09 21:15:43'),
(86, 41, 72, 13, '0000-00-00', 91.79, 19, '09:00:00', '18:00:00', '14:00:00', '15:00:00', NULL, NULL, '2018-03-03 06:30:13', '2018-03-09 21:15:43'),
(87, 40, 73, 20, '0000-00-00', 32.38, 20, '09:00:00', '18:00:00', '14:00:00', '15:00:00', NULL, NULL, '2018-03-03 06:30:13', '2018-03-09 21:15:43'),
(88, 40, 74, 16, '0000-00-00', 52.54, 21, '09:00:00', '18:00:00', '14:00:00', '15:00:00', NULL, NULL, '2018-03-03 06:30:13', '2018-03-09 21:15:43'),
(89, 41, 75, 15, '0000-00-00', 71.27, 22, '09:00:00', '18:00:00', '14:00:00', '15:00:00', NULL, NULL, '2018-03-03 06:30:13', '2018-03-09 21:14:13'),
(90, 39, 76, 25, '0000-00-00', NULL, 23, '09:00:00', '18:00:00', '14:00:00', '15:00:00', NULL, NULL, '2018-03-03 06:30:13', '2018-03-09 18:14:18');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleadotarea`
--

CREATE TABLE `empleadotarea` (
  `idempleadotarea` int(11) NOT NULL COMMENT '0|',
  `empleado_idempleado` int(11) NOT NULL COMMENT '1|Empleado|**nombre persona.idpersona empleado.persona_idpersona',
  `ordentarea_idordentarea` int(11) NOT NULL COMMENT '1|Tarea|**nombre tarea.idtarea ordentarea.tarea_idtarea',
  `baja` tinyint(1) DEFAULT NULL COMMENT '0|',
  `created_by` int(11) DEFAULT NULL COMMENT '0|',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '0|',
  `modified_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '0|'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='1|1|Empleado Tarea||empleado_empleado_idempleado.Empleado,ordentarea_ordentarea_idordentarea.Tarea';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleadotareaestado`
--

CREATE TABLE `empleadotareaestado` (
  `idempleadotareaestado` int(11) NOT NULL COMMENT '0|',
  `empleadotarea_idempleadotarea` int(11) NOT NULL COMMENT '1|Empleado Tarea|idempleadotarea',
  `estadoscrum_idestadoscrum` int(11) NOT NULL COMMENT '1|Estado de Tarea|nombre',
  `fecha` date NOT NULL COMMENT '1|Fecha',
  `hora` time NOT NULL COMMENT '1|Hora',
  `baja` tinyint(1) DEFAULT NULL COMMENT '0|',
  `created_by` int(11) DEFAULT NULL COMMENT '0|',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '0|',
  `modified_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '0|'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='1|1|Empleado Tarea Estado||fecha.Fecha,estado_estado_idestado.Estado,empleadotarea_empleadotarea_idempleadotarea.Especificaciones de Orden Tarea';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estado`
--

CREATE TABLE `estado` (
  `idestado` int(11) NOT NULL COMMENT '0|',
  `nombre` varchar(45) NOT NULL COMMENT '1|Nombre',
  `baja` tinyint(1) DEFAULT NULL COMMENT '0|',
  `created_by` int(11) DEFAULT NULL COMMENT '0|',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '0|',
  `modified_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '0|'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='1|1|Estado||nombre.Estado';

--
-- Volcado de datos para la tabla `estado`
--

INSERT INTO `estado` (`idestado`, `nombre`, `baja`, `created_by`, `created_at`, `modified_at`) VALUES
(1, 'ADEUDANDO SIN ENTREGAR', NULL, 1, '2018-02-05 02:58:09', '2018-02-06 17:45:44'),
(2, 'PAGADO SIN ENTREGAR', NULL, 1, '2018-02-05 03:16:16', '2018-02-06 17:45:48'),
(3, 'CANCELADA', NULL, 1, '2018-02-05 04:18:38', '2018-02-05 04:18:38'),
(4, 'SIN COSTO', NULL, 1, '2018-02-05 05:05:31', '2018-03-01 20:27:19'),
(5, 'SOBREPAGADO', NULL, 1, '2018-02-05 05:10:02', '2018-02-05 05:10:02'),
(6, 'ADEUDANDO ENTREGADO', NULL, 1, '2018-02-06 17:46:39', '2018-02-06 17:46:39'),
(7, 'PAGADO ENTREGADO', NULL, 1, '2018-02-06 17:46:47', '2018-02-06 17:46:47'),
(8, 'ADEUDANDO FINALIZADO', NULL, 1, '2018-02-06 17:51:26', '2018-02-06 17:51:26'),
(9, 'PAGADO FINALIZADO', NULL, 1, '2018-02-06 17:51:37', '2018-02-06 17:51:37'),
(10, 'REALIZADO SIN ENTREGAR', NULL, 1, '2018-03-01 20:26:11', '2018-03-01 20:26:11'),
(11, 'FINALIZADO', NULL, 1, '2018-03-01 20:26:39', '2018-03-01 20:26:39'),
(12, 'ENTREGADO', NULL, 1, '2018-03-07 18:21:15', '2018-03-07 18:21:15');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estadoscrum`
--

CREATE TABLE `estadoscrum` (
  `idestadoscrum` int(11) NOT NULL COMMENT '0|',
  `nombre` varchar(45) NOT NULL COMMENT '1|Nombre',
  `baja` tinyint(1) DEFAULT NULL COMMENT '0|',
  `created_by` int(11) DEFAULT NULL COMMENT '0|',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '0|',
  `modified_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '0|'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='1|1|Estado Tareas||nombre.Estado';

--
-- Volcado de datos para la tabla `estadoscrum`
--

INSERT INTO `estadoscrum` (`idestadoscrum`, `nombre`, `baja`, `created_by`, `created_at`, `modified_at`) VALUES
(1, 'POR HACERSE', NULL, 1, '2018-03-01 20:05:10', '2018-03-01 20:05:10'),
(2, 'TRABAJANDO', NULL, 1, '2018-03-01 20:05:18', '2018-03-01 20:05:18'),
(3, 'HECHA', NULL, 1, '2018-03-01 20:05:25', '2018-03-01 20:05:25'),
(4, 'FINALIZADA', NULL, 1, '2018-03-07 15:04:52', '2018-03-07 15:04:52'),
(5, 'CANCELADA', NULL, 1, '2018-03-07 15:04:57', '2018-03-07 15:04:57');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `formula`
--

CREATE TABLE `formula` (
  `idformula` int(11) NOT NULL COMMENT '0|',
  `formula` varchar(145) NOT NULL COMMENT '1|Fórmula',
  `baja` tinyint(1) DEFAULT NULL COMMENT '0|',
  `created_by` int(11) DEFAULT NULL COMMENT '0|',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '0|',
  `modified_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '0|'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='1|1|Fórmula||formula.Fórmula';

--
-- Volcado de datos para la tabla `formula`
--

INSERT INTO `formula` (`idformula`, `formula`, `baja`, `created_by`, `created_at`, `modified_at`) VALUES
(1, 'PI POR RADIO AL CUADRADO', NULL, 1, '2018-02-06 16:02:43', '2018-02-06 16:02:43'),
(2, 'ANCHO POR ALTO POR PRECIO', NULL, 1, '2018-02-06 20:36:42', '2018-02-06 20:36:42');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `orden`
--

CREATE TABLE `orden` (
  `idorden` int(11) NOT NULL COMMENT '0|',
  `cliente_idcliente` int(11) NOT NULL COMMENT '1|Cliente|**nombre persona.idpersona cliente.persona_idpersona',
  `fecha` date NOT NULL COMMENT '1|Fecha',
  `hora` time NOT NULL COMMENT '1|Hora',
  `fechaEntregaEstimada` date DEFAULT NULL COMMENT '1|Fecha Estimada de Entrega',
  `horaEntregaEstimada` time DEFAULT NULL COMMENT '1|Hora Estimada de Entrega',
  `fechaEntregaReal` date DEFAULT NULL COMMENT '1|Fecha Real de Entrega',
  `horaEntregaReal` time DEFAULT NULL COMMENT '1|Hora Real de Entrega',
  `fechaInicioEstimada` date DEFAULT NULL COMMENT '1|Fecha Estimada de Inicio',
  `horaInicioEstimada` time DEFAULT NULL COMMENT '1|Hora Estimada de Inicio',
  `subtotal` float DEFAULT NULL COMMENT '1|Subtotal',
  `total` float NOT NULL COMMENT '1|Total',
  `cubierto` float DEFAULT NULL COMMENT '1|Monto Cubierto',
  `abonado` float DEFAULT NULL COMMENT '1|Monto Abonado',
  `adeudo` float DEFAULT NULL COMMENT '1|Monto Adeudado',
  `factura` tinyint(1) DEFAULT NULL COMMENT '1|Factura',
  `comentarios` varchar(355) DEFAULT NULL,
  `baja` tinyint(1) DEFAULT NULL COMMENT '0|',
  `created_by` int(11) DEFAULT NULL COMMENT '0|',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '0|',
  `modified_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '0|'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='1|1|Orden|ordenproducto.orden_idorden.producto_idproducto.producto.idproducto.nombre.Producto|fecha.Fecha,fechaEntregaEstimada.Fecha Estimada de Entrega,fechaEntregaReal.Fecha Real de Entrega,fechaInicioEstimada.Fecha de Inicio Estimada,cliente_cliente_idcliente.Cliente';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ordenestado`
--

CREATE TABLE `ordenestado` (
  `idordenestado` int(11) NOT NULL COMMENT '0|',
  `orden_idorden` int(11) NOT NULL COMMENT '1|Número de Orden|idorden',
  `estado_idestado` int(11) NOT NULL COMMENT '1|Estado|nombre',
  `fecha` date DEFAULT NULL COMMENT '1|Fecha',
  `hora` time DEFAULT NULL COMMENT '1|Hora',
  `baja` tinyint(1) DEFAULT NULL COMMENT '0|',
  `created_by` int(11) DEFAULT NULL COMMENT '0|',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '0|',
  `modified_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '0|'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='1|1|Orden Estado||fecha.Fecha,estado_estado_idestado.Estado';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ordenproducto`
--

CREATE TABLE `ordenproducto` (
  `idordenproducto` int(11) NOT NULL COMMENT '0|',
  `orden_idorden` int(11) NOT NULL COMMENT '1|Número de Orden|idorden',
  `producto_idproducto` int(11) NOT NULL COMMENT '1|Producto|nombre',
  `cantidad` int(4) DEFAULT NULL COMMENT '1|Cantidad Unidades',
  `ancho` float DEFAULT NULL COMMENT '1|Ancho en Metros',
  `alto` float DEFAULT NULL COMMENT '1|Alto en Metros',
  `tipoprecio_idtipoprecio` int(11) NOT NULL COMMENT '1|Precio Para|nombre',
  `precio` float NOT NULL COMMENT '1|Precio',
  `baja` tinyint(1) DEFAULT NULL COMMENT '0|',
  `created_by` int(11) DEFAULT NULL COMMENT '0|',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '0|',
  `modified_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '0|'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='1|1|Orden Producto||tipoPrecio.Precio Para,producto_producto_idproducto.Producto';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ordentarea`
--

CREATE TABLE `ordentarea` (
  `idordentarea` int(11) NOT NULL COMMENT '0|',
  `tarea_idtarea` int(11) NOT NULL COMMENT '1|Tarea|nombre',
  `ordenproducto_idordenproducto` int(11) NOT NULL COMMENT '1|Orden Producto|**nombre producto.idproducto ordenproducto.producto_idproducto',
  `especificaciones` varchar(245) DEFAULT NULL COMMENT '1|Especificaciones',
  `fechaInicio` date DEFAULT NULL COMMENT '1|Fecha de Inicio',
  `horaInicio` time DEFAULT NULL COMMENT '1|Hora de Inicio',
  `fechaTermina` date DEFAULT NULL COMMENT '1|Fecha de Término',
  `horaTermina` time DEFAULT NULL COMMENT '1|Hora de Término',
  `fechaEstimada` date DEFAULT NULL COMMENT '1|Fecha Estimada de Entrega',
  `horaEstimada` time DEFAULT NULL COMMENT '1|Hora Estimada de Entrega',
  `baja` tinyint(1) DEFAULT NULL COMMENT '0|',
  `created_by` int(11) DEFAULT NULL COMMENT '0|',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '0|',
  `modified_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '0|'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='1|1|Orden Tarea||ordenproducto_ordenproducto_idordenproducto.Producto,especificaciones.Especificaciones,tarea_tarea_idtarea.Tarea';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ordentareaestado`
--

CREATE TABLE `ordentareaestado` (
  `idordentareaestado` int(11) NOT NULL COMMENT '0|',
  `ordentarea_idordentarea` int(11) NOT NULL COMMENT '1|Tarea|**nombre tarea.idtarea ordentarea.tarea_idtarea',
  `estadoscrum_idestadoscrum` int(11) NOT NULL COMMENT '1|Estado de Tarea|nombre',
  `fecha` date NOT NULL COMMENT '1|Fecha',
  `hora` time NOT NULL COMMENT '1|Hora',
  `baja` tinyint(1) DEFAULT NULL COMMENT '0|',
  `created_by` int(11) DEFAULT NULL COMMENT '0|',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '0|',
  `modified_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '0|'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='1|1|Orden Tarea Estado||fecha.Fecha,estado_estado_idestado.Estado,ordentarea_ordentarea_idordentarea.Tarea';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `persona`
--

CREATE TABLE `persona` (
  `idpersona` int(11) NOT NULL COMMENT '0|',
  `nombre` varchar(45) NOT NULL COMMENT '1|Nombre',
  `apellidoPaterno` varchar(45) NOT NULL COMMENT '1|Apellido Paterno',
  `apellidoMaterno` varchar(45) DEFAULT NULL COMMENT '1|Apellido Materno',
  `emailPersonal` varchar(45) DEFAULT NULL COMMENT '1|Email Personal',
  `telefonoCasa` varchar(45) DEFAULT NULL COMMENT '1|Teléfono de Casa',
  `telefonoOficina` varchar(45) DEFAULT NULL COMMENT '1|Teléfono de Oficina',
  `edad` int(2) DEFAULT NULL COMMENT '1|Edad',
  `sexo_idsexo` int(11) NOT NULL COMMENT '1|Sexo|nombre',
  `ciudad_idciudad` int(11) NOT NULL COMMENT '1|Ciudad|nombre',
  `baja` tinyint(1) DEFAULT NULL COMMENT '0|',
  `created_by` int(11) DEFAULT NULL COMMENT '0|',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '0|',
  `modified_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '0|'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='1|1|Persona||nombre.Nombre,apellidoPaterno.Apellido Paterno,apellidoMaterno.Apellido Materno,emailPersonal.Email,telefonoCasa.Teléfono Casa,telefonoOficina.Teléfono Oficina,sexo.Sexo,ciudad.Ciudad';

--
-- Volcado de datos para la tabla `persona`
--

INSERT INTO `persona` (`idpersona`, `nombre`, `apellidoPaterno`, `apellidoMaterno`, `emailPersonal`, `telefonoCasa`, `telefonoOficina`, `edad`, `sexo_idsexo`, `ciudad_idciudad`, `baja`, `created_by`, `created_at`, `modified_at`) VALUES
(60, 'Amira', '', NULL, NULL, NULL, NULL, NULL, 2, 1, NULL, NULL, '2018-03-03 06:06:52', '2018-03-03 06:06:52'),
(61, 'Alex', '', NULL, NULL, NULL, NULL, NULL, 2, 1, NULL, NULL, '2018-03-03 06:06:52', '2018-03-03 06:06:52'),
(62, 'Beto', '', NULL, NULL, NULL, NULL, NULL, 2, 1, NULL, NULL, '2018-03-03 06:06:52', '2018-03-03 06:06:52'),
(63, 'Miguel', '', NULL, NULL, NULL, NULL, NULL, 2, 1, NULL, NULL, '2018-03-03 06:06:52', '2018-03-03 06:06:52'),
(64, 'Jonathan', '', NULL, NULL, NULL, NULL, NULL, 2, 1, NULL, NULL, '2018-03-03 06:06:52', '2018-03-03 06:06:52'),
(65, 'Luis', '', NULL, NULL, NULL, NULL, NULL, 2, 1, NULL, NULL, '2018-03-03 06:06:52', '2018-03-03 06:06:52'),
(66, 'Violeta', '', NULL, NULL, NULL, NULL, NULL, 2, 1, NULL, NULL, '2018-03-03 06:06:52', '2018-03-03 06:06:52'),
(67, 'Rocio', '', NULL, NULL, NULL, NULL, NULL, 2, 1, NULL, NULL, '2018-03-03 06:06:53', '2018-03-03 06:06:53'),
(68, 'Yahir', '', NULL, NULL, NULL, NULL, NULL, 2, 1, NULL, NULL, '2018-03-03 06:06:53', '2018-03-03 06:06:53'),
(69, 'Issac', '', NULL, NULL, NULL, NULL, NULL, 2, 1, NULL, NULL, '2018-03-03 06:06:53', '2018-03-03 06:06:53'),
(70, 'Abraham', '', NULL, NULL, NULL, NULL, NULL, 2, 1, NULL, NULL, '2018-03-03 06:06:53', '2018-03-03 06:06:53'),
(71, 'Gerardo', '', NULL, NULL, NULL, NULL, NULL, 2, 1, NULL, NULL, '2018-03-03 06:06:53', '2018-03-03 06:06:53'),
(72, 'Leo', '', NULL, NULL, NULL, NULL, NULL, 2, 1, NULL, NULL, '2018-03-03 06:06:53', '2018-03-03 06:06:53'),
(73, 'Raul', '', NULL, NULL, NULL, NULL, NULL, 2, 1, NULL, NULL, '2018-03-03 06:06:53', '2018-03-03 06:06:53'),
(74, 'Ray', '', NULL, NULL, NULL, NULL, NULL, 2, 1, NULL, NULL, '2018-03-03 06:06:53', '2018-03-03 06:06:53'),
(75, 'Socrates', '', NULL, NULL, NULL, NULL, NULL, 2, 1, NULL, NULL, '2018-03-03 06:06:53', '2018-03-03 06:06:53'),
(76, 'Jessy', '', NULL, NULL, NULL, NULL, NULL, 2, 1, NULL, NULL, '2018-03-03 06:06:53', '2018-03-03 06:06:53'),
(77, 'PABLO', 'NERUDA', 'CASAS', 'P@CASAS.COM', '134545325', '7653633', 55, 2, 1, NULL, 1, '2018-03-03 19:30:53', '2018-03-03 19:30:53'),
(78, 'César Alonso', 'Gavilanes', 'Magaña', 'cesar_alonso_m_g@hotmail.com', '0134112345365', '324213423', 35, 2, 1, NULL, 1, '2018-03-05 19:05:47', '2018-03-05 19:05:47');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `idproducto` int(11) NOT NULL COMMENT '0|',
  `formula_idformula` int(11) NOT NULL COMMENT '1|Fórmula|formula',
  `nombre` varchar(55) NOT NULL COMMENT '1|Nombre',
  `area_idarea` int(11) NOT NULL COMMENT '1|Área|nombre',
  `duracionEstimada` float DEFAULT NULL COMMENT '1|Duración Estimada en Hrs.',
  `precioPublico` float DEFAULT NULL COMMENT '1|Precio Para Público',
  `precioMayoreo` float DEFAULT NULL COMMENT '1|Precio Para Mayoreo',
  `precioMaquila` float DEFAULT NULL COMMENT '1|Precio Para Maquila',
  `extraPor` varchar(45) DEFAULT NULL COMMENT '1|Costo Extra Por',
  `extraPrecio` float DEFAULT NULL COMMENT '1|Costo Extra',
  `baja` tinyint(1) DEFAULT NULL COMMENT '0|',
  `created_by` int(11) DEFAULT NULL COMMENT '0|',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '0|',
  `modified_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '0|'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='1|1|Producto||nombre.Nombre,extraPor.Costo Extra Por,formula_formula_idformula.Fórmula,area_area_idarea.Área';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `salidastock`
--

CREATE TABLE `salidastock` (
  `idsalidastock` int(11) NOT NULL COMMENT '0|',
  `ordentarea_idordentarea` int(11) NOT NULL COMMENT '1|Tarea de Orden|idordentarea',
  `stock_idstock` int(11) NOT NULL COMMENT '1|Producto en Stock|nombre',
  `cantidad` int(5) NOT NULL COMMENT '1|Cantidad Restada a Stock',
  `fecha` date NOT NULL,
  `hora` time NOT NULL,
  `baja` tinyint(1) DEFAULT NULL COMMENT '0|',
  `created_by` int(11) DEFAULT NULL COMMENT '0|',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '0|',
  `modified_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '0|'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='1|1|Salidas de Stock';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sexo`
--

CREATE TABLE `sexo` (
  `idsexo` int(11) NOT NULL COMMENT '0|',
  `nombre` varchar(45) NOT NULL COMMENT '1|Nombre',
  `baja` tinyint(1) DEFAULT NULL COMMENT '0|',
  `created_by` int(11) DEFAULT NULL COMMENT '0|',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '0|',
  `modified_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '0|'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='1|1|Sexo||';

--
-- Volcado de datos para la tabla `sexo`
--

INSERT INTO `sexo` (`idsexo`, `nombre`, `baja`, `created_by`, `created_at`, `modified_at`) VALUES
(2, 'MASCULINO', NULL, 1, '2018-02-06 15:59:48', '2018-02-06 15:59:48'),
(3, 'FEMENINO', NULL, 1, '2018-02-28 16:58:38', '2018-02-28 16:58:38');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `si_modulo`
--

CREATE TABLE `si_modulo` (
  `idsi_modulo` int(4) NOT NULL COMMENT '0|',
  `nombre` varchar(45) DEFAULT NULL COMMENT '1|Nombre',
  `baja` tinyint(1) DEFAULT '0' COMMENT '0|',
  `created_by` int(4) DEFAULT NULL COMMENT '0|',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '0|',
  `modified_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '0|'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='1|1|Módulos||nombre.Módulo';

--
-- Volcado de datos para la tabla `si_modulo`
--

INSERT INTO `si_modulo` (`idsi_modulo`, `nombre`, `baja`, `created_by`, `created_at`, `modified_at`) VALUES
(31, 'abono', 0, NULL, '2018-02-06 14:41:41', '2018-02-06 14:41:41'),
(32, 'alerta', 0, NULL, '2018-02-06 14:41:41', '2018-02-06 14:41:41'),
(33, 'archivo', 0, NULL, '2018-02-06 14:41:42', '2018-02-06 14:41:42'),
(34, 'area', 0, NULL, '2018-02-06 14:41:42', '2018-02-06 14:41:42'),
(35, 'checkout', 0, NULL, '2018-02-06 14:41:42', '2018-02-06 14:41:42'),
(36, 'checkoutestado', 0, NULL, '2018-02-06 14:41:42', '2018-02-06 14:41:42'),
(37, 'ciudad', 0, NULL, '2018-02-06 14:41:43', '2018-02-06 14:41:43'),
(38, 'cliente', 0, NULL, '2018-02-06 14:41:43', '2018-02-06 14:41:43'),
(39, 'concepto', 0, NULL, '2018-02-06 14:41:43', '2018-02-06 14:41:43'),
(40, 'egresoconcepto', 0, NULL, '2018-02-06 14:41:43', '2018-02-06 14:41:43'),
(41, 'empleado', 0, NULL, '2018-02-06 14:41:43', '2018-02-06 14:41:43'),
(42, 'empleadotarea', 0, NULL, '2018-02-06 14:41:43', '2018-02-06 14:41:43'),
(43, 'empleadotareaestado', 0, NULL, '2018-02-06 14:41:44', '2018-02-06 14:41:44'),
(44, 'estado', 0, NULL, '2018-02-06 14:41:44', '2018-02-06 14:41:44'),
(45, 'estadoscrum', 0, NULL, '2018-02-06 14:41:44', '2018-02-06 14:41:44'),
(46, 'formula', 0, NULL, '2018-02-06 14:41:44', '2018-02-06 14:41:44'),
(47, 'orden', 0, NULL, '2018-02-06 14:41:44', '2018-02-06 14:41:44'),
(48, 'ordenestado', 0, NULL, '2018-02-06 14:41:44', '2018-02-06 14:41:44'),
(49, 'ordenproducto', 0, NULL, '2018-02-06 14:41:45', '2018-02-06 14:41:45'),
(50, 'ordentarea', 0, NULL, '2018-02-06 14:41:45', '2018-02-06 14:41:45'),
(51, 'ordentareaestado', 0, NULL, '2018-02-06 14:41:45', '2018-02-06 14:41:45'),
(52, 'persona', 0, NULL, '2018-02-06 14:41:45', '2018-02-06 14:41:45'),
(53, 'producto', 0, NULL, '2018-02-06 14:41:45', '2018-02-06 14:41:45'),
(54, 'sexo', 0, NULL, '2018-02-06 14:41:45', '2018-02-06 14:41:45'),
(55, 'si_modulo', 0, NULL, '2018-02-06 14:41:46', '2018-02-06 14:41:46'),
(56, 'si_permiso', 0, NULL, '2018-02-06 14:41:46', '2018-02-06 14:41:46'),
(57, 'si_reporte', 0, NULL, '2018-02-06 14:41:46', '2018-02-06 14:41:46'),
(58, 'si_rol', 0, NULL, '2018-02-06 14:41:46', '2018-02-06 14:41:46'),
(59, 'si_user', 0, NULL, '2018-02-06 14:41:46', '2018-02-06 14:41:46'),
(60, 'tarea', 0, NULL, '2018-02-06 14:41:47', '2018-02-06 14:41:47'),
(61, 'tipoalerta', 0, NULL, '2018-02-06 14:41:47', '2018-02-06 14:41:47'),
(62, 'tipoprecio', 0, NULL, '2018-02-06 14:41:47', '2018-02-06 14:41:47'),
(63, 'stock', 0, 1, '2018-02-09 18:48:58', '2018-02-09 18:48:58'),
(64, 'salidastock', 0, 1, '2018-02-09 18:49:04', '2018-02-09 18:49:04'),
(65, 'dashboard', 0, 1, '2018-03-07 14:47:49', '2018-03-07 14:47:49'),
(66, 'accuracyestimacion', 0, 0, '2018-03-08 19:11:06', '2018-03-08 19:11:06'),
(67, 'accuracytiempo', 0, 0, '2018-03-08 19:11:06', '2018-03-08 19:11:06'),
(68, 'accuracyestimacion', 0, 0, '2018-03-08 19:11:17', '2018-03-08 19:11:17'),
(69, 'accuracytiempo', 0, 1, '2018-03-08 19:11:17', '2018-03-08 19:11:17'),
(70, 'change-password', 0, 1, '2018-03-09 15:23:53', '2018-03-09 15:23:53');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `si_permiso`
--

CREATE TABLE `si_permiso` (
  `idsi_permiso` int(4) NOT NULL COMMENT '0|',
  `acceso` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1|Acceso',
  `Rol_idsi_rol` int(4) NOT NULL COMMENT '1|Rol|nombre',
  `Modulo_idsi_modulo` int(4) NOT NULL COMMENT '1|Módulo|nombre',
  `readable` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1|Lectura',
  `writeable` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1|Escritura',
  `updateable` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1|Edición',
  `deleteable` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1|Eliminación',
  `read_own` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1|Leer Propios',
  `write_own` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1|Escribir Propios',
  `update_own` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1|Editar Propios',
  `delete_own` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1|Eliminar Propios',
  `baja` tinyint(1) DEFAULT '0' COMMENT '0|',
  `created_by` int(4) DEFAULT NULL COMMENT '0|',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '0|',
  `modified_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '0|'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='1|2|Permisos||modulo_Modulo_idsi_modulo.Módulo';

--
-- Volcado de datos para la tabla `si_permiso`
--

INSERT INTO `si_permiso` (`idsi_permiso`, `acceso`, `Rol_idsi_rol`, `Modulo_idsi_modulo`, `readable`, `writeable`, `updateable`, `deleteable`, `read_own`, `write_own`, `update_own`, `delete_own`, `baja`, `created_by`, `created_at`, `modified_at`) VALUES
(1, 1, 1, 31, 1, 1, 1, 1, 0, 0, 0, 0, 0, 1, '2018-02-08 05:59:54', '2018-02-08 05:59:54'),
(2, 1, 3, 32, 1, 1, 1, 1, 1, 0, 0, 0, 0, 1, '2018-03-01 06:01:45', '2018-03-01 06:01:45'),
(3, 1, 2, 32, 1, 1, 1, 1, 1, 0, 0, 0, 0, 1, '2018-03-01 06:01:55', '2018-03-01 06:01:55'),
(4, 1, 2, 56, 1, 1, 1, 1, 0, 0, 0, 0, 0, 1, '2018-03-01 06:03:05', '2018-03-01 06:03:05'),
(5, 1, 3, 56, 1, 1, 1, 1, 0, 0, 0, 0, 0, 1, '2018-03-01 06:03:18', '2018-03-01 06:03:18'),
(6, 0, 2, 61, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, '2018-03-01 06:03:47', '2018-03-01 06:04:30'),
(7, 0, 3, 61, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, '2018-03-01 06:03:59', '2018-03-01 06:04:33'),
(8, 0, 2, 41, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, '2018-03-01 06:04:13', '2018-03-01 06:04:13'),
(9, 0, 3, 41, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, '2018-03-01 06:04:22', '2018-03-01 06:04:22'),
(10, 1, 4, 42, 1, 1, 0, 0, 1, 1, 0, 0, 0, 1, '2018-03-02 05:21:32', '2018-03-02 05:33:40'),
(11, 0, 4, 41, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, '2018-03-02 05:21:50', '2018-03-02 05:21:50'),
(12, 0, 4, 50, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, '2018-03-02 05:22:08', '2018-03-02 05:22:08'),
(13, 0, 4, 43, 1, 1, 1, 1, 0, 0, 0, 0, 0, 1, '2018-03-02 05:29:17', '2018-03-04 03:34:12'),
(14, 0, 4, 45, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, '2018-03-02 05:29:39', '2018-03-02 05:29:39'),
(15, 1, 4, 56, 1, 1, 1, 1, 0, 0, 0, 0, 0, 1, '2018-03-02 05:33:18', '2018-03-02 05:33:18'),
(16, 0, 4, 55, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, '2018-03-02 05:40:19', '2018-03-02 05:40:19'),
(17, 0, 4, 58, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, '2018-03-02 05:40:27', '2018-03-02 05:40:27'),
(18, 1, 5, 56, 1, 1, 1, 1, 0, 0, 0, 0, 0, 1, '2018-03-04 02:56:07', '2018-03-04 02:56:07'),
(19, 1, 5, 32, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, '2018-03-04 02:57:07', '2018-03-04 02:57:17'),
(20, 0, 5, 61, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, '2018-03-04 02:57:27', '2018-03-04 02:57:27'),
(21, 0, 5, 41, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, '2018-03-04 02:57:41', '2018-03-04 02:57:41'),
(22, 0, 5, 55, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, '2018-03-04 03:26:45', '2018-03-04 03:26:45'),
(23, 0, 5, 58, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, '2018-03-04 03:26:56', '2018-03-04 03:26:56'),
(24, 1, 5, 42, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, '2018-03-04 03:27:23', '2018-03-04 03:27:23'),
(25, 0, 5, 43, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, '2018-03-04 03:28:09', '2018-03-04 03:28:09');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `si_reporte`
--

CREATE TABLE `si_reporte` (
  `idsi_reporte` int(4) NOT NULL COMMENT '0|',
  `nombre` varchar(45) DEFAULT NULL COMMENT '1|Nombre',
  `consulta` varchar(400) NOT NULL COMMENT '1|Consulta',
  `campos` varchar(140) NOT NULL COMMENT '1|Campos a mostrar',
  `Modulo_idsi_modulo` int(4) NOT NULL COMMENT '1|Módulo|nombre',
  `pfd` tinyint(1) DEFAULT '0' COMMENT '1|Exportar a PDF',
  `excel` tinyint(1) DEFAULT '0' COMMENT '1|Exportar a Excel',
  `print` tinyint(1) DEFAULT '0' COMMENT '1|Impresión',
  `baja` tinyint(1) DEFAULT '0' COMMENT '0|',
  `created_by` int(4) DEFAULT NULL COMMENT '0|',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '0|',
  `modified_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '0|'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='1|5|Reportes||nombre.Nombre';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `si_rol`
--

CREATE TABLE `si_rol` (
  `idsi_rol` int(4) NOT NULL COMMENT '0|',
  `nombre` varchar(45) DEFAULT NULL COMMENT '1|Nombre',
  `baja` tinyint(1) DEFAULT '0' COMMENT '0|',
  `created_by` int(4) DEFAULT NULL COMMENT '0|',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '0|',
  `modified_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '0|'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='1|3|Roles||nombre.Rol';

--
-- Volcado de datos para la tabla `si_rol`
--

INSERT INTO `si_rol` (`idsi_rol`, `nombre`, `baja`, `created_by`, `created_at`, `modified_at`) VALUES
(1, 'ADMINISTRADOR', 0, NULL, '2018-02-06 14:41:47', '2018-02-06 14:41:47'),
(2, 'DISEÑO', 0, 1, '2018-03-01 05:57:17', '2018-03-01 05:57:17'),
(3, 'IMPRESIÓN', 0, 1, '2018-03-01 05:57:28', '2018-03-01 05:57:28'),
(4, 'EMPLEADO', 0, 1, '2018-03-02 05:20:33', '2018-03-02 05:20:33'),
(5, 'Empleado', 0, 1, '2018-03-04 02:33:17', '2018-03-04 02:33:17'),
(6, 'X', 1, 1, '2018-03-07 06:22:03', '2018-03-07 06:22:06'),
(7, 'W', 1, 1, '2018-03-07 06:22:10', '2018-03-07 06:22:33');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `si_user`
--

CREATE TABLE `si_user` (
  `idsi_user` int(4) NOT NULL COMMENT '0|',
  `usuario` varchar(45) DEFAULT NULL COMMENT '1|Usuario',
  `email` varchar(60) NOT NULL COMMENT '1|Email',
  `password` binary(60) DEFAULT NULL COMMENT '1|Password',
  `Rol_idsi_rol` int(4) NOT NULL COMMENT '1|Rol|nombre',
  `super` tinyint(1) DEFAULT '0' COMMENT '0|',
  `baja` tinyint(1) DEFAULT '0' COMMENT '0|',
  `created_by` int(4) DEFAULT NULL COMMENT '0|',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '0|',
  `modified_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '0|'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='1|4|Usuarios||usuario.Usuario,email.Email,rol_Rol_idsi_rol.Rol';

--
-- Volcado de datos para la tabla `si_user`
--

INSERT INTO `si_user` (`idsi_user`, `usuario`, `email`, `password`, `Rol_idsi_rol`, `super`, `baja`, `created_by`, `created_at`, `modified_at`) VALUES
(1, 'SuperUsuario', 'admin@manyimmprenzza8.com', 0x24326124313024417841616e454c6a534c5369636a36374b5378716a4f593344674e316355795334717369705954574c7338633571752f2e55724d65, 1, 1, 0, NULL, '2018-02-06 14:41:47', '2018-03-09 17:21:59'),
(3, 'maria', 'maria@immprenzza.com', 0x313233343536000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000, 4, 0, 0, 1, '2018-03-01 05:57:20', '2018-03-02 05:23:12'),
(4, 'pedro', 'pedro@immprenzza.com', 0x313233343536000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000, 4, 0, 0, 1, '2018-03-01 05:59:40', '2018-03-02 05:23:18'),
(5, 'JOSÉ', 'jose@immprenzza.com', 0x24326124313024495472683175532e2f7575376964702e7645555775754d694d757a2e6f7a756752485531754b623048416741683949325a75736557, 3, 0, 0, 1, '2018-03-01 06:00:07', '2018-03-01 06:00:07'),
(6, 'empleado1', 'empleado1@immprenzza.com', 0x243261243130242f6d39324a5a4e65716a51652e3363454b364931592e4e47445162626d506765633250466767665477535a75747061505763376f36, 4, 0, 0, 1, '2018-03-02 05:22:41', '2018-03-02 05:22:41'),
(7, 'Amira', 'amira@immprenzza.com', 0x243261243130244a47313252364e5165726d305a507a6572546567682e706a5831454d766743687934416e502f774c2e2f6c77726c6e4431582f6257, 5, 0, 0, 1, '2018-03-04 02:35:00', '2018-03-04 02:35:00'),
(8, 'Alex', 'alex@immprenzza.com', 0x24326124313024796b627a2e57356d75414c596c7662362f353544646535373977742f37575977677452586b434f5030754d495334574e4d33337661, 5, 0, 0, 1, '2018-03-04 02:35:16', '2018-03-04 02:35:16'),
(9, 'Beto', 'beto@immprenzza.com', 0x24326124313024316d2e5a556c79544937567a576f6e4b794b44564b2e6678526a326a68364b556868326c443837685a6c7242762f64524e616c4553, 5, 0, 0, 1, '2018-03-04 02:35:33', '2018-03-04 02:35:33'),
(10, 'Miguel', 'miguel@immprenzza.com', 0x24326124313024697a503376625a576d5935722e682f4a687a7645374f516b51794d56644b33325731416a317658395354737165656b7a7449495761, 5, 0, 0, 1, '2018-03-04 02:35:46', '2018-03-04 02:35:46'),
(11, 'Jonathan', 'jonathan@immprenzza.com', 0x24326124313024356c49584e43334472492f566f6e6e32776855622e4f5239465672702e56626a7a51714e312f6943545773547347674131562e3365, 5, 0, 0, 1, '2018-03-04 02:36:05', '2018-03-04 02:36:05'),
(12, 'Luis', 'luis@immprenzza.com', 0x24326124313024617a61716a6357656b73775449386f6f7270396a564f56414c525141694d4c4a4549657437574e424e326564424e5a724d47517575, 5, 0, 0, 1, '2018-03-04 02:36:18', '2018-03-04 02:36:18'),
(13, 'Violeta', 'violeta@immprenzza.com', 0x243261243130244e4e734841316453484f766a3064617843752f6d592e3771506e484c6238306c416b34392e71796257756b31684c79484c48793343, 5, 0, 0, 1, '2018-03-04 02:36:32', '2018-03-04 02:36:32'),
(14, 'Rocio', 'rocio@immprenzza.com', 0x24326124313024596238495244356c64557a4873556f594a76706e484f49685251364358346c71444d5a2f564f6a2e5a33796f762e72617275464769, 5, 0, 0, 1, '2018-03-04 02:36:48', '2018-03-04 02:36:48'),
(15, 'Yahir', 'yahir@immprenzza.com', 0x2432612431302445596a477159355545672f664f6c6b4b494b7a4a63753665633934556957587843777244753447525155662e535948473271374871, 5, 0, 0, 1, '2018-03-04 02:37:01', '2018-03-04 02:37:01'),
(16, 'Issac', 'issac@immprenzza.com', 0x2432612431302465332f5378547755346e514d5749464952665a615575394e43562e5277436a4b4973314f6278564a4b2e6f757a4b50334a79453661, 5, 0, 0, 1, '2018-03-04 02:37:19', '2018-03-04 02:37:19'),
(17, 'Abraham', 'abraham@immprenzza.com', 0x24326124313024644d6f4242423743314f7361544f494f77516841457545683265737a79347336567a3278544370624b6541346a475a50626c557832, 5, 0, 0, 1, '2018-03-04 02:37:37', '2018-03-04 02:37:37'),
(18, 'Gerardo', 'gerardo@immprenzza.com', 0x24326124313024784d6354464e49653758474951656641746565304e7565342f544e42646e42635339436e7947336c70737a67795378326c726f5569, 5, 0, 0, 1, '2018-03-04 02:37:53', '2018-03-04 02:37:53'),
(19, 'Leo', 'leo@immprenzza.com', 0x243261243130244c63424a715436736235764d3461552f4a314e612e4f733054636b695858726e316a7a36524a49774d2f51546d6750627852544a2e, 5, 0, 0, 1, '2018-03-04 02:38:07', '2018-03-04 02:38:07'),
(20, 'Raul', 'raul@immprenzza.com', 0x2432612431302474617a555730734b4a502e4d466a535945764b665a65586e316665667a473975596d55746f4b7a4a694e5256527957396f50347075, 5, 0, 0, 1, '2018-03-04 02:38:24', '2018-03-04 02:38:24'),
(21, 'Ray', 'ray@immprenzza.com', 0x243261243130246a4557625a304a786d737658676664644c4f64452f654a4a536439584669504646655736593036644d7044346176676e6e37656f61, 5, 0, 0, 1, '2018-03-04 02:38:36', '2018-03-04 02:38:36'),
(22, 'Socrates', 'socrates@immprenzza.com', 0x243261243130245a516561617050676942616971324d6b6d4a61675a6547497a6b6e58564e6364676d6a62756b67444531537a4c6f383342424c3461, 5, 0, 0, 1, '2018-03-04 02:38:52', '2018-03-04 02:38:52'),
(23, 'Jessy', 'jessy@immprenzza.com', 0x243261243130246a32764c526144446c684571534e6176684b33516d654253417342426144544c54734944756f2e5848537854466b463066336a6332, 5, 0, 0, 1, '2018-03-04 02:39:06', '2018-03-04 02:39:06');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `stock`
--

CREATE TABLE `stock` (
  `idstock` int(11) NOT NULL COMMENT '0|',
  `nombre` varchar(45) DEFAULT NULL COMMENT '1|Nombre del Producto o Material',
  `cantidad` int(5) DEFAULT NULL COMMENT '1|Cantidad en Stock',
  `baja` tinyint(1) DEFAULT NULL COMMENT '0|',
  `created_by` int(11) DEFAULT NULL COMMENT '0|',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '0|',
  `modified_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '0|'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='1|1|Stock';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tarea`
--

CREATE TABLE `tarea` (
  `idtarea` int(11) NOT NULL COMMENT '0|',
  `producto_idproducto` int(11) NOT NULL COMMENT '1|Producto|nombre',
  `area_idarea` int(11) NOT NULL COMMENT '1|Área|nombre',
  `nombre` varchar(45) NOT NULL COMMENT '1|Nombre',
  `duracionEstimada` float DEFAULT NULL COMMENT '1|Duración Estimada en Hrs.',
  `costoEstimado` float DEFAULT NULL COMMENT '1|Costo Estimado',
  `baja` tinyint(1) DEFAULT NULL COMMENT '0|',
  `created_by` int(11) DEFAULT NULL COMMENT '0|',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '0|',
  `modified_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '0|'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='1|1|Tarea||nombre.Tarea,area_area_idarea.Área,producto_producto_idproducto.Producto';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipoalerta`
--

CREATE TABLE `tipoalerta` (
  `idtipoalerta` int(11) NOT NULL COMMENT '0|',
  `nombre` varchar(25) NOT NULL COMMENT '1|Nombre',
  `baja` tinyint(1) DEFAULT NULL COMMENT '0|',
  `created_by` int(11) DEFAULT NULL COMMENT '0|',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '0|',
  `modified_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '0|'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='1|1|Tipo de Alerta||nombre.Tipo de Alerta';

--
-- Volcado de datos para la tabla `tipoalerta`
--

INSERT INTO `tipoalerta` (`idtipoalerta`, `nombre`, `baja`, `created_by`, `created_at`, `modified_at`) VALUES
(1, 'RECLAMO', NULL, 1, '2018-02-06 21:10:33', '2018-02-06 21:10:33'),
(2, 'SALUDO', NULL, 1, '2018-03-04 03:06:02', '2018-03-04 03:06:02'),
(3, 'AVISO', NULL, 1, '2018-03-04 03:06:07', '2018-03-04 03:06:07');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipoprecio`
--

CREATE TABLE `tipoprecio` (
  `idtipoprecio` int(11) NOT NULL COMMENT '0|',
  `nombre` varchar(45) NOT NULL COMMENT '1|Nombre',
  `baja` tinyint(1) DEFAULT NULL COMMENT '0|',
  `created_by` int(11) DEFAULT NULL COMMENT '0|',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '0|',
  `modified_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '0|'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='1|1|Tipo de Precios||';

--
-- Volcado de datos para la tabla `tipoprecio`
--

INSERT INTO `tipoprecio` (`idtipoprecio`, `nombre`, `baja`, `created_by`, `created_at`, `modified_at`) VALUES
(1, 'MAYOREO', NULL, 1, '2018-02-06 16:34:44', '2018-02-06 16:34:44'),
(2, 'PUBLICO', NULL, NULL, '2018-02-28 18:17:06', '2018-02-28 18:17:06'),
(3, 'MAQUILA', NULL, NULL, '2018-02-28 18:17:06', '2018-02-28 18:17:06');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `abono`
--
ALTER TABLE `abono`
  ADD PRIMARY KEY (`idabono`),
  ADD UNIQUE KEY `idabono_UNIQUE` (`idabono`),
  ADD KEY `fk_abono_orden1_idx` (`orden_idorden`);

--
-- Indices de la tabla `accuracyestimacion`
--
ALTER TABLE `accuracyestimacion`
  ADD PRIMARY KEY (`idaccuracyestimacion`,`retraso`),
  ADD UNIQUE KEY `idaccuracytiempo_UNIQUE` (`idaccuracyestimacion`),
  ADD KEY `fk_accuracytiempo_empleado1_idx` (`empleado_idempleado`),
  ADD KEY `fk_accuracyestimacion_ordentarea1_idx` (`ordentarea_idordentarea`);

--
-- Indices de la tabla `accuracytiempo`
--
ALTER TABLE `accuracytiempo`
  ADD PRIMARY KEY (`idaccuracytiempo`),
  ADD UNIQUE KEY `idaccuracytiempo_UNIQUE` (`idaccuracytiempo`),
  ADD UNIQUE KEY `unico1` (`empleado_idempleado`,`fecha`),
  ADD KEY `fk_accuracytiempo_empleado1_idx` (`empleado_idempleado`);

--
-- Indices de la tabla `alerta`
--
ALTER TABLE `alerta`
  ADD PRIMARY KEY (`idalerta`),
  ADD UNIQUE KEY `idalerta_UNIQUE` (`idalerta`),
  ADD KEY `fk_alerta_empleado1_idx` (`empleado_idempleado`),
  ADD KEY `fk_alerta_tipoalerta1_idx` (`tipoalerta_idtipoalerta`);

--
-- Indices de la tabla `archivo`
--
ALTER TABLE `archivo`
  ADD PRIMARY KEY (`idarchivo`),
  ADD UNIQUE KEY `idarchivo_UNIQUE` (`idarchivo`),
  ADD KEY `fk_archivo_ordentarea1_idx` (`ordentarea_idordentarea`);

--
-- Indices de la tabla `area`
--
ALTER TABLE `area`
  ADD PRIMARY KEY (`idarea`),
  ADD UNIQUE KEY `idarea_UNIQUE` (`idarea`),
  ADD UNIQUE KEY `unico1` (`nombre`);

--
-- Indices de la tabla `checkout`
--
ALTER TABLE `checkout`
  ADD PRIMARY KEY (`idcheckout`),
  ADD UNIQUE KEY `idcheckout_UNIQUE` (`idcheckout`),
  ADD UNIQUE KEY `unico1` (`empleado_idempleado`,`fecha`,`horaEntra`),
  ADD KEY `fk_checkout_empleado1_idx` (`empleado_idempleado`),
  ADD KEY `fk_checkout_checkoutestado1_idx` (`checkoutestado_idcheckoutestado`);

--
-- Indices de la tabla `checkoutestado`
--
ALTER TABLE `checkoutestado`
  ADD PRIMARY KEY (`idcheckoutestado`),
  ADD UNIQUE KEY `idcheckoutestado_UNIQUE` (`idcheckoutestado`);

--
-- Indices de la tabla `ciudad`
--
ALTER TABLE `ciudad`
  ADD PRIMARY KEY (`idciudad`),
  ADD UNIQUE KEY `idciudad_UNIQUE` (`idciudad`);

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`idcliente`),
  ADD UNIQUE KEY `idcliente_UNIQUE` (`idcliente`),
  ADD KEY `fk_cliente_persona1_idx` (`persona_idpersona`);

--
-- Indices de la tabla `concepto`
--
ALTER TABLE `concepto`
  ADD PRIMARY KEY (`idconcepto`),
  ADD UNIQUE KEY `idconcepto_UNIQUE` (`idconcepto`);

--
-- Indices de la tabla `egresoconcepto`
--
ALTER TABLE `egresoconcepto`
  ADD PRIMARY KEY (`idegresoconcepto`),
  ADD KEY `fk_egresoconcepto_concepto1_idx` (`concepto_idconcepto`),
  ADD KEY `fk_egresoconcepto_empleado1_idx` (`empleado_idempleado`);

--
-- Indices de la tabla `empleado`
--
ALTER TABLE `empleado`
  ADD PRIMARY KEY (`idempleado`),
  ADD UNIQUE KEY `idempleado_UNIQUE` (`idempleado`),
  ADD KEY `fk_empleado_area1_idx` (`area_idarea`),
  ADD KEY `fk_empleado_persona1_idx` (`persona_idpersona`),
  ADD KEY `fk_empleado_si_user1_idx` (`si_user_idsi_user`);

--
-- Indices de la tabla `empleadotarea`
--
ALTER TABLE `empleadotarea`
  ADD PRIMARY KEY (`idempleadotarea`),
  ADD UNIQUE KEY `idempleadotarea_UNIQUE` (`idempleadotarea`),
  ADD KEY `fk_empleado_has_tarea_empleado1_idx` (`empleado_idempleado`),
  ADD KEY `fk_empleadoordentarea_ordentarea1_idx` (`ordentarea_idordentarea`);

--
-- Indices de la tabla `empleadotareaestado`
--
ALTER TABLE `empleadotareaestado`
  ADD PRIMARY KEY (`idempleadotareaestado`),
  ADD KEY `fk_empleadotareaestado_empleadotarea1_idx` (`empleadotarea_idempleadotarea`),
  ADD KEY `fk_empleadotareaestado_estadoscrum1_idx` (`estadoscrum_idestadoscrum`);

--
-- Indices de la tabla `estado`
--
ALTER TABLE `estado`
  ADD PRIMARY KEY (`idestado`),
  ADD UNIQUE KEY `idestado_UNIQUE` (`idestado`);

--
-- Indices de la tabla `estadoscrum`
--
ALTER TABLE `estadoscrum`
  ADD PRIMARY KEY (`idestadoscrum`),
  ADD UNIQUE KEY `idestado_UNIQUE` (`idestadoscrum`);

--
-- Indices de la tabla `formula`
--
ALTER TABLE `formula`
  ADD PRIMARY KEY (`idformula`),
  ADD UNIQUE KEY `idformula_UNIQUE` (`idformula`);

--
-- Indices de la tabla `orden`
--
ALTER TABLE `orden`
  ADD PRIMARY KEY (`idorden`),
  ADD UNIQUE KEY `idorden_UNIQUE` (`idorden`),
  ADD KEY `fk_orden_cliente1_idx` (`cliente_idcliente`);

--
-- Indices de la tabla `ordenestado`
--
ALTER TABLE `ordenestado`
  ADD PRIMARY KEY (`idordenestado`),
  ADD UNIQUE KEY `idordenestado_UNIQUE` (`idordenestado`),
  ADD KEY `fk_ordenestado_orden1_idx` (`orden_idorden`),
  ADD KEY `fk_ordenestado_estado1_idx` (`estado_idestado`);

--
-- Indices de la tabla `ordenproducto`
--
ALTER TABLE `ordenproducto`
  ADD PRIMARY KEY (`idordenproducto`),
  ADD UNIQUE KEY `idordenproducto_UNIQUE` (`idordenproducto`),
  ADD KEY `fk_orden_has_producto_producto1_idx` (`producto_idproducto`),
  ADD KEY `fk_orden_has_producto_orden1_idx` (`orden_idorden`),
  ADD KEY `fk_ordenproducto_tipoprecio1_idx` (`tipoprecio_idtipoprecio`);

--
-- Indices de la tabla `ordentarea`
--
ALTER TABLE `ordentarea`
  ADD PRIMARY KEY (`idordentarea`),
  ADD UNIQUE KEY `idordentarea_UNIQUE` (`idordentarea`),
  ADD KEY `fk_orden_has_tarea_tarea1_idx` (`tarea_idtarea`),
  ADD KEY `fk_ordentarea_ordenproducto1_idx` (`ordenproducto_idordenproducto`);

--
-- Indices de la tabla `ordentareaestado`
--
ALTER TABLE `ordentareaestado`
  ADD PRIMARY KEY (`idordentareaestado`),
  ADD UNIQUE KEY `idordentareaestado_UNIQUE` (`idordentareaestado`),
  ADD KEY `fk_ordentareaestado_ordentarea1_idx` (`ordentarea_idordentarea`),
  ADD KEY `fk_ordentareaestado_estadoscrum1_idx` (`estadoscrum_idestadoscrum`);

--
-- Indices de la tabla `persona`
--
ALTER TABLE `persona`
  ADD PRIMARY KEY (`idpersona`),
  ADD UNIQUE KEY `idpersona_UNIQUE` (`idpersona`),
  ADD KEY `fk_persona_sexo1_idx` (`sexo_idsexo`),
  ADD KEY `fk_persona_ciudad1_idx` (`ciudad_idciudad`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`idproducto`),
  ADD UNIQUE KEY `idproducto_UNIQUE` (`idproducto`),
  ADD KEY `fk_producto_formula1_idx` (`formula_idformula`),
  ADD KEY `fk_producto_area1_idx` (`area_idarea`);

--
-- Indices de la tabla `salidastock`
--
ALTER TABLE `salidastock`
  ADD PRIMARY KEY (`idsalidastock`,`ordentarea_idordentarea`,`stock_idstock`),
  ADD UNIQUE KEY `idsalidastockcol_UNIQUE` (`idsalidastock`),
  ADD KEY `fk_ordentarea_has_stock_stock1_idx` (`stock_idstock`),
  ADD KEY `fk_ordentarea_has_stock_ordentarea1_idx` (`ordentarea_idordentarea`);

--
-- Indices de la tabla `sexo`
--
ALTER TABLE `sexo`
  ADD PRIMARY KEY (`idsexo`),
  ADD UNIQUE KEY `idsexo_UNIQUE` (`idsexo`);

--
-- Indices de la tabla `si_modulo`
--
ALTER TABLE `si_modulo`
  ADD PRIMARY KEY (`idsi_modulo`);

--
-- Indices de la tabla `si_permiso`
--
ALTER TABLE `si_permiso`
  ADD PRIMARY KEY (`idsi_permiso`),
  ADD UNIQUE KEY `rol_modulo_unico` (`Rol_idsi_rol`,`Modulo_idsi_modulo`),
  ADD KEY `si_fk_Permiso_Rol1_idx` (`Rol_idsi_rol`),
  ADD KEY `si_fk_Permiso_Modulo1_idx` (`Modulo_idsi_modulo`);

--
-- Indices de la tabla `si_reporte`
--
ALTER TABLE `si_reporte`
  ADD PRIMARY KEY (`idsi_reporte`),
  ADD KEY `si_fk_Reporte_Modulo1_idx` (`Modulo_idsi_modulo`);

--
-- Indices de la tabla `si_rol`
--
ALTER TABLE `si_rol`
  ADD PRIMARY KEY (`idsi_rol`);

--
-- Indices de la tabla `si_user`
--
ALTER TABLE `si_user`
  ADD PRIMARY KEY (`idsi_user`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `si_fk_User_Rol_idx` (`Rol_idsi_rol`);

--
-- Indices de la tabla `stock`
--
ALTER TABLE `stock`
  ADD PRIMARY KEY (`idstock`),
  ADD UNIQUE KEY `idstock` (`idstock`);

--
-- Indices de la tabla `tarea`
--
ALTER TABLE `tarea`
  ADD PRIMARY KEY (`idtarea`),
  ADD UNIQUE KEY `idtarea_UNIQUE` (`idtarea`),
  ADD KEY `fk_tarea_producto1_idx` (`producto_idproducto`),
  ADD KEY `fk_tarea_area1_idx` (`area_idarea`);

--
-- Indices de la tabla `tipoalerta`
--
ALTER TABLE `tipoalerta`
  ADD PRIMARY KEY (`idtipoalerta`),
  ADD UNIQUE KEY `idtipoalerta_UNIQUE` (`idtipoalerta`);

--
-- Indices de la tabla `tipoprecio`
--
ALTER TABLE `tipoprecio`
  ADD PRIMARY KEY (`idtipoprecio`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `abono`
--
ALTER TABLE `abono`
  MODIFY `idabono` int(11) NOT NULL AUTO_INCREMENT COMMENT '0|', AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT de la tabla `accuracyestimacion`
--
ALTER TABLE `accuracyestimacion`
  MODIFY `idaccuracyestimacion` int(11) NOT NULL AUTO_INCREMENT COMMENT '0|Idaccuracytiempo', AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `accuracytiempo`
--
ALTER TABLE `accuracytiempo`
  MODIFY `idaccuracytiempo` int(11) NOT NULL AUTO_INCREMENT COMMENT '0|Idaccuracytiempo', AUTO_INCREMENT=493;
--
-- AUTO_INCREMENT de la tabla `alerta`
--
ALTER TABLE `alerta`
  MODIFY `idalerta` int(11) NOT NULL AUTO_INCREMENT COMMENT '0|', AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT de la tabla `archivo`
--
ALTER TABLE `archivo`
  MODIFY `idarchivo` int(11) NOT NULL AUTO_INCREMENT COMMENT '0|', AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT de la tabla `area`
--
ALTER TABLE `area`
  MODIFY `idarea` int(11) NOT NULL AUTO_INCREMENT COMMENT '0|', AUTO_INCREMENT=46;
--
-- AUTO_INCREMENT de la tabla `checkout`
--
ALTER TABLE `checkout`
  MODIFY `idcheckout` int(11) NOT NULL AUTO_INCREMENT COMMENT '0|', AUTO_INCREMENT=2962;
--
-- AUTO_INCREMENT de la tabla `checkoutestado`
--
ALTER TABLE `checkoutestado`
  MODIFY `idcheckoutestado` int(11) NOT NULL AUTO_INCREMENT COMMENT '0|', AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `ciudad`
--
ALTER TABLE `ciudad`
  MODIFY `idciudad` int(11) NOT NULL AUTO_INCREMENT COMMENT '0|', AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `cliente`
--
ALTER TABLE `cliente`
  MODIFY `idcliente` int(11) NOT NULL AUTO_INCREMENT COMMENT '0|', AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `concepto`
--
ALTER TABLE `concepto`
  MODIFY `idconcepto` int(11) NOT NULL AUTO_INCREMENT COMMENT '0|', AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `egresoconcepto`
--
ALTER TABLE `egresoconcepto`
  MODIFY `idegresoconcepto` int(11) NOT NULL AUTO_INCREMENT COMMENT '0|', AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `empleado`
--
ALTER TABLE `empleado`
  MODIFY `idempleado` int(11) NOT NULL AUTO_INCREMENT COMMENT '0|', AUTO_INCREMENT=91;
--
-- AUTO_INCREMENT de la tabla `empleadotarea`
--
ALTER TABLE `empleadotarea`
  MODIFY `idempleadotarea` int(11) NOT NULL AUTO_INCREMENT COMMENT '0|', AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT de la tabla `empleadotareaestado`
--
ALTER TABLE `empleadotareaestado`
  MODIFY `idempleadotareaestado` int(11) NOT NULL AUTO_INCREMENT COMMENT '0|', AUTO_INCREMENT=21;
--
-- AUTO_INCREMENT de la tabla `estado`
--
ALTER TABLE `estado`
  MODIFY `idestado` int(11) NOT NULL AUTO_INCREMENT COMMENT '0|', AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT de la tabla `estadoscrum`
--
ALTER TABLE `estadoscrum`
  MODIFY `idestadoscrum` int(11) NOT NULL AUTO_INCREMENT COMMENT '0|', AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT de la tabla `formula`
--
ALTER TABLE `formula`
  MODIFY `idformula` int(11) NOT NULL AUTO_INCREMENT COMMENT '0|', AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `orden`
--
ALTER TABLE `orden`
  MODIFY `idorden` int(11) NOT NULL AUTO_INCREMENT COMMENT '0|', AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `ordenestado`
--
ALTER TABLE `ordenestado`
  MODIFY `idordenestado` int(11) NOT NULL AUTO_INCREMENT COMMENT '0|', AUTO_INCREMENT=36;
--
-- AUTO_INCREMENT de la tabla `ordenproducto`
--
ALTER TABLE `ordenproducto`
  MODIFY `idordenproducto` int(11) NOT NULL AUTO_INCREMENT COMMENT '0|', AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT de la tabla `ordentarea`
--
ALTER TABLE `ordentarea`
  MODIFY `idordentarea` int(11) NOT NULL AUTO_INCREMENT COMMENT '0|', AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT de la tabla `ordentareaestado`
--
ALTER TABLE `ordentareaestado`
  MODIFY `idordentareaestado` int(11) NOT NULL AUTO_INCREMENT COMMENT '0|', AUTO_INCREMENT=25;
--
-- AUTO_INCREMENT de la tabla `persona`
--
ALTER TABLE `persona`
  MODIFY `idpersona` int(11) NOT NULL AUTO_INCREMENT COMMENT '0|', AUTO_INCREMENT=79;
--
-- AUTO_INCREMENT de la tabla `producto`
--
ALTER TABLE `producto`
  MODIFY `idproducto` int(11) NOT NULL AUTO_INCREMENT COMMENT '0|', AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `salidastock`
--
ALTER TABLE `salidastock`
  MODIFY `idsalidastock` int(11) NOT NULL AUTO_INCREMENT COMMENT '0|', AUTO_INCREMENT=19;
--
-- AUTO_INCREMENT de la tabla `sexo`
--
ALTER TABLE `sexo`
  MODIFY `idsexo` int(11) NOT NULL AUTO_INCREMENT COMMENT '0|', AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `si_modulo`
--
ALTER TABLE `si_modulo`
  MODIFY `idsi_modulo` int(4) NOT NULL AUTO_INCREMENT COMMENT '0|', AUTO_INCREMENT=71;
--
-- AUTO_INCREMENT de la tabla `si_permiso`
--
ALTER TABLE `si_permiso`
  MODIFY `idsi_permiso` int(4) NOT NULL AUTO_INCREMENT COMMENT '0|', AUTO_INCREMENT=26;
--
-- AUTO_INCREMENT de la tabla `si_reporte`
--
ALTER TABLE `si_reporte`
  MODIFY `idsi_reporte` int(4) NOT NULL AUTO_INCREMENT COMMENT '0|';
--
-- AUTO_INCREMENT de la tabla `si_rol`
--
ALTER TABLE `si_rol`
  MODIFY `idsi_rol` int(4) NOT NULL AUTO_INCREMENT COMMENT '0|', AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT de la tabla `si_user`
--
ALTER TABLE `si_user`
  MODIFY `idsi_user` int(4) NOT NULL AUTO_INCREMENT COMMENT '0|', AUTO_INCREMENT=24;
--
-- AUTO_INCREMENT de la tabla `stock`
--
ALTER TABLE `stock`
  MODIFY `idstock` int(11) NOT NULL AUTO_INCREMENT COMMENT '0|', AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `tarea`
--
ALTER TABLE `tarea`
  MODIFY `idtarea` int(11) NOT NULL AUTO_INCREMENT COMMENT '0|', AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `tipoalerta`
--
ALTER TABLE `tipoalerta`
  MODIFY `idtipoalerta` int(11) NOT NULL AUTO_INCREMENT COMMENT '0|', AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `tipoprecio`
--
ALTER TABLE `tipoprecio`
  MODIFY `idtipoprecio` int(11) NOT NULL AUTO_INCREMENT COMMENT '0|', AUTO_INCREMENT=4;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `abono`
--
ALTER TABLE `abono`
  ADD CONSTRAINT `fk_abono_orden1` FOREIGN KEY (`orden_idorden`) REFERENCES `orden` (`idorden`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `accuracyestimacion`
--
ALTER TABLE `accuracyestimacion`
  ADD CONSTRAINT `fk_accuracyestimacion_ordentarea1` FOREIGN KEY (`ordentarea_idordentarea`) REFERENCES `ordentarea` (`idordentarea`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_accuracytiempo_empleado10` FOREIGN KEY (`empleado_idempleado`) REFERENCES `empleado` (`idempleado`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `accuracytiempo`
--
ALTER TABLE `accuracytiempo`
  ADD CONSTRAINT `fk_accuracytiempo_empleado1` FOREIGN KEY (`empleado_idempleado`) REFERENCES `empleado` (`idempleado`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `alerta`
--
ALTER TABLE `alerta`
  ADD CONSTRAINT `fk_alerta_empleado1` FOREIGN KEY (`empleado_idempleado`) REFERENCES `empleado` (`idempleado`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_alerta_tipoalerta1` FOREIGN KEY (`tipoalerta_idtipoalerta`) REFERENCES `tipoalerta` (`idtipoalerta`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `archivo`
--
ALTER TABLE `archivo`
  ADD CONSTRAINT `fk_archivo_ordentarea1` FOREIGN KEY (`ordentarea_idordentarea`) REFERENCES `ordentarea` (`idordentarea`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `checkout`
--
ALTER TABLE `checkout`
  ADD CONSTRAINT `fk_checkout_checkoutestado1` FOREIGN KEY (`checkoutestado_idcheckoutestado`) REFERENCES `checkoutestado` (`idcheckoutestado`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_checkout_empleado1` FOREIGN KEY (`empleado_idempleado`) REFERENCES `empleado` (`idempleado`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD CONSTRAINT `fk_cliente_persona1` FOREIGN KEY (`persona_idpersona`) REFERENCES `persona` (`idpersona`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `egresoconcepto`
--
ALTER TABLE `egresoconcepto`
  ADD CONSTRAINT `fk_egresoconcepto_concepto1` FOREIGN KEY (`concepto_idconcepto`) REFERENCES `concepto` (`idconcepto`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_egresoconcepto_empleado1` FOREIGN KEY (`empleado_idempleado`) REFERENCES `empleado` (`idempleado`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `empleado`
--
ALTER TABLE `empleado`
  ADD CONSTRAINT `fk_empleado_area1` FOREIGN KEY (`area_idarea`) REFERENCES `area` (`idarea`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_empleado_persona1` FOREIGN KEY (`persona_idpersona`) REFERENCES `persona` (`idpersona`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_empleado_si_user1` FOREIGN KEY (`si_user_idsi_user`) REFERENCES `si_user` (`idsi_user`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `empleadotarea`
--
ALTER TABLE `empleadotarea`
  ADD CONSTRAINT `fk_empleado_has_tarea_empleado1` FOREIGN KEY (`empleado_idempleado`) REFERENCES `empleado` (`idempleado`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_empleadoordentarea_ordentarea1` FOREIGN KEY (`ordentarea_idordentarea`) REFERENCES `ordentarea` (`idordentarea`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `empleadotareaestado`
--
ALTER TABLE `empleadotareaestado`
  ADD CONSTRAINT `fk_empleadotareaestado_empleadotarea1` FOREIGN KEY (`empleadotarea_idempleadotarea`) REFERENCES `empleadotarea` (`idempleadotarea`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_empleadotareaestado_estadoscrum1` FOREIGN KEY (`estadoscrum_idestadoscrum`) REFERENCES `estadoscrum` (`idestadoscrum`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `orden`
--
ALTER TABLE `orden`
  ADD CONSTRAINT `fk_orden_cliente1` FOREIGN KEY (`cliente_idcliente`) REFERENCES `cliente` (`idcliente`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `ordenestado`
--
ALTER TABLE `ordenestado`
  ADD CONSTRAINT `fk_ordenestado_estado1` FOREIGN KEY (`estado_idestado`) REFERENCES `estado` (`idestado`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_ordenestado_orden1` FOREIGN KEY (`orden_idorden`) REFERENCES `orden` (`idorden`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `ordenproducto`
--
ALTER TABLE `ordenproducto`
  ADD CONSTRAINT `fk_orden_has_producto_orden1` FOREIGN KEY (`orden_idorden`) REFERENCES `orden` (`idorden`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_orden_has_producto_producto1` FOREIGN KEY (`producto_idproducto`) REFERENCES `producto` (`idproducto`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_ordenproducto_tipoprecio1` FOREIGN KEY (`tipoprecio_idtipoprecio`) REFERENCES `tipoprecio` (`idtipoprecio`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `ordentarea`
--
ALTER TABLE `ordentarea`
  ADD CONSTRAINT `fk_orden_has_tarea_tarea1` FOREIGN KEY (`tarea_idtarea`) REFERENCES `tarea` (`idtarea`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_ordentarea_ordenproducto1` FOREIGN KEY (`ordenproducto_idordenproducto`) REFERENCES `ordenproducto` (`idordenproducto`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `ordentareaestado`
--
ALTER TABLE `ordentareaestado`
  ADD CONSTRAINT `fk_ordentareaestado_estadoscrum1` FOREIGN KEY (`estadoscrum_idestadoscrum`) REFERENCES `estadoscrum` (`idestadoscrum`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_ordentareaestado_ordentarea1` FOREIGN KEY (`ordentarea_idordentarea`) REFERENCES `ordentarea` (`idordentarea`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `persona`
--
ALTER TABLE `persona`
  ADD CONSTRAINT `fk_persona_ciudad1` FOREIGN KEY (`ciudad_idciudad`) REFERENCES `ciudad` (`idciudad`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_persona_sexo1` FOREIGN KEY (`sexo_idsexo`) REFERENCES `sexo` (`idsexo`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `producto`
--
ALTER TABLE `producto`
  ADD CONSTRAINT `fk_producto_area1` FOREIGN KEY (`area_idarea`) REFERENCES `area` (`idarea`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_producto_formula1` FOREIGN KEY (`formula_idformula`) REFERENCES `formula` (`idformula`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `salidastock`
--
ALTER TABLE `salidastock`
  ADD CONSTRAINT `fk_ordentarea_has_stock_ordentarea1` FOREIGN KEY (`ordentarea_idordentarea`) REFERENCES `ordentarea` (`idordentarea`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_ordentarea_has_stock_stock1` FOREIGN KEY (`stock_idstock`) REFERENCES `stock` (`idstock`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `si_permiso`
--
ALTER TABLE `si_permiso`
  ADD CONSTRAINT `si_fk_Permiso_Modulo1` FOREIGN KEY (`Modulo_idsi_modulo`) REFERENCES `si_modulo` (`idsi_modulo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `si_fk_Permiso_Rol1` FOREIGN KEY (`Rol_idsi_rol`) REFERENCES `si_rol` (`idsi_rol`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `si_reporte`
--
ALTER TABLE `si_reporte`
  ADD CONSTRAINT `si_fk_Reporte_Modulo1` FOREIGN KEY (`Modulo_idsi_modulo`) REFERENCES `si_modulo` (`idsi_modulo`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `si_user`
--
ALTER TABLE `si_user`
  ADD CONSTRAINT `si_fk_User_Rol` FOREIGN KEY (`Rol_idsi_rol`) REFERENCES `si_rol` (`idsi_rol`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `tarea`
--
ALTER TABLE `tarea`
  ADD CONSTRAINT `fk_tarea_area1` FOREIGN KEY (`area_idarea`) REFERENCES `area` (`idarea`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_tarea_producto1` FOREIGN KEY (`producto_idproducto`) REFERENCES `producto` (`idproducto`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
