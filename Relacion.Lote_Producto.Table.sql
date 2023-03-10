USE [BLV]
GO
/****** Object:  Table [Relacion].[Lote_Producto]    Script Date: 14/3/2023 11:16:38 a. m. ******/
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
	[cuarentena] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_lote_producto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [Relacion].[Lote_Producto] ON 

INSERT [Relacion].[Lote_Producto] ([id_lote_producto], [id_batch], [id_producto], [cantidad], [id_medida], [id_empaque], [id_capacidad_envase], [cuarentena]) VALUES (1, 1, 1, 150, 1, 1, 1, 0)
INSERT [Relacion].[Lote_Producto] ([id_lote_producto], [id_batch], [id_producto], [cantidad], [id_medida], [id_empaque], [id_capacidad_envase], [cuarentena]) VALUES (2, 1, 2, 50, 1, 1, 1, 0)
INSERT [Relacion].[Lote_Producto] ([id_lote_producto], [id_batch], [id_producto], [cantidad], [id_medida], [id_empaque], [id_capacidad_envase], [cuarentena]) VALUES (3, 2, 3, 450, 1, 1, 1, 0)
INSERT [Relacion].[Lote_Producto] ([id_lote_producto], [id_batch], [id_producto], [cantidad], [id_medida], [id_empaque], [id_capacidad_envase], [cuarentena]) VALUES (4, 2, 4, 50, 1, 1, 1, 0)
INSERT [Relacion].[Lote_Producto] ([id_lote_producto], [id_batch], [id_producto], [cantidad], [id_medida], [id_empaque], [id_capacidad_envase], [cuarentena]) VALUES (5, 3, 5, 300, 1, 1, 1, 0)
INSERT [Relacion].[Lote_Producto] ([id_lote_producto], [id_batch], [id_producto], [cantidad], [id_medida], [id_empaque], [id_capacidad_envase], [cuarentena]) VALUES (6, 4, 6, 200, 1, 1, 1, 0)
SET IDENTITY_INSERT [Relacion].[Lote_Producto] OFF
GO
