USE [BLV]
GO
/****** Object:  Table [Produccion].[Producto_Header]    Script Date: 14/3/2023 11:16:38 a. m. ******/
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
INSERT [Produccion].[Producto_Header] ([codigo_producto], [nombre_producto]) VALUES (N'CIT005', N'CITRATO DE SODIO')
INSERT [Produccion].[Producto_Header] ([codigo_producto], [nombre_producto]) VALUES (N'FAB042', N'INTEGRAL CARNICO')
INSERT [Produccion].[Producto_Header] ([codigo_producto], [nombre_producto]) VALUES (N'FOS001', N'TRIPOLIFOSATO DE SODIO')
INSERT [Produccion].[Producto_Header] ([codigo_producto], [nombre_producto]) VALUES (N'PRC001', N'PURAC FCC 98')
INSERT [Produccion].[Producto_Header] ([codigo_producto], [nombre_producto]) VALUES (N'QUES042', N'INTEGRAL QUESO')
GO
