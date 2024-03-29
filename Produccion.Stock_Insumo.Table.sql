USE [BLV]
GO
/****** Object:  Table [Produccion].[Stock_Insumo]    Script Date: 6/7/2023 8:42:53 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Produccion].[Stock_Insumo](
	[id_stock_insumo] [int] IDENTITY(1,1) NOT NULL,
	[id_empaque] [int] NULL,
	[id_medida] [int] NULL,
	[cantidad] [int] NULL,
	[id_capacidad] [int] NULL,
	[marca] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_stock_insumo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [Produccion].[Stock_Insumo] ON 

INSERT [Produccion].[Stock_Insumo] ([id_stock_insumo], [id_empaque], [id_medida], [cantidad], [id_capacidad], [marca]) VALUES (1, 1, 1, 72, 1, N'PAPELERA PIRULO')
INSERT [Produccion].[Stock_Insumo] ([id_stock_insumo], [id_empaque], [id_medida], [cantidad], [id_capacidad], [marca]) VALUES (2, 1, 1, 200, 1, N'PAPELERA EL PAPELON')
SET IDENTITY_INSERT [Produccion].[Stock_Insumo] OFF
GO
