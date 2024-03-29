USE [BLV]
GO
/****** Object:  Table [Costo].[Secuencia_Perfil]    Script Date: 6/7/2023 8:42:53 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Costo].[Secuencia_Perfil](
	[id_secuencia_perfil] [int] IDENTITY(1,1) NOT NULL,
	[id_perfil_costo] [int] NULL,
	[orden] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_secuencia_perfil] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [Costo].[Secuencia_Perfil] ON 

INSERT [Costo].[Secuencia_Perfil] ([id_secuencia_perfil], [id_perfil_costo], [orden]) VALUES (1, 1, 1)
SET IDENTITY_INSERT [Costo].[Secuencia_Perfil] OFF
GO
