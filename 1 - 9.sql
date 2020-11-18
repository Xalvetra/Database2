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
SELECT sov.orderid, sov.orderdate, sov.val, ROW_NUMBER() 
OVER(ORDER BY sov.orderdate) as rowno
from Sales.OrderValues as sov
---------------------------------------------------------------------
-- Task 2
---------------------------------------------------------------------
SELECT sov.orderid, sov.orderdate, sov.val, ROW_NUMBER() 
OVER(ORDER BY sov.orderdate) as rowno , RANK() 
OVER(ORDER BY sov.orderdate) as ranking
from Sales.OrderValues as sov
---------------------------------------------------------------------
-- Task 4
---------------------------------------------------------------------
SELECT sov.orderid, sov.orderdate, sov.custid, sov.val, RANK() 
OVER(PARTITION BY sov.custid ORDER BY sov.val) AS ranking
FROM Sales.OrderValues AS sov
---------------------------------------------------------------------
-- Task 5
---------------------------------------------------------------------
select sov.custid, sov.val, YEAR(sov.orderdate) as orderyear, RANK() 
over(partition by sov.custid, YEAR(sov.orderdate) order by sov.val desc) as orderRankNo
from Sales.OrderValues as sov
---------------------------------------------------------------------
-- Task 6
---------------------------------------------------------------------
with duateratas
as
( select sov.custid, YEAR(sov.orderdate) as orderyear, RANK() 
over(partition by sov.custid, YEAR(sov.orderdate) order by sov.val desc) as orderRankNo, sov.val
from Sales.OrderValues as sov )
select *
from duateratas
where orderRankNo <= 2