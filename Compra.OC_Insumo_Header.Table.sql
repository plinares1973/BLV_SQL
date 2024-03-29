USE [BLV]
GO
/****** Object:  Table [Compra].[OC_Insumo_Header]    Script Date: 6/7/2023 8:42:53 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Compra].[OC_Insumo_Header](
	[id_oc_insumo_header] [int] IDENTITY(1,1) NOT NULL,
	[fecha] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_oc_insumo_header] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [Compra].[OC_Insumo_Header] ON 

INSERT [Compra].[OC_Insumo_Header] ([id_oc_insumo_header], [fecha]) VALUES (1, CAST(N'2023-02-13' AS Date))
SET IDENTITY_INSERT [Compra].[OC_Insumo_Header] OFF
GO
