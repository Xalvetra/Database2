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
SELECT YEAR(orderdate) AS orderyear,
    MONTH(orderdate) AS ordermonth,
    DAY(orderdate) AS orderday,
    SUM(val) AS salesvalue
FROM Sales.OrderValues
GROUP BY ROLLUP (YEAR(orderdate), MONTH(orderdate), DAY(orderdate));
---------------------------------------------------------------------
-- Task 15
---------------------------------------------------------------------
SELECT GROUPING_ID (YEAR(orderdate), MONTH(orderdate)) AS groupid,
		YEAR(orderdate) AS orderyear,
		MONTH(orderdate) AS ordermonth,
		SUM(val) AS salesvalue
FROM Sales.OrderValues
GROUP BY ROLLUP (YEAR(orderdate), MONTH(orderdate))
ORDER BY groupid, orderyear, ordermonth;