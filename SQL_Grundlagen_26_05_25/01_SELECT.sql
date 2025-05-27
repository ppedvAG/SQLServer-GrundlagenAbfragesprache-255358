-- USE Datenbankname wechselt angesproche Datenbank
-- Alternativ "oben links" im Drop-Down Men� richtige DB ausw�hlen
USE Northwind

-- einzeiliger Kommentar

/*
	Mehrzeiliger
	Kommentar
	block
*/

/*
	SELECT: w�hlt Spalten aus, die im Ergebnisfenster
	angezeigt werden sollen
*/

SELECT * FROM Customers -- => * w�hlt alle Spalten aus

-- "Custom"-Werte und mathematische Operationen verwenden
SELECT 100

SELECT 'Hallo, das ist ein Beispieltext'

SELECT 'Texte', 100

SELECT 100 + 5, '7' + '8'

SELECT CompanyName, Country FROM Customers

-- SQL ist NICHT case-sensitive, Formatierung spielt keine rolle
sElEcT			CouNtRY,

			CoMpanYnAMe
FrOm		CuStOmERS

-- Sortieren => Order BY
SELECT * FROM Customers
ORDER BY City ASC
-- ORDER BY ist von der syntax her immer am Ende
-- DESC = descending = absteigend
-- ASC = ascending = aufsteigend (standardm��ig)

-- Auch mehrere Spalten gleichzeitg m�glich zu sortieren, DESC bezieht sich immer nur auf eine Spalte
SELECT City, CompanyName FROM Customers
ORDER BY City DESC, CompanyName ASC
---------------------------------------------------------------------------------

-- TOP X gibt nur die ersten X Zeilen aus
SELECT TOP 10 * FROM Customers
SELECT TOP 100 * FROM Customers

-- Geht auch mit % Angabe
-- TOP X Percent
SELECT TOP 10 Percent * FROM Customers

-- Gib mir die Ersten 20 gr��ten Frachtkosten von der Tabelle Orders aus
-- Spalte "Freight" in "Orders"
SELECT TOP 20 Freight FROM Orders
ORDER BY Freight DESC

-- Gib mir die Ersten 20 kleinsten Frachtkosten von der Tabelle Orders aus
-- Spalte "Freight" in "Orders"
SELECT TOP 20 Freight FROM Orders
ORDER BY Freight ASC

/*
	Wichtig!: "BOTTOM X" existiert nicht, Ergebnisse einfach "umdrehen" mit ORDER BY
*/

-- Duplikate "filtern" mit SELECT DISTINCT
-- Filtert alle Ergebnisse/Datens�tze deren Werte exakt gleich sind
-- Macht DISTINCT automatisch ein Order BY ASC mit
SELECT Country FROM Customers
SELECT DISTINCT Country FROM Customers

SELECT DISTINCT City, Country FROM Customers

SELECT DISTINCT * FROM Customers

/*
	City	|	Country
	-------------------
	Berlin		Germany	=> Einmal wegstreichen
	Berlin		Germany
	K�ln		Germany
*/

------------------------------------------------------------------
-- UNION f�hrt mehrere Ergebnistabellen vertikal in eine Tabelle zusammen
-- UNION auch automatisch ein DISTINCT mit
-- Spaltenanzahl muss gleich sein, sowohl Datentypen kompatibel

SELECT * FROM Customers
UNION
Select * FROM Customers

-- mit UNION ALL wird KEIN DISTINCT ausgef�hrt

SELECT * FROM Customers
UNION ALL
Select * FROM Customers

-- Geht nicht wegen Datentypen, falsche Reihenfolge
SELECT 100, 'Hallo'
UNION
SELECT 'Zeichen', 5

-- Funktioniert
SELECT 100, 'Hallo'
UNION
SELECT 5, 'Zeichen'
-----------------------------------------------

-- Spalten umbennen, �ber Aliase bzw "AS"
SELECT 100 AS Zahl, 'Hallo' AS Begr��ung, 'L�ngeres Wort' AS 'Das ganze ist eine SPALTE'

-- Aliase k�nnen auch f�r Tabellennamen vergeben werden
SELECT * FROM Customers as cus