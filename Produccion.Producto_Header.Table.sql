USE [BLV]
GO
/****** Object:  Table [Produccion].[Producto_Header]    Script Date: 6/7/2023 8:42:53 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Produccion].[Producto_Header](
	[codigo_producto] [varchar](10) NOT NULL,
	[nombre_producto] [varchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[codigo_producto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [Produccion].[Producto_Header] ([codigo_producto], [nombre_producto]) VALUES (N'3085', N'SUCRALOSA')
INSERT [Produccion].[Producto_Header] ([codigo_producto], [nombre_producto]) VALUES (N'BOL025', N'BOLSA PAPEL BLANCA 25KG')
INSERT [Produccion].[Producto_Header] ([codigo_producto], [nombre_producto]) VALUES (N'CIT005', N'CITRATO DE SODIO')
INSERT [Produccion].[Producto_Header] ([codigo_producto], [nombre_producto]) VALUES (N'FAB042', N'INTEGRAL CARNICO')
INSERT [Produccion].[Producto_Header] ([codigo_producto], [nombre_producto]) VALUES (N'FOS001', N'TRIFOSFATO DE SODIO')
INSERT [Produccion].[Producto_Header] ([codigo_producto], [nombre_producto]) VALUES (N'OLI001', N'ACEITE DE OLIVA EXTRA VIRGEN')
INSERT [Produccion].[Producto_Header] ([codigo_producto], [nombre_producto]) VALUES (N'PRC001', N'PURAC FCC 98')
INSERT [Produccion].[Producto_Header] ([codigo_producto], [nombre_producto]) VALUES (N'PRO001', N'PROPIONATO DE CALCIO')
INSERT [Produccion].[Producto_Header] ([codigo_producto], [nombre_producto]) VALUES (N'QUES042', N'INTEGRAL QUESO')
GO
