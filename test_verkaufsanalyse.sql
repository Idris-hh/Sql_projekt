CREATE DATABASE test_verkaufsanalyse

-- Die Tabelle Produkte erstellen
CREATE TABLE Produkte ( 
ProduktID INTEGER,
Produktname TEXT,
Kategorie TEXT,
Preis DECIMAL(10, 2),
Produktkosten DECIMAL(10, 2),
Lagerbestand DECIMAL(10, 2)
);
-- Die Produkt tabelle eine neue Spalte hinzufügen
ALTER TABLE Produkte
ADD COLUMN Verkaufstatus ENUM("Aktive", "Ausverkauft", "Nicht Verfügbar") NOT NULL
-- Spalte Lagerbestand von Decimal zu Integer ändern
ALTER TABLE produkte 
MODIFY COLUMN Lagerbestand INT;
-- Tabelle Produkt die Daten hinzufügen
INSERT INTO produkte(ProduktID, Produktname, Kategorie, Preis, Produktkosten, Lagerbestand, Verkaufstatus)
VALUES (55250, "Kuchen", "Nährungsmittel", 5.99, 4.50, 20, "Aktive"),
	   (55251, "Fanta", "Nährungsmittel", 1.89, 0.89, 120, "Aktive"),
       (55252, "Coca Cola", "Nährungsmittel", 1.92, 0.92, 68, "Aktive"),
       (55253, "Bohnen", "Nährungsmittel", 1.99, 0.99, 50, "Aktive"),
       (55254, "Brot", "Nährungsmittel", 0.99, 0.5, 42, "Aktive"),
       (55255, "Milch", "Nährungsmittel", 0.89, 0.15, 85, "Aktive"),
       (55256, "Butter", "Nährungsmittel", 3.99, 1.99, 54, "Aktive"),
       (55257, "Eier", "Nährungsmittel", 2.99, 1.50, 400, "Aktive"),
       (55258, "Olivenöl", "Nährungsmittel", 8.99, 5.99, 63, "Aktive"),
       (55259, "Drohne", "Elektonik", 399.99, 250.99, 6, "Aktive"),
       (55261, "Kühlschrank", "Elektonik", 499.99, 350.99, 20, "Aktive"),
       (55262, "Fernsehen", "Elektonik", 199.99, 100.99, 10, "Aktive"),
       (55263, "Playstation", "Elektonik", 599.99, 450.99, 21, "Aktive"),
       (55264, "Tablet", "Elektonik", 99.99, 60.00, 25, "Aktive"),
       (55265, "Monitor", "Elektonik", 195.99, 105.99, 0, "Ausverkauft"),
       (55266, "Kopfhörer", "Elektonik", 36.99, 25.99, 0, "Ausverkauft"),
       (55267, "Teppich", "Textilien", 39.99, 30.99, 0, "Ausverkauft"),
       (55268, "Vorhäng", "Textilien", 22.99, 15.99, 3, "Aktive"),
       (55269, "Bettwäsche", "Textilien", 26.99, 12.99, 30, "Aktive"),
       (55270, "Tischdecke", "Textilien", 7.99, 5.99, 47, "Aktive"),
       (55271, "Jacken", "Textilien", 50.99, 41.99, 10, "Aktive"),
       (55272, "Bezügen", "Textilien", 15.99, 11.99, 0, "Ausverkauft"),
       (55273, "R-Tücher", "Textilien", 4.99, 3.00, 40, "Aktive"),
       (55274, "Handtüchern", "Textilien", 6.99, 5.99, 58, "Aktive"),
       (55275, "Mantel", "Textilien", 45.99, 39.99, 21, "Aktive"),
       (55276, "Jeans", "Textilien", 39.99, 31.99, 20, "Aktive"),
       (55277, "Sporthosen", "Textilien", 25.99, 20.00, 14, "Aktive"),
       (55278, "Pullover", "Textilien", 22.99, 18.00, 20, "Aktive"),
       (55279, "EisTee", "Textilien", 1.25, 0.89, 0, "Nicht Verfügbar"),
       (55280, "Laptop", "Elektonik", 850.99, 750.99, 10, "Aktive"),
       (55281, "Lederhose", "Textilien", 60.99, 40.99, 0, "Ausverkauft");
--  Produkte Tabelle anzeigen
SELECT * FROM produkte;

