-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema gogomoney3.1
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema gogomoney3.1
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `gogomoney3.1` DEFAULT CHARACTER SET utf8 ;
USE `gogomoney3.1` ;

-- -----------------------------------------------------
-- Table `gogomoney3.1`.`category`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `gogomoney3.1`.`category` (
  `category_id` INT NOT NULL AUTO_INCREMENT,
  `category_name` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`category_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `gogomoney3.1`.`user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `gogomoney3.1`.`user` (
  `user_id` INT NOT NULL AUTO_INCREMENT,
  `user_first_name` VARCHAR(45) NULL DEFAULT NULL,
  `user_last_name` VARCHAR(45) NULL DEFAULT NULL,
  `password` VARCHAR(45) NULL DEFAULT NULL,
  `email` VARCHAR(45) NULL DEFAULT NULL,
  `start_balance` DOUBLE NULL DEFAULT NULL,
  `amount_to_save` DOUBLE NULL DEFAULT NULL,
  PRIMARY KEY (`user_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `gogomoney3.1`.`income`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `gogomoney3.1`.`income` (
  `income_id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL DEFAULT NULL,
  `amount` DOUBLE NULL DEFAULT NULL,
  `user_id` INT NULL DEFAULT NULL,
  `category_id` INT NULL DEFAULT NULL,
  `reccuring` BIT(1) NULL DEFAULT b'0',
  `reccur_interval` INT NULL DEFAULT NULL,
  `recurr_day` INT NULL DEFAULT NULL,
  `recurr_count` INT NULL DEFAULT NULL,
  `transaction_date` DATE NULL DEFAULT NULL,
  `entry_date` DATE NULL DEFAULT NULL,
  PRIMARY KEY (`income_id`),
  INDEX `in_category_key_idx` (`category_id` ASC) VISIBLE,
  INDEX `in_user_key_idx` (`user_id` ASC) VISIBLE,
  CONSTRAINT `in_category_fkey`
    FOREIGN KEY (`category_id`)
    REFERENCES `gogomoney3.1`.`category` (`category_id`),
  CONSTRAINT `in_user_fkey`
    FOREIGN KEY (`user_id`)
    REFERENCES `gogomoney3.1`.`user` (`user_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `gogomoney3.1`.`outcome`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `gogomoney3.1`.`outcome` (
  `outcome_id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL DEFAULT NULL,
  `amount` DOUBLE NULL DEFAULT NULL,
  `user_id` INT NULL DEFAULT NULL,
  `category_id` INT NULL DEFAULT NULL,
  `reccuring` BIT(1) NULL DEFAULT b'0',
  `reccur_interval` INT NULL DEFAULT NULL,
  `recurr_day` INT NULL DEFAULT NULL,
  `recurr_count` INT NULL DEFAULT NULL,
  `transaction_date` DATE NULL DEFAULT NULL,
  `entry_date` DATE NULL DEFAULT NULL,
  PRIMARY KEY (`outcome_id`),
  INDEX `out_category_key_idx` (`category_id` ASC) VISIBLE,
  INDEX `in_user_key_idx` (`user_id` ASC) VISIBLE,
  CONSTRAINT `out_category_fkey`
    FOREIGN KEY (`category_id`)
    REFERENCES `gogomoney3.1`.`category` (`category_id`),
  CONSTRAINT `out_user_fkey`
    FOREIGN KEY (`user_id`)
    REFERENCES `gogomoney3.1`.`user` (`user_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
