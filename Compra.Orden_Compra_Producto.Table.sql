USE [BLV]
GO
/****** Object:  Table [Compra].[Orden_Compra_Producto]    Script Date: 19/6/2023 2:57:30 p. m. ******/
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

INSERT [Compra].[Orden_Compra_Producto] ([id_ocompra_producto], [id_orden_compra], [codigo_producto], [marca], [cantidad], [monto], [derecho_importacion]) VALUES (1, 2, N'CIT005', N'QINGDAO TWELL SANSINO IMPORT & EXPORT CO', 10000, 12, 9600)
INSERT [Compra].[Orden_Compra_Producto] ([id_ocompra_producto], [id_orden_compra], [codigo_producto], [marca], [cantidad], [monto], [derecho_importacion]) VALUES (2, 2, N'3085', N'QINGDAO TWELL SANSINO IMPORT & EXPORT CO', 10000, 22, 4400)
SET IDENTITY_INSERT [Compra].[Orden_Compra_Producto] OFF
GO
