-- MySQL Script generated by MySQL Workbench
-- Fri Apr 15 21:14:23 2022
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema gogomoney04-01
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `gogomoney04-01` ;

-- -----------------------------------------------------
-- Schema gogomoney04-01
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `gogomoney04-01` DEFAULT CHARACTER SET utf8 ;
USE `gogomoney04-01` ;

-- -----------------------------------------------------
-- Table `gogomoney04-01`.`user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `gogomoney04-01`.`user` ;

CREATE TABLE IF NOT EXISTS `gogomoney04-01`.`user` (
  `user_id` INT(11) NOT NULL AUTO_INCREMENT,
  `user_first_name` VARCHAR(45) NULL DEFAULT NULL,
  `user_last_name` VARCHAR(45) NULL DEFAULT NULL,
  `password` VARCHAR(250) NULL DEFAULT NULL,
  `email` VARCHAR(45) NULL DEFAULT NULL,
  `start_balance` DOUBLE NULL NOT NULL,
  `amount_to_save` DOUBLE NULL NOT NULL,
  PRIMARY KEY (`user_id`))
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8;

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES 	(1,'Henry','Mangelsdorf','washtenaw123','henry@gmail.com',15000.00,2400.00),
							(2,'David','Bowie','labryinth44','goblinking@msn.com',2000.00,5000.00),
                            (3,'Keanu','Reeves','billandted3','reeves@gmail.com',150.00,500.00);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

-- -----------------------------------------------------
-- Table `gogomoney04-01`.`financial`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `gogomoney04-01`.`financial` ;

CREATE TABLE IF NOT EXISTS `gogomoney04-01`.`financial` (
  `financial_id` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL DEFAULT NULL,
  `income_outcome` VARCHAR(45) NOT NULL,
  `amount` DOUBLE NULL DEFAULT NULL,
  `user_id` INT(11) NULL DEFAULT NULL,
  `category` INT(11) NULL DEFAULT NULL,
  `recurring` VARCHAR(25) NULL DEFAULT 'FALSE',
  `recur_interval` VARCHAR(25) NOT NULL,
  `recurr_day` INT(11) NULL DEFAULT NULL,
  `recurr_count` INT(11) NULL DEFAULT NULL,
  `transaction_date` DATE NULL DEFAULT NULL,
  `entry_date` DATE NULL DEFAULT NULL,
  PRIMARY KEY (`financial_id`),
  INDEX `in_user_key_idx` (`user_id` ASC) VISIBLE,
  CONSTRAINT `in_user_fkey`
    FOREIGN KEY (`user_id`)
    REFERENCES `gogomoney04-01`.`user` (`user_id`))
ENGINE = InnoDB
AUTO_INCREMENT = 11
DEFAULT CHARACTER SET = utf8;

LOCK TABLES `financial` WRITE;
/*!40000 ALTER TABLE `financial` DISABLE KEYS */;
INSERT INTO `financial` VALUES 	(1,'Rent','Outcome',1200,1,1,'TRUE','Monthly',1,11,'2022-04-01','2022-04-01'),
								(2,'Netflix','Outcome',20,1,8,'TRUE','Monthly',15,5,'2022-03-15','2022-04-01'),
								(3,'Groceries','Outcome',55,1,5,'FALSE','Once',0,0,'2022-03-28','2022-04-01'),
                                (4,'Gas','Outcome',80,2,7,'FALSE','Once',0,0,'2022-03-17','2022-04-01'),
                                (5,'Charitable Donation','Outcome',3000,3,10,'FALSE','Once',0,0,'2022-03-19','2022-04-01'),
								(6,'Pay-Check','Income',400,1,11,'FALSE','Once',0,0,'2022-03-01','2022-04-01'),
                                (7,'Pay-Check','Income',390,1,11,'FALSE','Once',0,0,'2022-03-08','2022-04-01'),
                                (8,'Pay-Check','Income',440,1,11,'FALSE','Once',0,0,'2022-03-15','2022-04-01'),
                                (9,'Gift','Income',20,1,11,'FALSE','Once',0,0,'2022-03-17','2022-04-01'),
                                (10,'Royalties','Income',500,2,11,'FALSE','Once',0,0,'2022-03-19','2022-04-01');
/*!40000 ALTER TABLE `financial` ENABLE KEYS */;
UNLOCK TABLES;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
