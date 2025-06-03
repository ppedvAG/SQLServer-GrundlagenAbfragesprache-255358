USE Northwind

--  WHILE

-- WHILE: Während die Bedingung übereinstimmt, mach XYZ

DECLARE @Counter INT = 0

WHILE @Counter < 5
BEGIN
SELECT 'Hallo'
SET @Counter += 1
END

-- Endlosschleife, aufpassen auf unseren Computer
-- Bedingung mit Bedacht wählen!
WHILE 1=1
BEGIN
SELECT 'Hallo'
END

-- Zusätzlich mit IF Prüfung

DECLARE @Zaehler INT = 0

WHILE @Zaehler <= 5
BEGIN

IF @Zaehler = 2
	BEGIN
	SELECT 'Bin bei 2 angekommen'
	END
ELSE
	BEGIN 
	SELECT @Zaehler
	END
SET @Zaehler += 1

END
SELECT 'Ende'