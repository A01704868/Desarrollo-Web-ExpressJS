const express = require('express');
const router = express.Router();
const path = require('path');
const zonasController = require('../controllers/zonas_controller');
const isAuth = require('../util/is-auth');


router.get('/zonas',  isAuth,zonasController.getNuevaZona);

router.post('/zonas',  isAuth, zonasController.postNuevaZona);


router.get('/',  isAuth, zonasController.get);


router.post('/eliminar', isAuth, zonasController.postZona);

router.post('/buscar', isAuth, zonasController.postBuscar);


module.exports = router;
