CREATE TABLE g8_referent (
	rid serial PRIMARY KEY,
	email VARCHAR(50),
	name VARCHAR(50),
	vorname VARCHAR(50)
);

CREATE TABLE g8_seminarthema (
	sthemaid serial PRIMARY KEY,
	anz_unterrichtseinheiten INTEGER,
	kurzbeschreibung VARCHAR,
	max_teilnehmeranzahl INTEGER,
	min_teilnehmeranzahl INTEGER,
	preis FLOAT,
	titel VARCHAR(200),
	leiter INTEGER REFERENCES g8_referent(rid)
);

CREATE TABLE g8_anbieten (
	referenten_id INTEGER REFERENCES g8_referent(rid),
	sthemaid INTEGER REFERENCES g8_seminarthema(sthemaid),
	PRIMARY KEY (referenten_id, sthemaid)
);

CREATE TABLE g8_seminar (
	seminarnummer serial PRIMARY KEY,
	sthemaid INTEGER REFERENCES g8_seminarthema(sthemaid)
);


CREATE TABLE g8_termin (
	terminid serial PRIMARY KEY,
	von TIME,
	bis TIME,
	datum DATE,
	seminarnummer INTEGER REFERENCES g8_seminar(seminarnummer)
);

CREATE TABLE g8_kunde (
	kundenid serial PRIMARY KEY,
	telefon VARCHAR(20),
	name VARCHAR(50),
	fax VARCHAR(20),
	email VARCHAR(50),
	plz VARCHAR(10),
	ort VARCHAR(50),
	hnr VARCHAR(10),
	str VARCHAR(50)
);

CREATE TYPE g8_zustand as ENUM ('offen', 'gebucht', 'berechnet', 'gezahlt', 'storniert');

CREATE TABLE g8_buchen (
	kundenid INTEGER REFERENCES g8_kunde(kundenid),
	seminarnummer INTEGER REFERENCES g8_seminar(seminarnummer),
	datum DATE,
	zustand g8_zustand,
	rabatt FLOAT,
	PRIMARY KEY (kundenid, seminarnummer)
);

CREATE TABLE g8_warteliste (
	kundenid INTEGER REFERENCES g8_kunde(kundenid),
	seminarnummer INTEGER REFERENCES g8_seminar(seminarnummer),
	datum Date,
	PRIMARY KEY (kundenid, seminarnummer)
);

CREATE TABLE g8_ExternerReferent(

RID int PRIMARY KEY,
fax VARCHAR(50),
telefon VARCHAR(20),
PLZ VARCHAR(15),
Strasse VARCHAR(50),
Hnr VARCHAR (20),
Ort VARCHAR(50),
	
FOREIGN KEY (RID) REFERENCES g8_referent(RID)
);

CREATE TABLE g8_InternerRefrent(

RID int PRIMARY KEY,
Dienstnummer VARCHAR(30),
nebenstellennummer INTEGER,
	
FOREIGN KEY (RID) REFERENCES g8_referent(RID)

);
