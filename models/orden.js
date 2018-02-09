const connection = require('../config/db-connection');

const Orden = {};

Orden.updateMontos = (idOrden, next) => {
    if( !connection )
        return next('Connection refused');

    // Obtengo el abono total para esta orden
    let query = '';
    let keys = [];
    query = 'SELECT *, COALESCE(SUM(montoPagado),0) as abonado FROM abono WHERE orden_idorden = ? AND baja IS NULL';
    keys = [idOrden];

    connection.query(query, keys, (error, abono) => {
        if(error) 
            return next({ success: false, error: error, message: 'Un error ha ocurrido mientras se leían registros' });
        else {

            let nuevoAbono = 0;
            if (abono[0].abonado !== undefined) {
                nuevoAbono = abono[0].abonado;
            }

            // Update a orden para modificar el adeudo que es la resta de abonado y adelanto a total y setear monto abonado que es el abono obtenido

            let query = '';
            let keys = [];

            // OBTENER LOS DATOS DE LA ORDEN
            query = 'SELECT * FROM orden WHERE idorden = ? HAVING baja IS NULL OR baja = false';
            keys = [idOrden];

            connection.query(query, keys, (error, orden) => {
                if(error) 
                    return next({ success: false, error: error, message: 'Un error ha ocurrido mientras se leían registros' });
                else {

                    const adelanto = orden[0].cubierto;
                    const adeudo = orden[0].adeudo;
                    const abonado = orden[0].abonado;
                    const total = orden[0].total;
                    let idestado = 0;
                    const nuevoAdeudo = total - nuevoAbono - adelanto;

                    // REALIZA EL ACTUALIZADO DE MONTOS A ORDEN
                    let query = '';
                    let keys = [];
                    query = 'UPDATE orden SET adeudo = ?, abonado = ? WHERE idorden = ?';
                    keys = [nuevoAdeudo, nuevoAbono, idOrden];

                    connection.query(query, keys, (error, ordenActualizada) => {
                        if(error) 
                            return next({ success: false, error: error, message: 'Un error ha ocurrido mientras se leían registros' });
                        else {

                            // INSERTAR REGISTRO EN ORDEN ESTADO
                            if (nuevoAdeudo === 0) {
                                idestado = 2; // PAGADO
                            } else if (nuevoAdeudo > 0) {
                                idestado = 1; // ADEUDANDO
                            } else if (nuevoAdeudo < 0) {
                                idestado = 5; // SOBREPAGADO
                            }

                            // FECHA Y HORA ACTUAL
                            const date = new Date();
                            const month = (date.getMonth() + 1);
                            const day = date.getDate();
                            const fecha = (date.getFullYear() + "-" + ((month < 10) ? "0" : "") + month + "-" + (day < 10) ? "0" : "") + day;
                            const hora = date.getHours() + ":" + date.getMinutes();

                            const ordenestado = {
                                'orden_idorden': idOrden,
                                'estado_idestado': idestado,
                                'fecha': fecha,
                                'hora': hora
                            }

                            let query = '';
                            let keys = [];
                            query = 'INSERT INTO ordenestado SET ?';
                            keys = [ordenestado];

                            connection.query(query, keys, (error, ordenActualizada) => {
                                if(error) 
                                    return next({ success: false, error: error, message: 'Un error ha ocurrido mientras se leían registros' });
                                else {
                                    return next(null, { success: true, result: ordenActualizada, message: 'Orden actualizada, montos actualizados correctamente' });
                                }
                            });
                        }
                    });
                }
            });
        }
    });
};

