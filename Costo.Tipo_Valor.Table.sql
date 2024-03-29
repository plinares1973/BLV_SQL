USE [BLV]
GO
/****** Object:  Table [Costo].[Tipo_Valor]    Script Date: 6/7/2023 8:42:53 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Costo].[Tipo_Valor](
	[id_tipo_concepto] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [varchar](40) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_tipo_concepto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [Costo].[Tipo_Valor] ON 

INSERT [Costo].[Tipo_Valor] ([id_tipo_concepto], [descripcion]) VALUES (1, N'Nominal')
INSERT [Costo].[Tipo_Valor] ([id_tipo_concepto], [descripcion]) VALUES (2, N'Porcentual')
SET IDENTITY_INSERT [Costo].[Tipo_Valor] OFF
GO
