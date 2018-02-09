const router = require('express').Router();
const Checkoutestado = require('../models/checkoutestado');
const passport = require('passport');
const permissions = require('../config/permissions');

router
    .get('/', (req, res, next) => {
        passport.authenticate('jwt', { session: true }, (err, auth_data, info) => {
            permissions.module_permission(auth_data.modules, 'checkoutestado', auth_data.user.super, 'readable', (error, permission) => {
                if (permission.success) {
                    const created_by = (permission.only_own) ? auth_data.user.idsi_user : false;
                    Checkoutestado.all(created_by, (error, data) => {
                        return Checkoutestado.response(res, error, data);
                    })
                } else {
                    return Checkoutestado.response(res, error, permission);
                }
            });
        })(req, res, next);
    })
    .get('/count', (req, res, next) => {
        passport.authenticate('jwt', { session: true }, (err, auth_data, info) => {
            permissions.module_permission(auth_data.modules, 'checkoutestado', auth_data.user.super, 'readable', (error, permission) => {
                if (permission.success) {
                    Checkoutestado.count((error, data) => {
                        return Checkoutestado.response(res, error, data);
                    })
                } else {
                    return Checkoutestado.response(res, error, permission);
                }
            });
        })(req, res, next);
    })
    .get('/exist/:id', (req, res, next) => {
        passport.authenticate('jwt', { session: true }, (err, auth_data, info) => {
            permissions.module_permission(auth_data.modules, 'checkoutestado', auth_data.user.super, 'readable', (error, permission) => {
                if (permission.success) {
                    Checkoutestado.exist(req.params.id, (error, data) => {
                        return Checkoutestado.response(res, error, data);
                    })
                } else {
                    return Checkoutestado.response(res, error, permission);
                }
            });
        })(req, res, next);
    })
    .get('/:id', (req, res, next) => {
        passport.authenticate('jwt', { session: true }, (err, auth_data, info) => {
            permissions.module_permission(auth_data.modules, 'checkoutestado', auth_data.user.super, 'readable', (error, permission) => {
                if (permission.success) {
                    const created_by = (permission.only_own) ? auth_data.user.idsi_user : false;
                    Checkoutestado.findById(req.params.id, created_by, (error, data) => {
                        return Checkoutestado.response(res, error, data);
                    })
                } else {
                    return Checkoutestado.response(res, error, permission);
                }
            });
        })(req, res, next);
    })
    .delete('/:id', (req, res, next) => {
        passport.authenticate('jwt', { session: true }, (err, auth_data, info) => {
            permissions.module_permission(auth_data.modules, 'checkoutestado', auth_data.user.super, 'deleteable', (error, permission) => {
                if (permission.success) {
                    const created_by = (permission.only_own) ? auth_data.user.idsi_user : false;
                    Checkoutestado.logicRemove(req.params.id, created_by, (error, data) => {
                        return Checkoutestado.response(res, error, data);
                    })
                } else {
                    return Checkoutestado.response(res, error, permission);
                }
            });
        })(req, res, next);
    })
    .patch('/', (req, res, next) => {
        passport.authenticate('jwt', { session: true }, (err, auth_data, info) => {
            permissions.module_permission(auth_data.modules, 'checkoutestado', auth_data.user.super, 'updateable', (error, permission) => {
                if (permission.success) {
                    const _checkoutestado = req.body;
                    const created_by = (permission.only_own) ? auth_data.user.idsi_user : false;
                    Checkoutestado.update(_checkoutestado, created_by, (error, data) => {
                        return Checkoutestado.response(res, error, data);
                    })
                } else {
                    return Checkoutestado.response(res, error, permission);
                }
            });
        })(req, res, next);
    })
    .post('/', (req, res, next) => {
        passport.authenticate('jwt', { session: true }, (err, auth_data, info) => {
            permissions.module_permission(auth_data.modules, 'checkoutestado', auth_data.user.super, 'writeable', (error, permission) => {
                if (permission.success) {
                    const _checkoutestado = req.body;
                    _checkoutestado.created_by = auth_data.user.idsi_user;
                    Checkoutestado.insert( _checkoutestado, (error, data) =>{
                        return Checkoutestado.response(res, error, data);
                    });
                } else {
                    return Checkoutestado.response(res, error, permission);
                }
            });
        })(req, res, next);
    })

module.exports = router;
