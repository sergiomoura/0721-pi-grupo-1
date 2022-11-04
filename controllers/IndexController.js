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