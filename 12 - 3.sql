---------------------------------------------------------------------
-- LAB 07
--
-- Exercise 3
---------------------------------------------------------------------

USE TSQL20;
GO

---------------------------------------------------------------------
-- Task 23
---------------------------------------------------------------------
EXEC sys.sp_help;
---------------------------------------------------------------------
-- Task 24
---------------------------------------------------------------------
EXEC sys.sp_help 'Sales.Customers';
---------------------------------------------------------------------
-- Task 25
---------------------------------------------------------------------
EXEC sys.sp_helptext 'Sales.GetTopCustomers';
---------------------------------------------------------------------
-- Task 26
---------------------------------------------------------------------
EXEC sys.sp_columns 'Customers','Sales';