USE Perbankan
GO

ALTER TABLE Transaksi ALTER COLUMN tanggal_transaksi DATETIME;

ALTER TABLE Account_Nasabah
NOCHECK CONSTRAINT FK_NASABAH;

ALTER TABLE Transaksi
NOCHECK CONSTRAINT FK_Account_Nasabah;

ALTER TABLE Transaksi
NOCHECK CONSTRAINT FK_KARYAWAN;