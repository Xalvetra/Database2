---------------------------------------------------------------------
-- LAB 07
--
-- Exercise 3
---------------------------------------------------------------------

USE TSQL20;
GO

---------------------------------------------------------------------
-- Task 30
---------------------------------------------------------------------
SELECT custid, contactname,
(SELECT MAX(orderdate)
FROM Sales.Orders) AS lastorderdate
FROM Sales.Customers;
---------------------------------------------------------------------
-- Task 31
---------------------------------------------------------------------
SELECT c.custid, c.contactname
FROM Sales.Customers AS c
WHERE NOT EXISTS (SELECT *
FROM Sales.Orders AS o
WHERE o.custid=c.custid)
---------------------------------------------------------------------
-- Task 32
---------------------------------------------------------------------
SELECT c.custid, contactname,
SUM(qty * unitprice)
FROM Sales.Customers AS c
JOIN Sales.Orders AS o
ON o.custid = c.custid
JOIN Sales.OrderDetails AS od
ON od.orderid = o.orderid
WHERE o.orderdate >= '20080401'
GROUP BY c.custid, contactname
HAVING SUM(qty*unitprice)>100;
---------------------------------------------------------------------
-- Task 33
---------------------------------------------------------------------
SELECT
YEAR(o.orderdate) AS orderyear,
SUM(d.qty * d.unitprice) AS totalsalesamount,
(SELECT SUM(de.qty * de.unitprice)
FROM Sales.Orders AS ord
INNER JOIN Sales.OrderDetails AS de ON ord.orderid = de.orderid
WHERE YEAR(ord.orderdate) <= YEAR(o.orderdate) ) AS runsale
FROM Sales.Orders AS o
INNER JOIN Sales.OrderDetails AS d ON o.orderid = d.orderid
GROUP BY YEAR(o.orderdate)
ORDER BY orderyear
