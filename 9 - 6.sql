---------------------------------------------------------------------
-- LAB 07
--
-- Exercise 3
---------------------------------------------------------------------

USE TSQL20;
GO

---------------------------------------------------------------------
-- Task 12
---------------------------------------------------------------------
WITH ProductsBeverages AS (SELECT productid,productname, supplierid, unitprice,
discontinued,
CASE WHEN unitprice > 100. THEN N'high' ELSE N'normal' END as pricetype
FROM Production.Products
WHERE categoryid = 1)
select productid, productname
from ProductsBeverages
where pricetype = 'high';

