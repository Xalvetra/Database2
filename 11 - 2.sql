---------------------------------------------------------------------
-- LAB 07
--
-- Exercise 2
---------------------------------------------------------------------

USE TSQL20;
GO

---------------------------------------------------------------------
-- Task 5
---------------------------------------------------------------------
SELECT
	DB_ID() AS database_id,
	DB_NAME() AS database_name,
	USER_ID(CURRENT_USER) AS user_id,
	CURRENT_USER AS user_name;
---------------------------------------------------------------------
-- Task 6
---------------------------------------------------------------------
SELECT
	name,
	type_desc,
	OBJECT_NAME(object_id) AS object_id,
	SCHEMA_NAME(schema_id) AS schema_name
FROM
	sys.objects;
---------------------------------------------------------------------
-- Task 7
---------------------------------------------------------------------
SELECT
	name AS column_name,
	OBJECT_NAME(object_id) AS table_name,
	OBJECT_SCHEMA_NAME(object_id) AS schema_name
FROM
	sys.columns
WHERE
	name LIKE '%name%'
	AND OBJECTPROPERTY(object_id,
	'IsUserTable') = 1;
---------------------------------------------------------------------
-- Task 8
---------------------------------------------------------------------
 PRINT OBJECT_DEFINITION(OBJECT_ID('Sales.CustOrders'));