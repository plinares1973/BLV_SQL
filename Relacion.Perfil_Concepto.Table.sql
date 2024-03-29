USE [BLV]
GO
/****** Object:  Table [Relacion].[Perfil_Concepto]    Script Date: 6/7/2023 8:42:54 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Relacion].[Perfil_Concepto](
	[id_perfil_concepto] [int] IDENTITY(1,1) NOT NULL,
	[id_perfil_costo] [int] NULL,
	[id_concepto_header] [int] NULL,
	[enlace_concepto] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_perfil_concepto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [Relacion].[Perfil_Concepto] ON 

INSERT [Relacion].[Perfil_Concepto] ([id_perfil_concepto], [id_perfil_costo], [id_concepto_header], [enlace_concepto]) VALUES (1, 1, 2, 4)
INSERT [Relacion].[Perfil_Concepto] ([id_perfil_concepto], [id_perfil_costo], [id_concepto_header], [enlace_concepto]) VALUES (2, 1, 16, 4)
INSERT [Relacion].[Perfil_Concepto] ([id_perfil_concepto], [id_perfil_costo], [id_concepto_header], [enlace_concepto]) VALUES (3, 1, 20, 4)
INSERT [Relacion].[Perfil_Concepto] ([id_perfil_concepto], [id_perfil_costo], [id_concepto_header], [enlace_concepto]) VALUES (4, 1, 21, 4)
INSERT [Relacion].[Perfil_Concepto] ([id_perfil_concepto], [id_perfil_costo], [id_concepto_header], [enlace_concepto]) VALUES (5, 1, 22, 4)
INSERT [Relacion].[Perfil_Concepto] ([id_perfil_concepto], [id_perfil_costo], [id_concepto_header], [enlace_concepto]) VALUES (6, 1, 5, 4)
INSERT [Relacion].[Perfil_Concepto] ([id_perfil_concepto], [id_perfil_costo], [id_concepto_header], [enlace_concepto]) VALUES (7, 1, 6, 4)
INSERT [Relacion].[Perfil_Concepto] ([id_perfil_concepto], [id_perfil_costo], [id_concepto_header], [enlace_concepto]) VALUES (8, 1, 7, 4)
INSERT [Relacion].[Perfil_Concepto] ([id_perfil_concepto], [id_perfil_costo], [id_concepto_header], [enlace_concepto]) VALUES (9, 1, 10, 4)
SET IDENTITY_INSERT [Relacion].[Perfil_Concepto] OFF
GO
