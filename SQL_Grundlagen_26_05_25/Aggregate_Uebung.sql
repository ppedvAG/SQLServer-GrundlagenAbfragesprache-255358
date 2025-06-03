--1. Verkaufte Stueckzahlen (Quantity) pro ProduktKategorie (CategoryName) (8 Ergebniszeilen)
SELECT CategoryName, SUM(Quantity) FROM [Order Details]
JOIN Products ON Products.ProductID = [Order Details].ProductID
JOIN Categories ON Categories.CategoryID = Products.CategoryID
GROUP BY CategoryName

-- 2. Wieviele Bestellungen hat jeder Mitarbeiter bearbeitet? (9 Ergebniszeilen)
-- Tables: Employees - Orders
SELECT LastName, COUNT(OrderID) as Bestellungen FROM Employees
JOIN Orders ON Orders.EmployeeID = Employees.EmployeeID
GROUP BY LastName
ORDER BY 2 DESC

-- 3. Was war das meistverkaufte Produkt im Jahr 1998 (Productname)? Wieviel St�ck (Quantity)?
SELECT TOP 1 ProductName, SUM(Quantity) as Verkaufsmenge FROM Products
JOIN [Order Details] ON Products.ProductID = [Order Details].ProductID
JOIN Orders ON [Order Details].OrderID = Orders.OrderID
WHERE DATEPART(YEAR,OrderDate) = 1998 -- Systemfunktionen => kein Aggregatfiltern mit HAVING
GROUP BY ProductName
ORDER BY Verkaufsmenge DESC

-- 4. In welcher Stadt (City) waren �Wimmers gute Semmelkn�del� am beliebtesten (Quantity)?
SELECT TOP 1 ShipCity, SUM(Quantity) as Verkaufsmenge FROM Products
JOIN [Order Details] ON Products.ProductID = [Order Details].ProductID
JOIN Orders ON Orders.OrderID = [Order Details].OrderID
--JOIN Customers ON Customers.CustomerID = Orders.CustomerID
WHERE ProductName = 'Wimmers gute Semmelkn�del'
GROUP BY ShipCity
ORDER BY Verkaufsmenge DESC

-- 5. Welcher Spediteur (Shippers) war durchschnittlich am g�nstigsten? (Freight)
SELECT TOP 1 CompanyName, AVG(Freight) as AvgFreight FROM Orders
JOIN Shippers ON Orders.ShipVia = Shippers.ShipperID
GROUP BY CompanyName
ORDER BY AvgFreight

-- 6. Erstellen Sie einen Bericht, der die Gesamtzahl der 
-- Bestellungen nach Kunde seit dem 31. Dezember 1996 anzeigt. 
-- Der Bericht sollte nur Zeilen zur�ckgeben, 
-- f�r die die Gesamtzahl der Auftr�ge gr��er als 15 ist (5 Zeilen)
-- Tables: Orders
SELECT CustomerID, COUNT(OrderID) as Bestellungen FROM Orders
WHERE OrderDate > '31.12.1996'
GROUP BY CustomerID
HAVING COUNT(OrderID) > 15
ORDER BY Bestellungen

-- 7. Jahrweiser Vergleich unserer 3. Spediteure: (Shippers Tabelle): 
-- Lieferkosten (Freight) gesamt, Durchschnitt (freight)
-- pro Lieferung und Anzahl an Lieferungen
-- Tables: Orders - Shippers
-- Aggregate: SUM, AVG, COUNT
-- DATEPART() benoetigt
/*
	Ergebnis in etwa so:
	SpediteurName, Gesch�ftsjahr, FreightGesamt, FreightAvg, AnzBestellungen
	Sped 1		 ,1996			, xy		   , xy		   , xy
	Sped 2		 ,1996			, xy		   , xy		   , xy
	Sped 3		 ,1996			, xy		   , xy		   , xy
	usw....
*/
SELECT CompanyName, 
DATEPART(YEAR, OrderDate) as Gesch�ftsjahr,
SUM(Freight) as FreightGesamt,
AVG(Freight) as FreightAvg,
COUNT(*) as AnzBestellungen
FROM Shippers
JOIN Orders ON Orders.ShipVia = Shippers.ShipperID
GROUP BY CompanyName, DATEPART(YEAR, OrderDate)
ORDER BY Gesch�ftsjahr, FreightAvg

-- 8. Ist der Spediteur �Speedy Express� 
-- �ber die Jahre durchschnittlich teurer geworden? (Freight pro Jahr)
SELECT CompanyName, DATEPART(YEAR, OrderDate) as Geschaeftsjahr, AVG(Freight) as AvgFreigth
FROM Orders JOIN Shippers
ON Orders.ShipVia = Shippers.ShipperID
WHERE CompanyName = 'Speedy Express'
GROUP BY CompanyName, DATEPART(YEAR, OrderDate)