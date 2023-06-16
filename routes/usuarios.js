const express = require('express');
const router = express.Router();
const path = require('path');
const usuariosController = require('../controllers/usuarios_controller');
const isAuth = require('../util/is-auth');

router.get('/',  isAuth, usuariosController.get);

router.get('/Logout', usuariosController.logout);

router.get('/new',  isAuth, usuariosController.getNewUser);


router.post('/new',  isAuth, usuariosController.postNewUser);


//router.get('/new', /* isAuth,*/ usuariosController.getNewUser);

//router.post('/new', /* isAuth,*/ usuariosController.postNewUser);

router.get('/login', usuariosController.getLogin);

router.post('/login', usuariosController.postLogin);

router.post('/eliminar',  isAuth, usuariosController.postUsuario);

router.post('/buscar', isAuth, usuariosController.postBuscar);

//router.get('/',  isAuth, usuariosController.get);


module.exports = router;
