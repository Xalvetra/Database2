USE TSQL20;
GO
SELECT Sales.Customers.custid, contactname, orderid FROM
Sales.Customers FULL JOIN Sales.Orders 
ON Sales.Customers.custid = Sales.Orders.custid;