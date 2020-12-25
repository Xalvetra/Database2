GO

-- VIEW
-- view Kelas Mahasiswa

CREATE VIEW Kelas_Mahasiswa AS (
	SELECT 
		a.nim, a.firstname + ' ' + a.lastname AS nama, k.nama_kelas AS kelas
	FROM Mahasiswa a INNER JOIN Detail_kls_mhs dk ON a.nim = dk.nim
					 INNER JOIN Kelas_mhs k ON k.id_kls = dk.id_kls
);
GO

SELECT * FROM Kelas_Mahasiswa
GO

-- view nilai mhs

CREATE VIEW log_nilai_mhs AS (
	SELECT 
		m.nim, m.firstname + ' ' + m.lastname AS nama, mk.nama_mk AS mata_kuliah,
		n.nilai
	FROM Mahasiswa m INNER JOIN Nilai n ON m.nim = n.nim
		INNER JOIN Mata_Kuliah mk ON mk.kode_mk = n.kode_mk
	GROUP BY m.nim, m.firstname, m.lastname, mk.nama_mk, n.nilai
);
GO

SELECT * FROM log_nilai_mhs;
GO

select * from nilai;
-- PIVOT
-- pivot nilai

SELECT
	nim, nama,
	[Pemograman Objek], [Basis Data Lanjut], [Desain Antar Muka], [Jaringan Komputer],
	[Kecerdasan Buatan], [Pancasila], [Pemrograman Dasar], [Sistem Informasi], [Sistem Operasi]
FROM
	(
		SELECT nim, nama, nilai, mata_kuliah FROM log_nilai_mhs	
	) AS a
PIVOT 
	(
		MAX(nilai) FOR mata_kuliah IN 
		(
			[Bahasa Inggris], [Basis Data Lanjut], [Desain Antar Muka], [Jaringan Komputer],
			[Kecerdasan Buatan], [Pancasila], [Pemrograman Dasar], [Sistem Informasi], [Sistem Operasi]
		)
	) AS pvt
ORDER BY nim;
GO

-- pivot rata" kelas

SELECT 
	mata_kuliah, [MI2A], [MI2C], [MI2E], [TI2A], [TI2B]
FROM 
	(
		SELECT l.mata_kuliah, l.nilai, k.nama_kelas AS kelas FROM log_nilai_mhs l
		INNER JOIN Detail_kls_mhs dk ON l.nim = dk.nim
		INNER JOIN Kelas_mhs k ON k.id_kls = dk.id_kls
	) AS a
PIVOT
	(
		AVG(nilai) FOR kelas IN ([MI2A], [MI2C], [MI2E], [TI2A], [TI2B])
	) AS pvt
GO

-- GROUPING SETS

-- Rata-rata nilai seluruh matkul berdasarkan nim

SELECT 
	a.nim, b.firstname + ' ' +b.lastname as nama,AVG(a.nilai) as Rata2_Nilai 
FROM Nilai a INNER JOIN Mahasiswa b ON a.nim=b.nim
GROUP BY GROUPING SETS ((a.nim,b.firstname,b.lastname)) ORDER BY nim;

-- ROLLUP

SELECT
	l.mata_kuliah, l.nim, AVG(l.nilai) AS [Rata-rata]
FROM log_nilai_mhs l
GROUP BY ROLLUP (l.mata_kuliah, l.nim);

-- CUBE

SELECT
	l.mata_kuliah, l.nim, AVG(l.nilai) AS [Rata-rata]
FROM log_nilai_mhs l
GROUP BY CUBE (l.mata_kuliah, l.nim);


-- WINDOW FUNCTION

SELECT 
		m.nim, m.firstname + ' ' + m.lastname AS nama, mk.nama_mk AS mata_kuliah,
		n.nilai,
		RANK() OVER (PARTITION BY mk.nama_mk ORDER BY n.nilai DESC) AS nilairankno
FROM Mahasiswa m INNER JOIN Nilai n ON m.nim = n.nim
	INNER JOIN Mata_Kuliah mk ON mk.kode_mk = n.kode_mk
GROUP BY m.nim, m.firstname, m.lastname, mk.nama_mk, n.nilai;


-- STORED PROCEDURE

IF OBJECT_ID('proc_hitungNilai') IS NOT NULL
	DROP PROCEDURE proc_hitungNilai
GO

CREATE PROCEDURE proc_hitungNilai @nim INT = NULL
AS 
	SELECT a.nim AS Nim,a.nama AS Nama,
		a.kelas AS Kelas,
		lognilai.mata_kuliah AS Mata_Kuliah, AVG(lognilai.nilai) AS Nilai
	FROM  Kelas_Mahasiswa a
	INNER JOIN log_nilai_mhs lognilai ON a.nim = lognilai.nim
	WHERE a.nim = @nim
	GROUP BY a.nim, a.nama,a.kelas, lognilai.mata_kuliah
GO

EXEC proc_hitungNilai @nim = 1931710119;

-- SQL DYNAMIC

EXEC sys.sp_executesql
	N'SELECT a.nrp, a.kode_dosen, a.firstname + a.lastname AS Nama_Dosen,
			b.kode_mk, c.nama_mk AS Nama_Matkul
	FROM Dosen AS a INNER JOIN Detail_mk AS b ON a.nrp = b.nrp
		INNER JOIN Mata_Kuliah AS c ON b.kode_mk = c.kode_mk
	WHERE nama_mk = @nama_mk', N'@nama_mk nvarchar(20)', @nama_mk = 'Basis Data Lanjut';
GO