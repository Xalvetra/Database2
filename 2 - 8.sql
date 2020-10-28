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
SELECT sc.custid , sc.contactname,pfc.productid , pfc.productname,pfc.totalsalesamount
FROM Sales.Customers sc
OUTER APPLY dbo.fnGetTop3ProductsForCustomer(sc.custid) pfc ORDER BY sc.custid;
---------------------------------------------------------------------
-- Task 6
---------------------------------------------------------------------
SELECT
sc.custid,sc.contactname,pfc.productid,pfc.productname,pfc.totalsalesam ount
FROM Sales.Customers AS sc
OUTER APPLY dbo.fnGetTop3ProductsForCustomer(sc.custid) pfc WHERE pfc.productid is null;