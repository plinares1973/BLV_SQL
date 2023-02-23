USE [BLV]
GO
/****** Object:  Table [Produccion].[Hoja_Fabricacion]    Script Date: 22/2/2023 10:12:20 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Produccion].[Hoja_Fabricacion](
	[id_hoja_fabricacion] [int] IDENTITY(1,1) NOT NULL,
	[fecha_elaboracion] [date] NULL,
	[id_receta] [int] NOT NULL
) ON [PRIMARY]
GO
