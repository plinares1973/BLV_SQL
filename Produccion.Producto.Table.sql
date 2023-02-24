USE [BLV]
GO
/****** Object:  Table [Produccion].[Producto]    Script Date: 24/2/2023 4:16:00 p. m. ******/
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

INSERT [Produccion].[Producto] ([id_producto], [codigo_producto], [fecha_elaboracion], [fecha_vencimiento], [msds], [marca]) VALUES (1, N'CIT005', CAST(N'2023-02-24T00:00:00' AS SmallDateTime), CAST(N'2023-02-24T00:00:00' AS SmallDateTime), NULL, N'QINGDAO TWELL SANSINO')
INSERT [Produccion].[Producto] ([id_producto], [codigo_producto], [fecha_elaboracion], [fecha_vencimiento], [msds], [marca]) VALUES (2, N'FOS001', CAST(N'2023-02-24T00:00:00' AS SmallDateTime), CAST(N'2023-02-24T00:00:00' AS SmallDateTime), NULL, N'HENAN YULIN CHEMICAL CO LTD')
INSERT [Produccion].[Producto] ([id_producto], [codigo_producto], [fecha_elaboracion], [fecha_vencimiento], [msds], [marca]) VALUES (3, N'FOS001', CAST(N'2023-02-24T00:00:00' AS SmallDateTime), CAST(N'2023-02-24T00:00:00' AS SmallDateTime), NULL, N'HENAN YULIN CHEMICAL CO LTD')
INSERT [Produccion].[Producto] ([id_producto], [codigo_producto], [fecha_elaboracion], [fecha_vencimiento], [msds], [marca]) VALUES (4, N'CIT005', CAST(N'2023-02-24T00:00:00' AS SmallDateTime), CAST(N'2023-02-24T00:00:00' AS SmallDateTime), NULL, N'QINGDAO TWELL SANSINO')
INSERT [Produccion].[Producto] ([id_producto], [codigo_producto], [fecha_elaboracion], [fecha_vencimiento], [msds], [marca]) VALUES (5, N'CIT005', CAST(N'2022-10-01T00:00:00' AS SmallDateTime), CAST(N'2023-02-20T00:00:00' AS SmallDateTime), NULL, N'QINGDAO TWELL SANSINO')
INSERT [Produccion].[Producto] ([id_producto], [codigo_producto], [fecha_elaboracion], [fecha_vencimiento], [msds], [marca]) VALUES (6, N'FAB042', CAST(N'2023-01-01T00:00:00' AS SmallDateTime), CAST(N'2023-02-01T00:00:00' AS SmallDateTime), NULL, N'SHANGHAI TIANJIA BIOCHEMICAL CO LTD')
INSERT [Produccion].[Producto] ([id_producto], [codigo_producto], [fecha_elaboracion], [fecha_vencimiento], [msds], [marca]) VALUES (7, N'PRC001', CAST(N'2023-01-01T00:00:00' AS SmallDateTime), CAST(N'2023-02-01T00:00:00' AS SmallDateTime), NULL, N'CENTAURO ALPHA LTD')
INSERT [Produccion].[Producto] ([id_producto], [codigo_producto], [fecha_elaboracion], [fecha_vencimiento], [msds], [marca]) VALUES (8, N'PRC001', CAST(N'2023-01-01T00:00:00' AS SmallDateTime), CAST(N'2023-02-02T00:00:00' AS SmallDateTime), NULL, N'CENTAURO ALPHA LTD')
INSERT [Produccion].[Producto] ([id_producto], [codigo_producto], [fecha_elaboracion], [fecha_vencimiento], [msds], [marca]) VALUES (9, N'PRC001', CAST(N'2023-01-01T00:00:00' AS SmallDateTime), CAST(N'2023-02-17T00:00:00' AS SmallDateTime), NULL, N'CENTAURO ALPHA LTD')
INSERT [Produccion].[Producto] ([id_producto], [codigo_producto], [fecha_elaboracion], [fecha_vencimiento], [msds], [marca]) VALUES (10, N'QUES042', CAST(N'2023-01-01T00:00:00' AS SmallDateTime), CAST(N'2023-02-17T00:00:00' AS SmallDateTime), NULL, N'CENTAURO ALPHA LTD')
INSERT [Produccion].[Producto] ([id_producto], [codigo_producto], [fecha_elaboracion], [fecha_vencimiento], [msds], [marca]) VALUES (11, N'CIT005', CAST(N'2023-01-31T00:00:00' AS SmallDateTime), CAST(N'2023-01-31T00:00:00' AS SmallDateTime), NULL, N'SHANGHAI TIANJIA BIOCHEMICAL CO LTD')
INSERT [Produccion].[Producto] ([id_producto], [codigo_producto], [fecha_elaboracion], [fecha_vencimiento], [msds], [marca]) VALUES (12, N'FAB042', CAST(N'2023-01-31T00:00:00' AS SmallDateTime), CAST(N'2023-01-31T00:00:00' AS SmallDateTime), NULL, N'SHANGHAI TIANJIA BIOCHEMICAL CO LTD')
INSERT [Produccion].[Producto] ([id_producto], [codigo_producto], [fecha_elaboracion], [fecha_vencimiento], [msds], [marca]) VALUES (13, N'QUES042', CAST(N'2023-01-31T00:00:00' AS SmallDateTime), CAST(N'2023-01-31T00:00:00' AS SmallDateTime), NULL, N'CENTAURO ALPHA LTD')
INSERT [Produccion].[Producto] ([id_producto], [codigo_producto], [fecha_elaboracion], [fecha_vencimiento], [msds], [marca]) VALUES (14, N'QUES042', CAST(N'2023-01-31T00:00:00' AS SmallDateTime), CAST(N'2023-01-31T00:00:00' AS SmallDateTime), NULL, N'CENTAURO ALPHA LTD')
INSERT [Produccion].[Producto] ([id_producto], [codigo_producto], [fecha_elaboracion], [fecha_vencimiento], [msds], [marca]) VALUES (15, N'FAB042', CAST(N'2023-01-31T00:00:00' AS SmallDateTime), CAST(N'2023-01-31T00:00:00' AS SmallDateTime), NULL, N'SHANGHAI TIANJIA BIOCHEMICAL CO LTD')
INSERT [Produccion].[Producto] ([id_producto], [codigo_producto], [fecha_elaboracion], [fecha_vencimiento], [msds], [marca]) VALUES (16, N'QUES042', CAST(N'2023-01-31T00:00:00' AS SmallDateTime), CAST(N'2023-01-04T00:00:00' AS SmallDateTime), NULL, N'CENTAURO ALPHA LTD')
SET IDENTITY_INSERT [Produccion].[Producto] OFF
GO
