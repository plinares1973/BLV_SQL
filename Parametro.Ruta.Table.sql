USE [BLV]
GO
/****** Object:  Table [Parametro].[Ruta]    Script Date: 19/3/2023 6:49:49 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Parametro].[Ruta](
	[id_ruta] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [varchar](30) NULL,
	[ruta] [varchar](60) NULL,
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
SET IDENTITY_INSERT [Parametro].[Ruta] OFF
GO
