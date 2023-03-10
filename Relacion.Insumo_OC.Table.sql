USE [BLV]
GO
/****** Object:  Table [Relacion].[Insumo_OC]    Script Date: 13/2/2023 8:26:07 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Relacion].[Insumo_OC](
	[id_rel_insumo_oc] [int] IDENTITY(1,1) NOT NULL,
	[id_stock_insumo] [int] NULL,
	[id_ocompra_insumo] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_rel_insumo_oc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [Relacion].[Insumo_OC] ON 

INSERT [Relacion].[Insumo_OC] ([id_rel_insumo_oc], [id_stock_insumo], [id_ocompra_insumo]) VALUES (1, 1, 1)
SET IDENTITY_INSERT [Relacion].[Insumo_OC] OFF
GO
