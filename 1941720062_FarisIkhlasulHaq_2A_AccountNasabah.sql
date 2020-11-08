USE Perbankan
GO
CREATE TABLE Account_NASABAH (
	no_rek INT not null primary key,
	nik INT not null,
	pin INT not null,
	CONSTRAINT FK_Nasabah FOREIGN KEY (nik)
	REFERENCES NASABAH(nik)
);