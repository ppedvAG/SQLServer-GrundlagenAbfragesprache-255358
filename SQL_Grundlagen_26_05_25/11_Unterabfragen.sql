USE Northwind

-- Unterabfrage / Subqueries

/*
	- Muessen eigenst�ndig fehlerfrei ausf�hrbar sein
	- K�nnen theoretisch �berall eingebaut werden, (Wenn es Sinn macht)
	- Abfragen werden "von innen nach au�en" der Reihe nach ausgef�hrt
*/

-- Zeige mir alle Orders, deren Freight Wert �ber dem Durchschnitt liegt
--SELECT AVG(Freight) as DurchschnittsFracht FROM Orders => Funzt nicht
--HAVING Freight > AVG(Freight)

SELECT * FROM Orders
WHERE Freight > (SELECT AVG(Freight) FROM Orders)

SELECT * FROM Orders
WHERE Freight IN (SELECT TOP 10 Freight FROM Orders)

-- 1. Schreiben Sie eine Abfrage, um eine Produktliste 
-- ProductID, ProductName, UnitPrice
--(ID, Name, St�ckpreis) mit einem �berdurchschnittlichen Preis zu erhalten.
SELECT ProductID, ProductName, UnitPrice FROM Products
WHERE UnitPrice > (SELECT AVG(UnitPrice) FROM Products)
ORDER BY UnitPrice