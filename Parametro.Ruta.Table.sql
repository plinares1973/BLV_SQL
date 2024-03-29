USE [BLV]
GO
/****** Object:  Table [Parametro].[Ruta]    Script Date: 6/7/2023 8:42:53 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Parametro].[Ruta](
	[id_ruta] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [varchar](100) NULL,
	[ruta] [varchar](150) NULL,
	[id_certificado] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_ruta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [Parametro].[Ruta] ON 

INSERT [Parametro].[Ruta] ([id_ruta], [descripcion], [ruta], [id_certificado]) VALUES (1, N'RUTA SUBIDA MSDS', N'D:\CONSULTORA PAL\BLV\MSDS', 1)
INSERT [Parametro].[Ruta] ([id_ruta], [descripcion], [ruta], [id_certificado]) VALUES (2, N'RUTA REPOSITORIO MSDS', N'D:\CONSULTORA PAL\BLV\MSDS_REPO', 1)
INSERT [Parametro].[Ruta] ([id_ruta], [descripcion], [ruta], [id_certificado]) VALUES (3, N'RUTA BACKUP MSDS', N'D:\CONSULTORA PAL\BLV\MSDS_BACKUP', 1)
INSERT [Parametro].[Ruta] ([id_ruta], [descripcion], [ruta], [id_certificado]) VALUES (4, N'RUTA SUBIDA LIBRE CIRCULACION', N'D:\CONSULTORA PAL\BLV\LIBRE_CIRCULACION', 2)
INSERT [Parametro].[Ruta] ([id_ruta], [descripcion], [ruta], [id_certificado]) VALUES (5, N'RUTA REPOSITORIO LIBRE CIRCULACION', N'D:\CONSULTORA PAL\BLV\LIBRE_CIRCULACION_REPO', 2)
INSERT [Parametro].[Ruta] ([id_ruta], [descripcion], [ruta], [id_certificado]) VALUES (6, N'RUTA BACKUP LIBRE CIRCULACION', N'D:\CONSULTORA PAL\BLV\LIBRE_CIRCULACION_BACKUP', 2)
INSERT [Parametro].[Ruta] ([id_ruta], [descripcion], [ruta], [id_certificado]) VALUES (7, N'RUTA SUBIDA RNPA', N'D:\CONSULTORA PAL\BLV\RNPA', 3)
INSERT [Parametro].[Ruta] ([id_ruta], [descripcion], [ruta], [id_certificado]) VALUES (8, N'RUTA REPOSITORIO RNPA', N'D:\CONSULTORA PAL\BLV\RNPA_REPO', 3)
INSERT [Parametro].[Ruta] ([id_ruta], [descripcion], [ruta], [id_certificado]) VALUES (9, N'RUTA BACKUP RNPA', N'D:\CONSULTORA PAL\BLV\RNPA_BACKUP', 3)
INSERT [Parametro].[Ruta] ([id_ruta], [descripcion], [ruta], [id_certificado]) VALUES (10, N'RUTA SUBIDA COA', N'D:\CONSULTORA PAL\BLV\COA', 3)
INSERT [Parametro].[Ruta] ([id_ruta], [descripcion], [ruta], [id_certificado]) VALUES (11, N'RUTA REPOSITORIO COA', N'D:\CONSULTORA PAL\BLV\COA_REPO', 3)
INSERT [Parametro].[Ruta] ([id_ruta], [descripcion], [ruta], [id_certificado]) VALUES (12, N'RUTA BACKUP COA', N'D:\CONSULTORA PAL\BLV\COA_BACKUP', 3)
SET IDENTITY_INSERT [Parametro].[Ruta] OFF
GO
