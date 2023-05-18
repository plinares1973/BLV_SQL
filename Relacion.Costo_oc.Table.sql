USE [BLV]
GO
/****** Object:  Table [Relacion].[Costo_oc]    Script Date: 17/5/2023 9:15:21 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Relacion].[Costo_oc](
	[id_costo_oc] [int] IDENTITY(1,1) NOT NULL,
	[id_concepto] [int] NULL,
	[id_orden_compra] [int] NULL,
	[monto] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_costo_oc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [Relacion].[Costo_oc] ON 

INSERT [Relacion].[Costo_oc] ([id_costo_oc], [id_concepto], [id_orden_compra], [monto]) VALUES (1, 4, 1, 53560)
INSERT [Relacion].[Costo_oc] ([id_costo_oc], [id_concepto], [id_orden_compra], [monto]) VALUES (2, 3, 2, NULL)
INSERT [Relacion].[Costo_oc] ([id_costo_oc], [id_concepto], [id_orden_compra], [monto]) VALUES (3, 4, 3, NULL)
INSERT [Relacion].[Costo_oc] ([id_costo_oc], [id_concepto], [id_orden_compra], [monto]) VALUES (4, 4, 4, 53560)
SET IDENTITY_INSERT [Relacion].[Costo_oc] OFF
GO
