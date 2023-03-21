USE [BLV]
GO
/****** Object:  Table [Relacion].[Compra_Estado]    Script Date: 21/3/2023 9:13:34 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Relacion].[Compra_Estado](
	[id_compra_estado] [int] IDENTITY(1,1) NOT NULL,
	[id_compra] [int] NULL,
	[id_estado] [int] NULL,
	[fecha] [smalldatetime] NULL,
	[vigente] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_compra_estado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [Relacion].[Compra_Estado] ON 

INSERT [Relacion].[Compra_Estado] ([id_compra_estado], [id_compra], [id_estado], [fecha], [vigente]) VALUES (1, 1, 0, CAST(N'2023-03-20T17:18:00' AS SmallDateTime), 0)
INSERT [Relacion].[Compra_Estado] ([id_compra_estado], [id_compra], [id_estado], [fecha], [vigente]) VALUES (2, 1, 4, CAST(N'2023-03-20T00:00:00' AS SmallDateTime), 0)
INSERT [Relacion].[Compra_Estado] ([id_compra_estado], [id_compra], [id_estado], [fecha], [vigente]) VALUES (3, 1, 4, CAST(N'2023-03-20T00:00:00' AS SmallDateTime), 0)
INSERT [Relacion].[Compra_Estado] ([id_compra_estado], [id_compra], [id_estado], [fecha], [vigente]) VALUES (4, 1, 4, CAST(N'2023-03-20T00:00:00' AS SmallDateTime), 0)
INSERT [Relacion].[Compra_Estado] ([id_compra_estado], [id_compra], [id_estado], [fecha], [vigente]) VALUES (5, 1, 4, CAST(N'2023-03-20T00:00:00' AS SmallDateTime), 0)
INSERT [Relacion].[Compra_Estado] ([id_compra_estado], [id_compra], [id_estado], [fecha], [vigente]) VALUES (6, 1, 4, CAST(N'2023-03-20T00:00:00' AS SmallDateTime), 0)
INSERT [Relacion].[Compra_Estado] ([id_compra_estado], [id_compra], [id_estado], [fecha], [vigente]) VALUES (7, 1, 4, CAST(N'2023-03-20T00:00:00' AS SmallDateTime), 0)
INSERT [Relacion].[Compra_Estado] ([id_compra_estado], [id_compra], [id_estado], [fecha], [vigente]) VALUES (8, 1, 4, CAST(N'2023-03-20T00:00:00' AS SmallDateTime), 0)
INSERT [Relacion].[Compra_Estado] ([id_compra_estado], [id_compra], [id_estado], [fecha], [vigente]) VALUES (9, 1, 4, CAST(N'2023-03-20T00:00:00' AS SmallDateTime), 0)
INSERT [Relacion].[Compra_Estado] ([id_compra_estado], [id_compra], [id_estado], [fecha], [vigente]) VALUES (10, 1, 4, CAST(N'2023-03-20T00:00:00' AS SmallDateTime), 0)
INSERT [Relacion].[Compra_Estado] ([id_compra_estado], [id_compra], [id_estado], [fecha], [vigente]) VALUES (11, 1, 4, CAST(N'2023-03-21T00:00:00' AS SmallDateTime), 0)
INSERT [Relacion].[Compra_Estado] ([id_compra_estado], [id_compra], [id_estado], [fecha], [vigente]) VALUES (12, 1, 4, CAST(N'2023-03-21T00:00:00' AS SmallDateTime), 0)
INSERT [Relacion].[Compra_Estado] ([id_compra_estado], [id_compra], [id_estado], [fecha], [vigente]) VALUES (13, 1, 4, CAST(N'2023-03-21T00:00:00' AS SmallDateTime), 0)
INSERT [Relacion].[Compra_Estado] ([id_compra_estado], [id_compra], [id_estado], [fecha], [vigente]) VALUES (14, 1, 4, CAST(N'2023-03-21T00:00:00' AS SmallDateTime), 0)
INSERT [Relacion].[Compra_Estado] ([id_compra_estado], [id_compra], [id_estado], [fecha], [vigente]) VALUES (15, 1, 4, CAST(N'2023-03-21T00:00:00' AS SmallDateTime), 0)
INSERT [Relacion].[Compra_Estado] ([id_compra_estado], [id_compra], [id_estado], [fecha], [vigente]) VALUES (16, 1, 4, CAST(N'2023-03-21T00:00:00' AS SmallDateTime), 0)
INSERT [Relacion].[Compra_Estado] ([id_compra_estado], [id_compra], [id_estado], [fecha], [vigente]) VALUES (17, 1, 4, CAST(N'2023-03-21T00:00:00' AS SmallDateTime), 0)
INSERT [Relacion].[Compra_Estado] ([id_compra_estado], [id_compra], [id_estado], [fecha], [vigente]) VALUES (18, 1, 4, CAST(N'2023-03-21T00:00:00' AS SmallDateTime), 0)
INSERT [Relacion].[Compra_Estado] ([id_compra_estado], [id_compra], [id_estado], [fecha], [vigente]) VALUES (19, 1, 4, CAST(N'2023-03-21T00:00:00' AS SmallDateTime), 0)
INSERT [Relacion].[Compra_Estado] ([id_compra_estado], [id_compra], [id_estado], [fecha], [vigente]) VALUES (20, 1, 4, CAST(N'2023-03-21T00:00:00' AS SmallDateTime), 0)
INSERT [Relacion].[Compra_Estado] ([id_compra_estado], [id_compra], [id_estado], [fecha], [vigente]) VALUES (21, 1, 4, CAST(N'2023-03-21T00:00:00' AS SmallDateTime), 0)
INSERT [Relacion].[Compra_Estado] ([id_compra_estado], [id_compra], [id_estado], [fecha], [vigente]) VALUES (22, 1, 4, CAST(N'2023-03-21T00:00:00' AS SmallDateTime), 0)
INSERT [Relacion].[Compra_Estado] ([id_compra_estado], [id_compra], [id_estado], [fecha], [vigente]) VALUES (23, 1, 4, CAST(N'2023-03-21T00:00:00' AS SmallDateTime), 0)
INSERT [Relacion].[Compra_Estado] ([id_compra_estado], [id_compra], [id_estado], [fecha], [vigente]) VALUES (24, 1, 4, CAST(N'2023-03-21T00:00:00' AS SmallDateTime), 0)
INSERT [Relacion].[Compra_Estado] ([id_compra_estado], [id_compra], [id_estado], [fecha], [vigente]) VALUES (25, 1, 4, CAST(N'2023-03-21T00:00:00' AS SmallDateTime), 0)
INSERT [Relacion].[Compra_Estado] ([id_compra_estado], [id_compra], [id_estado], [fecha], [vigente]) VALUES (26, 1, 4, CAST(N'2023-03-21T00:00:00' AS SmallDateTime), 1)
SET IDENTITY_INSERT [Relacion].[Compra_Estado] OFF
GO
