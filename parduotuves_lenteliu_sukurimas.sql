-- kategorijos lentelė
CREATE TABLE IF NOT EXISTS kategorija(
    id SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
    pavadinimas VARCHAR(50) NOT NULL,
    PRIMARY KEY(id)
) ENGINE = INNODB;

-- pridedu aprašymo stulpelį į kategoriją
ALTER TABLE kategorija
ADD COLUMN aprasymas VARCHAR(300)

-- pareigų lentelė
CREATE TABLE IF NOT EXISTS pareigos (
    id TINYINT UNSIGNED NOT NULL AUTO_INCREMENT,
    pavadinimas VARCHAR(50) NOT NULL,
    bonusas DECIMAL(6,2) DEFAULT 0,
    PRIMARY KEY(id)
) ENGINE = INNODB;

-- adresų lentelė
CREATE TABLE IF NOT EXISTS adresai (
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    gatve VARCHAR(50) NOT NULL,
    namo_nr SMALLINT UNSIGNED NOT NULL,
    buto_nr SMALLINT UNSIGNED,
    miestas VARCHAR(50) NOT NULL,
    salis VARCHAR(50) NOT NULL,
    pasto_kodas VARCHAR(8),
    PRIMARY KEY(id)
) ENGINE = INNODB;

-- klientų lentelė
CREATE TABLE IF NOT EXISTS klientai(
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    vardas VARCHAR(50) NOT NULL,
    pavarde VARCHAR(50) NOT NULL,
    PRIMARY KEY(id)
) ENGINE = INNODB;


---------------- DABAR JAU LENTELĖS SU FOREIGN KEY ------------------
-- užsakymų lentelė
CREATE TABLE IF NOT EXISTS uzsakymai(
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    adreso_id INT UNSIGNED NOT NULL,
    kliento_id INT UNSIGNED NOT NULL,
    PRIMARY KEY(id),
    FOREIGN KEY(kliento_id) REFERENCES klientai(id),
    FOREIGN KEY(adreso_id) REFERENCES adresai(id)
) ENGINE = INNODB;

-- prekių lentelė
CREATE TABLE IF NOT EXISTS prekes(
    id MEDIUMINT UNSIGNED NOT NULL AUTO_INCREMENT,
    pavadinimas VARCHAR(50) NOT NULL,
    aprasymas VARCHAR(300),
    kaina DECIMAL(7,2) UNSIGNED NOT NULL,
    kiekis SMALLINT UNSIGNED NOT NULL,
    kategorijos_id SMALLINT UNSIGNED,
    PRIMARY KEY(id),
    FOREIGN KEY (kategorijos_id) REFERENCES kategorija(id)
) ENGINE = INNODB;


-- užsakymo prekių sujungimo lentelė
CREATE TABLE IF NOT EXISTS `uzsakymo_prekes` (
  `uzsakymo_id` int(10) UNSIGNED NOT NULL,
  `prekes_id` mediumint(8) UNSIGNED NOT NULL,
  `prekes_kiekis` smallint(5) UNSIGNED NOT NULL,
  FOREIGN KEY(`uzsakymo_id`) REFERENCES `uzsakymai` (`id`) ,
  FOREIGN KEYFOREIGN KEY (`prekes_id`) REFERENCES `prekes` (`id`) 
) ENGINE=InnoDB;

-- telefonų lentelė
CREATE TABLE IF NOT EXISTS telefonai(
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    salies_kodas SMALLINT UNSIGNED NOT NULL,
    numeris INT UNSIGNED NOT NULL,
    kliento_id INT UNSIGNED NOT NULL,
    PRIMARY KEY(id),
    FOREIGN KEY(kliento_id) REFERENCES klientai(id)
) ENGINE = INNODB;