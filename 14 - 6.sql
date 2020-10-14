---------------------------------------------------------------------
-- LAB 07
--
-- Exercise 3
---------------------------------------------------------------------

USE TSQL20;
GO

---------------------------------------------------------------------
-- Task 22
---------------------------------------------------------------------
IF OBJECT_ID('dbo.fnGetSalesByCustomer') IS NOT NULL
DROP FUNCTION dbo.fnGetSalesByCustomer;
IF OBJECT_ID('dbo.fnGetTop3ProductsForCustomer') IS NOT NULL DROP
FUNCTION dbo.fnGetTop3ProductsForCustomer;