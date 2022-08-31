const indexController = {
    showHome: (req, res) => {
        res.render('home.ejs')
    },
    showCadastro: (req, res) => {
        res.render('cadastro.ejs')
    },
    showLogin: (req, res) => {
        res.render('login.ejs')
    },
    showFinalizacao: (req, res) => {
        res.render('finalizacaoCompra.ejs')
    }
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