DECLARE @nim varchar(50), @kode varchar(50), @tahun_ajar int;
SET @nim = '1';
IF EXISTS (SELECT * FROM mahasiswa WHERE nim = @nim)
	BEGIN
		SET @kode = '3A';
		SET @tahun_ajar = 2020
		INSERT INTO kelas VALUES (@kode, @tahun_ajar, @nim);
		SELECT * FROM kelas;
	END
ELSE
	Print 'Data tidak ditemukan';
GO