const connection = require('../config/db-connection');

const Ordentarea = {};

Ordentarea.findByIdTarea = (idTarea, created_by, next) => {
    if( !connection )
        return next('Connection refused');

    let query = '';
    let keys = [];
    if (created_by) {
        query = 'SELECT ordentarea.*, _tarea_idtarea.nombre as tarea_tarea_idtarea , _producto.nombre as ordenproducto_ordenproducto_idordenproducto FROM ordentarea INNER JOIN tarea as _tarea_idtarea ON _tarea_idtarea.idtarea = ordentarea.tarea_idtarea INNER JOIN ordenproducto as _ordenproducto_idordenproducto ON _ordenproducto_idordenproducto.idordenproducto = ordentarea.ordenproducto_idordenproducto INNER JOIN producto as _producto ON _producto.idproducto = _ordenproducto_idordenproducto.producto_idproducto  WHERE ordentarea.tarea_idtarea = ? AND ordentarea.created_by = ? HAVING ordentarea.baja IS NULL OR ordentarea.baja = false';
        keys = [idTarea, created_by];
    } else {
        query = 'SELECT ordentarea.*, _tarea_idtarea.nombre as tarea_tarea_idtarea , _producto.nombre as ordenproducto_ordenproducto_idordenproducto FROM ordentarea INNER JOIN tarea as _tarea_idtarea ON _tarea_idtarea.idtarea = ordentarea.tarea_idtarea INNER JOIN ordenproducto as _ordenproducto_idordenproducto ON _ordenproducto_idordenproducto.idordenproducto = ordentarea.ordenproducto_idordenproducto INNER JOIN producto as _producto ON _producto.idproducto = _ordenproducto_idordenproducto.producto_idproducto  WHERE ordentarea.tarea_idtarea = ? HAVING ordentarea.baja IS NULL OR ordentarea.baja = false';
        keys = [idTarea];
    }

    connection.query(query, keys, (error, result) => {
        if(error)
            return next({ success: false, error: error, message: 'Un error ha ocurrido mientras se encontraba el registro' });
        else if (result.affectedRows === 0)
            return next(null, { success: false, result: result, message: 'Solo es posible encontrar registros propios' });
        else
            return next(null, { success: true, result: result, message: 'Ordentarea encontrad@' });
    });
};
Ordentarea.findByIdOrdenproducto = (idOrdenproducto, created_by, next) => {
    if( !connection )
        return next('Connection refused');

    let query = '';
    let keys = [];
    if (created_by) {
        query = 'SELECT ordentarea.*, _tarea_idtarea.nombre as tarea_tarea_idtarea , _producto.nombre as ordenproducto_ordenproducto_idordenproducto FROM ordentarea INNER JOIN tarea as _tarea_idtarea ON _tarea_idtarea.idtarea = ordentarea.tarea_idtarea INNER JOIN ordenproducto as _ordenproducto_idordenproducto ON _ordenproducto_idordenproducto.idordenproducto = ordentarea.ordenproducto_idordenproducto INNER JOIN producto as _producto ON _producto.idproducto = _ordenproducto_idordenproducto.producto_idproducto  WHERE ordentarea.ordenproducto_idordenproducto = ? AND ordentarea.created_by = ? HAVING ordentarea.baja IS NULL OR ordentarea.baja = false';
        keys = [idOrdenproducto, created_by];
    } else {
        query = 'SELECT ordentarea.*, _tarea_idtarea.nombre as tarea_tarea_idtarea , _producto.nombre as ordenproducto_ordenproducto_idordenproducto FROM ordentarea INNER JOIN tarea as _tarea_idtarea ON _tarea_idtarea.idtarea = ordentarea.tarea_idtarea INNER JOIN ordenproducto as _ordenproducto_idordenproducto ON _ordenproducto_idordenproducto.idordenproducto = ordentarea.ordenproducto_idordenproducto INNER JOIN producto as _producto ON _producto.idproducto = _ordenproducto_idordenproducto.producto_idproducto  WHERE ordentarea.ordenproducto_idordenproducto = ? HAVING ordentarea.baja IS NULL OR ordentarea.baja = false';
        keys = [idOrdenproducto];
    }

    connection.query(query, keys, (error, result) => {
        if(error)
            return next({ success: false, error: error, message: 'Un error ha ocurrido mientras se encontraba el registro' });
        else if (result.affectedRows === 0)
            return next(null, { success: false, result: result, message: 'Solo es posible encontrar registros propios' });
        else
            return next(null, { success: true, result: result, message: 'Ordentarea encontrad@' });
    });
};
Ordentarea.all = (created_by, next) => {
    if( !connection )
        return next('Connection refused');

    let query = '';
    let keys = [];
    if (created_by) {
        query = 'SELECT ordentarea.*, _tarea_idtarea.nombre as tarea_tarea_idtarea , _producto.nombre as ordenproducto_ordenproducto_idordenproducto FROM ordentarea INNER JOIN tarea as _tarea_idtarea ON _tarea_idtarea.idtarea = ordentarea.tarea_idtarea INNER JOIN ordenproducto as _ordenproducto_idordenproducto ON _ordenproducto_idordenproducto.idordenproducto = ordentarea.ordenproducto_idordenproducto INNER JOIN producto as _producto ON _producto.idproducto = _ordenproducto_idordenproducto.producto_idproducto  WHERE ordentarea.created_by = ? HAVING ordentarea.baja IS NULL OR ordentarea.baja = false';
        keys = [created_by];
    } else {
        query = 'SELECT ordentarea.*, _tarea_idtarea.nombre as tarea_tarea_idtarea , _producto.nombre as ordenproducto_ordenproducto_idordenproducto FROM ordentarea INNER JOIN tarea as _tarea_idtarea ON _tarea_idtarea.idtarea = ordentarea.tarea_idtarea INNER JOIN ordenproducto as _ordenproducto_idordenproducto ON _ordenproducto_idordenproducto.idordenproducto = ordentarea.ordenproducto_idordenproducto INNER JOIN producto as _producto ON _producto.idproducto = _ordenproducto_idordenproducto.producto_idproducto  HAVING ordentarea.baja IS NULL OR ordentarea.baja = false';
        keys = [];
    }

    connection.query(query, keys, (error, result) => {
        if(error) 
            return next({ success: false, error: error, message: 'Un error ha ocurrido mientras se leían registros' });
        else if (result.affectedRows === 0)
            return next(null, { success: false, result: result, message: 'Solo es posible leer registros propios' });
        else
            return next(null, { success: true, result: result, message: 'Ordentarea leíd@' });
    });
};

