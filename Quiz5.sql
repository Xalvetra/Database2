--- 5-1 ---
SELECT customer_id, order_date
FROM sales.orders
WHERE YEAR(order_date) = 2018
ORDER BY order_date;
--- 5-2 ---
SELECT DISTINCT
YEAR(order_date) AS tahun, 
MONTH(order_date) AS bulan,
COUNT(customer_id) OVER (partition by month(order_date) 
ORDER BY month(order_date)) AS custbulanan
FROM sales.orders
WHERE YEAR(order_date) = 2018
ORDER BY tahun, bulan;