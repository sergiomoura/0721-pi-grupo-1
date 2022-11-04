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
            WHERE tipodepromocao = 1
            limit 0,4
        `

        let produtosPrimeiros = await sequelize.query(sql, {type: Sequelize.QueryTypes.SELECT});
        
        sql =  `
        SELECT
            id, 
            nome,
            preco,
            imagem,
            sinopse
        FROM
        produtos 
        WHERE tipodepromocao = 2
        limit 0,8
    `
        let destaqueDoMes= await sequelize.query(sql, {type: Sequelize.QueryTypes.SELECT});
        console.log(destaqueDoMes.length);
        sql =  `
        SELECT
            id, 
            nome,
            preco,
            imagem,
            sinopse
        FROM
        produtos 
        WHERE tipodepromocao = 3
        limit 0,8
    `

        let lancamentos= await sequelize.query(sql, {type: Sequelize.QueryTypes.SELECT});
        
        sql =  `
        SELECT
            id, 
            nome,
            preco,
            imagem,
            sinopse
        FROM
        produtos 
        WHERE tipodepromocao = 4
        limit 0,8
    `
         let superDescontos = await sequelize.query(sql, {type: Sequelize.QueryTypes.SELECT});
    
         res.render('home.ejs', {produtosPrimeiros, destaqueDoMes, lancamentos, superDescontos});
       

    }
}