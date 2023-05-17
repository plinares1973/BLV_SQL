USE [BLV]
GO
/****** Object:  Table [Costo].[perfil_costo]    Script Date: 17/5/2023 1:14:13 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Costo].[perfil_costo](
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
SET IDENTITY_INSERT [Costo].[perfil_costo] ON 

INSERT [Costo].[perfil_costo] ([id_perfil_costo], [nombre], [descripcion], [fecha_creacion], [fecha_baja], [vigente]) VALUES (1, N'CIF', N'COMPOSICION Y DETALLE DE CIF', CAST(N'2023-05-16T12:46:00' AS SmallDateTime), NULL, 1)
INSERT [Costo].[perfil_costo] ([id_perfil_costo], [nombre], [descripcion], [fecha_creacion], [fecha_baja], [vigente]) VALUES (2, N'CIF 2', N'CIF DE SARASA PRUEBA', CAST(N'2023-05-16T22:41:00' AS SmallDateTime), NULL, 1)
INSERT [Costo].[perfil_costo] ([id_perfil_costo], [nombre], [descripcion], [fecha_creacion], [fecha_baja], [vigente]) VALUES (3, N'IVA', N'BASE IMPONIBLE IVA USD', CAST(N'2023-05-16T23:43:00' AS SmallDateTime), NULL, 1)
INSERT [Costo].[perfil_costo] ([id_perfil_costo], [nombre], [descripcion], [fecha_creacion], [fecha_baja], [vigente]) VALUES (4, N'NACIONALIZACION', N'TOTAL GASTOS NACIONALIZACION', CAST(N'2023-05-16T23:43:00' AS SmallDateTime), NULL, 1)
INSERT [Costo].[perfil_costo] ([id_perfil_costo], [nombre], [descripcion], [fecha_creacion], [fecha_baja], [vigente]) VALUES (5, N'DIMP', N'DERECHOS DE IMPORTACION', CAST(N'2023-05-16T23:46:00' AS SmallDateTime), NULL, 1)
SET IDENTITY_INSERT [Costo].[perfil_costo] OFF
GO
