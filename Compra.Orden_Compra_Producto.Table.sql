USE [BLV]
GO
/****** Object:  Table [Compra].[Orden_Compra_Producto]    Script Date: 11/6/2023 10:15:59 p. m. ******/
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
	[derecho_importacion] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_ocompra_producto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [Compra].[Orden_Compra_Producto] ON 

INSERT [Compra].[Orden_Compra_Producto] ([id_ocompra_producto], [id_orden_compra], [codigo_producto], [marca], [cantidad], [monto], [derecho_importacion]) VALUES (1, 1, N'CIT005', N'QINGDAO TWELL SANSINO IMPORT & EXPORT CO', 10000, 12, 9600)
INSERT [Compra].[Orden_Compra_Producto] ([id_ocompra_producto], [id_orden_compra], [codigo_producto], [marca], [cantidad], [monto], [derecho_importacion]) VALUES (2, 1, N'OLI001', N'DANKAN SRL', 10000, 15, 16500)
INSERT [Compra].[Orden_Compra_Producto] ([id_ocompra_producto], [id_orden_compra], [codigo_producto], [marca], [cantidad], [monto], [derecho_importacion]) VALUES (3, 2, N'PRC001', N'SHANGHAI TIANJIA BIOCHEMICAL CO., LTD.', 15000, 15, NULL)
INSERT [Compra].[Orden_Compra_Producto] ([id_ocompra_producto], [id_orden_compra], [codigo_producto], [marca], [cantidad], [monto], [derecho_importacion]) VALUES (4, 2, N'CIT005', N'LASERENISIMA', 15000, 15, NULL)
INSERT [Compra].[Orden_Compra_Producto] ([id_ocompra_producto], [id_orden_compra], [codigo_producto], [marca], [cantidad], [monto], [derecho_importacion]) VALUES (5, 4, N'3085', N'QINGDAO TWELL SANSINO IMPORT & EXPORT CO', 25000, 45, 22500)
INSERT [Compra].[Orden_Compra_Producto] ([id_ocompra_producto], [id_orden_compra], [codigo_producto], [marca], [cantidad], [monto], [derecho_importacion]) VALUES (1002, 1004, N'CIT005', N'QINGDAO TWELL SANSINO IMPORT & EXPORT CO', 2222, 22, 3910.7200000000003)
INSERT [Compra].[Orden_Compra_Producto] ([id_ocompra_producto], [id_orden_compra], [codigo_producto], [marca], [cantidad], [monto], [derecho_importacion]) VALUES (1003, 1004, N'CIT005', N'LASERENISIMA', 2222, 12, 3910.7200000000003)
SET IDENTITY_INSERT [Compra].[Orden_Compra_Producto] OFF
GO
