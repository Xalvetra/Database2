USE Perbankan
GO

CREATE TABLE Transaksi (
	id_transaksi INT not null primary key,
	jenis_transaksi VARCHAR(50) not null,
	no_rek INT not null,
	id_karyawan INT not null,
	tanggal_transaksi DATE,
	CONSTRAINT FK_Account_NASABAH FOREIGN KEY (no_rek) REFERENCES Account_NASABAH(no_rek),
	CONSTRAINT FK_KARYAWAN FOREIGN KEY (id_karyawan) REFERENCES KARYAWAN(id_karyawan)
);