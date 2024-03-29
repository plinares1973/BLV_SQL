USE [BLV]
GO
/****** Object:  Table [Compra].[Proveedor]    Script Date: 6/7/2023 8:42:53 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Compra].[Proveedor](
	[id_proveedor] [int] IDENTITY(1,1) NOT NULL,
	[razon_social] [varchar](70) NULL,
	[domicilio] [varchar](40) NULL,
	[telefono] [varchar](20) NULL,
	[fax] [varchar](20) NULL,
	[mail] [varchar](40) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_proveedor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [Compra].[Proveedor] ON 

INSERT [Compra].[Proveedor] ([id_proveedor], [razon_social], [domicilio], [telefono], [fax], [mail]) VALUES (1, N'CORBION PRODUTOS RENOVAVEIS LTDA', N'AV. RAUL BARBOSA 521', N'551155093062', N'SIN DATOS', N'SIN DATOS')
INSERT [Compra].[Proveedor] ([id_proveedor], [razon_social], [domicilio], [telefono], [fax], [mail]) VALUES (2, N'MASTELLONE HERMANOS SA', N'ALMIRANTE BROWN 957', N'02374859000', N'02374859000', N'mastellone@mastellone.com.ar')
INSERT [Compra].[Proveedor] ([id_proveedor], [razon_social], [domicilio], [telefono], [fax], [mail]) VALUES (3, N'GOOD FOOD SA', N'TRES ARROYOS 329', N'46275325', N'46275325', N'goodfood@goodfood.com.ar')
SET IDENTITY_INSERT [Compra].[Proveedor] OFF
GO
