USE [BLV]
GO
/****** Object:  Table [Compra].[Orden_Compra_Producto]    Script Date: 24/2/2023 4:16:00 p. m. ******/
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

INSERT [Compra].[Orden_Compra_Producto] ([id_ocompra_producto], [id_orden_compra], [codigo_producto], [marca], [cantidad], [monto]) VALUES (1, 1, N'CIT005', N'QINGDAO TWELL SANSINO', 100, 18)
INSERT [Compra].[Orden_Compra_Producto] ([id_ocompra_producto], [id_orden_compra], [codigo_producto], [marca], [cantidad], [monto]) VALUES (2, 1, N'FOS001', N'HENAN YULIN CHEMICAL CO LTD', 50, 88)
INSERT [Compra].[Orden_Compra_Producto] ([id_ocompra_producto], [id_orden_compra], [codigo_producto], [marca], [cantidad], [monto]) VALUES (3, 2, N'FAB042', N'SHANGHAI TIANJIA BIOCHEMICAL CO LTD', 100, 500)
INSERT [Compra].[Orden_Compra_Producto] ([id_ocompra_producto], [id_orden_compra], [codigo_producto], [marca], [cantidad], [monto]) VALUES (4, 2, N'PRC001', N'CENTAURO ALPHA LTD', 300, 5000)
INSERT [Compra].[Orden_Compra_Producto] ([id_ocompra_producto], [id_orden_compra], [codigo_producto], [marca], [cantidad], [monto]) VALUES (5, 2, N'QUES042', N'CENTAURO ALPHA LTD', 100, 300)
INSERT [Compra].[Orden_Compra_Producto] ([id_ocompra_producto], [id_orden_compra], [codigo_producto], [marca], [cantidad], [monto]) VALUES (6, 3, N'CIT005', N'SHANGHAI TIANJIA BIOCHEMICAL CO LTD', 1000, 1000)
INSERT [Compra].[Orden_Compra_Producto] ([id_ocompra_producto], [id_orden_compra], [codigo_producto], [marca], [cantidad], [monto]) VALUES (7, 3, N'FAB042', N'SHANGHAI TIANJIA BIOCHEMICAL CO LTD', 500, 5000)
INSERT [Compra].[Orden_Compra_Producto] ([id_ocompra_producto], [id_orden_compra], [codigo_producto], [marca], [cantidad], [monto]) VALUES (8, 3, N'QUES042', N'MASTELLONE HMNOS LTD', 500, 1000)
INSERT [Compra].[Orden_Compra_Producto] ([id_ocompra_producto], [id_orden_compra], [codigo_producto], [marca], [cantidad], [monto]) VALUES (9, 4, N'CIT005', N'SHANGHAI TIANJIA BIOCHEMICAL CO LTD', 30, 1500)
INSERT [Compra].[Orden_Compra_Producto] ([id_ocompra_producto], [id_orden_compra], [codigo_producto], [marca], [cantidad], [monto]) VALUES (10, 4, N'FAB042', N'SHANGHAI TIANJIA BIOCHEMICAL CO LTD', 50, 800)
INSERT [Compra].[Orden_Compra_Producto] ([id_ocompra_producto], [id_orden_compra], [codigo_producto], [marca], [cantidad], [monto]) VALUES (11, 4, N'QUES042', N'CENTAURO ALPHA LTD', 100, 1550)
SET IDENTITY_INSERT [Compra].[Orden_Compra_Producto] OFF
GO
