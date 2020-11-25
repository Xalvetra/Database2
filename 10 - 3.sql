---------------------------------------------------------------------
-- LAB 07
--
-- Exercise 3
---------------------------------------------------------------------

USE TSQL20;
GO

---------------------------------------------------------------------
-- Task 5
---------------------------------------------------------------------
WITH
    PivotCustGroups
    AS
    (SELECT custid, country, custgroup
        FROM Sales.CustGroups)
SELECT country, [A], [B], [C]
FROM (SELECT custid, country, custgroup
    FROM PivotCustGroups) AS D
PIVOT
(COUNT(custid) FOR custgroup IN ([A], [B], [C])
) AS pvt ORDER BY country;

