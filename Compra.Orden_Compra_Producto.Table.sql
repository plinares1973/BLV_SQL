USE [BLV]
GO
/****** Object:  Table [Compra].[Orden_Compra_Producto]    Script Date: 17/5/2023 1:14:13 a. m. ******/
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

INSERT [Compra].[Orden_Compra_Producto] ([id_ocompra_producto], [id_orden_compra], [codigo_producto], [marca], [cantidad], [monto]) VALUES (1, 1, N'CIT005', N'QINGDAO TWELL SANSINO IMPORT & EXPORT CO', 1500, 12)
INSERT [Compra].[Orden_Compra_Producto] ([id_ocompra_producto], [id_orden_compra], [codigo_producto], [marca], [cantidad], [monto]) VALUES (2, 1, N'OLI001', N'DANKAN SRL', 3000, 123)
INSERT [Compra].[Orden_Compra_Producto] ([id_ocompra_producto], [id_orden_compra], [codigo_producto], [marca], [cantidad], [monto]) VALUES (3, 2, N'PRC001', N'SHANGHAI TIANJIA BIOCHEMICAL CO., LTD.', 10000, 12)
INSERT [Compra].[Orden_Compra_Producto] ([id_ocompra_producto], [id_orden_compra], [codigo_producto], [marca], [cantidad], [monto]) VALUES (4, 2, N'CIT005', N'LASERENISIMA', 10000, 2)
SET IDENTITY_INSERT [Compra].[Orden_Compra_Producto] OFF
GO