Ordentarea.findById = (idOrdentarea, created_by, next) => {
    if( !connection )
        return next('Connection refused');

    let query = '';
    let keys = [];
    if (created_by) {
        query = 'SELECT * FROM ordentarea WHERE idordentarea = ? AND created_by = ? HAVING baja IS NULL OR baja = false';
        keys = [idOrdentarea, created_by];
    } else {
        query = 'SELECT * FROM ordentarea WHERE idordentarea = ? HAVING baja IS NULL OR baja = false';
        keys = [idOrdentarea];
    }

    connection.query(query, keys, (error, result) => {
        if(error) 
            return next({ success: false, error: error, message: 'Un error ha ocurrido mientras se encontraba el registro' });
        else if (result.affectedRows === 0)
            return next(null, { success: false, result: result, message: 'Solo es posible encontrar registros propios' });
        else
            return next(null, { success: true, result: result, message: 'Ordentarea encontrad@' });
    });
};

Ordentarea.count = (next) => {
    if( !connection )
        return next('Connection refused');

    let query = '';
    let keys = [];
    query = 'SELECT COUNT(idordentarea) AS count FROM ordentarea';
    keys = [];

    connection.query(query, keys, (error, result) => {
        if(error) 
            return next({ success: false, error: error, message: 'Un error ha ocurrido mientras se leían registros' });
        else
            return next(null, { success: true, result: result, message: 'Ordentarea contabilizad@' });
    });
};

