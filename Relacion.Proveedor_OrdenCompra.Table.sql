USE [BLV]
GO
/****** Object:  Table [Relacion].[Proveedor_OrdenCompra]    Script Date: 17/5/2023 9:15:21 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Relacion].[Proveedor_OrdenCompra](
	[id_proveedor_OrdenCompra] [int] IDENTITY(1,1) NOT NULL,
	[id_proveedor] [int] NULL,
	[id_orden_compra] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_proveedor_OrdenCompra] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [Relacion].[Proveedor_OrdenCompra] ON 

INSERT [Relacion].[Proveedor_OrdenCompra] ([id_proveedor_OrdenCompra], [id_proveedor], [id_orden_compra]) VALUES (1, 1, 1)
INSERT [Relacion].[Proveedor_OrdenCompra] ([id_proveedor_OrdenCompra], [id_proveedor], [id_orden_compra]) VALUES (2, 1, 2)
INSERT [Relacion].[Proveedor_OrdenCompra] ([id_proveedor_OrdenCompra], [id_proveedor], [id_orden_compra]) VALUES (3, 2, 3)
INSERT [Relacion].[Proveedor_OrdenCompra] ([id_proveedor_OrdenCompra], [id_proveedor], [id_orden_compra]) VALUES (4, 1, 4)
SET IDENTITY_INSERT [Relacion].[Proveedor_OrdenCompra] OFF
GO
