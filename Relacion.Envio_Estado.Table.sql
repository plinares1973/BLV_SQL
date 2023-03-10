USE [BLV]
GO
/****** Object:  Table [Relacion].[Envio_Estado]    Script Date: 14/3/2023 11:16:38 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Relacion].[Envio_Estado](
	[id_envio_estado] [int] IDENTITY(1,1) NOT NULL,
	[id_envio] [int] NULL,
	[id_estado] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_envio_estado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
