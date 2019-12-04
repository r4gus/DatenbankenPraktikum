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

INSERT INTO g8_seminar (sthemaid)
values (1), (2), (3), (1), (3);

INSERT INTO g8_termin (von, bis, datum, seminarnummer)
values
('09:30', '13:00', '18/1/1999', 1),
('09:30', '13:00', '19/1/1999', 2),
('09:30', '13:00', '20/1/1999', 3),
('09:30', '13:00', '21/1/1999', 4),
('09:30', '13:00', '22/1/1999', 5),
('10:30', '18:45', '18/1/2050', 1),
('10:30', '18:45', '19/1/2050', 5);

INSERT INTO g8_kunde (telefon, name, fax, email, plz, ort, hnr, str)
values
('0176111', 'Pete', '0176-54', 'pete@bs.de', '12345', 'Buxdehude', '3', 'kennIchNichtWeg'),
('0176112', 'Steve', '0176-55', 'steve@bs.de', '12345', 'Buxdehude', '3', 'kennIchNichtWeg'),
('0176113', 'Eve', '0176-56', 'eve@bs.de', '12345', 'Buxdehude', '3', 'kennIchNichtWeg'),
('0176114', 'Paula', '0176-57', 'paula@bs.de', '12345', 'Buxdehude', '3', 'kennIchNichtWeg'),
('0176115', 'Klaus', '0176-58', 'klaus@bs.de', '12345', 'Buxdehude', '3', 'kennIchNichtWeg');

INSERT INTO g8_buchen (kundenid, seminarnummer, datum, zustand, rabatt)
values
(1, 1, '13/1/1999', 'gezahlt', 0.0),
(1, 2, '13/1/1999', 'gezahlt', 0.0),
(2, 1, '13/1/1999', 'berechnet', 0.3),
(2, 3, '13/1/1999', 'gezahlt', 0.0),
(3, 3, '14/1/1999', 'gebucht', 0.0),
(3, 4, '14/1/1999', 'gezahlt', 0.0),
(4, 3, '14/1/1999', 'gebucht', 0.0),
(5, 3, '14/1/1999', 'gebucht', 0.0),
(3, 2, '15/1/1999', 'offen', 0.0),
(1, 3, '14/1/1999', 'berechnet', 0.7);

INSERT INTO g8_warteliste (kundenid, seminarnummer, position)
values
(1,1,1),
(2,1,2),
(3,2,1);












