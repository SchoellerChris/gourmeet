-- --------------------------------------------------------
-- Servidor:                     127.0.0.1
-- Versão do servidor:           10.1.38-MariaDB - mariadb.org binary distribution
-- OS do Servidor:               Win64
-- HeidiSQL Versão:              10.1.0.5464
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Copiando estrutura do banco de dados para gourmeet
CREATE DATABASE IF NOT EXISTS `gourmeet` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `gourmeet`;

-- Copiando estrutura para tabela gourmeet.categoria
CREATE TABLE IF NOT EXISTS `categoria` (
  `idCategoria` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nomeCategoria` varchar(45) NOT NULL,
  PRIMARY KEY (`idCategoria`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela gourmeet.categoria: ~12 rows (aproximadamente)
/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;
INSERT INTO `categoria` (`idCategoria`, `nomeCategoria`) VALUES
	(1, 'massa'),
	(2, 'petisco'),
	(3, 'carne'),
	(4, 'hamburguer'),
	(5, 'fit'),
	(6, 'sobremesa'),
	(7, 'vinho'),
	(8, 'suco'),
	(9, 'refrigerante'),
	(10, 'cerveja'),
	(11, 'pizza'),
	(12, 'sushi');
/*!40000 ALTER TABLE `categoria` ENABLE KEYS */;

-- Copiando estrutura para tabela gourmeet.cliente
CREATE TABLE IF NOT EXISTS `cliente` (
  `idCliente` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) NOT NULL,
  PRIMARY KEY (`idCliente`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela gourmeet.cliente: ~5 rows (aproximadamente)
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` (`idCliente`, `nome`) VALUES
	(1, 'bernardo'),
	(2, 'CHRISTIAN'),
	(3, 'Airan'),
	(4, 'benzema'),
	(5, 'benzema'),
	(6, 'jefferson');
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;

-- Copiando estrutura para tabela gourmeet.mesa
CREATE TABLE IF NOT EXISTS `mesa` (
  `idMesa` int(11) NOT NULL AUTO_INCREMENT,
  `numeroMesa` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idMesa`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela gourmeet.mesa: ~7 rows (aproximadamente)
/*!40000 ALTER TABLE `mesa` DISABLE KEYS */;
INSERT INTO `mesa` (`idMesa`, `numeroMesa`, `status`) VALUES
	(1, 1, 1),
	(2, 2, 0),
	(3, 3, 0),
	(4, 4, 0),
	(5, 5, 1),
	(6, 6, 0),
	(9, 7, 0),
	(10, 8, 0);
/*!40000 ALTER TABLE `mesa` ENABLE KEYS */;

-- Copiando estrutura para tabela gourmeet.pedido
CREATE TABLE IF NOT EXISTS `pedido` (
  `idPedido` int(11) NOT NULL AUTO_INCREMENT,
  `nomeCliente` varchar(50) NOT NULL,
  `idMesa` int(11) NOT NULL,
  `precoPedido` float DEFAULT NULL,
  `statusPagamento` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idPedido`),
  KEY `FK_pedido_mesa` (`idMesa`),
  CONSTRAINT `FK_pedido_mesa` FOREIGN KEY (`idMesa`) REFERENCES `mesa` (`idMesa`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=135 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela gourmeet.pedido: ~32 rows (aproximadamente)
/*!40000 ALTER TABLE `pedido` DISABLE KEYS */;
INSERT INTO `pedido` (`idPedido`, `nomeCliente`, `idMesa`, `precoPedido`, `statusPagamento`) VALUES
	(81, '0', 0, 38.99, 0),
	(82, '0', 0, 64.98, 0),
	(83, '0', 0, 29.99, 0),
	(84, '0', 0, 39.99, 0),
	(85, '0', 0, 39.99, 0),
	(86, '0', 0, 0, 0),
	(87, '0', 0, 39.99, 0),
	(88, '0', 0, 39.99, 0),
	(89, '0', 0, 119.97, 0),
	(90, '0', 0, 39.99, 0),
	(91, '0', 0, 39.99, 0),
	(92, '0', 0, 79.98, 0),
	(93, '0', 0, 39.99, 0),
	(94, '0', 0, 39.99, 0),
	(95, '0', 0, 39.99, 0),
	(96, '0', 0, 39.99, 0),
	(97, '0', 0, 39.99, 0),
	(98, '0', 0, 18.99, 0),
	(99, '0', 0, 0, 0),
	(100, '0', 0, 79.98, 0),
	(101, '0', 0, 39.99, 0),
	(102, '0', 0, 39.99, 0),
	(117, '0', 2, 30, 0),
	(118, '0', 2, 30, 0),
	(119, '0', 2, 30, 0),
	(120, '0', 2, 30, 0),
	(121, '0', 2, 30, 0),
	(122, '0', 2, 30, 0),
	(131, '0', 2, 30, 0),
	(132, '0', 3, 150.99, 0),
	(133, '0', 3, 150.99, 0),
	(134, '0', 5, 150.99, 0);
/*!40000 ALTER TABLE `pedido` ENABLE KEYS */;

-- Copiando estrutura para tabela gourmeet.pedidoproduto
CREATE TABLE IF NOT EXISTS `pedidoproduto` (
  `idpedidoproduto` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `idPedido` int(11) DEFAULT NULL,
  `idProduto` int(11) DEFAULT NULL,
  PRIMARY KEY (`idpedidoproduto`),
  KEY `fkpedidoid` (`idPedido`),
  CONSTRAINT `fkpedidoid` FOREIGN KEY (`idPedido`) REFERENCES `pedido` (`idPedido`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela gourmeet.pedidoproduto: ~25 rows (aproximadamente)
/*!40000 ALTER TABLE `pedidoproduto` DISABLE KEYS */;
INSERT INTO `pedidoproduto` (`idpedidoproduto`, `idPedido`, `idProduto`) VALUES
	(30, 81, 64),
	(31, 82, 70),
	(32, 82, 6),
	(33, 83, 15),
	(34, 84, 6),
	(35, 85, 6),
	(36, 87, 6),
	(37, 88, 6),
	(38, 89, 6),
	(39, 89, 6),
	(40, 89, 6),
	(41, 90, 6),
	(42, 91, 6),
	(43, 92, 6),
	(44, 92, 6),
	(45, 93, 6),
	(46, 94, 6),
	(47, 95, 6),
	(48, 96, 6),
	(49, 97, 6),
	(50, 98, 55),
	(51, 100, 6),
	(52, 100, 6),
	(53, 101, 6),
	(54, 102, 6);
/*!40000 ALTER TABLE `pedidoproduto` ENABLE KEYS */;

-- Copiando estrutura para tabela gourmeet.produto
CREATE TABLE IF NOT EXISTS `produto` (
  `idProduto` int(11) NOT NULL AUTO_INCREMENT,
  `imgProduto` varchar(45) NOT NULL,
  `nomeProduto` varchar(45) NOT NULL,
  `precoProduto` decimal(10,2) NOT NULL DEFAULT '0.00',
  `idCategoria` int(10) unsigned NOT NULL,
  `descProduto` varchar(50) DEFAULT NULL,
  `ehDestaque` int(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`idProduto`,`idCategoria`),
  KEY `fk_produto_categoria_idx` (`idCategoria`),
  CONSTRAINT `fk_produto_categoria` FOREIGN KEY (`idCategoria`) REFERENCES `categoria` (`idCategoria`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=78 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela gourmeet.produto: ~72 rows (aproximadamente)
/*!40000 ALTER TABLE `produto` DISABLE KEYS */;
INSERT INTO `produto` (`idProduto`, `imgProduto`, `nomeProduto`, `precoProduto`, `idCategoria`, `descProduto`, `ehDestaque`) VALUES
	(6, '/img/pizzaFrango.jpg', 'Pizza de Frango ', 39.99, 11, 'Deliciosa pizza milana com acompanhamentos italian', 1),
	(7, '/img/frangocomcatupiry.jpg', 'Pizza de Frango Com Catupiry ', 41.99, 11, 'Deliciosa pizza de mussarela com acompanhamentos i', 0),
	(8, '/img/alhoeoleo.jpg', 'Pizza de Alho e óleo ', 41.99, 11, 'Deliciosa pizza de Alho e óleo com acompanhamentos', 0),
	(9, '/img/bacon.jpg', 'Pizza de Bacon', 39.95, 11, 'Deliciosa pizza de Bacon com acompanhamentos itali', 0),
	(10, '/img/mussarela.jpg', 'Pizza de Mussarela', 39.99, 11, 'Deliciosa pizza de Mussarela com catupiry com acom', 0),
	(11, '/img/camarão.jpg', 'Pizza de Camarão', 45.99, 11, 'Deliciosa pizza de Camarão com acompanhamentos ita', 0),
	(12, '/img/sorvete.jpg', 'Pizza de Sorvete', 43.99, 11, 'Deliciosa pizza de Sorvete com acompanhamentos ita', 0),
	(13, '/img/brigadeiro.jpg', 'Pizza de Brigadeiro', 36.99, 11, 'Deliciosa pizza de Brigadeiro com acompanhamentos ', 0),
	(14, '/img/banananevada.jpg', 'Pizza de Banana Nevada', 37.99, 11, 'Deliciosa pizza de Banana Nevada com acompanhament', 0),
	(15, '/img/canelone.jpg', 'Canelone de Presunto e Queijo', 29.99, 1, 'Saborosa massa Canelone de presunto e queijo com t', 0),
	(16, '/img/lasanhafrango.jpg', 'Lasanha de Frango', 29.99, 1, 'Saborosa Lasanha de frango com toques do chef', 0),
	(17, '/img/lasanhabolanhesa.jpg', 'Lasanha Bolanhesa', 32.99, 1, 'Saborosa Lasanha Bolanhesa com toques do chef', 0),
	(18, '/img/lasanhalegumes.jpg', 'Lasanha de Legumes', 26.99, 1, 'Saborosa Lasanha de Legumes com toques do chef', 0),
	(19, '/img/nhoque.jpg', 'Nhoque à Bolanhesa ', 29.99, 1, 'Saborosa massa Nhoque à Bolanhesa com toques do ch', 0),
	(20, '/img/panquecadecarne.jpg', 'Panqueca de Carne ', 23.99, 1, 'Saborosa Panqueca de Carne com toques do chef', 0),
	(21, '/img/panquecadefrango.jpg', 'Panqueca de Frango', 23.99, 1, 'Saborosa Panqueca de Carne com toques do chef', 0),
	(22, '/img/macarraooalhoeoleo.jpg', 'Macarrão alho e óleo', 25.99, 1, 'Saboroso Macarrão Alho e óleo com toques do chef', 0),
	(23, '/img/macarraostrognoffdecarne.jpg', 'Macarrão ao Molho de Strognoff de Carne', 27.99, 1, 'Saboroso Macarrão ao molho de Strognoff de Carne c', 0),
	(24, '/img/macarraostrognoffdefrango.jpg', 'Macarrão ao Molho de Strognoff de Frango', 26.99, 1, 'Saboroso Macarrão ao molho de Strognoff de Frango ', 0),
	(25, '/img/macarraocarbonara.jpg', 'Macarrão à Carbonara ', 26.99, 1, 'Saboroso Macarrão Alho e óleo com toques do chef', 0),
	(26, '/img/macarraobolanhesa.jpg', 'Macarrão à Bolanhesa', 27.99, 1, 'Saboroso Macarrão Alho e óleo com toques do chef', 0),
	(27, '/img/espaguetecommolhodetomate.jpg', 'Espaguete com Molho de Tomate ', 24.99, 1, 'Saboroso Espaguete com Molho de Tomate com toques ', 0),
	(28, '/img/espagueteaomolhodequeijo.jpg', 'Espaguete ao Molho de Queijo ', 24.99, 1, 'Saboroso Espaguete com Molho de Queijo com toques ', 0),
	(29, '/img/fritas.jpg', 'Fritas', 23.99, 2, 'Apetitioso petisco de fritas', 0),
	(30, '/img/polentafrita.jpg', 'Polenta Frita', 23.99, 2, 'Apetitioso petisco de Polenta Frita', 0),
	(31, '/img/frango.jpg', 'Frango', 25.99, 2, 'Apetitioso petisco de Frango', 0),
	(32, '/img/calabresa.jpg', 'Calabresa', 23.99, 2, 'Apetitioso petisco de Calabresa', 0),
	(33, '/img/alcatra.jpg', 'Alcatra ', 27.99, 2, 'Apetitioso petisco de Alcatra', 0),
	(34, '/img/polentacomfritas.jpg', 'Polenta com Fritas', 28.99, 2, 'Apetitioso petisco de Polenta com fritas ', 0),
	(35, '/img/camarao.jpg', 'Camarãoo', 31.99, 2, 'Apetitioso petisco de Camarão', 0),
	(36, '/img/coracao.jpg', 'Coraçãoo', 26.99, 2, 'Apetitioso petisco de Coração', 0),
	(37, '/img/iscasdepeixe.jpg', 'Iscas de Peixe ', 26.99, 2, 'Apetitioso petisco de Iscas de Peixe', 0),
	(38, '/img/aneisdecebola.jpg', 'Anéis de cebola', 22.99, 2, 'Apetitioso petisco de Anéis de cebola', 0),
	(39, '/img/frangocomfritas.jpg', 'Frango com Fritas', 32.99, 2, 'Apetitioso petisco de Frango com Fritas', 0),
	(40, '/img/calabresacomfritas.jpg', 'Calabresa com Fritas', 32.99, 2, 'Apetitioso petisco de Calabresa com Fritas', 0),
	(41, '/img/coraçãocomfritas.jpg', 'Coração com Fritas', 31.99, 2, 'Apetitioso petisco de Coração com Fritas', 0),
	(42, '/img/alcatracomfritasecalabresa.jpg', 'Alcatra com Fritas e Calabresa', 36.99, 2, 'Apetitioso petisco de Alcatra com Fritas e Calabre', 0),
	(43, '/img/fraldinhaaomolhodecerveja.jpg', 'Fraldinha ao Molho De Cerveja ', 45.99, 3, 'Deliciosa Fraldinha ao molho de Cerveja ', 0),
	(44, '/img/costelaassada.jpg', 'Costela assada com batata e tomate', 45.99, 3, 'Deliciosa Costela assada com batata e tomate ', 0),
	(45, '/img/costelarecheda.jpg', 'Costela Recheda com Farofa ', 43.99, 3, 'Deliciosa Costela recheada com Farofa', 0),
	(46, '/img/costelinhasuinacommolhobarbecue.jpg', 'Costelinha suína com molho barbecue e batatas', 41.99, 3, 'Deliciosa Costelinha suina com molho barbecue e ba', 0),
	(47, '/img/costelinhaassadanacerveja.jpg', 'Costelinha assada na Cerveja', 40.99, 3, 'Deliciosa Costelinha assada na cerveja ', 0),
	(48, '/img/pernilassadonacerveja.jpg', 'Pernil assado na cerveja preta com farofa de ', 42.99, 3, 'Delicioso Pernil assado cerveja preta com farofa d', 0),
	(49, '/img/lompoencapado.jpg', ' Lombo encapado com bacon e farofa', 42.99, 3, 'Delicioso Lombo encapado com bacon e farofa', 0),
	(50, '/img/picanharecheada.jpg', 'Picanha recheada com queijo', 53.99, 3, 'Deliciosa Costela recheada com Farofa', 0),
	(51, '/img/frangoassado.jpg', 'Frango assado recheado com farofa', 39.99, 3, 'Deliciosa Costela recheada com Farofa', 0),
	(52, '/img/peixeassado.jpg', 'Peixe assado com batata-doce', 42.99, 3, 'Deliciosa Costela recheada com Farofa', 0),
	(53, '/img/hamburguer.jpg', 'Hamburguer ', 14.99, 4, 'Pão, hambúrguer, alface, tomate, milho e batata pa', 0),
	(54, '/img/x-burguer.jpg', 'X-Burguer ', 17.99, 4, 'Pão, hamburguer, queijo, alface, tomate, milho e b', 0),
	(55, '/img/x-bacon.jpg', 'X-Bacon', 18.99, 4, 'Pão, hambúrguer, presunto, queijo, bacon, alface, ', 1),
	(56, '/img/x-picanha.jpg', 'X-Picanha', 21.99, 4, 'Pão, hambúrguer de picanha 120 g, queijo, alface, ', 0),
	(57, '/img/x-calabresa.jpg', 'X-Calabresa', 19.99, 4, 'Pão, calabresa, queijo, presunto, alface, tomate, ', 0),
	(58, '/img/x-frango.jpg', 'X-Frango', 18.99, 4, 'Pão, frango, queijo, presunto, alface, tomate, mil', 1),
	(59, '/img/x-egg.jpg', 'X-EGG', 14.99, 4, 'Pão, ovo, queijo, presunto, alface, tomate, milho ', 0),
	(60, '/img/hamburguerartesanal.jpg', 'Hamburguer artesanal ao molho de cerveja ', 24.99, 4, 'Pão, hamburguer artesanal, queijo, alface, tomate ', 0),
	(61, '/img/hamburguerartesanalbacon.jpg', 'Hamburguer artesanal com bacon ao molho de ce', 28.99, 4, 'Pão, hamburguer artesanal, queijo, bacon, alface, ', 0),
	(62, '/img/hamburguerdacasa.jpg', 'Hamburguer da casa', 26.99, 4, 'Pão, hambúrguer de boi, hambúrguer de frango, ovo,', 0),
	(63, '/img/tortinhadefrango.jpg', 'Tortinha de frango com brócolis', 29.99, 5, 'Deliciosa torta de frango com brócolis fitness', 0),
	(64, '/img/escondidinhodefrango.jpg', 'Escondidinho de frango com batata doce', 38.99, 5, 'Delicioso escondidinho de frango com batata doce f', 1),
	(65, '/img/omelete.jpg', 'Omelete de legumes ', 25.99, 5, 'Delicioso omelete de legumes ftness', 0),
	(66, '/img/sanduiche.jpg', 'Sanduíche de atum ', 19.99, 5, 'Delicios sanduíche de atum fitness', 0),
	(67, '/img/saladadefrango.jpg', 'Salada de frango ', 19.99, 5, 'Deliciosa salada de frango fitness', 0),
	(68, '/img/petitgateau.jpg', 'Petit Gateau', 34.99, 6, 'Saborosa sobremesa Petit Gateau', 0),
	(69, '/img/tortademorango.jpg', 'Torta de morango recheada com cream cheese', 26.99, 6, 'Saborosa sobremesa Torta de morango recheada com c', 0),
	(70, '/img/crepecomdocedeleite.jpg', 'Crepe com doce de leite e morango', 24.99, 6, 'Saborosa sobremesa Crepe com doce de leite e moran', 1),
	(71, '/img/moussedelaranja.jpg', 'Mousse de laranja e acerola', 23.99, 6, 'Saborosa sobremesa Mousse de laranja e acerola', 0),
	(72, '/img/moussedechocolate.jpg', 'Mousse de chocolate ao gengibre', 23.99, 6, 'Saborosa sobremesa Mousse de chocolate ao gengibre', 0),
	(73, '/img/vinhomaiscaro.jpg', 'Domaine de la Romanée-Conti Romanée-Conti Gra', 297.99, 7, 'O vinho mais caro que a casa oferece, já ganho inu', 1),
	(74, '/img/vinhocabernetSS.jpg', 'Seremos Cabernet Sauvignon 2018', 100.99, 7, 'Vinho meio seco gosto refinado para apreciadores d', 0),
	(75, '/img/vinhocabernetSE.jpg', 'Secreto Eterno Cabernet Sauvignon 2018', 120.99, 7, 'Este exemplar mescla a Cabernet Sauvignon com uma ', 0),
	(76, '/img/vinhocabernetS.jpg', 'Impetu Cabernet Sauvignon 2018', 70.99, 7, 'Este tinto é elaborado com a Cabernet Sauvignon, u', 0),
	(77, '/img/vinhocabernettoro.jpg', 'Concha y Toro Nuevo Extremo Valle Central Cab', 120.99, 7, 'Produzido pelo renomado grupo Concha y Toro, este ', 0);
/*!40000 ALTER TABLE `produto` ENABLE KEYS */;

-- Copiando estrutura para tabela gourmeet.qrcode
CREATE TABLE IF NOT EXISTS `qrcode` (
  `idQrcode` int(11) NOT NULL AUTO_INCREMENT,
  `img` varchar(70) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idQrcode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela gourmeet.qrcode: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `qrcode` DISABLE KEYS */;
/*!40000 ALTER TABLE `qrcode` ENABLE KEYS */;

-- Copiando estrutura para tabela gourmeet.usuario
CREATE TABLE IF NOT EXISTS `usuario` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(50) DEFAULT NULL,
  `nome` varchar(50) DEFAULT NULL,
  `senha` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela gourmeet.usuario: ~3 rows (aproximadamente)
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` (`id`, `email`, `nome`, `senha`) VALUES
	(1, 'dudu@senai.br', 'Dudu', '57a28dbfb65685d05aba506ff9728f85'),
	(2, 'geromel@senai.br', 'Geromel', '57a28dbfb65685d05aba506ff9728f85'),
	(3, 'cebolinha@gmail.com', 'Cebolinha', '57a28dbfb65685d05aba506ff9728f85');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
