SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`tb_cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`tb_cliente` (
  `Nome_pessoa` VARCHAR(45) NOT NULL,
  `CPF_pessoa` INT NOT NULL,
  `RG_pessoa` VARCHAR(25) NOT NULL,
  `email_pessoa` VARCHAR(45) NULL,
  `Cidade_pessoa` VARCHAR(45) NOT NULL,
  `Estado_pessoa` VARCHAR(25) NOT NULL,
  `CEP` VARCHAR(10) NOT NULL,
  `Fone_pessoa` VARCHAR(12) NULL,
  `Celular_pessoa` VARCHAR(12) NULL,
  `sexo_pessoa` BINARY NOT NULL,
  `nascimento_pessoa` DATETIME NOT NULL,
  `endereco_pessoa` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`CPF_pessoa`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`tb_Cor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`tb_Cor` (
  `Tipo_cor` VARCHAR(20) NOT NULL,
  `Descricao_cor` VARCHAR(25) NOT NULL,
  PRIMARY KEY (`Descricao_cor`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`tb_Marca`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`tb_Marca` (
  `cod_marca` INT NOT NULL AUTO_INCREMENT,
  `Descricao_marca` VARCHAR(30) NOT NULL,
  PRIMARY KEY (`cod_marca`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`tb_modelo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`tb_modelo` (
  `categoia_modelo` INT NOT NULL,
  `tipo_modelo` VARCHAR(25) NOT NULL,
  `combutivel` VARCHAR(20) NOT NULL,
  `descricao` VARCHAR(45) NOT NULL,
  `ano_modelo` VARCHAR(9) NOT NULL,
  `tb_Marca_cod_marca` INT NOT NULL,
  PRIMARY KEY (`descricao`),
  INDEX `fk_tb_modelo_tb_Marca1_idx` (`tb_Marca_cod_marca` ASC),
  CONSTRAINT `fk_tb_modelo_tb_Marca1`
    FOREIGN KEY (`tb_Marca_cod_marca`)
    REFERENCES `mydb`.`tb_Marca` (`cod_marca`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`tb_concessionaria`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`tb_concessionaria` (
  `id_concessionaria` INT NOT NULL AUTO_INCREMENT,
  `nome_concessionaria` VARCHAR(45) NOT NULL,
  `endereco_concessionaria` VARCHAR(45) NOT NULL,
  `cidade_concessionaria` VARCHAR(45) NOT NULL,
  `estado_concessionaria` VARCHAR(20) NOT NULL,
  `cep_concessionaria` VARCHAR(9) NOT NULL,
  PRIMARY KEY (`id_concessionaria`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`tb_veiculo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`tb_veiculo` (
  `Placa` VARCHAR(7) NOT NULL,
  `Chassi` VARCHAR(45) NOT NULL,
  `tb_modelo_descricao` VARCHAR(45) NOT NULL,
  `tb_Cor_Descricao_cor` VARCHAR(25) NOT NULL,
  `valor_veiculo` DOUBLE NOT NULL,
  `tb_concessionaria_id_concessionaria` INT NOT NULL,
  PRIMARY KEY (`Placa`),
  INDEX `fk_tb_veiculo_tb_modelo1_idx` (`tb_modelo_descricao` ASC),
  INDEX `fk_tb_veiculo_tb_Cor1_idx` (`tb_Cor_Descricao_cor` ASC),
  INDEX `fk_tb_veiculo_tb_concessionaria1_idx` (`tb_concessionaria_id_concessionaria` ASC),
  CONSTRAINT `fk_tb_veiculo_tb_modelo1`
    FOREIGN KEY (`tb_modelo_descricao`)
    REFERENCES `mydb`.`tb_modelo` (`descricao`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tb_veiculo_tb_Cor1`
    FOREIGN KEY (`tb_Cor_Descricao_cor`)
    REFERENCES `mydb`.`tb_Cor` (`Descricao_cor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tb_veiculo_tb_concessionaria1`
    FOREIGN KEY (`tb_concessionaria_id_concessionaria`)
    REFERENCES `mydb`.`tb_concessionaria` (`id_concessionaria`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`tb_funcionario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`tb_funcionario` (
  `matricula` INT NOT NULL,
  `tb_pessoa_CPF_pessoa` INT NOT NULL,
  `tb_Usuario_login` VARCHAR(15) NOT NULL,
  `senha` VARCHAR(45) NOT NULL,
  `tb_concessionaria_id_concessionaria` INT NOT NULL,
  PRIMARY KEY (`matricula`),
  INDEX `fk_tb_funcionario_tb_pessoa1_idx` (`tb_pessoa_CPF_pessoa` ASC),
  INDEX `fk_tb_funcionario_tb_concessionaria1_idx` (`tb_concessionaria_id_concessionaria` ASC),
  CONSTRAINT `fk_tb_funcionario_tb_pessoa1`
    FOREIGN KEY (`tb_pessoa_CPF_pessoa`)
    REFERENCES `mydb`.`tb_cliente` (`CPF_pessoa`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tb_funcionario_tb_concessionaria1`
    FOREIGN KEY (`tb_concessionaria_id_concessionaria`)
    REFERENCES `mydb`.`tb_concessionaria` (`id_concessionaria`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`tb_negociacao`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`tb_negociacao` (
  `cod_negociacao` INT NOT NULL AUTO_INCREMENT,
  `valor_negociacao` DOUBLE NOT NULL,
  `tb_cliente_Cod_cliente` INT NOT NULL,
  `tb_funcionario_matricula` INT NOT NULL,
  `tb_pessoa_CPF_pessoa` INT NOT NULL,
  `status_negociacao` VARCHAR(10) NULL,
  `data_negociacao` DATETIME NULL,
  PRIMARY KEY (`cod_negociacao`),
  INDEX `fk_tb_negociacao_tb_funcionario1_idx` (`tb_funcionario_matricula` ASC),
  INDEX `fk_tb_negociacao_tb_pessoa1_idx` (`tb_pessoa_CPF_pessoa` ASC),
  CONSTRAINT `fk_tb_negociacao_tb_funcionario1`
    FOREIGN KEY (`tb_funcionario_matricula`)
    REFERENCES `mydb`.`tb_funcionario` (`matricula`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tb_negociacao_tb_pessoa1`
    FOREIGN KEY (`tb_pessoa_CPF_pessoa`)
    REFERENCES `mydb`.`tb_cliente` (`CPF_pessoa`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Tb_compra`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Tb_compra` (
  `Codigo_compra` INT NOT NULL AUTO_INCREMENT,
  `tb_negociacao_cod_negociacao` INT NOT NULL,
  PRIMARY KEY (`Codigo_compra`, `tb_negociacao_cod_negociacao`),
  INDEX `fk_Tb_compra_tb_negociacao1_idx` (`tb_negociacao_cod_negociacao` ASC),
  CONSTRAINT `fk_Tb_compra_tb_negociacao1`
    FOREIGN KEY (`tb_negociacao_cod_negociacao`)
    REFERENCES `mydb`.`tb_negociacao` (`cod_negociacao`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`tb_venda`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`tb_venda` (
  `Codigo_venda` INT NOT NULL AUTO_INCREMENT,
  `tb_negociacao_cod_negociacao` INT NOT NULL,
  PRIMARY KEY (`Codigo_venda`, `tb_negociacao_cod_negociacao`),
  INDEX `fk_tb_venda_tb_negociacao1_idx` (`tb_negociacao_cod_negociacao` ASC),
  CONSTRAINT `fk_tb_venda_tb_negociacao1`
    FOREIGN KEY (`tb_negociacao_cod_negociacao`)
    REFERENCES `mydb`.`tb_negociacao` (`cod_negociacao`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`tb_veiculo_has_tb_negociacao`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`tb_veiculo_has_tb_negociacao` (
  `tb_veiculo_Placa` VARCHAR(7) NOT NULL,
  `tb_negociacao_cod_negociacao` INT NOT NULL,
  `tb_veiculo_has_tb_negociacao_tb_veiculo_Placa` VARCHAR(7) NOT NULL,
  `tb_veiculo_has_tb_negociacao_tb_negociacao_cod_negociacao` INT NOT NULL,
  PRIMARY KEY (`tb_veiculo_Placa`, `tb_negociacao_cod_negociacao`),
  INDEX `fk_tb_veiculo_has_tb_negociacao_tb_negociacao1_idx` (`tb_negociacao_cod_negociacao` ASC),
  INDEX `fk_tb_veiculo_has_tb_negociacao_tb_veiculo1_idx` (`tb_veiculo_Placa` ASC),
  INDEX `fk_tb_veiculo_has_tb_negociacao_tb_veiculo_has_tb_negociaca_idx` (`tb_veiculo_has_tb_negociacao_tb_veiculo_Placa` ASC, `tb_veiculo_has_tb_negociacao_tb_negociacao_cod_negociacao` ASC),
  CONSTRAINT `fk_tb_veiculo_has_tb_negociacao_tb_veiculo1`
    FOREIGN KEY (`tb_veiculo_Placa`)
    REFERENCES `mydb`.`tb_veiculo` (`Placa`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tb_veiculo_has_tb_negociacao_tb_negociacao1`
    FOREIGN KEY (`tb_negociacao_cod_negociacao`)
    REFERENCES `mydb`.`tb_negociacao` (`cod_negociacao`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tb_veiculo_has_tb_negociacao_tb_veiculo_has_tb_negociacao1`
    FOREIGN KEY (`tb_veiculo_has_tb_negociacao_tb_veiculo_Placa` , `tb_veiculo_has_tb_negociacao_tb_negociacao_cod_negociacao`)
    REFERENCES `mydb`.`tb_veiculo_has_tb_negociacao` (`tb_veiculo_Placa` , `tb_negociacao_cod_negociacao`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`tb_cliente_has_tb_concessionaria`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`tb_cliente_has_tb_concessionaria` (
  `tb_cliente_CPF_pessoa` INT NOT NULL,
  `tb_concessionaria_id_concessionaria` INT NOT NULL,
  PRIMARY KEY (`tb_cliente_CPF_pessoa`, `tb_concessionaria_id_concessionaria`),
  INDEX `fk_tb_cliente_has_tb_concessionaria_tb_concessionaria1_idx` (`tb_concessionaria_id_concessionaria` ASC),
  INDEX `fk_tb_cliente_has_tb_concessionaria_tb_cliente1_idx` (`tb_cliente_CPF_pessoa` ASC),
  CONSTRAINT `fk_tb_cliente_has_tb_concessionaria_tb_cliente1`
    FOREIGN KEY (`tb_cliente_CPF_pessoa`)
    REFERENCES `mydb`.`tb_cliente` (`CPF_pessoa`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tb_cliente_has_tb_concessionaria_tb_concessionaria1`
    FOREIGN KEY (`tb_concessionaria_id_concessionaria`)
    REFERENCES `mydb`.`tb_concessionaria` (`id_concessionaria`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
