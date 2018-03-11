const connection = require('../config/db-connection');

const Ordenproducto = {};




Ordenproducto.calcularPrecio = (calculo, next) => {
    if( !connection )
        return next('Connection refused');

    /*
    calculo = {
        'idtipoprecio': this.tipoprecio_idtipoprecioAC,
        'ancho': this.ancho,
        'alto': this.alto,
        'cantidad': this.cantidad,
        'producto_idproducto': this.producto_idproductoAC,
    };

    tipoprecio
        MAYOREO 1
        PUBLICO 2
        MAQUILA 3
    */

    let query = '';
    let keys = [];

    // BUSCAR EL PRECIO, LA FÓRMULA Y EL COSTO EXTRA DEL PRODUCTO
    query = 'SELECT precioPublico, precioMaquila, precioMayoreo, formula_idformula FROM producto WHERE idproducto = ?';
    keys = [calculo.producto_idproducto];

    connection.query(query, keys, (error, producto) => {
        if(error) 
            return next({ success: false, error: error, message: 'Un error ha ocurrido mientras se creaba el registro' });
        else {

            // VALIDAR TODOS LOS CAMPOS
            if (calculo.idtipoprecio === undefined || calculo.ancho === undefined || calculo.alto === undefined || calculo.producto_idproducto === undefined) {
                return next(null, { success: false, error: {}, message: 'Debe seleccionar un Tipo de Precio, Ancho, Alto y Producto' });
            }

            let precio = 0;
            // SELECCIONAR EL PRECIO SEGÚN EL TIPO DE PRECIO ELEGIDO
            if (calculo.idtipoprecio === '1') {
                precio = producto[0].precioMayoreo;
            } else if (calculo.idtipoprecio === '2') {
                precio = producto[0].precioPublico;
            } else if (calculo.idtipoprecio === '3') {
                precio = producto[0].precioMaquila;
            }

            let formula = producto[0].formula_idformula;

            // SACAR EL PRECIO DEL PRODUCTO SEGÚN SU FÓRMULA
            let precioPorFormula = 0;

            // ALTO POR ANCHO POR PRECIO
            if (formula === 2) {
                precioPorFormula = calculo.ancho * calculo.alto * precio;
            } else {
                precioPorFormula = precio;
            }

            let precioPorCantidad = precioPorFormula * calculo.cantidad;
            return next(null, { success: true, result: precioPorCantidad, message: 'Precio del producto calculado' });

        }
    });
};



