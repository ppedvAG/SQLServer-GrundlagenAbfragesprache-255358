USE Northwind

-- Aggregatfunktionen: F�hrt eine Berechnung auf einer Menge von Werten durch und gibt
--					   einen einzigen Wert zur�ck
-- Ausnahme: COUNT(*) ignoriert keine NULL Werte, Aggregatefunktionen schon

-- 5 grunds�tzliche verschieden Funktionen

SELECT 
SUM(Freight) as SummeFracht,
MIN(Freight) as MinimumFracht,
MAX(Freight) as MaximumFracht,
AVG(Freight) as DurchschnittFracht,
COUNT(ShippedDate) as Z�hleSpalte, COUNT(*) as Z�hltAlles
FROM Orders

-- AVG selber berechnen
SELECT SUM(Freight) / COUNT(*) FROM Orders

SELECT CustomerID, SUM(Freight) FROM Orders
-- L�sung �ber GROUP BY

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

-- Quantity Summe pro ProductName f�r Produkte der Kategorie 1-4
SELECT ProductName, SUM(Quantity) as SummeStueckZahl FROM [Order Details]
JOIN Products ON Products.ProductID = [Order Details].ProductID
WHERE CategoryID IN (1,2,3,4)
GROUP BY ProductName

-- Verkauften Stueckzahlen pro Produkt, die �ber 1000 liegen
SELECT ProductName, SUM(Quantity) as SummeStueckZahl FROM [Order Details]
JOIN Products ON Products.ProductID = [Order Details].ProductID
--WHERE SUM(Quantity) > 1000 => Funktioniert nicht
GROUP BY ProductName
ORDER BY SummeStueckZahl DESC

-- HAVING funktioniert 1zu1 wie ein WHERE, kann aber gruppierte/aggregierte Werte nachtr�glich filtern
SELECT ProductName, SUM(Quantity) as SummeStueckZahl FROM [Order Details]
JOIN Products ON Products.ProductID = [Order Details].ProductID
--WHERE SUM(Quantity) > 1000 => Funktioniert nicht
GROUP BY ProductName
HAVING SUM(Quantity) > 1000
ORDER BY SummeStueckZahl DESC