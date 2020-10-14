---------------------------------------------------------------------
-- LAB 07
--
-- Exercise 3
---------------------------------------------------------------------

USE TSQL20;
GO
IF OBJECT_ID(N'Production.ProductsBeverages', N'V') IS NOT NULL
DROP VIEW Production.ProductsBeverages;
---------------------------------------------------------------------
-- Task 8
---------------------------------------------------------------------
DROP VIEW Production.ProductsSeafood;
