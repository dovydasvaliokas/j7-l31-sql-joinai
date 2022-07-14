-- dekarto sandauga prekės ir kategorijos lentelių (kikviena prekės eilutė sujungta su kiekviena kategorijos eilute)
SELECT *
FROM prekes
JOIN kategorija;

-- sujungtos prekių lentelės tik su ta kategorija, kuri yra tos prekės kategorija
SELECT *
FROM prekes
JOIN kategorija ON prekes.kategorijos_id = kategorija.id;


-- Noriu sužinoti kokia yra 6-tos prekės kategorija
SELECT kategorija.pavadinimas
FROM prekes
JOIN kategorija ON prekes.kategorijos_id = kategorija.id
WHERE prekes.id = 6;


-- Randame visas elektronikos kategorijos prekes
SELECT p.*
FROM prekes p
JOIN kategorija k ON p.kategorijos_id = k.id
WHERE k.pavadinimas = "elektronika";



-- Randame visų klientų jiems atitinkančius užsakymus
SELECT *
FROM uzsakymai u
JOIN klientai k ON u.kliento_id = k.id


-- RAndame penkto kliento užsakymus
SELECT *
FROM uzsakymai u
JOIN klientai k ON u.kliento_id = k.id
WHERE k.id = 5;


-- Randame kokių prekių ID yra užsisakęs penktas klientas
SELECT *
FROM uzsakymai u
JOIN klientai k ON u.kliento_id = k.id
JOIN uzsakymo_prekes up ON u.id = up.uzsakymo_id
WHERE k.id = 5;


-- Randame visų keturių tų lentelių junginį (visą reikalingą informaciją)
SELECT *
FROM uzsakymai u
JOIN klientai k ON u.kliento_id = k.id
JOIN uzsakymo_prekes up ON u.id = up.uzsakymo_id
JOIN prekes p ON p.id = up.prekes_id
WHERE k.id = 5;

-- rAndame kokias prekes perka penktas klientas
SELECT p.pavadinimas, p.aprasymas, p.kaina, up.prekes_kiekis
FROM uzsakymai u
JOIN klientai k ON u.kliento_id = k.id
JOIN uzsakymo_prekes up ON u.id = up.uzsakymo_id
JOIN prekes p ON p.id = up.prekes_id
WHERE k.id = 5;


-- PRie to pačio dar ir parašome tų prekių kategoriją
SELECT p.pavadinimas, p.aprasymas, p.kaina, kat.pavadinimas, up.prekes_kiekis
FROM uzsakymai u
JOIN klientai k ON u.kliento_id = k.id
JOIN uzsakymo_prekes up ON u.id = up.uzsakymo_id
JOIN prekes p ON p.id = up.prekes_id
JOIN kategorija kat ON kat.id = p.kategorijos_id
WHERE k.id = 5;