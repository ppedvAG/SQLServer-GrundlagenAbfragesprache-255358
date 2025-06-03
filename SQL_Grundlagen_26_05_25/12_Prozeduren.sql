USE Northwind
GO

/*
	Stored Procedures / gespeicherte Prozeduren

	- Sind gespeicherte SQL Anweisungen (nicht nur SELECT, sondern auc halles andere)
	- Praktisch um seinen Code zu "automatisieren"
	- Arbeiten mit Platzhaltern (Variablen) diese einen Wert übergeben bekommen (@Name)
*/

-- Eine Prozedur, die immer eine OrderID abfrägt
CREATE PROCEDURE spOrderID @OrderID INT
AS
SELECT * FROM Orders
WHERE OrderID = @OrderID

-- Prozedur zugreifen
EXEC spOrderID 10251
GO


-- Prozedur, zum Kunden hinzufügen
CREATE PROCEDURE spNewCustomer
@CustomerID char(5), @CompanyName varchar(40),
@Country varchar(30), @City varchar(30)
AS
INSERT INTO Customers (CustomerID, CompanyName, Country, City)
VALUES (@CustomerID, @CompanyName, @Country, @City)
GO

EXEC spNewCustomer 'LIDLI', 'Lidl GmbH', 'France', 'Paris'
EXEC spNewCustomer ALDIS, 'Aldis GmbH', Germany, Burghausen

SELECT * FROM Customers
GO

-- Standard Werte
CREATE PROCEDURE spLandCity 
@Country varchar(30) = 'Germany', @City varchar(50) = 'Berlin'
AS
SELECT * FROM Customers
WHERE Country = @Country AND City = @City
GO

EXEC spLandCity France, Paris
GO

-- 1. Erstelle eine Procedure, der man als Parameter eine OrderID übergeben kann.
-- Bei Ausführung soll der Rechnungsbetrag dieser Order ausgegeben werden 
-- SUM(Quantity * UnitPrice + Freight) = RechnungsSumme.
CREATE PROCEDURE sp_RechnungsSumme 
@OrderID INT
AS
SELECT Orders.OrderID, SUM(Quantity * UnitPrice + Freight) as RechnungsSumme
FROM Orders JOIN  [Order Details] ON Orders.OrderID = [Order Details].OrderID
WHERE Orders.OrderID = @OrderID
GROUP BY Orders.OrderID

EXEC sp_RechnungsSumme 10250
GO

-- Mit IN
CREATE PROCEDURE sp_RechnungsSummeIN 
@OrderID1 INT, @OrderID2 INT, @OrderID3 INT
AS
SELECT Orders.OrderID, SUM(Quantity * UnitPrice + Freight) as RechnungsSumme
FROM Orders JOIN  [Order Details] ON Orders.OrderID = [Order Details].OrderID
WHERE Orders.OrderID IN (@OrderID1, @OrderID2, @OrderID3)
GROUP BY Orders.OrderID

EXEC sp_RechnungsSummeIN 10250, 10251, 10252