const router = require('express').Router();
const Accuracyestimacion = require('../models/accuracyestimacion');
const passport = require('passport');
const permissions = require('../config/permissions');

router
    .get('/ordentarea/:idordentarea', (req, res, next) => {
        passport.authenticate('jwt', { session: true }, (err, auth_data, info) => {
            permissions.module_permission(auth_data.modules, 'accuracyestimacion', auth_data.user.super, 'readable', (error, permission) => {
                if (permission.success) {
                    const created_by = (permission.only_own) ? auth_data.user.idsi_user : false;
                    Accuracyestimacion.findByIdOrdentarea(req.params.idordentarea, created_by, (error, data) => {
                        return Accuracyestimacion.response(res, error, data);
                    })
                } else {
                    return Accuracyestimacion.response(res, error, permission);
                }
            });
        })(req, res, next);
    })
    .get('/empleado/:idempleado', (req, res, next) => {
        passport.authenticate('jwt', { session: true }, (err, auth_data, info) => {
            permissions.module_permission(auth_data.modules, 'accuracyestimacion', auth_data.user.super, 'readable', (error, permission) => {
                if (permission.success) {
                    const created_by = (permission.only_own) ? auth_data.user.idsi_user : false;
                    Accuracyestimacion.findByIdEmpleado(req.params.idempleado, created_by, (error, data) => {
                        return Accuracyestimacion.response(res, error, data);
                    })
                } else {
                    return Accuracyestimacion.response(res, error, permission);
                }
            });
        })(req, res, next);
    })
    .get('/', (req, res, next) => {
        passport.authenticate('jwt', { session: true }, (err, auth_data, info) => {
            permissions.module_permission(auth_data.modules, 'accuracyestimacion', auth_data.user.super, 'readable', (error, permission) => {
                if (permission.success) {
                    const created_by = (permission.only_own) ? auth_data.user.idsi_user : false;
                    Accuracyestimacion.all(created_by, (error, data) => {
                        return Accuracyestimacion.response(res, error, data);
                    })
                } else {
                    return Accuracyestimacion.response(res, error, permission);
                }
            });
        })(req, res, next);
    })
    .get('/count', (req, res, next) => {
        passport.authenticate('jwt', { session: true }, (err, auth_data, info) => {
            permissions.module_permission(auth_data.modules, 'accuracyestimacion', auth_data.user.super, 'readable', (error, permission) => {
                if (permission.success) {
                    Accuracyestimacion.count((error, data) => {
                        return Accuracyestimacion.response(res, error, data);
                    })
                } else {
                    return Accuracyestimacion.response(res, error, permission);
                }
            });
        })(req, res, next);
    })
    .get('/exist/:id', (req, res, next) => {
        passport.authenticate('jwt', { session: true }, (err, auth_data, info) => {
            permissions.module_permission(auth_data.modules, 'accuracyestimacion', auth_data.user.super, 'readable', (error, permission) => {
                if (permission.success) {
                    Accuracyestimacion.exist(req.params.id, (error, data) => {
                        return Accuracyestimacion.response(res, error, data);
                    })
                } else {
                    return Accuracyestimacion.response(res, error, permission);
                }
            });
        })(req, res, next);
    })
    .get('/:id', (req, res, next) => {
        passport.authenticate('jwt', { session: true }, (err, auth_data, info) => {
            permissions.module_permission(auth_data.modules, 'accuracyestimacion', auth_data.user.super, 'readable', (error, permission) => {
                if (permission.success) {
                    const created_by = (permission.only_own) ? auth_data.user.idsi_user : false;
                    Accuracyestimacion.findById(req.params.id, created_by, (error, data) => {
                        return Accuracyestimacion.response(res, error, data);
                    })
                } else {
                    return Accuracyestimacion.response(res, error, permission);
                }
            });
        })(req, res, next);
    })
    .delete('/:id', (req, res, next) => {
        passport.authenticate('jwt', { session: true }, (err, auth_data, info) => {
            permissions.module_permission(auth_data.modules, 'accuracyestimacion', auth_data.user.super, 'deleteable', (error, permission) => {
                if (permission.success) {
                    const created_by = (permission.only_own) ? auth_data.user.idsi_user : false;
                    Accuracyestimacion.logicRemove(req.params.id, created_by, (error, data) => {
                        return Accuracyestimacion.response(res, error, data);
                    })
                } else {
                    return Accuracyestimacion.response(res, error, permission);
                }
            });
        })(req, res, next);
    })
    .patch('/', (req, res, next) => {
        passport.authenticate('jwt', { session: true }, (err, auth_data, info) => {
            permissions.module_permission(auth_data.modules, 'accuracyestimacion', auth_data.user.super, 'updateable', (error, permission) => {
                if (permission.success) {
                    const _accuracyestimacion = req.body;
                    const created_by = (permission.only_own) ? auth_data.user.idsi_user : false;
                    Accuracyestimacion.update(_accuracyestimacion, created_by, (error, data) => {
                        return Accuracyestimacion.response(res, error, data);
                    })
                } else {
                    return Accuracyestimacion.response(res, error, permission);
                }
            });
        })(req, res, next);
    })
    .post('/', (req, res, next) => {
        passport.authenticate('jwt', { session: true }, (err, auth_data, info) => {
            permissions.module_permission(auth_data.modules, 'accuracyestimacion', auth_data.user.super, 'writeable', (error, permission) => {
                if (permission.success) {
                    const _accuracyestimacion = req.body;
                    _accuracyestimacion.created_by = auth_data.user.idsi_user;
                    Accuracyestimacion.insert( _accuracyestimacion, (error, data) =>{
                        return Accuracyestimacion.response(res, error, data);
                    });
                } else {
                    return Accuracyestimacion.response(res, error, permission);
                }
            });
        })(req, res, next);
    })

module.exports = router;
