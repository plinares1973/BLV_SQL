USE [BLV]
GO
/****** Object:  Table [Compra].[Orden_Compra]    Script Date: 11/6/2023 10:15:59 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Compra].[Orden_Compra](
	[id_orden_compra] [int] IDENTITY(1,1) NOT NULL,
	[fecha] [smalldatetime] NULL,
	[codigo_importacion] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_orden_compra] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [Compra].[Orden_Compra] ON 

INSERT [Compra].[Orden_Compra] ([id_orden_compra], [fecha], [codigo_importacion]) VALUES (1, CAST(N'2023-05-17T20:28:00' AS SmallDateTime), NULL)
INSERT [Compra].[Orden_Compra] ([id_orden_compra], [fecha], [codigo_importacion]) VALUES (2, CAST(N'2023-05-17T20:29:00' AS SmallDateTime), NULL)
INSERT [Compra].[Orden_Compra] ([id_orden_compra], [fecha], [codigo_importacion]) VALUES (3, CAST(N'2023-05-17T20:41:00' AS SmallDateTime), NULL)
INSERT [Compra].[Orden_Compra] ([id_orden_compra], [fecha], [codigo_importacion]) VALUES (4, CAST(N'2023-05-17T20:45:00' AS SmallDateTime), NULL)
INSERT [Compra].[Orden_Compra] ([id_orden_compra], [fecha], [codigo_importacion]) VALUES (1002, CAST(N'2023-06-04T20:19:00' AS SmallDateTime), NULL)
INSERT [Compra].[Orden_Compra] ([id_orden_compra], [fecha], [codigo_importacion]) VALUES (1003, CAST(N'2023-06-04T20:20:00' AS SmallDateTime), NULL)
INSERT [Compra].[Orden_Compra] ([id_orden_compra], [fecha], [codigo_importacion]) VALUES (1004, CAST(N'2023-06-04T20:28:00' AS SmallDateTime), NULL)
SET IDENTITY_INSERT [Compra].[Orden_Compra] OFF
GO
