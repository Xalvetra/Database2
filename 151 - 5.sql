---------------------------------------------------------------------
-- LAB 07
--
-- Exercise 3
---------------------------------------------------------------------

USE TSQL20;
GO

---------------------------------------------------------------------
-- Task 26
---------------------------------------------------------------------
SELECT p.productid, p.productname
FROM Production.Products AS p
WHERE p.productid IN (SELECT od.productid
FROM Sales.OrderDetails AS od
WHERE od.qty > 100);
---------------------------------------------------------------------
-- Task 27
---------------------------------------------------------------------
SELECT custid, contactname
FROM Sales.Customers
WHERE custid NOT IN(
SELECT custid
FROM Sales.Orders);
---------------------------------------------------------------------
-- Task 28
---------------------------------------------------------------------
INSERT INTO Sales.Orders
(custid, empid, orderdate, requireddate, shippeddate, shipperid, freight,
shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry)
VALUES
(NULL, 1, '20111231', '20111231', '20111231', 1, 0,
'ShipOne', 'ShipAddress', 'ShipCity', 'RA', '1000', 'USA');
---------------------------------------------------------------------
-- Task 29
---------------------------------------------------------------------
SELECT custid, contactname
FROM Sales.Customers
WHERE custid NOT IN(SELECT custid
FROM Sales.Orders
WHERE custid IS NOT NULL);

