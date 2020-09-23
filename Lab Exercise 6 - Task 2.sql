USE TSQL20;
GO

SELECT
custid, companyname, contactname, address, city, country, 
phone FROM Sales.Customers
WHERE
country= N'Brazil';