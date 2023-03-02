USE [BLV]
GO
/****** Object:  Table [Compra].[Lote]    Script Date: 2/3/2023 7:13:21 p. m. ******/
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

INSERT [Compra].[Lote] ([id_batch], [codigo_lote], [coa], [certificado_analisis], [fecha_certificado_analisis], [certificado_circulacion], [fecha_certificado_circulacion]) VALUES (1, N'3-1', NULL, NULL, CAST(N'2023-03-01T00:00:00' AS SmallDateTime), NULL, CAST(N'2023-03-01T00:00:00' AS SmallDateTime))
INSERT [Compra].[Lote] ([id_batch], [codigo_lote], [coa], [certificado_analisis], [fecha_certificado_analisis], [certificado_circulacion], [fecha_certificado_circulacion]) VALUES (2, N'3-2', NULL, NULL, CAST(N'2023-03-01T00:00:00' AS SmallDateTime), NULL, CAST(N'2023-03-01T00:00:00' AS SmallDateTime))
INSERT [Compra].[Lote] ([id_batch], [codigo_lote], [coa], [certificado_analisis], [fecha_certificado_analisis], [certificado_circulacion], [fecha_certificado_circulacion]) VALUES (3, N'3-3', NULL, NULL, CAST(N'2023-03-01T00:00:00' AS SmallDateTime), NULL, CAST(N'2023-03-01T00:00:00' AS SmallDateTime))
INSERT [Compra].[Lote] ([id_batch], [codigo_lote], [coa], [certificado_analisis], [fecha_certificado_analisis], [certificado_circulacion], [fecha_certificado_circulacion]) VALUES (4, N'4-1', NULL, NULL, CAST(N'2023-02-28T00:00:00' AS SmallDateTime), NULL, CAST(N'2023-02-28T00:00:00' AS SmallDateTime))
INSERT [Compra].[Lote] ([id_batch], [codigo_lote], [coa], [certificado_analisis], [fecha_certificado_analisis], [certificado_circulacion], [fecha_certificado_circulacion]) VALUES (5, N'4-2', NULL, NULL, CAST(N'2023-02-28T00:00:00' AS SmallDateTime), NULL, CAST(N'2023-02-28T00:00:00' AS SmallDateTime))
INSERT [Compra].[Lote] ([id_batch], [codigo_lote], [coa], [certificado_analisis], [fecha_certificado_analisis], [certificado_circulacion], [fecha_certificado_circulacion]) VALUES (6, N'4-3', NULL, NULL, CAST(N'2023-02-28T00:00:00' AS SmallDateTime), NULL, CAST(N'2023-02-28T00:00:00' AS SmallDateTime))
INSERT [Compra].[Lote] ([id_batch], [codigo_lote], [coa], [certificado_analisis], [fecha_certificado_analisis], [certificado_circulacion], [fecha_certificado_circulacion]) VALUES (7, N'4-4', NULL, NULL, CAST(N'2023-02-28T00:00:00' AS SmallDateTime), NULL, CAST(N'2023-02-28T00:00:00' AS SmallDateTime))
INSERT [Compra].[Lote] ([id_batch], [codigo_lote], [coa], [certificado_analisis], [fecha_certificado_analisis], [certificado_circulacion], [fecha_certificado_circulacion]) VALUES (8, N'5-1', NULL, NULL, CAST(N'2023-03-02T00:00:00' AS SmallDateTime), NULL, CAST(N'2023-03-02T00:00:00' AS SmallDateTime))
INSERT [Compra].[Lote] ([id_batch], [codigo_lote], [coa], [certificado_analisis], [fecha_certificado_analisis], [certificado_circulacion], [fecha_certificado_circulacion]) VALUES (9, N'5-2', NULL, NULL, CAST(N'2023-03-02T00:00:00' AS SmallDateTime), NULL, CAST(N'2023-03-02T00:00:00' AS SmallDateTime))
INSERT [Compra].[Lote] ([id_batch], [codigo_lote], [coa], [certificado_analisis], [fecha_certificado_analisis], [certificado_circulacion], [fecha_certificado_circulacion]) VALUES (10, N'5-3', NULL, NULL, CAST(N'2023-03-02T00:00:00' AS SmallDateTime), NULL, CAST(N'2023-03-02T00:00:00' AS SmallDateTime))
INSERT [Compra].[Lote] ([id_batch], [codigo_lote], [coa], [certificado_analisis], [fecha_certificado_analisis], [certificado_circulacion], [fecha_certificado_circulacion]) VALUES (11, N'5-4', NULL, NULL, CAST(N'2023-03-02T00:00:00' AS SmallDateTime), NULL, CAST(N'2023-03-02T00:00:00' AS SmallDateTime))
SET IDENTITY_INSERT [Compra].[Lote] OFF
GO
