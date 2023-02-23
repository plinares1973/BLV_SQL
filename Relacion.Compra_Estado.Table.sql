USE [BLV]
GO
/****** Object:  Table [Relacion].[Compra_Estado]    Script Date: 22/2/2023 10:12:20 p. m. ******/
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

INSERT [Relacion].[Compra_Estado] ([id_compra_estado], [id_compra], [id_estado], [fecha], [vigente]) VALUES (1, 1, 0, CAST(N'2023-02-02T20:13:00' AS SmallDateTime), 0)
INSERT [Relacion].[Compra_Estado] ([id_compra_estado], [id_compra], [id_estado], [fecha], [vigente]) VALUES (2, 1, 2, CAST(N'2023-02-09T00:00:00' AS SmallDateTime), 0)
INSERT [Relacion].[Compra_Estado] ([id_compra_estado], [id_compra], [id_estado], [fecha], [vigente]) VALUES (3, 2, 0, CAST(N'2023-02-02T20:28:00' AS SmallDateTime), 0)
INSERT [Relacion].[Compra_Estado] ([id_compra_estado], [id_compra], [id_estado], [fecha], [vigente]) VALUES (4, 1, 4, CAST(N'2023-02-23T00:00:00' AS SmallDateTime), 0)
INSERT [Relacion].[Compra_Estado] ([id_compra_estado], [id_compra], [id_estado], [fecha], [vigente]) VALUES (5, 2, 4, CAST(N'2023-02-13T00:00:00' AS SmallDateTime), 0)
INSERT [Relacion].[Compra_Estado] ([id_compra_estado], [id_compra], [id_estado], [fecha], [vigente]) VALUES (6, 2, 4, CAST(N'2023-02-13T00:00:00' AS SmallDateTime), 0)
INSERT [Relacion].[Compra_Estado] ([id_compra_estado], [id_compra], [id_estado], [fecha], [vigente]) VALUES (7, 2, 4, CAST(N'2023-02-13T00:00:00' AS SmallDateTime), 0)
INSERT [Relacion].[Compra_Estado] ([id_compra_estado], [id_compra], [id_estado], [fecha], [vigente]) VALUES (8, 1, 1, CAST(N'2023-02-13T00:00:00' AS SmallDateTime), 0)
INSERT [Relacion].[Compra_Estado] ([id_compra_estado], [id_compra], [id_estado], [fecha], [vigente]) VALUES (9, 1, 4, CAST(N'2023-02-13T00:00:00' AS SmallDateTime), 0)
INSERT [Relacion].[Compra_Estado] ([id_compra_estado], [id_compra], [id_estado], [fecha], [vigente]) VALUES (10, 1, 4, CAST(N'2023-02-13T00:00:00' AS SmallDateTime), 0)
INSERT [Relacion].[Compra_Estado] ([id_compra_estado], [id_compra], [id_estado], [fecha], [vigente]) VALUES (11, 2, 4, CAST(N'2023-02-13T00:00:00' AS SmallDateTime), 1)
INSERT [Relacion].[Compra_Estado] ([id_compra_estado], [id_compra], [id_estado], [fecha], [vigente]) VALUES (12, 1, 1, CAST(N'2023-02-13T00:00:00' AS SmallDateTime), 0)
INSERT [Relacion].[Compra_Estado] ([id_compra_estado], [id_compra], [id_estado], [fecha], [vigente]) VALUES (13, 1, 4, CAST(N'2023-02-13T00:00:00' AS SmallDateTime), 0)
INSERT [Relacion].[Compra_Estado] ([id_compra_estado], [id_compra], [id_estado], [fecha], [vigente]) VALUES (14, 3, 0, CAST(N'2023-02-21T15:28:00' AS SmallDateTime), 0)
INSERT [Relacion].[Compra_Estado] ([id_compra_estado], [id_compra], [id_estado], [fecha], [vigente]) VALUES (15, 3, 4, CAST(N'2023-02-21T00:00:00' AS SmallDateTime), 0)
INSERT [Relacion].[Compra_Estado] ([id_compra_estado], [id_compra], [id_estado], [fecha], [vigente]) VALUES (16, 3, 4, CAST(N'2023-02-21T00:00:00' AS SmallDateTime), 0)
INSERT [Relacion].[Compra_Estado] ([id_compra_estado], [id_compra], [id_estado], [fecha], [vigente]) VALUES (17, 3, 1, CAST(N'2023-02-21T00:00:00' AS SmallDateTime), 0)
INSERT [Relacion].[Compra_Estado] ([id_compra_estado], [id_compra], [id_estado], [fecha], [vigente]) VALUES (18, 3, 4, CAST(N'2023-02-21T00:00:00' AS SmallDateTime), 0)
INSERT [Relacion].[Compra_Estado] ([id_compra_estado], [id_compra], [id_estado], [fecha], [vigente]) VALUES (19, 3, 4, CAST(N'2023-02-21T00:00:00' AS SmallDateTime), 0)
INSERT [Relacion].[Compra_Estado] ([id_compra_estado], [id_compra], [id_estado], [fecha], [vigente]) VALUES (20, 3, 4, CAST(N'2023-02-21T00:00:00' AS SmallDateTime), 0)
INSERT [Relacion].[Compra_Estado] ([id_compra_estado], [id_compra], [id_estado], [fecha], [vigente]) VALUES (21, 3, 4, CAST(N'2023-02-21T00:00:00' AS SmallDateTime), 0)
INSERT [Relacion].[Compra_Estado] ([id_compra_estado], [id_compra], [id_estado], [fecha], [vigente]) VALUES (22, 3, 4, CAST(N'2023-02-21T00:00:00' AS SmallDateTime), 0)
INSERT [Relacion].[Compra_Estado] ([id_compra_estado], [id_compra], [id_estado], [fecha], [vigente]) VALUES (23, 3, 4, CAST(N'2023-02-21T00:00:00' AS SmallDateTime), 0)
INSERT [Relacion].[Compra_Estado] ([id_compra_estado], [id_compra], [id_estado], [fecha], [vigente]) VALUES (24, 3, 4, CAST(N'2023-02-21T00:00:00' AS SmallDateTime), 0)
INSERT [Relacion].[Compra_Estado] ([id_compra_estado], [id_compra], [id_estado], [fecha], [vigente]) VALUES (25, 3, 4, CAST(N'2023-02-21T00:00:00' AS SmallDateTime), 0)
INSERT [Relacion].[Compra_Estado] ([id_compra_estado], [id_compra], [id_estado], [fecha], [vigente]) VALUES (26, 3, 4, CAST(N'2023-02-21T00:00:00' AS SmallDateTime), 0)
INSERT [Relacion].[Compra_Estado] ([id_compra_estado], [id_compra], [id_estado], [fecha], [vigente]) VALUES (27, 3, 4, CAST(N'2023-02-21T00:00:00' AS SmallDateTime), 0)
INSERT [Relacion].[Compra_Estado] ([id_compra_estado], [id_compra], [id_estado], [fecha], [vigente]) VALUES (28, 3, 4, CAST(N'2023-02-21T00:00:00' AS SmallDateTime), 0)
INSERT [Relacion].[Compra_Estado] ([id_compra_estado], [id_compra], [id_estado], [fecha], [vigente]) VALUES (29, 3, 4, CAST(N'2023-02-21T00:00:00' AS SmallDateTime), 0)
INSERT [Relacion].[Compra_Estado] ([id_compra_estado], [id_compra], [id_estado], [fecha], [vigente]) VALUES (30, 3, 4, CAST(N'2023-02-21T00:00:00' AS SmallDateTime), 0)
INSERT [Relacion].[Compra_Estado] ([id_compra_estado], [id_compra], [id_estado], [fecha], [vigente]) VALUES (31, 3, 4, CAST(N'2023-02-21T00:00:00' AS SmallDateTime), 0)
INSERT [Relacion].[Compra_Estado] ([id_compra_estado], [id_compra], [id_estado], [fecha], [vigente]) VALUES (32, 3, 4, CAST(N'2023-02-21T00:00:00' AS SmallDateTime), 0)
INSERT [Relacion].[Compra_Estado] ([id_compra_estado], [id_compra], [id_estado], [fecha], [vigente]) VALUES (33, 3, 4, CAST(N'2023-02-21T00:00:00' AS SmallDateTime), 0)
INSERT [Relacion].[Compra_Estado] ([id_compra_estado], [id_compra], [id_estado], [fecha], [vigente]) VALUES (34, 3, 4, CAST(N'2023-02-21T00:00:00' AS SmallDateTime), 0)
INSERT [Relacion].[Compra_Estado] ([id_compra_estado], [id_compra], [id_estado], [fecha], [vigente]) VALUES (35, 3, 4, CAST(N'2023-02-21T00:00:00' AS SmallDateTime), 0)
INSERT [Relacion].[Compra_Estado] ([id_compra_estado], [id_compra], [id_estado], [fecha], [vigente]) VALUES (36, 3, 4, CAST(N'2023-02-21T00:00:00' AS SmallDateTime), 0)
INSERT [Relacion].[Compra_Estado] ([id_compra_estado], [id_compra], [id_estado], [fecha], [vigente]) VALUES (37, 3, 4, CAST(N'2023-02-21T00:00:00' AS SmallDateTime), 0)
INSERT [Relacion].[Compra_Estado] ([id_compra_estado], [id_compra], [id_estado], [fecha], [vigente]) VALUES (38, 3, 4, CAST(N'2023-02-21T00:00:00' AS SmallDateTime), 0)
INSERT [Relacion].[Compra_Estado] ([id_compra_estado], [id_compra], [id_estado], [fecha], [vigente]) VALUES (39, 3, 4, CAST(N'2023-02-22T00:00:00' AS SmallDateTime), 0)
INSERT [Relacion].[Compra_Estado] ([id_compra_estado], [id_compra], [id_estado], [fecha], [vigente]) VALUES (40, 3, 4, CAST(N'2023-02-22T00:00:00' AS SmallDateTime), 0)
INSERT [Relacion].[Compra_Estado] ([id_compra_estado], [id_compra], [id_estado], [fecha], [vigente]) VALUES (41, 3, 4, CAST(N'2023-02-22T00:00:00' AS SmallDateTime), 0)
INSERT [Relacion].[Compra_Estado] ([id_compra_estado], [id_compra], [id_estado], [fecha], [vigente]) VALUES (42, 3, 4, CAST(N'2023-02-22T00:00:00' AS SmallDateTime), 0)
INSERT [Relacion].[Compra_Estado] ([id_compra_estado], [id_compra], [id_estado], [fecha], [vigente]) VALUES (43, 3, 4, CAST(N'2023-02-22T00:00:00' AS SmallDateTime), 0)
INSERT [Relacion].[Compra_Estado] ([id_compra_estado], [id_compra], [id_estado], [fecha], [vigente]) VALUES (44, 3, 4, CAST(N'2023-02-22T00:00:00' AS SmallDateTime), 0)
INSERT [Relacion].[Compra_Estado] ([id_compra_estado], [id_compra], [id_estado], [fecha], [vigente]) VALUES (45, 3, 4, CAST(N'2023-02-22T00:00:00' AS SmallDateTime), 0)
INSERT [Relacion].[Compra_Estado] ([id_compra_estado], [id_compra], [id_estado], [fecha], [vigente]) VALUES (46, 3, 4, CAST(N'2023-02-22T00:00:00' AS SmallDateTime), 0)
INSERT [Relacion].[Compra_Estado] ([id_compra_estado], [id_compra], [id_estado], [fecha], [vigente]) VALUES (47, 3, 4, CAST(N'2023-02-22T00:00:00' AS SmallDateTime), 0)
INSERT [Relacion].[Compra_Estado] ([id_compra_estado], [id_compra], [id_estado], [fecha], [vigente]) VALUES (48, 3, 4, CAST(N'2023-02-22T00:00:00' AS SmallDateTime), 0)
INSERT [Relacion].[Compra_Estado] ([id_compra_estado], [id_compra], [id_estado], [fecha], [vigente]) VALUES (49, 3, 4, CAST(N'2023-02-22T00:00:00' AS SmallDateTime), 0)
INSERT [Relacion].[Compra_Estado] ([id_compra_estado], [id_compra], [id_estado], [fecha], [vigente]) VALUES (50, 3, 4, CAST(N'2023-02-22T00:00:00' AS SmallDateTime), 0)
INSERT [Relacion].[Compra_Estado] ([id_compra_estado], [id_compra], [id_estado], [fecha], [vigente]) VALUES (51, 3, 4, CAST(N'2023-02-22T00:00:00' AS SmallDateTime), 0)
INSERT [Relacion].[Compra_Estado] ([id_compra_estado], [id_compra], [id_estado], [fecha], [vigente]) VALUES (52, 3, 4, CAST(N'2023-02-22T00:00:00' AS SmallDateTime), 0)
INSERT [Relacion].[Compra_Estado] ([id_compra_estado], [id_compra], [id_estado], [fecha], [vigente]) VALUES (53, 3, 4, CAST(N'2023-02-22T00:00:00' AS SmallDateTime), 0)
INSERT [Relacion].[Compra_Estado] ([id_compra_estado], [id_compra], [id_estado], [fecha], [vigente]) VALUES (54, 1, 4, CAST(N'2023-02-22T00:00:00' AS SmallDateTime), 0)
INSERT [Relacion].[Compra_Estado] ([id_compra_estado], [id_compra], [id_estado], [fecha], [vigente]) VALUES (55, 3, 4, CAST(N'2023-02-22T00:00:00' AS SmallDateTime), 0)
INSERT [Relacion].[Compra_Estado] ([id_compra_estado], [id_compra], [id_estado], [fecha], [vigente]) VALUES (56, 3, 4, CAST(N'2023-02-22T00:00:00' AS SmallDateTime), 0)
INSERT [Relacion].[Compra_Estado] ([id_compra_estado], [id_compra], [id_estado], [fecha], [vigente]) VALUES (57, 3, 4, CAST(N'2023-02-22T00:00:00' AS SmallDateTime), 0)
INSERT [Relacion].[Compra_Estado] ([id_compra_estado], [id_compra], [id_estado], [fecha], [vigente]) VALUES (58, 3, 4, CAST(N'2023-02-22T00:00:00' AS SmallDateTime), 0)
INSERT [Relacion].[Compra_Estado] ([id_compra_estado], [id_compra], [id_estado], [fecha], [vigente]) VALUES (59, 3, 4, CAST(N'2023-02-22T00:00:00' AS SmallDateTime), 0)
INSERT [Relacion].[Compra_Estado] ([id_compra_estado], [id_compra], [id_estado], [fecha], [vigente]) VALUES (60, 3, 4, CAST(N'2023-02-22T00:00:00' AS SmallDateTime), 0)
INSERT [Relacion].[Compra_Estado] ([id_compra_estado], [id_compra], [id_estado], [fecha], [vigente]) VALUES (61, 3, 4, CAST(N'2023-02-22T00:00:00' AS SmallDateTime), 0)
INSERT [Relacion].[Compra_Estado] ([id_compra_estado], [id_compra], [id_estado], [fecha], [vigente]) VALUES (62, 3, 4, CAST(N'2023-02-22T00:00:00' AS SmallDateTime), 0)
INSERT [Relacion].[Compra_Estado] ([id_compra_estado], [id_compra], [id_estado], [fecha], [vigente]) VALUES (63, 3, 4, CAST(N'2023-02-22T00:00:00' AS SmallDateTime), 0)
INSERT [Relacion].[Compra_Estado] ([id_compra_estado], [id_compra], [id_estado], [fecha], [vigente]) VALUES (64, 3, 4, CAST(N'2023-02-22T00:00:00' AS SmallDateTime), 0)
INSERT [Relacion].[Compra_Estado] ([id_compra_estado], [id_compra], [id_estado], [fecha], [vigente]) VALUES (65, 3, 4, CAST(N'2023-02-22T00:00:00' AS SmallDateTime), 0)
INSERT [Relacion].[Compra_Estado] ([id_compra_estado], [id_compra], [id_estado], [fecha], [vigente]) VALUES (66, 1, 4, CAST(N'2023-02-22T00:00:00' AS SmallDateTime), 1)
INSERT [Relacion].[Compra_Estado] ([id_compra_estado], [id_compra], [id_estado], [fecha], [vigente]) VALUES (67, 3, 4, CAST(N'2023-02-22T00:00:00' AS SmallDateTime), 0)
INSERT [Relacion].[Compra_Estado] ([id_compra_estado], [id_compra], [id_estado], [fecha], [vigente]) VALUES (68, 3, 4, CAST(N'2023-02-22T00:00:00' AS SmallDateTime), 0)
INSERT [Relacion].[Compra_Estado] ([id_compra_estado], [id_compra], [id_estado], [fecha], [vigente]) VALUES (69, 3, 4, CAST(N'2023-02-22T00:00:00' AS SmallDateTime), 0)
INSERT [Relacion].[Compra_Estado] ([id_compra_estado], [id_compra], [id_estado], [fecha], [vigente]) VALUES (70, 3, 4, CAST(N'2023-02-22T00:00:00' AS SmallDateTime), 0)
INSERT [Relacion].[Compra_Estado] ([id_compra_estado], [id_compra], [id_estado], [fecha], [vigente]) VALUES (71, 3, 4, CAST(N'2023-02-22T00:00:00' AS SmallDateTime), 0)
INSERT [Relacion].[Compra_Estado] ([id_compra_estado], [id_compra], [id_estado], [fecha], [vigente]) VALUES (72, 3, 4, CAST(N'2023-02-22T00:00:00' AS SmallDateTime), 0)
INSERT [Relacion].[Compra_Estado] ([id_compra_estado], [id_compra], [id_estado], [fecha], [vigente]) VALUES (73, 3, 4, CAST(N'2023-02-22T00:00:00' AS SmallDateTime), 1)
SET IDENTITY_INSERT [Relacion].[Compra_Estado] OFF
GO
