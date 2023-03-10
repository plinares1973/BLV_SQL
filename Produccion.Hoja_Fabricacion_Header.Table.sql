USE [BLV]
GO
/****** Object:  Table [Produccion].[Hoja_Fabricacion_Header]    Script Date: 14/3/2023 11:16:38 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Produccion].[Hoja_Fabricacion_Header](
	[id_hoja_fabricacion] [int] IDENTITY(1,1) NOT NULL,
	[fecha_creacion_orden] [date] NULL,
	[id_receta] [int] NOT NULL,
	[id_stock_insumo] [int] NULL,
	[cantidad_insumo] [int] NULL,
	[cantidad_fabricar] [int] NULL
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [Produccion].[Hoja_Fabricacion_Header] ON 

INSERT [Produccion].[Hoja_Fabricacion_Header] ([id_hoja_fabricacion], [fecha_creacion_orden], [id_receta], [id_stock_insumo], [cantidad_insumo], [cantidad_fabricar]) VALUES (1, CAST(N'2023-03-14' AS Date), 1, 1, 4, 200)
INSERT [Produccion].[Hoja_Fabricacion_Header] ([id_hoja_fabricacion], [fecha_creacion_orden], [id_receta], [id_stock_insumo], [cantidad_insumo], [cantidad_fabricar]) VALUES (2, CAST(N'2023-03-14' AS Date), 1, 2, 4, 200)
INSERT [Produccion].[Hoja_Fabricacion_Header] ([id_hoja_fabricacion], [fecha_creacion_orden], [id_receta], [id_stock_insumo], [cantidad_insumo], [cantidad_fabricar]) VALUES (3, CAST(N'2023-03-14' AS Date), 1, 1, 8, 200)
SET IDENTITY_INSERT [Produccion].[Hoja_Fabricacion_Header] OFF
GO
