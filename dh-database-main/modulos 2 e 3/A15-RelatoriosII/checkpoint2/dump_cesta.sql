-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema cesta_coletiva
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema cesta_coletiva
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `cesta_coletiva` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `cesta_coletiva` ;

-- -----------------------------------------------------
-- Table `cesta_coletiva`.`redes_varejistas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cesta_coletiva`.`redes_varejistas` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `cnpj` VARCHAR(18) NOT NULL,
  `razao_social` VARCHAR(255) NOT NULL,
  `nome_fantasia` VARCHAR(255) NOT NULL,
  `foto` VARCHAR(150) NULL DEFAULT NULL,
  `nome_representante` VARCHAR(150) NOT NULL,
  `email_representante` VARCHAR(100) NOT NULL,
  `classificacao` TINYINT NULL DEFAULT NULL,
  `observacoes` VARCHAR(150) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 6
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `cesta_coletiva`.`centros_distribuicao`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cesta_coletiva`.`centros_distribuicao` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `varejista_id` INT NOT NULL,
  `cnpj` VARCHAR(18) NOT NULL,
  `razao_social` VARCHAR(255) NOT NULL,
  `nome_fantasia` VARCHAR(255) NOT NULL,
  `foto` VARCHAR(150) NULL DEFAULT NULL,
  `nome_responsavel` VARCHAR(150) NOT NULL,
  `email_responsavel` VARCHAR(100) NOT NULL,
  `horario_ini` TIME NOT NULL,
  `horario_fin` TIME NOT NULL,
  `observacoes` VARCHAR(150) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `varejista_id` (`varejista_id` ASC) VISIBLE,
  CONSTRAINT `centros_distribuicao_ibfk_1`
    FOREIGN KEY (`varejista_id`)
    REFERENCES `cesta_coletiva`.`redes_varejistas` (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 6
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `cesta_coletiva`.`planos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cesta_coletiva`.`planos` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome_plano` VARCHAR(20) NOT NULL,
  `ativo` TINYINT NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `cesta_coletiva`.`clientes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cesta_coletiva`.`clientes` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `plano_id` INT NOT NULL,
  `nome` VARCHAR(20) NOT NULL,
  `sobrenome` VARCHAR(130) NOT NULL,
  `cpf` VARCHAR(11) NOT NULL,
  `rg` VARCHAR(15) NOT NULL,
  `data_nascimento` DATE NOT NULL,
  `telefone1` VARCHAR(20) NULL DEFAULT NULL,
  `telefone2` VARCHAR(20) NULL DEFAULT NULL,
  `email` VARCHAR(100) NULL DEFAULT NULL,
  `observacoes` VARCHAR(150) NULL DEFAULT NULL,
  `login` VARCHAR(50) NOT NULL,
  `senha` VARCHAR(8) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `plano_id` (`plano_id` ASC) VISIBLE,
  CONSTRAINT `clientes_ibfk_1`
    FOREIGN KEY (`plano_id`)
    REFERENCES `cesta_coletiva`.`planos` (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 7
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `cesta_coletiva`.`enderecos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cesta_coletiva`.`enderecos` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `cliente_id` INT NOT NULL,
  `endereco` VARCHAR(150) NOT NULL,
  `bairro` VARCHAR(150) NOT NULL,
  `numero` VARCHAR(20) NOT NULL,
  `complemento` VARCHAR(150) NULL DEFAULT NULL,
  `cidade` VARCHAR(150) NOT NULL,
  `estado` CHAR(2) NOT NULL,
  `cep` VARCHAR(10) NOT NULL,
  `observacoes` VARCHAR(150) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `cliente_id` (`cliente_id` ASC) VISIBLE,
  CONSTRAINT `enderecos_ibfk_1`
    FOREIGN KEY (`cliente_id`)
    REFERENCES `cesta_coletiva`.`clientes` (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 6
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `cesta_coletiva`.`enderecos_cd`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cesta_coletiva`.`enderecos_cd` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `cd_id` INT NOT NULL,
  `endereco` VARCHAR(150) NOT NULL,
  `numero` VARCHAR(20) NULL DEFAULT NULL,
  `bairro` VARCHAR(150) NOT NULL,
  `cidade` VARCHAR(150) NOT NULL,
  `estado` CHAR(2) NULL DEFAULT NULL,
  `cep` VARCHAR(10) NULL DEFAULT NULL,
  `observacoes` VARCHAR(150) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `cd_id` (`cd_id` ASC) VISIBLE,
  CONSTRAINT `enderecos_cd_ibfk_1`
    FOREIGN KEY (`cd_id`)
    REFERENCES `cesta_coletiva`.`centros_distribuicao` (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 6
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `cesta_coletiva`.`secoes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cesta_coletiva`.`secoes` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `descricao` VARCHAR(150) NOT NULL,
  `observacoes` VARCHAR(150) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 8
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `cesta_coletiva`.`produtos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cesta_coletiva`.`produtos` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `secao_id` INT NOT NULL,
  `varejista_id` INT NOT NULL,
  `descricao` VARCHAR(150) NOT NULL,
  `cod_barras` VARCHAR(44) NOT NULL,
  `disponibilidade` TINYINT NOT NULL,
  `quantidade` TINYINT NOT NULL,
  `valor_unit` DECIMAL(5,2) NOT NULL,
  `especificacoes` VARCHAR(150) NOT NULL,
  `observacoes` VARCHAR(150) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `secao_id` (`secao_id` ASC) VISIBLE,
  INDEX `varejista_id` (`varejista_id` ASC) VISIBLE,
  CONSTRAINT `produtos_ibfk_1`
    FOREIGN KEY (`secao_id`)
    REFERENCES `cesta_coletiva`.`secoes` (`id`),
  CONSTRAINT `produtos_ibfk_2`
    FOREIGN KEY (`varejista_id`)
    REFERENCES `cesta_coletiva`.`redes_varejistas` (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 8
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `cesta_coletiva`.`tipos_pagamento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cesta_coletiva`.`tipos_pagamento` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `tipo` VARCHAR(20) NOT NULL,
  `ativo` TINYINT NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 5
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `cesta_coletiva`.`pedidos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cesta_coletiva`.`pedidos` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `tipo_pagamento_id` INT NOT NULL,
  `produto_id` INT NOT NULL,
  `cliente_id` INT NOT NULL,
  `endereco_cliente_id` INT NOT NULL,
  `produtos` VARCHAR(150) NOT NULL,
  `valor_frete` DECIMAL(4,2) NOT NULL,
  `valor_pedido` DECIMAL(9,2) NOT NULL,
  `observacoes` VARCHAR(150) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `cliente_id` (`cliente_id` ASC) VISIBLE,
  INDEX `endereco_cliente_id` (`endereco_cliente_id` ASC) VISIBLE,
  INDEX `produto_id` (`produto_id` ASC) VISIBLE,
  INDEX `tipo_pagamento_id` (`tipo_pagamento_id` ASC) VISIBLE,
  CONSTRAINT `pedidos_ibfk_1`
    FOREIGN KEY (`cliente_id`)
    REFERENCES `cesta_coletiva`.`clientes` (`id`),
  CONSTRAINT `pedidos_ibfk_2`
    FOREIGN KEY (`endereco_cliente_id`)
    REFERENCES `cesta_coletiva`.`enderecos` (`id`),
  CONSTRAINT `pedidos_ibfk_3`
    FOREIGN KEY (`produto_id`)
    REFERENCES `cesta_coletiva`.`produtos` (`id`),
  CONSTRAINT `pedidos_ibfk_4`
    FOREIGN KEY (`tipo_pagamento_id`)
    REFERENCES `cesta_coletiva`.`tipos_pagamento` (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 6
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `cesta_coletiva`.`situacoes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cesta_coletiva`.`situacoes` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome_situacao` VARCHAR(150) NULL DEFAULT NULL,
  `descricao` VARCHAR(150) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 6
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `cesta_coletiva`.`rastreios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cesta_coletiva`.`rastreios` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `situacao_id` INT NOT NULL,
  `pedido_id` INT NOT NULL,
  `codigo_rastreio` VARCHAR(13) NOT NULL,
  `geo_lat` VARCHAR(14) NOT NULL,
  `geo_long` VARCHAR(14) NOT NULL,
  `data_rastreio` DATE NOT NULL,
  `hora_rastreio` TIME NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `pedido_id` (`pedido_id` ASC) VISIBLE,
  INDEX `situacao_id` (`situacao_id` ASC) VISIBLE,
  CONSTRAINT `rastreios_ibfk_1`
    FOREIGN KEY (`pedido_id`)
    REFERENCES `cesta_coletiva`.`pedidos` (`id`),
  CONSTRAINT `rastreios_ibfk_2`
    FOREIGN KEY (`situacao_id`)
    REFERENCES `cesta_coletiva`.`situacoes` (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 6
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

USE `cesta_coletiva` ;

-- -----------------------------------------------------
-- Placeholder table for view `cesta_coletiva`.`rastreio_entregas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cesta_coletiva`.`rastreio_entregas` (`CLIENTE` INT, `LOGRADOURO` INT, `CEP` INT, `NUMERO` INT, `PEDIDO` INT, `COD_RASTREIO` INT, `SIT_ENTREGA` INT);

-- -----------------------------------------------------
-- View `cesta_coletiva`.`rastreio_entregas`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cesta_coletiva`.`rastreio_entregas`;
USE `cesta_coletiva`;
CREATE  OR REPLACE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `cesta_coletiva`.`rastreio_entregas` AS select `cesta_coletiva`.`clientes`.`nome` AS `CLIENTE`,`cesta_coletiva`.`enderecos`.`endereco` AS `LOGRADOURO`,`cesta_coletiva`.`enderecos`.`cep` AS `CEP`,`cesta_coletiva`.`enderecos`.`numero` AS `NUMERO`,`cesta_coletiva`.`pedidos`.`produtos` AS `PEDIDO`,`cesta_coletiva`.`rastreios`.`codigo_rastreio` AS `COD_RASTREIO`,`cesta_coletiva`.`situacoes`.`nome_situacao` AS `SIT_ENTREGA` from ((((`cesta_coletiva`.`clientes` join `cesta_coletiva`.`enderecos` on((`cesta_coletiva`.`clientes`.`id` = `cesta_coletiva`.`enderecos`.`cliente_id`))) join `cesta_coletiva`.`pedidos` on((`cesta_coletiva`.`clientes`.`id` = `cesta_coletiva`.`pedidos`.`cliente_id`))) join `cesta_coletiva`.`rastreios` on((`cesta_coletiva`.`pedidos`.`id` = `cesta_coletiva`.`rastreios`.`pedido_id`))) join `cesta_coletiva`.`situacoes` on((`cesta_coletiva`.`situacoes`.`id` = `cesta_coletiva`.`rastreios`.`situacao_id`)));

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
