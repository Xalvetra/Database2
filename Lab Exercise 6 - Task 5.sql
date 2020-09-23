USE TSQL20;
GO

SELECT a.custid, a.companyname FROM Sales.Customers AS a 
LEFT OUTER JOIN Sales.Orders AS b ON a.custid = b.custid
WHERE b.custid is NULL;