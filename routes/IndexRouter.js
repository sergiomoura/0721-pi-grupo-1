// Importar o express
const express= require("express")

// Criar roteador
const router = express.Router();

/*
Criar as rotas get:
  '/'                 mandando para IndexController.showHome
  '/cadastro'         mandando para IndexController.showCadastro
  '/login'            mandando para IndexController.Login
  '/finalizar-compra' mandando para IndexController.showFinalizarCompra
*/
router.get('/', IndexController.showHome);
router.get('/cadastro',IndexController.showCadastro);
router.get('/login', IndexController.showLogin);
router.get('/finalizar-compra', IndexController. showFinalizarCompra)

// Exporte o roteador
module.exports= router;