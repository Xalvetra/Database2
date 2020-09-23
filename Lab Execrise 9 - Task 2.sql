SELECT  custid, orderid, orderdate
FROM Sales.Orders ORDER BY orderdate, orderid OFFSET 20 ROWS FETCH NEXT 20 ROWS ONLY;