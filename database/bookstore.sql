-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema bookstore
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `bookstore` DEFAULT CHARACTER SET utf8 ;
USE `bookstore` ;

-- -----------------------------------------------------
-- Table `bookstore`.`categorias`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bookstore`.`categorias` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bookstore`.`produtos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bookstore`.`produtos` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(120) NOT NULL,
  `preco` DECIMAL(6,2) NOT NULL,
  `imagem` VARCHAR(45) NOT NULL,
  `sinopse` TEXT(1000) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bookstore`.`categorias_has_produtos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bookstore`.`categorias_has_produtos` (
  `categoria_id` INT NOT NULL,
  `produtos_id` INT NOT NULL,
  INDEX `fk_categoria_has_produtos_produtos1_idx` (`produtos_id` ASC) VISIBLE,
  INDEX `fk_categoria_has_produtos_categoria_idx` (`categoria_id` ASC) VISIBLE,
  CONSTRAINT `fk_categoria_has_produtos_categoria`
    FOREIGN KEY (`categoria_id`)
    REFERENCES `bookstore`.`categorias` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_categoria_has_produtos_produtos1`
    FOREIGN KEY (`produtos_id`)
    REFERENCES `bookstore`.`produtos` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bookstore`.`usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bookstore`.`usuario` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(64) NOT NULL,
  `senha` VARCHAR(64) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `endereco` VARCHAR(250) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bookstore`.`pedidos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bookstore`.`pedidos` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `data` DATETIME NOT NULL,
  `endereco` VARCHAR(250) NOT NULL,
  `usuario_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_pedidos_usuario1_idx` (`usuario_id` ASC) VISIBLE,
  CONSTRAINT `fk_pedidos_usuario1`
    FOREIGN KEY (`usuario_id`)
    REFERENCES `bookstore`.`usuario` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bookstore`.`favoritos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bookstore`.`favoritos` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `produtos_id` INT NOT NULL,
  `usuario_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_favoritos_produtos1_idx` (`produtos_id` ASC) VISIBLE,
  INDEX `fk_favoritos_usuario1_idx` (`usuario_id` ASC) VISIBLE,
  CONSTRAINT `fk_favoritos_produtos1`
    FOREIGN KEY (`produtos_id`)
    REFERENCES `bookstore`.`produtos` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_favoritos_usuario1`
    FOREIGN KEY (`usuario_id`)
    REFERENCES `bookstore`.`usuario` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bookstore`.`pedidos_has_produtos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bookstore`.`pedidos_has_produtos` (
  `pedidos_id` INT NOT NULL,
  `produtos_id` INT NOT NULL,
  PRIMARY KEY (`pedidos_id`, `produtos_id`),
  INDEX `fk_pedidos_has_produtos_produtos1_idx` (`produtos_id` ASC) VISIBLE,
  INDEX `fk_pedidos_has_produtos_pedidos1_idx` (`pedidos_id` ASC) VISIBLE,
  CONSTRAINT `fk_pedidos_has_produtos_pedidos1`
    FOREIGN KEY (`pedidos_id`)
    REFERENCES `bookstore`.`pedidos` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_pedidos_has_produtos_produtos1`
    FOREIGN KEY (`produtos_id`)
    REFERENCES `bookstore`.`produtos` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
