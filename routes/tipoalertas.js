const router = require('express').Router();
const Tipoalerta = require('../models/tipoalerta');
const passport = require('passport');
const permissions = require('../config/permissions');

router
    .get('/', (req, res, next) => {
        passport.authenticate('jwt', { session: true }, (err, auth_data, info) => {
            permissions.module_permission(auth_data.modules, 'tipoalerta', auth_data.user.super, 'readable', (error, permission) => {
                if (permission.success) {
                    const created_by = (permission.only_own) ? auth_data.user.idsi_user : false;
                    Tipoalerta.all(created_by, (error, data) => {
                        return Tipoalerta.response(res, error, data);
                    })
                } else {
                    return Tipoalerta.response(res, error, permission);
                }
            });
        })(req, res, next);
    })
    .get('/count', (req, res, next) => {
        passport.authenticate('jwt', { session: true }, (err, auth_data, info) => {
            permissions.module_permission(auth_data.modules, 'tipoalerta', auth_data.user.super, 'readable', (error, permission) => {
                if (permission.success) {
                    Tipoalerta.count((error, data) => {
                        return Tipoalerta.response(res, error, data);
                    })
                } else {
                    return Tipoalerta.response(res, error, permission);
                }
            });
        })(req, res, next);
    })
    .get('/exist/:id', (req, res, next) => {
        passport.authenticate('jwt', { session: true }, (err, auth_data, info) => {
            permissions.module_permission(auth_data.modules, 'tipoalerta', auth_data.user.super, 'readable', (error, permission) => {
                if (permission.success) {
                    Tipoalerta.exist(req.params.id, (error, data) => {
                        return Tipoalerta.response(res, error, data);
                    })
                } else {
                    return Tipoalerta.response(res, error, permission);
                }
            });
        })(req, res, next);
    })
    .get('/:id', (req, res, next) => {
        passport.authenticate('jwt', { session: true }, (err, auth_data, info) => {
            permissions.module_permission(auth_data.modules, 'tipoalerta', auth_data.user.super, 'readable', (error, permission) => {
                if (permission.success) {
                    const created_by = (permission.only_own) ? auth_data.user.idsi_user : false;
                    Tipoalerta.findById(req.params.id, created_by, (error, data) => {
                        return Tipoalerta.response(res, error, data);
                    })
                } else {
                    return Tipoalerta.response(res, error, permission);
                }
            });
        })(req, res, next);
    })
    .delete('/:id', (req, res, next) => {
        passport.authenticate('jwt', { session: true }, (err, auth_data, info) => {
            permissions.module_permission(auth_data.modules, 'tipoalerta', auth_data.user.super, 'deleteable', (error, permission) => {
                if (permission.success) {
                    const created_by = (permission.only_own) ? auth_data.user.idsi_user : false;
                    Tipoalerta.logicRemove(req.params.id, created_by, (error, data) => {
                        return Tipoalerta.response(res, error, data);
                    })
                } else {
                    return Tipoalerta.response(res, error, permission);
                }
            });
        })(req, res, next);
    })
    .patch('/', (req, res, next) => {
        passport.authenticate('jwt', { session: true }, (err, auth_data, info) => {
            permissions.module_permission(auth_data.modules, 'tipoalerta', auth_data.user.super, 'updateable', (error, permission) => {
                if (permission.success) {
                    const _tipoalerta = req.body;
                    const created_by = (permission.only_own) ? auth_data.user.idsi_user : false;
                    Tipoalerta.update(_tipoalerta, created_by, (error, data) => {
                        return Tipoalerta.response(res, error, data);
                    })
                } else {
                    return Tipoalerta.response(res, error, permission);
                }
            });
        })(req, res, next);
    })
    .post('/', (req, res, next) => {
        passport.authenticate('jwt', { session: true }, (err, auth_data, info) => {
            permissions.module_permission(auth_data.modules, 'tipoalerta', auth_data.user.super, 'writeable', (error, permission) => {
                if (permission.success) {
                    const _tipoalerta = req.body;
                    _tipoalerta.created_by = auth_data.user.idsi_user;
                    Tipoalerta.insert( _tipoalerta, (error, data) =>{
                        return Tipoalerta.response(res, error, data);
                    });
                } else {
                    return Tipoalerta.response(res, error, permission);
                }
            });
        })(req, res, next);
    })

module.exports = router;
