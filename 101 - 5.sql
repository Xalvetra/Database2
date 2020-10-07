---------------------------------------------------------------------
-- LAB 07
--
-- Exercise 1
---------------------------------------------------------------------
USE TSQL20;
GO
---------------------------------------------------------------------
-- Task 1
---------------------------------------------------------------------
SELECT c.custid,c.contactname
FROM Sales.Customers as c
WHERE custid in(SELECT o.custid FROM Sales.Orders as o WHERE empid =5) 
GROUP BY c.custid,c.contactname
---------------------------------------------------------------------
-- Task 2
---------------------------------------------------------------------
SELECT o.custid, c.contactname, c.city
from Sales.Orders as o
inner join Sales.Customers as c
on c.custid = o.custid
where o.empid=5
group by o.custid, c.contactname;
---------------------------------------------------------------------
-- Task 4
---------------------------------------------------------------------
SELECT c.custid,c.contactname,c.city
FROM Sales.Customers as c
WHERE custid in(SELECT o.custid FROM Sales.Orders as o WHERE empid =5) 
GROUP BY c.custid,c.contactname,c.city
---------------------------------------------------------------------
-- Task 5
---------------------------------------------------------------------
SELECT DISTINCT custid,YEAR(orderdate) as tahun
FROM Sales.Orders
WHERE empid=(
SELECT empid FROM HR.Employees where empid=5);
---------------------------------------------------------------------
-- Task 6
---------------------------------------------------------------------
SELECT c.categoryid , c.categoryname
FROM Production.Categories AS c
WHERE categoryid <= 2008
GROUP BY c.categoryid, c.categoryname