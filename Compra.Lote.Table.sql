USE [BLV]
GO
/****** Object:  Table [Compra].[Lote]    Script Date: 14/3/2023 11:16:38 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Compra].[Lote](
	[id_batch] [int] IDENTITY(1,1) NOT NULL,
	[codigo_lote] [varchar](10) NULL,
	[coa] [binary](1) NULL,
	[certificado_analisis] [varchar](20) NULL,
	[fecha_certificado_analisis] [smalldatetime] NULL,
	[certificado_circulacion] [varchar](20) NULL,
	[fecha_certificado_circulacion] [smalldatetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_batch] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [Compra].[Lote] ON 

INSERT [Compra].[Lote] ([id_batch], [codigo_lote], [coa], [certificado_analisis], [fecha_certificado_analisis], [certificado_circulacion], [fecha_certificado_circulacion]) VALUES (1, N'1-1', NULL, NULL, CAST(N'2023-03-14T00:00:00' AS SmallDateTime), NULL, CAST(N'2023-03-14T00:00:00' AS SmallDateTime))
INSERT [Compra].[Lote] ([id_batch], [codigo_lote], [coa], [certificado_analisis], [fecha_certificado_analisis], [certificado_circulacion], [fecha_certificado_circulacion]) VALUES (2, N'1-2', NULL, NULL, CAST(N'2023-03-14T00:00:00' AS SmallDateTime), NULL, CAST(N'2023-03-14T00:00:00' AS SmallDateTime))
INSERT [Compra].[Lote] ([id_batch], [codigo_lote], [coa], [certificado_analisis], [fecha_certificado_analisis], [certificado_circulacion], [fecha_certificado_circulacion]) VALUES (3, N'1-3', NULL, NULL, CAST(N'2023-03-14T00:00:00' AS SmallDateTime), NULL, CAST(N'2023-03-14T00:00:00' AS SmallDateTime))
INSERT [Compra].[Lote] ([id_batch], [codigo_lote], [coa], [certificado_analisis], [fecha_certificado_analisis], [certificado_circulacion], [fecha_certificado_circulacion]) VALUES (4, N'2-1', NULL, NULL, CAST(N'2023-03-14T00:00:00' AS SmallDateTime), NULL, CAST(N'2023-03-14T00:00:00' AS SmallDateTime))
SET IDENTITY_INSERT [Compra].[Lote] OFF
GO
