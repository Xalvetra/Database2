SELECT orderid, orderdate FROM Sales.Orders 
ORDER BY orderdate ASC OFFSET 810 ROWS FETCH
NEXT 20 ROWS ONLY;