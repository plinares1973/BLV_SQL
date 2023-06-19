USE [BLV]
GO
/****** Object:  Table [Proceso].[Tablon_Impacto_Deposito]    Script Date: 19/6/2023 2:57:30 p. m. ******/
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
SET IDENTITY_INSERT [Proceso].[Tablon_Impacto_Deposito] ON 

INSERT [Proceso].[Tablon_Impacto_Deposito] ([id_tablon_impacto_deposito], [id_deposito], [id_stock], [es_cuarentena]) VALUES (1, 1, 2, 0)
INSERT [Proceso].[Tablon_Impacto_Deposito] ([id_tablon_impacto_deposito], [id_deposito], [id_stock], [es_cuarentena]) VALUES (2, 1, 1, 0)
SET IDENTITY_INSERT [Proceso].[Tablon_Impacto_Deposito] OFF
GO
