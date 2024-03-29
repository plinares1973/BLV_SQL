USE [BLV]
GO
/****** Object:  Table [Compra].[orden_compra_insumo]    Script Date: 6/7/2023 8:42:53 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Compra].[orden_compra_insumo](
	[id_ocompra_insumo] [int] IDENTITY(1,1) NOT NULL,
	[marca] [varchar](50) NULL,
	[monto] [float] NULL,
	[cantidad] [int] NULL,
	[id_oc_insumo_header] [int] NULL,
	[id_stock_insumo] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_ocompra_insumo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [Compra].[orden_compra_insumo] ON 

INSERT [Compra].[orden_compra_insumo] ([id_ocompra_insumo], [marca], [monto], [cantidad], [id_oc_insumo_header], [id_stock_insumo]) VALUES (1, N'PAPELERA PIRULO', 100, 100, 1, 1)
SET IDENTITY_INSERT [Compra].[orden_compra_insumo] OFF
GO
