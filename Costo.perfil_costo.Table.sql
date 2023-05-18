USE [BLV]
GO
/****** Object:  Table [Costo].[Perfil_Costo]    Script Date: 17/5/2023 9:15:21 p. m. ******/
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

INSERT [Costo].[Perfil_Costo] ([id_perfil_costo], [nombre], [descripcion], [fecha_creacion], [fecha_baja], [vigente]) VALUES (1, N'CIF', N'COMPOSICION Y DETALLE DE CIF', CAST(N'2023-05-16T12:46:00' AS SmallDateTime), NULL, 1)
INSERT [Costo].[Perfil_Costo] ([id_perfil_costo], [nombre], [descripcion], [fecha_creacion], [fecha_baja], [vigente]) VALUES (3, N'IVA', N'BASE IMPONIBLE IVA USD', CAST(N'2023-05-16T23:43:00' AS SmallDateTime), NULL, 1)
INSERT [Costo].[Perfil_Costo] ([id_perfil_costo], [nombre], [descripcion], [fecha_creacion], [fecha_baja], [vigente]) VALUES (4, N'NACIONALIZACION', N'TOTAL GASTOS NACIONALIZACION', CAST(N'2023-05-16T23:43:00' AS SmallDateTime), NULL, 1)
INSERT [Costo].[Perfil_Costo] ([id_perfil_costo], [nombre], [descripcion], [fecha_creacion], [fecha_baja], [vigente]) VALUES (5, N'DIMP', N'DERECHOS DE IMPORTACION', CAST(N'2023-05-16T23:46:00' AS SmallDateTime), NULL, 1)
INSERT [Costo].[Perfil_Costo] ([id_perfil_costo], [nombre], [descripcion], [fecha_creacion], [fecha_baja], [vigente]) VALUES (6, N'EXW', N'EX WORK solo cubre el costo de producción y entrega de la mercancía en el lugar de origen acordado', CAST(N'2023-05-17T09:24:00' AS SmallDateTime), NULL, 1)
INSERT [Costo].[Perfil_Costo] ([id_perfil_costo], [nombre], [descripcion], [fecha_creacion], [fecha_baja], [vigente]) VALUES (8, N'FOB', N'costo incluye la entrega en el puerto de origen', CAST(N'2023-05-17T09:34:00' AS SmallDateTime), NULL, 1)
INSERT [Costo].[Perfil_Costo] ([id_perfil_costo], [nombre], [descripcion], [fecha_creacion], [fecha_baja], [vigente]) VALUES (9, N'CFR', N'costo incluye el transporte marítimo y seguro hasta el puerto de destino', CAST(N'2023-05-17T09:36:00' AS SmallDateTime), NULL, 1)
INSERT [Costo].[Perfil_Costo] ([id_perfil_costo], [nombre], [descripcion], [fecha_creacion], [fecha_baja], [vigente]) VALUES (11, N'CFR 2', N'costo incluye el transporte marítimo y seguro hasta el puerto de destino con doble ajuste', CAST(N'2023-05-17T20:57:00' AS SmallDateTime), NULL, 1)
SET IDENTITY_INSERT [Costo].[Perfil_Costo] OFF
GO
