USE [BLV]
GO
/****** Object:  Table [Sistema].[Perfil]    Script Date: 22/2/2023 10:12:20 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Sistema].[Perfil](
	[id_perfil] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_perfil] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [Sistema].[Perfil] ON 

INSERT [Sistema].[Perfil] ([id_perfil], [descripcion]) VALUES (1, N'TOTAL')
INSERT [Sistema].[Perfil] ([id_perfil], [descripcion]) VALUES (2, N'LECTURA')
INSERT [Sistema].[Perfil] ([id_perfil], [descripcion]) VALUES (3, N'ESCRITURA')
SET IDENTITY_INSERT [Sistema].[Perfil] OFF
GO
