USE Northwind

-- LIKE: Fur ungenaue Filterung/Suche geeignet
-- (statt Vergleichsoperator)

SELECT ContactName, ContactTitle FROM Customers
WHERE ContactTitle LIKE 'Manager'

-- Wildcards

-- %-Zeichen : Beliebige Symbole, beliebig viele davon
SELECT ContactName, ContactTitle FROM Customers
WHERE ContactTitle LIKE '%Manager%'

SELECT ContactName, ContactTitle FROM Customers
WHERE ContactTitle LIKE '%Owner%'

-- _-Zeichen: EIN beliebiges Symbol
SELECT CompanyName from Customers
WHERE CompanyName LIKE '_l%'

-- []-Zeichen: Alles in den Klammern ist ein gültiges Symbol
SELECT PostalCode FROM Customers
WHERE PostalCode LIKE '[123456]%'

-- => geht kürzer [1-6]
SELECT PostalCode FROM Customers
WHERE PostalCode LIKE '[1-6]%'

-- NICHT-FALL [^1-6]
SELECT PostalCode FROM Customers
WHERE PostalCode LIKE '[^1-6]%'

-- Zahl und Zeichen nutzen
SELECT PostalCode FROM Customers
WHERE PostalCode LIKE '[1-3 a-g]%'

-- Sonderfälle

-- Prozent selber suchen
SELECT * FROM Customers
WHERE CompanyName LIKE '%[%]%'

-- Hochkommas filtern
SELECT * FROM Customers
WHERE CompanyName LIKE '%['']%'

-- 1. Alle ShipPostalCode's anzeigen lassen, die mit 0,2,4 beginnen
SELECT ShipPostalCode FROM Orders
WHERE ShipPostalCode LIKE '[024]%'
