USE [BLV]
GO
/****** Object:  Table [Proceso].[Tablon_Impacto_Stock]    Script Date: 14/4/2023 12:48:02 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Proceso].[Tablon_Impacto_Stock](
	[id_tablon_impacto_stock] [int] IDENTITY(1,1) NOT NULL,
	[id_compra] [int] NULL,
	[id_batch] [nvarchar](20) NOT NULL,
	[id_lote] [int] NULL,
	[codigo_producto] [varchar](10) NULL,
	[marca] [varchar](50) NULL,
	[cantidad] [int] NULL,
	[id_deposito] [int] NULL,
	[id_stock] [int] NULL,
	[es_cuarentena] [bit] NULL,
	[certificado_coa] [nvarchar](255) NULL,
	[fecha_certificado_coa] [smalldatetime] NULL,
	[fecha_elaboracion] [smalldatetime] NULL,
	[fecha_vencimiento] [smalldatetime] NULL,
	[certificado_libre_circulacion] [nvarchar](255) NULL,
	[fecha_certificado_libre_circulacion] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_batch] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [Proceso].[Tablon_Impacto_Stock] ON 

INSERT [Proceso].[Tablon_Impacto_Stock] ([id_tablon_impacto_stock], [id_compra], [id_batch], [id_lote], [codigo_producto], [marca], [cantidad], [id_deposito], [id_stock], [es_cuarentena], [certificado_coa], [fecha_certificado_coa], [fecha_elaboracion], [fecha_vencimiento], [certificado_libre_circulacion], [fecha_certificado_libre_circulacion]) VALUES (1, 1, N'a1', 1, N'CIT005', N'QINGDAO TWELL SANSINO IMPORT & EXPORT CO', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'MANUCHAR - ACIDO CITRICO GUOXIN - CoA.pdf', CAST(N'2023-04-11' AS Date))
INSERT [Proceso].[Tablon_Impacto_Stock] ([id_tablon_impacto_stock], [id_compra], [id_batch], [id_lote], [codigo_producto], [marca], [cantidad], [id_deposito], [id_stock], [es_cuarentena], [certificado_coa], [fecha_certificado_coa], [fecha_elaboracion], [fecha_vencimiento], [certificado_libre_circulacion], [fecha_certificado_libre_circulacion]) VALUES (3, 1, N'a11', 1, N'CIT005', N'QINGDAO TWELL SANSINO IMPORT & EXPORT CO', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'MANUCHAR - ACIDO CITRICO GUOXIN - CoA.pdf', CAST(N'2023-04-11' AS Date))
SET IDENTITY_INSERT [Proceso].[Tablon_Impacto_Stock] OFF
GO
