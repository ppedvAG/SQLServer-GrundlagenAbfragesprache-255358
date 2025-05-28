USE Northwind
-- String Funktionen bzw. Text-Datentypen manipulieren

-- LEN gibt die länge des Strings zurück (Als Numerischer Wert)
SELECT CompanyName, LEN(CompanyName) FROM Customers

-- LEFT/RIGHT geben die "linken" bzw. "rechten" x Zeichen eines Strings zurück
SELECT CompanyName, LEFT(CompanyName, 5), RIGHT(CompanyName, 5) FROM Customers

-- SUBSTRING(Spalte, x, y) springt zur Position x in einem String und gibt dann y Zeichen zurück
SELECT SUBSTRING(CompanyName, 10, 5), CompanyName FROM Customers

-- STUFF(Spalte, x, y, replace) ersetzt y Zeichen eines Strings ab Position x mit
-- replace Wert (optional)
SELECT STUFF(Phone, LEN(Phone) - 4, 5, 'XXXXX') FROM Customers

-- Patindex sucht nach "Schema" (wie LIKE) in einem String und gibt Position aus,
-- an der das Schema das erste mal gefunden wurde
SELECT PATINDEX('%m%', CompanyName), CompanyName FROM Customers

-- CONCAT fügt mehrere Strings in die selbe Spalte zusammen
SELECT CONCAT(FirstName, ' ', LastName) as GanzerName FROM Employees
SELECT FirstName + ' ' + LastName as GanzerName FROM Employees
SELECT LastName + ', ' + FirstName FROM Employees

-----------------------------------------------------------------------
-- Datumsfunktionen
SELECT GETDATE() -- akutelle Systemzeit mit Zeitstempel

-- Zeitintervalle rausziehen lassen:
SELECT
DATEPART(YEAR, OrderDate) as Jahr,
DATEPART(QUARTER, OrderDate) as Quartal,
DATEPART(WEEK, OrderDate) as KW,
DATEPART(WEEKDAY, OrderDate) as Wochentag,
DATEPART(HOUR, OrderDate) as Stunde
FROM Orders

-- Intervall Namen aus einem Datum zieht
SELECT DATENAME(MONTH, OrderDate), DATENAME(WEEKDAY, OrderDate),
DATEPART(WEEKDAY, OrderDate), OrderDate FROM Orders

-- Intervall zu einem Datum addieren/subtrahieren
-- 1. Parameter: Welches Zeitintervall addieren wir
-- 2. Wieviel Tage, Jahre, Monate etc
-- 3. Zu welchem Datum tun wir das addieren/subtrahieren?
SELECT DATEADD(DAY, 14, GETDATE())
SELECT DATEADD(DAY, -14, GETDATE())

-- Datumsdifferenz zwischen 2 Datums
-- 1. Zeitintervall auswählen
-- 2. Startdatum festlegen
-- 3. Enddatum festlegen
SELECT DATEDIFF(YEAR, '13.02.2005', GETDATE())
SELECT DATEDIFF(YEAR, OrderDate, GETDATE()) FROM Orders

--------------------------
-- Restliche Funktion

-- Cast oder Convert, wandeln Datentyp in der Ausgabe um
-- konvertierung von datetime => date
SELECT CAST(OrderDate as date) as OrderDateNeu FROM Orders
SELECT CONVERT(date, OrderDate), OrderDate FROM Orders

-- ISNULL() prüft auf Null Werte und ersetzt diese wenn gewünscht
SELECT ISNULL(Fax, 'Nicht vorhanden') as KeineFax, Fax FROM Customers

-- Format
DECLARE @d AS DATE = '13.02.20';

SELECT FORMAT(@d, 'd', 'en-US') AS 'US English',
       FORMAT(@d, 'd', 'en-gb') AS 'British English',
       FORMAT(@d, 'd', 'de-de') AS 'German',
       FORMAT(@d, 'd', 'zh-cn') AS 'Chinese Simplified (PRC)';

SELECT FORMAT(@d, 'D', 'en-US') AS 'US English',
       FORMAT(@d, 'D', 'en-gb') AS 'British English',
       FORMAT(@d, 'D', 'de-de') AS 'German',
       FORMAT(@d, 'D', 'zh-cn') AS 'Chinese Simplified (PRC)';

SELECT TOP 5 Freight,
	FORMAT(Freight, 'N', 'zh-cn'),
	FORMAT(Freight, 'G', 'zh-cn'),
	FORMAT(Freight, 'C', 'zh-cn')
FROM Orders

-- REPLACE(x, y, z) => "y" sucht in "x" den String um Ihn mit "z" zu ersetzen
SELECT REPLACE('Hallo Welt', 'Welt!', 'Und Willkommen!')

-- REPLICATE(x, y) => Setze "y" mal die "x" davor bsp Spalte Phone
SELECT Phone + REPLICATE('0', 3)  FROM Customers

-- Reverse(Spaltenname) => z.B "Hallo" wird zu "ollaH"
SELECT CompanyName, REVERSE(CompanyName) From Customers

-- UPPER(Spaltenname) => alles in Großbuchstaben
SELECT CompanyName, UPPER(CompanyName) FROM Customers

-- LOWER(Spaltenname) => alles in Kleinbuchstaben
SELECT CompanyName, LOWER(CompanyName) FROM Customers

-- TRANSLATE(inputString, chars, replace)
-- => Gebe deinen Inputstring an, wähle die Chars aus die im Inputstring ersetzt werden sollen mit "replace"
SELECT TRANSLATE('2*[3+4]/{7-2}', '[]{}', '()()')