-- Tabelle Bestellungen ertellen
CREATE TABLE Bestellungen (
BestellID INTEGER,
KundenID INTEGER, 
ProduktID INTEGER,
Menge INTEGER,
Lieferstatus ENUM("Bestellt", "Zugestellt", "Versand", "Stoniert") NOT NULL,
Bestellkanal ENUM("Online", "Filiale", "Telefon") NOT NULL,
Bestelldatum DATE
);
-- Tabelle Bestellungen die Daten hinzufügen
INSERT INTO bestellungen(BestellID, KundenID, ProduktID, Menge, Lieferstatus, Bestellkanal, Bestelldatum)
VALUES (50, 19, 55269, 1, "Bestellt", "Online", "2025-01-10"),
       (37, 6, 55255, 4, "Zugestellt", "Filiale", "2025-01-21"),
       (54, 23, 55273, 2, "Versand", "Online", "2025-01-23"),
       (49, 18, 55268, 1, "Bestellt", "Online", "2025-01-29"),
       (48, 17, 55267, 1, "Bestellt", "Online", "2025-02-10"),
       (58, 27, 55277, 1, "Bestellt", "Online", "2025-02-17"),
       (32, 1, 55250, 4, "Versand", "Filiale", "2025-02-21"),
       (47, 6, 55266, 1, "Zugestellt", "Online", "2025-02-24"),
       (45, 14, 55264, 1, "Bestellt", "Online", "2025-03-09"),
       (43, 2, 55262, 1, "Bestellt", "Filiale", "2025-04-05"),
       (56, 5, 55275, 1, "Zugestellt", "Telefon", "2025-04-17"),
       (52, 21, 55271, 4, "Versand", "Online", "2025-05-25"),
       (39, 8, 55257, 2, "Bestellt", "Filiale", "2025-05-27"),
       (40, 9, 55258, 1, "Zugestellt", "Filiale", "2025-01-10"),
       (33, 2, 55251, 1, "Stoniert", "Filiale", "2025-06-13"),
       (38, 7, 55256, 5, "Zugestellt", "Filiale", "2025-07-08"),
       (46, 5, 55265, 1, "Zugestellt", "Filiale", "2025-07-13"),
       (36, 5, 55254, 10, "Bestellt", "Online", "2025-07-29"),
       (57, 6, 55276, 4, "Zugestellt", "Online", "2025-08-02"),
       (35, 4, 55253, 5, "Versand", "Filiale", "2025-08-06"),
       (61, 30, 55280, 5, "Zugestellt", "Online", "2025-08-19"),
       (42, 11, 55261, 1, "versand", "Online", "2025-09-19"),
       (44, 13, 55263, 2, "Zugestellt", "Filiale", "2025-10-01"),
       (41, 10, 55259, 2, "Zugestellt", "Filiale", "2025-10-15"),
       (34, 3, 55252, 6, "Zugestellt", "Online", "2025-10-17"),
       (53, 22, 55272, 2, "Zugestellt", "Online", "2025-10-17"),
       (60, 5, 55279, 2, "Versand", "Online", "2025-11-04"),
       (59, 28, 55278, 3, "Versand", "Filiale", "2025-11-07"),
       (51, 20, 55270, 3, "Versand", "Online", "2025-11-18"),
       (55, 24, 55274, 2, "Bestellt", "Telefon", "2025-11-22");
-- Tabelle Bestellungen anzeigen
SELECT * FROM bestellungen;       

-- Die Tabelle Kunden erstellen
CREATE TABLE Kunden (
KundenID INTEGER,
Kundenname TEXT, 
Region TEXT,
Geschlecht ENUM("Männlich", "Weiblich") NOT NULL,
Kundenkategorie ENUM("VIP", "Stammkunde", "Neu") NOT NULL
);
-- Die Spalte Region von TEXT zu ENUM ändern
ALTER TABLE kunden
MODIFY COLUMN Region ENUM("Nord", "Süd") NOT NULL;
-- Doppelte Einträge für einen Kunden Löschen
DELETE FROM kunden 
WHERE KundenID = 5 
AND Kundenname = 'Alia Hahn' 
LIMIT 3;  -- Da Alia Hahn 4 Einträge hat bleibt nur eine Eintrag, und die anderen 3 werden gelöscht
-- Doppelte Einträge für einen Kunden Löschen
DELETE FROM kunden 
WHERE KundenID = 2 
AND Kundenname = 'Jan Westerman' 
LIMIT 1;
-- Doppelte Einträge für einen Kunden Löschen
DELETE FROM kunden 
WHERE KundenID = 6 
AND Kundenname = 'Sofia Kurt' 
LIMIT 2;
-- Gelöschte Einträge ausfühlen
INSERT INTO kunden (KundenID, Kundenname, Region, Geschlecht, Kundenkategorie)
VALUES (15, "Patrick V", "Nord", "Männlich", "Stammkunde"),
       (16, "Samuel Eto", "Süd", "Männlich", "Stammkunde"),
       (25, "Cristiano Ronaldo", "Nord", "Männlich", "VIP"),
       (26, "Brunno f", "Nord", "Männlich", "VIP"),
       (29, "Kaka", "Süd", "Männlich", "Stammkunde");


