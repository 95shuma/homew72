USE `messenger` ;

-- Table `forum`.`users`
CREATE TABLE IF NOT EXISTS `messenger`.`users` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `login` VARCHAR(45) NOT NULL,
  `mail` VARCHAR(45) NOT NULL,
  `password` VARCHAR(128) NOT NULL,
  `enabled` boolean NOT NULL default true,
  `role` varchar(16) NOT NULL default 'USER',
  PRIMARY KEY (`id`))
ENGINE = InnoDB;