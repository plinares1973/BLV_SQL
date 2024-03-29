USE [BLV]
GO
/****** Object:  Table [Relacion].[Proveedor_Ciudad]    Script Date: 6/7/2023 8:42:54 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Relacion].[Proveedor_Ciudad](
	[id_proveedor_ciudad] [int] IDENTITY(1,1) NOT NULL,
	[id_proveedor] [int] NULL,
	[id_ciudad] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_proveedor_ciudad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [Relacion].[Proveedor_Ciudad] ON 

INSERT [Relacion].[Proveedor_Ciudad] ([id_proveedor_ciudad], [id_proveedor], [id_ciudad]) VALUES (1, 1, 53)
INSERT [Relacion].[Proveedor_Ciudad] ([id_proveedor_ciudad], [id_proveedor], [id_ciudad]) VALUES (3, 2, 2532)
INSERT [Relacion].[Proveedor_Ciudad] ([id_proveedor_ciudad], [id_proveedor], [id_ciudad]) VALUES (4, 3, 2515)
SET IDENTITY_INSERT [Relacion].[Proveedor_Ciudad] OFF
GO
