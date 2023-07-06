USE [BLV]
GO
/****** Object:  Table [Relacion].[Lote_Stock]    Script Date: 5/7/2023 10:45:14 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Relacion].[Lote_Stock](
	[id_lote_stock] [int] IDENTITY(1,1) NOT NULL,
	[id_batch] [int] NULL,
	[id_stock] [int] NULL,
	[fecha_impacto] [date] NULL,
	[cantidad] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_lote_stock] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [Relacion].[Lote_Stock] ON 

INSERT [Relacion].[Lote_Stock] ([id_lote_stock], [id_batch], [id_stock], [fecha_impacto], [cantidad]) VALUES (1, 1, 14, CAST(N'2023-07-05' AS Date), 4000)
INSERT [Relacion].[Lote_Stock] ([id_lote_stock], [id_batch], [id_stock], [fecha_impacto], [cantidad]) VALUES (2, 2, 15, CAST(N'2023-07-05' AS Date), 6000)
INSERT [Relacion].[Lote_Stock] ([id_lote_stock], [id_batch], [id_stock], [fecha_impacto], [cantidad]) VALUES (3, 3, 7, CAST(N'2023-07-05' AS Date), 6500)
INSERT [Relacion].[Lote_Stock] ([id_lote_stock], [id_batch], [id_stock], [fecha_impacto], [cantidad]) VALUES (4, 3, 8, CAST(N'2023-07-05' AS Date), 6500)
SET IDENTITY_INSERT [Relacion].[Lote_Stock] OFF
GO
