---------------------------------------------------------------------
-- LAB 07
--
-- Exercise 2
---------------------------------------------------------------------

USE TSQL20;
GO

---------------------------------------------------------------------
-- Task 7
---------------------------------------------------------------------
SELECT o.orderid, o.orderdate, SUM(od.qty * od.unitprice) AS salesamount
FROM Sales.Orders AS o
INNER JOIN Sales.OrderDetails AS od ON o.orderid = od.orderid
GROUP BY o.orderid, o.orderdate
ORDER BY salesamount DESC
---------------------------------------------------------------------
-- Task 8
---------------------------------------------------------------------
SELECT o.orderid, o.orderdate,
SUM(d.qty*d.unitprice) AS salesamount,
COUNT(*) AS nooforderlines,
AVG(d.qty * d.unitprice) AS avgsalesamountperorder
FROM Sales.Orders AS o
INNER JOIN Sales.OrderDetails AS d
ON d.orderid = o.orderid
GROUP BY o.orderid,o.orderdate
ORDER BY salesamount DESC;
---------------------------------------------------------------------
-- Task 9
---------------------------------------------------------------------
SELECT FORMAT(o.orderdate, 'yyyyMM') AS yearmonthno,
SUM(od.qty * od.unitprice) AS salesamountpermonth
FROM Sales.Orders AS o
INNER JOIN Sales.OrderDetails AS od ON o.orderid = od.orderid
GROUP BY FORMAT(o.orderdate, 'yyyyMM')
ORDER BY yearmonthno
---------------------------------------------------------------------
-- Task 10
---------------------------------------------------------------------
SELECT c.custid, c.contactname,
SUM(s.qty * s.unitprice) AS totalsalesamount,
MAX(s.qty * s.unitprice) AS maxsalesamountorderline,
COUNT(*) AS numberofrows,
COUNT(o.orderid) AS nmberofline
FROM Sales.Customers AS c
LEFT OUTER JOIN Sales.Orders AS o ON o.custid = c.custid
LEFT OUTER JOIN Sales.OrderDetails AS s ON o.orderid = s.orderid
GROUP BY c.custid, c.contactname
ORDER BY totalsalesamount
GO
