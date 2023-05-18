USE [BLV]
GO
/****** Object:  Table [Parametro].[Compra]    Script Date: 17/5/2023 9:15:21 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Parametro].[Compra](
	[id_parametro] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [varchar](100) NULL,
	[valor] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_parametro] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [Parametro].[Compra] ON 

INSERT [Parametro].[Compra] ([id_parametro], [descripcion], [valor]) VALUES (1, N'Valor de Sistema.Estado por el cual se impacta en Produccion.Stock una OC', 4)
SET IDENTITY_INSERT [Parametro].[Compra] OFF
GO
