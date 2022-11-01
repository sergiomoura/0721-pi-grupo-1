const express = require ('express');
// criando um roteador
const router = express.Router();

// importando controllers
const indexController = require('../controllers/indexController');
const produtosController = require('../controllers/produtosController');

// criando rotas - direcionando controller - indicando função
//router.get('/', indexController.showHome); 
router.get('/cadastro', indexController.showCadastro);
router.get('/login', indexController.showLogin);
router.get('/finalizacao', indexController.showFinalizacao);
router.get('/', produtosController.listar);


module.exports = router
