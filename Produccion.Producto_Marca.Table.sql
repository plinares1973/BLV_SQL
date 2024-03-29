USE [BLV]
GO
/****** Object:  Table [Produccion].[Producto_Marca]    Script Date: 6/7/2023 8:42:53 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Produccion].[Producto_Marca](
	[id_marca] [int] IDENTITY(1,1) NOT NULL,
	[marca] [varchar](50) NULL,
	[codigo_producto] [varchar](10) NULL,
	[id_pais] [int] NULL,
	[MSDS] [nvarchar](255) NULL,
	[RNPA] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_marca] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [Produccion].[Producto_Marca] ON 

INSERT [Produccion].[Producto_Marca] ([id_marca], [marca], [codigo_producto], [id_pais], [MSDS], [RNPA]) VALUES (1, N'QINGDAO TWELL SANSINO IMPORT & EXPORT CO', N'CIT005', 407, N'DATA FIBRA DE CELULOSA - ALBAFIBRE C100.pdf', N'RNPA ACIDO CITRICO RZBC.pdf')
INSERT [Produccion].[Producto_Marca] ([id_marca], [marca], [codigo_producto], [id_pais], [MSDS], [RNPA]) VALUES (2, N'SHANGHAI TIANJIA BIOCHEMICAL CO., LTD.', N'PRC001', 407, N'ejercicio de trazabilidad_librecircu_3paginasprimeras.pdf', N'MANUCHAR - CITRICO GUOXIN - RNPA.pdf')
INSERT [Produccion].[Producto_Marca] ([id_marca], [marca], [codigo_producto], [id_pais], [MSDS], [RNPA]) VALUES (3, N'DANKAN SRL', N'FOS001', 340, N'ejercicio de trazabilidad_librecircu_3paginasprimeras.pdf', N'MANUCHAR - CITRICO GUOXIN - RNPA.pdf')
INSERT [Produccion].[Producto_Marca] ([id_marca], [marca], [codigo_producto], [id_pais], [MSDS], [RNPA]) VALUES (5, N'QINGDAO TWELL SANSINO IMPORT & EXPORT CO', N'PRO001', 407, NULL, NULL)
INSERT [Produccion].[Producto_Marca] ([id_marca], [marca], [codigo_producto], [id_pais], [MSDS], [RNPA]) VALUES (6, N'SHANGHAI TIANJIA BIOCHEMICAL CO., LTD.', N'PRO001', 407, N'DATA FIBRA DE CELULOSA - ALBAFIBRE C100.pdf', N'MANUCHAR - CITRICO GUOXIN - RNPA.pdf')
INSERT [Produccion].[Producto_Marca] ([id_marca], [marca], [codigo_producto], [id_pais], [MSDS], [RNPA]) VALUES (7, N'LASERENISIMA', N'CIT005', 340, N'DATA FIBRA DE CELULOSA - ALBAFIBRE C100.pdf', N'MANUCHAR - CITRICO GUOXIN - RNPA.pdf')
INSERT [Produccion].[Producto_Marca] ([id_marca], [marca], [codigo_producto], [id_pais], [MSDS], [RNPA]) VALUES (1006, N'DANKAN SRL', N'OLI001', 111, N'DATA FIBRA DE CELULOSA - ALBAFIBRE C100.pdf', N'RNPA ACIDO CITRICO RZBC.pdf')
INSERT [Produccion].[Producto_Marca] ([id_marca], [marca], [codigo_producto], [id_pais], [MSDS], [RNPA]) VALUES (1007, N'QINGDAO TWELL SANSINO IMPORT & EXPORT CO', N'3085', 407, N'DATA FIBRA DE CELULOSA - ALBAFIBRE C100.pdf', N'MANUCHAR - CITRICO GUOXIN - RNPA.pdf')
SET IDENTITY_INSERT [Produccion].[Producto_Marca] OFF
GO