Ordenproducto.findByIdOrden = (idOrden, created_by, next) => {
    if( !connection )
        return next('Connection refused');

    let query = '';
    let keys = [];
    if (created_by) {
        query = 'SELECT cpersona.nombre as cliente, ordenproducto.*, _orden_idorden.idorden as orden_orden_idorden , _producto_idproducto.nombre as producto_producto_idproducto , _tipoprecio_idtipoprecio.nombre as tipoprecio_tipoprecio_idtipoprecio FROM ordenproducto INNER JOIN orden as _orden_idorden ON _orden_idorden.idorden = ordenproducto.orden_idorden  INNER JOIN orden as o on o.idorden = ordenproducto.orden_idorden INNER JOIN cliente as c on c.idcliente = o.cliente_idcliente INNER JOIN persona as cpersona on cpersona.idpersona = c.persona_idpersona INNER JOIN producto as _producto_idproducto ON _producto_idproducto.idproducto = ordenproducto.producto_idproducto INNER JOIN tipoprecio as _tipoprecio_idtipoprecio ON _tipoprecio_idtipoprecio.idtipoprecio = ordenproducto.tipoprecio_idtipoprecio   WHERE ordenproducto.orden_idorden = ? AND ordenproducto.created_by = ? HAVING ordenproducto.baja IS NULL OR ordenproducto.baja = false';
        keys = [idOrden, created_by];
    } else {
        query = 'SELECT cpersona.nombre as cliente, ordenproducto.*, _orden_idorden.idorden as orden_orden_idorden , _producto_idproducto.nombre as producto_producto_idproducto , _tipoprecio_idtipoprecio.nombre as tipoprecio_tipoprecio_idtipoprecio FROM ordenproducto INNER JOIN orden as _orden_idorden ON _orden_idorden.idorden = ordenproducto.orden_idorden  INNER JOIN orden as o on o.idorden = ordenproducto.orden_idorden INNER JOIN cliente as c on c.idcliente = o.cliente_idcliente INNER JOIN persona as cpersona on cpersona.idpersona = c.persona_idpersona INNER JOIN producto as _producto_idproducto ON _producto_idproducto.idproducto = ordenproducto.producto_idproducto INNER JOIN tipoprecio as _tipoprecio_idtipoprecio ON _tipoprecio_idtipoprecio.idtipoprecio = ordenproducto.tipoprecio_idtipoprecio   WHERE ordenproducto.orden_idorden = ? HAVING ordenproducto.baja IS NULL OR ordenproducto.baja = false';
        keys = [idOrden];
    }

    connection.query(query, keys, (error, result) => {
        if(error)
            return next({ success: false, error: error, message: 'Un error ha ocurrido mientras se encontraba el registro' });
        else if (result.affectedRows === 0)
            return next(null, { success: false, result: result, message: 'Solo es posible encontrar registros propios' });
        else
            return next(null, { success: true, result: result, message: 'Ordenproducto encontrad@' });
    });
};
Ordenproducto.findByIdProducto = (idProducto, created_by, next) => {
    if( !connection )
        return next('Connection refused');

    let query = '';
    let keys = [];
    if (created_by) {
        query = 'SELECT cpersona.nombre as cliente, ordenproducto.*, _orden_idorden.idorden as orden_orden_idorden , _producto_idproducto.nombre as producto_producto_idproducto , _tipoprecio_idtipoprecio.nombre as tipoprecio_tipoprecio_idtipoprecio FROM ordenproducto INNER JOIN orden as _orden_idorden ON _orden_idorden.idorden = ordenproducto.orden_idorden  INNER JOIN orden as o on o.idorden = ordenproducto.orden_idorden INNER JOIN cliente as c on c.idcliente = o.cliente_idcliente INNER JOIN persona as cpersona on cpersona.idpersona = c.persona_idpersona INNER JOIN producto as _producto_idproducto ON _producto_idproducto.idproducto = ordenproducto.producto_idproducto INNER JOIN tipoprecio as _tipoprecio_idtipoprecio ON _tipoprecio_idtipoprecio.idtipoprecio = ordenproducto.tipoprecio_idtipoprecio   WHERE ordenproducto.producto_idproducto = ? AND ordenproducto.created_by = ? HAVING ordenproducto.baja IS NULL OR ordenproducto.baja = false';
        keys = [idProducto, created_by];
    } else {
        query = 'SELECT cpersona.nombre as cliente, ordenproducto.*, _orden_idorden.idorden as orden_orden_idorden , _producto_idproducto.nombre as producto_producto_idproducto , _tipoprecio_idtipoprecio.nombre as tipoprecio_tipoprecio_idtipoprecio FROM ordenproducto INNER JOIN orden as _orden_idorden ON _orden_idorden.idorden = ordenproducto.orden_idorden  INNER JOIN orden as o on o.idorden = ordenproducto.orden_idorden INNER JOIN cliente as c on c.idcliente = o.cliente_idcliente INNER JOIN persona as cpersona on cpersona.idpersona = c.persona_idpersona INNER JOIN producto as _producto_idproducto ON _producto_idproducto.idproducto = ordenproducto.producto_idproducto INNER JOIN tipoprecio as _tipoprecio_idtipoprecio ON _tipoprecio_idtipoprecio.idtipoprecio = ordenproducto.tipoprecio_idtipoprecio   WHERE ordenproducto.producto_idproducto = ? HAVING ordenproducto.baja IS NULL OR ordenproducto.baja = false';
        keys = [idProducto];
    }

    connection.query(query, keys, (error, result) => {
        if(error)
            return next({ success: false, error: error, message: 'Un error ha ocurrido mientras se encontraba el registro' });
        else if (result.affectedRows === 0)
            return next(null, { success: false, result: result, message: 'Solo es posible encontrar registros propios' });
        else
            return next(null, { success: true, result: result, message: 'Ordenproducto encontrad@' });
    });
};
Ordenproducto.findByIdTipoprecio = (idTipoprecio, created_by, next) => {
    if( !connection )
        return next('Connection refused');

    let query = '';
    let keys = [];
    if (created_by) {
        query = 'SELECT cpersona.nombre as cliente, ordenproducto.*, _orden_idorden.idorden as orden_orden_idorden , _producto_idproducto.nombre as producto_producto_idproducto , _tipoprecio_idtipoprecio.nombre as tipoprecio_tipoprecio_idtipoprecio FROM ordenproducto INNER JOIN orden as _orden_idorden ON _orden_idorden.idorden = ordenproducto.orden_idorden  INNER JOIN orden as o on o.idorden = ordenproducto.orden_idorden INNER JOIN cliente as c on c.idcliente = o.cliente_idcliente INNER JOIN persona as cpersona on cpersona.idpersona = c.persona_idpersona INNER JOIN producto as _producto_idproducto ON _producto_idproducto.idproducto = ordenproducto.producto_idproducto INNER JOIN tipoprecio as _tipoprecio_idtipoprecio ON _tipoprecio_idtipoprecio.idtipoprecio = ordenproducto.tipoprecio_idtipoprecio   WHERE ordenproducto.tipoprecio_idtipoprecio = ? AND ordenproducto.created_by = ? HAVING ordenproducto.baja IS NULL OR ordenproducto.baja = false';
        keys = [idTipoprecio, created_by];
    } else {
        query = 'SELECT cpersona.nombre as cliente, ordenproducto.*, _orden_idorden.idorden as orden_orden_idorden , _producto_idproducto.nombre as producto_producto_idproducto , _tipoprecio_idtipoprecio.nombre as tipoprecio_tipoprecio_idtipoprecio FROM ordenproducto INNER JOIN orden as _orden_idorden ON _orden_idorden.idorden = ordenproducto.orden_idorden  INNER JOIN orden as o on o.idorden = ordenproducto.orden_idorden INNER JOIN cliente as c on c.idcliente = o.cliente_idcliente INNER JOIN persona as cpersona on cpersona.idpersona = c.persona_idpersona INNER JOIN producto as _producto_idproducto ON _producto_idproducto.idproducto = ordenproducto.producto_idproducto INNER JOIN tipoprecio as _tipoprecio_idtipoprecio ON _tipoprecio_idtipoprecio.idtipoprecio = ordenproducto.tipoprecio_idtipoprecio   WHERE ordenproducto.tipoprecio_idtipoprecio = ? HAVING ordenproducto.baja IS NULL OR ordenproducto.baja = false';
        keys = [idTipoprecio];
    }

    connection.query(query, keys, (error, result) => {
        if(error)
            return next({ success: false, error: error, message: 'Un error ha ocurrido mientras se encontraba el registro' });
        else if (result.affectedRows === 0)
            return next(null, { success: false, result: result, message: 'Solo es posible encontrar registros propios' });
        else
            return next(null, { success: true, result: result, message: 'Ordenproducto encontrad@' });
    });
};
Ordenproducto.all = (created_by, next) => {
    if( !connection )
        return next('Connection refused');

    let query = '';
    let keys = [];
    if (created_by) {
        query = 'SELECT cpersona.nombre as cliente, ordenproducto.*, _orden_idorden.idorden as orden_orden_idorden , _producto_idproducto.nombre as producto_producto_idproducto , _tipoprecio_idtipoprecio.nombre as tipoprecio_tipoprecio_idtipoprecio FROM ordenproducto INNER JOIN orden as _orden_idorden ON _orden_idorden.idorden = ordenproducto.orden_idorden  INNER JOIN orden as o on o.idorden = ordenproducto.orden_idorden INNER JOIN cliente as c on c.idcliente = o.cliente_idcliente INNER JOIN persona as cpersona on cpersona.idpersona = c.persona_idpersona INNER JOIN producto as _producto_idproducto ON _producto_idproducto.idproducto = ordenproducto.producto_idproducto INNER JOIN tipoprecio as _tipoprecio_idtipoprecio ON _tipoprecio_idtipoprecio.idtipoprecio = ordenproducto.tipoprecio_idtipoprecio WHERE ordenproducto.created_by = ? HAVING ordenproducto.baja IS NULL OR ordenproducto.baja = false';
        keys = [created_by];
    } else {
        query = 'SELECT cpersona.nombre as cliente, ordenproducto.*, _orden_idorden.idorden as orden_orden_idorden , _producto_idproducto.nombre as producto_producto_idproducto , _tipoprecio_idtipoprecio.nombre as tipoprecio_tipoprecio_idtipoprecio FROM ordenproducto INNER JOIN orden as _orden_idorden ON _orden_idorden.idorden = ordenproducto.orden_idorden  INNER JOIN orden as o on o.idorden = ordenproducto.orden_idorden INNER JOIN cliente as c on c.idcliente = o.cliente_idcliente INNER JOIN persona as cpersona on cpersona.idpersona = c.persona_idpersona INNER JOIN producto as _producto_idproducto ON _producto_idproducto.idproducto = ordenproducto.producto_idproducto INNER JOIN tipoprecio as _tipoprecio_idtipoprecio ON _tipoprecio_idtipoprecio.idtipoprecio = ordenproducto.tipoprecio_idtipoprecio   HAVING ordenproducto.baja IS NULL OR ordenproducto.baja = false';
        keys = [];
    }

    connection.query(query, keys, (error, result) => {
        if(error) 
            return next({ success: false, error: error, message: 'Un error ha ocurrido mientras se leían registros' });
        else if (result.affectedRows === 0)
            return next(null, { success: false, result: result, message: 'Solo es posible leer registros propios' });
        else
            return next(null, { success: true, result: result, message: 'Ordenproducto leíd@' });
    });
};

