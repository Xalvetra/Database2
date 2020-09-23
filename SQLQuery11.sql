IF EXISTS (SELECT * FROM mahasiswa)
BEGIN
	SELECT * FROM mahasiswa WHERE nama LIKE 'VERY%';
END
ELSE
   PRINT 'Nama VERY tidak ditemukan';