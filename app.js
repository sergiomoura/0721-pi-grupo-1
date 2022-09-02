// importando a biblioteca express
const express = require("express");

//criando um servidor
const app = express();


req.get('/a',(req,res)=>{
    res.send('ola'),
    console.log("escutando")
})

app.listen(3000)
