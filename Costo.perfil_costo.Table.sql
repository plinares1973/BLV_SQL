USE [BLV]
GO
/****** Object:  Table [Costo].[Perfil_Costo]    Script Date: 6/7/2023 8:42:53 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Costo].[Perfil_Costo](
	[id_perfil_costo] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](20) NULL,
	[descripcion] [varchar](200) NULL,
	[fecha_creacion] [smalldatetime] NULL,
	[fecha_baja] [smalldatetime] NULL,
	[vigente] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_perfil_costo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [Costo].[Perfil_Costo] ON 

INSERT [Costo].[Perfil_Costo] ([id_perfil_costo], [nombre], [descripcion], [fecha_creacion], [fecha_baja], [vigente]) VALUES (1, N'CIF ARGENTINO 23', N'CIF + NACIONALIZACION', CAST(N'2023-07-05T19:35:00' AS SmallDateTime), NULL, 1)
SET IDENTITY_INSERT [Costo].[Perfil_Costo] OFF
GO
