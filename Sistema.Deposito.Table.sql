USE [BLV]
GO
/****** Object:  Table [Sistema].[Deposito]    Script Date: 6/7/2023 8:42:53 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Sistema].[Deposito](
	[id_deposito] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](70) NULL,
	[domicilio] [varchar](40) NULL,
	[telefono] [varchar](20) NULL,
	[fax] [varchar](20) NULL,
	[mail] [varchar](40) NULL
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [Sistema].[Deposito] ON 

INSERT [Sistema].[Deposito] ([id_deposito], [nombre], [domicilio], [telefono], [fax], [mail]) VALUES (1, N'POCITOS', N'TRES ARROYOS 485', NULL, NULL, NULL)
INSERT [Sistema].[Deposito] ([id_deposito], [nombre], [domicilio], [telefono], [fax], [mail]) VALUES (2, N'COMARCA', N'MURILLO 555', NULL, NULL, NULL)
SET IDENTITY_INSERT [Sistema].[Deposito] OFF
GO
