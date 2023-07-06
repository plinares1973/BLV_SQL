USE [BLV]
GO
/****** Object:  Table [Proceso].[Costo_a_Calcular]    Script Date: 5/7/2023 10:45:14 p. m. ******/
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
INSERT [Proceso].[Costo_a_Calcular] ([id_orden_compra], [orden], [id_concepto_header], [id_tipo_valor], [valor]) VALUES (1, 1, 2, 1, 15000)
INSERT [Proceso].[Costo_a_Calcular] ([id_orden_compra], [orden], [id_concepto_header], [id_tipo_valor], [valor]) VALUES (1, 2, 16, 1, 1500)
INSERT [Proceso].[Costo_a_Calcular] ([id_orden_compra], [orden], [id_concepto_header], [id_tipo_valor], [valor]) VALUES (1, 3, 20, 1, 120)
INSERT [Proceso].[Costo_a_Calcular] ([id_orden_compra], [orden], [id_concepto_header], [id_tipo_valor], [valor]) VALUES (1, 4, 21, 1, -500)
INSERT [Proceso].[Costo_a_Calcular] ([id_orden_compra], [orden], [id_concepto_header], [id_tipo_valor], [valor]) VALUES (1, 6, 5, 2, 3)
INSERT [Proceso].[Costo_a_Calcular] ([id_orden_compra], [orden], [id_concepto_header], [id_tipo_valor], [valor]) VALUES (1, 7, 6, 2, 21)
INSERT [Proceso].[Costo_a_Calcular] ([id_orden_compra], [orden], [id_concepto_header], [id_tipo_valor], [valor]) VALUES (1, 8, 7, 2, 20)
INSERT [Proceso].[Costo_a_Calcular] ([id_orden_compra], [orden], [id_concepto_header], [id_tipo_valor], [valor]) VALUES (1, 9, 10, 1, 10)
INSERT [Proceso].[Costo_a_Calcular] ([id_orden_compra], [orden], [id_concepto_header], [id_tipo_valor], [valor]) VALUES (1, 5, 22, 1, 9320)
GO
