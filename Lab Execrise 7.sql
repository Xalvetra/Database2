USE TSQL20;
SELECT a.custid, a.contactname, b.orderid, b.orderdate 
FROM Sales.Customers AS a JOIN Sales.Orders b ON
a.custid = b.custid WHERE b.orderdate> CONVERT (DATE,'2004-04-01')
ORDER BY b.orderdate DESC, a.custid ASC;