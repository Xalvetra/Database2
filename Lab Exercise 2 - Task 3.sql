USE TSQL20;
GO

SELECT
c.custid, contactname, o.orderid, s.productid, s.qty, s.unitprice
FROM Sales.Customers as c
INNER JOIN Sales.Orders as o ON c.custid = o.custid INNER JOIN
Sales.OrderDetails as s ON s.orderid = o.orderid;