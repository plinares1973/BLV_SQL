USE [BLV]
GO
/****** Object:  Table [Proceso].[Tablon_Impacto_Stock]    Script Date: 20/4/2023 12:37:59 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Proceso].[Tablon_Impacto_Stock](
	[id_tablon_impacto_stock] [int] IDENTITY(1,1) NOT NULL,
	[id_compra] [int] NULL,
	[numero_importacion] [nvarchar](50) NULL,
	[certificado_libre_circulacion] [nvarchar](255) NULL,
	[fecha_certificado_libre_circulacion] [date] NULL,
	[id_lote] [int] NULL,
	[codigo_producto] [varchar](10) NULL,
	[marca] [varchar](50) NULL,
	[cantidad] [int] NULL,
	[certificado_coa] [nvarchar](255) NULL,
	[fecha_elaboracion] [smalldatetime] NULL,
	[fecha_vencimiento] [smalldatetime] NULL,
	[posiciones_deposito] [int] NULL
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [Proceso].[Tablon_Impacto_Stock] ON 

INSERT [Proceso].[Tablon_Impacto_Stock] ([id_tablon_impacto_stock], [id_compra], [numero_importacion], [certificado_libre_circulacion], [fecha_certificado_libre_circulacion], [id_lote], [codigo_producto], [marca], [cantidad], [certificado_coa], [fecha_elaboracion], [fecha_vencimiento], [posiciones_deposito]) VALUES (1, 1, N'asd1', N'LIBRE CIRCULACION.pdf', CAST(N'2023-04-20' AS Date), 1, N'CIT005', N'QINGDAO TWELL SANSINO IMPORT & EXPORT CO', 500, N'LIBRE CIRCULACION.pdf', CAST(N'2023-04-20T00:00:00' AS SmallDateTime), CAST(N'2023-04-20T00:00:00' AS SmallDateTime), 1)
INSERT [Proceso].[Tablon_Impacto_Stock] ([id_tablon_impacto_stock], [id_compra], [numero_importacion], [certificado_libre_circulacion], [fecha_certificado_libre_circulacion], [id_lote], [codigo_producto], [marca], [cantidad], [certificado_coa], [fecha_elaboracion], [fecha_vencimiento], [posiciones_deposito]) VALUES (2, 1, N'asd1', N'LIBRE CIRCULACION.pdf', CAST(N'2023-04-20' AS Date), 2, N'CIT005', N'QINGDAO TWELL SANSINO IMPORT & EXPORT CO', 750, N'LIBRE CIRCULACION.pdf', CAST(N'2023-04-20T00:00:00' AS SmallDateTime), CAST(N'2023-04-20T00:00:00' AS SmallDateTime), 2)
INSERT [Proceso].[Tablon_Impacto_Stock] ([id_tablon_impacto_stock], [id_compra], [numero_importacion], [certificado_libre_circulacion], [fecha_certificado_libre_circulacion], [id_lote], [codigo_producto], [marca], [cantidad], [certificado_coa], [fecha_elaboracion], [fecha_vencimiento], [posiciones_deposito]) VALUES (3, 1, N'asd1', N'LIBRE CIRCULACION.pdf', CAST(N'2023-04-20' AS Date), 3, N'CIT005', N'QINGDAO TWELL SANSINO IMPORT & EXPORT CO', 125, N'LIBRE CIRCULACION.pdf', CAST(N'2023-04-20T00:00:00' AS SmallDateTime), CAST(N'2023-04-20T00:00:00' AS SmallDateTime), 2)
INSERT [Proceso].[Tablon_Impacto_Stock] ([id_tablon_impacto_stock], [id_compra], [numero_importacion], [certificado_libre_circulacion], [fecha_certificado_libre_circulacion], [id_lote], [codigo_producto], [marca], [cantidad], [certificado_coa], [fecha_elaboracion], [fecha_vencimiento], [posiciones_deposito]) VALUES (4, 1, N'asd1', N'LIBRE CIRCULACION.pdf', CAST(N'2023-04-20' AS Date), 4, N'CIT005', N'QINGDAO TWELL SANSINO IMPORT & EXPORT CO', 125, N'LIBRE CIRCULACION.pdf', CAST(N'2023-04-20T00:00:00' AS SmallDateTime), CAST(N'2023-04-20T00:00:00' AS SmallDateTime), 1)
SET IDENTITY_INSERT [Proceso].[Tablon_Impacto_Stock] OFF
GO
