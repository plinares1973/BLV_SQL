USE [BLV]
GO
/****** Object:  Table [Relacion].[Venta_Envio]    Script Date: 14/3/2023 11:16:38 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Relacion].[Venta_Envio](
	[id_venta_envio] [int] IDENTITY(1,1) NOT NULL,
	[id_venta] [int] NULL,
	[id_envio] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_venta_envio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
