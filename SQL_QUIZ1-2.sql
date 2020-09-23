USE tokosepeda;
GO
SELECT TOP 10 customer_id,first_name,last_name,
phone,email,street,city,state,zip_code FROM sales.customers
ORDER BY first_name ASC
GO