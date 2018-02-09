const connection = require('../config/db-connection');

const Checkout = {};

Checkout.findByIdCheckoutestado = (idCheckoutestado, created_by, next) => {
    if( !connection )
        return next('Connection refused');

    let query = '';
    let keys = [];
    if (created_by) {
        query = 'SELECT checkout.*, _persona.nombre as empleado_empleado_idempleado , _checkoutestado_idcheckoutestado.nombre as checkoutestado_checkoutestado_idcheckoutestado FROM checkout INNER JOIN empleado as _empleado_idempleado ON _empleado_idempleado.idempleado = checkout.empleado_idempleado INNER JOIN checkoutestado as _checkoutestado_idcheckoutestado ON _checkoutestado_idcheckoutestado.idcheckoutestado = checkout.checkoutestado_idcheckoutestado INNER JOIN persona as _persona ON _persona.idpersona = _empleado_idempleado.persona_idpersona  WHERE checkout.checkoutestado_idcheckoutestado = ? AND checkout.created_by = ? HAVING checkout.baja IS NULL OR checkout.baja = false';
        keys = [idCheckoutestado, created_by];
    } else {
        query = 'SELECT checkout.*, _persona.nombre as empleado_empleado_idempleado , _checkoutestado_idcheckoutestado.nombre as checkoutestado_checkoutestado_idcheckoutestado FROM checkout INNER JOIN empleado as _empleado_idempleado ON _empleado_idempleado.idempleado = checkout.empleado_idempleado INNER JOIN checkoutestado as _checkoutestado_idcheckoutestado ON _checkoutestado_idcheckoutestado.idcheckoutestado = checkout.checkoutestado_idcheckoutestado INNER JOIN persona as _persona ON _persona.idpersona = _empleado_idempleado.persona_idpersona  WHERE checkout.checkoutestado_idcheckoutestado = ? HAVING checkout.baja IS NULL OR checkout.baja = false';
        keys = [idCheckoutestado];
    }

    connection.query(query, keys, (error, result) => {
        if(error)
            return next({ success: false, error: error, message: 'Un error ha ocurrido mientras se encontraba el registro' });
        else if (result.affectedRows === 0)
            return next(null, { success: false, result: result, message: 'Solo es posible encontrar registros propios' });
        else
            return next(null, { success: true, result: result, message: 'Checkout encontrad@' });
    });
};
Checkout.findByIdEmpleado = (idEmpleado, created_by, next) => {
    if( !connection )
        return next('Connection refused');

    let query = '';
    let keys = [];
    if (created_by) {
        query = 'SELECT checkout.*, _persona.nombre as empleado_empleado_idempleado , _checkoutestado_idcheckoutestado.nombre as checkoutestado_checkoutestado_idcheckoutestado FROM checkout INNER JOIN empleado as _empleado_idempleado ON _empleado_idempleado.idempleado = checkout.empleado_idempleado INNER JOIN checkoutestado as _checkoutestado_idcheckoutestado ON _checkoutestado_idcheckoutestado.idcheckoutestado = checkout.checkoutestado_idcheckoutestado INNER JOIN persona as _persona ON _persona.idpersona = _empleado_idempleado.persona_idpersona  WHERE checkout.empleado_idempleado = ? AND checkout.created_by = ? HAVING checkout.baja IS NULL OR checkout.baja = false';
        keys = [idEmpleado, created_by];
    } else {
        query = 'SELECT checkout.*, _persona.nombre as empleado_empleado_idempleado , _checkoutestado_idcheckoutestado.nombre as checkoutestado_checkoutestado_idcheckoutestado FROM checkout INNER JOIN empleado as _empleado_idempleado ON _empleado_idempleado.idempleado = checkout.empleado_idempleado INNER JOIN checkoutestado as _checkoutestado_idcheckoutestado ON _checkoutestado_idcheckoutestado.idcheckoutestado = checkout.checkoutestado_idcheckoutestado INNER JOIN persona as _persona ON _persona.idpersona = _empleado_idempleado.persona_idpersona  WHERE checkout.empleado_idempleado = ? HAVING checkout.baja IS NULL OR checkout.baja = false';
        keys = [idEmpleado];
    }

    connection.query(query, keys, (error, result) => {
        if(error)
            return next({ success: false, error: error, message: 'Un error ha ocurrido mientras se encontraba el registro' });
        else if (result.affectedRows === 0)
            return next(null, { success: false, result: result, message: 'Solo es posible encontrar registros propios' });
        else
            return next(null, { success: true, result: result, message: 'Checkout encontrad@' });
    });
};
Checkout.all = (created_by, next) => {
    if( !connection )
        return next('Connection refused');

    let query = '';
    let keys = [];
    if (created_by) {
        query = 'SELECT checkout.*, _persona.nombre as empleado_empleado_idempleado , _checkoutestado_idcheckoutestado.nombre as checkoutestado_checkoutestado_idcheckoutestado FROM checkout INNER JOIN empleado as _empleado_idempleado ON _empleado_idempleado.idempleado = checkout.empleado_idempleado INNER JOIN checkoutestado as _checkoutestado_idcheckoutestado ON _checkoutestado_idcheckoutestado.idcheckoutestado = checkout.checkoutestado_idcheckoutestado INNER JOIN persona as _persona ON _persona.idpersona = _empleado_idempleado.persona_idpersona  WHERE checkout.created_by = ? HAVING checkout.baja IS NULL OR checkout.baja = false';
        keys = [created_by];
    } else {
        query = 'SELECT checkout.*, _persona.nombre as empleado_empleado_idempleado , _checkoutestado_idcheckoutestado.nombre as checkoutestado_checkoutestado_idcheckoutestado FROM checkout INNER JOIN empleado as _empleado_idempleado ON _empleado_idempleado.idempleado = checkout.empleado_idempleado INNER JOIN checkoutestado as _checkoutestado_idcheckoutestado ON _checkoutestado_idcheckoutestado.idcheckoutestado = checkout.checkoutestado_idcheckoutestado INNER JOIN persona as _persona ON _persona.idpersona = _empleado_idempleado.persona_idpersona  HAVING checkout.baja IS NULL OR checkout.baja = false';
        keys = [];
    }

    connection.query(query, keys, (error, result) => {
        if(error) 
            return next({ success: false, error: error, message: 'Un error ha ocurrido mientras se leían registros' });
        else if (result.affectedRows === 0)
            return next(null, { success: false, result: result, message: 'Solo es posible leer registros propios' });
        else
            return next(null, { success: true, result: result, message: 'Checkout leíd@' });
    });
};

