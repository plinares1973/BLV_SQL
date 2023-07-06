USE [BLV]
GO
/****** Object:  Table [Proceso].[Costo_a_Calcular]    Script Date: 6/7/2023 8:42:53 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Proceso].[Costo_a_Calcular](
	[id_orden_compra] [int] NULL,
	[orden] [int] NULL,
	[id_concepto_header] [int] NULL,
	[id_tipo_valor] [int] NULL,
	[valor] [float] NULL
) ON [PRIMARY]
GO
