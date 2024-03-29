USE [BLV]
GO
/****** Object:  Table [Relacion].[Usuario_Perfil_Acceso]    Script Date: 6/7/2023 8:42:54 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Relacion].[Usuario_Perfil_Acceso](
	[id_usuario_perfil] [int] IDENTITY(1,1) NOT NULL,
	[id_usuario] [int] NULL,
	[id_perfil] [int] NULL,
	[id_acceso] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_usuario_perfil] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [Relacion].[Usuario_Perfil_Acceso] ON 

INSERT [Relacion].[Usuario_Perfil_Acceso] ([id_usuario_perfil], [id_usuario], [id_perfil], [id_acceso]) VALUES (1, 1, 1, 1)
INSERT [Relacion].[Usuario_Perfil_Acceso] ([id_usuario_perfil], [id_usuario], [id_perfil], [id_acceso]) VALUES (2, 1, 1, 2)
INSERT [Relacion].[Usuario_Perfil_Acceso] ([id_usuario_perfil], [id_usuario], [id_perfil], [id_acceso]) VALUES (3, 1, 2, 3)
INSERT [Relacion].[Usuario_Perfil_Acceso] ([id_usuario_perfil], [id_usuario], [id_perfil], [id_acceso]) VALUES (4, 1, 1, 4)
INSERT [Relacion].[Usuario_Perfil_Acceso] ([id_usuario_perfil], [id_usuario], [id_perfil], [id_acceso]) VALUES (5, 1, 1, 5)
INSERT [Relacion].[Usuario_Perfil_Acceso] ([id_usuario_perfil], [id_usuario], [id_perfil], [id_acceso]) VALUES (6, 1, 2, 6)
SET IDENTITY_INSERT [Relacion].[Usuario_Perfil_Acceso] OFF
GO
