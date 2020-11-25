---------------------------------------------------------------------
-- LAB 07
--
-- Exercise 3
---------------------------------------------------------------------

USE TSQL20;
GO

---------------------------------------------------------------------
-- Task 9
---------------------------------------------------------------------
 CREATE VIEW Sales.PivotCustGroup AS
 WITH
   PivotCustGroups
   AS
    (
       SELECT custid, country, custgroup
       FROM Sales.CustGroups
    )
    SELECT country, p.A, p.B, p.C
    FROM PivotCustGroups

PIVOT
(
COUNT(custid) FOR custgroup IN (A, B, C)
) AS p;

