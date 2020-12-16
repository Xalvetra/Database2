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
ALTER PROCEDURE Sales.GetTopCustomers
    @orderyear int
AS
SELECT c.custid, c.contactname,
    SUM(o.val) AS salesvalue
FROM Sales.OrderValues AS o
    INNER JOIN Sales.Customers AS c
    ON c.custid = o.custid
WHERE YEAR(o.orderdate) = @orderyear
GROUP BY c.custid, c.contactname
ORDER BY salesvalue DESC
OFFSET 0 ROWS FETCH NEXT 10 ROWS ONLY;
---------------------------------------------------------------------
-- Task 8
---------------------------------------------------------------------
EXEC Sales.GetTopCustomers '2007';
---------------------------------------------------------------------
-- Task 9
---------------------------------------------------------------------
EXEC Sales.GetTopCustomers '2008';
---------------------------------------------------------------------
-- Task 10
---------------------------------------------------------------------
EXEC Sales.GetTopCustomers;
---------------------------------------------------------------------
-- Task 13
---------------------------------------------------------------------
ALTER PROCEDURE Sales.GetTopCustomers
    @orderyear int = NULL
AS
SELECT c.custid, c.contactname, SUM(o.val)  AS  salesvalue
FROM Sales.OrderValues AS o INNER JOIN Sales.Customers AS c ON  c.custid  =  o.custid
WHERE  YEAR(o.orderdate)  =  @orderyear OR @orderyear IS NULL
GROUP BY c.custid, c.contactname
ORDER BY salesvalue DESC
OFFSET  0  ROWS  FETCH  NEXT  10  ROWS  ONLY;
EXEC Sales.GetTopCustomers;
---------------------------------------------------------------------
-- Task 15
---------------------------------------------------------------------
ALTER PROCEDURE Sales.GetTopCustomers
    @orderyear	int = NULL,
    @n	int = 10
AS
SELECT c.custid, c.contactname,
    SUM(o.val) AS salesvalue
FROM Sales.OrderValues	AS o
    INNER JOIN Sales.Customers	AS c
    ON c.custid	= o.custid
WHERE YEAR(o.orderdate) = @orderyear
    OR
    @orderyear	IS NULL
GROUP BY c.custid, c.contactname
ORDER BY salesvalue	DESC
OFFSET	0	ROWS FETCH NEXT @n	ROWS ONLY;
EXEC Sales.GetTopCustomers;
---------------------------------------------------------------------
-- Task 16
---------------------------------------------------------------------
EXEC Sales.GetTopCustomers '2008','5';
---------------------------------------------------------------------
-- Task 17
---------------------------------------------------------------------
EXEC Sales.GetTopCustomers '2007';
---------------------------------------------------------------------
-- Task 18
---------------------------------------------------------------------
EXEC Sales.GetTopCustomers NULL ,'20';
---------------------------------------------------------------------
-- Task 20
---------------------------------------------------------------------
ALTER PROCEDURE Sales.GetTopCustomers
    @customerpos	int = 1,
    @customername	nvarchar(30) OUTPUT
AS
SET @customername	= (
SELECT c.contactname
FROM Sales.OrderValues	AS o
    INNER JOIN Sales.Customers	AS c
    ON c.custid	= o.custid
GROUP BY c.custid, c.contactname
ORDER BY SUM(o.val) DESC
OFFSET	@customerpos - 1 ROWS FETCH NEXT 1 ROW ONLY	
);
DECLARE @outcustomername nvarchar(30)
EXEC Sales.GetTopCustomers '1', @outcustomername OUTPUT
---------------------------------------------------------------------
-- Task 21
---------------------------------------------------------------------
DECLARE @outcustomername nvarchar(30)
SELECT @outcustomername AS customername
---------------------------------------------------------------------
-- Task 22
---------------------------------------------------------------------
DECLARE @outcustomername nvarchar(30)
EXEC Sales.GetTopCustomers '1', @outcustomername OUTPUT
SELECT @outcustomername AS customername