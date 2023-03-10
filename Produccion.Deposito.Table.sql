USE [BLV]
GO
/****** Object:  Table [Produccion].[Deposito]    Script Date: 20/1/2023 8:48:49 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Produccion].[Deposito](
	[id_deposito] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](40) NULL,
	[domicilio] [varchar](50) NULL,
	[telefono] [varchar](20) NULL,
	[fax] [varchar](20) NULL,
	[mail] [varchar](40) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_deposito] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [Produccion].[Deposito] ON 

INSERT [Produccion].[Deposito] ([id_deposito], [nombre], [domicilio], [telefono], [fax], [mail]) VALUES (1, N'TRES ARROYOS', N'TRES ARROYOS 3485', N'12345678', N'12345678', N'tresarroyos@gmail.com')
SET IDENTITY_INSERT [Produccion].[Deposito] OFF
GO
