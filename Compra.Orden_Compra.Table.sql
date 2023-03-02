USE [BLV]
GO
/****** Object:  Table [Compra].[Orden_Compra]    Script Date: 2/3/2023 7:13:21 p. m. ******/
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

INSERT [Compra].[Orden_Compra] ([id_orden_compra], [fecha]) VALUES (1, CAST(N'2023-03-01T08:33:00' AS SmallDateTime))
INSERT [Compra].[Orden_Compra] ([id_orden_compra], [fecha]) VALUES (2, CAST(N'2023-03-01T08:33:00' AS SmallDateTime))
INSERT [Compra].[Orden_Compra] ([id_orden_compra], [fecha]) VALUES (3, CAST(N'2023-03-01T08:35:00' AS SmallDateTime))
INSERT [Compra].[Orden_Compra] ([id_orden_compra], [fecha]) VALUES (4, CAST(N'2023-03-02T14:42:00' AS SmallDateTime))
INSERT [Compra].[Orden_Compra] ([id_orden_compra], [fecha]) VALUES (5, CAST(N'2023-03-02T17:56:00' AS SmallDateTime))
SET IDENTITY_INSERT [Compra].[Orden_Compra] OFF
GO
