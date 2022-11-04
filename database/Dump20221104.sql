CREATE DATABASE  IF NOT EXISTS `bookstore` /*!40100 DEFAULT CHARACTER SET utf8mb3 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `bookstore`;
-- MySQL dump 10.13  Distrib 8.0.29, for Win64 (x86_64)
--
-- Host: localhost    Database: bookstore
-- ------------------------------------------------------
-- Server version	8.0.29

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `categorias`
--

DROP TABLE IF EXISTS `categorias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categorias` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categorias`
--

LOCK TABLES `categorias` WRITE;
/*!40000 ALTER TABLE `categorias` DISABLE KEYS */;
INSERT INTO `categorias` VALUES (1,'Romance'),(2,'Drama'),(3,'Terror'),(4,'Quadrinhos'),(5,'Técnico');
/*!40000 ALTER TABLE `categorias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categorias_has_produtos`
--

DROP TABLE IF EXISTS `categorias_has_produtos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categorias_has_produtos` (
  `categoria_id` int NOT NULL,
  `produtos_id` int NOT NULL,
  KEY `fk_categoria_has_produtos_produtos1_idx` (`produtos_id`),
  KEY `fk_categoria_has_produtos_categoria_idx` (`categoria_id`),
  CONSTRAINT `fk_categoria_has_produtos_categoria` FOREIGN KEY (`categoria_id`) REFERENCES `categorias` (`id`),
  CONSTRAINT `fk_categoria_has_produtos_produtos1` FOREIGN KEY (`produtos_id`) REFERENCES `produtos` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categorias_has_produtos`
--

LOCK TABLES `categorias_has_produtos` WRITE;
/*!40000 ALTER TABLE `categorias_has_produtos` DISABLE KEYS */;
/*!40000 ALTER TABLE `categorias_has_produtos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `favoritos`
--

DROP TABLE IF EXISTS `favoritos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `favoritos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `produtos_id` int NOT NULL,
  `usuario_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_favoritos_produtos1_idx` (`produtos_id`),
  KEY `fk_favoritos_usuario1_idx` (`usuario_id`),
  CONSTRAINT `fk_favoritos_produtos1` FOREIGN KEY (`produtos_id`) REFERENCES `produtos` (`id`),
  CONSTRAINT `fk_favoritos_usuario1` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `favoritos`
--

LOCK TABLES `favoritos` WRITE;
/*!40000 ALTER TABLE `favoritos` DISABLE KEYS */;
/*!40000 ALTER TABLE `favoritos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedidos`
--

DROP TABLE IF EXISTS `pedidos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedidos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `data` datetime NOT NULL,
  `endereco` varchar(250) NOT NULL,
  `usuario_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_pedidos_usuario1_idx` (`usuario_id`),
  CONSTRAINT `fk_pedidos_usuario1` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedidos`
--

LOCK TABLES `pedidos` WRITE;
/*!40000 ALTER TABLE `pedidos` DISABLE KEYS */;
/*!40000 ALTER TABLE `pedidos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedidos_has_produtos`
--

DROP TABLE IF EXISTS `pedidos_has_produtos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedidos_has_produtos` (
  `pedidos_id` int NOT NULL,
  `produtos_id` int NOT NULL,
  PRIMARY KEY (`pedidos_id`,`produtos_id`),
  KEY `fk_pedidos_has_produtos_produtos1_idx` (`produtos_id`),
  KEY `fk_pedidos_has_produtos_pedidos1_idx` (`pedidos_id`),
  CONSTRAINT `fk_pedidos_has_produtos_pedidos1` FOREIGN KEY (`pedidos_id`) REFERENCES `pedidos` (`id`),
  CONSTRAINT `fk_pedidos_has_produtos_produtos1` FOREIGN KEY (`produtos_id`) REFERENCES `produtos` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedidos_has_produtos`
--

LOCK TABLES `pedidos_has_produtos` WRITE;
/*!40000 ALTER TABLE `pedidos_has_produtos` DISABLE KEYS */;
/*!40000 ALTER TABLE `pedidos_has_produtos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produtos`
--

DROP TABLE IF EXISTS `produtos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `produtos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(120) NOT NULL,
  `preco` decimal(6,2) NOT NULL,
  `imagem` varchar(45) NOT NULL,
  `sinopse` text,
  `tipodepromocao` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produtos`
--

LOCK TABLES `produtos` WRITE;
/*!40000 ALTER TABLE `produtos` DISABLE KEYS */;
INSERT INTO `produtos` VALUES (29,'1984',40.00,'29.jpg','Após uma guerra global, semelhante à segunda grande guerra, porém com mais bombas atômicas, o mundo foi dividido em três continentes: Lestásia, Eurásia e Oceania, onde fica a cidade de Londres. Esse último é comandado pelo líder Big Brother, a figura máxima de poder e controle, o olho que tudo vê.',1),(30,'É assim que acaba',35.00,'30.jpg','O livro se inicia com Lily adulta, uma jovem bem sucedida formada em marketing que se mudou para Boston e abriu uma floricultura. Em uma noite após fazer um discurso no funeral de seu pai, Lily conhece Ryle Kincaid um residente de neurocirurgia, na noite que se conheceram criaram um jogo de “verdades nuas e cruas” e dividiram alguns segredos, mas depois daquela noite não se encontraram mais. Com a morte de seu pai, a sua mãe também resolve se mudar para Boston, fazendo com que Lily tenha um pouco de contato com seu passado já encontra seus antigos diários que escrevia cartas para Ellen Degeneres, foi assim que ela resolveu largar o emprego e abrir uma floricultura fugindo um pouco dos padrões, o passado de Lily começa a ser contado e é assim que o personagem Atlas Corrigan aparece, um rapaz sem teto que morava na casa abandonada que ficava atrás da casa que Lily morava na infância.',1),(31,'Torto Arado',50.00,'31.jpg','Nas profundezas do sertão baiano, as irmãs Bibiana e Belonísia encontram uma velha e misteriosa faca na mala guardada sob a cama da avó. Ocorre então um acidente. E para sempre suas vidas estarão ligadas — a ponto de uma precisar ser a voz da outra.',1),(32,'Romeu e Julieta',35.00,'32.jpg','O amor apresenta-se à vida de Romeu e Julieta de modo traiçoeiro - ambos apaixonam-se instantaneamente, em uma festa - um baile de máscaras -, desconhecendo a identidade um do outro. Ele é filho dos Montéquio, e ela, dos Capuleto, duas das mais poderosas famílias de Verona, inimigas entre si.',1),(33,' It a coisa',60.00,'33.jpg','Um grupo de crianças se une para investigar o misterioso desaparecimento de vários jovens em sua cidade. Eles descobrem que o culpado é Pennywise, um palhaço cruel que se alimenta de seus medos e cuja violência teve origem há vários séculos',2),(34,'O iluminado',45.00,'34.jpg','Jack Torrance se torna caseiro de inverno do isolado Hotel Overlook, nas montanhas do Colorado, na esperança de curar seu bloqueio de escritor. Ele se instala com a esposa Wendy e o filho Danny, que é atormentando por premonições. Jack não consegue escrever e as visões de Danny se tornam mais perturbadoras. O escritor descobre os segredos sombrios do hotel e começa a se transformar em um maníaco homicida, aterrorizando sua família.',2),(35,'Carrie',30.00,'35.jpg','Carrie é uma jovem tímida, perseguida pelos colegas, professores e impedida pela mãe de levar uma vida comum. No dia de sua formatura, descobre que possui poderes telecinéticos quando os jovens mais populares da escola a humilham diante de todos.',2),(36,'Orgulho e Preconceito',20.00,'36.jpg','Elizabeth Bennet vive com sua mãe, pai e irmãs no campo, na Inglaterra. Por ser uma das filhas mais velhas, ela enfrenta uma crescente pressão de seus pais para se casar. Quando Elizabeth é apresentada ao belo e rico Darcy, faíscas voam. Embora haja uma química óbvia entre os dois, a natureza excessivamente reservada de Darcy ameaça a relação.',2),(37,'Turma da Mônica Algodão Doce - A Roupa Nova do Re',25.00,'37.jpg','Os contos classicos mais conhecidos de todos os tempos interpretados pela turminha mais amada do Brasil! com letra bastão para facilitar o acesso dos menores ao mundo da leitura!',2),(38,'Maus',30.00,'38.jpg','Maus (\"rato\", em alemão) é a história de Vladek Spiegelman, judeu polonês que sobreviveu ao campo de concentração de Auschwitz, narrada por ele próprio ao filho Art. O livro é considerado um clássico contemporâneo das histórias em quadrinhos. Foipublicado em duas partes, a primeira em 1986 e a segunda em 1991.',2),(39,'Gravity Falls - Lendas Perdidas: Lendas perdidas',36.00,'39.jpg','Dipper, Mabel e todo mundo da Cabana do Mistério aguardam você em quatro novas e empolgantes aventuras – próprias da excêntrica cidade de Gravity Falls!',2),(40,'A Metamorfose',40.00,'40.jpg','A metamorfose (Die Verwandlung, em alemão) é uma novela escrita por Franz Kafka, publicada pela primeira vez em 1915. Nessa obra, Kafka descreve o caixeiro viajante Gregor Samsa, que abandona as suas vontades e desejos para sustentar a família e pagar a dívida dos pais',2),(41,'Eletrônica Básica',45.00,'41.jpg','Nosso Curso Básico de Eletrônica, que teve 5 edições publicadas, com grande sucesso e que se encontrava esgotado, volta agora num novo formato, ampliado e atualizado. De fato, em sua última edição em papel, de 2009, o curso ainda apresentava o mesmo conteúdo, cuja última atualização foi feita em 2005. Com a grande procura, analisamos aquela edição e modificamos totalmente seu conteúdo de modo a criar uma série totalmente nova que foi desmembrada em diversos volumes. Chegou então o momento de se fazer algo novo, adaptado aos novos tempos da eletrônica, num formato mais atual e com conteúdo que seja mais útil a todos que desejarem aprender o básico da eletrônica. Desta forma o conteúdo do curso anterior foi separado em diversos volumes e ampliado, Nesta primeira edição de Eletrônica Básica, um verdadeiro curso de conceitos de eletrônica abordou todo o conhecimento daquelas edições e mais informações atuais sobre novas tecnologias, novos componentes e novas aplicações. Podemos dizer que este livro, como os demais, podem ser considerados a plataforma de iniciação ideal para muitos cursos, dos técnicos às disciplinas eletivas, da reciclagem de conhecimentos até aqueles que desejam ter na eletrônica uma segunda atividade ou precisam deles para o seu trabalho em área relacionada.',3),(42,'Introdução à engenharia de produção',37.00,'42.jpg','O engenheiro de produção atua no sentido de projetar, aperfeiçoar e implantar sistemas de produção (combinando pessoas, materiais, informações, equipamentos e energia) para a produção sustentável de bens e serviços.',3),(43,' Técnico de Segurança do Trabalho',25.00,'43.jpg','O técnico segurança do trabalho é o profissional responsável por preservar a integridade física dos funcionários das empresas. Ele inspeciona as condições de trabalho, equipamentos e instalações, visando garantir a eliminação de riscos à saúde.',3),(44,'Uzumaki',50.00,'44.jpg','Kurouzu-cho, uma pequena cidade enevoada na costa do Japão, é amaldiçoada. De acordo com Shuichi Saito, o namorado retraído da adolescente Kirie Goshima, sua cidade é assombrada não por uma pessoa ou ser, mas por um padrão: uzumaki, a espiral, a forma secreta hipnótica do mundo. Ela se manifesta em tudo, desde conchas e redemoinhos na água até as marcas espirais nos corpos das pessoas, as obsessões insanas do pai de Shuichi e a voz da cóclea em nosso ouvido interno. À medida que a loucura se espalha, os habitantes de Kurouzu-cho são puxados cada vez mais para dentro de um redemoinho do qual não há retorno!',3),(45,'A divina comédia - Inferno',40.00,'45.jpg','Dante, perdido numa selva escura, erra nela toda a noite. Saindo ao amanhecer, começa a subir por uma colina, quando lhe atravessam a passagem uma pantera, um leão e uma loba, que o repelem para a selva. Aparece-lhe então a imagem de Virgílio, que o reanima e se oferece a tirá-lo de lá, fazendo-o passar pelo Inferno e pelo Purgatório. Beatriz, depois, o guiará ao Paraíso. Dante o segue.',3),(46,'A Divina Comédia - Purgatório',40.00,'46.jpg','A Divina Comédia é um poema clássico da literatura italiana e mundial com características épica e teológica, escrito por Dante Alighieri no século XIV período renascentista e dividido em três partes: o Inferno, o Purgatório e o Paraíso. São cem cantos protagonizados pelo próprio Dante em companhia do poeta romano Virgílio , que percorreu uma jornada espiritual pelos três reinos além-túmulo. O Purgatório é descrito em 33 cantos. Dante descreve nele o encontro com as almas que aguardam para serem avaliadas. O purgatório é formado por sete círculos, que representam os sete pecados capitais: Orgulho, Inveja, Ira, Preguiça, Avareza, Gula e Luxúria.',3),(47,'A Divina Comédia - Paraíso',40.00,'47.jpg','A Divina Comédia é um poema clássico da literatura italiana e mundial escrito por Dante Alighieri no século XIV e dividido em três partes: o Inferno, o Purgatório e o Paraíso. São cem cantos protagonizados pelo autor acompanhado do poeta romano Virgílio. O Paraíso é descrito em 33 cantos. Ao fim, Virgílio não pode entrar pois era pagão. Assim, o local do poeta é o inferno. No paraíso, Dante reencontra seu grande amor, Beatriz.',3),(48,'A Seleção 1',35.00,'48.jpg','Muitas garotas sonham em ser princesas, mas este não é o caso de America Singer. Ela topa se inscrever na Seleção só para agradar a mãe, certa de que não será sorteada para participar da competição em que o príncipe escolherá sua futura esposa. Mas é claro que depois disso sua vida nunca mais será a mesma...',3),(49,'Saboroso Cadáver',37.00,'49.jpg','Diz o antigo ditado que “Você é o que você come”. No romance Saboroso Cadáver, de Agustina Bazterrica, esse ditado é levado às últimas consequências. O livro conta a história de um vírus que se espalha entre os animais de todo o planeta e torna sua carne mortal aos humanos. Impossibilitados de utilizar os animais para a alimentação, a sociedade regulariza a criação e a reprodução de seres humanos como animais de abate, transformando o mundo num lugar cinzento, cínico e inóspito. Nesse romance visceral, grotesco, repleto de descrições vívidas e nauseantes capaz de nos alimentar na medida certa, vamos acompanhar a rotina de Marcos Tejo, funcionário do frigorífico Krieg,, que recebe de presente uma mulher viva, considerada “carne de primeira”. Ironicamente, esse funcionário parece ser o mais humano nesse mundo terrível. Seguindo seus passos, presenciamos o processo metódico da criação de pessoas, abates, experimentos de laboratório, caçadas humanas e suntuosos jantares canibais. Publicado originalmente em 2017, Saboroso Cadáver ganhou o Prêmio Clarín Novela naquele mesmo ano, na Argentina. Três anos depois, a tradução americana do livro recebeu o Ladies of Horror Fiction Award como melhor romance de 2020. Além disso, de acordo com o jornal Washington Post, foi um dos melhores lançamentos de horror, ficção científica e fantasia de 2020, ao lado de Temporada de Caça, de Stephen Graham Jones. Uma das pessoas que participaram da seleção foi ninguém menos que Silvia Moreno-Garcia, autora de Gótico Mexicano (DarkSide® Books, 2021), sucesso entre os darksiders. Bazterrica afirmou que “escrever é uma experiência feroz e minha intenção é tirar o leitor dessa letargia em que vivemos e em que, muitas vezes, a violência é naturalizada”. Distopia arrepiante, Saboroso Cadáver imagina um mundo em que a violência e o canibalismo são de fato naturalizados, embora ainda haja espaço para a compaixão, a solidariedade e o cuidado com os outros, enquanto a batalha pela sobrevivência se torna uma aventura de desfecho incerto. Com seu romance marcante e poderoso, Bazterrica nos coloca dentro de um pesadelo em que o canibalismo se legitima na maior parte do mundo e a sociedade fica dividida entre aqueles que comem e aqueles que são comidos. Haveria caminhos para a humanidade, quando os corpos dos mortos são cremados para evitar que sejam devorados? Quais as relações passíveis de serem forjadas, quando na verdade somos o que comemos? Saboroso Cadáver é um prato raro, uma iguaria literária impiedosa, alegórica e realista, agridoce e suculenta, capaz de alimentar de ternura os corações literários que ainda pulsam diante da beleza do horror.',4),(50,'Vagabond Vol. 3',200.00,'50.jpg','Três anos depois de deixar sua vila natal, Takezo adota o nome Miyamoto Musashi. Agora em Kyoto, sua ambição é desafiar a academia Yoshioka e derrotar o espadachim mais forte da antiga capital japonesa!',4),(51,' Mooncakes ',80.00,'51.jpg','UMA AVENTURA MÁGICA SOBRE FAMÍLIA, LIVROS, AMORES E DEMÔNIOS\nNova Huang é uma jovem bruxa de nacionalidade chinesa e americana. Ela trabalha na peculiar livraria de suas avós, que vendem obras de bruxaria, grimórios mágicos e livros raros sobre espíritos e suas manifestações. Em uma noite de lua cheia, Huang é atraída por um lobo branco até uma floresta e se depara com ume antigue crush de infância, Tam Lang, que sob eterna ameaça das forças das trevas precisa desesperadamente de ajuda. Roteirizado por Suzanne Walker e ilustrado por Wendy Xu, Mooncakes é uma história de autodescoberta. Tratando de temas como acolhimento familiar, autoconhecimento e laços que resistem à passagem do tempo, o lançamento da marca DarkSide® Graphic Novel nos presenteia com uma trama repleta de aventura, protagonizada por personagens cativantes e diversos que estão compreendendo sua verdadeira essência e transformando o mundo que querem chamar de lar. Huang é uma pessoa com deficiência auditiva que passa pela experiência do luto após o falecimento dos seus pais. Tam, não binárie e que possui poderes de licantropia, tenta seguir em frente após o total desacolhimento de sua própria família — todos esses sentimentos transbordam diante de um mundo que sempre recusou abraçar sua cria. Determinadas a ajudar Tam, Huang e suas avós unem forças para combater a ameaça — um culto ávido por reivindicar a magia dos lobos e disposto a fazer de tudo para atingir seu objetivo. A perigosa batalha contra o mal reacende sentimentos latentes e testa poderes mágicos nesta encantadora leitura com um apaixonante romance friends-to-lovers, capaz de evocar os sentimentos mais puros da nossa velha infância. Finalista do Goodreads Choice Awards, do Cybils Award e indicado ao Prêmio Hugo, Mooncakes é a leitura perfeita para fãs de O Príncipe e a Costureira, Francis e Floresta dos Medos. A atmosfera bruxesca também conecta a marca DarkSide® Graphic Novel com a magia do universo Magicae.\nIlustradora: Wendy Xu',4),(52,'Fogo & Sangue – Volume 1',78.00,'52.jpg','Séculos antes dos eventos de A guerra dos tronos, a Casa Targaryen – única família de senhores dos dragões a sobreviver à Destruição de Valíria – tomou residência em Pedra do Dragão. A história de Fogo e sangue começa com o lendário Aegon, o Conquistador, criador do Trono de Ferro, e segue narrando as gerações de Targaryen que lutaram para manter o assento, até a guerra civil que quase destruiu sua dinastia.\nO que realmente aconteceu durante a Dança dos Dragões? Por que era tão perigoso visitar Valíria depois da Destruição? Qual é a origem dos três ovos de dragão que chegaram a Daenerys? Essas são algumas das questões respondidas neste livro essencial, relatadas por um sábio meistre da Cidadela.\nRicamente ilustrado com mais de oitenta imagens em preto e branco assinadas pelo artista Dough Wheatley, Fogo e sangue dará aos leitores uma nova e completa visão da fascinante história de Westeros – um livro imperdível para os fãs do autor.',4),(53,'Vermelho, branco e sangue azu',65.00,'53.jpg','O que pode acontecer quando o filho da presidenta dos Estados Unidos se apaixona pelo príncipe da Inglaterra?\n\nQuando sua mãe foi eleita presidenta dos Estados Unidos, Alex Claremont-Diaz se tornou o novo queridinho da mídia norte-americana. Bonito, carismático e com personalidade forte, Alex tem tudo para seguir os passos de seus pais e conquistar uma carreira na política, como tanto deseja. Mas quando sua família é convidada para o casamento real do príncipe britânico Philip, Alex tem que encarar o seu primeiro desafio diplomático: lidar com Henry, irmão mais novo de Philip, o príncipe mais adorado do mundo, com quem ele é constantemente comparado ― e que ele não suporta.\nO encontro entre os dois sai pior do que o esperado, e no dia seguinte todos os jornais do mundo estampam fotos de Alex e Henry caídos em cima do bolo real, insinuando uma briga séria entre os dois. Para evitar um desastre diplomático, eles passam um fim de semana fingindo ser melhores amigos e não demora para que essa relação evolua para algo que nenhum dos dois poderia imaginar ― e que não tem nenhuma chance de dar certo. Ou tem?\n\n“Vermelho, branco e sangue azul é escandalosamente divertido. É romântico, sexy, espirituoso e emocionante. Amei cada segundo.” ― Taylor Jenkins Reid, autora de Daisy Jones & The Six e Os sete maridos de Evelyn Hugo',4),(54,'Como As Democracias Morrem',46.00,'54.jpg','Democracias tradicionais entram em colapso? Essa é a questão que Steven Levitsky e Daniel Ziblatt – dois conceituados professores de Harvard – respondem ao discutir o modo como a eleição de Donald Trump se tornou possível.\nPara isso comparam o caso de Trump com exemplos históricos de rompimento da democracia nos últimos cem anos: da ascensão de Hitler e Mussolini nos anos 1930 à atual onda populista de extrema-direita na Europa, passando pelas ditaduras militares da América Latina dos anos 1970. E alertam: a democracia atualmente não termina com uma ruptura violenta nos moldes de uma revolução ou de um golpe militar; agora, a escalada do autoritarismo se dá com o enfraquecimento lento e constante de instituições críticas – como o judiciário e a imprensa – e a erosão gradual de normas políticas de longa data.\nSucesso de público e de crítica nos Estados Unidos e na Europa, esta é uma obra fundamental para o momento conturbado que vivemos no Brasil e em boa parte do mundo e um guia indispensável para manter e recuperar democracias ameaçadas.',4),(55,'É assim que começa (Vol. 2 É assim que acaba)',40.00,'55.jpg','Lily Bloom continua administrando uma floricultura. Seu ex-marido abusivo, Ryle Kincaid, ainda é um    cirurgião. Mas agora os dois estão oficialmente divorciados e dividem a guarda da filha, Emerson.\n\nQuando Lily esbarra em Atlas ― com quem não fala há quase dois anos ―, parece que finalmente chegou o momento de retomar o relacionamento da adolescência, já que ele também está solteiro e parece retribuir os sentimentos de Lily. Mas apesar de divorciada, Lily não está exatamente livre de Ryle. Culpando Atlas pelo fim de seu casamento, Ryle não está nada disposto a aceitar o novo relacionamento de Lily, ainda mais com Atlas, o último homem que aceitaria ver perto de sua filha e da ex-esposa.\n\nAlternando entre os pontos de vista de Atlas e Lily, É assim que começa retoma logo após o epílogo de É assim que acaba. Revelando mais sobre o passado de Atlas e acompanhando a jornada de Lily para abraçar a sua segunda chance, no amor enquanto lida com um ex-marido ciumento, É assim que começa prova que ninguém entrega uma leitura mais emocionante do que Colleen Hoover.\n\n \n\n“Em uma história permeada de tensão com lampejos de esperança, Hoover captura perfeitamente as dores de um coração partido e a felicidade de começar de novo.” - Kirkus Review',4),(56,'O amor não é óbvio',25.00,'56.jpg','O amor não é óbvio. Ele está presente quando você se senta com a sua vizinha idosa para assistir a um novo capítulo da sua novela favorita. Ele é posto à prova quando você escuta as histórias mirabolantes da sua melhor amiga, ainda que nenhuma delas lhe interesse. E, às vezes, ele aparece quando você menos espera e te leva a fazer experimentos científicos munida de binóculos e uma bicicleta amarela.\n\nÍris tem 17 anos e está viciada na novela Amor em atos. Ela e sua vizinha, Dona Símia, de 68 anos, não perdem um episódio. Na escola, parece que todo mundo só pensa em duas coisas: na festa de formatura e em perder a virgindade. Só que a vida de Íris está prestes a mudar: Cadu Sena, sua paixão platônica desde a oitava série, está solteiro. Essa é a chance de Íris.\n\n\n\nUma história tocante entre duas garotas que, nessa fase turbulenta e cheia de descobertas que é a adolescência, percebem muito sobre quem elas são e sobre esse sentimento estranho, que não segue roteiros, chamado amor.',4),(57,'Oxe baby',25.00,'57.jpg','\"Arraste uma cadeira e, se der, me leia\". É assim – despretensiosa, em um convite silencioso mas urgente – que Elayne introduz o leitor a Oxe baby, seu primeiro livro de poesia. E é também nesse mesmo ritmo que são conduzidas as próximas páginas, em que, entre metáforas com casulos, morcegos e borboletas, a autora conta um pouco de si e de suas experiências como uma menina que ama meninas',4);
/*!40000 ALTER TABLE `produtos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(64) NOT NULL,
  `senha` varchar(64) NOT NULL,
  `email` varchar(45) NOT NULL,
  `endereco` varchar(250) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,'Alice Martins','123456','alicemartins@teste.com','rua martins 55'),(2,'Mari Maria','1234567','marimaria@teste.com','rua emanuel peixoto 60'),(3,'Alexandre Emanuel','098765','alexandreemanuel@teste.com','rua padre matias 09');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-11-04 17:26:29
