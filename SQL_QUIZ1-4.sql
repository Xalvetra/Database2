USE tokosepeda;
GO
SELECT a.product_id AS id_produk, a.product_name 
AS nama_produk,b.category_name AS kategori, a.list_price 
AS harga FROM production.products a
INNER JOIN production.categories b ON a.category_id=b.category_id
WHERE list_price >= 1000 ORDER BY product_id ASC
GO