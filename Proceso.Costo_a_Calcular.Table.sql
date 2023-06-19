USE [BLV]
GO
/****** Object:  Table [Proceso].[Costo_a_Calcular]    Script Date: 19/6/2023 2:57:30 p. m. ******/
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
INSERT [Proceso].[Costo_a_Calcular] ([id_orden_compra], [orden], [id_concepto_header], [id_tipo_valor], [valor]) VALUES (2, 1, 2, 1, 50000)
INSERT [Proceso].[Costo_a_Calcular] ([id_orden_compra], [orden], [id_concepto_header], [id_tipo_valor], [valor]) VALUES (2, 2, 16, 1, 4500)
INSERT [Proceso].[Costo_a_Calcular] ([id_orden_compra], [orden], [id_concepto_header], [id_tipo_valor], [valor]) VALUES (2, 3, 20, 1, 210)
INSERT [Proceso].[Costo_a_Calcular] ([id_orden_compra], [orden], [id_concepto_header], [id_tipo_valor], [valor]) VALUES (2, 4, 21, 1, -1150)
INSERT [Proceso].[Costo_a_Calcular] ([id_orden_compra], [orden], [id_concepto_header], [id_tipo_valor], [valor]) VALUES (2, 5, 5, 2, 3)
INSERT [Proceso].[Costo_a_Calcular] ([id_orden_compra], [orden], [id_concepto_header], [id_tipo_valor], [valor]) VALUES (2, 7, 6, 2, 21)
INSERT [Proceso].[Costo_a_Calcular] ([id_orden_compra], [orden], [id_concepto_header], [id_tipo_valor], [valor]) VALUES (2, 8, 7, 2, 20)
INSERT [Proceso].[Costo_a_Calcular] ([id_orden_compra], [orden], [id_concepto_header], [id_tipo_valor], [valor]) VALUES (2, 9, 8, 2, 6)
INSERT [Proceso].[Costo_a_Calcular] ([id_orden_compra], [orden], [id_concepto_header], [id_tipo_valor], [valor]) VALUES (2, 10, 9, 2, 1.8)
INSERT [Proceso].[Costo_a_Calcular] ([id_orden_compra], [orden], [id_concepto_header], [id_tipo_valor], [valor]) VALUES (2, 11, 10, 1, 10)
INSERT [Proceso].[Costo_a_Calcular] ([id_orden_compra], [orden], [id_concepto_header], [id_tipo_valor], [valor]) VALUES (2, 6, 22, 1, 14000)
GO
