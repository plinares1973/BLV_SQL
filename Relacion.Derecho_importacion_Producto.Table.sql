USE [BLV]
GO
/****** Object:  Table [Relacion].[Derecho_importacion_Producto]    Script Date: 6/7/2023 8:42:53 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Relacion].[Derecho_importacion_Producto](
	[id_derecho_importacion_producto] [int] IDENTITY(1,1) NOT NULL,
	[id_concepto] [int] NULL,
	[codigo_producto] [varchar](10) NULL,
	[codigo_arancelario] [nchar](7) NULL,
	[tasa] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_derecho_importacion_producto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [Relacion].[Derecho_importacion_Producto] ON 

INSERT [Relacion].[Derecho_importacion_Producto] ([id_derecho_importacion_producto], [id_concepto], [codigo_producto], [codigo_arancelario], [tasa]) VALUES (1, 22, N'CIT005', N'2918.15', 8)
INSERT [Relacion].[Derecho_importacion_Producto] ([id_derecho_importacion_producto], [id_concepto], [codigo_producto], [codigo_arancelario], [tasa]) VALUES (2, 22, N'FOS001', N'2835.31', 10)
INSERT [Relacion].[Derecho_importacion_Producto] ([id_derecho_importacion_producto], [id_concepto], [codigo_producto], [codigo_arancelario], [tasa]) VALUES (3, 22, N'PRO001', N'2915.39', 12)
INSERT [Relacion].[Derecho_importacion_Producto] ([id_derecho_importacion_producto], [id_concepto], [codigo_producto], [codigo_arancelario], [tasa]) VALUES (4, 22, N'OLI001', N'1509.10', 11)
INSERT [Relacion].[Derecho_importacion_Producto] ([id_derecho_importacion_producto], [id_concepto], [codigo_producto], [codigo_arancelario], [tasa]) VALUES (5, 22, N'3085', N'2932.19', 2)
SET IDENTITY_INSERT [Relacion].[Derecho_importacion_Producto] OFF
GO
