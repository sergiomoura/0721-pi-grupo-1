/*
Criar as funções:

showHome
showCadastro
showLogin
showFinalizarCompra

Cada função deve renderizar a página correspondente.

*/

module.exports = {
    showHome: (req, res) =>{
        res.render('home.ejs')
    },

    showCadastro: (req, res) =>{
        res.render('cadastro.ejs')
    },

    showLogin: (req, res) =>{
        res.render('login.ejs')
    },

    showFinalizarCompra: (req, res) =>{
        res.render('finalizarCompra.ejs')
    }
}