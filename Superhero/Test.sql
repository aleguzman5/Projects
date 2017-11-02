-- MySQL Script generated by MySQL Workbench
-- Sat Oct 21 15:57:48 2017
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema superHeroSightings
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `superHeroSightings` ;

-- -----------------------------------------------------
-- Schema superHeroSightings
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `superHeroSightings` DEFAULT CHARACTER SET utf8 ;
USE `superHeroSightings` ;

-- -----------------------------------------------------
-- Table `superHeroSightings`.`organization`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `superHeroSightings`.`organization` (
  `organizationId` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(50) NOT NULL,
  `description` VARCHAR(255) NULL,
  `address` VARCHAR(255) NOT NULL,
  `city` VARCHAR(45) NULL,
  `zip` INT(8) NULL,
  `phone` BIGINT(12) NULL,
  `email` VARCHAR(50) NULL,
  PRIMARY KEY (`organizationId`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `superHeroSightings`.`superPowers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `superHeroSightings`.`superPowers` (
  `superPowerId` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`superPowerId`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `superHeroSightings`.`super`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `superHeroSightings`.`super` (
  `superId` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(50) NOT NULL,
  `description` VARCHAR(255) NULL,
  `superPowerId` INT NOT NULL,
  PRIMARY KEY (`superId`),
  INDEX `super_powerId_idx` (`superPowerId` ASC),
  CONSTRAINT `spId`
    FOREIGN KEY (`superPowerId`)
    REFERENCES `superHeroSightings`.`superPowers` (`superPowerId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `superHeroSightings`.`location`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `superHeroSightings`.`location` (
  `locationId` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(50) NULL,
  `description` VARCHAR(255) NULL,
  `address` VARCHAR(255) NULL,
  `latitude` DOUBLE NULL,
  `longitude` DOUBLE NULL,
  PRIMARY KEY (`locationId`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `superHeroSightings`.`sighting`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `superHeroSightings`.`sighting` (
  `sightingId` INT NOT NULL AUTO_INCREMENT,
  `locationId` INT NOT NULL,
  `sightingDate` DATE NOT NULL,
  PRIMARY KEY (`sightingId`),
  INDEX `locationId_idx` (`locationId` ASC),
  CONSTRAINT `locationId`
    FOREIGN KEY (`locationId`)
    REFERENCES `superHeroSightings`.`location` (`locationId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `superHeroSightings`.`superSighting`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `superHeroSightings`.`superSighting` (
  `superId` INT NOT NULL,
  `sightingId` INT NOT NULL,
  INDEX `sightingId_idx` (`sightingId` ASC),
  INDEX `superHeroId_idx` (`superId` ASC),
  CONSTRAINT `sightingId`
    FOREIGN KEY (`sightingId`)
    REFERENCES `superHeroSightings`.`sighting` (`sightingId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `superHeroId`
    FOREIGN KEY (`superId`)
    REFERENCES `superHeroSightings`.`super` (`superId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `superHeroSightings`.`superOrganizations`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `superHeroSightings`.`superOrganizations` (
  `organizationId` INT NOT NULL,
  `superId` INT NOT NULL,
  INDEX `fk_organization_has_super_super1_idx` (`superId` ASC),
  INDEX `fk_organization_has_super_organization1_idx` (`organizationId` ASC),
  CONSTRAINT `fk_organization_has_super_organization1`
    FOREIGN KEY (`organizationId`)
    REFERENCES `superHeroSightings`.`organization` (`organizationId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_organization_has_super_super1`
    FOREIGN KEY (`superId`)
    REFERENCES `superHeroSightings`.`super` (`superId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;


#insert into superpowers (`name`) values ('Think');
#insert into `super` (`name`, description, superPowerId) values ('Jeff', 'F', 2);
#insert into location (`name`) values ('house');
#insert into sighting (locationId, sightingDate) values (2, '2017/10/09');
#insert into supersighting (superId, sightingId) values (9, 2);

#select * from `super`;
#select * from sighting;