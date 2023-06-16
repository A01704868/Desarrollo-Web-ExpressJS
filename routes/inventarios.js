const express = require('express');
const router = express.Router();
const path = require('path');
const inventariosController = require('../controllers/inventarios_controller');
const isAuth = require('../util/is-auth');

router.get('/semillas',  isAuth, inventariosController.getSemillas);

router.get('/plantas-madre',  isAuth, inventariosController.getPlantasMadre);

router.get('/agregar',  isAuth, inventariosController.getAgregar);

router.post('/agregar',  isAuth, inventariosController.postAgregar);

router.get('/plantasMadreAlta',  isAuth, inventariosController.getPlantasMadreAlta);
router.post('/plantasMadreAlta', isAuth, inventariosController.postPlantasMadreAlta);

router.get('/plantasMadreBaja/:especie&:fecha', isAuth, inventariosController.getBuscarMadre);
router.get('/plantasMadreBaja',  isAuth, inventariosController.getPlantasMadreBaja);
router.post('/plantasMadreBaja', isAuth, inventariosController.postPlantasMadreBaja);

router.get('/plantasAlta',  isAuth, inventariosController.getPlantasAlta);
router.post('/plantasAlta', isAuth, inventariosController.postPlantasAlta);

router.get('/plantasBaja',  isAuth, inventariosController.getPlantasBaja);
router.get('/plantasBaja/:especie&:fecha', isAuth, inventariosController.getBuscarPlantas);
router.post('/plantasBaja', isAuth, inventariosController.postPlantasBaja);

router.get('/plantulas-alta',  isAuth, inventariosController.getPlantulasAlta);
router.post('/plantulas-alta', isAuth, inventariosController.postPlantulasAlta);

router.get('/plantulas-baja',  isAuth, inventariosController.getPlantulasBaja);
router.get('/plantulas-baja/:especie&:fecha',  isAuth, inventariosController.getBuscarPlantulas);
router.post('/plantulas-baja', isAuth, inventariosController.postPlantulasBaja);

router.get('/semillasAlta',  isAuth, inventariosController.getSemillasAlta);
router.post('/semillasAlta', isAuth, inventariosController.postSemillasAlta);

router.get('/semillasBaja',  isAuth, inventariosController.getSemillasBaja);
router.get('/semillasBaja/:especie&:fecha',  isAuth, inventariosController.getBuscarSemillas);
router.post('/semillasBaja',  isAuth, inventariosController.postSemillasBaja);

module.exports = router;