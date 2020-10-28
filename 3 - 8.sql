---------------------------------------------------------------------
-- LAB 07
--
-- Exercise 3
---------------------------------------------------------------------

USE TSQL20;
GO

---------------------------------------------------------------------
-- Task 7
---------------------------------------------------------------------
SELECT custid
FROM Sales.Customers WHERE country ='USA' EXCEPT
SELECT so.custid FROM Sales.Orders so
INNER JOIN Sales.OrderDetails d ON so.orderid=d.orderid
GROUP BY so.custid
HAVING COUNT (distinct d.productid) > 20;
---------------------------------------------------------------------
-- Task 8
---------------------------------------------------------------------
SELECT c.custid
FROM Sales.Customers AS c EXCEPT
SELECT o.custid
FROM Sales.Orders AS o
INNER JOIN Sales.OrderDetails AS d ON d.orderid = o.orderid GROUP BY o.custid
HAVING COUNT (DISTINCT d.productid) > 20 INTERSECT
SELECT o.custid
FROM Sales.Orders AS o
INNER JOIN Sales.OrderDetails AS d ON d.orderid = o.orderid GROUP BY o.custid
HAVING SUM(d.qty * d.unitprice) > 10000;

---------------------------------------------------------------------
-- Task 10
---------------------------------------------------------------------
(SELECT c.custid FROM Sales.Customers AS c EXCEPT
SELECT o.custid FROM Sales.Orders AS o INNER JOIN Sales.OrderDetails AS d
ON d.orderid = o.orderid GROUP BY o.custid
HAVING COUNT (DISTINCT d.productid)>20) INTERSECT
SELECT o.custid
FROM Sales.Orders AS o
INNER JOIN Sales.OrderDetails AS d ON d.orderid = o.orderid
GROUP BY o.custid
HAVING SUM(d.qty * d.unitprice)>10000;


