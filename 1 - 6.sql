---------------------------------------------------------------------
-- LAB 07
--
-- Exercise 3
---------------------------------------------------------------------

USE TSQL20;
GO

---------------------------------------------------------------------
-- Task 1
---------------------------------------------------------------------
SELECT p.productid,p.productname,p.supplierid,p.unitprice,p.discontinued
FROM Production.Products as p
INNER JOIN Production.Categories as c 
ON p.categoryid = c.categoryid
WHERE c.categoryname = ('Beverages');

---------------------------------------------------------------------
-- Task 2
---------------------------------------------------------------------
CREATE VIEW Production.ProductsBeverages AS
SELECT p.productid,p.productname,p.supplierid,p.unitprice,p.discontinued
FROM Production.Products as p
INNER JOIN Production.Categories as c ON p.categoryid = c.categoryid
WHERE c.categoryname = ('Beverages');
