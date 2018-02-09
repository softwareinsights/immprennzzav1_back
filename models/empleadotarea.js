const connection = require('../config/db-connection');

const Empleadotarea = {};

Empleadotarea.findByIdEmpleado = (idEmpleado, created_by, next) => {
    if( !connection )
        return next('Connection refused');

    let query = '';
    let keys = [];
    if (created_by) {
        query = 'SELECT empleadotarea.*, _persona.nombre as empleado_empleado_idempleado , _tarea.nombre as ordentarea_ordentarea_idordentarea FROM empleadotarea INNER JOIN empleado as _empleado_idempleado ON _empleado_idempleado.idempleado = empleadotarea.empleado_idempleado INNER JOIN ordentarea as _ordentarea_idordentarea ON _ordentarea_idordentarea.idordentarea = empleadotarea.ordentarea_idordentarea INNER JOIN persona as _persona ON _persona.idpersona = _empleado_idempleado.persona_idpersona INNER JOIN tarea as _tarea ON _tarea.idtarea = _ordentarea_idordentarea.tarea_idtarea  WHERE empleadotarea.empleado_idempleado = ? AND empleadotarea.created_by = ? HAVING empleadotarea.baja IS NULL OR empleadotarea.baja = false';
        keys = [idEmpleado, created_by];
    } else {
        query = 'SELECT empleadotarea.*, _persona.nombre as empleado_empleado_idempleado , _tarea.nombre as ordentarea_ordentarea_idordentarea FROM empleadotarea INNER JOIN empleado as _empleado_idempleado ON _empleado_idempleado.idempleado = empleadotarea.empleado_idempleado INNER JOIN ordentarea as _ordentarea_idordentarea ON _ordentarea_idordentarea.idordentarea = empleadotarea.ordentarea_idordentarea INNER JOIN persona as _persona ON _persona.idpersona = _empleado_idempleado.persona_idpersona INNER JOIN tarea as _tarea ON _tarea.idtarea = _ordentarea_idordentarea.tarea_idtarea  WHERE empleadotarea.empleado_idempleado = ? HAVING empleadotarea.baja IS NULL OR empleadotarea.baja = false';
        keys = [idEmpleado];
    }

    connection.query(query, keys, (error, result) => {
        if(error)
            return next({ success: false, error: error, message: 'Un error ha ocurrido mientras se encontraba el registro' });
        else if (result.affectedRows === 0)
            return next(null, { success: false, result: result, message: 'Solo es posible encontrar registros propios' });
        else
            return next(null, { success: true, result: result, message: 'Empleadotarea encontrad@' });
    });
};
Empleadotarea.findByIdOrdentarea = (idOrdentarea, created_by, next) => {
    if( !connection )
        return next('Connection refused');

    let query = '';
    let keys = [];
    if (created_by) {
        query = 'SELECT empleadotarea.*, _persona.nombre as empleado_empleado_idempleado , _tarea.nombre as ordentarea_ordentarea_idordentarea FROM empleadotarea INNER JOIN empleado as _empleado_idempleado ON _empleado_idempleado.idempleado = empleadotarea.empleado_idempleado INNER JOIN ordentarea as _ordentarea_idordentarea ON _ordentarea_idordentarea.idordentarea = empleadotarea.ordentarea_idordentarea INNER JOIN persona as _persona ON _persona.idpersona = _empleado_idempleado.persona_idpersona INNER JOIN tarea as _tarea ON _tarea.idtarea = _ordentarea_idordentarea.tarea_idtarea  WHERE empleadotarea.ordentarea_idordentarea = ? AND empleadotarea.created_by = ? HAVING empleadotarea.baja IS NULL OR empleadotarea.baja = false';
        keys = [idOrdentarea, created_by];
    } else {
        query = 'SELECT empleadotarea.*, _persona.nombre as empleado_empleado_idempleado , _tarea.nombre as ordentarea_ordentarea_idordentarea FROM empleadotarea INNER JOIN empleado as _empleado_idempleado ON _empleado_idempleado.idempleado = empleadotarea.empleado_idempleado INNER JOIN ordentarea as _ordentarea_idordentarea ON _ordentarea_idordentarea.idordentarea = empleadotarea.ordentarea_idordentarea INNER JOIN persona as _persona ON _persona.idpersona = _empleado_idempleado.persona_idpersona INNER JOIN tarea as _tarea ON _tarea.idtarea = _ordentarea_idordentarea.tarea_idtarea  WHERE empleadotarea.ordentarea_idordentarea = ? HAVING empleadotarea.baja IS NULL OR empleadotarea.baja = false';
        keys = [idOrdentarea];
    }

    connection.query(query, keys, (error, result) => {
        if(error)
            return next({ success: false, error: error, message: 'Un error ha ocurrido mientras se encontraba el registro' });
        else if (result.affectedRows === 0)
            return next(null, { success: false, result: result, message: 'Solo es posible encontrar registros propios' });
        else
            return next(null, { success: true, result: result, message: 'Empleadotarea encontrad@' });
    });
};
Empleadotarea.all = (created_by, next) => {
    if( !connection )
        return next('Connection refused');

    let query = '';
    let keys = [];
    if (created_by) {
        query = 'SELECT empleadotarea.*, _persona.nombre as empleado_empleado_idempleado , _tarea.nombre as ordentarea_ordentarea_idordentarea FROM empleadotarea INNER JOIN empleado as _empleado_idempleado ON _empleado_idempleado.idempleado = empleadotarea.empleado_idempleado INNER JOIN ordentarea as _ordentarea_idordentarea ON _ordentarea_idordentarea.idordentarea = empleadotarea.ordentarea_idordentarea INNER JOIN persona as _persona ON _persona.idpersona = _empleado_idempleado.persona_idpersona INNER JOIN tarea as _tarea ON _tarea.idtarea = _ordentarea_idordentarea.tarea_idtarea  WHERE empleadotarea.created_by = ? HAVING empleadotarea.baja IS NULL OR empleadotarea.baja = false';
        keys = [created_by];
    } else {
        query = 'SELECT empleadotarea.*, _persona.nombre as empleado_empleado_idempleado , _tarea.nombre as ordentarea_ordentarea_idordentarea FROM empleadotarea INNER JOIN empleado as _empleado_idempleado ON _empleado_idempleado.idempleado = empleadotarea.empleado_idempleado INNER JOIN ordentarea as _ordentarea_idordentarea ON _ordentarea_idordentarea.idordentarea = empleadotarea.ordentarea_idordentarea INNER JOIN persona as _persona ON _persona.idpersona = _empleado_idempleado.persona_idpersona INNER JOIN tarea as _tarea ON _tarea.idtarea = _ordentarea_idordentarea.tarea_idtarea  HAVING empleadotarea.baja IS NULL OR empleadotarea.baja = false';
        keys = [];
    }

    connection.query(query, keys, (error, result) => {
        if(error) 
            return next({ success: false, error: error, message: 'Un error ha ocurrido mientras se leían registros' });
        else if (result.affectedRows === 0)
            return next(null, { success: false, result: result, message: 'Solo es posible leer registros propios' });
        else
            return next(null, { success: true, result: result, message: 'Empleadotarea leíd@' });
    });
};

