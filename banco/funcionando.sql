-- --------------------------------------------------------
-- Servidor:                     127.0.0.1
-- Versão do servidor:           10.3.16-MariaDB - mariadb.org binary distribution
-- OS do Servidor:               Win64
-- HeidiSQL Versão:              10.2.0.5599
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Copiando estrutura do banco de dados para mydb
CREATE DATABASE IF NOT EXISTS `mydb` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `mydb`;

-- Copiando estrutura para tabela mydb.categoria
CREATE TABLE IF NOT EXISTS `categoria` (
  `idCategoria` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nomeCategoria` varchar(45) NOT NULL,
  PRIMARY KEY (`idCategoria`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela mydb.categoria: ~9 rows (aproximadamente)
/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;
INSERT IGNORE INTO `categoria` (`idCategoria`, `nomeCategoria`) VALUES
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
	(11, 'pizza');
/*!40000 ALTER TABLE `categoria` ENABLE KEYS */;

-- Copiando estrutura para tabela mydb.produto
CREATE TABLE IF NOT EXISTS `produto` (
  `idProduto` int(11) NOT NULL AUTO_INCREMENT,
  `imgProduto` varchar(45) NOT NULL,
  `nomeProduto` varchar(45) NOT NULL,
  `precoProduto` varchar(45) NOT NULL,
  `idCategoria` int(10) unsigned NOT NULL,
  `descProduto` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`idProduto`,`idCategoria`),
  KEY `fk_produto_categoria_idx` (`idCategoria`),
  CONSTRAINT `fk_produto_categoria` FOREIGN KEY (`idCategoria`) REFERENCES `categoria` (`idCategoria`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=78 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela mydb.produto: ~76 rows (aproximadamente)
/*!40000 ALTER TABLE `produto` DISABLE KEYS */;
INSERT IGNORE INTO `produto` (`idProduto`, `imgProduto`, `nomeProduto`, `precoProduto`, `idCategoria`, `descProduto`) VALUES
	(2, '/img/pizzacalabreza.jpg', 'Pizza de Calabresa', '39,99', 11, 'Deliciosa pizza de calabresa com acompanhamentos a'),
	(3, '/img/pizzaqueijo.jpg', 'Pizza de Queijo', '39,99', 11, 'Deliciosa pizza de queijo com acompanhamentos'),
	(4, '/img/pizzaportuguesa.jpg', 'Pizza Portuguesa', '42,99', 11, 'Deliciosa pizza portuguesa com acompanhamentos por'),
	(5, '/img/pizzamilana.jpg', 'Pizza Milana', '42,99', 11, 'Deliciosa pizza milana com acompanhamentos italian'),
	(6, '/img/frango.jpg', 'Pizza de Frango ', '39,99', 11, 'Deliciosa pizza milana com acompanhamentos italian'),
	(7, '/img/frangocomcatupiry.jpg', 'Pizza de Frango Com Catupiry ', '41,99', 11, 'Deliciosa pizza de mussarela com acompanhamentos i'),
	(8, '/img/alhoeoleo.jpg', 'Pizza de Alho e óleo ', '41,99', 11, 'Deliciosa pizza de Alho e óleo com acompanhamentos'),
	(9, '/img/bacon.jpg', 'Pizza de Bacon', '39,99', 11, 'Deliciosa pizza de Bacon com acompanhamentos itali'),
	(10, '/img/mussarela.jpg', 'Pizza de Mussarela', '39,99', 11, 'Deliciosa pizza de Mussarela com catupiry com acom'),
	(11, '/img/pizzacamarão.jpg', 'Pizza de Camarão', '45,99', 11, 'Deliciosa pizza de Camarão com acompanhamentos ita'),
	(12, '/img/pizzasorvete.jpg', 'Pizza de Sorvete', '43,99', 11, 'Deliciosa pizza de Sorvete com acompanhamentos ita'),
	(13, '/img/pizzabrigadeiro.jpg', 'Pizza de Brigadeiro', '36,99', 11, 'Deliciosa pizza de Brigadeiro com acompanhamentos '),
	(14, '/img/banananevada.jpg', 'Pizza de Banana Nevada', '37,99', 11, 'Deliciosa pizza de Banana Nevada com acompanhament'),
	(15, '/img/canelone.jpg', 'Canelone de Presunto e Queijo', '29,99', 1, 'Saborosa massa Canelone de presunto e queijo com t'),
	(16, '/img/lasanhafrango.jpg', 'Lasanha de Frango', '29,99', 1, 'Saborosa Lasanha de frango com toques do chef'),
	(17, '/img/lasanhabolanhesa.jpg', 'Lasanha Bolanhesa', '32,99', 1, 'Saborosa Lasanha Bolanhesa com toques do chef'),
	(18, '/img/lasanhalegumes.jpg', 'Lasanha de Legumes', '26,99', 1, 'Saborosa Lasanha de Legumes com toques do chef'),
	(19, '/img/nhoque.jpg', 'Nhoque à Bolanhesa ', '29,99', 1, 'Saborosa massa Nhoque à Bolanhesa com toques do ch'),
	(20, '/img/panquecadecarne.jpg', 'Panqueca de Carne ', '23,99', 1, 'Saborosa Panqueca de Carne com toques do chef'),
	(21, '/img/panquecadefrango.jpg', 'Panqueca de Frango', '23,99', 1, 'Saborosa Panqueca de Carne com toques do chef'),
	(22, '/img/macarraooalhoeoleo.jpg', 'Macarrão alho e óleo', '25,99', 1, 'Saboroso Macarrão Alho e óleo com toques do chef'),
	(23, '/img/macarraostrognoffdecarne.jpg', 'Macarrão ao Molho de Strognoff de Carne', '27,99', 1, 'Saboroso Macarrão ao molho de Strognoff de Carne c'),
	(24, '/img/macarraostrognoffdefrango.jpg', 'Macarrão ao Molho de Strognoff de Frango', '26,99', 1, 'Saboroso Macarrão ao molho de Strognoff de Frango '),
	(25, '/img/macarraocarbonara.jpg', 'Macarrão à Carbonara ', '26,99', 1, 'Saboroso Macarrão Alho e óleo com toques do chef'),
	(26, '/img/macarraobolanhesa.jpg', 'Macarrão à Bolanhesa', '27,99', 1, 'Saboroso Macarrão Alho e óleo com toques do chef'),
	(27, '/img/espaguetecommolhodetomate.jpg', 'Espaguete com Molho de Tomate ', '24,99', 1, 'Saboroso Espaguete com Molho de Tomate com toques '),
	(28, '/img/espagueteaomolhodequeijo.jpg', 'Espaguete ao Molho de Queijo ', '24,99', 1, 'Saboroso Espaguete com Molho de Queijo com toques '),
	(29, '/img/fritas.jpg', 'Fritas', '23,99', 2, 'Apetitioso petisco de fritas'),
	(30, '/img/polentafrita.jpg', 'Polenta Frita', '23,99', 2, 'Apetitioso petisco de Polenta Frita'),
	(31, '/img/frango.jpg', 'Frango', '25,99', 2, 'Apetitioso petisco de Frango'),
	(32, '/img/calabresa.jpg', 'Calabresa', '23,99', 2, 'Apetitioso petisco de Calabresa'),
	(33, '/img/alcatra.jpg', 'Alcatra ', '27,99', 2, 'Apetitioso petisco de Alcatra'),
	(34, '/img/polentacomfritas.jpg', 'Polenta com Fritas', '28,99', 2, 'Apetitioso petisco de Polenta com fritas '),
	(35, '/img/camarao.jpg', 'Camarãoo', '31,99', 2, 'Apetitioso petisco de Camarão'),
	(36, '/img/coracao.jpg', 'Coraçãoo', '26,99', 2, 'Apetitioso petisco de Coração'),
	(37, '/img/iscasdepeixe.jpg', 'Iscas de Peixe ', '26,99', 2, 'Apetitioso petisco de Iscas de Peixe'),
	(38, '/img/aneisdecebola.jpg', 'Anéis de cebola', '22,99', 2, 'Apetitioso petisco de Anéis de cebola'),
	(39, '/img/frangocomfritas.jpg', 'Frango com Fritas', '32,99', 2, 'Apetitioso petisco de Frango com Fritas'),
	(40, '/img/calabresacomfritas.jpg', 'Calabresa com Fritas', '32,99', 2, 'Apetitioso petisco de Calabresa com Fritas'),
	(41, '/img/coraçãocomfritas.jpg', 'Coração com Fritas', '31,99', 2, 'Apetitioso petisco de Coração com Fritas'),
	(42, '/img/alcatracomfritasecalabresa.jpg', 'Alcatra com Fritas e Calabresa', '36,99', 2, 'Apetitioso petisco de Alcatra com Fritas e Calabre'),
	(43, '/img/fraldinhaaomolhodecerveja.jpg', 'Fraldinha ao Molho De Cerveja ', '45,99', 3, 'Deliciosa Fraldinha ao molho de Cerveja '),
	(44, '/img/costelaassada.jpg', 'Costela assada com batata e tomate', '45,99', 3, 'Deliciosa Costela assada com batata e tomate '),
	(45, '/img/costelarecheda.jpg', 'Costela Recheda com Farofa ', '43,99', 3, 'Deliciosa Costela recheada com Farofa'),
	(46, '/img/costelinhasuinacommolhobarbecue.jpg', 'Costelinha suína com molho barbecue e batatas', '41,99', 3, 'Deliciosa Costelinha suina com molho barbecue e ba'),
	(47, '/img/costelinhaassadanacerveja.jpg', 'Costelinha assada na Cerveja', '40,99', 3, 'Deliciosa Costelinha assada na cerveja '),
	(48, '/img/pernilassadonacerveja.jpg', 'Pernil assado na cerveja preta com farofa ', '42,99', 3, 'Delicioso Pernil assado cerveja preta com farofa d'),
	(49, '/img/lompoencapado.jpg', ' Lombo encapado com bacon e farofa', '42,99', 3, 'Delicioso Lombo encapado com bacon e farofa'),
	(50, '/img/picanharecheada.jpg', 'Picanha recheada com queijo', '53,99', 3, 'Deliciosa Costela recheada com Farofa'),
	(51, '/img/frangoassado.jpg', 'Frango assado recheado com farofa', '39,99', 3, 'Deliciosa Costela recheada com Farofa'),
	(52, '/img/peixeassado.jpg', 'Peixe assado com batata-doce', '42,99', 3, 'Deliciosa Costela recheada com Farofa'),
	(53, '/img/hamburguer.jpg', 'Hamburguer ', '14,99', 4, 'Pão, hambúrguer, alface, tomate, milho e batata pa'),
	(54, '/img/x-burguer.jpg', 'X-Burguer ', '17,99', 4, 'Pão, hamburguer, queijo, alface, tomate, milho e b'),
	(55, '/img/x-bacon.jpg', 'X-Bacon', '18,99', 4, 'Pão, hambúrguer, presunto, queijo, bacon, alface, '),
	(56, '/img/x-picanha.jpg', 'X-Picanha', '21,99', 4, 'Pão, hambúrguer de picanha 120 g, queijo, alface, '),
	(57, '/img/x-calabresa.jpg', 'X-Calabresa', '19,99', 4, 'Pão, calabresa, queijo, presunto, alface, tomate, '),
	(58, '/img x-frango.jpg', 'X-Frango', '18,99', 4, 'Pão, frango, queijo, presunto, alface, tomate, mil'),
	(59, '/img/x-egg.jpg', 'X-EGG', '14,99', 4, 'Pão, ovo, queijo, presunto, alface, tomate, milho '),
	(60, '/img/hamburguerartesanal.jpg', 'Hamburguer artesanal ao molho de cerveja ', '24,99', 4, 'Pão, hamburguer artesanal, queijo, alface, tomate '),
	(61, '/img/hamburguerartesanalbacon.jpg', 'Hamburguer artesanal com bacon ao molho de ce', '28,99', 4, 'Pão, hamburguer artesanal, queijo, bacon, alface, '),
	(62, '/img/hamburguerdacasa.jpg', 'Hamburguer da casa', '26,99', 4, 'Pão, hambúrguer de boi, hambúrguer de frango, ovo,'),
	(63, '/img/tortinhadefrango.jpg', 'Tortinha de frango com brócolis', '29,99', 5, 'Deliciosa torta de frango com brócolis fitness'),
	(64, '/img/escondidinhodefrango.jpg', 'Escondidinho de frango com batata doce', '38,99', 5, 'Delicioso escondidinho de frango com batata doce f'),
	(65, '/img/omelete.jpg', 'Omelete de legumes ', '25,99', 5, 'Delicioso omelete de legumes ftness'),
	(66, '/img/sanduiche.jpg', 'Sanduíche de atum ', '19,99', 5, 'Delicios sanduíche de atum fitness'),
	(67, '/img/saladadefrango.jpg', 'Salada de frango ', '19,99', 5, 'Deliciosa salada de frango fitness'),
	(68, '/img/petitgateau.jpg', 'Petit Gateau', '34,99', 6, 'Saborosa sobremesa Petit Gateau'),
	(69, '/img/tortademorango.jpg', 'Torta de morango recheada com cream cheese', '26,99', 6, 'Saborosa sobremesa Torta de morango recheada com c'),
	(70, '/img/crepecomdocedeleite.jpg', 'Crepe com doce de leite e morango', '24,99', 6, 'Saborosa sobremesa Crepe com doce de leite e moran'),
	(71, '/img/moussedelaranja.jpg', 'Mousse de laranja e acerola', '23,99', 6, 'Saborosa sobremesa Mousse de laranja e acerola'),
	(72, '/img/moussedechocolate.jpg', 'Mousse de chocolate ao gengibre', '23,99', 6, 'Saborosa sobremesa Mousse de chocolate ao gengibre'),
	(73, '/img/vinhomaiscaro.jpg', 'Domaine de la Romanée-Conti Romanée-Conti Gra', '296.879,40', 7, 'O vinho mais caro que a casa oferece, já ganho inu'),
	(74, '/img/vinhocabernetSS.jpg', 'Seremos Cabernet Sauvignon 2018', '100', 7, 'Vinho meio seco gosto refinado para apreciadores d'),
	(75, '/img/vinhocabernetSE.jpg', 'Secreto Eterno Cabernet Sauvignon 2018', '120', 7, 'Este exemplar mescla a Cabernet Sauvignon com uma '),
	(76, '/img/vinhocabernetS.jpg', 'Impetu Cabernet Sauvignon 2018', '70', 7, 'Este tinto é elaborado com a Cabernet Sauvignon, u'),
	(77, '/img/vinhocabernettoro.jpg', 'Concha y Toro Nuevo Extremo Valle Central Cab', '120', 7, 'Produzido pelo renomado grupo Concha y Toro, este ');
/*!40000 ALTER TABLE `produto` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
