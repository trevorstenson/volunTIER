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
-- Table `mydb`.`organization`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`organization` ;

CREATE TABLE IF NOT EXISTS `mydb`.`organization` (
  `idorganization` INT NOT NULL,
  `orgname` VARCHAR(256) NOT NULL,
  `type` VARCHAR(256) NULL,
  PRIMARY KEY (`idorganization`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`event`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`event` ;

CREATE TABLE IF NOT EXISTS `mydb`.`event` (
  `event_id` INT NOT NULL,
  `name` VARCHAR(256) NOT NULL,
  `datetime` DATETIME NOT NULL,
  `est_time` BIGINT(256) NULL,
  `lat` DECIMAL(10,8) NOT NULL,
  `lon` DECIMAL(11,8) NOT NULL,
  `organization_idorganization` INT NOT NULL,
  PRIMARY KEY (`event_id`, `organization_idorganization`),
  INDEX `fk_event_organization1_idx` (`organization_idorganization` ASC),
  CONSTRAINT `fk_event_organization1`
    FOREIGN KEY (`organization_idorganization`)
    REFERENCES `mydb`.`organization` (`idorganization`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`volunteer`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`volunteer` ;

CREATE TABLE IF NOT EXISTS `mydb`.`volunteer` (
  `volunteer_id` INT NOT NULL,
  `name` VARCHAR(256) NOT NULL,
  `username` VARCHAR(256) NOT NULL,
  `password` VARCHAR(256) NOT NULL,
  `email` VARCHAR(256) NOT NULL,
  `birthday` DATE NULL,
  `points` BIGINT(256) NOT NULL,
  `volunteer_volunteer_id` INT NOT NULL,
  PRIMARY KEY (`volunteer_id`, `volunteer_volunteer_id`),
  UNIQUE INDEX `username_UNIQUE` (`username` ASC),
  INDEX `fk_volunteer_volunteer_idx` (`volunteer_volunteer_id` ASC),
  CONSTRAINT `fk_volunteer_volunteer`
    FOREIGN KEY (`volunteer_volunteer_id`)
    REFERENCES `mydb`.`volunteer` (`volunteer_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`event_has_volunteer`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`event_has_volunteer` ;

CREATE TABLE IF NOT EXISTS `mydb`.`event_has_volunteer` (
  `event_event_id` INT NOT NULL,
  `volunteer_volunteer_id` INT NOT NULL,
  `volunteer_volunteer_volunteer_id` INT NOT NULL,
  `time_volunteered` INT NOT NULL,
  PRIMARY KEY (`event_event_id`, `volunteer_volunteer_id`, `volunteer_volunteer_volunteer_id`),
  INDEX `fk_event_has_volunteer_volunteer1_idx` (`volunteer_volunteer_id` ASC, `volunteer_volunteer_volunteer_id` ASC),
  INDEX `fk_event_has_volunteer_event1_idx` (`event_event_id` ASC),
  CONSTRAINT `fk_event_has_volunteer_event1`
    FOREIGN KEY (`event_event_id`)
    REFERENCES `mydb`.`event` (`event_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_event_has_volunteer_volunteer1`
    FOREIGN KEY (`volunteer_volunteer_id` , `volunteer_volunteer_volunteer_id`)
    REFERENCES `mydb`.`volunteer` (`volunteer_id` , `volunteer_volunteer_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
