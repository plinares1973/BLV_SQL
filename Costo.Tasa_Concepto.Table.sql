USE [BLV]
GO
/****** Object:  Table [Costo].[Tasa_Concepto]    Script Date: 6/7/2023 8:42:53 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Costo].[Tasa_Concepto](
	[id_tasa_concepto] [int] IDENTITY(1,1) NOT NULL,
	[valor] [float] NULL,
	[id_concepto_header] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_tasa_concepto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [Costo].[Tasa_Concepto] ON 

INSERT [Costo].[Tasa_Concepto] ([id_tasa_concepto], [valor], [id_concepto_header]) VALUES (1, 3, 5)
INSERT [Costo].[Tasa_Concepto] ([id_tasa_concepto], [valor], [id_concepto_header]) VALUES (2, 21, 6)
INSERT [Costo].[Tasa_Concepto] ([id_tasa_concepto], [valor], [id_concepto_header]) VALUES (3, 20, 7)
INSERT [Costo].[Tasa_Concepto] ([id_tasa_concepto], [valor], [id_concepto_header]) VALUES (4, 6, 8)
INSERT [Costo].[Tasa_Concepto] ([id_tasa_concepto], [valor], [id_concepto_header]) VALUES (5, 1.8, 9)
INSERT [Costo].[Tasa_Concepto] ([id_tasa_concepto], [valor], [id_concepto_header]) VALUES (6, 10, 10)
SET IDENTITY_INSERT [Costo].[Tasa_Concepto] OFF
GO
