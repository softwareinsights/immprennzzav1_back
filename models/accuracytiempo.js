const connection = require('../config/db-connection');

var _ = require('lodash');


const Accuracytiempo = {};



Accuracytiempo.calcularPresicion = (created_by, next) => {
    if( !connection )
        return next('Connection refused');

    let query = '';
    let keys = [];

    query = 'SELECT  empleado.idempleado, checkout.fecha, empleado.horaEntrada,  xc.horaEntra AS horaEntra, empleado.horaSalida, xch.horaEntra AS horaSale, TIMEDIFF(xc.horaEntra, horaEntrada) AS diff_entrada,  TIMEDIFF(xch.horaEntra, horaSalida) AS diff_salida, (TIMEDIFF(xc.horaEntra, horaEntrada) - TIMEDIFF(xch.horaEntra, horaSalida)) as diff_total, ((((TIMEDIFF(xc.horaEntra, horaEntrada) - TIMEDIFF(xch.horaEntra, horaSalida)) * 100 / 80000) - 100) * -1) as prc_efectividad FROM empleado INNER JOIN checkout ON checkout.empleado_idempleado = empleado.idempleado JOIN (SELECT cc.horaEntra, cc.fecha, ee.idempleado FROM checkout AS cc INNER JOIN empleado as ee on cc.empleado_idempleado = ee.idempleado  WHERE checkoutestado_idcheckoutestado = 1 AND cc.horaEntra != ""  GROUP BY ee.idempleado, cc.fecha  ORDER BY cc.idcheckout) as xc on xc.idempleado = empleado.idempleado AND xc.fecha = checkout.fecha JOIN (SELECT cc.horaEntra, cc.fecha, ee.idempleado FROM checkout AS cc INNER JOIN empleado as ee on cc.empleado_idempleado = ee.idempleado  WHERE checkoutestado_idcheckoutestado = 2 AND cc.horaEntra != ""  GROUP BY ee.idempleado, cc.fecha  ORDER BY cc.idcheckout DESC) as xch on xch.idempleado = empleado.idempleado AND xch.fecha = checkout.fecha GROUP BY empleado.idempleado, checkout.fecha, xc.horaEntra ORDER BY  idempleado ASC,  prc_efectividad DESC, checkout.fecha';
    keys = [];

    connection.query(query, keys, (error, empleado) => {
        if(error) 
            return next({ success: false, error: error, message: 'Un error ha ocurrido mientras se leían registros' });
        else if (empleado.affectedRows === 0)
            return next(null, { success: false, result: empleado, message: 'Solo es posible leer registros propios' });
        else {

            // CREAR REGISTRO EN CHECKOUT
            if (empleado) {
                let i = 0;

                let array_empleado = [];
                for (let element in empleado) {
                    query = 'INSERT INTO `accuracytiempo` (`retraso`, `empleado_idempleado`, `fecha`, `accuracy`) VALUES (?, ?, ?, ?) ON DUPLICATE KEY UPDATE retraso = ?, accuracy = ?';
                    keys = [empleado[element].diff_total, empleado[element].idempleado, empleado[element].fecha, empleado[element].prc_efectividad, empleado[element].diff_total, empleado[element].prc_efectividad];

                    connection.query(query, keys, (error, result) => {
                        if(error) 
                            return next({ success: false, error: error, message: 'Un error ha ocurrido mientras se creaba registros' });
                        else {

                            array_empleado[i] =  empleado[element].idempleado;
                            i++;

                            // SI YA TERMINÓ TODA LA LISTA
                            if (+element + 1 == empleado.length) {

                                array_empleado = _.uniq(array_empleado);

                                // AL TERMINAR ACTUALIZAR EL CAMPO DE EFECTIVIDAD DEL empleado
                                for (let emp in array_empleado) {

                                    // CONSULTAR TODOS LOS PORCENTAJES DE EFICIENCIA DE EMPLEADO EN TABLA ACCURACYTIEMPO Y SACAR PROMEDIO ,  DATEADD(MONTH, DATEDIFF(MONTH, 0,GETDATE()), 0) AS primerDiaDelMes     AND fecha >= MONTH() 
                                    query = "SELECT retraso, empleado_idempleado, fecha, ROUND(AVG(accuracy),2) as accuracy, DATE_FORMAT(CURDATE(), '%Y-%m-01') as primerDiaDelMes FROM accuracytiempo WHERE empleado_idempleado = ? AND fecha >= (DATE_FORMAT(fecha, '%Y-%m-01')) GROUP BY empleado_idempleado";
                                    keys = [array_empleado[emp]];

                                    connection.query(query, keys, (error, accuracy) => {
                                        if(error) 
                                            return next({ success: false, error: error, message: 'Un error ha ocurrido mientras se leias registros eficiencia tiempo' });
                                        else {

                                            if (accuracy) {

                                                let eficiencia = accuracy[0].accuracy;

                                                query = 'UPDATE empleado SET eficiencia = ?  WHERE idempleado = ? ';
                                                keys = [eficiencia, array_empleado[emp]];
                                                connection.query(query, keys, (error, result) => {
                                                    if(error) 
                                                        return next({ success: false, error: error, message: 'Un error ha ocurrido mientras se actualizaba registros' });
                                                    else {
                                                        if (+emp + 1 == array_empleado.length) {
                                                            return next(null, { success: true, result: empleado, message: 'Tiempos de eficiencia de tiempo laboral de empleados actualizados' });
                                                        }
                                                    }
                                                });
                                            }
                                        }
                                    });
                                }
                            }
                        }
                    });
                }
            }
        }         
    });
};

