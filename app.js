// importando o express
const express = require("express");
const session = require('express-session');
// importando roteador 
const indexRouter = require('./routers/indexRouter')
const path = require('path')

// criando servidor
const app = express();
app.use(session({
    secret: 'SEGREDO',
    resave: false,
    saveUninitialized: true,
  }))

//Configuração do Template Engine
app.set('view engine', 'ejs');
//configurando a pasta public como contenedora dos arquivos estáticos
app.use(express.static(path.join(__dirname, 'public')))

// usando o roteador
app.use('/', indexRouter);




app.listen(3000)