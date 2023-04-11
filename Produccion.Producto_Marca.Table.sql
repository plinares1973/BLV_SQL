USE [BLV]
GO
/****** Object:  Table [Produccion].[Producto_Marca]    Script Date: 10/4/2023 11:10:41 p. m. ******/
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
SET IDENTITY_INSERT [Produccion].[Producto_Marca] OFF
GO
