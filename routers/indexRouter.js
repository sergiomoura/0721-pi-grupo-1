const express = require ('express');
// criando um roteador
const router = express.Router();

// importando controllers
const indexController = require('../controllers/indexController');
const produtosController = require('../controllers/produtosController');



// criando rotas - direcionando controller - indicando função
router.get('/', indexController.showHome); 
router.get('/cadastro', indexController.showCadastro);
router.post('/cadastro', indexController.cadastrar)
router.get('/login', indexController.showLogin);
router.get('/finalizacao', indexController.showFinalizacao);
router.get('/produtos', produtosController.listar);
router.post('/carrinho/add/:id', indexController.addCarrinho);
router.get('/livros', indexController.showProdutosInterna);
router.get('/carrinho', indexController.showCarrinho);
module.exports = router
