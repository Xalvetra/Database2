---------------------------------------------------------------------
-- LAB 07
--
-- Exercise 3
---------------------------------------------------------------------

USE TSQL20;
GO

---------------------------------------------------------------------
-- Task 13
---------------------------------------------------------------------
WITH c2008 (custid, salesamt2008) AS (SELECT custid, SUM(val)
FROM [Sales].[OrderValues]
WHERE YEAR(orderdate) = 2008
GROUP BY custid)
SELECT e.custid, e.contactname, c2008.salesamt2008
FROM [Sales].[Customers] as e
LEFT JOIN c2008 ON e.custid = c2008.custid;