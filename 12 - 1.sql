---------------------------------------------------------------------
-- LAB 07
--
-- Exercise 3
---------------------------------------------------------------------

USE TSQL20;
GO

---------------------------------------------------------------------
-- Task 1
---------------------------------------------------------------------
CREATE PROCEDURE Sales.GetTopCustomers
AS
SELECT TOP(10)
    c.custid, c.contactname,
    SUM(o.val) AS salesvalue
FROM Sales.OrderValues	AS o
    INNER JOIN Sales.Customers	AS c
    ON c.custid	= o.custid
GROUP BY c.custid, c.contactname
ORDER BY salesvalue	DESC;
---------------------------------------------------------------------
-- Task 2
---------------------------------------------------------------------
EXEC Sales.GetTopCustomers;
---------------------------------------------------------------------
-- Task 3
---------------------------------------------------------------------
ALTER PROCEDURE Sales.GetTopCustomers
AS
SELECT c.custid, c.contactname,
    SUM(o.val) AS salesvalue
FROM Sales.OrderValues	AS o
    INNER JOIN Sales.Customers	AS c
    ON c.custid	= o.custid
GROUP BY c.custid, c.contactname
ORDER BY salesvalue	DESC
OFFSET 0 ROWS FETCH NEXT 10 ROWS ONLY;
---------------------------------------------------------------------
-- Task 4
---------------------------------------------------------------------
EXEC Sales.GetTopCustomers;
