USE [BLV]
GO
/****** Object:  Table [Relacion].[Producto_Receta]    Script Date: 6/7/2023 8:42:54 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Relacion].[Producto_Receta](
	[id_receta] [int] NULL,
	[codigo_ingrediente_producto] [varchar](10) NULL,
	[cantidad_percentil] [float] NULL
) ON [PRIMARY]
GO
INSERT [Relacion].[Producto_Receta] ([id_receta], [codigo_ingrediente_producto], [cantidad_percentil]) VALUES (1, N'FOS001', 65)
INSERT [Relacion].[Producto_Receta] ([id_receta], [codigo_ingrediente_producto], [cantidad_percentil]) VALUES (1, N'CIT005', 35)
GO