Ordenproducto.findById = (idOrdenproducto, created_by, next) => {
    if( !connection )
        return next('Connection refused');

    let query = '';
    let keys = [];
    if (created_by) {
        query = 'SELECT * FROM ordenproducto WHERE idordenproducto = ? AND created_by = ? HAVING baja IS NULL OR baja = false';
        keys = [idOrdenproducto, created_by];
    } else {
        query = 'SELECT * FROM ordenproducto WHERE idordenproducto = ? HAVING baja IS NULL OR baja = false';
        keys = [idOrdenproducto];
    }

    connection.query(query, keys, (error, result) => {
        if(error) 
            return next({ success: false, error: error, message: 'Un error ha ocurrido mientras se encontraba el registro' });
        else if (result.affectedRows === 0)
            return next(null, { success: false, result: result, message: 'Solo es posible encontrar registros propios' });
        else
            return next(null, { success: true, result: result, message: 'Ordenproducto encontrad@' });
    });
};

Ordenproducto.count = (next) => {
    if( !connection )
        return next('Connection refused');

    let query = '';
    let keys = [];
    query = 'SELECT COUNT(idordenproducto) AS count FROM ordenproducto';
    keys = [];

    connection.query(query, keys, (error, result) => {
        if(error) 
            return next({ success: false, error: error, message: 'Un error ha ocurrido mientras se leían registros' });
        else
            return next(null, { success: true, result: result, message: 'Ordenproducto contabilizad@' });
    });
};

