USE [BLV]
GO
/****** Object:  Table [Relacion].[Deposito_Stock]    Script Date: 6/7/2023 8:42:53 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Relacion].[Deposito_Stock](
	[id_deposito_Stock] [int] IDENTITY(1,1) NOT NULL,
	[id_deposito] [int] NULL,
	[id_stock] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_deposito_Stock] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [Relacion].[Deposito_Stock] ON 

INSERT [Relacion].[Deposito_Stock] ([id_deposito_Stock], [id_deposito], [id_stock]) VALUES (1, 1, 1)
INSERT [Relacion].[Deposito_Stock] ([id_deposito_Stock], [id_deposito], [id_stock]) VALUES (2, 1, 2)
INSERT [Relacion].[Deposito_Stock] ([id_deposito_Stock], [id_deposito], [id_stock]) VALUES (3, 1, 3)
INSERT [Relacion].[Deposito_Stock] ([id_deposito_Stock], [id_deposito], [id_stock]) VALUES (4, 1, 4)
INSERT [Relacion].[Deposito_Stock] ([id_deposito_Stock], [id_deposito], [id_stock]) VALUES (5, 1, 5)
INSERT [Relacion].[Deposito_Stock] ([id_deposito_Stock], [id_deposito], [id_stock]) VALUES (6, 1, 6)
INSERT [Relacion].[Deposito_Stock] ([id_deposito_Stock], [id_deposito], [id_stock]) VALUES (7, 1, 7)
INSERT [Relacion].[Deposito_Stock] ([id_deposito_Stock], [id_deposito], [id_stock]) VALUES (8, 1, 8)
INSERT [Relacion].[Deposito_Stock] ([id_deposito_Stock], [id_deposito], [id_stock]) VALUES (9, 1, 9)
INSERT [Relacion].[Deposito_Stock] ([id_deposito_Stock], [id_deposito], [id_stock]) VALUES (10, 1, 10)
INSERT [Relacion].[Deposito_Stock] ([id_deposito_Stock], [id_deposito], [id_stock]) VALUES (11, 2, 11)
INSERT [Relacion].[Deposito_Stock] ([id_deposito_Stock], [id_deposito], [id_stock]) VALUES (12, 2, 12)
INSERT [Relacion].[Deposito_Stock] ([id_deposito_Stock], [id_deposito], [id_stock]) VALUES (13, 2, 13)
INSERT [Relacion].[Deposito_Stock] ([id_deposito_Stock], [id_deposito], [id_stock]) VALUES (14, 2, 14)
INSERT [Relacion].[Deposito_Stock] ([id_deposito_Stock], [id_deposito], [id_stock]) VALUES (15, 2, 15)
INSERT [Relacion].[Deposito_Stock] ([id_deposito_Stock], [id_deposito], [id_stock]) VALUES (16, 2, 16)
INSERT [Relacion].[Deposito_Stock] ([id_deposito_Stock], [id_deposito], [id_stock]) VALUES (17, 2, 17)
INSERT [Relacion].[Deposito_Stock] ([id_deposito_Stock], [id_deposito], [id_stock]) VALUES (18, 2, 18)
SET IDENTITY_INSERT [Relacion].[Deposito_Stock] OFF
GO
