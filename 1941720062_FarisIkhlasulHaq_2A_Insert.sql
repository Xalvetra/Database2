USE Perbankan
GO

INSERT INTO NASABAH (nik, nama_nasabah, ttl_nasabah, jenisKelamin_nasabah, Alamat, pekerjaan) VALUES
(1941720062, 'Faris Ikhlasul H', '261200', 'Laki', 'Malang', 'Mahasiswa'),
(1941720063, 'Ferdy Febriyanto', '260890', 'Laki', 'Malang', 'Data Master'),
(1941720064, 'Rima Santoso', '260896', 'Perempuan', 'Jombang',  'Dosen'),
(1941720065, 'Santoso Dujatimo', '260889', 'Laki', 'Malang',  'Mahasiswa'),
(1941720066, 'Seli Harsah', '260700', 'Perempuan', 'Kediri', 'Mahasiswa');

INSERT INTO KARYAWAN VALUES
(001, 'Faris', '082257744131'),
(002, 'Ikhlasul', '085678986578'),
(003, 'Rafi', '086257368926'),
(004, 'Shidqi', '087865678774'),
(005, 'Ramadhan', '086572917263');

INSERT INTO Account_NASABAH VALUES
(111, 3501, 022009),
(112, 3502, 879068),
(113, 3503, 345789),
(114, 3504, 324567),
(115, 3505, 098123);

INSERT INTO Transaksi VALUES
(331, 'Tarik Tunai', 3501, 001, 2020-11-04, 200000);
(332, 'Tarik Tunai', 3501, 003, 2020-11-04, 2000000),
(333, 'Kredit', 3503, 001, 2020-11-04, 1000000),
(334, 'Tabungan', 3505, 001, 2020-11-04, 150000),
(335, 'Kredit', 3502, 001, 2020-11-04, 3500000);
