
DROP SCHEMA IF EXISTS `events`;

CREATE SCHEMA IF NOT EXISTS `events` DEFAULT CHARACTER SET utf8 ;
USE `events` ;

-- -----------------------------------------------------
-- USERS
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `users` (
  `idusr` INT NOT NULL AUTO_INCREMENT,
  `email` VARCHAR(100) NOT NULL,
  `pass` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`idusr`));

-- -----------------------------------------------------
-- TYPES (events)
-- -----------------------------------------------------
  CREATE TABLE IF NOT EXISTS `types` (
  `idtype` INT NOT NULL AUTO_INCREMENT,
  `type` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`idtype`));

-- -----------------------------------------------------
-- EVENTS
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `events` (
  `idevent` INT NOT NULL AUTO_INCREMENT,
  `idtype` INT NULL,
  `ename` VARCHAR(100) NOT NULL,
  `manager` VARCHAR(100) NULL,
  `mcharge` VARCHAR(100) NULL,
  `beginhr` TIME NOT NULL,
  `finishhr` TIME NOT NULL,
  `day` INT(2) NOT NULL,
  `size` INT NOT NULL,
  CONSTRAINT `fk_types` 
    FOREIGN KEY (`idtype`) REFERENCES `types`(`idtype`),
  PRIMARY KEY (`idevent`));

-- -----------------------------------------------------
-- USERS_EVENTS
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `users_events` (
  `idusrevent` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `idusr` INT NOT NULL,
  `idevent` INT NOT NULL,
  PRIMARY KEY (`idusrevent`),
  CONSTRAINT `fk_users_events_users` 
    FOREIGN KEY (`idusr`) REFERENCES `users`(`idusr`),
  CONSTRAINT `fk_users_events_events1`
    FOREIGN KEY (`idevent`) REFERENCES `events`(`idevent`));


SET FOREIGN_KEY_CHECKS = 0;

-- INSERT INTO `types` VALUES (null, 'Conferencia');
-- INSERT INTO `events` VALUES (null, 1, 'Importancia del Factor Humano en El Sector Automotriz', 'Cristian Sanchez Velasco', 'CEO', '17:00', 0, 30);
-- INSERT INTO `users` VALUES (null, 'cris@gmail.com', '1234');
-- INSERT INTO `users_events` VALUES (null, 1, 1);

INSERT INTO `types` (`idtype`, `type`) VALUES (null, 'Conferencia Magistral');
INSERT INTO `types` (`idtype`, `type`) VALUES (null, 'Panel Magistral');
INSERT INTO `types` (`idtype`, `type`) VALUES (null, 'Recorrido');
INSERT INTO `types` (`idtype`, `type`) VALUES (null, 'Concurso');
INSERT INTO `types` (`idtype`, `type`) VALUES (null, 'Conferencia');
INSERT INTO `types` (`idtype`, `type`) VALUES (null, 'Taller');
INSERT INTO `types` (`idtype`, `type`) VALUES (null, 'Exposición');



INSERT INTO `events` (`idtype`, `ename`, `manager`, `mcharge`, `beginhr`, `finishhr`, `day`, `size`) VALUES ( 1,"Tendencias de la Industria Automotriz","Ing. Armando Ávila Moreno","Vicepresidente de Manufactura de Nissan Mexicana","10:00","11:00",26,100);



select * from users_events inner join users using(idusr) inner join events using(idevent) inner join types using(idtype); 