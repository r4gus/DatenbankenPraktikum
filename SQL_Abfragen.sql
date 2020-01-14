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
HAVING count(*) = (
    SELECT max(anz) as length
    FROM (
        SELECT w.seminarnummer, count(*) as anz
        FROM g8_warteliste w
        GROUP BY w.seminarnummer
        ) as sa
    );

-- e) Referenten mit Anzahl Teilnehmer TODO
SELECT name, kurzbeschreibung, count(s.seminarnummer), s.seminarnummer
FROM g8_referent r JOIN g8_seminarthema st on r.rid = st.leiter JOIN g8_seminar s on st.sthemaid = s.sthemaid
    join g8_buchen b on s.seminarnummer = b.seminarnummer
GROUP BY s.seminarnummer, r.name, kurzbeschreibung, st.sthemaid;

SELECT name, titel, st.sthemaid, s.seminarnummer, b.kundenid
FROM g8_referent r JOIN g8_seminarthema st on r.rid = st.leiter JOIN
    g8_seminar s on st.sthemaid = s.sthemaid JOIN g8_buchen b on s.seminarnummer = b.seminarnummer
GROUP BY st.sthemaid, titel, name, s.seminarnummer, b.kundenid;
