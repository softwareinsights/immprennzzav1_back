const connection = require('../config/db-connection');

const Checkoutestado = {};

Checkoutestado.all = (created_by, next) => {
    if( !connection )
        return next('Connection refused');

    let query = '';
    let keys = [];
    if (created_by) {
        query = 'SELECT checkoutestado.* FROM checkoutestado    WHERE checkoutestado.created_by = ? HAVING checkoutestado.baja IS NULL OR checkoutestado.baja = false';
        keys = [created_by];
    } else {
        query = 'SELECT checkoutestado.* FROM checkoutestado    HAVING checkoutestado.baja IS NULL OR checkoutestado.baja = false';
        keys = [];
    }

    connection.query(query, keys, (error, result) => {
        if(error) 
            return next({ success: false, error: error, message: 'Un error ha ocurrido mientras se leían registros' });
        else if (result.affectedRows === 0)
            return next(null, { success: false, result: result, message: 'Solo es posible leer registros propios' });
        else
            return next(null, { success: true, result: result, message: 'Checkoutestado leíd@' });
    });
};

Checkoutestado.findById = (idCheckoutestado, created_by, next) => {
    if( !connection )
        return next('Connection refused');

    let query = '';
    let keys = [];
    if (created_by) {
        query = 'SELECT * FROM checkoutestado WHERE idcheckoutestado = ? AND created_by = ? HAVING baja IS NULL OR baja = false';
        keys = [idCheckoutestado, created_by];
    } else {
        query = 'SELECT * FROM checkoutestado WHERE idcheckoutestado = ? HAVING baja IS NULL OR baja = false';
        keys = [idCheckoutestado];
    }

    connection.query(query, keys, (error, result) => {
        if(error) 
            return next({ success: false, error: error, message: 'Un error ha ocurrido mientras se encontraba el registro' });
        else if (result.affectedRows === 0)
            return next(null, { success: false, result: result, message: 'Solo es posible encontrar registros propios' });
        else
            return next(null, { success: true, result: result, message: 'Checkoutestado encontrad@' });
    });
};

Checkoutestado.count = (next) => {
    if( !connection )
        return next('Connection refused');

    let query = '';
    let keys = [];
    query = 'SELECT COUNT(idcheckoutestado) AS count FROM checkoutestado';
    keys = [];

    connection.query(query, keys, (error, result) => {
        if(error) 
            return next({ success: false, error: error, message: 'Un error ha ocurrido mientras se leían registros' });
        else
            return next(null, { success: true, result: result, message: 'Checkoutestado contabilizad@' });
    });
};

Checkoutestado.exist = (idCheckoutestado, next) => {
    if( !connection )
        return next('Connection refused');

    let query = '';
    let keys = [];
    query = 'SELECT EXISTS(SELECT 1 FROM checkoutestado WHERE idcheckoutestado = ?) AS exist';
    keys = [idCheckoutestado];

    connection.query(query, keys, (error, result) => {
        if(error) 
            return next({ success: false, error: error, message: 'Un error ha ocurrido mientras se leían registros' });
        else
            return next(null, { success: true, result: result, message: 'Checkoutestado verificad@' });
    });
};

Checkoutestado.insert = (Checkoutestado, next) => {
    if( !connection )
        return next('Connection refused');

    let query = '';
    let keys = [];
    query = 'INSERT INTO checkoutestado SET ?';
    keys = [Checkoutestado];

    connection.query(query, keys, (error, result) => {
        if(error) 
            return next({ success: false, error: error, message: 'Un error ha ocurrido mientras se creaba el registro' });
        else
            return next(null, { success: true, result: result, message: 'Checkoutestado cread@' });
    });
};

Checkoutestado.update = (Checkoutestado, created_by, next) => {
    if( !connection )
        return next('Connection refused');

    let query = '';
    let keys = [];
    if (created_by) {
        query = 'UPDATE checkoutestado SET ? WHERE idcheckoutestado = ? AND created_by = ?';
        keys = [Checkoutestado, Checkoutestado.idcheckoutestado, created_by];
    } else {
        query = 'UPDATE checkoutestado SET ? WHERE idcheckoutestado = ?';
        keys = [Checkoutestado, Checkoutestado.idcheckoutestado];
    }

    connection.query(query, keys, (error, result) => {
        if(error) 
            return next({ success: false, error: error, message: 'Un error ha ocurrido mientras se actualizaba el registro' });
        else if (result.affectedRows === 0)
            return next(null, { success: false, result: result, message: 'Solo es posible actualizar registros propios' });
        else
            return next(null, { success: true, result: result, message: 'Checkoutestado actualizad@' });
    });
};

Checkoutestado.remove = (idcheckoutestado, created_by, next) => {
    if( !connection )
        return next('Connection refused');

    let query = '';
    let keys = [];
    if (created_by) {
        query = 'DELETE FROM checkoutestado WHERE idcheckoutestado = ? AND created_by = ?';
        keys = [idcheckoutestado, created_by];
    } else {
        query = 'DELETE FROM checkoutestado WHERE idcheckoutestado = ?';
        keys = [idcheckoutestado];
    }

    connection.query(query, keys, (error, result) => {
        if(error) 
            return next({ success: false, error: error, message: 'Un error ha ocurrido mientras se eliminaba el registro' });
        else if (result.affectedRows === 0)
            return next(null, { success: false, result: result, message: 'Solo es posible eliminar registros propios' });
        else
            return next(null, { success: true, result: result, message: 'Checkoutestado eliminad@' });
    });
};

Checkoutestado.logicRemove = (idcheckoutestado, created_by, next) => {
    if( !connection )
        return next('Connection refused');

    let query = '';
    let keys = [];
    if (created_by) {
        query = 'UPDATE checkoutestado SET baja = 1 WHERE idcheckoutestado = ? AND created_by = ?';
        keys = [idcheckoutestado, created_by];
    } else {
        query = 'UPDATE checkoutestado SET baja = 1 WHERE idcheckoutestado = ?';
        keys = [idcheckoutestado];
    }

    connection.query(query, keys, (error, result) => {
        if(error) 
            return next({ success: false, error: error, message: 'Un error ha ocurrido mientras se eliminaba el registro' });
        else if (result.affectedRows === 0)
            return next(null, { success: false, result: result, message: 'Solo es posible eliminar registros propios' });
        else
            return next(null, { success: true, result: result, message: 'Checkoutestado eliminad@' });
    });
};

Checkoutestado.response = (res, error, data) => {
    if ( error )
        res.status(500).json(error);
    else
        res.status(200).json(data);
};

module.exports = Checkoutestado;
