const config = require('./database/config');
const sequelize = require('sequelize');

// 3 - Criar a conexão com o banco!
const conexao = new sequelize(config)

// 4 - Realizar uma consulta!!!
let promessa = conexao.query("SELECT * FROM produtos LIMIT 0,5");

promessa
.then(
    (dados)=>{
        console.log(dados)
        conexao.close();
    }
)
