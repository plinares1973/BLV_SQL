USE [BLV]
GO
/****** Object:  Table [Relacion].[Lote_Stock]    Script Date: 14/3/2023 11:16:38 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Relacion].[Lote_Stock](
	[id_lote_stock] [int] IDENTITY(1,1) NOT NULL,
	[id_batch] [int] NULL,
	[id_stock] [int] NULL,
	[fecha_impacto] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_lote_stock] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [Relacion].[Lote_Stock] ON 

INSERT [Relacion].[Lote_Stock] ([id_lote_stock], [id_batch], [id_stock], [fecha_impacto]) VALUES (1, 1, 1, CAST(N'2023-03-14' AS Date))
INSERT [Relacion].[Lote_Stock] ([id_lote_stock], [id_batch], [id_stock], [fecha_impacto]) VALUES (2, 2, 2, CAST(N'2023-03-14' AS Date))
INSERT [Relacion].[Lote_Stock] ([id_lote_stock], [id_batch], [id_stock], [fecha_impacto]) VALUES (3, 3, 3, CAST(N'2023-03-14' AS Date))
INSERT [Relacion].[Lote_Stock] ([id_lote_stock], [id_batch], [id_stock], [fecha_impacto]) VALUES (4, 4, 4, CAST(N'2023-03-14' AS Date))
SET IDENTITY_INSERT [Relacion].[Lote_Stock] OFF
GO
