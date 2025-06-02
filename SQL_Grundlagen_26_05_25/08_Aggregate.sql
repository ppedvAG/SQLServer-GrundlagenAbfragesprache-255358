USE Northwind

-- Aggregatfunktionen: Führt eine Berechnung auf einer Menge von Werten durch und gibt
--					   einen einzigen Wert zurück
-- Ausnahme: COUNT(*) ignoriert keine NULL Werte, Aggregatefunktionen schon

-- 5 grundsätzliche verschieden Funktionen

SELECT 
SUM(Freight) as SummeFracht,
MIN(Freight) as MinimumFracht,
MAX(Freight) as MaximumFracht,
AVG(Freight) as DurchschnittFracht,
COUNT(ShippedDate) as ZähleSpalte, COUNT(*) as ZähltAlles
FROM Orders

-- AVG selber berechnen
SELECT SUM(Freight) / COUNT(*) FROM Orders

SELECT CustomerID, SUM(Freight) FROM Orders
-- Lösung über GROUP BY

SELECT CustomerID, Freight FROM Orders
Order BY CustomerID

-- Group by - Fasst mehrere Werte in Gruppen zusammen
SELECT CustomerID, SUM(Freight) FROM Orders
GROUP BY CustomerID


SELECT CustomerID, ShipCountry, SUM(Freight) FROM Orders
GROUP BY CustomerID, ShipCountry

-- Quantity Summe Pro ProductID
SELECT ProductID, SUM(Quantity) as SummeStueckZahl FROM [Order Details]
GROUP BY ProductID

-- Quantity Summe Pro ProductName
SELECT ProductName, SUM(Quantity) as SummeStueckZahl FROM [Order Details]
JOIN Products ON Products.ProductID = [Order Details].ProductID
GROUP BY ProductName

-- Quantity Summe pro ProductName für Produkte der Kategorie 1-4
SELECT ProductName, SUM(Quantity) as SummeStueckZahl FROM [Order Details]
JOIN Products ON Products.ProductID = [Order Details].ProductID
WHERE CategoryID IN (1,2,3,4)
GROUP BY ProductName

-- Verkauften Stueckzahlen pro Produkt, die über 1000 liegen
SELECT ProductName, SUM(Quantity) as SummeStueckZahl FROM [Order Details]
JOIN Products ON Products.ProductID = [Order Details].ProductID
--WHERE SUM(Quantity) > 1000 => Funktioniert nicht
GROUP BY ProductName
ORDER BY SummeStueckZahl DESC

-- HAVING funktioniert 1zu1 wie ein WHERE, kann aber gruppierte/aggregierte Werte nachträglich filtern
SELECT ProductName, SUM(Quantity) as SummeStueckZahl FROM [Order Details]
JOIN Products ON Products.ProductID = [Order Details].ProductID
--WHERE SUM(Quantity) > 1000 => Funktioniert nicht
GROUP BY ProductName
HAVING SUM(Quantity) > 1000
ORDER BY SummeStueckZahl DESC