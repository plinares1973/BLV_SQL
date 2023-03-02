USE [BLV]
GO
/****** Object:  Table [Produccion].[Producto]    Script Date: 2/3/2023 7:13:21 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Produccion].[Producto](
	[id_producto] [int] IDENTITY(1,1) NOT NULL,
	[codigo_producto] [varchar](10) NOT NULL,
	[fecha_elaboracion] [smalldatetime] NULL,
	[fecha_vencimiento] [smalldatetime] NULL,
	[msds] [binary](1) NULL,
	[marca] [varchar](40) NULL,
 CONSTRAINT [PK__Producto] PRIMARY KEY CLUSTERED 
(
	[id_producto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [Produccion].[Producto] ON 

INSERT [Produccion].[Producto] ([id_producto], [codigo_producto], [fecha_elaboracion], [fecha_vencimiento], [msds], [marca]) VALUES (1, N'CIT005', CAST(N'2023-03-01T00:00:00' AS SmallDateTime), CAST(N'2023-03-01T00:00:00' AS SmallDateTime), NULL, N'QINGDAO TWELL SANSINO')
INSERT [Produccion].[Producto] ([id_producto], [codigo_producto], [fecha_elaboracion], [fecha_vencimiento], [msds], [marca]) VALUES (2, N'FAB042', CAST(N'2023-03-01T00:00:00' AS SmallDateTime), CAST(N'2023-03-01T00:00:00' AS SmallDateTime), NULL, N'QINGDAO TWELL SANSINO')
INSERT [Produccion].[Producto] ([id_producto], [codigo_producto], [fecha_elaboracion], [fecha_vencimiento], [msds], [marca]) VALUES (3, N'FOS001', CAST(N'2023-03-01T00:00:00' AS SmallDateTime), CAST(N'2023-03-01T00:00:00' AS SmallDateTime), NULL, N'HENAN YULIN CHEMICAL CO LTD')
INSERT [Produccion].[Producto] ([id_producto], [codigo_producto], [fecha_elaboracion], [fecha_vencimiento], [msds], [marca]) VALUES (4, N'FAB042', CAST(N'2023-03-01T00:00:00' AS SmallDateTime), CAST(N'2023-03-01T00:00:00' AS SmallDateTime), NULL, N'QINGDAO TWELL SANSINO')
INSERT [Produccion].[Producto] ([id_producto], [codigo_producto], [fecha_elaboracion], [fecha_vencimiento], [msds], [marca]) VALUES (5, N'CIT005', CAST(N'2023-03-01T00:00:00' AS SmallDateTime), CAST(N'2023-03-01T00:00:00' AS SmallDateTime), NULL, N'QINGDAO TWELL SANSINO')
INSERT [Produccion].[Producto] ([id_producto], [codigo_producto], [fecha_elaboracion], [fecha_vencimiento], [msds], [marca]) VALUES (6, N'FOS001', CAST(N'2023-03-01T00:00:00' AS SmallDateTime), CAST(N'2023-03-01T00:00:00' AS SmallDateTime), NULL, N'HENAN YULIN CHEMICAL CO LTD')
INSERT [Produccion].[Producto] ([id_producto], [codigo_producto], [fecha_elaboracion], [fecha_vencimiento], [msds], [marca]) VALUES (7, N'FOS001', CAST(N'2023-03-01T00:00:00' AS SmallDateTime), CAST(N'2023-03-01T00:00:00' AS SmallDateTime), NULL, N'HENAN YULIN CHEMICAL CO LTD')
INSERT [Produccion].[Producto] ([id_producto], [codigo_producto], [fecha_elaboracion], [fecha_vencimiento], [msds], [marca]) VALUES (8, N'FAB042', CAST(N'2023-03-01T00:00:00' AS SmallDateTime), CAST(N'2023-03-01T00:00:00' AS SmallDateTime), NULL, N'QINGDAO TWELL SANSINO')
INSERT [Produccion].[Producto] ([id_producto], [codigo_producto], [fecha_elaboracion], [fecha_vencimiento], [msds], [marca]) VALUES (9, N'CIT005', CAST(N'2023-03-01T00:00:00' AS SmallDateTime), CAST(N'2023-03-01T00:00:00' AS SmallDateTime), NULL, N'QINGDAO TWELL SANSINO')
INSERT [Produccion].[Producto] ([id_producto], [codigo_producto], [fecha_elaboracion], [fecha_vencimiento], [msds], [marca]) VALUES (10, N'CIT005', CAST(N'2023-03-02T00:00:00' AS SmallDateTime), CAST(N'2023-03-02T00:00:00' AS SmallDateTime), NULL, N'CENTAURO ALPHA LTD')
INSERT [Produccion].[Producto] ([id_producto], [codigo_producto], [fecha_elaboracion], [fecha_vencimiento], [msds], [marca]) VALUES (11, N'FAB042', CAST(N'2023-03-02T00:00:00' AS SmallDateTime), CAST(N'2023-03-02T00:00:00' AS SmallDateTime), NULL, N'SHANGHAI TIANJIA BIOCHEMICAL CO LTD')
INSERT [Produccion].[Producto] ([id_producto], [codigo_producto], [fecha_elaboracion], [fecha_vencimiento], [msds], [marca]) VALUES (12, N'CIT005', CAST(N'2023-02-09T00:00:00' AS SmallDateTime), CAST(N'2023-04-30T00:00:00' AS SmallDateTime), NULL, N'CENTAURO ALPHA LTD')
INSERT [Produccion].[Producto] ([id_producto], [codigo_producto], [fecha_elaboracion], [fecha_vencimiento], [msds], [marca]) VALUES (13, N'FAB042', CAST(N'2023-02-09T00:00:00' AS SmallDateTime), CAST(N'2023-04-30T00:00:00' AS SmallDateTime), NULL, N'SHANGHAI TIANJIA BIOCHEMICAL CO LTD')
INSERT [Produccion].[Producto] ([id_producto], [codigo_producto], [fecha_elaboracion], [fecha_vencimiento], [msds], [marca]) VALUES (14, N'FAB042', CAST(N'2023-03-02T00:00:00' AS SmallDateTime), CAST(N'2023-05-29T00:00:00' AS SmallDateTime), NULL, N'SHANGHAI TIANJIA BIOCHEMICAL CO LTD')
INSERT [Produccion].[Producto] ([id_producto], [codigo_producto], [fecha_elaboracion], [fecha_vencimiento], [msds], [marca]) VALUES (15, N'CIT005', CAST(N'2023-03-02T00:00:00' AS SmallDateTime), CAST(N'2023-05-29T00:00:00' AS SmallDateTime), NULL, N'CENTAURO ALPHA LTD')
INSERT [Produccion].[Producto] ([id_producto], [codigo_producto], [fecha_elaboracion], [fecha_vencimiento], [msds], [marca]) VALUES (16, N'CIT005', CAST(N'2023-04-01T00:00:00' AS SmallDateTime), CAST(N'2023-06-02T00:00:00' AS SmallDateTime), NULL, N'CENTAURO ALPHA LTD')
INSERT [Produccion].[Producto] ([id_producto], [codigo_producto], [fecha_elaboracion], [fecha_vencimiento], [msds], [marca]) VALUES (17, N'FAB042', CAST(N'2023-04-01T00:00:00' AS SmallDateTime), CAST(N'2023-06-02T00:00:00' AS SmallDateTime), NULL, N'SHANGHAI TIANJIA BIOCHEMICAL CO LTD')
INSERT [Produccion].[Producto] ([id_producto], [codigo_producto], [fecha_elaboracion], [fecha_vencimiento], [msds], [marca]) VALUES (18, N'FOS001', CAST(N'2023-03-02T00:00:00' AS SmallDateTime), CAST(N'2023-03-30T00:00:00' AS SmallDateTime), NULL, N'FOODCHEM INTERNATIONAL CORPORATION')
INSERT [Produccion].[Producto] ([id_producto], [codigo_producto], [fecha_elaboracion], [fecha_vencimiento], [msds], [marca]) VALUES (19, N'FOS001', CAST(N'2023-03-02T00:00:00' AS SmallDateTime), CAST(N'2023-04-06T00:00:00' AS SmallDateTime), NULL, N'FOODCHEM INTERNATIONAL CORPORATION')
INSERT [Produccion].[Producto] ([id_producto], [codigo_producto], [fecha_elaboracion], [fecha_vencimiento], [msds], [marca]) VALUES (20, N'FOS001', CAST(N'2023-03-02T00:00:00' AS SmallDateTime), CAST(N'2023-04-27T00:00:00' AS SmallDateTime), NULL, N'FOODCHEM INTERNATIONAL CORPORATION')
INSERT [Produccion].[Producto] ([id_producto], [codigo_producto], [fecha_elaboracion], [fecha_vencimiento], [msds], [marca]) VALUES (21, N'FOS001', CAST(N'2023-03-02T00:00:00' AS SmallDateTime), CAST(N'2023-04-27T00:00:00' AS SmallDateTime), NULL, N'FOODCHEM INTERNATIONAL CORPORATION')
SET IDENTITY_INSERT [Produccion].[Producto] OFF
GO
