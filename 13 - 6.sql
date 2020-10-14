---------------------------------------------------------------------
-- LAB 07
--
-- Exercise 3
---------------------------------------------------------------------

USE TSQL20;
GO

---------------------------------------------------------------------
-- Task 19
---------------------------------------------------------------------
SELECT TOP(3) so.productid,
MAX(p.productname) AS productname,
SUM (so.qty*so.unitprice) AS totalsalesamount
FROM [Sales].[Orders] AS O
INNER JOIN [Sales].[OrderDetails] AS so ON so.orderid = o.orderid
INNER JOIN [Production].[Products] AS p ON p.productid = so.productid
WHERE custid = 1
GROUP BY so.productid
ORDER BY totalsalesamount desc;
---------------------------------------------------------------------
-- Task 20
---------------------------------------------------------------------
CREATE FUNCTION
dbo.fnGetTop3ProductsForCustomer (@custid AS
INT) RETURNS TABLE
AS RETURN

---------------------------------------------------------------------
-- Task 21
---------------------------------------------------------------------
CREATE FUNCTION dbo.fnGetTop3ProductsForCustomer
(@custid AS INT) RETURNS TABLE
AS RETURN
SELECT TOP(3) so.productid,
MAX(p.productname) AS productname,
SUM (so.qty*so.unitprice) AS totalsalesamount
FROM [Sales].[Orders] AS O
INNER JOIN [Sales].[OrderDetails] AS so ON so.orderid = o.orderid
INNER JOIN [Production].[Products] AS p ON p.productid = so.productid
WHERE custid = 1
GROUP BY so.productid
ORDER BY totalsalesamount desc;
