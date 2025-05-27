USE Northwind

-- WHERE: filtert Ergebniszeilen
SELECT * FROM Customers
WHERE Country = 'Germany'

-- = wird nach exakten Treffern gefiltert
SELECT * FROM Customers
WHERE Country = ' Germany'

SELECT * FROM Orders
WHERE Freight = 100

-- alle boolschen Vergleichsoperatoren verwenden
-- (<, <=, >, >=, != bzw <>)

SELECT * FROM Orders
WHERE Freight > 500

SELECT * FROM Orders
WHERE Freight < 500

SELECT * FROM Customers
WHERE Country != 'Germany'

-- Kombinieren von WHERE Ausdrücken mit AND oder OR

-- AND = "Beide" Bedingungen müssen "wahr" sein (true oder 1)
-- OR = Ein Ausdruck muss wahr sein
-- Können wir beliebig oft kombinieren

SELECT * FROM Customers
WHERE Country = 'Germany' AND City = 'Berlin'

SELECT * FROM Customers
WHERE Country = 'Germany' OR City = 'Paris'

-- "Vorsicht" bei Kombination aus AND und OR
SELECT * FROM Customers
WHERE (City = 'Paris' OR City = 'Berlin') AND Country = 'Germany'
-- AND "ist stärker bindent" als OR; Notfalls klammern setzen

SELECT * FROM Orders
WHERE Freight >= 100 AND Freight <= 500

-- Alternative mit BETWEEN, Randwerte mit inbegriffen
SELECT * FROM Orders
WHERE Freight BETWEEN 100 AND 500

SELECT * FROM Customers
WHERE Country = 'Brazil' OR
Country = 'France' OR
Country = 'Germany' OR
Country = 'Austria'

-- Alternativ IN (Wert1, Wert2)
SELECT * FROM Customers
WHERE Country IN ('Brazil', 'France', 'Germany', 'Austria')

-- IN verbindet mehrere OR Bedingungen die sich auf die Spalte beziehen

-- 1. Alle ContactNames die als Title "Owner" haben
-- Tabelle: Customers
SELECT ContactName, ContactTitle FROM Customers
WHERE ContactTitle = 'Owner'

-- 2. Alle Order Details die ProductID 43 bestellt haben
-- Tabelle: [Order Details]
SELECT * FROM [Order Details]
WHERE ProductID = 43

-- 3. Alle Kunden aus Paris, Berlin, Madrid und Brazilien
-- Tabelle: Customers
SELECT * FROM Customers 
WHERE City IN ('Paris', 'Berlin', 'Madrid') OR Country = 'Brazil'

-- BONUS: Alle Kunden (Customers) die keine Fax haben
-- Customers
-- Geht Nicht
SELECT * FROM Customers
WHERE Fax = 'NULL'

-- Filtert nach NULL
SELECT * FROM Customers
WHERE Fax IS NULL

SELECT * FROM Customers
WHERE Fax IS NOT NULL