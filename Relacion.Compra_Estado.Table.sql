USE [BLV]
GO
/****** Object:  Table [Relacion].[Compra_Estado]    Script Date: 2/3/2023 7:13:21 p. m. ******/
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

INSERT [Relacion].[Compra_Estado] ([id_compra_estado], [id_compra], [id_estado], [fecha], [vigente]) VALUES (1, 1, 0, CAST(N'2023-03-01T08:33:00' AS SmallDateTime), 1)
INSERT [Relacion].[Compra_Estado] ([id_compra_estado], [id_compra], [id_estado], [fecha], [vigente]) VALUES (2, 2, 0, CAST(N'2023-03-01T08:33:00' AS SmallDateTime), 1)
INSERT [Relacion].[Compra_Estado] ([id_compra_estado], [id_compra], [id_estado], [fecha], [vigente]) VALUES (3, 3, 0, CAST(N'2023-03-01T08:35:00' AS SmallDateTime), 0)
INSERT [Relacion].[Compra_Estado] ([id_compra_estado], [id_compra], [id_estado], [fecha], [vigente]) VALUES (4, 3, 4, CAST(N'2023-03-01T00:00:00' AS SmallDateTime), 1)
INSERT [Relacion].[Compra_Estado] ([id_compra_estado], [id_compra], [id_estado], [fecha], [vigente]) VALUES (5, 4, 0, CAST(N'2023-03-02T14:42:00' AS SmallDateTime), 0)
INSERT [Relacion].[Compra_Estado] ([id_compra_estado], [id_compra], [id_estado], [fecha], [vigente]) VALUES (6, 4, 4, CAST(N'2023-03-02T00:00:00' AS SmallDateTime), 1)
INSERT [Relacion].[Compra_Estado] ([id_compra_estado], [id_compra], [id_estado], [fecha], [vigente]) VALUES (7, 5, 0, CAST(N'2023-03-02T17:56:00' AS SmallDateTime), 0)
INSERT [Relacion].[Compra_Estado] ([id_compra_estado], [id_compra], [id_estado], [fecha], [vigente]) VALUES (8, 5, 4, CAST(N'2023-03-02T00:00:00' AS SmallDateTime), 1)
SET IDENTITY_INSERT [Relacion].[Compra_Estado] OFF
GO
