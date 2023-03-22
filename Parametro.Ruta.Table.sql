USE [BLV]
GO
/****** Object:  Table [Parametro].[Ruta]    Script Date: 22/3/2023 11:18:49 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Parametro].[Ruta](
	[id_ruta] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [varchar](100) NULL,
	[ruta] [varchar](150) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_ruta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [Parametro].[Ruta] ON 

INSERT [Parametro].[Ruta] ([id_ruta], [descripcion], [ruta]) VALUES (1, N'RUTA SUBIDA MSDS', N'D:\CONSULTORA PAL\BLV\MSDS')
INSERT [Parametro].[Ruta] ([id_ruta], [descripcion], [ruta]) VALUES (2, N'RUTA REPOSITORIO MSDS', N'D:\CONSULTORA PAL\BLV\MSDS_REPO')
INSERT [Parametro].[Ruta] ([id_ruta], [descripcion], [ruta]) VALUES (3, N'RUTA BACKUP MSDS', N'D:\CONSULTORA PAL\BLV\MSDS_BACKUP')
INSERT [Parametro].[Ruta] ([id_ruta], [descripcion], [ruta]) VALUES (4, N'RUTA SUBIDA LIBRE CIRCULACION', N'D:\CONSULTORA PAL\BLV\LIBRE_CIRCULACION')
INSERT [Parametro].[Ruta] ([id_ruta], [descripcion], [ruta]) VALUES (5, N'RUTA REPOSITORIO LIBRE CIRCULACION', N'D:\CONSULTORA PAL\BLV\LIBRE_CIRCULACION_REPO')
INSERT [Parametro].[Ruta] ([id_ruta], [descripcion], [ruta]) VALUES (6, N'RUTA BACKUP LIBRE CIRCULACION', N'D:\CONSULTORA PAL\BLV\LIBRE_CIRCULACION_BACKUP')
INSERT [Parametro].[Ruta] ([id_ruta], [descripcion], [ruta]) VALUES (7, N'RUTA SUBIDA RNPA', N'D:\CONSULTORA PAL\BLV\RNPA')
INSERT [Parametro].[Ruta] ([id_ruta], [descripcion], [ruta]) VALUES (8, N'RUTA SUBIDA RNPA', N'D:\CONSULTORA PAL\BLV\RNPA_REPO')
INSERT [Parametro].[Ruta] ([id_ruta], [descripcion], [ruta]) VALUES (9, N'RUTA SUBIDA RNPA', N'D:\CONSULTORA PAL\BLV\RNPA_BACKUP')
SET IDENTITY_INSERT [Parametro].[Ruta] OFF
GO
