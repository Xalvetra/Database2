---------------------------------------------------------------------
-- LAB 07
--
-- Exercise 3
---------------------------------------------------------------------

USE TSQL20;
GO

---------------------------------------------------------------------
-- Task 1
---------------------------------------------------------------------
SELECT productid, productname
FROM Production.Products WHERE categoryid = 4
UNION
SELECT P.productid, P.productname
FROM Production.Products P INNER JOIN Sales.OrderDetails OD 
ON P.productid = OD.productid
GROUP BY P.productid, P.productname
HAVING SUM(OD.qty * OD.unitprice) > 50000;
---------------------------------------------------------------------
-- Task 2
---------------------------------------------------------------------
SELECT productid,productname 
FROM Production.Products
WHERE categoryid = 4
UNION ALL
SELECT P.productid,P.productname
FROM Production.Products P 
INNER JOIN Sales.OrderDetails OD
ON P.productid = OD.productid
GROUP BY P.productid, P.productname
HAVING SUM(OD.qty * OD.unitprice)>50000;
---------------------------------------------------------------------
-- Task 4
---------------------------------------------------------------------
SELECT TOP(10)
a.custid, b.contactname, a.orderdate, a.val
FROM Sales.OrderValues a INNER JOIN Sales.Customers b
ON a.custid = b.custid 
WHERE orderdate > '20080201' and orderdate < '20080531'
UNION SELECT TOP(10)
a.custid, b.contactname, a.orderdate, a.val 
FROM Sales.OrderValues a INNER JOIN Sales.Customers b 
ON a.custid = b.custid
WHERE orderdate > '20080201' and orderdate < '20080531'
ORDER BY val desc;