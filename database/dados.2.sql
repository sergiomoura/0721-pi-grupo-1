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
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produtos`
--

LOCK TABLES `produtos` WRITE;
/*!40000 ALTER TABLE `produtos` DISABLE KEYS */;
INSERT INTO `produtos` VALUES (29,'1984',40.00,'29.jpg','Após uma guerra global, semelhante à segunda grande guerra, porém com mais bombas atômicas, o mundo foi dividido em três continentes: Lestásia, Eurásia e Oceania, onde fica a cidade de Londres. Esse último é comandado pelo líder Big Brother, a figura máxima de poder e controle, o olho que tudo vê.',1),(30,'É assim que acaba',35.00,'30.jpg','O livro se inicia com Lily adulta, uma jovem bem sucedida formada em marketing que se mudou para Boston e abriu uma floricultura. Em uma noite após fazer um discurso no funeral de seu pai, Lily conhece Ryle Kincaid um residente de neurocirurgia, na noite que se conheceram criaram um jogo de “verdades nuas e cruas” e dividiram alguns segredos, mas depois daquela noite não se encontraram mais. Com a morte de seu pai, a sua mãe também resolve se mudar para Boston, fazendo com que Lily tenha um pouco de contato com seu passado já encontra seus antigos diários que escrevia cartas para Ellen Degeneres, foi assim que ela resolveu largar o emprego e abrir uma floricultura fugindo um pouco dos padrões, o passado de Lily começa a ser contado e é assim que o personagem Atlas Corrigan aparece, um rapaz sem teto que morava na casa abandonada que ficava atrás da casa que Lily morava na infância.',1),(31,'Torto Arado',50.00,'31.jpg','Nas profundezas do sertão baiano, as irmãs Bibiana e Belonísia encontram uma velha e misteriosa faca na mala guardada sob a cama da avó. Ocorre então um acidente. E para sempre suas vidas estarão ligadas — a ponto de uma precisar ser a voz da outra.',1),(32,'Romeu e Julieta',35.00,'32.jpg','O amor apresenta-se à vida de Romeu e Julieta de modo traiçoeiro - ambos apaixonam-se instantaneamente, em uma festa - um baile de máscaras -, desconhecendo a identidade um do outro. Ele é filho dos Montéquio, e ela, dos Capuleto, duas das mais poderosas famílias de Verona, inimigas entre si.',1),(33,' It a coisa',60.00,'33.jpg','Um grupo de crianças se une para investigar o misterioso desaparecimento de vários jovens em sua cidade. Eles descobrem que o culpado é Pennywise, um palhaço cruel que se alimenta de seus medos e cuja violência teve origem há vários séculos',2),(34,'O iluminado',45.00,'34.jpg','Jack Torrance se torna caseiro de inverno do isolado Hotel Overlook, nas montanhas do Colorado, na esperança de curar seu bloqueio de escritor. Ele se instala com a esposa Wendy e o filho Danny, que é atormentando por premonições. Jack não consegue escrever e as visões de Danny se tornam mais perturbadoras. O escritor descobre os segredos sombrios do hotel e começa a se transformar em um maníaco homicida, aterrorizando sua família.',2),(35,'Carrie',30.00,'35.jpg','Carrie é uma jovem tímida, perseguida pelos colegas, professores e impedida pela mãe de levar uma vida comum. No dia de sua formatura, descobre que possui poderes telecinéticos quando os jovens mais populares da escola a humilham diante de todos.',2),(36,'Orgulho e Preconceito',20.00,'36.jpg','Elizabeth Bennet vive com sua mãe, pai e irmãs no campo, na Inglaterra. Por ser uma das filhas mais velhas, ela enfrenta uma crescente pressão de seus pais para se casar. Quando Elizabeth é apresentada ao belo e rico Darcy, faíscas voam. Embora haja uma química óbvia entre os dois, a natureza excessivamente reservada de Darcy ameaça a relação.',2),(37,'Turma da Mônica Algodão Doce - A Roupa Nova do Re',25.00,'37.jpg','Os contos classicos mais conhecidos de todos os tempos interpretados pela turminha mais amada do Brasil! com letra bastão para facilitar o acesso dos menores ao mundo da leitura!',2),(38,'Maus',30.00,'38.jpg','Maus (\"rato\", em alemão) é a história de Vladek Spiegelman, judeu polonês que sobreviveu ao campo de concentração de Auschwitz, narrada por ele próprio ao filho Art. O livro é considerado um clássico contemporâneo das histórias em quadrinhos. Foipublicado em duas partes, a primeira em 1986 e a segunda em 1991.',2),(39,'Gravity Falls - Lendas Perdidas: Lendas perdidas',36.00,'39.jpg','Dipper, Mabel e todo mundo da Cabana do Mistério aguardam você em quatro novas e empolgantes aventuras – próprias da excêntrica cidade de Gravity Falls!',2),(40,'A Metamorfose',40.00,'40.jpg','A metamorfose (Die Verwandlung, em alemão) é uma novela escrita por Franz Kafka, publicada pela primeira vez em 1915. Nessa obra, Kafka descreve o caixeiro viajante Gregor Samsa, que abandona as suas vontades e desejos para sustentar a família e pagar a dívida dos pais',2),(41,'Eletrônica Básica',45.00,'41.jpg','Nosso Curso Básico de Eletrônica, que teve 5 edições publicadas, com grande sucesso e que se encontrava esgotado, volta agora num novo formato, ampliado e atualizado. De fato, em sua última edição em papel, de 2009, o curso ainda apresentava o mesmo conteúdo, cuja última atualização foi feita em 2005. Com a grande procura, analisamos aquela edição e modificamos totalmente seu conteúdo de modo a criar uma série totalmente nova que foi desmembrada em diversos volumes. Chegou então o momento de se fazer algo novo, adaptado aos novos tempos da eletrônica, num formato mais atual e com conteúdo que seja mais útil a todos que desejarem aprender o básico da eletrônica. Desta forma o conteúdo do curso anterior foi separado em diversos volumes e ampliado, Nesta primeira edição de Eletrônica Básica, um verdadeiro curso de conceitos de eletrônica abordou todo o conhecimento daquelas edições e mais informações atuais sobre novas tecnologias, novos componentes e novas aplicações. Podemos dizer que este livro, como os demais, podem ser considerados a plataforma de iniciação ideal para muitos cursos, dos técnicos às disciplinas eletivas, da reciclagem de conhecimentos até aqueles que desejam ter na eletrônica uma segunda atividade ou precisam deles para o seu trabalho em área relacionada.',3),(42,'Introdução à engenharia de produção',37.00,'42.jpg','O engenheiro de produção atua no sentido de projetar, aperfeiçoar e implantar sistemas de produção (combinando pessoas, materiais, informações, equipamentos e energia) para a produção sustentável de bens e serviços.',3),(43,' Técnico de Segurança do Trabalho',25.00,'43.jpg','O técnico segurança do trabalho é o profissional responsável por preservar a integridade física dos funcionários das empresas. Ele inspeciona as condições de trabalho, equipamentos e instalações, visando garantir a eliminação de riscos à saúde.',3);
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

-- Dump completed on 2022-10-31 16:40:44
