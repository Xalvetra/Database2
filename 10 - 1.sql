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
CREATE VIEW Sales.CustGroups
AS
SELECT custid, CHOOSE(custid % 3 + 1, N'A', N'B', N'C')
AS custgroup, country
FROM Sales.Customers;
---------------------------------------------------------------------
-- Task 2
---------------------------------------------------------------------
SELECT country, [A], [B], [C]
FROM
    (
SELECT custgroup, custid, country
    FROM
        Sales.CustGroups) AS D
PIVOT
(
COUNT(custid) FOR custgroup IN ([A], [B], [C])
) AS pvt
ORDER BY country;