Ordenproducto.exist = (idOrdenproducto, next) => {
    if( !connection )
        return next('Connection refused');

    let query = '';
    let keys = [];
    query = 'SELECT EXISTS(SELECT 1 FROM ordenproducto WHERE idordenproducto = ?) AS exist';
    keys = [idOrdenproducto];

    connection.query(query, keys, (error, result) => {
        if(error) 
            return next({ success: false, error: error, message: 'Un error ha ocurrido mientras se leían registros' });
        else
            return next(null, { success: true, result: result, message: 'Ordenproducto verificad@' });
    });
};

Ordenproducto.insert = (Ordenproducto, next) => {
    if( !connection )
        return next('Connection refused');

    let query = '';
    let keys = [];
    query = 'INSERT INTO ordenproducto SET ?';
    keys = [Ordenproducto];

    connection.query(query, keys, (error, result) => {
        if(error) 
            return next({ success: false, error: error, message: 'Un error ha ocurrido mientras se creaba el registro' });
        else {

            // ACTUALIZAR TOTAL Y SUBTOTAL DE ORDEN DESPUES DE AGREGRA EL PRODUCTO A ORDEN
            /*
            MODELO DE REFERENCIA 
            ordenproducto 
            {
                idordenproducto?: number;
                orden_idorden?: number;
                producto_idproducto?: number;
                cantidad?: number;
                ancho?: number;
                alto?: number;
                tipoprecio_idtipoprecio?: number;
                precio?: number;   
            }
            */

            let query = '';
            let keys = [];

            // ACTUALIZAR AL MISMO TIEMPO ADEUDO TOMANDO EN CUENTA MONTO CUBIERTO Y ABONADO
            query = 'UPDATE orden SET subtotal = (subtotal + ?), total = (total + (? * 1.16)), adeudo = (total - (cubierto + abonado)) WHERE idorden = ?';
            keys = [Ordenproducto.precio, Ordenproducto.precio, Ordenproducto.orden_idorden];

            connection.query(query, keys, (error, result) => {
                if(error) 
                    return next({ success: false, error: error, message: 'Un error ha ocurrido mientras se actualizaba el registro' });
                else {
                    console.log("result", result);
                    return next(null, { success: true, result: result, message: 'Producto agregado a orden, el total y subtotal de la orden ha sido actualizado' });
                }
            });
        }      
    });
};

