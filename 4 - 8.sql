---------------------------------------------------------------------
-- LAB 07
--
-- Exercise 3
---------------------------------------------------------------------

USE TSQL20;
GO
---------------------------------------------------------------------
-- Task 12
---------------------------------------------------------------------
IF OBJECT_ID('Production.trgAutoProductDiscontinue Dipanggil') is not null
DROP TRIGGER Production.trgAutoDeleteOrderDetailUnitPrice; 
GO
CREATE TRIGGER trgProductDiscontinue ON Production.Products
AFTER DELETE AS
PRINT 'TRIGGER trgAutoProductDiscontinue DIPANGGIL!';
DECLARE @productid int = (SELECT productid 
FROM inserted); 
DECLARE @discontinued int = 1;
UPDATE Production.Products set discontinued = @discontinued 
WHERE productid = @productid
PRINT 'discontinued';
GO
UPDATE Production.Products SET discontinued = 1 
WHERE productid = 10 ; 
DELETE FROM Sales.OrderDetails 
WHERE productid = 10;
SELECT * FROM Production.Products 
WHERE productid = 10;

