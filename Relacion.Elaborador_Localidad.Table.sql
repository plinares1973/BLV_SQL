USE [BLV]
GO
/****** Object:  Table [Relacion].[Elaborador_Localidad]    Script Date: 14/3/2023 11:16:38 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Relacion].[Elaborador_Localidad](
	[id_elaborador_ciudad] [int] IDENTITY(1,1) NOT NULL,
	[id_elaborador] [int] NULL,
	[id_localidad] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_elaborador_ciudad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
