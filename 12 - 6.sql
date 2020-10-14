---------------------------------------------------------------------
-- LAB 07
--
-- Exercise 3
---------------------------------------------------------------------

USE TSQL20;
GO

---------------------------------------------------------------------
-- Task 15
---------------------------------------------------------------------

---------------------------------------------------------------------
-- Task 16
---------------------------------------------------------------------
CREATE FUNCTION dbo.fnGetSalesByCustomer
(@orderyear AS INT) RETURNS TABLE
AS
RETURN
SELECT custid, SUM(val) AS totalsalesamount
FROM [Sales].[OrderValues]
WHERE YEAR (orderdate) = 2015
GROUP BY custid;
---------------------------------------------------------------------
-- Task 17
---------------------------------------------------------------------
CREATE FUNCTION [dbo].[fnGetSalesByCustomer2007]
(@orderyear AS int) RETURNS TABLE
AS RETURN
SELECT custid, SUM(val) AS totalsalesamount
FROM [Sales].[OrderValues]
WHERE YEAR(orderdate) = @orderyear
GROUP BY custid;
---------------------------------------------------------------------
-- Task 18
---------------------------------------------------------------------
SELECT custid, SUM(val) AS totalsalesamount
FROM [Sales].[OrderValues]
WHERE YEAR(orderdate) = 2007
GROUP BY custid
SELECT custid, totalsalesamount
FROM dbo.fnGetSalesByCustomer(2007);
