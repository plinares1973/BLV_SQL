USE [BLV]
GO
/****** Object:  Table [Produccion].[Empaque]    Script Date: 6/7/2023 8:42:53 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Produccion].[Empaque](
	[id_empaque] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [varchar](40) NULL,
	[id_medida_envase] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_empaque] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [Produccion].[Empaque] ON 

INSERT [Produccion].[Empaque] ([id_empaque], [descripcion], [id_medida_envase]) VALUES (1, N'BOLSA PAPEL BLANCA', 1)
INSERT [Produccion].[Empaque] ([id_empaque], [descripcion], [id_medida_envase]) VALUES (2, N'BIDON', 1)
INSERT [Produccion].[Empaque] ([id_empaque], [descripcion], [id_medida_envase]) VALUES (3, N'CAJA', 1)
INSERT [Produccion].[Empaque] ([id_empaque], [descripcion], [id_medida_envase]) VALUES (4, N'IBC', 1)
INSERT [Produccion].[Empaque] ([id_empaque], [descripcion], [id_medida_envase]) VALUES (5, N'DRUM', 1)
INSERT [Produccion].[Empaque] ([id_empaque], [descripcion], [id_medida_envase]) VALUES (6, N'TAMBOR', 1)
INSERT [Produccion].[Empaque] ([id_empaque], [descripcion], [id_medida_envase]) VALUES (7, N'BOLSA POLIETILENO', 1)
SET IDENTITY_INSERT [Produccion].[Empaque] OFF
GO
