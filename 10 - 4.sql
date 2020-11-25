---------------------------------------------------------------------
-- LAB 07
--
-- Exercise 3
---------------------------------------------------------------------

USE TSQL20;
GO

---------------------------------------------------------------------
-- Task 8
---------------------------------------------------------------------
WITH SalesByCategory AS (
        SELECT s.custid, od.qty * od.unitprice AS salesvalue, c.categoryname
        FROM
            Sales.Orders AS s
            INNER JOIN Sales.OrderDetails AS od ON s.orderid = od.orderid
            INNER JOIN Production.Products AS p ON p.productid =
od.productid
            INNER JOIN Production.Categories AS c ON c.categoryid =
p.categoryid
        WHERE YEAR(s.orderdate) = 2008
    )
SELECT custid, p.Beverages, p.Condiments,
    p.Confections, p.[Diary Products] , p.[Grains/Cereals],
    p.[Meat/Poultry], Produce, Seafood
FROM
    SalesByCategory
PIVOT
(
SUM(salesvalue) FOR categoryname IN
(
Beverages, Condiments, Confections, [Diary Products]
, [Grains/Cereals], [Meat/Poultry], Produce, Seafood
)
) AS p;