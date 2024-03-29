USE [BLV]
GO
/****** Object:  Table [Relacion].[Stock_Cuarentena]    Script Date: 6/7/2023 8:42:54 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Relacion].[Stock_Cuarentena](
	[id_stock_cuarentena] [int] IDENTITY(1,1) NOT NULL,
	[id_lote_producto] [int] NULL,
	[id_stock] [int] NULL,
	[id_batch] [int] NOT NULL,
	[fecha_impacto] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_stock_cuarentena] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
