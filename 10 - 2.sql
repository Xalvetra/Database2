---------------------------------------------------------------------
-- LAB 07
--
-- Exercise 3
---------------------------------------------------------------------

USE TSQL20;
GO

---------------------------------------------------------------------
-- Task 3
---------------------------------------------------------------------
SELECT
custid,
CHOOSE(custid % 3 + 1, N'A', N'B', N'C') AS custgroup,
country
country,
city,
contactname
FROM Sales.Customers;
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
---------------------------------------------------------------------
-- Task 4
---------------------------------------------------------------------
SELECT country, city, contactname, [A], [B], [C]
FROM
    (
SELECT custgroup, custid, country , city, contactname
    FROM
        Sales.CustGroups) AS D
PIVOT
(
COUNT(custid) FOR custgroup IN ([A], [B], [C])
) AS pvt
ORDER BY country;