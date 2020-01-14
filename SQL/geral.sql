-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `mydb` ;

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Modalidade`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Modalidade` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Modalidade` (
  `idModalidade` INT NOT NULL AUTO_INCREMENT,
  `designação` VARCHAR(200) NOT NULL,
  PRIMARY KEY (`idModalidade`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Residencia`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Residencia` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Residencia` (
  `morada` VARCHAR(200) NOT NULL,
  `localidade` VARCHAR(200) NOT NULL,
  `codigoPostal` VARCHAR(10) NOT NULL,
  `idResidencia` INT NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`idResidencia`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Clube`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Clube` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Clube` (
  `idClube` INT NOT NULL AUTO_INCREMENT,
  `mome` VARCHAR(200) NOT NULL,
  `sigla` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idClube`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Categoria`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Categoria` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Categoria` (
  `idCategoria` INT NOT NULL AUTO_INCREMENT,
  `designação` VARCHAR(200) NOT NULL,
  PRIMARY KEY (`idCategoria`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Atleta`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Atleta` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Atleta` (
  `idAtleta` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(200) NOT NULL,
  `dataNascimento` DATE NOT NULL,
  `Modalidade_idModalidade` INT NOT NULL,
  `telemovel` INT NOT NULL,
  `Residencia_idResidencia` INT NOT NULL,
  `Clube_idClube` INT NOT NULL,
  `Categoria_idCategoria` INT NOT NULL,
  PRIMARY KEY (`idAtleta`),
  CONSTRAINT `fk_Atleta_Modalidade`
    FOREIGN KEY (`Modalidade_idModalidade`)
    REFERENCES `mydb`.`Modalidade` (`idModalidade`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Atleta_Residencia1`
    FOREIGN KEY (`Residencia_idResidencia`)
    REFERENCES `mydb`.`Residencia` (`idResidencia`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Atleta_Clube1`
    FOREIGN KEY (`Clube_idClube`)
    REFERENCES `mydb`.`Clube` (`idClube`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Atleta_Categoria1`
    FOREIGN KEY (`Categoria_idCategoria`)
    REFERENCES `mydb`.`Categoria` (`idCategoria`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_Atleta_Modalidade_idx` ON `mydb`.`Atleta` (`Modalidade_idModalidade` ASC);

CREATE INDEX `fk_Atleta_Residencia1_idx` ON `mydb`.`Atleta` (`Residencia_idResidencia` ASC);

CREATE INDEX `fk_Atleta_Clube1_idx` ON `mydb`.`Atleta` (`Clube_idClube` ASC);

CREATE INDEX `fk_Atleta_Categoria1_idx` ON `mydb`.`Atleta` (`Categoria_idCategoria` ASC);


-- -----------------------------------------------------
-- Table `mydb`.`Especialidade`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Especialidade` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Especialidade` (
  `idEspecialidade` INT NOT NULL AUTO_INCREMENT,
  `designação` VARCHAR(45) NULL,
  PRIMARY KEY (`idEspecialidade`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Medico`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Medico` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Medico` (
  `idMedico` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(200) NOT NULL,
  `dataInicioServiço` DATE NOT NULL,
  `Especialidade_idEspecialidade` INT NOT NULL,
  PRIMARY KEY (`idMedico`),
  CONSTRAINT `fk_Medico_Especialidade1`
    FOREIGN KEY (`Especialidade_idEspecialidade`)
    REFERENCES `mydb`.`Especialidade` (`idEspecialidade`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_Medico_Especialidade1_idx` ON `mydb`.`Medico` (`Especialidade_idEspecialidade` ASC);


-- -----------------------------------------------------
-- Table `mydb`.`Agendamento`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Agendamento` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Agendamento` (
  `nºagendamento` INT NOT NULL AUTO_INCREMENT,
  `data_hora` DATETIME NOT NULL,
  `Atleta_idAtleta` INT NOT NULL,
  `Medico_idMedico` INT NOT NULL,
  PRIMARY KEY (`nºagendamento`),
  CONSTRAINT `fk_Agendamento_Atleta1`
    FOREIGN KEY (`Atleta_idAtleta`)
    REFERENCES `mydb`.`Atleta` (`idAtleta`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Agendamento_Medico1`
    FOREIGN KEY (`Medico_idMedico`)
    REFERENCES `mydb`.`Medico` (`idMedico`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_Agendamento_Atleta1_idx` ON `mydb`.`Agendamento` (`Atleta_idAtleta` ASC);

CREATE INDEX `fk_Agendamento_Medico1_idx` ON `mydb`.`Agendamento` (`Medico_idMedico` ASC);


-- -----------------------------------------------------
-- Table `mydb`.`TesteClinico`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`TesteClinico` ;

CREATE TABLE IF NOT EXISTS `mydb`.`TesteClinico` (
  `idTesteClinico` INT NOT NULL AUTO_INCREMENT,
  `descrição` VARCHAR(200) NOT NULL,
  `estado` VARCHAR(200) NOT NULL,
  `Agendamento_nºagendamento` INT NOT NULL,
  PRIMARY KEY (`idTesteClinico`),
  CONSTRAINT `fk_TesteClinico_Agendamento1`
    FOREIGN KEY (`Agendamento_nºagendamento`)
    REFERENCES `mydb`.`Agendamento` (`nºagendamento`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_TesteClinico_Agendamento1_idx` ON `mydb`.`TesteClinico` (`Agendamento_nºagendamento` ASC);


-- -----------------------------------------------------
-- Table `mydb`.`Utensilio`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Utensilio` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Utensilio` (
  `idUtensilio` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(200) NOT NULL,
  PRIMARY KEY (`idUtensilio`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`TesteClinico_has_Utensilio`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`TesteClinico_has_Utensilio` ;

CREATE TABLE IF NOT EXISTS `mydb`.`TesteClinico_has_Utensilio` (
  `TesteClinico_idTesteClinico` INT NOT NULL,
  `Utensilio_idUtensilio` INT NOT NULL,
  PRIMARY KEY (`TesteClinico_idTesteClinico`, `Utensilio_idUtensilio`),
  CONSTRAINT `fk_TesteClinico_has_Utensilio_TesteClinico1`
    FOREIGN KEY (`TesteClinico_idTesteClinico`)
    REFERENCES `mydb`.`TesteClinico` (`idTesteClinico`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_TesteClinico_has_Utensilio_Utensilio1`
    FOREIGN KEY (`Utensilio_idUtensilio`)
    REFERENCES `mydb`.`Utensilio` (`idUtensilio`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_TesteClinico_has_Utensilio_Utensilio1_idx` ON `mydb`.`TesteClinico_has_Utensilio` (`Utensilio_idUtensilio` ASC);

CREATE INDEX `fk_TesteClinico_has_Utensilio_TesteClinico1_idx` ON `mydb`.`TesteClinico_has_Utensilio` (`TesteClinico_idTesteClinico` ASC);


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

