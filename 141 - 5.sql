---------------------------------------------------------------------
-- LAB 07
--
-- Exercise 3
---------------------------------------------------------------------

USE TSQL20;
GO

---------------------------------------------------------------------
-- Task 20
---------------------------------------------------------------------
SELECT MAX(o.orderdate) AS lastorderdate
FROM Sales.Orders AS o;
---------------------------------------------------------------------
-- Task 21
---------------------------------------------------------------------
SELECT o.orderid, o.orderdate, o.empid, o.custid
FROM Sales.Orders AS o
WHERE o.orderdate = (SELECT MAX(o.orderdate) AS lastorderdate
FROM Sales.Orders AS o );
---------------------------------------------------------------------
-- Task 22
---------------------------------------------------------------------
SELECT
orderid, orderdate, empid, custid
FROM Sales.Orders
WHERE
custid =
(
SELECT custid
FROM Sales.Customers
WHERE contactname LIKE N'I%'
);
---------------------------------------------------------------------
-- Task 24
---------------------------------------------------------------------
SELECT orderid, orderdate, empid, custid
FROM Sales.Orders
WHERE custid IN ( SELECT custid
FROM Sales.Customers
WHERE contactname LIKE N'B%');
---------------------------------------------------------------------
-- Task 25
---------------------------------------------------------------------
SELECT orderid,
(SELECT SUM(qty*unitprice)
FROM Sales.OrderDetails AS od
WHERE od.orderid = o.orderid) AS totalsalesamount,
(SELECT SUM(qty*unitprice)/COUNT(*) FROM Sales.OrderDetails AS od
WHERE od.orderid = o.orderid) AS salespctoftotal
FROM Sales.Orders AS o WHERE MONTH(o.orderdate) = 5 AND 
YEAR(o.orderdate) = 2008;
