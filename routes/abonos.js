const router = require('express').Router();
const Abono = require('../models/abono');
const passport = require('passport');
const permissions = require('../config/permissions');

router
    .get('/orden/:idorden', (req, res, next) => {
        passport.authenticate('jwt', { session: true }, (err, auth_data, info) => {
            permissions.module_permission(auth_data.modules, 'abono', auth_data.user.super, 'readable', (error, permission) => {
                if (permission.success) {
                    const created_by = (permission.only_own) ? auth_data.user.idsi_user : false;
                    Abono.findByIdOrden(req.params.idorden, created_by, (error, data) => {
                        return Abono.response(res, error, data);
                    })
                } else {
                    return Abono.response(res, error, permission);
                }
            });
        })(req, res, next);
    })
    .get('/', (req, res, next) => {
        passport.authenticate('jwt', { session: true }, (err, auth_data, info) => {
            permissions.module_permission(auth_data.modules, 'abono', auth_data.user.super, 'readable', (error, permission) => {
                if (permission.success) {
                    const created_by = (permission.only_own) ? auth_data.user.idsi_user : false;
                    Abono.all(created_by, (error, data) => {
                        return Abono.response(res, error, data);
                    })
                } else {
                    return Abono.response(res, error, permission);
                }
            });
        })(req, res, next);
    })
    .get('/count', (req, res, next) => {
        passport.authenticate('jwt', { session: true }, (err, auth_data, info) => {
            permissions.module_permission(auth_data.modules, 'abono', auth_data.user.super, 'readable', (error, permission) => {
                if (permission.success) {
                    Abono.count((error, data) => {
                        return Abono.response(res, error, data);
                    })
                } else {
                    return Abono.response(res, error, permission);
                }
            });
        })(req, res, next);
    })
    .get('/exist/:id', (req, res, next) => {
        passport.authenticate('jwt', { session: true }, (err, auth_data, info) => {
            permissions.module_permission(auth_data.modules, 'abono', auth_data.user.super, 'readable', (error, permission) => {
                if (permission.success) {
                    Abono.exist(req.params.id, (error, data) => {
                        return Abono.response(res, error, data);
                    })
                } else {
                    return Abono.response(res, error, permission);
                }
            });
        })(req, res, next);
    })
    .get('/:id', (req, res, next) => {
        passport.authenticate('jwt', { session: true }, (err, auth_data, info) => {
            permissions.module_permission(auth_data.modules, 'abono', auth_data.user.super, 'readable', (error, permission) => {
                if (permission.success) {
                    const created_by = (permission.only_own) ? auth_data.user.idsi_user : false;
                    Abono.findById(req.params.id, created_by, (error, data) => {
                        return Abono.response(res, error, data);
                    })
                } else {
                    return Abono.response(res, error, permission);
                }
            });
        })(req, res, next);
    })
    .delete('/:id', (req, res, next) => {
        passport.authenticate('jwt', { session: true }, (err, auth_data, info) => {
            permissions.module_permission(auth_data.modules, 'abono', auth_data.user.super, 'deleteable', (error, permission) => {
                if (permission.success) {
                    const created_by = (permission.only_own) ? auth_data.user.idsi_user : false;
                    Abono.logicRemove(req.params.id, created_by, (error, data) => {
                        return Abono.response(res, error, data);
                    })
                } else {
                    return Abono.response(res, error, permission);
                }
            });
        })(req, res, next);
    })
    .patch('/', (req, res, next) => {
        passport.authenticate('jwt', { session: true }, (err, auth_data, info) => {
            permissions.module_permission(auth_data.modules, 'abono', auth_data.user.super, 'updateable', (error, permission) => {
                if (permission.success) {
                    const _abono = req.body;
                    const created_by = (permission.only_own) ? auth_data.user.idsi_user : false;
                    Abono.update(_abono, created_by, (error, data) => {
                        return Abono.response(res, error, data);
                    })
                } else {
                    return Abono.response(res, error, permission);
                }
            });
        })(req, res, next);
    })
    .post('/', (req, res, next) => {
        passport.authenticate('jwt', { session: true }, (err, auth_data, info) => {
            permissions.module_permission(auth_data.modules, 'abono', auth_data.user.super, 'writeable', (error, permission) => {
                if (permission.success) {
                    const _abono = req.body;
                    _abono.created_by = auth_data.user.idsi_user;
                    Abono.insert( _abono, (error, data) =>{
                        return Abono.response(res, error, data);
                    });
                } else {
                    return Abono.response(res, error, permission);
                }
            });
        })(req, res, next);
    })

module.exports = router;
