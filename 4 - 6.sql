---------------------------------------------------------------------
-- LAB 07
--
-- Exercise 3
---------------------------------------------------------------------

USE TSQL20;
GO

---------------------------------------------------------------------
-- Task 6
---------------------------------------------------------------------
ALTER VIEW Production.ProductsBeverages AS
SELECT
productid, productname, supplierid, unitprice, discontinued,
CASE WHEN unitprice > 100. THEN N'high' ELSE N'normal' END
FROM Production.Products
WHERE categoryid = 1;
---------------------------------------------------------------------
-- Task 7
---------------------------------------------------------------------
ALTER VIEW Production.ProductsBeverages AS
SELECT
productid, productname, supplierid, unitprice, discontinued,
CASE WHEN unitprice > 20. THEN N'high'
ELSE N'normal' END as unit
FROM Production.Products
WHERE categoryid = 8;
