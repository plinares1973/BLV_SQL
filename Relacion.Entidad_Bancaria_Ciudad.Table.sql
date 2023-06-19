USE [BLV]
GO
/****** Object:  Table [Relacion].[Entidad_Bancaria_Ciudad]    Script Date: 19/6/2023 2:57:30 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Relacion].[Entidad_Bancaria_Ciudad](
	[id_entidad_bancaria_ciudad] [int] IDENTITY(1,1) NOT NULL,
	[id_banco] [int] NULL,
	[id_ciudad] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_entidad_bancaria_ciudad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
