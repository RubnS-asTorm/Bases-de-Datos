-- -----------------------------------------------------
-- Database Startrekfans_v1.0
-- -----------------------------------------------------
DROP DATABASE IF EXISTS `Startrekfans_v2.0` ;
CREATE DATABASE IF NOT EXISTS `Startrekfans_v2.0` ;
USE `Startrekfans_v2.0` ;

-- -----------------------------------------------------
-- Table `Personajes`
-- -----------------------------------------------------
DROP TABLE IF EXISTS Personajes ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS Personajes (
  idPersonaje INT NOT NULL AUTO_INCREMENT,
  nombre VARCHAR(50) NOT NULL,
  raza VARCHAR(50) NOT NULL,
  graduacionMilitar VARCHAR(50) NOT NULL,
  JefeDe_idPersonaje INT NOT NULL,
  PRIMARY KEY (idPersonaje),
  CONSTRAINT fk_Personajes_Personajes1
    FOREIGN KEY (JefeDe_idPersonaje)
    REFERENCES Personajes (idPersonaje)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `Actores`
-- -----------------------------------------------------
DROP TABLE IF EXISTS Actores ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS Actores (
  idActor INT NOT NULL AUTO_INCREMENT,
  nombre VARCHAR(50) NOT NULL,
  nacionalidad VARCHAR(50) NOT NULL,
  fecha DATE NOT NULL,
  Personajes_idPersonajes INT NOT NULL,
  PRIMARY KEY (idActor),
  CONSTRAINT fk_Actores_Personajes
    FOREIGN KEY (Personajes_idPersonaje)
    REFERENCES Personajes (idPersonaje)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `Peliculas`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Peliculas` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `Peliculas` (
  `idPeliculas` INT NOT NULL AUTO_INCREMENT,
  `año` DATE NOT NULL,
  `director` VARCHAR(45) NOT NULL,
  `titulo` VARCHAR(200) NOT NULL,
  `Personajes_idPersonajes` INT NOT NULL,
  PRIMARY KEY (`idPeliculas`, `Personajes_idPersonajes`),
  INDEX `fk_Peliculas_Personajes1_idx` (`Personajes_idPersonajes` ASC) VISIBLE,
  CONSTRAINT `fk_Peliculas_Personajes1`
    FOREIGN KEY (`Personajes_idPersonajes`)
    REFERENCES `Personajes` (`idPersonajes`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `protagoniza`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `protagoniza` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `protagoniza` (
  `Personajes_idPersonajes` INT NOT NULL,
  `Peliculas_idPeliculas` INT NOT NULL,
  PRIMARY KEY (`Personajes_idPersonajes`, `Peliculas_idPeliculas`),
  INDEX `fk_Personajes_has_Peliculas_Peliculas1_idx` (`Peliculas_idPeliculas` ASC) VISIBLE,
  INDEX `fk_Personajes_has_Peliculas_Personajes1_idx` (`Personajes_idPersonajes` ASC) VISIBLE,
  CONSTRAINT `fk_Personajes_has_Peliculas_Personajes1`
    FOREIGN KEY (`Personajes_idPersonajes`)
    REFERENCES `Personajes` (`idPersonajes`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Personajes_has_Peliculas_Peliculas1`
    FOREIGN KEY (`Peliculas_idPeliculas`)
    REFERENCES `Peliculas` (`idPeliculas`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `Capitulos`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Capitulos` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `Capitulos` (
  `idCapitulos` INT NOT NULL AUTO_INCREMENT,
  `temporada` ENUM("1", "2", "3", "4") NOT NULL,
  `titulo` VARCHAR(200) NOT NULL,
  `primeraEmision` DATE NOT NULL,
  PRIMARY KEY (`idCapitulos`, `temporada`))
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `aparece`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `aparece` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `aparece` (
  `Capitulos_idCapitulos` INT NOT NULL,
  `Personajes_idPersonajes` INT NOT NULL,
  PRIMARY KEY (`Capitulos_idCapitulos`, `Personajes_idPersonajes`),
  INDEX `fk_Capitulos_has_Personajes_Personajes1_idx` (`Personajes_idPersonajes` ASC) VISIBLE,
  INDEX `fk_Capitulos_has_Personajes_Capitulos1_idx` (`Capitulos_idCapitulos` ASC) VISIBLE,
  CONSTRAINT `fk_Capitulos_has_Personajes_Capitulos1`
    FOREIGN KEY (`Capitulos_idCapitulos`)
    REFERENCES `Capitulos` (`idCapitulos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Capitulos_has_Personajes_Personajes1`
    FOREIGN KEY (`Personajes_idPersonajes`)
    REFERENCES `Personajes` (`idPersonajes`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `Planeta`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Planeta` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `Planeta` (
  `idPlaneta` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `galaxia` VARCHAR(70) NOT NULL,
  `motivoVisita` VARCHAR(250) NOT NULL,
  PRIMARY KEY (`idPlaneta`))
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `Nave`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Nave` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `Nave` (
  `idNave` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `tripulantes` VARCHAR(300) NOT NULL,
  PRIMARY KEY (`idNave`))
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `Capitulos_has_Nave`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Capitulos_has_Nave` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `Capitulos_has_Nave` (
  `Capitulos_idCapitulos` INT NOT NULL,
  `Capitulos_temporada` ENUM("1", "2", "3", "4") NOT NULL,
  `Nave_idNave` INT NOT NULL,
  `Planeta_idPlaneta` INT NOT NULL,
  PRIMARY KEY (`Capitulos_idCapitulos`, `Capitulos_temporada`, `Nave_idNave`, `Planeta_idPlaneta`),
  INDEX `fk_Capitulos_has_Nave_Nave1_idx` (`Nave_idNave` ASC) VISIBLE,
  INDEX `fk_Capitulos_has_Nave_Capitulos1_idx` (`Capitulos_idCapitulos` ASC, `Capitulos_temporada` ASC) VISIBLE,
  INDEX `fk_Capitulos_has_Nave_Planeta1_idx` (`Planeta_idPlaneta` ASC) VISIBLE,
  CONSTRAINT `fk_Capitulos_has_Nave_Capitulos1`
    FOREIGN KEY (`Capitulos_idCapitulos` , `Capitulos_temporada`)
    REFERENCES `Capitulos` (`idCapitulos` , `temporada`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Capitulos_has_Nave_Nave1`
    FOREIGN KEY (`Nave_idNave`)
    REFERENCES `Nave` (`idNave`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Capitulos_has_Nave_Planeta1`
    FOREIGN KEY (`Planeta_idPlaneta`)
    REFERENCES `Planeta` (`idPlaneta`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;