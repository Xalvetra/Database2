DECLARE @nilai INT;
SET @nilai = 0;

WHILE @nilai <=10
BEGIN 
 Print @nilai;
 SET @nilai = @nilai + 2;
END;

PRINT 'Proses While Selesai';
GO