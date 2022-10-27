const {sequelize, Sequelize} = require('../database/models');

module.exports = {
    listar: async (req, res) =>{

        let sql = `
            SELECT
                id, 
                nome,
                preco,
                imagem,
                sinopse
            FROM
            produtos 
            limit 0,4 
        `

        let produtos = await sequelize.query(sql, {type: Sequelize.QueryTypes.SELECT});
        res.render('home.ejs', {produtos});
       
    }
}