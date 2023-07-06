USE [BLV]
GO
/****** Object:  Table [Relacion].[Producto_Importador]    Script Date: 5/7/2023 10:45:14 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Relacion].[Producto_Importador](
	[id_producto_importador] [int] IDENTITY(1,1) NOT NULL,
	[id_producto] [int] NULL,
	[id_importador] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_producto_importador] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
