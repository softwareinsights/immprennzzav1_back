const router = require('express').Router();
const Ordentarea = require('../models/ordentarea');
const passport = require('passport');
const permissions = require('../config/permissions');

router
    .get('/tarea/:idtarea', (req, res, next) => {
        passport.authenticate('jwt', { session: true }, (err, auth_data, info) => {
            permissions.module_permission(auth_data.modules, 'ordentarea', auth_data.user.super, 'readable', (error, permission) => {
                if (permission.success) {
                    const created_by = (permission.only_own) ? auth_data.user.idsi_user : false;
                    Ordentarea.findByIdTarea(req.params.idtarea, created_by, (error, data) => {
                        return Ordentarea.response(res, error, data);
                    })
                } else {
                    return Ordentarea.response(res, error, permission);
                }
            });
        })(req, res, next);
    })
    .get('/ordenproducto/:idordenproducto', (req, res, next) => {
        passport.authenticate('jwt', { session: true }, (err, auth_data, info) => {
            permissions.module_permission(auth_data.modules, 'ordentarea', auth_data.user.super, 'readable', (error, permission) => {
                if (permission.success) {
                    const created_by = (permission.only_own) ? auth_data.user.idsi_user : false;
                    Ordentarea.findByIdOrdenproducto(req.params.idordenproducto, created_by, (error, data) => {
                        return Ordentarea.response(res, error, data);
                    })
                } else {
                    return Ordentarea.response(res, error, permission);
                }
            });
        })(req, res, next);
    })
    .get('/', (req, res, next) => {
        passport.authenticate('jwt', { session: true }, (err, auth_data, info) => {
            permissions.module_permission(auth_data.modules, 'ordentarea', auth_data.user.super, 'readable', (error, permission) => {
                if (permission.success) {
                    const created_by = (permission.only_own) ? auth_data.user.idsi_user : false;
                    Ordentarea.all(created_by, (error, data) => {
                        return Ordentarea.response(res, error, data);
                    })
                } else {
                    return Ordentarea.response(res, error, permission);
                }
            });
        })(req, res, next);
    })
    .get('/count', (req, res, next) => {
        passport.authenticate('jwt', { session: true }, (err, auth_data, info) => {
            permissions.module_permission(auth_data.modules, 'ordentarea', auth_data.user.super, 'readable', (error, permission) => {
                if (permission.success) {
                    Ordentarea.count((error, data) => {
                        return Ordentarea.response(res, error, data);
                    })
                } else {
                    return Ordentarea.response(res, error, permission);
                }
            });
        })(req, res, next);
    })
    .get('/exist/:id', (req, res, next) => {
        passport.authenticate('jwt', { session: true }, (err, auth_data, info) => {
            permissions.module_permission(auth_data.modules, 'ordentarea', auth_data.user.super, 'readable', (error, permission) => {
                if (permission.success) {
                    Ordentarea.exist(req.params.id, (error, data) => {
                        return Ordentarea.response(res, error, data);
                    })
                } else {
                    return Ordentarea.response(res, error, permission);
                }
            });
        })(req, res, next);
    })
    .get('/:id', (req, res, next) => {
        passport.authenticate('jwt', { session: true }, (err, auth_data, info) => {
            permissions.module_permission(auth_data.modules, 'ordentarea', auth_data.user.super, 'readable', (error, permission) => {
                if (permission.success) {
                    const created_by = (permission.only_own) ? auth_data.user.idsi_user : false;
                    Ordentarea.findById(req.params.id, created_by, (error, data) => {
                        return Ordentarea.response(res, error, data);
                    })
                } else {
                    return Ordentarea.response(res, error, permission);
                }
            });
        })(req, res, next);
    })
    .delete('/:id', (req, res, next) => {
        passport.authenticate('jwt', { session: true }, (err, auth_data, info) => {
            permissions.module_permission(auth_data.modules, 'ordentarea', auth_data.user.super, 'deleteable', (error, permission) => {
                if (permission.success) {
                    const created_by = (permission.only_own) ? auth_data.user.idsi_user : false;
                    Ordentarea.logicRemove(req.params.id, created_by, (error, data) => {
                        return Ordentarea.response(res, error, data);
                    })
                } else {
                    return Ordentarea.response(res, error, permission);
                }
            });
        })(req, res, next);
    })
    .patch('/', (req, res, next) => {
        passport.authenticate('jwt', { session: true }, (err, auth_data, info) => {
            permissions.module_permission(auth_data.modules, 'ordentarea', auth_data.user.super, 'updateable', (error, permission) => {
                if (permission.success) {
                    const _ordentarea = req.body;
                    const created_by = (permission.only_own) ? auth_data.user.idsi_user : false;
                    Ordentarea.update(_ordentarea, created_by, (error, data) => {
                        return Ordentarea.response(res, error, data);
                    })
                } else {
                    return Ordentarea.response(res, error, permission);
                }
            });
        })(req, res, next);
    })
    .post('/', (req, res, next) => {
        passport.authenticate('jwt', { session: true }, (err, auth_data, info) => {
            permissions.module_permission(auth_data.modules, 'ordentarea', auth_data.user.super, 'writeable', (error, permission) => {
                if (permission.success) {
                    const _ordentarea = req.body;
                    _ordentarea.created_by = auth_data.user.idsi_user;
                    Ordentarea.insert( _ordentarea, (error, data) =>{
                        return Ordentarea.response(res, error, data);
                    });
                } else {
                    return Ordentarea.response(res, error, permission);
                }
            });
        })(req, res, next);
    })

module.exports = router;
