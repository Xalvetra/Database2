USE Perbankan
GO
CREATE TABLE NASABAH (
	nik INT NOT NULL primary key,
	nama_nasabah VARCHAR(50) not null,
	TTL_nasabah VARCHAR(20),
	jenisKelamin_nasabah VARCHAR(20),
	Alamat VARCHAR(100) not null,
	pekerjaan VARCHAR(50) not null,
);