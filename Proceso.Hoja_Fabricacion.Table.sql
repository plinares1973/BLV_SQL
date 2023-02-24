USE [BLV]
GO
/****** Object:  Table [Proceso].[Hoja_Fabricacion]    Script Date: 24/2/2023 4:16:00 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Proceso].[Hoja_Fabricacion](
	[id_producto] [int] NULL,
	[id_hoja_fabrica] [int] NULL,
	[cantidad] [float] NULL,
	[id_medida] [int] NULL,
	[id_empaque] [int] NULL
) ON [PRIMARY]
GO
