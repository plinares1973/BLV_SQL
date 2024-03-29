USE [BLV]
GO
/****** Object:  Table [Relacion].[Lote_Ingrediente]    Script Date: 6/7/2023 8:42:54 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Relacion].[Lote_Ingrediente](
	[id_batch_ingrediente] [int] IDENTITY(1,1) NOT NULL,
	[id_batch] [int] NULL,
	[id_ingrediente] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_batch_ingrediente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [Relacion].[Lote_Ingrediente] ON 

INSERT [Relacion].[Lote_Ingrediente] ([id_batch_ingrediente], [id_batch], [id_ingrediente]) VALUES (1, 1, 1)
INSERT [Relacion].[Lote_Ingrediente] ([id_batch_ingrediente], [id_batch], [id_ingrediente]) VALUES (2, 2, 2)
INSERT [Relacion].[Lote_Ingrediente] ([id_batch_ingrediente], [id_batch], [id_ingrediente]) VALUES (3, 3, 3)
INSERT [Relacion].[Lote_Ingrediente] ([id_batch_ingrediente], [id_batch], [id_ingrediente]) VALUES (4, 9, 6)
INSERT [Relacion].[Lote_Ingrediente] ([id_batch_ingrediente], [id_batch], [id_ingrediente]) VALUES (5, 8, 4)
SET IDENTITY_INSERT [Relacion].[Lote_Ingrediente] OFF
GO
