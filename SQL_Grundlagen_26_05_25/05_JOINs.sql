USE Northwind

/*
	Inner Join
	=> Wenn du nur übereinstimmende Daten aus beiden Tabellen brauchst

	Left Outer Join: 
	=> Wenn du alle Daten aus der linken Tabelle brauchst (inkl. nicht übereinstimmende)

	Right Outer Join:
	=> Wenn du alle Daten aus der rechten Tabelle brauchst (inkl. nicht übereinstimmende)

	Full Outer Join:
	=> Wenn du alle Daten aus beiden Tabellen brauchst, egal ob sie übereinstimmen
*/

SELECT * FROM Customers
SELECT * FROM Orders

/*
	Join Syntax:

	SELECT * FROM [Tabelle A]
	INNER JOIN [Tabelle B] ON A.KeySpalte = B.KeySpalte
	JOIN = auch Standard für INNER JOIN
*/

SELECT * FROM Customers
INNER JOIN Orders ON Customers.CustomerID = Orders.CustomerID

SELECT * FROM Orders
INNER JOIN Customers ON Customers.CustomerID = Orders.CustomerID

SELECT Orders.CustomerID, Customers.CustomerID FROM Orders
INNER JOIN Customers ON Customers.CustomerID = Orders.CustomerID

-- Mit Alias
SELECT * FROM Orders as ord
JOIN Customers as cus ON cus.CustomerID = ord.CustomerID

-- JOIN => Customers => Orders => Order Details
SELECT * FROM Customers
INNER JOIN Orders ON Customers.CustomerID = Orders.CustomerID
INNER JOIN [Order Details] ON Orders.OrderID = [Order Details].OrderID
WHERE Customers.CustomerID = 'ALFKI'
ORDER BY Orders.OrderID

-- Übungen:
-- 1. Welche Produkte (ProductName) hat "Leverling" bisher verkauft?
-- Tabellen: Employees - Orders - [Order Details] - Products
SELECT ProductName, LastName FROM Employees
JOIN Orders ON Employees.EmployeeID = Orders.EmployeeID
JOIN [Order Details] ON [Order Details].OrderID = Orders.OrderID
JOIN Products ON Products.ProductID = [Order Details].ProductID
WHERE LastName = 'Leverling'


-- 2. Wieviele Bestellungen haben Kunden aus Argentinien aufgegeben? (Anzahl OrderIDs bzw.
-- Anzahl Ergebniszeilen)
-- Tabellen: Customers - Orders
SELECT OrderID FROM Customers 
JOIN Orders ON Customers.CustomerID = Orders.CustomerID
WHERE Country = 'Argentina'

-- 3. Was war die größte Bestellmenge (Quantity) von Chai Tee (ProductName = 'Chai')?
-- Tabellen: [Order Details] - Products
SELECT TOP 1 ProductName, Quantity FROM Products
JOIN [Order Details] ON Products.ProductID = [Order Details].ProductID
WHERE ProductName = 'Chai'
ORDER BY Quantity DESC


-- OUTER JOINs: Left/Right und FULL OUTER

-- Left : 832.Z
-- Alle Datensätze aus Customers, auch wenn es keine passende Verknüpfung gibt
-- Bestellungen von keinem Kunden (gibts keine)
SELECT * FROM Customers
LEFT JOIN Orders ON Customers.CustomerID = Orders.CustomerID

-- Right
-- Alle Datensätze aus Orders, auch wenn es keine passende Verknüpfung gibt
-- Kunden ohne Bestellungen
SELECT * FROM Customers
RIGHT JOIN Orders ON Customers.CustomerID = Orders.CustomerID

-- FULL Outer
-- JOIN "invertieren", d.h keine Schnittmenge, durch filtern nach NULL
SELECT * FROM Customers
FULL OUTER JOIN Orders ON Customers.CustomerID = Orders.CustomerID
WHERE Orders.OrderID IS NULL OR Customers.CustomerID IS NULL

-- CROSS JOIN: Erstellt karthesisches Produkt zweier Tabellen (A x B) 91 x 830
SELECT * FROM Orders CROSS JOIN Customers

-- SELF JOIN
SELECT E1.EmployeeID, E1.LastName as Vorgesetzter, E2.EmployeeID, E2.LastName as Angestellter 
FROM Employees as E1
JOIN Employees as E2 ON E1.EmployeeID = E2.ReportsTo
