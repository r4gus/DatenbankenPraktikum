SELECT(
	(SELECT COUNT (rid) as AnzahlInterne
	FROM g8_InternerReferent),
	(SELECT COUNT (rid) as AnzahlExterne
	FROM g8_ExternerReferent),
	(SELECT COUNT (rid) as AnzahlGesamt
	FROM g8_referent)

);

SELECT seminarnnummer, COUNT(seminarnnummer)
FROM g8_seminar s JOIN g8_termin t on s.seminarnummer = t.seminarnummer
GROUP BY seminarnummer;

SELECT Seminarummer, COUNT(Seminarummer) as Teilnehmeranzahl
FROM g8_buchen b JOIN g8_seminar s on b.seminarnummer = s.seminarnummer
GROUP BY(Seminarnummer) 

SELET Seminarummer, , MAX()




