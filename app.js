const express = require('express');
const connection = require('./config/db-connection');
const bodyParser = require('body-parser');
const cors = require('cors');
const morgan = require('morgan');
const passport = require('passport');

//Route importation.
const abono = require('./routes/abonos');
const accuracyestimacion = require('./routes/accuracyestimacions');
const accuracytiempo = require('./routes/accuracytiempos');
const alerta = require('./routes/alertas');
const archivo = require('./routes/archivos');
const area = require('./routes/areas');
const checkout = require('./routes/checkouts');
const checkoutestado = require('./routes/checkoutestados');
const ciudad = require('./routes/ciudads');
const cliente = require('./routes/clientes');
const concepto = require('./routes/conceptos');
const egresoconcepto = require('./routes/egresoconceptos');
const empleado = require('./routes/empleados');
const empleadotarea = require('./routes/empleadotareas');
const empleadotareaestado = require('./routes/empleadotareaestados');
const estado = require('./routes/estados');
const estadoscrum = require('./routes/estadoscrums');
const formula = require('./routes/formulas');
const orden = require('./routes/ordens');
const ordenestado = require('./routes/ordenestados');
const ordenproducto = require('./routes/ordenproductos');
const ordentarea = require('./routes/ordentareas');
const ordentareaestado = require('./routes/ordentareaestados');
const persona = require('./routes/personas');
const producto = require('./routes/productos');
const salidastock = require('./routes/salidastocks');
const sexo = require('./routes/sexos');
const si_modulo = require('./routes/si_modulos');
const si_permiso = require('./routes/si_permisos');
const si_reporte = require('./routes/si_reportes');
const si_rol = require('./routes/si_rols');
const si_user = require('./routes/si_users');
const stock = require('./routes/stocks');
const tarea = require('./routes/tareas');
const tipoalerta = require('./routes/tipoalertas');
const tipoprecio = require('./routes/tipoprecios');
const dashboard = require('./routes/dashboards');

// Express Instance
const app = express();

// Middleware
app.use(cors());
app.use(morgan('dev'));
app.use(bodyParser.json());

// Initialize passport
app.use(passport.initialize());

// Call passport Strategy
require('./config/passport')(passport);

// Warehouses
app.use('/abono', abono);
app.use('/accuracyestimacion', accuracyestimacion);
app.use('/accuracytiempo', accuracytiempo);
app.use('/alerta', alerta);
app.use('/archivo', archivo);
app.use('/area', area);
app.use('/checkout', checkout);
app.use('/checkoutestado', checkoutestado);
app.use('/ciudad', ciudad);
app.use('/cliente', cliente);
app.use('/concepto', concepto);
app.use('/egresoconcepto', egresoconcepto);
app.use('/empleado', empleado);
app.use('/empleadotarea', empleadotarea);
app.use('/empleadotareaestado', empleadotareaestado);
app.use('/estado', estado);
app.use('/estadoscrum', estadoscrum);
app.use('/formula', formula);
app.use('/orden', orden);
app.use('/ordenestado', ordenestado);
app.use('/ordenproducto', ordenproducto);
app.use('/ordentarea', ordentarea);
app.use('/ordentareaestado', ordentareaestado);
app.use('/persona', persona);
app.use('/producto', producto);
app.use('/salidastock', salidastock);
app.use('/sexo', sexo);
app.use('/si_modulo', si_modulo);
app.use('/si_permiso', si_permiso);
app.use('/si_reporte', si_reporte);
app.use('/si_rol', si_rol);
app.use('/si_user', si_user);
app.use('/stock', stock);
app.use('/tarea', tarea);
app.use('/tipoalerta', tipoalerta);
app.use('/tipoprecio', tipoprecio);
app.use('/dashboard', dashboard);

// Set port
app.listen(3000);
