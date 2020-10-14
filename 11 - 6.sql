---------------------------------------------------------------------
-- LAB 07
--
-- Exercise 3
---------------------------------------------------------------------

USE TSQL20;
GO

---------------------------------------------------------------------
-- Task 14
---------------------------------------------------------------------
WITH c2008 (custid, salesamt2008) AS (SELECT custid, SUM(val)
FROM [Sales].[OrderValues]
WHERE YEAR(orderdate) = 2008
GROUP BY custid),
c2007 (custid, salesamt2007) AS (SELECT custid, SUM(val)
FROM [Sales].[OrderValues]
WHERE YEAR(orderdate) = 2007
GROUP BY custid)
SELECT e.custid, e.contactname, c2008.salesamt2008,c2007.salesamt2007,
COALESCE ((c2008.salesamt2008 - c2007.salesamt2007)/c2007.salesamt2007*100.,0)
AS percentgrowth
FROM [Sales].[Customers] as e
LEFT JOIN c2008 ON e.custid = c2008.custid
LEFT JOIN c2007 ON e.custid = c2007.custid
ORDER BY percentgrowth desc;
