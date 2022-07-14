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

