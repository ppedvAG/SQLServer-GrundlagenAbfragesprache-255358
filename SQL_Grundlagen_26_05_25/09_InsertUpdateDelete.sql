USE Northwind

-- CREATE / ALTER / DROP (DDL - Data Definition Language)

-- Immer wenn wir Datenbankobjekte "bearbeiten" gelten diese Befehle

-- CREATE: Erstellt Tabellen oder Datenbanken

-- Datenbank erstellen
CREATE DATABASE XYZ

-- Tabelle erstellen
CREATE TABLE PurchasingOrders
(
	-- IDENTITY(1, 1) => Start bei 1, inkrementiert immer um 1 höher
	ID INT IDENTITY(1, 1) PRIMARY KEY,
	OrderDate DATE NOT NULL, -- NOT NULL => Spalte muss befüllt WERDEN
	ProductID INT NOT NULL
)

SELECT * FROM PurchasingOrders

-- Beziehung zwischen PurchasingOrders und Products anlegen über ProductID

-- ALTER: Immer wenn wir nachträglich was an unserer Struktur ändern wollen
ALTER TABLE PurchasingOrders
ADD FOREIGN KEY (ProductID) REFERENCES Products (ProductID)

-- Neue Spalte hinzufuegen zu bestehendem Table:
ALTER TABLE PurchasingOrders
ADD TestDaten INT NULL

-- Spalte nach Datentyp ändern
ALTER TABLE PurchasingOrders
ALTER COLUMN TestDaten FLOAT NULL

-- Spalte löschen
ALTER TABLE PurchasingOrders
DROP COLUMN TestDaten

SELECT * FROM PurchasingOrders

-- INSERT - Hinzufügen von Datensätzen in bestehender Table

-- Alle Spalten befuellen
INSERT INTO PurchasingOrders
VALUES('03.06.2025', 3, 20.25)

-- Explizit einzelne Spalten befuellen:
INSERT INTO PurchasingOrders (OrderDate, ProductID)
VALUES('25.10.2025', 5)

-- Ergebnis von einer Select-Abfrage in eine Tabelle schreiben
-- Bedingung: Spaltenanzahl und Datentyp müssen passen!!
INSERT INTO PurchasingOrders
SELECT '13.02.2005', 20, NULL

-- DELETE => Löschen von Datensätze in einer Tabelle

SELECT * FROM PurchasingOrders

-- ACHTUNG!!! => Würde alle Datensätze löschen
DELETE FROM PurchasingOrders

-- Muss WHERE genutzt werden
DELETE FROM PurchasingOrders
WHERE ID = 10

-- Primär-/Fremdschlüsselbeziehungen verhindern das löschen von Datensätzen, wenn andere Datensätze
-- sonst "ins Leere laufen würden"
DELETE FROM Customers
WHERE CustomerID = 'ALFKI'

-- TRUNCATE TABLE PurchasingOrders
-- => Alle Datensätze löschen => kein WHERE möglich => Nur Inhalt weg 


-- UPDATE - Ändern von Spaltenwerten in einer vorhanden Tabelle

SELECT * FROM PurchasingOrders

-- Wenn "TestDaten" rot unterkringelt => Lokalen Cache aktualisieren => Bearbeiten => Intellisense
UPDATE PurchasingOrders
SET TestDaten = 100
WHERE ID = 11

-- "Loeschen" von Werten: SET = NULL
UPDATE PurchasingOrders
SET TestDaten = NULL
WHERE ID = 1


-- TRANSACTIONS

BEGIN TRANSACTION -- => Transaction startet

UPDATE PurchasingOrders
SET TestDaten = 50
WHERE ID = 8

COMMIT  -- => TRANSACTION Schließen UND Änderungen ÜBERNEHMEN!!
ROLLBACK -- => TRANSACTION schließen UND Änderungen VERWERFEN!!!

-- Erstelle eine Tabelle namens: "TestTabelle"
-- mit einer ID, die sich automatisch inkrementiert, primärschlüssel 
-- + dazu eine Vorname, Nachname Spalte die eine Zeichenkette
CREATE TABLE TestTabelle 
(
	ID INT IDENTITY(1, 1) PRIMARY KEY,
	Vorname NVARCHAR(50) NOT NULL,
	NachName NVARCHAR(50) NOT NULL
)

--CREATE TABLE PurchasingOrders
--(
--	-- IDENTITY(1, 1) => Start bei 1, inkrementiert immer um 1 höher
--	ID INT IDENTITY(1, 1) PRIMARY KEY,
--	OrderDate DATE NOT NULL, -- NOT NULL => Spalte muss befüllt WERDEN
--	ProductID INT NOT NULL
--)