-- MySQL Script generated by MySQL Workbench
-- Tue Sep 27 12:12:20 2022
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema db_blog_pessoal
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema db_blog_pessoal
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `db_blog_pessoal` DEFAULT CHARACTER SET utf8 ;
USE `db_blog_pessoal` ;

-- -----------------------------------------------------
-- Table `db_blog_pessoal`.`tb_temas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_blog_pessoal`.`tb_temas` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `DESCRICAO` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_blog_pessoal`.`tb_usuarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_blog_pessoal`.`tb_usuarios` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `NOME` VARCHAR(255) NOT NULL,
  `USUARIO` VARCHAR(255) NOT NULL,
  `SENHA` VARCHAR(255) NOT NULL,
  `FOTO` VARCHAR(255) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_blog_pessoal`.`tb_postagens`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_blog_pessoal`.`tb_postagens` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `TITULO` VARCHAR(100) NOT NULL,
  `TEXTO` VARCHAR(1000) NOT NULL,
  `DATA` DATE NULL,
  `tb_tema_id` BIGINT NULL,
  `tb_usuario_id` BIGINT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_tb_postagens_tb_temas_idx` (`tb_tema_id` ASC) VISIBLE,
  INDEX `fk_tb_postagens_tb_usuarios1_idx` (`tb_usuario_id` ASC) VISIBLE,
  CONSTRAINT `fk_tb_postagens_tb_temas`
    FOREIGN KEY (`tb_tema_id`)
    REFERENCES `db_blog_pessoal`.`tb_temas` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tb_postagens_tb_usuarios1`
    FOREIGN KEY (`tb_usuario_id`)
    REFERENCES `db_blog_pessoal`.`tb_usuarios` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
