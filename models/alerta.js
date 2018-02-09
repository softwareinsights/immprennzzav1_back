const connection = require('../config/db-connection');

const Alerta = {};

Alerta.findByIdEmpleado = (idEmpleado, created_by, next) => {
    if( !connection )
        return next('Connection refused');

    let query = '';
    let keys = [];
    if (created_by) {
        query = 'SELECT alerta.*, _persona.nombre as empleado_empleado_idempleado , _tipoalerta_idtipoalerta.nombre as tipoalerta_tipoalerta_idtipoalerta FROM alerta INNER JOIN empleado as _empleado_idempleado ON _empleado_idempleado.idempleado = alerta.empleado_idempleado INNER JOIN tipoalerta as _tipoalerta_idtipoalerta ON _tipoalerta_idtipoalerta.idtipoalerta = alerta.tipoalerta_idtipoalerta INNER JOIN persona as _persona ON _persona.idpersona = _empleado_idempleado.persona_idpersona  WHERE alerta.empleado_idempleado = ? AND alerta.created_by = ? HAVING alerta.baja IS NULL OR alerta.baja = false';
        keys = [idEmpleado, created_by];
    } else {
        query = 'SELECT alerta.*, _persona.nombre as empleado_empleado_idempleado , _tipoalerta_idtipoalerta.nombre as tipoalerta_tipoalerta_idtipoalerta FROM alerta INNER JOIN empleado as _empleado_idempleado ON _empleado_idempleado.idempleado = alerta.empleado_idempleado INNER JOIN tipoalerta as _tipoalerta_idtipoalerta ON _tipoalerta_idtipoalerta.idtipoalerta = alerta.tipoalerta_idtipoalerta INNER JOIN persona as _persona ON _persona.idpersona = _empleado_idempleado.persona_idpersona  WHERE alerta.empleado_idempleado = ? HAVING alerta.baja IS NULL OR alerta.baja = false';
        keys = [idEmpleado];
    }

    connection.query(query, keys, (error, result) => {
        if(error)
            return next({ success: false, error: error, message: 'Un error ha ocurrido mientras se encontraba el registro' });
        else if (result.affectedRows === 0)
            return next(null, { success: false, result: result, message: 'Solo es posible encontrar registros propios' });
        else
            return next(null, { success: true, result: result, message: 'Alerta encontrad@' });
    });
};
Alerta.findByIdTipoalerta = (idTipoalerta, created_by, next) => {
    if( !connection )
        return next('Connection refused');

    let query = '';
    let keys = [];
    if (created_by) {
        query = 'SELECT alerta.*, _persona.nombre as empleado_empleado_idempleado , _tipoalerta_idtipoalerta.nombre as tipoalerta_tipoalerta_idtipoalerta FROM alerta INNER JOIN empleado as _empleado_idempleado ON _empleado_idempleado.idempleado = alerta.empleado_idempleado INNER JOIN tipoalerta as _tipoalerta_idtipoalerta ON _tipoalerta_idtipoalerta.idtipoalerta = alerta.tipoalerta_idtipoalerta INNER JOIN persona as _persona ON _persona.idpersona = _empleado_idempleado.persona_idpersona  WHERE alerta.tipoalerta_idtipoalerta = ? AND alerta.created_by = ? HAVING alerta.baja IS NULL OR alerta.baja = false';
        keys = [idTipoalerta, created_by];
    } else {
        query = 'SELECT alerta.*, _persona.nombre as empleado_empleado_idempleado , _tipoalerta_idtipoalerta.nombre as tipoalerta_tipoalerta_idtipoalerta FROM alerta INNER JOIN empleado as _empleado_idempleado ON _empleado_idempleado.idempleado = alerta.empleado_idempleado INNER JOIN tipoalerta as _tipoalerta_idtipoalerta ON _tipoalerta_idtipoalerta.idtipoalerta = alerta.tipoalerta_idtipoalerta INNER JOIN persona as _persona ON _persona.idpersona = _empleado_idempleado.persona_idpersona  WHERE alerta.tipoalerta_idtipoalerta = ? HAVING alerta.baja IS NULL OR alerta.baja = false';
        keys = [idTipoalerta];
    }

    connection.query(query, keys, (error, result) => {
        if(error)
            return next({ success: false, error: error, message: 'Un error ha ocurrido mientras se encontraba el registro' });
        else if (result.affectedRows === 0)
            return next(null, { success: false, result: result, message: 'Solo es posible encontrar registros propios' });
        else
            return next(null, { success: true, result: result, message: 'Alerta encontrad@' });
    });
};
Alerta.all = (created_by, next) => {
    if( !connection )
        return next('Connection refused');

    let query = '';
    let keys = [];
    if (created_by) {
        query = 'SELECT alerta.*, _persona.nombre as empleado_empleado_idempleado , _tipoalerta_idtipoalerta.nombre as tipoalerta_tipoalerta_idtipoalerta FROM alerta INNER JOIN empleado as _empleado_idempleado ON _empleado_idempleado.idempleado = alerta.empleado_idempleado INNER JOIN tipoalerta as _tipoalerta_idtipoalerta ON _tipoalerta_idtipoalerta.idtipoalerta = alerta.tipoalerta_idtipoalerta INNER JOIN persona as _persona ON _persona.idpersona = _empleado_idempleado.persona_idpersona  WHERE alerta.created_by = ? HAVING alerta.baja IS NULL OR alerta.baja = false';
        keys = [created_by];
    } else {
        query = 'SELECT alerta.*, _persona.nombre as empleado_empleado_idempleado , _tipoalerta_idtipoalerta.nombre as tipoalerta_tipoalerta_idtipoalerta FROM alerta INNER JOIN empleado as _empleado_idempleado ON _empleado_idempleado.idempleado = alerta.empleado_idempleado INNER JOIN tipoalerta as _tipoalerta_idtipoalerta ON _tipoalerta_idtipoalerta.idtipoalerta = alerta.tipoalerta_idtipoalerta INNER JOIN persona as _persona ON _persona.idpersona = _empleado_idempleado.persona_idpersona  HAVING alerta.baja IS NULL OR alerta.baja = false';
        keys = [];
    }

    connection.query(query, keys, (error, result) => {
        if(error) 
            return next({ success: false, error: error, message: 'Un error ha ocurrido mientras se leían registros' });
        else if (result.affectedRows === 0)
            return next(null, { success: false, result: result, message: 'Solo es posible leer registros propios' });
        else
            return next(null, { success: true, result: result, message: 'Alerta leíd@' });
    });
};

