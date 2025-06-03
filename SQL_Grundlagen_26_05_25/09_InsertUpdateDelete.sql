USE Northwind

-- CREATE / ALTER / DROP (DDL - Data Definition Language)

-- Immer wenn wir Datenbankobjekte "bearbeiten" gelten diese Befehle

-- CREATE: Erstellt Tabellen oder Datenbanken

-- Datenbank erstellen
CREATE DATABASE XYZ

-- Tabelle erstellen
CREATE TABLE PurchasingOrders
(
	-- IDENTITY(1, 1) => Start bei 1, inkrementiert immer um 1 h�her
	ID INT IDENTITY(1, 1) PRIMARY KEY,
	OrderDate DATE NOT NULL, -- NOT NULL => Spalte muss bef�llt WERDEN
	ProductID INT NOT NULL
)

SELECT * FROM PurchasingOrders

-- Beziehung zwischen PurchasingOrders und Products anlegen �ber ProductID

-- ALTER: Immer wenn wir nachtr�glich was an unserer Struktur �ndern wollen
ALTER TABLE PurchasingOrders
ADD FOREIGN KEY (ProductID) REFERENCES Products (ProductID)

-- Neue Spalte hinzufuegen zu bestehendem Table:
ALTER TABLE PurchasingOrders
ADD TestDaten INT NULL

-- Spalte nach Datentyp �ndern
ALTER TABLE PurchasingOrders
ALTER COLUMN TestDaten FLOAT NULL

-- Spalte l�schen
ALTER TABLE PurchasingOrders
DROP COLUMN TestDaten

SELECT * FROM PurchasingOrders

-- INSERT - Hinzuf�gen von Datens�tzen in bestehender Table

-- Alle Spalten befuellen
INSERT INTO PurchasingOrders
VALUES('03.06.2025', 3, 20.25)

-- Explizit einzelne Spalten befuellen:
INSERT INTO PurchasingOrders (OrderDate, ProductID)
VALUES('25.10.2025', 5)

-- Ergebnis von einer Select-Abfrage in eine Tabelle schreiben
-- Bedingung: Spaltenanzahl und Datentyp m�ssen passen!!
INSERT INTO PurchasingOrders
SELECT '13.02.2005', 20, NULL

-- DELETE => L�schen von Datens�tze in einer Tabelle

SELECT * FROM PurchasingOrders

-- ACHTUNG!!! => W�rde alle Datens�tze l�schen
DELETE FROM PurchasingOrders

-- Muss WHERE genutzt werden
DELETE FROM PurchasingOrders
WHERE ID = 10

-- Prim�r-/Fremdschl�sselbeziehungen verhindern das l�schen von Datens�tzen, wenn andere Datens�tze
-- sonst "ins Leere laufen w�rden"
DELETE FROM Customers
WHERE CustomerID = 'ALFKI'

-- TRUNCATE TABLE PurchasingOrders
-- => Alle Datens�tze l�schen => kein WHERE m�glich => Nur Inhalt weg 


-- UPDATE - �ndern von Spaltenwerten in einer vorhanden Tabelle

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

COMMIT  -- => TRANSACTION Schlie�en UND �nderungen �BERNEHMEN!!
ROLLBACK -- => TRANSACTION schlie�en UND �nderungen VERWERFEN!!!

-- Erstelle eine Tabelle namens: "TestTabelle"
-- mit einer ID, die sich automatisch inkrementiert, prim�rschl�ssel 
-- + dazu eine Vorname, Nachname Spalte die eine Zeichenkette
CREATE TABLE TestTabelle 
(
	ID INT IDENTITY(1, 1) PRIMARY KEY,
	Vorname NVARCHAR(50) NOT NULL,
	NachName NVARCHAR(50) NOT NULL
)

--CREATE TABLE PurchasingOrders
--(
--	-- IDENTITY(1, 1) => Start bei 1, inkrementiert immer um 1 h�her
--	ID INT IDENTITY(1, 1) PRIMARY KEY,
--	OrderDate DATE NOT NULL, -- NOT NULL => Spalte muss bef�llt WERDEN
--	ProductID INT NOT NULL
--)