-- Tabelle Kunden die Daten hinzufügen
INSERT INTO kunden(KundenID, Kundenname, Region, Geschlecht, Kundenkategorie)
VALUES (1, "Janina Meyer", "Nord", "Weiblich", "VIP"),
       (2, "Jan Westerman", "Nord", "Männlich", "Stammkunde"),
       (3, "Kahn Hummels", "Nord", "Männlich", "VIP"),
       (4, "Ayla Areyo", "Süd", "Weiblich", "Neu"),
       (5, "Alia Hahn", "Nord", "Weiblich", "VIP"),
       (6, "Sofia Kurt", "Süd", "Weiblich", "VIP"),
       (7, "Antonio Elman", "Nord", "Männlich", "Stammkunde"),
       (8, "Romano Fedro", "Nord", "Männlich", "Stammkunde"),
       (9, "Goiulusi Jm", "Süd", "Weiblich", "Neu"),
       (10, "Max Barista", "Nord", "Männlich", "Stammkunde"),
       (11, "Seedorf Alex", "Süd", "Männlich", "Stammkunde"),
       (2, "Jan Westerman", "Nord", "Männlich", "Stammkunde"),
       (13, "Federico Diego", "Süd", "Männlich", "Stammkunde"),
       (14, "Dexter Morgen", "Nord", "Männlich", "VIP"),
       (5, "Alia Hahn", "Nord", "Weiblich", "VIP"),
       (6, "Sofia Kurt", "Süd", "Weiblich", "VIP"),
       (17, "Cesc Fabrigas", "Süd", "Männlich", "Stammkunde"),
       (18, "Fransisca Hamms", "Nord", "Weiblich", "Stammkunde"),
       (19, "Jann David", "Nord", "Männlich", "Stammkunde"),
       (20, "Davian Will", "Süd", "Weiblich", "Neu"),
       (21, "Leif Neal", "Nord", "Weiblich", "Neu"),
       (22, "Eric Eyes", "Nord", "Männlich", "Stammkunde"),
       (23, "Kylen Pierce", "Süd", "Männlich", "VIP"),
       (24, "Landry Austin", "Nord", "Weiblich", "Neu"),
       (5, "Alia Hahn", "Nord", "Weiblich", "VIP"),
       (6, "Sofia Kurt", "Süd", "Weiblich", "VIP"),
       (27, "Felix J", "Süd", "Männlich", "Stammkunde"),
       (28, "Gia Rauch", "Süd", "Weiblich", "Stammkunde"),
       (5, "Alia Hahn", "Nord", "Weiblich", "Stammkunde"),
       (30, "Toni Wodawski", "Nord", "Weiblich", "VIP");
-- Tabelle Kunden anzeigen
SELECT * FROM Kunden;


-- Gesamtumsatz pro Monat berechnen
SELECT DATE_FORMAT(B.Bestelldatum, '%Y-%m') AS Monat, 
    SUM(P.Preis * B.Menge) AS Gesamtumsatz
FROM Bestellungen B
JOIN Produkte P ON B.ProduktID = P.ProduktID
GROUP BY Monat
ORDER BY Gesamtumsatz desc;

-- Top 5 umsatzstärksten Produkte finden
SELECT P.Produktname, SUM(P.Preis * B.Menge) AS Umsatz
FROM produkte P
INNER JOIN bestellungen B ON P.ProduktID = B.ProduktID
GROUP BY P.Produktname
ORDER BY Umsatz DESC
LIMIT 5;

-- Umsatz nach Kategorie und Region
SELECT K.Region, P.Kategorie, SUM(Preis * Menge) AS Umsatz
FROM kunden K
INNER JOIN bestellungen B ON K.KundenID = B.KundenID
INNER JOIN produkte P ON B.ProduktID = P.ProduktID
GROUP BY K.Region, P.Kategorie
ORDER BY Umsatz DESC;

-- Kunden mit den meisten Bestellungen
SELECT K.KundenID, K.Kundenname, COUNT(B.BestellID) AS bestellungen
FROM Kunden K
INNER JOIN bestellungen B ON B.KundenID = K.KundenID
GROUP BY K.KundenID, K.Kundenname
ORDER BY bestellungen DESC;

