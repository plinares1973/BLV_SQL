USE [BLV]
GO
/****** Object:  Table [Relacion].[Orden_Compra_Lote]    Script Date: 14/3/2023 11:16:38 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Relacion].[Orden_Compra_Lote](
	[id_orden_compra_lote] [int] IDENTITY(1,1) NOT NULL,
	[id_orden_compra] [int] NULL,
	[id_lote] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_orden_compra_lote] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [Relacion].[Orden_Compra_Lote] ON 

INSERT [Relacion].[Orden_Compra_Lote] ([id_orden_compra_lote], [id_orden_compra], [id_lote]) VALUES (1, 1, 1)
INSERT [Relacion].[Orden_Compra_Lote] ([id_orden_compra_lote], [id_orden_compra], [id_lote]) VALUES (2, 1, 2)
INSERT [Relacion].[Orden_Compra_Lote] ([id_orden_compra_lote], [id_orden_compra], [id_lote]) VALUES (3, 1, 3)
INSERT [Relacion].[Orden_Compra_Lote] ([id_orden_compra_lote], [id_orden_compra], [id_lote]) VALUES (4, 2, 4)
SET IDENTITY_INSERT [Relacion].[Orden_Compra_Lote] OFF
GO
