const router = require('express').Router();
const Dashboard = require('../models/dashboard');
const passport = require('passport');
const permissions = require('../config/permissions');

router
    .get('/', (req, res, next) => {
        passport.authenticate('jwt', { session: true }, (err, auth_data, info) => {
            permissions.module_permission(auth_data.modules, 'dashboard', auth_data.user.super, 'readable', (error, permission) => {
                if (permission.success) {
                    Dashboard.all((error, data) => {
                        return Dashboard.response(res, error, data);
                    })
                } else {
                    return Dashboard.response(res, error, permission);
                }
            });
        })(req, res, next);
    })


module.exports = router;
