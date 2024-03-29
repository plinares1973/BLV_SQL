USE [BLV]
GO
/****** Object:  Table [Relacion].[Deposito_Ciudad]    Script Date: 6/7/2023 8:42:53 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Relacion].[Deposito_Ciudad](
	[id_deposito_ciudad] [int] IDENTITY(1,1) NOT NULL,
	[id_deposito] [int] NULL,
	[id_ciudad] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_deposito_ciudad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [Relacion].[Deposito_Ciudad] ON 

INSERT [Relacion].[Deposito_Ciudad] ([id_deposito_ciudad], [id_deposito], [id_ciudad]) VALUES (1, 1, 2473)
INSERT [Relacion].[Deposito_Ciudad] ([id_deposito_ciudad], [id_deposito], [id_ciudad]) VALUES (2, 2, 2477)
SET IDENTITY_INSERT [Relacion].[Deposito_Ciudad] OFF
GO
