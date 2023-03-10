USE [BLV]
GO
/****** Object:  Table [Relacion].[OC_Producto_Empaque]    Script Date: 14/3/2023 11:16:38 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Relacion].[OC_Producto_Empaque](
	[id_ocproducto_empaque] [int] IDENTITY(1,1) NOT NULL,
	[id_ocompra_producto] [int] NULL,
	[id_empaque] [int] NULL,
	[capacidad_envase] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_ocproducto_empaque] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [Relacion].[OC_Producto_Empaque] ON 

INSERT [Relacion].[OC_Producto_Empaque] ([id_ocproducto_empaque], [id_ocompra_producto], [id_empaque], [capacidad_envase]) VALUES (1, 1, 1, 25)
INSERT [Relacion].[OC_Producto_Empaque] ([id_ocproducto_empaque], [id_ocompra_producto], [id_empaque], [capacidad_envase]) VALUES (2, 2, 1, 25)
INSERT [Relacion].[OC_Producto_Empaque] ([id_ocproducto_empaque], [id_ocompra_producto], [id_empaque], [capacidad_envase]) VALUES (3, 3, 1, 25)
SET IDENTITY_INSERT [Relacion].[OC_Producto_Empaque] OFF
GO
