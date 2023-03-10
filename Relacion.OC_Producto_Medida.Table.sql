USE [BLV]
GO
/****** Object:  Table [Relacion].[OC_Producto_Medida]    Script Date: 14/3/2023 11:16:38 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Relacion].[OC_Producto_Medida](
	[id_oc_producto_medida] [int] IDENTITY(1,1) NOT NULL,
	[id_ocompra_producto] [int] NULL,
	[id_medida] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_oc_producto_medida] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [Relacion].[OC_Producto_Medida] ON 

INSERT [Relacion].[OC_Producto_Medida] ([id_oc_producto_medida], [id_ocompra_producto], [id_medida]) VALUES (1, 1, 1)
INSERT [Relacion].[OC_Producto_Medida] ([id_oc_producto_medida], [id_ocompra_producto], [id_medida]) VALUES (2, 2, 1)
INSERT [Relacion].[OC_Producto_Medida] ([id_oc_producto_medida], [id_ocompra_producto], [id_medida]) VALUES (3, 3, 1)
SET IDENTITY_INSERT [Relacion].[OC_Producto_Medida] OFF
GO
