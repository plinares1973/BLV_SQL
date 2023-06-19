USE [BLV]
GO
/****** Object:  Table [Proceso].[Relacion_Tablones]    Script Date: 19/6/2023 2:57:30 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Proceso].[Relacion_Tablones](
	[id_tablon_impacto_stock] [int] NULL,
	[id_tablon_impacto_deposito] [int] NULL
) ON [PRIMARY]
GO
INSERT [Proceso].[Relacion_Tablones] ([id_tablon_impacto_stock], [id_tablon_impacto_deposito]) VALUES (1, 1)
INSERT [Proceso].[Relacion_Tablones] ([id_tablon_impacto_stock], [id_tablon_impacto_deposito]) VALUES (8, 2)
GO
