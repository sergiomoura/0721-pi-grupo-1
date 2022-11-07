const {sequelize, Sequelize} = require('../database/models');

const indexController = {
    showHome: (req, res) => {
        res.render('home.ejs', produtos)
    },
    showCadastro: (req, res) => {
        res.render('cadastro.ejs')
    },
    showLogin: (req, res) => {
        res.render('login.ejs')
    },
    showFinalizacao: (req, res) => {
        res.render('finalizacaoCompra.ejs')
    },
    showCarrinho: (req, res) => {
        res.render('carrinho.ejs')
    },
    showProdutosInterna: (req, res) => {
        res.render('produtosInterna.ejs')
    },
    addCarrinho: async (req, res) => {
        let id = req.params.id;
        let sql = `
        SELECT
            id, 
            nome,
            preco,
            imagem,
            sinopse
        FROM
        produtos 
        WHERE id = ${id};
     `
        let produtos = await sequelize.query(sql, {type: Sequelize.QueryTypes.SELECT});
        let produto = produtos[0];
        if (req.session.carrinho) {
            req.session.carrinho.push(produto);
        } else {
            req.session.carrinho = [produto];
        }
        console.log(req.session.carrinho);
        res.redirect("/home");
    },

}



module.exports = indexController;



/*
Criar as funções:

showHome
showCadastro
showLogin
showFinalizarCompra

Cada função deve renderizar a página correspondente.

*/