Ordentarea.exist = (idOrdentarea, next) => {
    if( !connection )
        return next('Connection refused');

    let query = '';
    let keys = [];
    query = 'SELECT EXISTS(SELECT 1 FROM ordentarea WHERE idordentarea = ?) AS exist';
    keys = [idOrdentarea];

    connection.query(query, keys, (error, result) => {
        if(error) 
            return next({ success: false, error: error, message: 'Un error ha ocurrido mientras se leían registros' });
        else
            return next(null, { success: true, result: result, message: 'Ordentarea verificad@' });
    });
};

Ordentarea.insert = (Ordentarea, next) => {
    if( !connection )
        return next('Connection refused');

    let query = '';
    let keys = [];
    query = 'INSERT INTO ordentarea SET ?';
    keys = [Ordentarea];

    connection.query(query, keys, (error, result) => {
        if(error) 
            return next({ success: false, error: error, message: 'Un error ha ocurrido mientras se creaba el registro' });
        else
            return next(null, { success: true, result: result, message: 'Ordentarea cread@' });
    });
};

Ordentarea.update = (Ordentarea, created_by, next) => {
    if( !connection )
        return next('Connection refused');

    let query = '';
    let keys = [];
    if (created_by) {
        query = 'UPDATE ordentarea SET ? WHERE idordentarea = ? AND created_by = ?';
        keys = [Ordentarea, Ordentarea.idordentarea, created_by];
    } else {
        query = 'UPDATE ordentarea SET ? WHERE idordentarea = ?';
        keys = [Ordentarea, Ordentarea.idordentarea];
    }

    connection.query(query, keys, (error, result) => {
        if(error) 
            return next({ success: false, error: error, message: 'Un error ha ocurrido mientras se actualizaba el registro' });
        else if (result.affectedRows === 0)
            return next(null, { success: false, result: result, message: 'Solo es posible actualizar registros propios' });
        else
            return next(null, { success: true, result: result, message: 'Ordentarea actualizad@' });
    });
};

Ordentarea.remove = (idordentarea, created_by, next) => {
    if( !connection )
        return next('Connection refused');

    let query = '';
    let keys = [];
    if (created_by) {
        query = 'DELETE FROM ordentarea WHERE idordentarea = ? AND created_by = ?';
        keys = [idordentarea, created_by];
    } else {
        query = 'DELETE FROM ordentarea WHERE idordentarea = ?';
        keys = [idordentarea];
    }

    connection.query(query, keys, (error, result) => {
        if(error) 
            return next({ success: false, error: error, message: 'Un error ha ocurrido mientras se eliminaba el registro' });
        else if (result.affectedRows === 0)
            return next(null, { success: false, result: result, message: 'Solo es posible eliminar registros propios' });
        else
            return next(null, { success: true, result: result, message: 'Ordentarea eliminad@' });
    });
};

Ordentarea.logicRemove = (idordentarea, created_by, next) => {
    if( !connection )
        return next('Connection refused');

    let query = '';
    let keys = [];
    if (created_by) {
        query = 'UPDATE ordentarea SET baja = 1 WHERE idordentarea = ? AND created_by = ?';
        keys = [idordentarea, created_by];
    } else {
        query = 'UPDATE ordentarea SET baja = 1 WHERE idordentarea = ?';
        keys = [idordentarea];
    }

    connection.query(query, keys, (error, result) => {
        if(error) 
            return next({ success: false, error: error, message: 'Un error ha ocurrido mientras se eliminaba el registro' });
        else if (result.affectedRows === 0)
            return next(null, { success: false, result: result, message: 'Solo es posible eliminar registros propios' });
        else
            return next(null, { success: true, result: result, message: 'Ordentarea eliminad@' });
    });
};

Ordentarea.response = (res, error, data) => {
    if ( error )
        res.status(500).json(error);
    else
        res.status(200).json(data);
};

module.exports = Ordentarea;
