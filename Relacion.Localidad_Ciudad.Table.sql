USE [BLV]
GO
/****** Object:  Table [Relacion].[Localidad_Ciudad]    Script Date: 14/3/2023 11:16:38 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Relacion].[Localidad_Ciudad](
	[id_localidad_ciudad] [int] IDENTITY(1,1) NOT NULL,
	[id_localidad] [int] NULL,
	[id_ciudad] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_localidad_ciudad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
