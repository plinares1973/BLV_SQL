USE [BLV]
GO
/****** Object:  Table [Sistema].[Acceso]    Script Date: 6/7/2023 8:42:54 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Sistema].[Acceso](
	[id_acceso] [int] IDENTITY(1,1) NOT NULL,
	[modulo] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_acceso] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [Sistema].[Acceso] ON 

INSERT [Sistema].[Acceso] ([id_acceso], [modulo]) VALUES (1, N'COMPRAS')
INSERT [Sistema].[Acceso] ([id_acceso], [modulo]) VALUES (2, N'DEPOSITO')
INSERT [Sistema].[Acceso] ([id_acceso], [modulo]) VALUES (3, N'LOGISTICA')
INSERT [Sistema].[Acceso] ([id_acceso], [modulo]) VALUES (4, N'PRODUCCION')
INSERT [Sistema].[Acceso] ([id_acceso], [modulo]) VALUES (5, N'VENTAS')
INSERT [Sistema].[Acceso] ([id_acceso], [modulo]) VALUES (6, N'ADMINISTRACION')
SET IDENTITY_INSERT [Sistema].[Acceso] OFF
GO