Accuracytiempo.findByIdEmpleado = (idEmpleado, created_by, next) => {
    if( !connection )
        return next('Connection refused');

    let query = '';
    let keys = [];
    if (created_by) {
        query = 'SELECT accuracytiempo.*, _persona.nombre as empleado_empleado_idempleado FROM accuracytiempo INNER JOIN empleado as _empleado_idempleado ON _empleado_idempleado.idempleado = accuracytiempo.empleado_idempleado INNER JOIN persona as _persona ON _persona.idpersona = _empleado_idempleado.persona_idpersona  WHERE accuracytiempo.empleado_idempleado = ? AND accuracytiempo.created_by = ? HAVING accuracytiempo.baja IS NULL OR accuracytiempo.baja = false';
        keys = [idEmpleado, created_by];
    } else {
        query = 'SELECT accuracytiempo.*, _persona.nombre as empleado_empleado_idempleado FROM accuracytiempo INNER JOIN empleado as _empleado_idempleado ON _empleado_idempleado.idempleado = accuracytiempo.empleado_idempleado INNER JOIN persona as _persona ON _persona.idpersona = _empleado_idempleado.persona_idpersona  WHERE accuracytiempo.empleado_idempleado = ? HAVING accuracytiempo.baja IS NULL OR accuracytiempo.baja = false';
        keys = [idEmpleado];
    }

    connection.query(query, keys, (error, result) => {
        if(error)
            return next({ success: false, error: error, message: 'Un error ha ocurrido mientras se encontraba el registro' });
        else if (result.affectedRows === 0)
            return next(null, { success: false, result: result, message: 'Solo es posible encontrar registros propios' });
        else
            return next(null, { success: true, result: result, message: 'Accuracytiempo encontrad@' });
    });
};
Accuracytiempo.all = (created_by, next) => {
    if( !connection )
        return next('Connection refused');

    let query = '';
    let keys = [];
    if (created_by) {
        query = 'SELECT accuracytiempo.*, _persona.nombre as empleado_empleado_idempleado FROM accuracytiempo INNER JOIN empleado as _empleado_idempleado ON _empleado_idempleado.idempleado = accuracytiempo.empleado_idempleado INNER JOIN persona as _persona ON _persona.idpersona = _empleado_idempleado.persona_idpersona  WHERE accuracytiempo.created_by = ? HAVING accuracytiempo.baja IS NULL OR accuracytiempo.baja = false';
        keys = [created_by];
    } else {
        query = 'SELECT accuracytiempo.*, _persona.nombre as empleado_empleado_idempleado FROM accuracytiempo INNER JOIN empleado as _empleado_idempleado ON _empleado_idempleado.idempleado = accuracytiempo.empleado_idempleado INNER JOIN persona as _persona ON _persona.idpersona = _empleado_idempleado.persona_idpersona  HAVING accuracytiempo.baja IS NULL OR accuracytiempo.baja = false';
        keys = [];
    }

    connection.query(query, keys, (error, result) => {
        if(error) 
            return next({ success: false, error: error, message: 'Un error ha ocurrido mientras se leían registros' });
        else if (result.affectedRows === 0)
            return next(null, { success: false, result: result, message: 'Solo es posible leer registros propios' });
        else
            return next(null, { success: true, result: result, message: 'Accuracytiempo leíd@' });
    });
};

Accuracytiempo.findById = (idAccuracytiempo, created_by, next) => {
    if( !connection )
        return next('Connection refused');

    let query = '';
    let keys = [];
    if (created_by) {
        query = 'SELECT * FROM accuracytiempo WHERE idaccuracytiempo = ? AND created_by = ? HAVING baja IS NULL OR baja = false';
        keys = [idAccuracytiempo, created_by];
    } else {
        query = 'SELECT * FROM accuracytiempo WHERE idaccuracytiempo = ? HAVING baja IS NULL OR baja = false';
        keys = [idAccuracytiempo];
    }

    connection.query(query, keys, (error, result) => {
        if(error) 
            return next({ success: false, error: error, message: 'Un error ha ocurrido mientras se encontraba el registro' });
        else if (result.affectedRows === 0)
            return next(null, { success: false, result: result, message: 'Solo es posible encontrar registros propios' });
        else
            return next(null, { success: true, result: result, message: 'Accuracytiempo encontrad@' });
    });
};

