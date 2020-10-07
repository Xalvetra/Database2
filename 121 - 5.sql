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
SELECT
YEAR(orderdate) AS orderyear,
COUNT(orderid) AS nooforders,
COUNT(custid) AS noofcustomers
FROM Sales.Orders
GROUP BY YEAR(orderdate);
---------------------------------------------------------------------
-- Task 12
---------------------------------------------------------------------
SELECT
YEAR(orderdate) AS orderyear,
COUNT(orderid) AS nooforders,
COUNT(DISTINCT custid) AS noofcustomers
FROM Sales.Orders
GROUP BY YEAR(orderdate);
---------------------------------------------------------------------
-- Task 13
---------------------------------------------------------------------
SELECT
SUBSTRING(c.contactname,1,1) AS firstletter,
COUNT(DISTINCT o.custid) AS noofcustomers,
COUNT(o.orderid) AS nooforders
FROM Sales.Customers AS c LEFT OUTER JOIN Sales.Orders AS o ON c.custid = o.custid
GROUP BY SUBSTRING(contactname,1,1)
ORDER BY firstletter
---------------------------------------------------------------------
-- Task 14
---------------------------------------------------------------------
SELECT c.categoryid, c.categoryname,
SUM(d.qty * d.unitprice) AS totalsalesmount,
COUNT(DISTINCT o.orderid) AS nooforders,
SUM(d.qty * d.unitprice) / COUNT(DISTINCT o.orderid) AS avgsalesamountperorder
FROM Sales.Orders AS o
INNER JOIN Sales.OrderDetails AS d ON d.orderid=o.orderid
INNER JOIN Production.Products AS p ON p.productid=d.productid
INNER JOIN Production.Categories AS c ON c.categoryid=p.categoryid
WHERE YEAR(o.orderdate) = 2008
GROUP BY c.categoryid, c.categoryname
ORDER BY c.categoryid

