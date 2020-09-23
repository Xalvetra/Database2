USE [polinema]
GO

/****** Object:  Table [dbo].[kelas]    Script Date: 09/09/2020 16:02:16 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[kelas](
	[kode] [varchar](10) NOT NULL,
	[tahun_ajar] [varchar](50) NOT NULL,
	[nim_mhs] [varchar](50) NULL,
 CONSTRAINT [PK_kelas] PRIMARY KEY CLUSTERED
 tahun_ajar char FOREIGN KEY REFERENCES kelas(tahun_ajar)
(
	[kode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[kelas]  WITH CHECK ADD  CONSTRAINT [FK_kelas_mahasiswa] FOREIGN KEY([nim_mhs])
REFERENCES [dbo].[mahasiswa] ([nim])
GO

ALTER TABLE [dbo].[kelas] CHECK CONSTRAINT [FK_kelas_mahasiswa]
GO


