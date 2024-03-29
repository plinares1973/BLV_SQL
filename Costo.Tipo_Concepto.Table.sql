USE [BLV]
GO
/****** Object:  Table [Costo].[Tipo_Concepto]    Script Date: 6/7/2023 8:42:53 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Costo].[Tipo_Concepto](
	[id_tipo_concepto] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [varchar](40) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_tipo_concepto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [Costo].[Tipo_Concepto] ON 

INSERT [Costo].[Tipo_Concepto] ([id_tipo_concepto], [descripcion]) VALUES (1, N'D.importacion')
INSERT [Costo].[Tipo_Concepto] ([id_tipo_concepto], [descripcion]) VALUES (2, N'Impuesto')
INSERT [Costo].[Tipo_Concepto] ([id_tipo_concepto], [descripcion]) VALUES (3, N'Costo')
INSERT [Costo].[Tipo_Concepto] ([id_tipo_concepto], [descripcion]) VALUES (4, N'Arancel')
INSERT [Costo].[Tipo_Concepto] ([id_tipo_concepto], [descripcion]) VALUES (5, N'Extras')
SET IDENTITY_INSERT [Costo].[Tipo_Concepto] OFF
GO
