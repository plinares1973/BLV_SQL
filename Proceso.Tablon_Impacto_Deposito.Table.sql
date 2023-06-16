USE [BLV]
GO
/****** Object:  Table [Proceso].[Tablon_Impacto_Deposito]    Script Date: 15/6/2023 10:50:48 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Proceso].[Tablon_Impacto_Deposito](
	[id_tablon_impacto_deposito] [int] IDENTITY(1,1) NOT NULL,
	[id_deposito] [int] NULL,
	[id_stock] [int] NULL,
	[es_cuarentena] [bit] NULL
) ON [PRIMARY]
GO
