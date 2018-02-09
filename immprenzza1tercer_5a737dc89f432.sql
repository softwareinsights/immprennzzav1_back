-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 09-02-2018 a las 18:58:14
-- Versión del servidor: 10.1.9-MariaDB
-- Versión de PHP: 5.6.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `immprenzza1tercer_5a737dc89f432`
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
  `url` varchar(55) NOT NULL COMMENT '1|Url',
  `tipo` varchar(15) NOT NULL COMMENT '1|Tipo de Archivo',
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
  `baja` tinyint(1) DEFAULT NULL COMMENT '0|',
  `created_by` int(11) DEFAULT NULL COMMENT '0|',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '0|',
  `modified_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '0|',
  `fechaEstimada` date DEFAULT NULL COMMENT '1|Fecha Estimada de Entrega',
  `horaEstimada` time DEFAULT NULL COMMENT '1|Hora Estimada de Entrega'
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
  `idsalidastockcol` int(11) NOT NULL COMMENT '0|',
  `ordentarea_idordentarea` int(11) NOT NULL COMMENT '1|Tarea de Orden|idordentarea',
  `stock_idstock` int(11) NOT NULL COMMENT '1|Producto en Stock|nombre',
  `cantidad` int(5) NOT NULL COMMENT '1|Cantidad Restada a Stock'
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

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `stock`
--

CREATE TABLE `stock` (
  `idstock` int(11) NOT NULL COMMENT '0|',
  `nombre` varchar(45) DEFAULT NULL COMMENT '1|Nombre del Producto o Material',
  `cantidad` int(5) DEFAULT NULL COMMENT '1|Cantidad en Stock'
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
  ADD UNIQUE KEY `idarea_UNIQUE` (`idarea`);

--
-- Indices de la tabla `checkout`
--
ALTER TABLE `checkout`
  ADD PRIMARY KEY (`idcheckout`),
  ADD UNIQUE KEY `idcheckout_UNIQUE` (`idcheckout`),
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
  ADD PRIMARY KEY (`idsalidastockcol`,`ordentarea_idordentarea`,`stock_idstock`),
  ADD UNIQUE KEY `idsalidastockcol_UNIQUE` (`idsalidastockcol`),
  ADD UNIQUE KEY `tarea_stock_unique` (`ordentarea_idordentarea`,`stock_idstock`),
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
  ADD PRIMARY KEY (`idstock`);

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
  MODIFY `idabono` int(11) NOT NULL AUTO_INCREMENT COMMENT '0|';
--
-- AUTO_INCREMENT de la tabla `alerta`
--
ALTER TABLE `alerta`
  MODIFY `idalerta` int(11) NOT NULL AUTO_INCREMENT COMMENT '0|';
--
-- AUTO_INCREMENT de la tabla `archivo`
--
ALTER TABLE `archivo`
  MODIFY `idarchivo` int(11) NOT NULL AUTO_INCREMENT COMMENT '0|';
--
-- AUTO_INCREMENT de la tabla `area`
--
ALTER TABLE `area`
  MODIFY `idarea` int(11) NOT NULL AUTO_INCREMENT COMMENT '0|';
--
-- AUTO_INCREMENT de la tabla `checkout`
--
ALTER TABLE `checkout`
  MODIFY `idcheckout` int(11) NOT NULL AUTO_INCREMENT COMMENT '0|';
--
-- AUTO_INCREMENT de la tabla `checkoutestado`
--
ALTER TABLE `checkoutestado`
  MODIFY `idcheckoutestado` int(11) NOT NULL AUTO_INCREMENT COMMENT '0|';
--
-- AUTO_INCREMENT de la tabla `ciudad`
--
ALTER TABLE `ciudad`
  MODIFY `idciudad` int(11) NOT NULL AUTO_INCREMENT COMMENT '0|';
--
-- AUTO_INCREMENT de la tabla `cliente`
--
ALTER TABLE `cliente`
  MODIFY `idcliente` int(11) NOT NULL AUTO_INCREMENT COMMENT '0|';
--
-- AUTO_INCREMENT de la tabla `concepto`
--
ALTER TABLE `concepto`
  MODIFY `idconcepto` int(11) NOT NULL AUTO_INCREMENT COMMENT '0|';
--
-- AUTO_INCREMENT de la tabla `egresoconcepto`
--
ALTER TABLE `egresoconcepto`
  MODIFY `idegresoconcepto` int(11) NOT NULL AUTO_INCREMENT COMMENT '0|';
--
-- AUTO_INCREMENT de la tabla `empleado`
--
ALTER TABLE `empleado`
  MODIFY `idempleado` int(11) NOT NULL AUTO_INCREMENT COMMENT '0|';
--
-- AUTO_INCREMENT de la tabla `empleadotarea`
--
ALTER TABLE `empleadotarea`
  MODIFY `idempleadotarea` int(11) NOT NULL AUTO_INCREMENT COMMENT '0|';
--
-- AUTO_INCREMENT de la tabla `empleadotareaestado`
--
ALTER TABLE `empleadotareaestado`
  MODIFY `idempleadotareaestado` int(11) NOT NULL AUTO_INCREMENT COMMENT '0|';
--
-- AUTO_INCREMENT de la tabla `estado`
--
ALTER TABLE `estado`
  MODIFY `idestado` int(11) NOT NULL AUTO_INCREMENT COMMENT '0|';
--
-- AUTO_INCREMENT de la tabla `estadoscrum`
--
ALTER TABLE `estadoscrum`
  MODIFY `idestadoscrum` int(11) NOT NULL AUTO_INCREMENT COMMENT '0|';
--
-- AUTO_INCREMENT de la tabla `formula`
--
ALTER TABLE `formula`
  MODIFY `idformula` int(11) NOT NULL AUTO_INCREMENT COMMENT '0|';
--
-- AUTO_INCREMENT de la tabla `orden`
--
ALTER TABLE `orden`
  MODIFY `idorden` int(11) NOT NULL AUTO_INCREMENT COMMENT '0|';
--
-- AUTO_INCREMENT de la tabla `ordenestado`
--
ALTER TABLE `ordenestado`
  MODIFY `idordenestado` int(11) NOT NULL AUTO_INCREMENT COMMENT '0|';
--
-- AUTO_INCREMENT de la tabla `ordenproducto`
--
ALTER TABLE `ordenproducto`
  MODIFY `idordenproducto` int(11) NOT NULL AUTO_INCREMENT COMMENT '0|';
--
-- AUTO_INCREMENT de la tabla `ordentarea`
--
ALTER TABLE `ordentarea`
  MODIFY `idordentarea` int(11) NOT NULL AUTO_INCREMENT COMMENT '0|';
--
-- AUTO_INCREMENT de la tabla `ordentareaestado`
--
ALTER TABLE `ordentareaestado`
  MODIFY `idordentareaestado` int(11) NOT NULL AUTO_INCREMENT COMMENT '0|';
--
-- AUTO_INCREMENT de la tabla `persona`
--
ALTER TABLE `persona`
  MODIFY `idpersona` int(11) NOT NULL AUTO_INCREMENT COMMENT '0|';
--
-- AUTO_INCREMENT de la tabla `producto`
--
ALTER TABLE `producto`
  MODIFY `idproducto` int(11) NOT NULL AUTO_INCREMENT COMMENT '0|';
--
-- AUTO_INCREMENT de la tabla `salidastock`
--
ALTER TABLE `salidastock`
  MODIFY `idsalidastockcol` int(11) NOT NULL AUTO_INCREMENT COMMENT '0|';
--
-- AUTO_INCREMENT de la tabla `sexo`
--
ALTER TABLE `sexo`
  MODIFY `idsexo` int(11) NOT NULL AUTO_INCREMENT COMMENT '0|';
--
-- AUTO_INCREMENT de la tabla `si_modulo`
--
ALTER TABLE `si_modulo`
  MODIFY `idsi_modulo` int(4) NOT NULL AUTO_INCREMENT COMMENT '0|', AUTO_INCREMENT=31;
--
-- AUTO_INCREMENT de la tabla `si_permiso`
--
ALTER TABLE `si_permiso`
  MODIFY `idsi_permiso` int(4) NOT NULL AUTO_INCREMENT COMMENT '0|';
--
-- AUTO_INCREMENT de la tabla `si_reporte`
--
ALTER TABLE `si_reporte`
  MODIFY `idsi_reporte` int(4) NOT NULL AUTO_INCREMENT COMMENT '0|', AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `si_rol`
--
ALTER TABLE `si_rol`
  MODIFY `idsi_rol` int(4) NOT NULL AUTO_INCREMENT COMMENT '0|', AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `si_user`
--
ALTER TABLE `si_user`
  MODIFY `idsi_user` int(4) NOT NULL AUTO_INCREMENT COMMENT '0|', AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `tarea`
--
ALTER TABLE `tarea`
  MODIFY `idtarea` int(11) NOT NULL AUTO_INCREMENT COMMENT '0|';
--
-- AUTO_INCREMENT de la tabla `tipoalerta`
--
ALTER TABLE `tipoalerta`
  MODIFY `idtipoalerta` int(11) NOT NULL AUTO_INCREMENT COMMENT '0|';
--
-- AUTO_INCREMENT de la tabla `tipoprecio`
--
ALTER TABLE `tipoprecio`
  MODIFY `idtipoprecio` int(11) NOT NULL AUTO_INCREMENT COMMENT '0|';
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `abono`
--
ALTER TABLE `abono`
  ADD CONSTRAINT `fk_abono_orden1` FOREIGN KEY (`orden_idorden`) REFERENCES `orden` (`idorden`) ON DELETE NO ACTION ON UPDATE NO ACTION;

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
