USE [BLV]
GO
/****** Object:  Table [Relacion].[Hoja_Fab_Estado]    Script Date: 14/3/2023 11:16:38 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Relacion].[Hoja_Fab_Estado](
	[id_hoja_fab_estado] [int] IDENTITY(1,1) NOT NULL,
	[id_hoja_fabrica] [int] NULL,
	[id_estado] [int] NULL,
	[fecha] [smalldatetime] NULL,
	[vigente] [bit] NULL
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [Relacion].[Hoja_Fab_Estado] ON 

INSERT [Relacion].[Hoja_Fab_Estado] ([id_hoja_fab_estado], [id_hoja_fabrica], [id_estado], [fecha], [vigente]) VALUES (1, 1, 0, CAST(N'2023-03-14T10:10:00' AS SmallDateTime), 1)
INSERT [Relacion].[Hoja_Fab_Estado] ([id_hoja_fab_estado], [id_hoja_fabrica], [id_estado], [fecha], [vigente]) VALUES (2, 2, 0, CAST(N'2023-03-14T10:10:00' AS SmallDateTime), 1)
INSERT [Relacion].[Hoja_Fab_Estado] ([id_hoja_fab_estado], [id_hoja_fabrica], [id_estado], [fecha], [vigente]) VALUES (3, 3, 0, CAST(N'2023-03-14T10:13:00' AS SmallDateTime), 1)
SET IDENTITY_INSERT [Relacion].[Hoja_Fab_Estado] OFF
GO
