-- phpMyAdmin SQL Dump
-- version 4.2.11
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 12-Fev-2015 às 11:51
-- Versão do servidor: 5.6.21
-- PHP Version: 5.6.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `mydb`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `negociacao_veic`
--

CREATE TABLE IF NOT EXISTS `negociacao_veic` (
  `placa_veic` varchar(7) DEFAULT NULL,
  `cod_neg` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `negociacao_veic`
--

INSERT INTO `negociacao_veic` (`placa_veic`, `cod_neg`) VALUES
('HZN8745', 6),
('IAA6677', 9);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_cliente`
--

CREATE TABLE IF NOT EXISTS `tb_cliente` (
  `Nome_pessoa` varchar(45) NOT NULL,
  `CPF_pessoa` varchar(11) NOT NULL,
  `RG_pessoa` varchar(25) NOT NULL,
  `email_pessoa` varchar(45) DEFAULT NULL,
  `Cidade_pessoa` varchar(45) NOT NULL,
  `Estado_pessoa` varchar(25) NOT NULL,
  `CEP` varchar(10) NOT NULL,
  `Fone_pessoa` varchar(12) DEFAULT NULL,
  `Celular_pessoa` varchar(12) DEFAULT NULL,
  `sexo_pessoa` varchar(1) NOT NULL,
  `nascimento_pessoa` varchar(10) NOT NULL,
  `endereco_pessoa` varchar(45) NOT NULL,
`id_pessoa` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `tb_cliente`
--

INSERT INTO `tb_cliente` (`Nome_pessoa`, `CPF_pessoa`, `RG_pessoa`, `email_pessoa`, `Cidade_pessoa`, `Estado_pessoa`, `CEP`, `Fone_pessoa`, `Celular_pessoa`, `sexo_pessoa`, `nascimento_pessoa`, `endereco_pessoa`, `id_pessoa`) VALUES
('Euder', '05576868579', '221231', NULL, 'Aparecida', 'Sergipe', '93857', NULL, NULL, 'M', '19/09/1994', 'rua a', 1),
('Guilherme', '287364872', '294837', NULL, 'Aracaj', 'Sergipe', '9832475', NULL, NULL, 'M', '19/06/1998', 'rua b', 2),
('Joao', '92873498', '298374', NULL, 'Ribas', 'Sergipe', '032845', NULL, NULL, 'M', '19/07/1995', 'rua c', 3),
('MAria', '0234809283', '298347', NULL, 'Itabaiana', 'Sergipe', '3428579', NULL, NULL, 'F', '18/08/1967', 'rua z', 4),
('Ana', '293874982', '92873', NULL, 'Socorro', 'Sergipe', '3984759', NULL, NULL, 'F', '16/09/1970', 'rua e', 5);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_cliente_has_tb_concessionaria`
--

CREATE TABLE IF NOT EXISTS `tb_cliente_has_tb_concessionaria` (
  `tb_concessionaria_id_concessionaria` int(11) NOT NULL,
  `tb_cliente_id_pessoa` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `tb_cliente_has_tb_concessionaria`
--

INSERT INTO `tb_cliente_has_tb_concessionaria` (`tb_concessionaria_id_concessionaria`, `tb_cliente_id_pessoa`) VALUES
(1, 1),
(1, 2),
(1, 3),
(1, 4),
(1, 5);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_compra`
--

CREATE TABLE IF NOT EXISTS `tb_compra` (
`cod_compra` int(11) NOT NULL,
  `tb_negociacao_cod_negociacao` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `tb_compra`
--

INSERT INTO `tb_compra` (`cod_compra`, `tb_negociacao_cod_negociacao`) VALUES
(1, 6),
(2, 9);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_concessionaria`
--

CREATE TABLE IF NOT EXISTS `tb_concessionaria` (
`id_concessionaria` int(11) NOT NULL,
  `nome_concessionaria` varchar(45) NOT NULL,
  `endereco_concessionaria` varchar(45) NOT NULL,
  `cidade_concessionaria` varchar(45) NOT NULL,
  `estado_concessionaria` varchar(20) NOT NULL,
  `cep_concessionaria` varchar(9) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `tb_concessionaria`
--

INSERT INTO `tb_concessionaria` (`id_concessionaria`, `nome_concessionaria`, `endereco_concessionaria`, `cidade_concessionaria`, `estado_concessionaria`, `cep_concessionaria`) VALUES
(1, 'Acesso Veiculos', 'rua joao ', 'Aracaju', 'Sergipe', '3984759');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_cor`
--

CREATE TABLE IF NOT EXISTS `tb_cor` (
  `Tipo_cor` varchar(20) NOT NULL,
  `Descricao_cor` varchar(25) NOT NULL,
`id_cor` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `tb_cor`
--

INSERT INTO `tb_cor` (`Tipo_cor`, `Descricao_cor`, `id_cor`) VALUES
('Metalica', 'Vermelho', 1),
('Metalica', 'Prata', 2),
('Comum', 'Branco', 3);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_funcionario`
--

CREATE TABLE IF NOT EXISTS `tb_funcionario` (
`matricula` int(11) NOT NULL,
  `tb_Usuario_login` varchar(15) NOT NULL,
  `senha` varchar(45) NOT NULL,
  `tb_concessionaria_id_concessionaria` int(11) NOT NULL,
  `tb_cliente_CPF_pessoa` varchar(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `tb_funcionario`
--

INSERT INTO `tb_funcionario` (`matricula`, `tb_Usuario_login`, `senha`, `tb_concessionaria_id_concessionaria`, `tb_cliente_CPF_pessoa`) VALUES
(3, 'euder', '123', 1, '05576868579');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_marca`
--

CREATE TABLE IF NOT EXISTS `tb_marca` (
`id_marca` int(11) NOT NULL,
  `Descricao_marca` varchar(30) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `tb_marca`
--

INSERT INTO `tb_marca` (`id_marca`, `Descricao_marca`) VALUES
(1, 'GM'),
(2, 'Fiat'),
(3, 'AUDI');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_modelo`
--

CREATE TABLE IF NOT EXISTS `tb_modelo` (
  `categoia_modelo` int(11) NOT NULL,
  `tipo_modelo` varchar(25) NOT NULL,
  `combutivel` varchar(20) NOT NULL,
  `descricao` varchar(45) NOT NULL,
  `ano_modelo` varchar(9) NOT NULL,
`id_modelo` int(11) NOT NULL,
  `tb_Marca_id_marca` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `tb_modelo`
--

INSERT INTO `tb_modelo` (`categoia_modelo`, `tipo_modelo`, `combutivel`, `descricao`, `ano_modelo`, `id_modelo`, `tb_Marca_id_marca`) VALUES
(1, 'NAcional', 'gasolina', 'corsa', '2013', 1, 1),
(1, 'Importado', 'gasolina', 'Ferrari', '2014', 2, 3),
(1, 'NAcional', 'alcool', 'Vectra', '2010', 5, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_negociacao`
--

CREATE TABLE IF NOT EXISTS `tb_negociacao` (
`cod_negociacao` int(11) NOT NULL,
  `valor_negociacao` double NOT NULL,
  `tb_funcionario_matricula` int(11) NOT NULL,
  `status_negociacao` varchar(10) DEFAULT NULL,
  `data_negociacao` datetime DEFAULT NULL,
  `tb_cliente_CPF_pessoa` varchar(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `tb_negociacao`
--

INSERT INTO `tb_negociacao` (`cod_negociacao`, `valor_negociacao`, `tb_funcionario_matricula`, `status_negociacao`, `data_negociacao`, `tb_cliente_CPF_pessoa`) VALUES
(6, 40000, 3, 'Pendente', '2015-02-11 10:01:52', '287364872'),
(9, 30000, 3, 'Concluida', '2015-02-11 11:15:42', '0234809283');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_veiculo`
--

CREATE TABLE IF NOT EXISTS `tb_veiculo` (
  `Placa` varchar(7) NOT NULL,
  `Chassi` varchar(45) NOT NULL,
  `valor_veiculo` double NOT NULL,
  `tb_concessionaria_id_concessionaria` int(11) NOT NULL,
  `tb_modelo_id_modelo` int(11) NOT NULL,
  `tb_Cor_id_cor` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `tb_veiculo`
--

INSERT INTO `tb_veiculo` (`Placa`, `Chassi`, `valor_veiculo`, `tb_concessionaria_id_concessionaria`, `tb_modelo_id_modelo`, `tb_Cor_id_cor`) VALUES
('HZN8745', '9s8f7s897f', 12345, 1, 1, 1),
('IAA6677', '9sd76f98sd', 1000000, 1, 2, 2),
('IAA8899', 's98df7s98df7', 60000, 1, 5, 3);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_venda`
--

CREATE TABLE IF NOT EXISTS `tb_venda` (
`cod_venda` int(11) NOT NULL,
  `tb_negociacao_cod_negociacao` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `tb_venda`
--

INSERT INTO `tb_venda` (`cod_venda`, `tb_negociacao_cod_negociacao`) VALUES
(1, 9);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `negociacao_veic`
--
ALTER TABLE `negociacao_veic`
 ADD KEY `ve_fk` (`placa_veic`), ADD KEY `ne_fk` (`cod_neg`);

--
-- Indexes for table `tb_cliente`
--
ALTER TABLE `tb_cliente`
 ADD PRIMARY KEY (`id_pessoa`), ADD UNIQUE KEY `CPF_pessoa_UNIQUE` (`CPF_pessoa`);

--
-- Indexes for table `tb_cliente_has_tb_concessionaria`
--
ALTER TABLE `tb_cliente_has_tb_concessionaria`
 ADD PRIMARY KEY (`tb_concessionaria_id_concessionaria`,`tb_cliente_id_pessoa`), ADD KEY `fk_tb_cliente_has_tb_concessionaria_tb_concessionaria1_idx` (`tb_concessionaria_id_concessionaria`), ADD KEY `fk_tb_cliente_has_tb_concessionaria_tb_cliente1_idx` (`tb_cliente_id_pessoa`);

--
-- Indexes for table `tb_compra`
--
ALTER TABLE `tb_compra`
 ADD PRIMARY KEY (`cod_compra`,`tb_negociacao_cod_negociacao`), ADD KEY `fk_Tb_compra_tb_negociacao1_idx` (`tb_negociacao_cod_negociacao`);

--
-- Indexes for table `tb_concessionaria`
--
ALTER TABLE `tb_concessionaria`
 ADD PRIMARY KEY (`id_concessionaria`);

--
-- Indexes for table `tb_cor`
--
ALTER TABLE `tb_cor`
 ADD PRIMARY KEY (`id_cor`);

--
-- Indexes for table `tb_funcionario`
--
ALTER TABLE `tb_funcionario`
 ADD PRIMARY KEY (`matricula`), ADD KEY `fk_tb_funcionario_tb_concessionaria1_idx` (`tb_concessionaria_id_concessionaria`), ADD KEY `fk_tb_funcionario_tb_cliente1_idx` (`tb_cliente_CPF_pessoa`);

--
-- Indexes for table `tb_marca`
--
ALTER TABLE `tb_marca`
 ADD PRIMARY KEY (`id_marca`);

--
-- Indexes for table `tb_modelo`
--
ALTER TABLE `tb_modelo`
 ADD PRIMARY KEY (`id_modelo`), ADD KEY `fk_tb_modelo_tb_Marca1_idx` (`tb_Marca_id_marca`);

--
-- Indexes for table `tb_negociacao`
--
ALTER TABLE `tb_negociacao`
 ADD PRIMARY KEY (`cod_negociacao`), ADD KEY `fk_tb_negociacao_tb_funcionario1_idx` (`tb_funcionario_matricula`), ADD KEY `fk_tb_negociacao_tb_cliente1_idx` (`tb_cliente_CPF_pessoa`);

--
-- Indexes for table `tb_veiculo`
--
ALTER TABLE `tb_veiculo`
 ADD PRIMARY KEY (`Placa`), ADD KEY `fk_tb_veiculo_tb_concessionaria1_idx` (`tb_concessionaria_id_concessionaria`), ADD KEY `fk_tb_veiculo_tb_modelo1_idx` (`tb_modelo_id_modelo`), ADD KEY `fk_tb_veiculo_tb_Cor1_idx` (`tb_Cor_id_cor`);

--
-- Indexes for table `tb_venda`
--
ALTER TABLE `tb_venda`
 ADD PRIMARY KEY (`cod_venda`,`tb_negociacao_cod_negociacao`), ADD KEY `fk_tb_venda_tb_negociacao1_idx` (`tb_negociacao_cod_negociacao`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tb_cliente`
--
ALTER TABLE `tb_cliente`
MODIFY `id_pessoa` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `tb_compra`
--
ALTER TABLE `tb_compra`
MODIFY `cod_compra` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `tb_concessionaria`
--
ALTER TABLE `tb_concessionaria`
MODIFY `id_concessionaria` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `tb_cor`
--
ALTER TABLE `tb_cor`
MODIFY `id_cor` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `tb_funcionario`
--
ALTER TABLE `tb_funcionario`
MODIFY `matricula` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `tb_marca`
--
ALTER TABLE `tb_marca`
MODIFY `id_marca` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `tb_modelo`
--
ALTER TABLE `tb_modelo`
MODIFY `id_modelo` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `tb_negociacao`
--
ALTER TABLE `tb_negociacao`
MODIFY `cod_negociacao` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `tb_venda`
--
ALTER TABLE `tb_venda`
MODIFY `cod_venda` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- Constraints for dumped tables
--

--
-- Limitadores para a tabela `negociacao_veic`
--
ALTER TABLE `negociacao_veic`
ADD CONSTRAINT `negociacao_veic_ibfk_1` FOREIGN KEY (`placa_veic`) REFERENCES `tb_veiculo` (`Placa`),
ADD CONSTRAINT `negociacao_veic_ibfk_2` FOREIGN KEY (`cod_neg`) REFERENCES `tb_negociacao` (`cod_negociacao`);

--
-- Limitadores para a tabela `tb_cliente_has_tb_concessionaria`
--
ALTER TABLE `tb_cliente_has_tb_concessionaria`
ADD CONSTRAINT `fk_tb_cliente_has_tb_concessionaria_tb_cliente1` FOREIGN KEY (`tb_cliente_id_pessoa`) REFERENCES `tb_cliente` (`id_pessoa`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_tb_cliente_has_tb_concessionaria_tb_concessionaria1` FOREIGN KEY (`tb_concessionaria_id_concessionaria`) REFERENCES `tb_concessionaria` (`id_concessionaria`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `tb_compra`
--
ALTER TABLE `tb_compra`
ADD CONSTRAINT `fk_Tb_compra_tb_negociacao1` FOREIGN KEY (`tb_negociacao_cod_negociacao`) REFERENCES `tb_negociacao` (`cod_negociacao`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `tb_funcionario`
--
ALTER TABLE `tb_funcionario`
ADD CONSTRAINT `fk_tb_funcionario_tb_cliente1` FOREIGN KEY (`tb_cliente_CPF_pessoa`) REFERENCES `tb_cliente` (`CPF_pessoa`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_tb_funcionario_tb_concessionaria1` FOREIGN KEY (`tb_concessionaria_id_concessionaria`) REFERENCES `tb_concessionaria` (`id_concessionaria`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `tb_modelo`
--
ALTER TABLE `tb_modelo`
ADD CONSTRAINT `fk_tb_modelo_tb_Marca1` FOREIGN KEY (`tb_Marca_id_marca`) REFERENCES `tb_marca` (`id_marca`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `tb_negociacao`
--
ALTER TABLE `tb_negociacao`
ADD CONSTRAINT `fk_tb_negociacao_tb_cliente1` FOREIGN KEY (`tb_cliente_CPF_pessoa`) REFERENCES `tb_cliente` (`CPF_pessoa`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_tb_negociacao_tb_funcionario1` FOREIGN KEY (`tb_funcionario_matricula`) REFERENCES `tb_funcionario` (`matricula`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `tb_veiculo`
--
ALTER TABLE `tb_veiculo`
ADD CONSTRAINT `fk_tb_veiculo_tb_Cor1` FOREIGN KEY (`tb_Cor_id_cor`) REFERENCES `tb_cor` (`id_cor`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_tb_veiculo_tb_concessionaria1` FOREIGN KEY (`tb_concessionaria_id_concessionaria`) REFERENCES `tb_concessionaria` (`id_concessionaria`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_tb_veiculo_tb_modelo1` FOREIGN KEY (`tb_modelo_id_modelo`) REFERENCES `tb_modelo` (`id_modelo`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `tb_venda`
--
ALTER TABLE `tb_venda`
ADD CONSTRAINT `fk_tb_venda_tb_negociacao1` FOREIGN KEY (`tb_negociacao_cod_negociacao`) REFERENCES `tb_negociacao` (`cod_negociacao`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
