const connection = require('../config/db-connection');

const Accuracyestimacion = {};

Accuracyestimacion.findByIdOrdentarea = (idOrdentarea, created_by, next) => {
    if( !connection )
        return next('Connection refused');

    let query = '';
    let keys = [];
    if (created_by) {
        query = 'SELECT accuracyestimacion.*, _persona.nombre as empleado_empleado_idempleado , _tarea.nombre as ordentarea_ordentarea_idordentarea FROM accuracyestimacion INNER JOIN empleado as _empleado_idempleado ON _empleado_idempleado.idempleado = accuracyestimacion.empleado_idempleado INNER JOIN ordentarea as _ordentarea_idordentarea ON _ordentarea_idordentarea.idordentarea = accuracyestimacion.ordentarea_idordentarea INNER JOIN persona as _persona ON _persona.idpersona = _empleado_idempleado.persona_idpersona INNER JOIN tarea as _tarea ON _tarea.idtarea = _ordentarea_idordentarea.tarea_idtarea  WHERE accuracyestimacion.ordentarea_idordentarea = ? AND accuracyestimacion.created_by = ? HAVING accuracyestimacion.baja IS NULL OR accuracyestimacion.baja = false';
        keys = [idOrdentarea, created_by];
    } else {
        query = 'SELECT accuracyestimacion.*, _persona.nombre as empleado_empleado_idempleado , _tarea.nombre as ordentarea_ordentarea_idordentarea FROM accuracyestimacion INNER JOIN empleado as _empleado_idempleado ON _empleado_idempleado.idempleado = accuracyestimacion.empleado_idempleado INNER JOIN ordentarea as _ordentarea_idordentarea ON _ordentarea_idordentarea.idordentarea = accuracyestimacion.ordentarea_idordentarea INNER JOIN persona as _persona ON _persona.idpersona = _empleado_idempleado.persona_idpersona INNER JOIN tarea as _tarea ON _tarea.idtarea = _ordentarea_idordentarea.tarea_idtarea  WHERE accuracyestimacion.ordentarea_idordentarea = ? HAVING accuracyestimacion.baja IS NULL OR accuracyestimacion.baja = false';
        keys = [idOrdentarea];
    }

    connection.query(query, keys, (error, result) => {
        if(error)
            return next({ success: false, error: error, message: 'Un error ha ocurrido mientras se encontraba el registro' });
        else if (result.affectedRows === 0)
            return next(null, { success: false, result: result, message: 'Solo es posible encontrar registros propios' });
        else
            return next(null, { success: true, result: result, message: 'Accuracyestimacion encontrad@' });
    });
};
Accuracyestimacion.findByIdEmpleado = (idEmpleado, created_by, next) => {
    if( !connection )
        return next('Connection refused');

    let query = '';
    let keys = [];
    if (created_by) {
        query = 'SELECT accuracyestimacion.*, _persona.nombre as empleado_empleado_idempleado , _tarea.nombre as ordentarea_ordentarea_idordentarea FROM accuracyestimacion INNER JOIN empleado as _empleado_idempleado ON _empleado_idempleado.idempleado = accuracyestimacion.empleado_idempleado INNER JOIN ordentarea as _ordentarea_idordentarea ON _ordentarea_idordentarea.idordentarea = accuracyestimacion.ordentarea_idordentarea INNER JOIN persona as _persona ON _persona.idpersona = _empleado_idempleado.persona_idpersona INNER JOIN tarea as _tarea ON _tarea.idtarea = _ordentarea_idordentarea.tarea_idtarea  WHERE accuracyestimacion.empleado_idempleado = ? AND accuracyestimacion.created_by = ? HAVING accuracyestimacion.baja IS NULL OR accuracyestimacion.baja = false';
        keys = [idEmpleado, created_by];
    } else {
        query = 'SELECT accuracyestimacion.*, _persona.nombre as empleado_empleado_idempleado , _tarea.nombre as ordentarea_ordentarea_idordentarea FROM accuracyestimacion INNER JOIN empleado as _empleado_idempleado ON _empleado_idempleado.idempleado = accuracyestimacion.empleado_idempleado INNER JOIN ordentarea as _ordentarea_idordentarea ON _ordentarea_idordentarea.idordentarea = accuracyestimacion.ordentarea_idordentarea INNER JOIN persona as _persona ON _persona.idpersona = _empleado_idempleado.persona_idpersona INNER JOIN tarea as _tarea ON _tarea.idtarea = _ordentarea_idordentarea.tarea_idtarea  WHERE accuracyestimacion.empleado_idempleado = ? HAVING accuracyestimacion.baja IS NULL OR accuracyestimacion.baja = false';
        keys = [idEmpleado];
    }

    connection.query(query, keys, (error, result) => {
        if(error)
            return next({ success: false, error: error, message: 'Un error ha ocurrido mientras se encontraba el registro' });
        else if (result.affectedRows === 0)
            return next(null, { success: false, result: result, message: 'Solo es posible encontrar registros propios' });
        else
            return next(null, { success: true, result: result, message: 'Accuracyestimacion encontrad@' });
    });
};
Accuracyestimacion.all = (created_by, next) => {
    if( !connection )
        return next('Connection refused');

    let query = '';
    let keys = [];
    if (created_by) {
        query = 'SELECT accuracyestimacion.*, _persona.nombre as empleado_empleado_idempleado , _tarea.nombre as ordentarea_ordentarea_idordentarea FROM accuracyestimacion INNER JOIN empleado as _empleado_idempleado ON _empleado_idempleado.idempleado = accuracyestimacion.empleado_idempleado INNER JOIN ordentarea as _ordentarea_idordentarea ON _ordentarea_idordentarea.idordentarea = accuracyestimacion.ordentarea_idordentarea INNER JOIN persona as _persona ON _persona.idpersona = _empleado_idempleado.persona_idpersona INNER JOIN tarea as _tarea ON _tarea.idtarea = _ordentarea_idordentarea.tarea_idtarea  WHERE accuracyestimacion.created_by = ? HAVING accuracyestimacion.baja IS NULL OR accuracyestimacion.baja = false';
        keys = [created_by];
    } else {
        query = 'SELECT accuracyestimacion.*, _persona.nombre as empleado_empleado_idempleado , _tarea.nombre as ordentarea_ordentarea_idordentarea FROM accuracyestimacion INNER JOIN empleado as _empleado_idempleado ON _empleado_idempleado.idempleado = accuracyestimacion.empleado_idempleado INNER JOIN ordentarea as _ordentarea_idordentarea ON _ordentarea_idordentarea.idordentarea = accuracyestimacion.ordentarea_idordentarea INNER JOIN persona as _persona ON _persona.idpersona = _empleado_idempleado.persona_idpersona INNER JOIN tarea as _tarea ON _tarea.idtarea = _ordentarea_idordentarea.tarea_idtarea  HAVING accuracyestimacion.baja IS NULL OR accuracyestimacion.baja = false';
        keys = [];
    }

    connection.query(query, keys, (error, result) => {
        if(error) 
            return next({ success: false, error: error, message: 'Un error ha ocurrido mientras se leían registros' });
        else if (result.affectedRows === 0)
            return next(null, { success: false, result: result, message: 'Solo es posible leer registros propios' });
        else
            return next(null, { success: true, result: result, message: 'Accuracyestimacion leíd@' });
    });
};

