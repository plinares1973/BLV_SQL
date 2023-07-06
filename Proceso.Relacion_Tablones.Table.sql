USE [BLV]
GO
/****** Object:  Table [Proceso].[Relacion_Tablones]    Script Date: 5/7/2023 10:45:14 p. m. ******/
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
INSERT [Proceso].[Relacion_Tablones] ([id_tablon_impacto_stock], [id_tablon_impacto_deposito]) VALUES (2, 2)
INSERT [Proceso].[Relacion_Tablones] ([id_tablon_impacto_stock], [id_tablon_impacto_deposito]) VALUES (3, 3)
INSERT [Proceso].[Relacion_Tablones] ([id_tablon_impacto_stock], [id_tablon_impacto_deposito]) VALUES (3, 4)
GO
