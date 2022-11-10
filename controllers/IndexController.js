const {sequelize, Sequelize, Usuario} = require('../database/models');
const bcrypt = require('bcrypt');

const indexController = {
    showHome: (req, res) => {
        res.render('home.ejs', produtos)
    },
    showCadastro: (req, res) => {
        res.render('cadastro.ejs')
    },
    cadastrar: async ( req, res) =>{
       // return res.send(req.body)
        const { nome, email, senha, endereco, genero, celular} = req.body;

        const u = await Usuario.create(
            {
                nome,
                email,
                senha: bcrypt.hashSync(senha, 10),
                endereco,
                genero,
                celular,
            }
        )
      req.session.Usuario = u;

      res.redirect('/produtos')
    },
    
    showLogin: (req, res) => {
        res.render('login.ejs')
    },
    showFinalizacao: (req, res) => {
        res.render('finalizacaoCompra.ejs')
    },
    showCarrinho: (req, res) => {
        let produtos = req.session.carrinho
        let total = 0 
        for (const p of produtos) {
            total = total + 1* p.preco
        }
        res.render('carrinho.ejs',{produtos, total})
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
        res.redirect("/carrinho");

        // for (var i = 1; i <= n; i++) total += i;
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