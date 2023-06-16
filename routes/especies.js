const express = require('express');
const router = express.Router();
const path = require('path');
const especiesController = require('../controllers/especies_controller');
const isAuth = require('../util/is-auth');


router.get('/especies',  isAuth, especiesController.getNuevaEspecie);

router.post('/especies',  isAuth, especiesController.postNuevaEspecie);

router.get('/',  isAuth, especiesController.get);

router.post('/eliminar',isAuth, especiesController.postEspecie);

router.post('/buscar', isAuth, especiesController.postBuscar);


//router.get('/especies', /* isAuth,*/especiesController.getNuevaEspecie);

//router.post('/especies', /* isAuth,*/ especiesController.postNuevaEspecie);


//router.get('/',  /*isAuth, */especiesController.get);


//router.post('/eliminar',/*isAuth, */especiesController.postEspecie);

//router.post('/buscar', /*isAuth,*/ especiesController.postBuscar);


module.exports = router;
