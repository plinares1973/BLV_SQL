USE [BLV]
GO
/****** Object:  Table [Compra].[Flete]    Script Date: 20/4/2023 12:37:58 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Compra].[Flete](
	[id_flete] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [varchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_flete] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [Compra].[Flete] ON 

INSERT [Compra].[Flete] ([id_flete], [descripcion]) VALUES (1, N'EXWORK')
INSERT [Compra].[Flete] ([id_flete], [descripcion]) VALUES (2, N'FOB')
INSERT [Compra].[Flete] ([id_flete], [descripcion]) VALUES (3, N'CIF')
INSERT [Compra].[Flete] ([id_flete], [descripcion]) VALUES (4, N'CFR')
SET IDENTITY_INSERT [Compra].[Flete] OFF
GO
