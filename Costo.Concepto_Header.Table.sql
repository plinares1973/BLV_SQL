USE [BLV]
GO
/****** Object:  Table [Costo].[Concepto_Header]    Script Date: 6/7/2023 8:42:53 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Costo].[Concepto_Header](
	[id_concepto_header] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](20) NULL,
	[descripcion] [varchar](200) NULL,
	[id_pais_origen] [int] NULL,
	[id_tipo_valor] [int] NULL,
	[id_tipo_concepto] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_concepto_header] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [Costo].[Concepto_Header] ON 

INSERT [Costo].[Concepto_Header] ([id_concepto_header], [nombre], [descripcion], [id_pais_origen], [id_tipo_valor], [id_tipo_concepto]) VALUES (1, N'EXWORK', N'El costo se limita a la producción y entrega en el lugar de origen', 340, 1, 3)
INSERT [Costo].[Concepto_Header] ([id_concepto_header], [nombre], [descripcion], [id_pais_origen], [id_tipo_valor], [id_tipo_concepto]) VALUES (2, N'FOB', N'El costo incluye la entrega en el puerto de origen', 340, 1, 3)
INSERT [Costo].[Concepto_Header] ([id_concepto_header], [nombre], [descripcion], [id_pais_origen], [id_tipo_valor], [id_tipo_concepto]) VALUES (3, N'CFR', N'El costo incluye el transporte marítimo y seguro hasta el puerto de destino', 340, 1, 3)
INSERT [Costo].[Concepto_Header] ([id_concepto_header], [nombre], [descripcion], [id_pais_origen], [id_tipo_valor], [id_tipo_concepto]) VALUES (4, N'CIF', N'el costo incluye el transporte marítimo y seguro hasta el puerto de destino y los costos de llegada y procesamiento en el puerto de destino', 340, 1, 3)
INSERT [Costo].[Concepto_Header] ([id_concepto_header], [nombre], [descripcion], [id_pais_origen], [id_tipo_valor], [id_tipo_concepto]) VALUES (5, N'VAE', N'Tasa estadística, también conocida como Valor en Aduana Estadístico', 340, 2, 4)
INSERT [Costo].[Concepto_Header] ([id_concepto_header], [nombre], [descripcion], [id_pais_origen], [id_tipo_valor], [id_tipo_concepto]) VALUES (6, N'IVA', N'Impuesto al valor agregado', 340, 2, 2)
INSERT [Costo].[Concepto_Header] ([id_concepto_header], [nombre], [descripcion], [id_pais_origen], [id_tipo_valor], [id_tipo_concepto]) VALUES (7, N'IVA AD', N'Impuesto al valor agregado Adicional', 340, 2, 2)
INSERT [Costo].[Concepto_Header] ([id_concepto_header], [nombre], [descripcion], [id_pais_origen], [id_tipo_valor], [id_tipo_concepto]) VALUES (8, N'GAN', N'Ganancias', 340, 2, 2)
INSERT [Costo].[Concepto_Header] ([id_concepto_header], [nombre], [descripcion], [id_pais_origen], [id_tipo_valor], [id_tipo_concepto]) VALUES (9, N'IBC', N'Ingresos Brutos', 340, 2, 2)
INSERT [Costo].[Concepto_Header] ([id_concepto_header], [nombre], [descripcion], [id_pais_origen], [id_tipo_valor], [id_tipo_concepto]) VALUES (10, N'SIM', N'Arancel a pagar por despacho', 340, 1, 4)
INSERT [Costo].[Concepto_Header] ([id_concepto_header], [nombre], [descripcion], [id_pais_origen], [id_tipo_valor], [id_tipo_concepto]) VALUES (11, N'INAL', N'verificacondiciones higiénico-sanitarias, bromatológicas y de identificación comercial de los productos', 340, 1, 4)
INSERT [Costo].[Concepto_Header] ([id_concepto_header], [nombre], [descripcion], [id_pais_origen], [id_tipo_valor], [id_tipo_concepto]) VALUES (12, N'SENASA', N'Arancel SENASA', 340, 1, 4)
INSERT [Costo].[Concepto_Header] ([id_concepto_header], [nombre], [descripcion], [id_pais_origen], [id_tipo_valor], [id_tipo_concepto]) VALUES (13, N'NAVIERA', N'Costos de Naviera', 340, 1, 5)
INSERT [Costo].[Concepto_Header] ([id_concepto_header], [nombre], [descripcion], [id_pais_origen], [id_tipo_valor], [id_tipo_concepto]) VALUES (14, N'TERMINAL', N'Costos de Terminal', 340, 1, 5)
INSERT [Costo].[Concepto_Header] ([id_concepto_header], [nombre], [descripcion], [id_pais_origen], [id_tipo_valor], [id_tipo_concepto]) VALUES (15, N'FLETE', N'Transporte interno', 340, 1, 5)
INSERT [Costo].[Concepto_Header] ([id_concepto_header], [nombre], [descripcion], [id_pais_origen], [id_tipo_valor], [id_tipo_concepto]) VALUES (16, N'FLETE USD', N'Transporte en país de origen', 407, 1, 5)
INSERT [Costo].[Concepto_Header] ([id_concepto_header], [nombre], [descripcion], [id_pais_origen], [id_tipo_valor], [id_tipo_concepto]) VALUES (17, N'HON', N'Honorarios del despachante de Aduana', 340, 1, 5)
INSERT [Costo].[Concepto_Header] ([id_concepto_header], [nombre], [descripcion], [id_pais_origen], [id_tipo_valor], [id_tipo_concepto]) VALUES (18, N'COM', N'Comisiones bancarias', 340, 1, 5)
INSERT [Costo].[Concepto_Header] ([id_concepto_header], [nombre], [descripcion], [id_pais_origen], [id_tipo_valor], [id_tipo_concepto]) VALUES (19, N'EXTRAS', N'Gastos varios', 340, 1, 5)
INSERT [Costo].[Concepto_Header] ([id_concepto_header], [nombre], [descripcion], [id_pais_origen], [id_tipo_valor], [id_tipo_concepto]) VALUES (20, N'SEGURO USD', N'Seguro contratado en origen', 407, 1, 5)
INSERT [Costo].[Concepto_Header] ([id_concepto_header], [nombre], [descripcion], [id_pais_origen], [id_tipo_valor], [id_tipo_concepto]) VALUES (21, N'AJUSTE USD', N'Ajustes', NULL, 1, 5)
INSERT [Costo].[Concepto_Header] ([id_concepto_header], [nombre], [descripcion], [id_pais_origen], [id_tipo_valor], [id_tipo_concepto]) VALUES (22, N'DIMP', N'Derecho de Importacion gravamen Ad Valorem sobre el producto a importar', 340, 2, 2)
SET IDENTITY_INSERT [Costo].[Concepto_Header] OFF
GO
