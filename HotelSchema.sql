-- MySQL Script generated by MySQL Workbench
-- Fri Oct 13 18:59:10 2017
-- Model: New Model    Version: 1.0
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
-- Table `mydb`.`Rates`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Rates` (
  `RatesId` INT NOT NULL AUTO_INCREMENT,
  `Season` VARCHAR(30) NULL,
  `FromDate` DATE NOT NULL,
  `ToDate` DATE NOT NULL,
  `Price` DECIMAL NOT NULL,
  PRIMARY KEY (`RatesId`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`RoomType`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`RoomType` (
  `RoomTypeId` INT NOT NULL AUTO_INCREMENT,
  `Description` VARCHAR(45) NULL,
  `BaseRate` DECIMAL NOT NULL,
  PRIMARY KEY (`RoomTypeId`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Room`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Room` (
  `RoomId` INT NOT NULL AUTO_INCREMENT,
  `Number` VARCHAR(45) NULL,
  `Floor` INT NULL,
  `Occupancy` INT NULL,
  `RateId` INT NULL,
  `RoomTypeId` INT NOT NULL,
  PRIMARY KEY (`RoomId`),
  INDEX `RoomTypeId_idx` (`RoomTypeId` ASC),
  INDEX `RateId_idx` (`RateId` ASC),
  CONSTRAINT `RateId`
    FOREIGN KEY (`RateId`)
    REFERENCES `mydb`.`Rates` (`RatesId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `RoomTypeId`
    FOREIGN KEY (`RoomTypeId`)
    REFERENCES `mydb`.`RoomType` (`RoomTypeId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Customer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Customer` (
  `CustomerId` INT NOT NULL AUTO_INCREMENT,
  `FirstName` VARCHAR(45) NOT NULL,
  `LastName` VARCHAR(45) NOT NULL,
  `Phone` VARCHAR(45) NOT NULL,
  `Email` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`CustomerId`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Ammenities`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Ammenities` (
  `AmenitiesId` INT NOT NULL AUTO_INCREMENT,
  `Description` VARCHAR(255) NULL,
  PRIMARY KEY (`AmenitiesId`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`RoomAmmenities`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`RoomAmmenities` (
  `RoomId` INT NOT NULL,
  `AmmenitiesId` INT NOT NULL,
  INDEX `RoomId_idx` (`RoomId` ASC),
  INDEX `AmmenitiesId_idx` (`AmmenitiesId` ASC),
  CONSTRAINT `RoomId`
    FOREIGN KEY (`RoomId`)
    REFERENCES `mydb`.`Room` (`RoomId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `AmmenitiesId`
    FOREIGN KEY (`AmmenitiesId`)
    REFERENCES `mydb`.`Ammenities` (`AmenitiesId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`AddOn`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`AddOn` (
  `AddOnId` INT NOT NULL AUTO_INCREMENT,
  `Description` VARCHAR(45) NOT NULL,
  `Price` DECIMAL NOT NULL,
  PRIMARY KEY (`AddOnId`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Reservation`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Reservation` (
  `ReservationId` INT NOT NULL AUTO_INCREMENT,
  `CustomerId` INT NOT NULL,
  `FromDate` DATE NOT NULL,
  `ToDate` DATE NOT NULL,
  PRIMARY KEY (`ReservationId`),
  INDEX `CustomerId_idx` (`CustomerId` ASC),
  CONSTRAINT `CustomerId`
    FOREIGN KEY (`CustomerId`)
    REFERENCES `mydb`.`Customer` (`CustomerId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`ReservationDetails`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`ReservationDetails` (
  `ReservationId` INT NOT NULL,
  `RoomId` INT NOT NULL,
  INDEX `ReservationId_idx` (`ReservationId` ASC),
  INDEX `RoomId_idx` (`RoomId` ASC),
  CONSTRAINT `ReservationId`
    FOREIGN KEY (`ReservationId`)
    REFERENCES `mydb`.`Reservation` (`ReservationId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `IdRoom`
    FOREIGN KEY (`RoomId`)
    REFERENCES `mydb`.`Room` (`RoomId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`AddOnDetails`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`AddOnDetails` (
  `AddOnDetailsId` INT NOT NULL AUTO_INCREMENT,
  `AddOnId` INT NULL,
  PRIMARY KEY (`AddOnDetailsId`),
  INDEX `AddOnID_idx` (`AddOnId` ASC),
  CONSTRAINT `AddOnID`
    FOREIGN KEY (`AddOnId`)
    REFERENCES `mydb`.`AddOn` (`AddOnId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`PromotionCode`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`PromotionCode` (
  `PromotionCode` VARCHAR(20) NOT NULL,
  `FromDate` DATE NOT NULL,
  `ToDate` DATE NOT NULL,
  `DiscountPct` DECIMAL NULL,
  `DollarDisc` DECIMAL NULL,
  PRIMARY KEY (`PromotionCode`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`TotalDiscounts`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`TotalDiscounts` (
  `TotalDiscountsId` INT NOT NULL AUTO_INCREMENT,
  `PromotionCode` VARCHAR(20) NULL,
  PRIMARY KEY (`TotalDiscountsId`),
  INDEX `PromotionCode_idx` (`PromotionCode` ASC),
  CONSTRAINT `PromotionCode`
    FOREIGN KEY (`PromotionCode`)
    REFERENCES `mydb`.`PromotionCode` (`PromotionCode`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Billing`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Billing` (
  `ReservationId` INT NOT NULL,
  `AddOnDetailsId` INT NULL,
  `TotalDiscountsId` INT NULL,
  `Tax` DECIMAL NOT NULL,
  `Total` DECIMAL NOT NULL,
  `TotalDiscountId` INT NULL,
  INDEX `ReservationId_idx` (`ReservationId` ASC),
  INDEX `AddOnDetailsId_idx` (`AddOnDetailsId` ASC),
  INDEX `TotalDiscountId_idx` (`TotalDiscountId` ASC),
  CONSTRAINT `IdReservation`
    FOREIGN KEY (`ReservationId`)
    REFERENCES `mydb`.`Reservation` (`ReservationId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `AddOnDetailsId`
    FOREIGN KEY (`AddOnDetailsId`)
    REFERENCES `mydb`.`AddOnDetails` (`AddOnDetailsId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `TotalDiscountId`
    FOREIGN KEY (`TotalDiscountId`)
    REFERENCES `mydb`.`TotalDiscounts` (`TotalDiscountsId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
