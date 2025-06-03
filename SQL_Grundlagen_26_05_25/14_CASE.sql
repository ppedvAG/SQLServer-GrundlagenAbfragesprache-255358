USE Northwind

-- CASE - unterscheiden wir definierte Fälle, die die ausgabe abändern


-- Wenn ein Fall gefunden wird, dann passiert xyz, wenn nicht dann ist das Ergebnis NULL
SELECT UnitsInStock,
CASE	
	WHEN UnitsInStock < 10 THEN 'Nachbestellen'
	WHEN UnitsInStock >= 10 THEN 'Passt'
END as Pruefung
FROM Products

-- "Notausgang"
SELECT UnitsInStock,
CASE	
	WHEN UnitsInStock < 10 THEN 'Nachbestellen'
	WHEN UnitsInStock > 10 THEN 'Passt'
	ELSE 'Es gab ein Problem!'
END as Pruefung
FROM Products


-- Funktioniert auch mit Update
UPDATE Customers
SET City = 
CASE
	WHEN Country = 'Germany' THEN 'Berlin'
	WHEN Country = 'France' THEN 'Paris'
	ELSE City
END

-- Auch im GROUP BY
SELECT SUM(UnitsInStock),
CASE	
	WHEN UnitsInStock < 10 THEN 'Nachbestellen'
	WHEN UnitsInStock >= 10 THEN 'Passt'
END as Pruefung
FROM Products
GROUP BY
CASE	
	WHEN UnitsInStock < 10 THEN 'Nachbestellen'
	WHEN UnitsInStock >= 10 THEN 'Passt'
END