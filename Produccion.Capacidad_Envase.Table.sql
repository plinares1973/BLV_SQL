USE [BLV]
GO
/****** Object:  Table [Produccion].[Capacidad_Envase]    Script Date: 6/7/2023 8:42:53 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Produccion].[Capacidad_Envase](
	[id_capacidad_envase] [int] IDENTITY(1,1) NOT NULL,
	[id_empaque] [int] NOT NULL,
	[capacidad] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_capacidad_envase] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [Produccion].[Capacidad_Envase] ON 

INSERT [Produccion].[Capacidad_Envase] ([id_capacidad_envase], [id_empaque], [capacidad]) VALUES (1, 1, 25)
INSERT [Produccion].[Capacidad_Envase] ([id_capacidad_envase], [id_empaque], [capacidad]) VALUES (2, 2, 50)
INSERT [Produccion].[Capacidad_Envase] ([id_capacidad_envase], [id_empaque], [capacidad]) VALUES (3, 3, 50)
INSERT [Produccion].[Capacidad_Envase] ([id_capacidad_envase], [id_empaque], [capacidad]) VALUES (4, 4, 50)
INSERT [Produccion].[Capacidad_Envase] ([id_capacidad_envase], [id_empaque], [capacidad]) VALUES (5, 5, 50)
INSERT [Produccion].[Capacidad_Envase] ([id_capacidad_envase], [id_empaque], [capacidad]) VALUES (6, 6, 25)
INSERT [Produccion].[Capacidad_Envase] ([id_capacidad_envase], [id_empaque], [capacidad]) VALUES (7, 1, 50)
INSERT [Produccion].[Capacidad_Envase] ([id_capacidad_envase], [id_empaque], [capacidad]) VALUES (8, 7, 25)
SET IDENTITY_INSERT [Produccion].[Capacidad_Envase] OFF
GO