Ordenproducto.update = (Ordenproducto, created_by, next) => {
    if( !connection )
        return next('Connection refused');

    let query = '';
    let keys = [];

    console.log("Ordenproducto", Ordenproducto);

    // PRIMERO OBTIENE EL IDORDEN RELACIONADO A PRODUCTO DE ORDEN 
    query = 'SELECT orden_idorden, precio FROM ordenproducto WHERE idordenproducto = ? AND baja IS NULL OR baja = false';
    keys = [Ordenproducto.idordenproducto];

    connection.query(query, keys, (error, ordenproducto) => {
        if(error) 
            return next({ success: false, error: error, message: 'Un error ha ocurrido mientras se encontraba el registro' });
        else {

            console.log("ordenproducto", ordenproducto);

            if (ordenproducto[0]) {
                   
                let precioarestar =  Ordenproducto.precio - ordenproducto[0].precio;

                // ACTUALIZAR ORDEN
                query = 'UPDATE orden SET subtotal = (subtotal + ?), total = ( total + (? * 1.16)), adeudo = (adeudo + (? * 1.16))  WHERE idorden = ?';
                keys = [precioarestar, precioarestar, precioarestar, ordenproducto[0].orden_idorden];

                connection.query(query, keys, (error, result) => {
                    if(error) 
                        return next({ success: false, error: error, message: 'Un error ha ocurrido mientras se actualizaba el registro' });
                    else {


                        console.log("result", result);

                        // AHORA SI ACTUALIZA
                        if (created_by) {
                            query = 'UPDATE ordenproducto SET ? WHERE idordenproducto = ? AND created_by = ?';
                            keys = [Ordenproducto, Ordenproducto.idordenproducto, created_by];
                        } else {
                            query = 'UPDATE ordenproducto SET ? WHERE idordenproducto = ?';
                            keys = [Ordenproducto, Ordenproducto.idordenproducto];
                        }

                        connection.query(query, keys, (error, result) => {
                            if(error) 
                                return next({ success: false, error: error, message: 'Un error ha ocurrido mientras se actualizaba el registro' });
                            else if (result.affectedRows === 0)
                                return next(null, { success: false, result: result, message: 'Solo es posible actualizar registros propios' });
                            else
                                return next(null, { success: true, result: result, message: 'Ordenproducto actualizad@' });
                        });

                    }
                });


            } else {
                return next(null, { success: false, result: result, message: 'Ordenproducto no encontrado' });
            }


        }
    });

};

