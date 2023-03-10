USE [BLV]
GO
/****** Object:  Table [Relacion].[Importador_ciudad]    Script Date: 20/1/2023 8:48:49 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Relacion].[Importador_ciudad](
	[id_importador_ciudad] [int] IDENTITY(1,1) NOT NULL,
	[id_importador] [int] NULL,
	[id_ciudad] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_importador_ciudad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [Relacion].[Importador_ciudad] ON 

INSERT [Relacion].[Importador_ciudad] ([id_importador_ciudad], [id_importador], [id_ciudad]) VALUES (1, 1, 53)
INSERT [Relacion].[Importador_ciudad] ([id_importador_ciudad], [id_importador], [id_ciudad]) VALUES (2, 2, 444)
SET IDENTITY_INSERT [Relacion].[Importador_ciudad] OFF
GO
