USE [BLV]
GO
/****** Object:  Table [Produccion].[Receta]    Script Date: 6/7/2023 8:42:53 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Produccion].[Receta](
	[id_receta] [int] IDENTITY(1,1) NOT NULL,
	[nombre_receta] [varchar](50) NULL,
	[codigo_producto] [varchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_receta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [Produccion].[Receta] ON 

INSERT [Produccion].[Receta] ([id_receta], [nombre_receta], [codigo_producto]) VALUES (1, N'INTEGRAL CARNICO ESTANDAR', N'FAB042')
SET IDENTITY_INSERT [Produccion].[Receta] OFF
GO
