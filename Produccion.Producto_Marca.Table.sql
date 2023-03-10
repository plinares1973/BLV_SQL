USE [BLV]
GO
/****** Object:  Table [Produccion].[Producto_Marca]    Script Date: 14/3/2023 11:16:38 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Produccion].[Producto_Marca](
	[id_marca] [int] IDENTITY(1,1) NOT NULL,
	[marca] [varchar](50) NULL,
	[codigo_producto] [varchar](10) NULL,
	[id_pais] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_marca] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [Produccion].[Producto_Marca] ON 

INSERT [Produccion].[Producto_Marca] ([id_marca], [marca], [codigo_producto], [id_pais]) VALUES (1, N'QINGDAO TWELL SANSINO', N'CIT005', 407)
INSERT [Produccion].[Producto_Marca] ([id_marca], [marca], [codigo_producto], [id_pais]) VALUES (2, N'SHANGHAI TIANJIA BIOCHEMICAL CO LTD', N'CIT005', 407)
INSERT [Produccion].[Producto_Marca] ([id_marca], [marca], [codigo_producto], [id_pais]) VALUES (3, N'CENTAURO ALPHA LTD', N'CIT005', 340)
INSERT [Produccion].[Producto_Marca] ([id_marca], [marca], [codigo_producto], [id_pais]) VALUES (4, N'QINGDAO TWELL SANSINO', N'FAB042', 407)
INSERT [Produccion].[Producto_Marca] ([id_marca], [marca], [codigo_producto], [id_pais]) VALUES (5, N'SHANGHAI TIANJIA BIOCHEMICAL CO LTD', N'FAB042', 407)
INSERT [Produccion].[Producto_Marca] ([id_marca], [marca], [codigo_producto], [id_pais]) VALUES (6, N'FOODCHEM INTERNATIONAL CORPORATION', N'FOS001', 407)
INSERT [Produccion].[Producto_Marca] ([id_marca], [marca], [codigo_producto], [id_pais]) VALUES (7, N'LK NANJING CO LTD', N'FOS001', 407)
INSERT [Produccion].[Producto_Marca] ([id_marca], [marca], [codigo_producto], [id_pais]) VALUES (8, N'HENAN YULIN CHEMICAL CO LTD', N'FOS001', 407)
INSERT [Produccion].[Producto_Marca] ([id_marca], [marca], [codigo_producto], [id_pais]) VALUES (9, N'HENAN YULIN CHEMICAL CO LTD', N'PRC001', 407)
INSERT [Produccion].[Producto_Marca] ([id_marca], [marca], [codigo_producto], [id_pais]) VALUES (10, N'CENTAURO ALPHA LTD', N'PRC001', 340)
INSERT [Produccion].[Producto_Marca] ([id_marca], [marca], [codigo_producto], [id_pais]) VALUES (11, N'CENTAURO ALPHA LTD', N'QUES042', 340)
INSERT [Produccion].[Producto_Marca] ([id_marca], [marca], [codigo_producto], [id_pais]) VALUES (12, N'MASTELLONE HMNOS LTD', N'QUES042', 340)
SET IDENTITY_INSERT [Produccion].[Producto_Marca] OFF
GO
