-- SQL QUERY FOR THE CREATION OF "DESTIT" DATABASE
-- this query can be used in SQL interface of phpmyadmin
--
-- owner  : Mathieu RAYNAL    (mathieu.raynal@irit.fr)
-- dev    : Cyril ESCLASSAN   (cyril.esclassan@univ-tlse3.fr)
-- update : 2020-07-07


-- Creation de la base
-- -------------------

DROP DATABASE IF EXISTS `DESTIT_DB`;
CREATE DATABASE IF NOT EXISTS `DESTIT_DB`;

USE DESTIT_DB;

-- Creation des tables
-- -------------------

-- researcher([id], name, firstname, photo, mail, website)
CREATE TABLE `RESEARCHER` (
  `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(64) NOT NULL,
  `firstname` VARCHAR(64) NOT NULL,
  `mail` VARCHAR(256) DEFAULT NULL,
  `photo` VARCHAR(64) DEFAULT NULL,
  `website` VARCHAR(256) DEFAULT NULL, 
  -- -- -- -- --
  CONSTRAINT `pk_RESEARCHER` PRIMARY KEY (`id`)
);

-- work_name([id], name, abbreviation, type) 
-- * type: (conference | newspaper | book)
CREATE TABLE `WORK_NAME` (
  `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(256) NOT NULL,
  `abbreviation` VARCHAR(64),
  `type` ENUM('conference', 'newspaper', 'book') DEFAULT NULL,
  -- -- -- -- --
  CONSTRAINT `pk_WORK_NAME` PRIMARY KEY (`id`)
);

