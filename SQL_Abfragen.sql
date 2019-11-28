SELECT(
	(SELECT COUNT (rid) as AnzahlInterne
	FROM g8_InternerReferent),
	(SELECT COUNT (rid) as AnzahlExterne
	FROM g8_ExternerReferent),
	(SELECT COUNT (rid) as AnzahlGesamt
	FROM g8_referent)

);



