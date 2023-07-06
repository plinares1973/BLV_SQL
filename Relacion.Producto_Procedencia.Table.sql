USE [BLV]
GO
/****** Object:  Table [Relacion].[Producto_Procedencia]    Script Date: 6/7/2023 8:42:54 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Relacion].[Producto_Procedencia](
	[id_producto_procedencia] [int] IDENTITY(1,1) NOT NULL,
	[id_producto] [int] NULL,
	[id_procedencia] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_producto_procedencia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