-- work([id], #id_work_name, year, place)
CREATE TABLE `WORK` (
  `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `id_work_name` INT(10) UNSIGNED NOT NULL,
  `year` INT(4) UNSIGNED NOT NULL,
  `place` VARCHAR(256) DEFAULT NULL,
  -- -- -- -- --
  CONSTRAINT `pk_WORK` PRIMARY KEY (`id`),
  CONSTRAINT `fk_WORK_WORK_NAME` 
    FOREIGN KEY (`id_work_name`) 
    REFERENCES `WORK_NAME`(`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);

-- publication([id], title, summary, photo, #id_work, 
--    pages, number, volume, article_link)
CREATE TABLE `PUBLICATION` (
  `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(256) NOT NULL,
  `summary` VARCHAR(256) DEFAULT NULL,
  `photo` VARCHAR(64) DEFAULT NULL,
  `id_work` INT(10) UNSIGNED NOT NULL,
  `pages` SMALLINT(5) UNSIGNED DEFAULT NULL,
  `number` SMALLINT(5) UNSIGNED DEFAULT NULL,
  `volume` SMALLINT(5) UNSIGNED DEFAULT NULL,
  `article_link` VARCHAR(256) DEFAULT NULL,
  -- -- -- -- --
  CONSTRAINT `pk_PUBLICATION` PRIMARY KEY (`id`),
  CONSTRAINT `fk_PUBLICATION_WORK`
    FOREIGN KEY (`id_work`)
    REFERENCES `WORK`(`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);

-- author([#id_publication, #id_researcher])
CREATE TABLE `AUTHOR` (
  `id_publication` INT(10) UNSIGNED NOT NULL,
  `id_researcher` INT(10) UNSIGNED NOT NULL,
  -- -- -- -- --
  CONSTRAINT `pk_AUTHOR`
    PRIMARY KEY (`id_publication`, `id_researcher`),
  CONSTRAINT `fk_AUTHOR_PUBLICATION`
    FOREIGN KEY (`id_publication`)
    REFERENCES `PUBLICATION`(`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_AUTHOR_RESEARCHER`
    FOREIGN KEY (`id_researcher`)
    REFERENCES `RESEARCHER`(`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);

-- system([id], name, description)
CREATE TABLE `SYSTEM` (
  `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(256) NOT NULL,
  `description` VARCHAR(256) NOT NULL,
  -- -- -- -- --
  CONSTRAINT `pk_SYSTEM` PRIMARY KEY (`id`)
);

-- project([id], name, description)
CREATE TABLE `PROJECT` (
  `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(256) NOT NULL,
  `description` VARCHAR(256) NOT NULL,
  -- -- -- -- --
  CONSTRAINT `pk_PROJECT` PRIMARY KEY (`id`)
);

-- link_project_system([#id_project, #id_system])
CREATE TABLE `LINK_PROJECT_SYSTEM` (
  `id_project` INT(10) UNSIGNED NOT NULL,
  `id_system` INT(10) UNSIGNED NOT NULL,
  -- -- -- -- --
  CONSTRAINT `pk_LINK_PROJECT_SYSTEM` 
    PRIMARY KEY (`id_project`, `id_system`),
  CONSTRAINT `fk_LINK_PROJECT_SYSTEM_PROJECT`
    FOREIGN KEY (`id_project`)
    REFERENCES `PROJECT`(`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_LINK_PROJECT_SYSTEM_SYSTEM`
    FOREIGN KEY (`id_system`)
    REFERENCES `SYSTEM`(`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);

-- configuration([id], #id_system, description, material, input_device, 
--     disability, method, number_of_keys, navigation, selection) 
-- * material: (computer | smartphone | mobile phone | smartwatch ...)
-- * input_device: (mouse | trackball | eyetracker ...)
-- * disability: (motor | visually_impaired)
-- * method: (key-based | gesture-based)
-- * navigation: (direct | switch-scanning | indirect-pointer)
-- * selection: (discrete | continuous)
CREATE TABLE `CONFIGURATION` (
  `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `id_system` INT(10) UNSIGNED NOT NULL,
  `description` VARCHAR(255) NOT NULL,
  `material` ENUM('computer', 'smartphone', 'mobile phone', 'smartwatch', 'other') 
      NOT NULL DEFAULT 'other',
  `input_device` ENUM('mouse', 'trackball', 'eyetracker', 'other')
      NOT NULL DEFAULT 'other',
  `disability` ENUM('motor', 'visually impaired', 'other')
      NOT NULL DEFAULT 'other',
  `method` ENUM('key based', 'gesture based', 'other')
      NOT NULL DEFAULT 'other',
  `number_of_keys` SMALLINT(5) NOT NULL,
  `navigation` ENUM('direct', 'switch scanning', 'indirect pointer', 'other')
      NOT NULL DEFAULT 'other',
  `selection` ENUM('discrete', 'continuous', 'other') NOT NULL DEFAULT 'other',
  -- -- -- -- --
  CONSTRAINT `pk_CONFIGURATION` PRIMARY KEY (`id`),
  CONSTRAINT `fk_CONFIGURATION_SYSTEM`
    FOREIGN KEY (`id_system`)
    REFERENCES `SYSTEM`(`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);

-- associated_resources([id], #id_configuration, uri, type)
-- * type: (video | web ...)
CREATE TABLE `ASSOCIATED_RESOURCES` (
  `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `id_configuration` INT(10) UNSIGNED NOT NULL,
  `uri` VARCHAR(256),
  `type` ENUM('video', 'web', 'other'),
  -- -- -- -- --
  CONSTRAINT `pk_ASSOCIATED_RESOURCES` PRIMARY KEY (`id`),
  CONSTRAINT `fk_ASSOCIATED_RESOURCES_CONFIGURATION`
    FOREIGN KEY (`id_configuration`)
    REFERENCES `CONFIGURATION`(`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);

-- associated_publications([#id_publication, #id_configuration])
CREATE TABLE ASSOCIATED_PUBLICATIONS (
  `id_publication` INT(10) UNSIGNED NOT NULL,
  `id_configuration` INT(10) UNSIGNED NOT NULL,
  -- -- -- -- --
  CONSTRAINT `pk_ASSOCIATED_PUBLICATION` 
    PRIMARY KEY (`id_publication`, `id_configuration`),
  CONSTRAINT `fk_ASSOCIATED_PUBLICATION_PUBLICATION`
    FOREIGN KEY (`id_publication`)
    REFERENCES `PUBLICATION`(`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_ASSOCIATED_PUBLICATION_CONFIGURATION`
    FOREIGN KEY (`id_configuration`)
    REFERENCES `CONFIGURATION`(`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);

-- prediction_system([id], #id_configuration, type)
-- * type: (prediction | disambiguation | completion | deduction) 
CREATE TABLE `PREDICTION_SYSTEM` (
  `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `id_configuration` INT(10) UNSIGNED NOT NULL,
  `type` ENUM('prediction', 'disambiguation', 'completion', 'deduction', 'other')
      NOT NULL DEFAULT 'other',
  -- -- -- -- --
  CONSTRAINT `pk_PREDICTION_SYSTEM` PRIMARY KEY (`id`),
  CONSTRAINT `fk_PREDICTION_SYSTEM_CONFIGURATION`
    FOREIGN KEY (`id_configuration`)
    REFERENCES `CONFIGURATION`(`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);

-- transformation([id], #id_configuration, type)
-- * type: (key layout | key size | color)
CREATE TABLE `TRANSFORMATION` (
  `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `id_configuration` INT(10) UNSIGNED NOT NULL,
  `type` ENUM('key layout', 'key size', 'color', 'other')
      NOT NULL DEFAULT 'other',
  -- -- -- -- --
  CONSTRAINT `pk_TRANSFORMATION` PRIMARY KEY (`id`),
  CONSTRAINT `fk_TRANSFORMATION_CONFIGURATION`
    FOREIGN KEY (`id_configuration`)
    REFERENCES `CONFIGURATION`(`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);

-- output([id], #id_configuration, type)
-- * type: (word | character)
CREATE TABLE `OUTPUT` (
  `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `id_configuration` INT(10) UNSIGNED NOT NULL,
  `type` ENUM('word', 'character', 'other')
      NOT NULL DEFAULT 'other',
  -- -- -- -- --
  CONSTRAINT `pk_OUTPUT` PRIMARY KEY (`id`),
  CONSTRAINT `fk_OUTPUT_CONFIGURATION`
    FOREIGN KEY (`id_configuration`)
    REFERENCES `CONFIGURATION`(`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);

-- widget([id], #id_configuration, type) 
-- * type: (list | menu | key)
CREATE TABLE `WIDGET` (
  `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `id_configuration` INT(10) UNSIGNED NOT NULL,
  `type` ENUM('list', 'menu', 'key', 'other')
      NOT NULL DEFAULT 'other',
  -- -- -- -- --
  CONSTRAINT `pk_WIDGET` PRIMARY KEY (`id`),
  CONSTRAINT `fk_WIDGET_CONFIGURATION`
    FOREIGN KEY (`id_configuration`)
    REFERENCES `CONFIGURATION`(`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);
