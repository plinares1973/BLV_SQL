USE [BLV]
GO
/****** Object:  Table [Relacion].[Lote_Producto]    Script Date: 6/7/2023 8:42:54 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Relacion].[Lote_Producto](
	[id_lote_producto] [int] IDENTITY(1,1) NOT NULL,
	[id_batch] [int] NULL,
	[id_producto] [int] NULL,
	[cantidad] [int] NULL,
	[id_medida] [int] NULL,
	[id_empaque] [int] NULL,
	[id_capacidad_envase] [int] NULL,
	[cuarentena] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_lote_producto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
