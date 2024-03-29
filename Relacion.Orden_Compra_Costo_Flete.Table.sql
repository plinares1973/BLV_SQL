USE [BLV]
GO
/****** Object:  Table [Relacion].[Orden_Compra_Costo_Flete]    Script Date: 20/4/2023 12:37:59 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Relacion].[Orden_Compra_Costo_Flete](
	[id_Orden_Compra_Flete] [int] IDENTITY(1,1) NOT NULL,
	[id_orden_compra] [int] NULL,
	[id_flete] [int] NULL,
	[monto_flete] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_Orden_Compra_Flete] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [Relacion].[Orden_Compra_Costo_Flete] ON 

INSERT [Relacion].[Orden_Compra_Costo_Flete] ([id_Orden_Compra_Flete], [id_orden_compra], [id_flete], [monto_flete]) VALUES (1, 1, 1, 560)
SET IDENTITY_INSERT [Relacion].[Orden_Compra_Costo_Flete] OFF
GO
