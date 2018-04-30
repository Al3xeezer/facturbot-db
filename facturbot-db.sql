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
-- Table `FacturBot`.`SUGGESTIONS`
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS `FacturBot`.`SUGGESTION` (
  `idSUGGESTION` INT NOT NULL AUTO_INCREMENT,
  `DATA` INT NOT NULL,
  `CALLS_INCLUDED` INT NOT NULL,
  `CALLS_EXTRA` FLOAT NOT NULL,
  `CALLS_STABLISHMENT` FLOAT NOT NULL,
  `SMS` FLOAT NOT NULL,
  `BASE_PRICE` FLOAT NOT NULL,
  `COMPANY_NAME` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idSUGGESTION`))
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `FacturBot`.`INVOICE`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `FacturBot`.`INVOICE` (
  `idINVOICE` INT NOT NULL AUTO_INCREMENT,
  `MONTH` INT NOT NULL,
  `YEAR` INT NOT NULL,
  `DATA` FLOAT NULL,
  `CALLS` FLOAT NULL,
  `MESSAGES` FLOAT NULL,
  `TOTAL` FLOAT NOT NULL,
  `MONTH` INT NULL,
  `YEAR` INT NULL,
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


LOCK TABLES `COMPANY` WRITE;
/*!40000 ALTER TABLE `COMPANY` DISABLE KEYS */;
INSERT INTO `COMPANY` VALUES (1,'Simyo');
/*!40000 ALTER TABLE `COMPANY` ENABLE KEYS */;
UNLOCK TABLES;



LOCK TABLES `FIELD` WRITE;
/*!40000 ALTER TABLE `FIELD` DISABLE KEYS */;
INSERT INTO `FIELD` VALUES (9,'TOTAL_TO_PAY',865,1092,45,131,'0123456789,',200,1,1),(10,'CALLS',1285,1446,36,89,'0123456789,',200,1,1),(11,'MESSAGES',1320,1451,30,81,'0123456789,',200,1,1),(12,'DATA_PLAN',1371,627,48,31,'0123456789,',200,1,1),(13,'DATA_TO_PAY',1383,1457,35,79,'0123456789,',200,1,1),(14,'DATA_CONSUMED',370,807,28,93,'0123456789,',200,2,1),(16,'PERIOD',645,1310,33,283,'0123456789-/',200,1,1);
/*!40000 ALTER TABLE `FIELD` ENABLE KEYS */;
UNLOCK TABLES;

