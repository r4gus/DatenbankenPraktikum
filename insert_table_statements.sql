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
