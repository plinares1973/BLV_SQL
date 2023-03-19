USE [BLV]
GO
/****** Object:  Table [Produccion].[Producto]    Script Date: 19/3/2023 6:49:49 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Produccion].[Producto](
	[id_producto] [int] IDENTITY(1,1) NOT NULL,
	[codigo_producto] [varchar](10) NOT NULL,
	[fecha_elaboracion] [smalldatetime] NULL,
	[fecha_vencimiento] [smalldatetime] NULL,
	[marca] [varchar](40) NULL,
 CONSTRAINT [PK__Producto] PRIMARY KEY CLUSTERED 
(
	[id_producto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [Produccion].[Producto] ON 

INSERT [Produccion].[Producto] ([id_producto], [codigo_producto], [fecha_elaboracion], [fecha_vencimiento], [marca]) VALUES (1, N'CIT005', CAST(N'2023-03-14T00:00:00' AS SmallDateTime), CAST(N'2023-03-14T00:00:00' AS SmallDateTime), N'QINGDAO TWELL SANSINO')
INSERT [Produccion].[Producto] ([id_producto], [codigo_producto], [fecha_elaboracion], [fecha_vencimiento], [marca]) VALUES (2, N'CIT005', CAST(N'2023-03-14T00:00:00' AS SmallDateTime), CAST(N'2023-03-14T00:00:00' AS SmallDateTime), N'QINGDAO TWELL SANSINO')
INSERT [Produccion].[Producto] ([id_producto], [codigo_producto], [fecha_elaboracion], [fecha_vencimiento], [marca]) VALUES (3, N'FAB042', CAST(N'2023-03-14T00:00:00' AS SmallDateTime), CAST(N'2023-03-14T00:00:00' AS SmallDateTime), N'QINGDAO TWELL SANSINO')
INSERT [Produccion].[Producto] ([id_producto], [codigo_producto], [fecha_elaboracion], [fecha_vencimiento], [marca]) VALUES (4, N'FAB042', CAST(N'2023-03-14T00:00:00' AS SmallDateTime), CAST(N'2023-03-14T00:00:00' AS SmallDateTime), N'QINGDAO TWELL SANSINO')
INSERT [Produccion].[Producto] ([id_producto], [codigo_producto], [fecha_elaboracion], [fecha_vencimiento], [marca]) VALUES (5, N'CIT005', CAST(N'2023-03-14T00:00:00' AS SmallDateTime), CAST(N'2023-03-14T00:00:00' AS SmallDateTime), N'QINGDAO TWELL SANSINO')
INSERT [Produccion].[Producto] ([id_producto], [codigo_producto], [fecha_elaboracion], [fecha_vencimiento], [marca]) VALUES (6, N'FOS001', CAST(N'2023-03-14T00:00:00' AS SmallDateTime), CAST(N'2023-03-14T00:00:00' AS SmallDateTime), N'HENAN YULIN CHEMICAL CO LTD')
SET IDENTITY_INSERT [Produccion].[Producto] OFF
GO
