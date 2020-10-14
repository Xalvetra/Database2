---------------------------------------------------------------------
-- LAB 07
--
-- Exercise 3
---------------------------------------------------------------------

USE TSQL20;
GO

---------------------------------------------------------------------
-- Task 11
---------------------------------------------------------------------
SELECT a.orderyear, a.totalsalesamount AS curtotalsales, 
b.totalsalesamount AS prevtotalsales
FROM ( SELECT YEAR(orderdate) AS orderyear,
SUM (val) AS totalsalesamount FROM Sales.OrderValues
GROUP BY YEAR(orderdate)) AS a
LEFT JOIN (SELECT YEAR(orderdate) AS orderyear,
SUM (val) AS totalsalesamount FROM Sales.OrderValues
GROUP BY YEAR(orderdate)) AS b
ON a.orderyear = b.orderyear + 1
ORDER BY a.orderyear
