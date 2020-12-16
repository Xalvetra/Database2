SELECT ss.first_name, ss.last_name
FROM sales.staffs ss
WHERE ss.first_name LIKE 'a%' or ss.last_name LIKE '%a%'
UNION
SELECT sc.first_name, sc.last_name
FROM sales.customers sc
WHERE sc.first_name LIKE 'a%' or last_name LIKE'%a%'
GROUP BY first_name, last_name;