---------------------------------------------------------------------
-- LAB 07
--
-- Exercise 2
---------------------------------------------------------------------

USE TSQL20;
GO

---------------------------------------------------------------------
-- Task 1
-- 
-- Open the project file F:\10774A_Labs\10774A_07_PRJ\10774A_07_PRJ.ssmssln and the T-SQL script 61 - Lab Exercise 2.sql. Ensure that you are connected to the TSQL2012 database.
--
-- Write a SELECT statement to retrieve distinct values for the custid column from the Sales.Orders table. Filter the results to include only orders placed in February 2008.
--
-- Execute the written statement and compare the results that you got with the desired results shown in the file 62 - Lab Exercise 2 - Task 1 Result.txt.
---------------------------------------------------------------------
SELECT isitdate, CAST(
CASE
WHEN a.isitdate like '%x%' or a.isitdate like '%y%'
THEN 'NULL'
ELSE
CAST(CAST(a.isitdate AS date) as varchar)
END AS varchar) as converteddate
FROM Sales.Somedates a;

---------------------------------------------------------------------
-- Task 2
-- 
-- Write a SELECT statement with these columns:
--  Current date and time
--  First date of the current month
--  Last date of the current month
--
-- Execute the written statement and compare the results that you got with the recommended result shown in the file 63 - Lab Exercise 2 - Task 2 Result.txt.
---------------------------------------------------------------------
SELECT distinct custid
FROM Sales.Orders
WHERE orderdate between '20080202' AND '20080227';

---------------------------------------------------------------------
-- Task 3
-- 
-- Write a SELECT statement against the Sales.Orders table and retrieve the orderid, custid, and orderdate columns. Filter the results to include only orders placed in the last five days of the order month.
--
-- Execute the written statement and compare the results that you got with the recommended result shown in the file 64 - Lab Exercise 2 - Task 3 Result.txt.
---------------------------------------------------------------------
SELECT CURRENT_TIMESTAMP AS currentdate
SELECT DATEADD(MM, DATEDIFF(MM, 0, GETDATE ()),0) AS firtofmonth
SELECT DATEADD(DD, -1, DATEADD(MM, DATEDIFF(MM, 0, GETDATE()) +1, 0)) AS
lasttofmonth

---------------------------------------------------------------------
-- Task 4
-- 
-- Write a SELECT statement against the Sales.Orders and Sales.OrderDetails tables and retrieve all the distinct values for the productid column. Filter the results to include only orders placed in the first 10 weeks of the year 2007.
--
-- Execute the written statement and compare the results that you got with the recommended result shown in the file 65 - Lab Exercise 2 - Task 4 Result.txt.
---------------------------------------------------------------------
SELECT
orderid, custid, orderdate
FROM Sales.Orders
WHERE DATEDIFF(DAY, orderdate, EOMONTH(orderdate))<5;

------------------------------------------------------------------------
SELECT DISTINCT d.productid
FROM Sales.Orders AS o
INNER JOIN Sales.OrderDetails AS d ON d.orderid = o.orderid
WHERE DATEPART(WK, orderdate) <=10 AND YEAR(orderdate)=2007;