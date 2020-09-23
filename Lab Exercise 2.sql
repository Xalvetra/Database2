USE TSQL20;
GO

SELECT 
c.custid, contactname, orderid
FROM Sales.Customers as c
INNER JOIN Sales.Orders as o ON c.custid = o.custid;