USE [BLV]
GO
/****** Object:  Table [Relacion].[Costo_oc]    Script Date: 6/7/2023 8:42:53 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Relacion].[Costo_oc](
	[id_costo_oc] [int] IDENTITY(1,1) NOT NULL,
	[id_concepto] [int] NULL,
	[id_orden_compra] [int] NULL,
	[monto] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_costo_oc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
