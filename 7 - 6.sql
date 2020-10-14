---------------------------------------------------------------------
-- LAB 07
--
-- Exercise 3
---------------------------------------------------------------------

USE TSQL20;
GO

---------------------------------------------------------------------
-- Task 10
---------------------------------------------------------------------
SELECT a.custid,
SUM(a.total) AS totalsalesamount,
AVG(a.total) AS avgsalesamount
FROM (
SELECT
so.custid, so.orderid, SUM(sod.qty*sod.unitprice) AS total
FROM Sales.Orders AS so
JOIN Sales.OrderDetails AS sod
ON so.orderid = sod.orderid
GROUP BY so.custid, so.orderid) AS a
GROUP BY a.custid