Accuracyestimacion.findById = (idAccuracyestimacion, created_by, next) => {
    if( !connection )
        return next('Connection refused');

    let query = '';
    let keys = [];
    if (created_by) {
        query = 'SELECT * FROM accuracyestimacion WHERE idaccuracyestimacion = ? AND created_by = ? HAVING baja IS NULL OR baja = false';
        keys = [idAccuracyestimacion, created_by];
    } else {
        query = 'SELECT * FROM accuracyestimacion WHERE idaccuracyestimacion = ? HAVING baja IS NULL OR baja = false';
        keys = [idAccuracyestimacion];
    }

    connection.query(query, keys, (error, result) => {
        if(error) 
            return next({ success: false, error: error, message: 'Un error ha ocurrido mientras se encontraba el registro' });
        else if (result.affectedRows === 0)
            return next(null, { success: false, result: result, message: 'Solo es posible encontrar registros propios' });
        else
            return next(null, { success: true, result: result, message: 'Accuracyestimacion encontrad@' });
    });
};

Accuracyestimacion.count = (next) => {
    if( !connection )
        return next('Connection refused');

    let query = '';
    let keys = [];
    query = 'SELECT COUNT(idaccuracyestimacion) AS count FROM accuracyestimacion';
    keys = [];

    connection.query(query, keys, (error, result) => {
        if(error) 
            return next({ success: false, error: error, message: 'Un error ha ocurrido mientras se leían registros' });
        else
            return next(null, { success: true, result: result, message: 'Accuracyestimacion contabilizad@' });
    });
};

