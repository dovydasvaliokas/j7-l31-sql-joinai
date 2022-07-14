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