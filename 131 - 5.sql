---------------------------------------------------------------------
-- LAB 07
--
-- Exercise 4
---------------------------------------------------------------------

USE TSQL20;
GO

---------------------------------------------------------------------
-- Task 15
---------------------------------------------------------------------
SELECT TOP(5)
o.custid,
SUM(d.qty * d.unitprice) AS totalsalesamount
FROM Sales.Orders AS o
INNER JOIN Sales.OrderDetails AS d ON o.orderid = d.orderid
GROUP BY o.custid
HAVING SUM(d.qty * d.unitprice) > 10000
ORDER BY totalsalesamount DESC
---------------------------------------------------------------------
-- Task 16
---------------------------------------------------------------------
SELECT o.orderid , o.empid,
SUM(d.qty * d.unitprice) AS totalsalesmount
FROM Sales.Orders AS o
INNER JOIN Sales.OrderDetails AS d
ON d.orderid = o.orderid
WHERE o.orderdate >= '20080101' AND o.orderdate < '20090101'
GROUP BY o.orderid, o.empid;
---------------------------------------------------------------------
-- Task 17
---------------------------------------------------------------------
SELECT o.orderid, o.empid,
SUM(d.qty * d.unitprice) AS totalsalesamount
FROM Sales.Orders AS o
INNER JOIN Sales.OrderDetails AS d ON o.orderid = d.orderid
GROUP BY o.orderid, o.empid, o.orderdate
HAVING YEAR(o.orderdate) = 2008
AND SUM(d.qty*d.unitprice) > 10000
---------------------------------------------------------------------
-- Task 18
---------------------------------------------------------------------
SELECT o.orderid, o.empid,
SUM(d.qty * d.unitprice) AS totalsalesamount
FROM Sales.Orders AS o
INNER JOIN Sales.OrderDetails AS d 
ON o.orderid=d.orderid
WHERE o.orderdate >= '20080101' AND o.orderdate < '20090101'
AND o.empid = 3 GROUP BY o.orderid, o.empid
HAVING SUM(d.qty * d.unitprice) >= 10000;
---------------------------------------------------------------------
-- Task 19
---------------------------------------------------------------------
SELECT o.custid,
MAX(o.orderdate) AS lastorderdate,
SUM(d.qty * unitprice) AS totalsalesamount
FROM Sales.Orders AS o
INNER JOIN Sales.OrderDetails AS d ON o.orderid=d.orderid
GROUP BY o.custid
HAVING COUNT(distinct o.orderid) > 25
ORDER BY totalsalesamount DESC
