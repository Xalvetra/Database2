																	--------- TEMA SIAKAD -----------
																	-------- ANGGOTA KELOMPOK -------
																-- 1. Faris Ikhlasul H		(1941720062)--
																-- 2. Daffa Cahyo A			(1941720104)--
																-- 3. Fahmi Khoiruddin		(1941720151)--
																-- 4. Brilliandy Zufar P	(1941720201)--

USE SIAKAD;
GO

-- CREATE Tabel Mahasiswa

CREATE TABLE Mahasiswa
(
	nim				INT          NOT NULL,
	lastname        NVARCHAR(20) NOT NULL,
	firstname       NVARCHAR(10) NOT NULL,
	address         NVARCHAR(60) NOT NULL,
	email	          NVARCHAR(60) NOT NULL,
	city            NVARCHAR(15) NOT NULL,
	postalcode      NVARCHAR(10) NULL,
	phone           NVARCHAR(24) NOT NULL,
	CONSTRAINT PK_Mahasiswa PRIMARY KEY(nim),
);
GO

-- INSERT table Mahasiswa;

INSERT INTO Mahasiswa VALUES
(1941720062,'Ikhlasul','Faris','Perumahan Griya Permata Alam','farisikhhaq@gmail.com','Malang','65152','082257744131'),
(1941720063,'Cahyo','Daffa','SumberLilo Jakarta','daffacahyo@gmail.com','Probolinggo','67214','085232343234'),
(1941720064,'Khoiruddin','Fahmi','Pringading Bogor','fahmikhoiruddin@gmail.com','Gresik','67213','0852589119433'),
(1941720065,'Zufar','Brilliandy','Soehat Jakpus','brilliandyzufar@gmail.com','Gresik','67213','085258911900'),
(1941720066,'Shidqi','Rafi','Ngijo Malang','rafishidqi@gmail.com','Probolinggo','67214','085258971905');


GO

-- Dosen

CREATE TABLE Dosen
(
  nip             NVARCHAR(20) NOT NULL,
  kode_dosen	  NVARCHAR(10) NOT NULL,
  firstname       NVARCHAR(10) NOT NULL,
  lastname        NVARCHAR(10) NOT NULL,
  birthdate       DATE	       NOT NULL,
  address         NVARCHAR(60) NOT NULL,
  email	          NVARCHAR(60) NOT NULL,
  phone           NVARCHAR(24) NOT NULL,
  CONSTRAINT PK_Dosen PRIMARY KEY(nip),
);
GO

-- INSERT TABLE Dosen;

INSERT INTO Dosen values
	('004775631','TI01','Riatma','Galih','10/03/1980','Perum Soekarno Hatta','galihriatma@gmail.com','082865756798'),
	('004775632','TI02','Prasetyo','Arief','10/03/1980','Perum Soekarno Jaya','ariefprasetyo@gmail.com','082865756789'),
	('004775633','TI03','Fahrurrozi','Imam','10/03/1981','Perum Soekarno Malang','imamfahrurrozi@gmail.com','082865546798'),
	('004775634','TI04','Alhadid','Vipkas','10/03/1982','Perum Soekarno Kidul','vipkasalhadid@gmail.com','082865732798'),
	('004775635','TI05','Nurhamdana','Elok','10/03/1983','Perum Soekarno Sutoyo','eloknurhamdana@gmail.com','082865734798'),
	('004775636','TI06','Mega','Devi','10/03/1984','Perum Soekarno Heritage','devimegarisdiana@gmail.com','082545756798'),
	('004775637','TI07','Arifin','Samsul','10/03/1985','Pasar Besar','samsularifin@gmail.com','082865789798');

GO

-- Ruang Kelas

CREATE TABLE Ruang (
	kelasid INT NOT NULL IDENTITY,
	nama_kelas VARCHAR(40) NOT NULL,
	kapasitas INT NOT NULL,
	CONSTRAINT PK_kelas PRIMARY KEY(kelasid)
);
GO

-- INSERT table Ruang;

SET IDENTITY_INSERT Ruang ON;
INSERT INTO Ruang (kelasid, nama_kelas, kapasitas) VALUES
	(1001, 'RT1', 50),
	(1002, 'RT2', 30),
	(1003, 'RT3', 40),
	(1004, 'RT4', 60),
	(1005, 'RT5', 30);
GO

-- Mata Kuliah

CREATE TABLE Mata_Kuliah
(
  kode_mk         NVARCHAR(5) NOT NULL,
  sks			  INT,
  nama_mk		  NVARCHAR(20) NOT NULL,
  CONSTRAINT PK_Mata_Kuliah PRIMARY KEY(kode_mk)
);
GO

-- INSERT table Mata_Kuliah;

