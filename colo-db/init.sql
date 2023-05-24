-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`adherants`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`adherants` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `adresse` VARCHAR(45) NULL,
  `nom` VARCHAR(45) NOT NULL,
  `age` INT NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`activites`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`activites` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nom` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`centres`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`centres` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nom` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`seances`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`seances` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `pratiquee_a` DATETIME NOT NULL,
  `activites_id` INT NOT NULL,
  `adherents_id` INT NOT NULL,
  `centres_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `activites_id_idx` (`activites_id` ASC) VISIBLE,
  INDEX `adherents_id_idx` (`adherents_id` ASC) VISIBLE,
  INDEX `centres_id_idx` (`centres_id` ASC) VISIBLE,
  CONSTRAINT `activites_id`
    FOREIGN KEY (`activites_id`)
    REFERENCES `mydb`.`activites` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `adherents_id`
    FOREIGN KEY (`adherents_id`)
    REFERENCES `mydb`.`adherants` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `centres_id`
    FOREIGN KEY (`centres_id`)
    REFERENCES `mydb`.`centres` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`notes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`notes` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `valeur` INT NOT NULL,
  `adherents_id` INT NOT NULL,
  `seances_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `adherents_id_idx` (`adherents_id` ASC) VISIBLE,
  INDEX `seances_id_idx` (`seances_id` ASC) VISIBLE,
  CONSTRAINT `adherents_id`
    FOREIGN KEY (`adherents_id`)
    REFERENCES `mydb`.`adherants` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `seances_id`
    FOREIGN KEY (`seances_id`)
    REFERENCES `mydb`.`seances` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`centres_activites`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`centres_activites` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `centre_id` INT NOT NULL,
  `activites_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `centre_id_idx` (`centre_id` ASC) VISIBLE,
  INDEX `activites_id_idx` (`activites_id` ASC) VISIBLE,
  CONSTRAINT `centre_id`
    FOREIGN KEY (`centre_id`)
    REFERENCES `mydb`.`centres` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `activites_id`
    FOREIGN KEY (`activites_id`)
    REFERENCES `mydb`.`activites` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
