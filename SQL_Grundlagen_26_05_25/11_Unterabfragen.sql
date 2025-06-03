USE Northwind

-- Unterabfrage / Subqueries

/*
	- Muessen eigenständig fehlerfrei ausführbar sein
	- Können theoretisch überall eingebaut werden, (Wenn es Sinn macht)
	- Abfragen werden "von innen nach außen" der Reihe nach ausgeführt
*/

-- Zeige mir alle Orders, deren Freight Wert über dem Durchschnitt liegt
--SELECT AVG(Freight) as DurchschnittsFracht FROM Orders => Funzt nicht
--HAVING Freight > AVG(Freight)

SELECT * FROM Orders
WHERE Freight > (SELECT AVG(Freight) FROM Orders)

SELECT * FROM Orders
WHERE Freight IN (SELECT TOP 10 Freight FROM Orders)

-- 1. Schreiben Sie eine Abfrage, um eine Produktliste 
-- ProductID, ProductName, UnitPrice
--(ID, Name, Stückpreis) mit einem überdurchschnittlichen Preis zu erhalten.
SELECT ProductID, ProductName, UnitPrice FROM Products
WHERE UnitPrice > (SELECT AVG(UnitPrice) FROM Products)
ORDER BY UnitPrice