Checkout.findById = (idCheckout, created_by, next) => {
    if( !connection )
        return next('Connection refused');

    let query = '';
    let keys = [];
    if (created_by) {
        query = 'SELECT * FROM checkout WHERE idcheckout = ? AND created_by = ? HAVING baja IS NULL OR baja = false';
        keys = [idCheckout, created_by];
    } else {
        query = 'SELECT * FROM checkout WHERE idcheckout = ? HAVING baja IS NULL OR baja = false';
        keys = [idCheckout];
    }

    connection.query(query, keys, (error, result) => {
        if(error) 
            return next({ success: false, error: error, message: 'Un error ha ocurrido mientras se encontraba el registro' });
        else if (result.affectedRows === 0)
            return next(null, { success: false, result: result, message: 'Solo es posible encontrar registros propios' });
        else
            return next(null, { success: true, result: result, message: 'Checkout encontrad@' });
    });
};

Checkout.count = (next) => {
    if( !connection )
        return next('Connection refused');

    let query = '';
    let keys = [];
    query = 'SELECT COUNT(idcheckout) AS count FROM checkout';
    keys = [];

    connection.query(query, keys, (error, result) => {
        if(error) 
            return next({ success: false, error: error, message: 'Un error ha ocurrido mientras se leían registros' });
        else
            return next(null, { success: true, result: result, message: 'Checkout contabilizad@' });
    });
};

