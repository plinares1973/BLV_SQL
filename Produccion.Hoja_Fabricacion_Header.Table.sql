USE [BLV]
GO
/****** Object:  Table [Produccion].[Hoja_Fabricacion_Header]    Script Date: 2/3/2023 7:13:21 p. m. ******/
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

INSERT [Produccion].[Hoja_Fabricacion_Header] ([id_hoja_fabricacion], [fecha_creacion_orden], [id_receta], [id_stock_insumo], [cantidad_insumo], [cantidad_fabricar]) VALUES (1, CAST(N'2023-03-02' AS Date), 1, 1, 4, 100)
SET IDENTITY_INSERT [Produccion].[Hoja_Fabricacion_Header] OFF
GO