Alerta.findById = (idAlerta, created_by, next) => {
    if( !connection )
        return next('Connection refused');

    let query = '';
    let keys = [];
    if (created_by) {
        query = 'SELECT * FROM alerta WHERE idalerta = ? AND created_by = ? HAVING baja IS NULL OR baja = false';
        keys = [idAlerta, created_by];
    } else {
        query = 'SELECT * FROM alerta WHERE idalerta = ? HAVING baja IS NULL OR baja = false';
        keys = [idAlerta];
    }

    connection.query(query, keys, (error, result) => {
        if(error) 
            return next({ success: false, error: error, message: 'Un error ha ocurrido mientras se encontraba el registro' });
        else if (result.affectedRows === 0)
            return next(null, { success: false, result: result, message: 'Solo es posible encontrar registros propios' });
        else
            return next(null, { success: true, result: result, message: 'Alerta encontrad@' });
    });
};

Alerta.count = (next) => {
    if( !connection )
        return next('Connection refused');

    let query = '';
    let keys = [];
    query = 'SELECT COUNT(idalerta) AS count FROM alerta';
    keys = [];

    connection.query(query, keys, (error, result) => {
        if(error) 
            return next({ success: false, error: error, message: 'Un error ha ocurrido mientras se leían registros' });
        else
            return next(null, { success: true, result: result, message: 'Alerta contabilizad@' });
    });
};

