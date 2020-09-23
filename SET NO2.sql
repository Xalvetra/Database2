DECLARE @namaA varchar(10), 
        @namaB varchar(10),
		@alamat varchar(10);
SET @namaA = 'VERY';
SET @namaB = 'SUGIARTO';
SET @alamat = 'MALANG';
INSERT INTO mahasiswa VALUES
	('1', @namaA, @alamat),
	('2', @namaB, @alamat),
	('3', @namaA + @namaB, @alamat);
GO