INSERT INTO Mata_Kuliah VALUES
  ('MK101',2,'Pemrograman Objek'),
  ('MK102',2,'Basis Data Lanjut'),
  ('MK103',2,'Desain Interface'),
  ('MK104',2,'Desain Pemograman Web'),
  ('MK105',2,'Kecerdasan Buatan'),
  ('MK106',2,'Jaringan Komputer'),
  ('MK107',2,'Statistika Komputasi');
GO

-- Detail Mata Kuliah

CREATE TABLE Detail_mk (
	kode_mk NVARCHAR(5) NOT NULL,
	nip NVARCHAR(20) NOT NULL,
	CONSTRAINT FK_Detail_mk FOREIGN KEY(kode_mk) REFERENCES Mata_Kuliah (kode_mk),
	CONSTRAINT FK_Detail_dosen FOREIGN KEY(nip) REFERENCES Dosen(nip)
);
GO

-- DROP TABLE Detail_mk

INSERT INTO Detail_mk VALUES
	('MK101', '004775631'),
	('MK102', '004775632'),
	('MK103', '004775633'),
	('MK104', '004775634'),
	('MK105', '004775635'),
	('MK106', '004775636'),
	('MK107', '004775637'),

GO

-- Kelas

CREATE TABLE Kelas_mhs (
	id_kls		int not null,
	nama_kelas	NVARCHAR(10),
	CONSTRAINT PK_Detail_kls_mhs PRIMARY KEY(id_kls)
);
GO

-- drop table Kelas_mhs

INSERT INTO Kelas_mhs values
	(05,'TI2A'),
	(06,'TI2B'),
	(07,'TI2C'),
	(08,'TI2D'),
	(09,'TI2E');
GO

-- Detail Kelas Mahasiswa

CREATE TABLE Detail_kls_mhs (
	id_kls		INT not null,
	nim		    INT not null,
	CONSTRAINT FK_Detail_mahasiswa FOREIGN KEY(id_kls) REFERENCES Kelas_mhs(id_kls),
	CONSTRAINT FK_Detail_kelas_mahasiswa FOREIGN KEY(nim) REFERENCES Mahasiswa(nim)
);
GO

-- drop table Detail_kls_mhs;

INSERT INTO Detail_kls_mhs VALUES
	(05,1941720062),
	(06,1941720063),
	(07,1941720064),
	(08,1941720065),
	(09,1941720066);
GO

-- Nilai

CREATE TABLE Nilai
(
  nim         INT NOT NULL,
  kode_mk	  NVARCHAR(5) NOT NULL,
  sks		  INT NOT NULL,
  nilai		  FLOAT NOT NULL,
  
  CONSTRAINT FK_nilai_kodemk FOREIGN KEY(kode_mk) REFERENCES Mata_Kuliah(kode_mk),
  CONSTRAINT FK_nilai_nim FOREIGN KEY(nim) REFERENCES Mahasiswa(nim)
);
GO

-- drop table Nilai;

INSERT INTO Nilai VALUES

(1941720062, 'MK101', 2, 80),
(1941720063, 'MK101', 2, 70),
(1941720064, 'MK101', 2, 70),
(1941720065, 'MK101', 2, 89),
(1941720066, 'MK101', 2, 91),

(1941720062, 'MK102', 2, 80),
(1941720063, 'MK102', 2, 92),
(1941720064, 'MK102', 2, 93),
(1941720065, 'MK102', 2, 85),
(1941720066, 'MK102', 2, 82),

(1941720062, 'MK103', 2, 89),
(1941720063, 'MK103', 2, 87),
(1941720064, 'MK103', 2, 81),
(1941720065, 'MK103', 2, 84),
(1941720066, 'MK103', 2, 83),

(1941720062, 'MK104', 2, 93),
(1941720063, 'MK104', 2, 92),
(1941720064, 'MK104', 2, 81),
(1941720065, 'MK104', 2, 80),
(1941720066, 'MK104', 2, 79),

(1941720062, 'MK105', 2, 72),
(1941720063, 'MK105', 2, 74),
(1941720064, 'MK105', 2, 73),
(1941720065, 'MK105', 2, 89),
(1941720066, 'MK105', 2, 80),

(1941720062, 'MK106', 2, 86),
(1941720063, 'MK106', 2, 84),
(1941720064, 'MK106', 2, 83),
(1941720065, 'MK106', 2, 82),
(1941720066, 'MK106', 2, 81),

(1941720062, 'MK107', 2, 91),
(1941720063, 'MK107', 2, 90),
(1941720064, 'MK107', 2, 93),
(1941720065, 'MK107', 2, 94),
(1941720066, 'MK107', 2, 95);