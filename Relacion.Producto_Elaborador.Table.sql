USE [BLV]
GO
/****** Object:  Table [Relacion].[Producto_Elaborador]    Script Date: 14/3/2023 11:16:38 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Relacion].[Producto_Elaborador](
	[id_producto_elaborador] [int] IDENTITY(1,1) NOT NULL,
	[id_producto] [int] NULL,
	[id_elaborador] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_producto_elaborador] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
