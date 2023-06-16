const express = require('express');
const router = express.Router();
const path = require('path');
const especiesController = require('../controllers/root_controller');
const isAuth = require('../util/is-auth');


router.get('/',   isAuth, especiesController.get);

router.get('/:criterio', isAuth, especiesController.getBuscar);

module.exports = router;
