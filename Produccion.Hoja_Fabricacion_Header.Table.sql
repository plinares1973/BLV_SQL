USE [BLV]
GO
/****** Object:  Table [Produccion].[Hoja_Fabricacion_Header]    Script Date: 6/7/2023 8:42:53 p. m. ******/
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