Empleadotarea.findById = (idEmpleadotarea, created_by, next) => {
    if( !connection )
        return next('Connection refused');

    let query = '';
    let keys = [];
    if (created_by) {
        query = 'SELECT * FROM empleadotarea WHERE idempleadotarea = ? AND created_by = ? HAVING baja IS NULL OR baja = false';
        keys = [idEmpleadotarea, created_by];
    } else {
        query = 'SELECT * FROM empleadotarea WHERE idempleadotarea = ? HAVING baja IS NULL OR baja = false';
        keys = [idEmpleadotarea];
    }

    connection.query(query, keys, (error, result) => {
        if(error) 
            return next({ success: false, error: error, message: 'Un error ha ocurrido mientras se encontraba el registro' });
        else if (result.affectedRows === 0)
            return next(null, { success: false, result: result, message: 'Solo es posible encontrar registros propios' });
        else
            return next(null, { success: true, result: result, message: 'Empleadotarea encontrad@' });
    });
};

Empleadotarea.count = (next) => {
    if( !connection )
        return next('Connection refused');

    let query = '';
    let keys = [];
    query = 'SELECT COUNT(idempleadotarea) AS count FROM empleadotarea';
    keys = [];

    connection.query(query, keys, (error, result) => {
        if(error) 
            return next({ success: false, error: error, message: 'Un error ha ocurrido mientras se leían registros' });
        else
            return next(null, { success: true, result: result, message: 'Empleadotarea contabilizad@' });
    });
};

