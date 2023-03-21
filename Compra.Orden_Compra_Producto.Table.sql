USE [BLV]
GO
/****** Object:  Table [Compra].[Orden_Compra_Producto]    Script Date: 21/3/2023 9:13:34 a. m. ******/
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

INSERT [Compra].[Orden_Compra_Producto] ([id_ocompra_producto], [id_orden_compra], [codigo_producto], [marca], [cantidad], [monto]) VALUES (1, 1, N'CIT005', N'QINGDAO TWELL SANSINO', 1000, 0)
INSERT [Compra].[Orden_Compra_Producto] ([id_ocompra_producto], [id_orden_compra], [codigo_producto], [marca], [cantidad], [monto]) VALUES (2, 1, N'FOS001', N'FOODCHEM INTERNATIONAL CORPORATION', 5000, 0)
INSERT [Compra].[Orden_Compra_Producto] ([id_ocompra_producto], [id_orden_compra], [codigo_producto], [marca], [cantidad], [monto]) VALUES (3, 1, N'PRC001', N'HENAN YULIN CHEMICAL CO LTD', 8500, 0)
SET IDENTITY_INSERT [Compra].[Orden_Compra_Producto] OFF
GO
