SELECT * FROM NASABAH
INNER JOIN Account_Nasabah
ON Nasabah.nik = Account_Nasabah.nik
INNER JOIN Transaksi
ON Account_Nasabah.no_rek = Transaksi.no_rek;