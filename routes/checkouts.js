const router = require('express').Router();
const Checkout = require('../models/checkout');
const passport = require('passport');
const permissions = require('../config/permissions');

router
    .get('/checkoutestado/:idcheckoutestado', (req, res, next) => {
        passport.authenticate('jwt', { session: true }, (err, auth_data, info) => {
            permissions.module_permission(auth_data.modules, 'checkout', auth_data.user.super, 'readable', (error, permission) => {
                if (permission.success) {
                    const created_by = (permission.only_own) ? auth_data.user.idsi_user : false;
                    Checkout.findByIdCheckoutestado(req.params.idcheckoutestado, created_by, (error, data) => {
                        return Checkout.response(res, error, data);
                    })
                } else {
                    return Checkout.response(res, error, permission);
                }
            });
        })(req, res, next);
    })
    .get('/empleado/:idempleado', (req, res, next) => {
        passport.authenticate('jwt', { session: true }, (err, auth_data, info) => {
            permissions.module_permission(auth_data.modules, 'checkout', auth_data.user.super, 'readable', (error, permission) => {
                if (permission.success) {
                    const created_by = (permission.only_own) ? auth_data.user.idsi_user : false;
                    Checkout.findByIdEmpleado(req.params.idempleado, created_by, (error, data) => {
                        return Checkout.response(res, error, data);
                    })
                } else {
                    return Checkout.response(res, error, permission);
                }
            });
        })(req, res, next);
    })
    .get('/', (req, res, next) => {
        passport.authenticate('jwt', { session: true }, (err, auth_data, info) => {
            permissions.module_permission(auth_data.modules, 'checkout', auth_data.user.super, 'readable', (error, permission) => {
                if (permission.success) {
                    const created_by = (permission.only_own) ? auth_data.user.idsi_user : false;
                    Checkout.all(created_by, (error, data) => {
                        return Checkout.response(res, error, data);
                    })
                } else {
                    return Checkout.response(res, error, permission);
                }
            });
        })(req, res, next);
    })
    .get('/count', (req, res, next) => {
        passport.authenticate('jwt', { session: true }, (err, auth_data, info) => {
            permissions.module_permission(auth_data.modules, 'checkout', auth_data.user.super, 'readable', (error, permission) => {
                if (permission.success) {
                    Checkout.count((error, data) => {
                        return Checkout.response(res, error, data);
                    })
                } else {
                    return Checkout.response(res, error, permission);
                }
            });
        })(req, res, next);
    })
    .get('/exist/:id', (req, res, next) => {
        passport.authenticate('jwt', { session: true }, (err, auth_data, info) => {
            permissions.module_permission(auth_data.modules, 'checkout', auth_data.user.super, 'readable', (error, permission) => {
                if (permission.success) {
                    Checkout.exist(req.params.id, (error, data) => {
                        return Checkout.response(res, error, data);
                    })
                } else {
                    return Checkout.response(res, error, permission);
                }
            });
        })(req, res, next);
    })
    .get('/:id', (req, res, next) => {
        passport.authenticate('jwt', { session: true }, (err, auth_data, info) => {
            permissions.module_permission(auth_data.modules, 'checkout', auth_data.user.super, 'readable', (error, permission) => {
                if (permission.success) {
                    const created_by = (permission.only_own) ? auth_data.user.idsi_user : false;
                    Checkout.findById(req.params.id, created_by, (error, data) => {
                        return Checkout.response(res, error, data);
                    })
                } else {
                    return Checkout.response(res, error, permission);
                }
            });
        })(req, res, next);
    })
    .delete('/:id', (req, res, next) => {
        passport.authenticate('jwt', { session: true }, (err, auth_data, info) => {
            permissions.module_permission(auth_data.modules, 'checkout', auth_data.user.super, 'deleteable', (error, permission) => {
                if (permission.success) {
                    const created_by = (permission.only_own) ? auth_data.user.idsi_user : false;
                    Checkout.logicRemove(req.params.id, created_by, (error, data) => {
                        return Checkout.response(res, error, data);
                    })
                } else {
                    return Checkout.response(res, error, permission);
                }
            });
        })(req, res, next);
    })
    .patch('/', (req, res, next) => {
        passport.authenticate('jwt', { session: true }, (err, auth_data, info) => {
            permissions.module_permission(auth_data.modules, 'checkout', auth_data.user.super, 'updateable', (error, permission) => {
                if (permission.success) {
                    const _checkout = req.body;
                    const created_by = (permission.only_own) ? auth_data.user.idsi_user : false;
                    Checkout.update(_checkout, created_by, (error, data) => {
                        return Checkout.response(res, error, data);
                    })
                } else {
                    return Checkout.response(res, error, permission);
                }
            });
        })(req, res, next);
    })
    .post('/', (req, res, next) => {
        passport.authenticate('jwt', { session: true }, (err, auth_data, info) => {
            permissions.module_permission(auth_data.modules, 'checkout', auth_data.user.super, 'writeable', (error, permission) => {
                if (permission.success) {
                    const _checkout = req.body;
                    _checkout.created_by = auth_data.user.idsi_user;
                    Checkout.insert( _checkout, (error, data) =>{
                        return Checkout.response(res, error, data);
                    });
                } else {
                    return Checkout.response(res, error, permission);
                }
            });
        })(req, res, next);
    })

module.exports = router;
