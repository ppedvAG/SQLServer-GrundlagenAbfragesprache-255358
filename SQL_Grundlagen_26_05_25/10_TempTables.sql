USE Northwind
-- Temporäre Tabellen / Temp Tables

/*
	- SELECT INTO #TempTableName => Ergebnisse werden in eine Temporäre Tabelle gespeichert
	- existiert nur innerhalb der Session (Skriptfenster)
	- werden in Systemdatenbanken => tempDB => temporäre Tabellen abgelegt
	- Ergebnisse werden nur einmal generiert --> TempTables sehr schnell, aber nicht aktuell
	- mit einem # = "lokal"
	- mit zwei ## = "global"
*/


-- Erstellen
SELECT * INTO #TempTable
FROM Customers
WHERE Country = 'Germany'

-- Temporäre Tabelle aufrufen
SELECT * FROM #TempTable

-- manuell löschen 
DROP TABLE #TempTable

-- globale Temp Table
SELECT * INTO ##TempTable
FROM Customers
WHERE Country = 'Germany'


-- 1. Hat „Andrew Fuller“ (Employee) schonmal Produkte der Kategorie 
-- „Seafood“ (Categories) verkauft?
-- Wenn ja, wieviel Lieferkosten sind 
-- dabei insgesamt entstanden (Freight)?
-- Speicher das ganze in eine Temporäre Tabelle

SELECT SUM(Freight) as Lieferkosten
INTO #TempTable
FROM Employees
JOIN Orders ON Employees.EmployeeID = Orders.EmployeeID
JOIN [Order Details] ON [Order Details].OrderID = Orders.OrderID
JOIN Products ON Products.ProductID = [Order Details].ProductID
JOIN Categories ON Categories.CategoryID = Products.CategoryID
WHERE LastName = 'Fuller' AND CategoryName = 'Seafood'


SELECT * FROM #TempTable