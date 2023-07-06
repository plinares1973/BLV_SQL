USE [BLV]
GO
/****** Object:  Table [Compra].[Orden_Compra]    Script Date: 5/7/2023 10:45:14 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Compra].[Orden_Compra](
	[id_orden_compra] [int] IDENTITY(1,1) NOT NULL,
	[fecha] [smalldatetime] NULL,
	[codigo_importacion] [nvarchar](50) NULL,
	[certificado_libre circulacion] [nvarchar](255) NULL,
	[fecha_libre_circulacion] [smalldatetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_orden_compra] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [Compra].[Orden_Compra] ON 

INSERT [Compra].[Orden_Compra] ([id_orden_compra], [fecha], [codigo_importacion], [certificado_libre circulacion], [fecha_libre_circulacion]) VALUES (1, CAST(N'2023-07-05T20:30:00' AS SmallDateTime), NULL, NULL, NULL)
SET IDENTITY_INSERT [Compra].[Orden_Compra] OFF
GO
