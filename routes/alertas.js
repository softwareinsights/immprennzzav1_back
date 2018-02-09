const router = require('express').Router();
const Alerta = require('../models/alerta');
const passport = require('passport');
const permissions = require('../config/permissions');

router
    .get('/empleado/:idempleado', (req, res, next) => {
        passport.authenticate('jwt', { session: true }, (err, auth_data, info) => {
            permissions.module_permission(auth_data.modules, 'alerta', auth_data.user.super, 'readable', (error, permission) => {
                if (permission.success) {
                    const created_by = (permission.only_own) ? auth_data.user.idsi_user : false;
                    Alerta.findByIdEmpleado(req.params.idempleado, created_by, (error, data) => {
                        return Alerta.response(res, error, data);
                    })
                } else {
                    return Alerta.response(res, error, permission);
                }
            });
        })(req, res, next);
    })
    .get('/tipoalerta/:idtipoalerta', (req, res, next) => {
        passport.authenticate('jwt', { session: true }, (err, auth_data, info) => {
            permissions.module_permission(auth_data.modules, 'alerta', auth_data.user.super, 'readable', (error, permission) => {
                if (permission.success) {
                    const created_by = (permission.only_own) ? auth_data.user.idsi_user : false;
                    Alerta.findByIdTipoalerta(req.params.idtipoalerta, created_by, (error, data) => {
                        return Alerta.response(res, error, data);
                    })
                } else {
                    return Alerta.response(res, error, permission);
                }
            });
        })(req, res, next);
    })
    .get('/', (req, res, next) => {
        passport.authenticate('jwt', { session: true }, (err, auth_data, info) => {
            permissions.module_permission(auth_data.modules, 'alerta', auth_data.user.super, 'readable', (error, permission) => {
                if (permission.success) {
                    const created_by = (permission.only_own) ? auth_data.user.idsi_user : false;
                    Alerta.all(created_by, (error, data) => {
                        return Alerta.response(res, error, data);
                    })
                } else {
                    return Alerta.response(res, error, permission);
                }
            });
        })(req, res, next);
    })
    .get('/count', (req, res, next) => {
        passport.authenticate('jwt', { session: true }, (err, auth_data, info) => {
            permissions.module_permission(auth_data.modules, 'alerta', auth_data.user.super, 'readable', (error, permission) => {
                if (permission.success) {
                    Alerta.count((error, data) => {
                        return Alerta.response(res, error, data);
                    })
                } else {
                    return Alerta.response(res, error, permission);
                }
            });
        })(req, res, next);
    })
    .get('/exist/:id', (req, res, next) => {
        passport.authenticate('jwt', { session: true }, (err, auth_data, info) => {
            permissions.module_permission(auth_data.modules, 'alerta', auth_data.user.super, 'readable', (error, permission) => {
                if (permission.success) {
                    Alerta.exist(req.params.id, (error, data) => {
                        return Alerta.response(res, error, data);
                    })
                } else {
                    return Alerta.response(res, error, permission);
                }
            });
        })(req, res, next);
    })
    .get('/:id', (req, res, next) => {
        passport.authenticate('jwt', { session: true }, (err, auth_data, info) => {
            permissions.module_permission(auth_data.modules, 'alerta', auth_data.user.super, 'readable', (error, permission) => {
                if (permission.success) {
                    const created_by = (permission.only_own) ? auth_data.user.idsi_user : false;
                    Alerta.findById(req.params.id, created_by, (error, data) => {
                        return Alerta.response(res, error, data);
                    })
                } else {
                    return Alerta.response(res, error, permission);
                }
            });
        })(req, res, next);
    })
    .delete('/:id', (req, res, next) => {
        passport.authenticate('jwt', { session: true }, (err, auth_data, info) => {
            permissions.module_permission(auth_data.modules, 'alerta', auth_data.user.super, 'deleteable', (error, permission) => {
                if (permission.success) {
                    const created_by = (permission.only_own) ? auth_data.user.idsi_user : false;
                    Alerta.logicRemove(req.params.id, created_by, (error, data) => {
                        return Alerta.response(res, error, data);
                    })
                } else {
                    return Alerta.response(res, error, permission);
                }
            });
        })(req, res, next);
    })
    .patch('/', (req, res, next) => {
        passport.authenticate('jwt', { session: true }, (err, auth_data, info) => {
            permissions.module_permission(auth_data.modules, 'alerta', auth_data.user.super, 'updateable', (error, permission) => {
                if (permission.success) {
                    const _alerta = req.body;
                    const created_by = (permission.only_own) ? auth_data.user.idsi_user : false;
                    Alerta.update(_alerta, created_by, (error, data) => {
                        return Alerta.response(res, error, data);
                    })
                } else {
                    return Alerta.response(res, error, permission);
                }
            });
        })(req, res, next);
    })
    .post('/', (req, res, next) => {
        passport.authenticate('jwt', { session: true }, (err, auth_data, info) => {
            permissions.module_permission(auth_data.modules, 'alerta', auth_data.user.super, 'writeable', (error, permission) => {
                if (permission.success) {
                    const _alerta = req.body;
                    _alerta.created_by = auth_data.user.idsi_user;
                    Alerta.insert( _alerta, (error, data) =>{
                        return Alerta.response(res, error, data);
                    });
                } else {
                    return Alerta.response(res, error, permission);
                }
            });
        })(req, res, next);
    })

module.exports = router;
