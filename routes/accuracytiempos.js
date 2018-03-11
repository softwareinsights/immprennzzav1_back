const router = require('express').Router();
const Accuracytiempo = require('../models/accuracytiempo');
const passport = require('passport');
const permissions = require('../config/permissions');

router
    .get('/calcular', (req, res, next) => {
        passport.authenticate('jwt', { session: true }, (err, auth_data, info) => {
            permissions.module_permission(auth_data.modules, 'accuracytiempo', auth_data.user.super, 'readable', (error, permission) => {
                if (permission.success) {
                    const created_by = (permission.only_own) ? auth_data.user.idsi_user : false;
                    Accuracytiempo.calcularPresicion(created_by, (error, data) => {
                        return Accuracytiempo.response(res, error, data);
                    })
                } else {
                    return Accuracytiempo.response(res, error, permission);
                }
            });
        })(req, res, next);
    })

    .get('/empleado/:idempleado', (req, res, next) => {
        passport.authenticate('jwt', { session: true }, (err, auth_data, info) => {
            permissions.module_permission(auth_data.modules, 'accuracytiempo', auth_data.user.super, 'readable', (error, permission) => {
                if (permission.success) {
                    const created_by = (permission.only_own) ? auth_data.user.idsi_user : false;
                    Accuracytiempo.findByIdEmpleado(req.params.idempleado, created_by, (error, data) => {
                        return Accuracytiempo.response(res, error, data);
                    })
                } else {
                    return Accuracytiempo.response(res, error, permission);
                }
            });
        })(req, res, next);
    })
    .get('/', (req, res, next) => {
        passport.authenticate('jwt', { session: true }, (err, auth_data, info) => {
            permissions.module_permission(auth_data.modules, 'accuracytiempo', auth_data.user.super, 'readable', (error, permission) => {
                if (permission.success) {
                    const created_by = (permission.only_own) ? auth_data.user.idsi_user : false;
                    Accuracytiempo.all(created_by, (error, data) => {
                        return Accuracytiempo.response(res, error, data);
                    })
                } else {
                    return Accuracytiempo.response(res, error, permission);
                }
            });
        })(req, res, next);
    })
    .get('/count', (req, res, next) => {
        passport.authenticate('jwt', { session: true }, (err, auth_data, info) => {
            permissions.module_permission(auth_data.modules, 'accuracytiempo', auth_data.user.super, 'readable', (error, permission) => {
                if (permission.success) {
                    Accuracytiempo.count((error, data) => {
                        return Accuracytiempo.response(res, error, data);
                    })
                } else {
                    return Accuracytiempo.response(res, error, permission);
                }
            });
        })(req, res, next);
    })
    .get('/exist/:id', (req, res, next) => {
        passport.authenticate('jwt', { session: true }, (err, auth_data, info) => {
            permissions.module_permission(auth_data.modules, 'accuracytiempo', auth_data.user.super, 'readable', (error, permission) => {
                if (permission.success) {
                    Accuracytiempo.exist(req.params.id, (error, data) => {
                        return Accuracytiempo.response(res, error, data);
                    })
                } else {
                    return Accuracytiempo.response(res, error, permission);
                }
            });
        })(req, res, next);
    })
    .get('/:id', (req, res, next) => {
        passport.authenticate('jwt', { session: true }, (err, auth_data, info) => {
            permissions.module_permission(auth_data.modules, 'accuracytiempo', auth_data.user.super, 'readable', (error, permission) => {
                if (permission.success) {
                    const created_by = (permission.only_own) ? auth_data.user.idsi_user : false;
                    Accuracytiempo.findById(req.params.id, created_by, (error, data) => {
                        return Accuracytiempo.response(res, error, data);
                    })
                } else {
                    return Accuracytiempo.response(res, error, permission);
                }
            });
        })(req, res, next);
    })
    .delete('/:id', (req, res, next) => {
        passport.authenticate('jwt', { session: true }, (err, auth_data, info) => {
            permissions.module_permission(auth_data.modules, 'accuracytiempo', auth_data.user.super, 'deleteable', (error, permission) => {
                if (permission.success) {
                    const created_by = (permission.only_own) ? auth_data.user.idsi_user : false;
                    Accuracytiempo.logicRemove(req.params.id, created_by, (error, data) => {
                        return Accuracytiempo.response(res, error, data);
                    })
                } else {
                    return Accuracytiempo.response(res, error, permission);
                }
            });
        })(req, res, next);
    })
    .patch('/', (req, res, next) => {
        passport.authenticate('jwt', { session: true }, (err, auth_data, info) => {
            permissions.module_permission(auth_data.modules, 'accuracytiempo', auth_data.user.super, 'updateable', (error, permission) => {
                if (permission.success) {
                    const _accuracytiempo = req.body;
                    const created_by = (permission.only_own) ? auth_data.user.idsi_user : false;
                    Accuracytiempo.update(_accuracytiempo, created_by, (error, data) => {
                        return Accuracytiempo.response(res, error, data);
                    })
                } else {
                    return Accuracytiempo.response(res, error, permission);
                }
            });
        })(req, res, next);
    })
    .post('/', (req, res, next) => {
        passport.authenticate('jwt', { session: true }, (err, auth_data, info) => {
            permissions.module_permission(auth_data.modules, 'accuracytiempo', auth_data.user.super, 'writeable', (error, permission) => {
                if (permission.success) {
                    const _accuracytiempo = req.body;
                    _accuracytiempo.created_by = auth_data.user.idsi_user;
                    Accuracytiempo.insert( _accuracytiempo, (error, data) =>{
                        return Accuracytiempo.response(res, error, data);
                    });
                } else {
                    return Accuracytiempo.response(res, error, permission);
                }
            });
        })(req, res, next);
    })

module.exports = router;