Checkout.exist = (idCheckout, next) => {
    if( !connection )
        return next('Connection refused');

    let query = '';
    let keys = [];
    query = 'SELECT EXISTS(SELECT 1 FROM checkout WHERE idcheckout = ?) AS exist';
    keys = [idCheckout];

    connection.query(query, keys, (error, result) => {
        if(error) 
            return next({ success: false, error: error, message: 'Un error ha ocurrido mientras se leían registros' });
        else
            return next(null, { success: true, result: result, message: 'Checkout verificad@' });
    });
};

Checkout.insert = (Checkout, next) => {
    if( !connection )
        return next('Connection refused');

    let query = '';
    let keys = [];
    query = 'INSERT INTO checkout SET ?';
    keys = [Checkout];

    connection.query(query, keys, (error, result) => {
        if(error) 
            return next({ success: false, error: error, message: 'Un error ha ocurrido mientras se creaba el registro' });
        else
            return next(null, { success: true, result: result, message: 'Checkout cread@' });
    });
};

Checkout.update = (Checkout, created_by, next) => {
    if( !connection )
        return next('Connection refused');

    let query = '';
    let keys = [];
    if (created_by) {
        query = 'UPDATE checkout SET ? WHERE idcheckout = ? AND created_by = ?';
        keys = [Checkout, Checkout.idcheckout, created_by];
    } else {
        query = 'UPDATE checkout SET ? WHERE idcheckout = ?';
        keys = [Checkout, Checkout.idcheckout];
    }

    connection.query(query, keys, (error, result) => {
        if(error) 
            return next({ success: false, error: error, message: 'Un error ha ocurrido mientras se actualizaba el registro' });
        else if (result.affectedRows === 0)
            return next(null, { success: false, result: result, message: 'Solo es posible actualizar registros propios' });
        else
            return next(null, { success: true, result: result, message: 'Checkout actualizad@' });
    });
};

Checkout.remove = (idcheckout, created_by, next) => {
    if( !connection )
        return next('Connection refused');

    let query = '';
    let keys = [];
    if (created_by) {
        query = 'DELETE FROM checkout WHERE idcheckout = ? AND created_by = ?';
        keys = [idcheckout, created_by];
    } else {
        query = 'DELETE FROM checkout WHERE idcheckout = ?';
        keys = [idcheckout];
    }

    connection.query(query, keys, (error, result) => {
        if(error) 
            return next({ success: false, error: error, message: 'Un error ha ocurrido mientras se eliminaba el registro' });
        else if (result.affectedRows === 0)
            return next(null, { success: false, result: result, message: 'Solo es posible eliminar registros propios' });
        else
            return next(null, { success: true, result: result, message: 'Checkout eliminad@' });
    });
};

Checkout.logicRemove = (idcheckout, created_by, next) => {
    if( !connection )
        return next('Connection refused');

    let query = '';
    let keys = [];
    if (created_by) {
        query = 'UPDATE checkout SET baja = 1 WHERE idcheckout = ? AND created_by = ?';
        keys = [idcheckout, created_by];
    } else {
        query = 'UPDATE checkout SET baja = 1 WHERE idcheckout = ?';
        keys = [idcheckout];
    }

    connection.query(query, keys, (error, result) => {
        if(error) 
            return next({ success: false, error: error, message: 'Un error ha ocurrido mientras se eliminaba el registro' });
        else if (result.affectedRows === 0)
            return next(null, { success: false, result: result, message: 'Solo es posible eliminar registros propios' });
        else
            return next(null, { success: true, result: result, message: 'Checkout eliminad@' });
    });
};

Checkout.response = (res, error, data) => {
    if ( error )
        res.status(500).json(error);
    else
        res.status(200).json(data);
};

module.exports = Checkout;
