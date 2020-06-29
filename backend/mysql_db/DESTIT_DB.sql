-- SQL QUERY FOR THE CREATION OF "DESTIT" DATABASE
-- this query can be used in SQL interface of phpmyadmin
--
-- owner  : Mathieu RAYNAL    (mathieu.raynal@irit.fr)
-- dev    : Cyril ESCLASSAN   (cyril.esclassan@univ-tlse3.fr)
-- update : 2020.06.02


-- Creation de la base
-- -------------------

CREATE DATABASE IF NOT EXISTS DESTIT_DB
  CHARACTER SET 'utf8';

USE DESTIT_DB;

-- Creation des tables
-- -------------------

CREATE TABLE `CHERCHEUR` (
  `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `nom` VARCHAR(50) NOT NULL,
  `prenom` VARCHAR(50) NOT NULL,
  `mail` VARCHAR(100) DEFAULT NULL,
  `photo` VARCHAR(20) DEFAULT NULL,
  `site_web` VARCHAR(255) DEFAULT NULL, 
  -- -- -- -- --
  CONSTRAINT `pk_CHERCHEUR` PRIMARY KEY (`id`)
);


CREATE TABLE `NOM_OUVRAGE` (
  `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `nom` VARCHAR(255) NOT NULL,
  `abbreviation` VARCHAR(100),
  `type` ENUM('conference', 'journal', 'livre') DEFAULT NULL,
  -- -- -- -- --
  CONSTRAINT `pk_NOM_OUVRAGE` PRIMARY KEY (`id`)
);


CREATE TABLE `OUVRAGE` (
  `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `id_nom_ouvrage` INT(10) UNSIGNED NOT NULL,
  `annee` INT(4) UNSIGNED NOT NULL,
  `lieu` VARCHAR(100) DEFAULT NULL,
  -- -- -- -- --
  CONSTRAINT `pk_OUVRAGE` 
    PRIMARY KEY (`id`),
  CONSTRAINT `fk_OUVRAGE_NOM_OUVRAGE` 
    FOREIGN KEY (`id_nom_ouvrage`) 
    REFERENCES `NOM_OUVRAGE`(`id`) 
    ON DELETE CASCADE
    ON UPDATE CASCADE
);


CREATE TABLE `PUBLICATION` (
  `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `titre` VARCHAR(255) NOT NULL,
  `resume` VARCHAR(255) DEFAULT NULL,
  `photo` VARCHAR(20) DEFAULT NULL,
  `id_ouvrage` INT(10) UNSIGNED NOT NULL,
  `page` SMALLINT(5) UNSIGNED DEFAULT NULL,
  `numero` SMALLINT(5) UNSIGNED DEFAULT NULL,
  `volume` SMALLINT(5) UNSIGNED DEFAULT NULL,
  `lien_article` VARCHAR(255) DEFAULT NULL,
  -- -- -- -- --
  CONSTRAINT `pk_PUBLICATION`
    PRIMARY KEY (`id`),
  CONSTRAINT `fk_PUBLICATION_OUVRAGE`
    FOREIGN KEY (`id_ouvrage`)
    REFERENCES `OUVRAGE`(`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);

CREATE TABLE `AUTEURS` (
  `id_publication` INT(10) UNSIGNED NOT NULL,
  `id_chercheur` INT(10) UNSIGNED NOT NULL,
  -- -- -- -- --
  CONSTRAINT `pk_AUTEURS`
    PRIMARY KEY (`id_publication`, `id_chercheur`),
  CONSTRAINT `fk_AUTEURS_PUBLICATION`
    FOREIGN KEY (`id_publication`)
    REFERENCES `PUBLICATION`(`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_AUTEURS_CHERCHEUR`
    FOREIGN KEY (`id_chercheur`)
    REFERENCES `CHERCHEUR`(`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);


