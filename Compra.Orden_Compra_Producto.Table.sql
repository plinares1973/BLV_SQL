USE [BLV]
GO
/****** Object:  Table [Compra].[Orden_Compra_Producto]    Script Date: 2/3/2023 7:13:21 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Compra].[Orden_Compra_Producto](
	[id_ocompra_producto] [int] IDENTITY(1,1) NOT NULL,
	[id_orden_compra] [int] NULL,
	[codigo_producto] [varchar](10) NULL,
	[marca] [varchar](50) NULL,
	[cantidad] [int] NULL,
	[monto] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_ocompra_producto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [Compra].[Orden_Compra_Producto] ON 

INSERT [Compra].[Orden_Compra_Producto] ([id_ocompra_producto], [id_orden_compra], [codigo_producto], [marca], [cantidad], [monto]) VALUES (1, 3, N'CIT005', N'QINGDAO TWELL SANSINO', 100, 1500)
INSERT [Compra].[Orden_Compra_Producto] ([id_ocompra_producto], [id_orden_compra], [codigo_producto], [marca], [cantidad], [monto]) VALUES (2, 3, N'FAB042', N'QINGDAO TWELL SANSINO', 60, 25000)
INSERT [Compra].[Orden_Compra_Producto] ([id_ocompra_producto], [id_orden_compra], [codigo_producto], [marca], [cantidad], [monto]) VALUES (3, 3, N'FOS001', N'HENAN YULIN CHEMICAL CO LTD', 150, 15000)
INSERT [Compra].[Orden_Compra_Producto] ([id_ocompra_producto], [id_orden_compra], [codigo_producto], [marca], [cantidad], [monto]) VALUES (4, 4, N'CIT005', N'CENTAURO ALPHA LTD', 100, 1000)
INSERT [Compra].[Orden_Compra_Producto] ([id_ocompra_producto], [id_orden_compra], [codigo_producto], [marca], [cantidad], [monto]) VALUES (5, 4, N'FAB042', N'SHANGHAI TIANJIA BIOCHEMICAL CO LTD', 500, 2000)
INSERT [Compra].[Orden_Compra_Producto] ([id_ocompra_producto], [id_orden_compra], [codigo_producto], [marca], [cantidad], [monto]) VALUES (6, 5, N'FOS001', N'FOODCHEM INTERNATIONAL CORPORATION', 1000, 0)
SET IDENTITY_INSERT [Compra].[Orden_Compra_Producto] OFF
GO
