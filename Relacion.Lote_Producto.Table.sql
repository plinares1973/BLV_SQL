USE [BLV]
GO
/****** Object:  Table [Relacion].[Lote_Producto]    Script Date: 24/2/2023 4:16:00 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Relacion].[Lote_Producto](
	[id_lote_producto] [int] IDENTITY(1,1) NOT NULL,
	[id_batch] [int] NULL,
	[id_producto] [int] NULL,
	[cantidad] [int] NULL,
	[id_medida] [int] NULL,
	[id_empaque] [int] NULL,
	[id_capacidad_envase] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_lote_producto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [Relacion].[Lote_Producto] ON 

INSERT [Relacion].[Lote_Producto] ([id_lote_producto], [id_batch], [id_producto], [cantidad], [id_medida], [id_empaque], [id_capacidad_envase]) VALUES (1, 1, 1, 50, 1, 1, 1)
INSERT [Relacion].[Lote_Producto] ([id_lote_producto], [id_batch], [id_producto], [cantidad], [id_medida], [id_empaque], [id_capacidad_envase]) VALUES (2, 1, 2, 25, 1, 1, 1)
INSERT [Relacion].[Lote_Producto] ([id_lote_producto], [id_batch], [id_producto], [cantidad], [id_medida], [id_empaque], [id_capacidad_envase]) VALUES (3, 2, 3, 25, 1, 1, 1)
INSERT [Relacion].[Lote_Producto] ([id_lote_producto], [id_batch], [id_producto], [cantidad], [id_medida], [id_empaque], [id_capacidad_envase]) VALUES (4, 2, 4, 50, 1, 1, 1)
INSERT [Relacion].[Lote_Producto] ([id_lote_producto], [id_batch], [id_producto], [cantidad], [id_medida], [id_empaque], [id_capacidad_envase]) VALUES (5, 2, 5, 50, 1, 1, 1)
INSERT [Relacion].[Lote_Producto] ([id_lote_producto], [id_batch], [id_producto], [cantidad], [id_medida], [id_empaque], [id_capacidad_envase]) VALUES (6, 3, 6, 100, 1, 1, 1)
INSERT [Relacion].[Lote_Producto] ([id_lote_producto], [id_batch], [id_producto], [cantidad], [id_medida], [id_empaque], [id_capacidad_envase]) VALUES (7, 3, 7, 100, 1, 1, 1)
INSERT [Relacion].[Lote_Producto] ([id_lote_producto], [id_batch], [id_producto], [cantidad], [id_medida], [id_empaque], [id_capacidad_envase]) VALUES (8, 3, 8, 100, 1, 1, 1)
INSERT [Relacion].[Lote_Producto] ([id_lote_producto], [id_batch], [id_producto], [cantidad], [id_medida], [id_empaque], [id_capacidad_envase]) VALUES (9, 3, 9, 100, 1, 1, 1)
INSERT [Relacion].[Lote_Producto] ([id_lote_producto], [id_batch], [id_producto], [cantidad], [id_medida], [id_empaque], [id_capacidad_envase]) VALUES (10, 3, 10, 100, 1, 1, 1)
INSERT [Relacion].[Lote_Producto] ([id_lote_producto], [id_batch], [id_producto], [cantidad], [id_medida], [id_empaque], [id_capacidad_envase]) VALUES (11, 4, 11, 30, 1, 1, 1)
INSERT [Relacion].[Lote_Producto] ([id_lote_producto], [id_batch], [id_producto], [cantidad], [id_medida], [id_empaque], [id_capacidad_envase]) VALUES (12, 4, 12, 30, 1, 1, 1)
INSERT [Relacion].[Lote_Producto] ([id_lote_producto], [id_batch], [id_producto], [cantidad], [id_medida], [id_empaque], [id_capacidad_envase]) VALUES (13, 4, 13, 10, 1, 1, 1)
INSERT [Relacion].[Lote_Producto] ([id_lote_producto], [id_batch], [id_producto], [cantidad], [id_medida], [id_empaque], [id_capacidad_envase]) VALUES (14, 5, 14, 10, 1, 1, 1)
INSERT [Relacion].[Lote_Producto] ([id_lote_producto], [id_batch], [id_producto], [cantidad], [id_medida], [id_empaque], [id_capacidad_envase]) VALUES (15, 5, 15, 20, 1, 1, 1)
INSERT [Relacion].[Lote_Producto] ([id_lote_producto], [id_batch], [id_producto], [cantidad], [id_medida], [id_empaque], [id_capacidad_envase]) VALUES (16, 6, 16, 80, 1, 1, 1)
SET IDENTITY_INSERT [Relacion].[Lote_Producto] OFF
GO