Accuracyestimacion.exist = (idAccuracyestimacion, next) => {
    if( !connection )
        return next('Connection refused');

    let query = '';
    let keys = [];
    query = 'SELECT EXISTS(SELECT 1 FROM accuracyestimacion WHERE idaccuracyestimacion = ?) AS exist';
    keys = [idAccuracyestimacion];

    connection.query(query, keys, (error, result) => {
        if(error) 
            return next({ success: false, error: error, message: 'Un error ha ocurrido mientras se leían registros' });
        else
            return next(null, { success: true, result: result, message: 'Accuracyestimacion verificad@' });
    });
};

Accuracyestimacion.insert = (Accuracyestimacion, next) => {
    if( !connection )
        return next('Connection refused');

    let query = '';
    let keys = [];
    query = 'INSERT INTO accuracyestimacion SET ?';
    keys = [Accuracyestimacion];

    connection.query(query, keys, (error, result) => {
        if(error) 
            return next({ success: false, error: error, message: 'Un error ha ocurrido mientras se creaba el registro' });
        else
            return next(null, { success: true, result: result, message: 'Accuracyestimacion cread@' });
    });
};

Accuracyestimacion.update = (Accuracyestimacion, created_by, next) => {
    if( !connection )
        return next('Connection refused');

    let query = '';
    let keys = [];
    if (created_by) {
        query = 'UPDATE accuracyestimacion SET ? WHERE idaccuracyestimacion = ? AND created_by = ?';
        keys = [Accuracyestimacion, Accuracyestimacion.idaccuracyestimacion, created_by];
    } else {
        query = 'UPDATE accuracyestimacion SET ? WHERE idaccuracyestimacion = ?';
        keys = [Accuracyestimacion, Accuracyestimacion.idaccuracyestimacion];
    }

    connection.query(query, keys, (error, result) => {
        if(error) 
            return next({ success: false, error: error, message: 'Un error ha ocurrido mientras se actualizaba el registro' });
        else if (result.affectedRows === 0)
            return next(null, { success: false, result: result, message: 'Solo es posible actualizar registros propios' });
        else
            return next(null, { success: true, result: result, message: 'Accuracyestimacion actualizad@' });
    });
};

Accuracyestimacion.remove = (idaccuracyestimacion, created_by, next) => {
    if( !connection )
        return next('Connection refused');

    let query = '';
    let keys = [];
    if (created_by) {
        query = 'DELETE FROM accuracyestimacion WHERE idaccuracyestimacion = ? AND created_by = ?';
        keys = [idaccuracyestimacion, created_by];
    } else {
        query = 'DELETE FROM accuracyestimacion WHERE idaccuracyestimacion = ?';
        keys = [idaccuracyestimacion];
    }

    connection.query(query, keys, (error, result) => {
        if(error) 
            return next({ success: false, error: error, message: 'Un error ha ocurrido mientras se eliminaba el registro' });
        else if (result.affectedRows === 0)
            return next(null, { success: false, result: result, message: 'Solo es posible eliminar registros propios' });
        else
            return next(null, { success: true, result: result, message: 'Accuracyestimacion eliminad@' });
    });
};

Accuracyestimacion.logicRemove = (idaccuracyestimacion, created_by, next) => {
    if( !connection )
        return next('Connection refused');

    let query = '';
    let keys = [];
    if (created_by) {
        query = 'UPDATE accuracyestimacion SET baja = 1 WHERE idaccuracyestimacion = ? AND created_by = ?';
        keys = [idaccuracyestimacion, created_by];
    } else {
        query = 'UPDATE accuracyestimacion SET baja = 1 WHERE idaccuracyestimacion = ?';
        keys = [idaccuracyestimacion];
    }

    connection.query(query, keys, (error, result) => {
        if(error) 
            return next({ success: false, error: error, message: 'Un error ha ocurrido mientras se eliminaba el registro' });
        else if (result.affectedRows === 0)
            return next(null, { success: false, result: result, message: 'Solo es posible eliminar registros propios' });
        else
            return next(null, { success: true, result: result, message: 'Accuracyestimacion eliminad@' });
    });
};

Accuracyestimacion.response = (res, error, data) => {
    if ( error )
        res.status(500).json(error);
    else
        res.status(200).json(data);
};

module.exports = Accuracyestimacion;