Orden.findByIdCliente = (idCliente, created_by, next) => {
    if( !connection )
        return next('Connection refused');

    let query = '';
    let keys = [];
    if (created_by) {
        query = 'SELECT orden.*, _persona.nombre as cliente_cliente_idcliente FROM orden INNER JOIN cliente as _cliente_idcliente ON _cliente_idcliente.idcliente = orden.cliente_idcliente INNER JOIN persona as _persona ON _persona.idpersona = _cliente_idcliente.persona_idpersona  WHERE orden.cliente_idcliente = ? AND orden.created_by = ? HAVING orden.baja IS NULL OR orden.baja = false';
        keys = [idCliente, created_by];
    } else {
        query = 'SELECT orden.*, _persona.nombre as cliente_cliente_idcliente FROM orden INNER JOIN cliente as _cliente_idcliente ON _cliente_idcliente.idcliente = orden.cliente_idcliente INNER JOIN persona as _persona ON _persona.idpersona = _cliente_idcliente.persona_idpersona  WHERE orden.cliente_idcliente = ? HAVING orden.baja IS NULL OR orden.baja = false';
        keys = [idCliente];
    }

    connection.query(query, keys, (error, result) => {
        if(error)
            return next({ success: false, error: error, message: 'Un error ha ocurrido mientras se encontraba el registro' });
        else if (result.affectedRows === 0)
            return next(null, { success: false, result: result, message: 'Solo es posible encontrar registros propios' });
        else
            return next(null, { success: true, result: result, message: 'Orden encontrad@' });
    });
};
Orden.all = (created_by, next) => {
    if( !connection )
        return next('Connection refused');

    let query = '';
    let keys = [];
    if (created_by) {
        query = 'SELECT orden.*, _persona.nombre as cliente_cliente_idcliente, oex.nombre as estado_estado_idestado, oex.oeFecha as ordenestado_fecha, oex.oeHora as ordenestado_hora FROM orden INNER JOIN cliente as _cliente_idcliente ON _cliente_idcliente.idcliente = orden.cliente_idcliente INNER JOIN persona as _persona ON _persona.idpersona = _cliente_idcliente.persona_idpersona INNER JOIN ordenestado AS oe ON oe.orden_idorden = orden.idorden INNER JOIN estado AS e ON e.idestado = oe.estado_idestado JOIN(SELECT e.nombre, oe.fecha as oeFecha, oe.hora as oeHora, o.idorden as orden_idorden, oe.baja FROM orden AS o INNER JOIN ordenestado AS oe ON oe.orden_idorden = o.idorden INNER JOIN estado AS e ON e.idestado = oe.estado_idestado WHERE oe.orden_idorden = o.idorden HAVING oe.baja IS NULL OR oe.baja = false ORDER BY oe.idordenestado DESC LIMIT 0,1) as oex ON orden.idorden = oex.orden_idorden WHERE orden.created_by = ? GROUP BY orden.idorden HAVING orden.baja IS NULL OR orden.baja = false';
        keys = [created_by];
    } else {
        query = 'SELECT orden.*, _persona.nombre as cliente_cliente_idcliente, oex.nombre as estado_estado_idestado, oex.oeFecha as ordenestado_fecha, oex.oeHora as ordenestado_hora FROM orden INNER JOIN cliente as _cliente_idcliente ON _cliente_idcliente.idcliente = orden.cliente_idcliente INNER JOIN persona as _persona ON _persona.idpersona = _cliente_idcliente.persona_idpersona INNER JOIN ordenestado AS oe ON oe.orden_idorden = orden.idorden INNER JOIN estado AS e ON e.idestado = oe.estado_idestado JOIN(SELECT e.nombre, oe.fecha as oeFecha, oe.hora as oeHora, o.idorden as orden_idorden, oe.baja FROM orden AS o INNER JOIN ordenestado AS oe ON oe.orden_idorden = o.idorden INNER JOIN estado AS e ON e.idestado = oe.estado_idestado WHERE oe.orden_idorden = o.idorden HAVING oe.baja IS NULL OR oe.baja = false ORDER BY oe.idordenestado DESC LIMIT 0,1) as oex ON orden.idorden = oex.orden_idorden GROUP BY orden.idorden HAVING orden.baja IS NULL OR orden.baja = false';
        keys = [];
    }
    connection.query(query, keys, (error, result) => {
        if(error) 
            return next({ success: false, error: error, message: 'Un error ha ocurrido mientras se leían registros' });
        else if (result.affectedRows === 0)
            return next(null, { success: false, result: result, message: 'Solo es posible leer registros propios' });
        else
            return next(null, { success: true, result: result, message: 'Orden leíd@' });
    });
};

Orden.findById = (idOrden, created_by, next) => {
    if( !connection )
        return next('Connection refused');

    let query = '';
    let keys = [];
    if (created_by) {
        query = 'SELECT * FROM orden WHERE idorden = ? AND created_by = ? HAVING baja IS NULL OR baja = false';
        keys = [idOrden, created_by];
    } else {
        query = 'SELECT * FROM orden WHERE idorden = ? HAVING baja IS NULL OR baja = false';
        keys = [idOrden];
    }

    connection.query(query, keys, (error, result) => {
        if(error) 
            return next({ success: false, error: error, message: 'Un error ha ocurrido mientras se encontraba el registro' });
        else if (result.affectedRows === 0)
            return next(null, { success: false, result: result, message: 'Solo es posible encontrar registros propios' });
        else
            return next(null, { success: true, result: result, message: 'Orden encontrad@' });
    });
};

Orden.count = (next) => {
    if( !connection )
        return next('Connection refused');

    let query = '';
    let keys = [];
    query = 'SELECT COUNT(idorden) AS count FROM orden';
    keys = [];

    connection.query(query, keys, (error, result) => {
        if(error) 
            return next({ success: false, error: error, message: 'Un error ha ocurrido mientras se leían registros' });
        else
            return next(null, { success: true, result: result, message: 'Orden contabilizad@' });
    });
};

Orden.exist = (idOrden, next) => {
    if( !connection )
        return next('Connection refused');

    let query = '';
    let keys = [];
    query = 'SELECT EXISTS(SELECT 1 FROM orden WHERE idorden = ?) AS exist';
    keys = [idOrden];

    connection.query(query, keys, (error, result) => {
        if(error) 
            return next({ success: false, error: error, message: 'Un error ha ocurrido mientras se leían registros' });
        else
            return next(null, { success: true, result: result, message: 'Orden verificad@' });
    });
};

