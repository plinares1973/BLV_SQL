USE [BLV]
GO
/****** Object:  Table [Relacion].[Ingrediente_Stock]    Script Date: 6/7/2023 8:42:53 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Relacion].[Ingrediente_Stock](
	[id_ingrediente_stock] [int] IDENTITY(1,1) NOT NULL,
	[id_ingrediente] [int] NULL,
	[id_stock] [int] NULL,
	[cantidad] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_ingrediente_stock] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [Relacion].[Ingrediente_Stock] ON 

INSERT [Relacion].[Ingrediente_Stock] ([id_ingrediente_stock], [id_ingrediente], [id_stock], [cantidad]) VALUES (1, 1, 1, 25)
INSERT [Relacion].[Ingrediente_Stock] ([id_ingrediente_stock], [id_ingrediente], [id_stock], [cantidad]) VALUES (2, 2, 1, 40)
INSERT [Relacion].[Ingrediente_Stock] ([id_ingrediente_stock], [id_ingrediente], [id_stock], [cantidad]) VALUES (3, 2, 1, 40)
SET IDENTITY_INSERT [Relacion].[Ingrediente_Stock] OFF
GO
