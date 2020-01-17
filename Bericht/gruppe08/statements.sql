/*====================================
  Create TABLEs
  =====================================
*/
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

CREATE TABLE g8_InternerReferent(

RID int PRIMARY KEY,
Dienstnummer VARCHAR(30),
nebenstellennummer INTEGER,
	
FOREIGN KEY (RID) REFERENCES g8_referent(RID)

);


/*====================================
  Insert DATA
  =====================================
*/
INSERT INTO g8_referent(email, vorname, name) values 
	('julian.sobott@wtf.de', 'Julian', 'Sobott'),
	('david.sugar@wtf.de', 'David', 'Sugar'),
	('lukas.mendel@wtf.de', 'Lukas', 'Mendel'),
	('gregor.grambow@wtf.de', 'Gregor', 'Grambow');

INSERT INTO  g8_internerreferent(rid, dienstnummer, nebenstellennummer) VALUES (4, 1, 1);

INSERT INTO g8_externerreferent(rid, fax, telefon, plz, strasse, hnr, ort) values
	((select rid from g8_referent where name = 'Sugar' and vorname = 'David'), '1234', '1234', '73434', 'Aalen', 'Uni-Str', '111'),
	((select rid from g8_referent where name = 'Sobott' and vorname = 'Julian'), '1234', '1234', '73434', 'Aalen', 'Uni-Str', '111'),
	((select rid from g8_referent where name = 'Mendel' and vorname = 'Lukas'), '1234', '1234', '73434', 'Aalen', 'Uni-Str', '111');


INSERT INTO g8_seminarthema(anz_unterrichtseinheiten, kurzbeschreibung, max_teilnehmeranzahl, min_teilnehmeranzahl, preis, titel, leiter) values
	(10, 'Datenbanken Grundlagen erlernen.', 30, 5, 152.50, 'Datenbanken', (select rid from g8_referent where name = 'Grambow' and vorname = 'Gregor')),
	(2, 'We love RISC', 10, 1, 0.0, 'The ARM Architecture', (select rid from g8_referent where name = 'Sugar' and vorname = 'David')),
	(3, 'Its not a snake', 15, 3, 43.90, 'Python', (select rid from g8_referent where name = 'Sobott' and vorname = 'Julian'));

INSERT INTO g8_seminar (sthemaid)
values (1), (2), (3), (1), (3);

INSERT INTO g8_termin (von, bis, datum, seminarnummer)
values
('09:30', '13:00', '1999-12-01', 1),
('09:30', '13:00', '1999-12-01', 2),
('09:30', '13:00', '1999-12-01', 3),
('09:30', '13:00', '1999-12-01', 4),
('09:30', '13:00', '1999-12-01', 5),
('10:30', '18:45', '1999-12-01', 1),
('10:30', '18:45', '1999-12-01', 5);

INSERT INTO g8_kunde (telefon, name, fax, email, plz, ort, hnr, str)
values
('0176111', 'Pete', '0176-54', 'pete@bs.de', '12345', 'Buxdehude', '3', 'kennIchNichtWeg'),
('0176112', 'Steve', '0176-55', 'steve@bs.de', '12345', 'Buxdehude', '3', 'kennIchNichtWeg'),
('0176113', 'Eve', '0176-56', 'eve@bs.de', '12345', 'Buxdehude', '3', 'kennIchNichtWeg'),
('0176114', 'Paula', '0176-57', 'paula@bs.de', '12345', 'Buxdehude', '3', 'kennIchNichtWeg'),
('0176115', 'Klaus', '0176-58', 'klaus@bs.de', '12345', 'Buxdehude', '3', 'kennIchNichtWeg');

INSERT INTO g8_buchen (kundenid, seminarnummer, datum, zustand, rabatt)
values
(1, 1, '1999-12-01', 'gezahlt', 0.0),
(1, 2, '1999-12-01', 'gezahlt', 0.0),
(2, 1, '1999-12-01', 'berechnet', 0.3),
(2, 3, '1999-12-01', 'gezahlt', 0.0),
(3, 3, '1999-12-01', 'gebucht', 0.0),
(3, 4, '1999-12-01', 'gezahlt', 0.0),
(4, 3, '1999-12-01', 'gebucht', 0.0),
(5, 3, '1999-12-01', 'gebucht', 0.0),
(3, 2, '1999-12-01', 'offen', 0.0),
(1, 3, '1999-12-01', 'berechnet', 0.7);

INSERT INTO g8_warteliste (kundenid, seminarnummer, datum)
values
(1,1,'1999-12-01'),
(2,1,'1999-12-01'),
(3,2,'1999-12-01');


/*====================================
  Select Statements
  =====================================
*/
-- a) Wie viele Referenten
SELECT count(*) as AnzahlGesamt, count(fax) as AnzahlExtern, count(dienstnummer) as AnzahlIntern
FROM g8_referent FULL JOIN g8_externerreferent g8e on g8_referent.rid = g8e.rid FULL JOIN g8_internerreferent g8i on g8_referent.rid = g8i.rid;

-- b) Alle Seminare mit Anzahl Seminartermine
SELECT s.seminarnummer, COUNT(s.seminarnummer) as Anzal_Termine
FROM g8_seminar s JOIN g8_termin t on s.seminarnummer = t.seminarnummer
GROUP BY s.seminarnummer;

-- c) Alle Seminare mit Anzahl Teilnehmer
SELECT s.seminarnummer ,count(*) as Anzahl_Teilnehmer
FROM g8_seminar as s join g8_buchen b on s.seminarnummer = b.seminarnummer
GROUP BY s.seminarnummer;

-- d) Seminare mit der längsten Warteliste
SELECT seminarnummer, count(*)
FROM g8_warteliste
GROUP BY seminarnummer
HAVING count(*) >= ALL(
    SELECT count(*)
    FROM g8_seminar s JOIN g8_warteliste g8w on s.seminarnummer = g8w.seminarnummer
    GROUP BY s.seminarnummer
    );


-- e) Referenten mit Anzahl Teilnehmer
SELECT name, count(s.seminarnummer)
FROM g8_referent r JOIN g8_seminarthema st on r.rid = st.leiter JOIN g8_seminar s on st.sthemaid = s.sthemaid
    join g8_buchen b on s.seminarnummer = b.seminarnummer
GROUP BY r.rid, r.name;


-- f) Referenten mit Einnahmen

SELECT name, count(s.seminarnummer), sum(st.preis)
FROM g8_referent r JOIN g8_seminarthema st on r.rid = st.leiter JOIN g8_seminar s on st.sthemaid = s.sthemaid
    join g8_buchen b on s.seminarnummer = b.seminarnummer
GROUP BY r.name;