Orden.insert = (Orden, next) => {
    if( !connection )
        return next('Connection refused');

    let query = '';
    let keys = [];
    query = 'INSERT INTO orden SET ?';
    keys = [Orden];

    connection.query(query, keys, (error, result) => {
        if(error) 
            return next({ success: false, error: error, message: 'Un error ha ocurrido mientras se creaba el registro' });
        else {

            let idestado;
            // CREACIÓN DE REGISTRO EN ORDEN ESTADO
            if (Orden.total === 0 && Orden.adeudo === 0) {
                idestado = 4; // SINCOSTO
            } else if (Orden.total > 0  && Orden.total === Orden.adelanto && Orden.adeudo === 0) {
                idestado = 2; // PAGADO
            }  else if (Orden.adelanto > Orden.total) {
                idestado = 5; // SOBREPAGADO
            } else {
                idestado = 1; // ADEUDANDO
            }

            const Ordenestado = {
                'orden_idorden': result.insertId,
                'estado_idestado': idestado, 
                'fecha': Orden.fecha,
                'hora': Orden.hora
            }

            let query = '';
            let keys = [];
            query = 'INSERT INTO ordenestado SET ?';
            keys = [Ordenestado];

            connection.query(query, keys, (error, result) => {
                if(error) 
                    return next({ success: false, error: error, message: 'Un error ha ocurrido mientras se creaba el registro de orden' });
                else
                    return next(null, { success: true, result: result, message: 'Orden cread@' });
            });

        }
    });
};

Orden.update = (Orden, created_by, next) => {
    if( !connection )
        return next('Connection refused');

    let query = '';
    let keys = [];
    if (created_by) {
        query = 'UPDATE orden SET ? WHERE idorden = ? AND created_by = ?';
        keys = [Orden, Orden.idorden, created_by];
    } else {
        query = 'UPDATE orden SET ? WHERE idorden = ?';
        keys = [Orden, Orden.idorden];
    }

    connection.query(query, keys, (error, result) => {
        if(error) 
            return next({ success: false, error: error, message: 'Un error ha ocurrido mientras se actualizaba el registro' });
        else if (result.affectedRows === 0)
            return next(null, { success: false, result: result, message: 'Solo es posible actualizar registros propios' });
        else {
            
            let idestado;
            // CREACIÓN DE REGISTRO EN ORDEN ESTADO
            if (Orden.total === 0 && Orden.adeudo === 0) {
                idestado = 4; // SINCOSTO
            } else if (Orden.total > 0  && Orden.total === Orden.adelanto && Orden.adeudo === 0) {
                idestado = 2; // PAGADO
            }  else if (Orden.adelanto > Orden.total) {
                idestado = 5; // SOBREPAGADO
            } else {
                idestado = 1; // ADEUDANDO
            }

            const Ordenestado = {
                'orden_idorden': Orden.idorden,
                'estado_idestado': idestado, 
                'fecha': Orden.fecha,
                'hora': Orden.hora
            }

            let query = '';
            let keys = [];
            query = 'INSERT INTO ordenestado SET ?';
            keys = [Ordenestado];

            connection.query(query, keys, (error, result) => {
                if(error) 
                    return next({ success: false, error: error, message: 'Un error ha ocurrido mientras se actualizaba el registro de orden' });
                else
                    return next(null, { success: true, result: result, message: 'Orden actualizad@' });
            });

        }
    });
};


Orden.remove = (idorden, created_by, next) => {
    if( !connection )
        return next('Connection refused');

    let query = '';
    let keys = [];
    if (created_by) {
        query = 'DELETE FROM orden WHERE idorden = ? AND created_by = ?';
        keys = [idorden, created_by];
    } else {
        query = 'DELETE FROM orden WHERE idorden = ?';
        keys = [idorden];
    }

    connection.query(query, keys, (error, result) => {
        if(error) 
            return next({ success: false, error: error, message: 'Un error ha ocurrido mientras se eliminaba el registro' });
        else if (result.affectedRows === 0)
            return next(null, { success: false, result: result, message: 'Solo es posible eliminar registros propios' });
        else
            return next(null, { success: true, result: result, message: 'Orden eliminad@' });
    });
};

Orden.logicRemove = (idorden, created_by, next) => {
    if( !connection )
        return next('Connection refused');

    let query = '';
    let keys = [];
    if (created_by) {
        query = 'UPDATE orden SET baja = 1 WHERE idorden = ? AND created_by = ?';
        keys = [idorden, created_by];
    } else {
        query = 'UPDATE orden SET baja = 1 WHERE idorden = ?';
        keys = [idorden];
    }

    connection.query(query, keys, (error, result) => {
        if(error) 
            return next({ success: false, error: error, message: 'Un error ha ocurrido mientras se eliminaba el registro' });
        else if (result.affectedRows === 0)
            return next(null, { success: false, result: result, message: 'Solo es posible eliminar registros propios' });
        else
            return next(null, { success: true, result: result, message: 'Orden eliminad@' });
    });
};

Orden.response = (res, error, data) => {
    if ( error )
        res.status(500).json(error);
    else
        res.status(200).json(data);
};

module.exports = Orden;
