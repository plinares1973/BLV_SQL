USE [BLV]
GO
/****** Object:  Table [Produccion].[Medida]    Script Date: 6/7/2023 8:42:53 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Produccion].[Medida](
	[id_medida] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [varchar](30) NULL,
	[unidad] [varchar](5) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_medida] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [Produccion].[Medida] ON 

INSERT [Produccion].[Medida] ([id_medida], [descripcion], [unidad]) VALUES (1, N'KILOGRAMOS', N'KG')
SET IDENTITY_INSERT [Produccion].[Medida] OFF
GO