Empleadotarea.exist = (idEmpleadotarea, next) => {
    if( !connection )
        return next('Connection refused');

    let query = '';
    let keys = [];
    query = 'SELECT EXISTS(SELECT 1 FROM empleadotarea WHERE idempleadotarea = ?) AS exist';
    keys = [idEmpleadotarea];

    connection.query(query, keys, (error, result) => {
        if(error) 
            return next({ success: false, error: error, message: 'Un error ha ocurrido mientras se leían registros' });
        else
            return next(null, { success: true, result: result, message: 'Empleadotarea verificad@' });
    });
};

Empleadotarea.insert = (Empleadotarea, next) => {
    if( !connection )
        return next('Connection refused');

    let query = '';
    let keys = [];
    query = 'INSERT INTO empleadotarea SET ?';
    keys = [Empleadotarea];

    connection.query(query, keys, (error, result) => {
        if(error) 
            return next({ success: false, error: error, message: 'Un error ha ocurrido mientras se creaba el registro' });
        else
            return next(null, { success: true, result: result, message: 'Empleadotarea cread@' });
    });
};

Empleadotarea.update = (Empleadotarea, created_by, next) => {
    if( !connection )
        return next('Connection refused');

    let query = '';
    let keys = [];
    if (created_by) {
        query = 'UPDATE empleadotarea SET ? WHERE idempleadotarea = ? AND created_by = ?';
        keys = [Empleadotarea, Empleadotarea.idempleadotarea, created_by];
    } else {
        query = 'UPDATE empleadotarea SET ? WHERE idempleadotarea = ?';
        keys = [Empleadotarea, Empleadotarea.idempleadotarea];
    }

    connection.query(query, keys, (error, result) => {
        if(error) 
            return next({ success: false, error: error, message: 'Un error ha ocurrido mientras se actualizaba el registro' });
        else if (result.affectedRows === 0)
            return next(null, { success: false, result: result, message: 'Solo es posible actualizar registros propios' });
        else
            return next(null, { success: true, result: result, message: 'Empleadotarea actualizad@' });
    });
};

Empleadotarea.remove = (idempleadotarea, created_by, next) => {
    if( !connection )
        return next('Connection refused');

    let query = '';
    let keys = [];
    if (created_by) {
        query = 'DELETE FROM empleadotarea WHERE idempleadotarea = ? AND created_by = ?';
        keys = [idempleadotarea, created_by];
    } else {
        query = 'DELETE FROM empleadotarea WHERE idempleadotarea = ?';
        keys = [idempleadotarea];
    }

    connection.query(query, keys, (error, result) => {
        if(error) 
            return next({ success: false, error: error, message: 'Un error ha ocurrido mientras se eliminaba el registro' });
        else if (result.affectedRows === 0)
            return next(null, { success: false, result: result, message: 'Solo es posible eliminar registros propios' });
        else
            return next(null, { success: true, result: result, message: 'Empleadotarea eliminad@' });
    });
};

Empleadotarea.logicRemove = (idempleadotarea, created_by, next) => {
    if( !connection )
        return next('Connection refused');

    let query = '';
    let keys = [];
    if (created_by) {
        query = 'UPDATE empleadotarea SET baja = 1 WHERE idempleadotarea = ? AND created_by = ?';
        keys = [idempleadotarea, created_by];
    } else {
        query = 'UPDATE empleadotarea SET baja = 1 WHERE idempleadotarea = ?';
        keys = [idempleadotarea];
    }

    connection.query(query, keys, (error, result) => {
        if(error) 
            return next({ success: false, error: error, message: 'Un error ha ocurrido mientras se eliminaba el registro' });
        else if (result.affectedRows === 0)
            return next(null, { success: false, result: result, message: 'Solo es posible eliminar registros propios' });
        else
            return next(null, { success: true, result: result, message: 'Empleadotarea eliminad@' });
    });
};

Empleadotarea.response = (res, error, data) => {
    if ( error )
        res.status(500).json(error);
    else
        res.status(200).json(data);
};

module.exports = Empleadotarea;
