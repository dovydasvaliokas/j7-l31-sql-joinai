-- kategorijos lentelė
CREATE TABLE IF NOT EXISTS kategorija(
    id SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
    pavadinimas VARCHAR(50) NOT NULL,
    PRIMARY KEY(id)
) ENGINE = INNODB;

-- pridedu aprašymo stulpelį į kategoriją
ALTER TABLE kategorija
ADD COLUMN aprasymas VARCHAR(300)