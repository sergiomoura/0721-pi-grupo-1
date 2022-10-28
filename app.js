// importando o express
const express = require("express");
// importando roteador 
const indexRouter = require('./routers/indexRouter')
const path = require('path')

// criando servidor
const app = express();
//Configuração do Template Engine
app.set('view engine', 'ejs');
//configurando a pasta public como contenedora dos arquivos estáticos
app.use(express.static(path.join(__dirname, 'public')))

// usando o roteador
app.use('/', indexRouter);




app.listen(3000)