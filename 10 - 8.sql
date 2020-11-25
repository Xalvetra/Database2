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
SELECT YEAR(orderdate) AS orderyear,
    MONTH(orderdate) AS ordermonth,
    DAY(orderdate) AS orderday,
    SUM(val) AS salesvalue
FROM Sales.OrderValues
GROUP BY CUBE(YEAR(orderdate), MONTH(orderdate), DAY(orderdate));


