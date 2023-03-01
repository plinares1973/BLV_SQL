USE [BLV]
GO
/****** Object:  Table [Proceso].[Hoja_Fabricacion]    Script Date: 1/3/2023 11:38:03 a. m. ******/
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
