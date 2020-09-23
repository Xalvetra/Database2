DECLARE @id int,
        @nama varchar (50),
		@alamat varchar (max);
SET @id = 1;
IF @id = 1
  BEGIN
   SET @nama = 'VERY SUGIARTO';
   SET @alamat = 'MALANG';
  END;
SELECT @id,@nama,@alamat;