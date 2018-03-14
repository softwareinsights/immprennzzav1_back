const connection = require('../config/db-connection');

const Dashboard = {};



Dashboard.accuracytiempo = (next) => {
    if( !connection )
        return next('Connection refused');

    let query = '';
    let keys = [];

    // MÁS EFICIENTES
    query = 'SELECT e.idempleado, e.idlector, e.eficiencia, e.horaEntrada, e.horaSalida, p.nombre as empleado_empleado_idempleado, a.nombre as area_area_idarea FROM empleado as e INNER JOIN persona as p on p.idpersona = e.persona_idpersona INNER JOIN area as a on a.idarea = e.area_idarea WHERE e.eficiencia > 0 AND e.baja IS NULL OR e.baja = false ORDER BY e.eficiencia DESC LIMIT 0,10';
    keys = [];
 
    connection.query(query, keys, (error, maseficientes) => {
        if(error) 
            return next({ success: false, error: error, message: 'Un error ha ocurrido mientras se leían registros' });
        else if (maseficientes.affectedRows === 0)
            return next(null, { success: false, result: maseficientes, message: 'Solo es posible leer registros propios' });
        else {

            if (maseficientes[0]) {

                // MENOS EFICIENTES
                query = 'SELECT e.idempleado, e.idlector, e.eficiencia, e.horaEntrada, e.horaSalida, p.nombre as empleado_empleado_idempleado, a.nombre as area_area_idarea FROM empleado as e INNER JOIN persona as p on p.idpersona = e.persona_idpersona INNER JOIN area as a on a.idarea = e.area_idarea WHERE e.eficiencia > 0 AND e.baja IS NULL OR e.baja = false ORDER BY e.eficiencia LIMIT 0,10';
                keys = [];

                connection.query(query, keys, (error, menoseficientes) => {
                    if(error) 
                        return next({ success: false, error: error, message: 'Un error ha ocurrido mientras se leían registros' });
                    else if (menoseficientes.affectedRows === 0)
                        return next(null, { success: false, result: menoseficientes, message: 'Solo es posible leer registros propios' });
                    else {
                        const result = {
                            'maseficientes': maseficientes,
                            'menoseficientes': menoseficientes,
                        }
                        return next(null, { success: true, result: result, message: 'Efectividad de tiempos laborales obtenidos' });
                    }
                });
            } else {
                return next(null, { success: false, result: maseficientes, message: 'No hay datos de efectividad para mostrar' });
            }
        }
    });
};


Dashboard.all = (next) => {
    if( !connection )
        return next('Connection refused');

    let query = '';
    let keys = [];
    query = 'SELECT pem.nombre as empleado, DATEDIFF(NOW(),ot.fechaEstimada) as dias_retraso, ot.fechaEstimada as otFechaEstimada, orden.*, _persona.nombre as cliente_cliente_idcliente, oex.nombre as estado_estado_idestado, oex.oeFecha as ordenestado_fecha, oex.oeHora as ordenestado_hora, oex.idestado as estado_idestado FROM ordentarea as ot INNER JOIN empleadotarea as et ON et.ordentarea_idordentarea = ot.idordentarea INNER JOIN empleado as em ON em.idempleado = et.empleado_idempleado INNER JOIN persona as pem ON pem.idpersona = em.persona_idpersona INNER JOIN ordenproducto as op ON op.idordenproducto = ot.ordenproducto_idordenproducto INNER JOIN orden as orden ON orden.idorden = op.orden_idorden INNER JOIN cliente as _cliente_idcliente ON _cliente_idcliente.idcliente = orden.cliente_idcliente INNER JOIN persona as _persona ON _persona.idpersona = _cliente_idcliente.persona_idpersona INNER JOIN ordenestado AS oe ON oe.orden_idorden = orden.idorden INNER JOIN estado AS e ON e.idestado = oe.estado_idestado LEFT JOIN(SELECT e.nombre, e.idestado, oe.fecha as oeFecha, oe.hora as oeHora, o.idorden as orden_idorden, oe.baja FROM orden AS o INNER JOIN ordenestado AS oe ON oe.orden_idorden = o.idorden INNER JOIN estado AS e ON e.idestado = oe.estado_idestado WHERE oe.orden_idorden = o.idorden AND e.idestado = 1 OR e.idestado = 2 HAVING oe.baja IS NULL OR oe.baja = false ORDER BY oe.idordenestado DESC LIMIT 0,1) as oex ON orden.idorden = oex.orden_idorden WHERE estado_idestado = 1 OR estado_idestado = 2 GROUP BY orden.idorden HAVING orden.baja IS NULL OR orden.baja = false ORDER BY dias_retraso DESC';
    keys = [];

    connection.query(query, keys, (error, result) => {
        if(error) 
            return next({ success: false, error: error, message: 'Un error ha ocurrido mientras se leían registros' });
        else if (result.affectedRows === 0)
            return next(null, { success: false, result: result, message: 'Solo es posible leer registros propios' });
        else
            return next(null, { success: true, result: result, message: 'Dashboard leíd@' });
    });
};

Dashboard.response = (res, error, data) => {
    if ( error )
        res.status(500).json(error);
    else
        res.status(200).json(data);
};

module.exports = Dashboard;
