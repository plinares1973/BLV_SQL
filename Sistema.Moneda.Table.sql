USE [BLV]
GO
/****** Object:  Table [Sistema].[Moneda]    Script Date: 6/7/2023 8:42:54 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Sistema].[Moneda](
	[id_moneda] [int] IDENTITY(1,1) NOT NULL,
	[nomenclatura] [varchar](3) NULL,
	[descripcion] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_moneda] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [Sistema].[Moneda] ON 

INSERT [Sistema].[Moneda] ([id_moneda], [nomenclatura], [descripcion]) VALUES (1, N'USD', N'DOLAR ESTADOUNIDENSE')
INSERT [Sistema].[Moneda] ([id_moneda], [nomenclatura], [descripcion]) VALUES (2, N'EUR', N'EURO')
INSERT [Sistema].[Moneda] ([id_moneda], [nomenclatura], [descripcion]) VALUES (3, N'RMB', N'RENMINBI CHINO')
INSERT [Sistema].[Moneda] ([id_moneda], [nomenclatura], [descripcion]) VALUES (4, N'ARS', N'PESO ARGENTINO')
SET IDENTITY_INSERT [Sistema].[Moneda] OFF
GO
