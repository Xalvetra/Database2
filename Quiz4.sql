SELECT c.category_id, c.category_name, p.list_price
FROM production.products AS p
INNER JOIN production.categories AS c ON c.category_id = p.category_id;
--- AKHIR ---
WITH productcategory AS
(SELECT c.category_name, AVG(p.list_price) AS avgprice
FROM production.products AS p
inner join production.categories AS c ON c.category_id = p.category_id
GROUP BY c.category_id, category_name)
SELECT [Children Bicycles], [Comfort Bicycles],[Cruisers Bicycles],
[Cyclocross Bicycles],[Electric Bikes],[Mountain Bikes],
[Road Bikes] FROM productcategory
PIVOT (avg(avgprice) FOR category_name in ([Children Bicycles], [Comfort Bicycles],
[Cruisers Bicycles],[Cyclocross Bicycles],[Electric Bikes],[Mountain Bikes],
[Road Bikes] )) AS a;