Alerta.exist = (idAlerta, next) => {
    if( !connection )
        return next('Connection refused');

    let query = '';
    let keys = [];
    query = 'SELECT EXISTS(SELECT 1 FROM alerta WHERE idalerta = ?) AS exist';
    keys = [idAlerta];

    connection.query(query, keys, (error, result) => {
        if(error) 
            return next({ success: false, error: error, message: 'Un error ha ocurrido mientras se leían registros' });
        else
            return next(null, { success: true, result: result, message: 'Alerta verificad@' });
    });
};

Alerta.insert = (Alerta, next) => {
    if( !connection )
        return next('Connection refused');

    let query = '';
    let keys = [];
    query = 'INSERT INTO alerta SET ?';
    keys = [Alerta];

    connection.query(query, keys, (error, result) => {
        if(error) 
            return next({ success: false, error: error, message: 'Un error ha ocurrido mientras se creaba el registro' });
        else
            return next(null, { success: true, result: result, message: 'Alerta cread@' });
    });
};

Alerta.update = (Alerta, created_by, next) => {
    if( !connection )
        return next('Connection refused');

    let query = '';
    let keys = [];
    if (created_by) {
        query = 'UPDATE alerta SET ? WHERE idalerta = ? AND created_by = ?';
        keys = [Alerta, Alerta.idalerta, created_by];
    } else {
        query = 'UPDATE alerta SET ? WHERE idalerta = ?';
        keys = [Alerta, Alerta.idalerta];
    }

    connection.query(query, keys, (error, result) => {
        if(error) 
            return next({ success: false, error: error, message: 'Un error ha ocurrido mientras se actualizaba el registro' });
        else if (result.affectedRows === 0)
            return next(null, { success: false, result: result, message: 'Solo es posible actualizar registros propios' });
        else
            return next(null, { success: true, result: result, message: 'Alerta actualizad@' });
    });
};

Alerta.remove = (idalerta, created_by, next) => {
    if( !connection )
        return next('Connection refused');

    let query = '';
    let keys = [];
    if (created_by) {
        query = 'DELETE FROM alerta WHERE idalerta = ? AND created_by = ?';
        keys = [idalerta, created_by];
    } else {
        query = 'DELETE FROM alerta WHERE idalerta = ?';
        keys = [idalerta];
    }

    connection.query(query, keys, (error, result) => {
        if(error) 
            return next({ success: false, error: error, message: 'Un error ha ocurrido mientras se eliminaba el registro' });
        else if (result.affectedRows === 0)
            return next(null, { success: false, result: result, message: 'Solo es posible eliminar registros propios' });
        else
            return next(null, { success: true, result: result, message: 'Alerta eliminad@' });
    });
};

Alerta.logicRemove = (idalerta, created_by, next) => {
    if( !connection )
        return next('Connection refused');

    let query = '';
    let keys = [];
    if (created_by) {
        query = 'UPDATE alerta SET baja = 1 WHERE idalerta = ? AND created_by = ?';
        keys = [idalerta, created_by];
    } else {
        query = 'UPDATE alerta SET baja = 1 WHERE idalerta = ?';
        keys = [idalerta];
    }

    connection.query(query, keys, (error, result) => {
        if(error) 
            return next({ success: false, error: error, message: 'Un error ha ocurrido mientras se eliminaba el registro' });
        else if (result.affectedRows === 0)
            return next(null, { success: false, result: result, message: 'Solo es posible eliminar registros propios' });
        else
            return next(null, { success: true, result: result, message: 'Alerta eliminad@' });
    });
};

Alerta.response = (res, error, data) => {
    if ( error )
        res.status(500).json(error);
    else
        res.status(200).json(data);
};

module.exports = Alerta;
