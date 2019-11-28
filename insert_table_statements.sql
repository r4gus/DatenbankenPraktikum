INSERT INTO g8_referent(email, vorname, name) values 
	('julian.sobott@wtf.de', 'Julian', 'Sobott'),
	('david.sugar@wtf.de', 'David', 'Sugar'),
	('lukas.mendel@wtf.de', 'Lukas', 'Mendel'),
	('gregor.grambow@wtf.de', 'Gregor', 'Grambow');

INSERT INTO g8_internerreferent(rid, plz, ort, strasse, hnr) values
	((select rid from g8_referent where name = 'Grambow' and vorname = 'Gregor'), '73434', 'Aalen', 'Uni-Str', '111');

INSERT INTO g8_externerreferent(rid, plz, ort, strasse, hnr) values
	((select rid from g8_referent where name = 'Sugar' and vorname = 'David'), '73434', 'Aalen', 'Uni-Str', '111'),
	((select rid from g8_referent where name = 'Sobott' and vorname = 'Julian'), '73434', 'Aalen', 'Uni-Str', '111'),
	((select rid from g8_referent where name = 'Mendel' and vorname = 'Lukas'), '73434', 'Aalen', 'Uni-Str', '111');


INSERT INTO g8_seminarthema(anz_unterrichtseinheiten, kurzbeschreibung, max_teilnehmeranzahl, min_teilnehmeranzahl, preis, titel, leiter) values
	(10, 'Datenbanken Grundlagen erlernen.', 30, 5, 152.50, 'Datenbanken', (select rid from g8_referent where name = 'Grambow' and vorname = 'Gregor')),
	(2, 'We love RISC', 10, 1, 0.0, 'The ARM Architecture', (select rid from g8_referent where name = 'Sugar' and vorname = 'David')),
	(3, 'Its not a snake', 15, 3, 43.90, 'Python', (select rid from g8_referent where name = 'Julian' and vorname = 'Sobott'));









