-- 1. Alle Produkte (ProductNames) aus den Kategorien "Beverages" und "Produce"
-- (CategoryName in Categories)
--> Products - Categories Tables
SELECT * FROM Products
JOIN Categories ON Categories.CategoryID = Products.CategoryID
WHERE CategoryName IN ('Beverages', 'Produce')

-- 2. Alle Bestellungen (Orders) bei denen ein Produkt verkauft wurde, das nicht mehr gefuehrt wird
-- (Discontinued = 1 in Products)
--> Orders - Order Details - Products
SELECT * FROM Products
JOIN [Order Details] ON Products.ProductID = [Order Details].ProductID
JOIN Orders ON Orders.OrderID = [Order Details].OrderID
WHERE Discontinued = 1
 
-- BONUS-Extra Aufgabe: Alle Produkte der Category "Beverages" (Tabelle Categories)
SELECT ProductName FROM Categories JOIN
Products ON Categories.CategoryID = Products.CategoryID
WHERE CategoryName = 'Beverages'

-- 3. Alle Bestellungen (Orders) aus den USA (Customers Country) die im Jahr 1997 aufgegeben wurden
-- (OrderDate in Orders) 'YYYYMMDD' 'DD.MM.YYYY'
--> Customers - Orders
SELECT * FROM Customers
JOIN Orders ON Customers.CustomerID = Orders.CustomerID
WHERE Country = 'USA' AND OrderDate BETWEEN '01.01.1997' AND '31.12.1997'


