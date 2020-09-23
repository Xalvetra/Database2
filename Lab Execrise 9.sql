DECLARE @baris FLOAT, @jumlah INT
SET @baris=(SELECT COUNT (*) FROM Production.Products)*0.1
SET @jumlah=(CONVERT(INT, @baris)) +1
SELECT productname, unitprice
FROM Production.Products
ORDER BY unitprice DESC OFFSET 0
ROWS FETCH NEXT(@jumlah) ROWS ONLY;