Ordenproducto.remove = (idordenproducto, created_by, next) => {
    if( !connection )
        return next('Connection refused');

    let query = '';
    let keys = [];
    if (created_by) {
        query = 'DELETE FROM ordenproducto WHERE idordenproducto = ? AND created_by = ?';
        keys = [idordenproducto, created_by];
    } else {
        query = 'DELETE FROM ordenproducto WHERE idordenproducto = ?';
        keys = [idordenproducto];
    }

    connection.query(query, keys, (error, result) => {
        if(error) 
            return next({ success: false, error: error, message: 'Un error ha ocurrido mientras se eliminaba el registro' });
        else if (result.affectedRows === 0)
            return next(null, { success: false, result: result, message: 'Solo es posible eliminar registros propios' });
        else
            return next(null, { success: true, result: result, message: 'Ordenproducto eliminad@' });
    });
};

Ordenproducto.logicRemove = (idordenproducto, created_by, next) => {
    if( !connection )
        return next('Connection refused');

    // ACTUALIZAR TOTAL Y SUBTOTAL DE ORDEN, DESPUES, ELIMINA EL PRODUCTO A ORDEN

    let query = '';
    let keys = [];

    // PRIMERO OBTIENE EL IDORDEN RELACIONADO A PRODUCTO DE ORDEN 
    query = 'SELECT orden_idorden, precio FROM ordenproducto WHERE idordenproducto = ? AND baja IS NULL OR baja = false';
    keys = [idordenproducto];

    connection.query(query, keys, (error, ordenproducto) => {
        if(error) 
            return next({ success: false, error: error, message: 'Un error ha ocurrido mientras se encontraba el registro' });
        else {

            // ACTUALIZAR ORDEN
            query = 'UPDATE orden SET subtotal = (subtotal - ?), total = ( total - (? * 1.16)), adeudo = (adeudo - (? * 1.16))  WHERE idorden = ?';
            keys = [ordenproducto[0].precio, ordenproducto[0].precio, ordenproducto[0].precio, ordenproducto[0].orden_idorden];

            connection.query(query, keys, (error, result) => {
                if(error) 
                    return next({ success: false, error: error, message: 'Un error ha ocurrido mientras se actualizaba el registro' });
                else {

                    // AL FINAL LO ELIMINA EL ORDEN PRODUCTO
                    let query = '';
                    let keys = [];
                    if (created_by) {
                        query = 'UPDATE ordenproducto SET baja = 1 WHERE idordenproducto = ? AND created_by = ?';
                        keys = [idordenproducto, created_by];
                    } else {
                        query = 'UPDATE ordenproducto SET baja = 1 WHERE idordenproducto = ?';
                        keys = [idordenproducto];
                    }

                    connection.query(query, keys, (error, resultop) => {
                        if(error) 
                            return next({ success: false, error: error, message: 'Un error ha ocurrido mientras se eliminaba el registro' });
                        else if (resultop.affectedRows === 0)
                            return next(null, { success: false, result: resultop, message: 'Solo es posible eliminar registros propios' });
                        else {
                            return next(null, { success: true, result: resultop, message: 'Producto eliminado de orden, el total y subtotal de la orden ha sido actualizado' });
                        }
                    });
                }
            });
        }
    });
};

Ordenproducto.response = (res, error, data) => {
    if ( error )
        res.status(500).json(error);
    else
        res.status(200).json(data);
};

module.exports = Ordenproducto;
