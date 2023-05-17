USE [BLV]
GO
/****** Object:  Table [Relacion].[Compra_Estado]    Script Date: 17/5/2023 1:14:13 a. m. ******/
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

INSERT [Relacion].[Compra_Estado] ([id_compra_estado], [id_compra], [id_estado], [fecha], [vigente]) VALUES (1, 1, 0, CAST(N'2023-05-16T10:39:00' AS SmallDateTime), 1)
INSERT [Relacion].[Compra_Estado] ([id_compra_estado], [id_compra], [id_estado], [fecha], [vigente]) VALUES (2, 2, 0, CAST(N'2023-05-16T21:40:00' AS SmallDateTime), 1)
SET IDENTITY_INSERT [Relacion].[Compra_Estado] OFF
GO
