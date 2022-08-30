// Importar o express
const express = require("express")

// Criar a aplicação
const app = express()

// Importar o roteador IndexRouter
const IndexRouter = require("Router")

// Usar o IndexRouter no app (app.use)
app.use('/', IndexRouter);

// Fazer a aplicação rodar escutando a porta 3000
app.listen(
    3000,
    ()=>{
        console.log("Escutando a porta 3000")
    }
)


