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
SELECT sov.custid, sov.orderid, sov.orderdate, sov.val, 
100.*val/SUM(sov.val) 
OVER (PARTITION BY sov.custid) 
AS percoftotalcust
FROM Sales.OrderValues 
AS sov
ORDER BY sov.custid, percoftotalcust DESC;
---------------------------------------------------------------------
-- Task 13
---------------------------------------------------------------------
SELECT sov.custid, sov.orderid, sov.orderdate, sov.val, 
100.*val/SUM(sov.val) 
OVER (PARTITION BY sov.custid) 
AS percoftotalcust, SUM(sov.val) 
OVER (PARTITION BY sov.custid 
ORDER BY sov.orderdate, sov.orderid 
ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) 
AS runval
FROM Sales.OrderValues 
AS sov;
---------------------------------------------------------------------
-- Task 14
---------------------------------------------------------------------
WITH
SalesMonth2007
AS
(SELECT MONTH(sov.orderdate) AS monthno, 
SUM(sov.val) AS val
FROM Sales.OrderValues AS sov
WHERE sov.orderdate >= '2007-01-01' AND sov.orderdate < '2008-01-01'
GROUP BY MONTH(sov.orderdate))
SELECT cte.monthno, cte.val, AVG(cte.val) 
OVER(ORDER BY cte.monthno   
ROWS BETWEEN 3 PRECEDING AND CURRENT ROW) 
AS avglast3months, SUM(cte.val) 
OVER(ORDER BY cte.monthno   
ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) 
AS ytdval
FROM SalesMonth2007 AS cte;
