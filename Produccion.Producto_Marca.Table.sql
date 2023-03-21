USE [BLV]
GO
/****** Object:  Table [Produccion].[Producto_Marca]    Script Date: 21/3/2023 9:13:34 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Produccion].[Producto_Marca](
	[id_marca] [int] IDENTITY(1,1) NOT NULL,
	[marca] [varchar](50) NULL,
	[codigo_producto] [varchar](10) NULL,
	[id_pais] [int] NULL,
	[MSDS] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_marca] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [Produccion].[Producto_Marca] ON 

INSERT [Produccion].[Producto_Marca] ([id_marca], [marca], [codigo_producto], [id_pais], [MSDS]) VALUES (1, N'QINGDAO TWELL SANSINO', N'CIT005', 407, NULL)
INSERT [Produccion].[Producto_Marca] ([id_marca], [marca], [codigo_producto], [id_pais], [MSDS]) VALUES (2, N'SHANGHAI TIANJIA BIOCHEMICAL CO LTD', N'CIT005', 407, NULL)
INSERT [Produccion].[Producto_Marca] ([id_marca], [marca], [codigo_producto], [id_pais], [MSDS]) VALUES (3, N'CENTAURO ALPHA LTD', N'CIT005', 340, NULL)
INSERT [Produccion].[Producto_Marca] ([id_marca], [marca], [codigo_producto], [id_pais], [MSDS]) VALUES (4, N'QINGDAO TWELL SANSINO', N'FAB042', 407, NULL)
INSERT [Produccion].[Producto_Marca] ([id_marca], [marca], [codigo_producto], [id_pais], [MSDS]) VALUES (5, N'SHANGHAI TIANJIA BIOCHEMICAL CO LTD', N'FAB042', 407, NULL)
INSERT [Produccion].[Producto_Marca] ([id_marca], [marca], [codigo_producto], [id_pais], [MSDS]) VALUES (6, N'FOODCHEM INTERNATIONAL CORPORATION', N'FOS001', 407, NULL)
INSERT [Produccion].[Producto_Marca] ([id_marca], [marca], [codigo_producto], [id_pais], [MSDS]) VALUES (7, N'LK NANJING CO LTD', N'FOS001', 407, NULL)
INSERT [Produccion].[Producto_Marca] ([id_marca], [marca], [codigo_producto], [id_pais], [MSDS]) VALUES (8, N'HENAN YULIN CHEMICAL CO LTD', N'FOS001', 407, NULL)
INSERT [Produccion].[Producto_Marca] ([id_marca], [marca], [codigo_producto], [id_pais], [MSDS]) VALUES (9, N'HENAN YULIN CHEMICAL CO LTD', N'PRC001', 407, NULL)
INSERT [Produccion].[Producto_Marca] ([id_marca], [marca], [codigo_producto], [id_pais], [MSDS]) VALUES (10, N'CENTAURO ALPHA LTD', N'PRC001', 340, NULL)
INSERT [Produccion].[Producto_Marca] ([id_marca], [marca], [codigo_producto], [id_pais], [MSDS]) VALUES (11, N'CENTAURO ALPHA LTD', N'QUES042', 340, NULL)
INSERT [Produccion].[Producto_Marca] ([id_marca], [marca], [codigo_producto], [id_pais], [MSDS]) VALUES (12, N'MASTELLONE HMNOS LTD', N'QUES042', 340, NULL)
INSERT [Produccion].[Producto_Marca] ([id_marca], [marca], [codigo_producto], [id_pais], [MSDS]) VALUES (13, N'MASTELLONE HMNOS LTD', N'CIT005', 340, NULL)
INSERT [Produccion].[Producto_Marca] ([id_marca], [marca], [codigo_producto], [id_pais], [MSDS]) VALUES (17, N'DANKAN SRL', N'CIT005', 340, N'Plan de trabajo 2022.pdf')
INSERT [Produccion].[Producto_Marca] ([id_marca], [marca], [codigo_producto], [id_pais], [MSDS]) VALUES (18, N'DYENA SRL', N'FAB042', 407, N'Plan de trabajo 2022.pdf')
INSERT [Produccion].[Producto_Marca] ([id_marca], [marca], [codigo_producto], [id_pais], [MSDS]) VALUES (25, N'ADAMA SA', N'FOS001', 340, N'Plan de trabajo 2022.pdf')
INSERT [Produccion].[Producto_Marca] ([id_marca], [marca], [codigo_producto], [id_pais], [MSDS]) VALUES (26, N'ADAMA SA', N'PRO001', 340, N'Plan de trabajo 2022.pdf')
INSERT [Produccion].[Producto_Marca] ([id_marca], [marca], [codigo_producto], [id_pais], [MSDS]) VALUES (27, N'CARAES SA', N'BOL025', 340, N'NO')
SET IDENTITY_INSERT [Produccion].[Producto_Marca] OFF
GO
