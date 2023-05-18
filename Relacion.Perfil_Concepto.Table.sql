USE [BLV]
GO
/****** Object:  Table [Relacion].[Perfil_Concepto]    Script Date: 17/5/2023 9:15:21 p. m. ******/
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
INSERT [Relacion].[Perfil_Concepto] ([id_perfil_concepto], [id_perfil_costo], [id_concepto_header], [enlace_concepto]) VALUES (5, 1, 21, 4)
INSERT [Relacion].[Perfil_Concepto] ([id_perfil_concepto], [id_perfil_costo], [id_concepto_header], [enlace_concepto]) VALUES (8, 5, 5, 22)
INSERT [Relacion].[Perfil_Concepto] ([id_perfil_concepto], [id_perfil_costo], [id_concepto_header], [enlace_concepto]) VALUES (9, 5, 22, 22)
INSERT [Relacion].[Perfil_Concepto] ([id_perfil_concepto], [id_perfil_costo], [id_concepto_header], [enlace_concepto]) VALUES (10, 4, 6, 6)
INSERT [Relacion].[Perfil_Concepto] ([id_perfil_concepto], [id_perfil_costo], [id_concepto_header], [enlace_concepto]) VALUES (11, 4, 7, 6)
INSERT [Relacion].[Perfil_Concepto] ([id_perfil_concepto], [id_perfil_costo], [id_concepto_header], [enlace_concepto]) VALUES (12, 4, 8, 6)
INSERT [Relacion].[Perfil_Concepto] ([id_perfil_concepto], [id_perfil_costo], [id_concepto_header], [enlace_concepto]) VALUES (13, 4, 9, 6)
INSERT [Relacion].[Perfil_Concepto] ([id_perfil_concepto], [id_perfil_costo], [id_concepto_header], [enlace_concepto]) VALUES (14, 4, 10, 6)
INSERT [Relacion].[Perfil_Concepto] ([id_perfil_concepto], [id_perfil_costo], [id_concepto_header], [enlace_concepto]) VALUES (15, 6, 1, 1)
INSERT [Relacion].[Perfil_Concepto] ([id_perfil_concepto], [id_perfil_costo], [id_concepto_header], [enlace_concepto]) VALUES (20, 8, 1, 2)
INSERT [Relacion].[Perfil_Concepto] ([id_perfil_concepto], [id_perfil_costo], [id_concepto_header], [enlace_concepto]) VALUES (21, 8, 16, 2)
INSERT [Relacion].[Perfil_Concepto] ([id_perfil_concepto], [id_perfil_costo], [id_concepto_header], [enlace_concepto]) VALUES (22, 9, 3, 3)
INSERT [Relacion].[Perfil_Concepto] ([id_perfil_concepto], [id_perfil_costo], [id_concepto_header], [enlace_concepto]) VALUES (24, 9, 21, 3)
INSERT [Relacion].[Perfil_Concepto] ([id_perfil_concepto], [id_perfil_costo], [id_concepto_header], [enlace_concepto]) VALUES (25, 11, 3, 3)
INSERT [Relacion].[Perfil_Concepto] ([id_perfil_concepto], [id_perfil_costo], [id_concepto_header], [enlace_concepto]) VALUES (26, 11, 18, 3)
INSERT [Relacion].[Perfil_Concepto] ([id_perfil_concepto], [id_perfil_costo], [id_concepto_header], [enlace_concepto]) VALUES (27, 11, 21, 3)
SET IDENTITY_INSERT [Relacion].[Perfil_Concepto] OFF
GO
