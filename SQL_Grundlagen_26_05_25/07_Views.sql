USE Northwind
GO

/*
	Views: Erzeugt eine Virtuelle Tabelle, deren Inhalt durch eine Abfrage definiert wird
	
	Vorteile:
	- Um komplexere Abfragen zu speichern
	- Sicherheit: User erlauben nur die View zu lesen, aber nicht zu schreiben
	- Views sind immer aktuell (akutelle Daten)
		=> beim Aufruf der View wird nix andere gemacht als das Statement auszuführen
*/


CREATE VIEW vRechnungsDaten AS
SELECT
Orders.OrderID, 
Customers.CustomerID, Customers.CompanyName, Customers.Country, Customers.City, Customers.PostalCode, Customers.Address,
Orders.Freight, Orders.OrderDate,
Employees.LastName,
CAST(SUM((UnitPrice * Quantity) * (1 - Discount)) + Freight as decimal(10,2)) as SummeBestPosi 
FROM [Order Details]
JOIN Orders ON Orders.OrderID = [Order Details].OrderID
JOIN Customers ON Customers.CustomerID = Orders.CustomerID
JOIN Employees ON Employees.EmployeeID = Orders.EmployeeID
GROUP BY Orders.OrderID, 
Customers.CustomerID, Customers.CompanyName, Customers.Country, Customers.City, Customers.PostalCode, Customers.Address,
Orders.Freight, Orders.OrderDate,
Employees.LastName
GO

-- Erstellen der View
CREATE VIEW vTestSicht AS
SELECT CompanyName, Customers.CustomerID, Orders.OrderID FROM Customers
JOIN Orders ON Customers.CustomerID = Orders.CustomerID
GO

-- Aufruf der View
SELECT * FROM vTestSicht
GO

-- Code hinter einer View sehen:
-- Rechtsklick -> Skript Als -> Erstellen -> Neues Abfragefenster

-- View Ändern => Mit Alter
ALTER VIEW vTestSicht AS
SELECT CompanyName, Customers.CustomerID, Orders.OrderID FROM Customers
JOIN Orders ON Customers.CustomerID = Orders.CustomerID
GO

-- 1. Hatten wir Bestellungen, die wir zu spaet ausgeliefert haben? Wenn 
-- ja, welche OrderIDs waren das und wieviele Tage
-- waren wir zu spaet dran? (Verzoegerung = Unterschied zwischen Shipped 
-- & Required Date in Orders) Tipp: DATEDIFF & ISNULL
-- ISNULL prueft auf Null Werte und ersetzt diese wenn gewuenscht
-- SELECT ISNULL(Fax, 'Nicht vorhanden!') as KeineFax, Fax FROM Customers
/* 37
OrderID, "TageZuSpaet"
OrderID, "TageZuSpaet"
OrderID, "TageZuSpaet"
usw...
*/
CREATE VIEW vTageZuSpaet AS
SELECT OrderID, DATEDIFF(DAY, RequiredDate, ISNULL(ShippedDate, GETDATE())) as TageZuSpaet
FROM Orders
WHERE  DATEDIFF(DAY, RequiredDate, ISNULL(ShippedDate, GETDATE())) > 0
GO

SELECT * FROM vTageZuSpaet
ORDER BY TageZuSpaet