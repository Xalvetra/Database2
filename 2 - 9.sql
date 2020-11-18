---------------------------------------------------------------------
-- LAB 07
--
-- Exercise 3
---------------------------------------------------------------------

USE TSQL20;
GO

---------------------------------------------------------------------
-- Task 7
---------------------------------------------------------------------
with RowsOrderBY
as
(select sov.orderid, sov.orderdate, ROW_NUMBER() 
over(order by sov.orderdate, sov.orderid) as rowno, val
from Sales.OrderValues as sov)
select ro.orderid, ro.orderdate, ro.val, ro.rowno
from RowsOrderBY as ro
---------------------------------------------------------------------
-- Task 8
---------------------------------------------------------------------
with RowsOrderBY
as
(select sov.orderid, sov.orderdate, ROW_NUMBER() 
over(order by sov.orderdate, sov.orderid) as rowno, val
from Sales.OrderValues as sov )
select ro.orderid, ro.orderdate, ro.val, ro.rowno
from RowsOrderBY as ro LEFT OUTER JOIN RowsOrderBY 
AS RoB ON RoB.rowno = RoB.rowno+1;
---------------------------------------------------------------------
-- Task 9
---------------------------------------------------------------------
SELECT ov.orderid, ov.orderdate, ov.val, LAG(ov.val, 1) 
OVER(ORDER BY orderdate, orderid) 
AS prevval, ov.val - LAG(ov.val, 1) 
OVER(ORDER BY orderdate, orderid) 
AS diffval
FROM Sales.OrderValues AS ov;
---------------------------------------------------------------------
-- Task 10
---------------------------------------------------------------------
WITH
SalesMonth2007
AS
(SELECT MONTH(sov.orderdate) AS monthno, SUM(sov.val) AS val
FROM Sales.OrderValues AS sov
WHERE sov.orderdate >= '2007-01-01' AND sov.orderdate < '2008-01-01'
GROUP BY MONTH(sov.orderdate))
SELECT cte.monthno, cte.val
FROM SalesMonth2007 AS cte;
---------------------------------------------------------------------
-- Task 11
---------------------------------------------------------------------
WITH
SalesMonth2007
AS
(SELECT MONTH(sov.orderdate) AS monthno, SUM(sov.val) AS val
FROM Sales.OrderValues AS sov
WHERE sov.orderdate >= '2007-01-01' AND sov.orderdate < '2008-01-01'
GROUP BY MONTH(sov.orderdate))
SELECT cte.monthno, cte.val, (LAG(cte.val, 1, 0) 
OVER (ORDER BY cte.monthno) +   LAG(cte.val, 2, 0) 
OVER (ORDER BY cte.monthno) +   LAG(cte.val, 3, 0) 
OVER (ORDER BY cte.monthno)) / 3   
AS avglast3months, cte.val-FIRST_VALUE(cte.val) 
OVER (ORDER BY cte.monthno ROWS UNBOUNDED PRECEDING)   
AS diffjanuary, LEAD(cte.val) OVER (ORDER BY cte.monthno)    
AS nextval
FROM SalesMonth2007 AS cte;