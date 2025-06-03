-- Variablen allgemein

DECLARE @OrderID INT = 10250

SELECT * FROM Orders
WHERE OrderID = @OrderID

SET @OrderID = 10251