Accuracytiempo.count = (next) => {
    if( !connection )
        return next('Connection refused');

    let query = '';
    let keys = [];
    query = 'SELECT COUNT(idaccuracytiempo) AS count FROM accuracytiempo';
    keys = [];

    connection.query(query, keys, (error, result) => {
        if(error) 
            return next({ success: false, error: error, message: 'Un error ha ocurrido mientras se leían registros' });
        else
            return next(null, { success: true, result: result, message: 'Accuracytiempo contabilizad@' });
    });
};

Accuracytiempo.exist = (idAccuracytiempo, next) => {
    if( !connection )
        return next('Connection refused');

    let query = '';
    let keys = [];
    query = 'SELECT EXISTS(SELECT 1 FROM accuracytiempo WHERE idaccuracytiempo = ?) AS exist';
    keys = [idAccuracytiempo];

    connection.query(query, keys, (error, result) => {
        if(error) 
            return next({ success: false, error: error, message: 'Un error ha ocurrido mientras se leían registros' });
        else
            return next(null, { success: true, result: result, message: 'Accuracytiempo verificad@' });
    });
};

Accuracytiempo.insert = (Accuracytiempo, next) => {
    if( !connection )
        return next('Connection refused');

    let query = '';
    let keys = [];
    query = 'INSERT INTO accuracytiempo SET ?';
    keys = [Accuracytiempo];

    connection.query(query, keys, (error, result) => {
        if(error) 
            return next({ success: false, error: error, message: 'Un error ha ocurrido mientras se creaba el registro' });
        else
            return next(null, { success: true, result: result, message: 'Accuracytiempo cread@' });
    });
};

Accuracytiempo.update = (Accuracytiempo, created_by, next) => {
    if( !connection )
        return next('Connection refused');

    let query = '';
    let keys = [];
    if (created_by) {
        query = 'UPDATE accuracytiempo SET ? WHERE idaccuracytiempo = ? AND created_by = ?';
        keys = [Accuracytiempo, Accuracytiempo.idaccuracytiempo, created_by];
    } else {
        query = 'UPDATE accuracytiempo SET ? WHERE idaccuracytiempo = ?';
        keys = [Accuracytiempo, Accuracytiempo.idaccuracytiempo];
    }

    connection.query(query, keys, (error, result) => {
        if(error) 
            return next({ success: false, error: error, message: 'Un error ha ocurrido mientras se actualizaba el registro' });
        else if (result.affectedRows === 0)
            return next(null, { success: false, result: result, message: 'Solo es posible actualizar registros propios' });
        else
            return next(null, { success: true, result: result, message: 'Accuracytiempo actualizad@' });
    });
};

Accuracytiempo.remove = (idaccuracytiempo, created_by, next) => {
    if( !connection )
        return next('Connection refused');

    let query = '';
    let keys = [];
    if (created_by) {
        query = 'DELETE FROM accuracytiempo WHERE idaccuracytiempo = ? AND created_by = ?';
        keys = [idaccuracytiempo, created_by];
    } else {
        query = 'DELETE FROM accuracytiempo WHERE idaccuracytiempo = ?';
        keys = [idaccuracytiempo];
    }

    connection.query(query, keys, (error, result) => {
        if(error) 
            return next({ success: false, error: error, message: 'Un error ha ocurrido mientras se eliminaba el registro' });
        else if (result.affectedRows === 0)
            return next(null, { success: false, result: result, message: 'Solo es posible eliminar registros propios' });
        else
            return next(null, { success: true, result: result, message: 'Accuracytiempo eliminad@' });
    });
};

Accuracytiempo.logicRemove = (idaccuracytiempo, created_by, next) => {
    if( !connection )
        return next('Connection refused');

    let query = '';
    let keys = [];
    if (created_by) {
        query = 'UPDATE accuracytiempo SET baja = 1 WHERE idaccuracytiempo = ? AND created_by = ?';
        keys = [idaccuracytiempo, created_by];
    } else {
        query = 'UPDATE accuracytiempo SET baja = 1 WHERE idaccuracytiempo = ?';
        keys = [idaccuracytiempo];
    }

    connection.query(query, keys, (error, result) => {
        if(error) 
            return next({ success: false, error: error, message: 'Un error ha ocurrido mientras se eliminaba el registro' });
        else if (result.affectedRows === 0)
            return next(null, { success: false, result: result, message: 'Solo es posible eliminar registros propios' });
        else
            return next(null, { success: true, result: result, message: 'Accuracytiempo eliminad@' });
    });
};

Accuracytiempo.response = (res, error, data) => {
    if ( error )
        res.status(500).json(error);
    else
        res.status(200).json(data);
};

module.exports = Accuracytiempo;
