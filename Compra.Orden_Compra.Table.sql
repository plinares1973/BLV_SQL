USE [BLV]
GO
/****** Object:  Table [Compra].[Orden_Compra]    Script Date: 22/2/2023 10:12:20 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Compra].[Orden_Compra](
	[id_orden_compra] [int] IDENTITY(1,1) NOT NULL,
	[fecha] [smalldatetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_orden_compra] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [Compra].[Orden_Compra] ON 

INSERT [Compra].[Orden_Compra] ([id_orden_compra], [fecha]) VALUES (1, CAST(N'2023-02-02T20:13:00' AS SmallDateTime))
INSERT [Compra].[Orden_Compra] ([id_orden_compra], [fecha]) VALUES (2, CAST(N'2023-02-02T20:28:00' AS SmallDateTime))
INSERT [Compra].[Orden_Compra] ([id_orden_compra], [fecha]) VALUES (3, CAST(N'2023-02-21T15:28:00' AS SmallDateTime))
SET IDENTITY_INSERT [Compra].[Orden_Compra] OFF
GO
