-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema FacturBot
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema FacturBot
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `FacturBot` DEFAULT CHARACTER SET latin1 ;
USE `FacturBot` ;

-- -----------------------------------------------------
-- Table `FacturBot`.`USER`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `FacturBot`.`USER` (
  `idUSER` INT NOT NULL AUTO_INCREMENT,
  `TELEGRAM_ID` INT NOT NULL,
  PRIMARY KEY (`idUSER`),
  UNIQUE INDEX `idUSER_UNIQUE` (`idUSER` ASC),
  UNIQUE INDEX `TELEGRAM_ID_UNIQUE` (`TELEGRAM_ID` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `FacturBot`.`COMPANY`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `FacturBot`.`COMPANY` (
  `idCOMPANY` INT NOT NULL AUTO_INCREMENT,
  `TYPE` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idCOMPANY`),
  UNIQUE INDEX `idCompany_UNIQUE` (`idCOMPANY` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `FacturBot`.`FIELD`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `FacturBot`.`FIELD` (
  `idFIELD` INT NOT NULL AUTO_INCREMENT,
  `TYPE` VARCHAR(45) NOT NULL,
  `TOP` FLOAT NOT NULL,
  `LEFT` FLOAT NOT NULL,
  `HEIGHT` FLOAT NOT NULL,
  `WIDTH` FLOAT NOT NULL,
  `WHITELIST` VARCHAR(45) NOT NULL,
  `PPI` INT NOT NULL,
  `PAGE` INT NOT NULL,
  `COMPANY_idCOMPANY` INT NOT NULL,
  PRIMARY KEY (`idFIELD`, `COMPANY_idCOMPANY`),
  UNIQUE INDEX `idDATA_UNIQUE` (`idFIELD` ASC),
  INDEX `fk_FIELD_COMPANY1_idx` USING BTREE (`COMPANY_idCOMPANY` ASC),
  CONSTRAINT `fk_FIELD_COMPANY1`
    FOREIGN KEY (`COMPANY_idCOMPANY`)
    REFERENCES `FacturBot`.`COMPANY` (`idCOMPANY`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `FacturBot`.`INVOICE`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `FacturBot`.`INVOICE` (
  `idINVOICE` INT NOT NULL AUTO_INCREMENT,
  `DATE` VARCHAR(45) NOT NULL,
  `DATA` FLOAT NULL,
  `CALLS` INT NULL,
  `MESSAGES` INT NULL,
  `TOTAL` FLOAT NOT NULL,
  `USER_idUSER` INT NOT NULL,
  `COMPANY_idCOMPANY` INT NOT NULL,
  PRIMARY KEY (`idINVOICE`, `USER_idUSER`, `COMPANY_idCOMPANY`),
  UNIQUE INDEX `idINVOICE_UNIQUE` (`idINVOICE` ASC),
  INDEX `fk_INVOICE_USER1_idx` (`USER_idUSER` ASC),
  INDEX `fk_INVOICE_COMPANY1_idx` (`COMPANY_idCOMPANY` ASC))
ENGINE = MyISAM;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
