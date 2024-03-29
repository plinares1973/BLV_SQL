USE [BLV]
GO
/****** Object:  Table [Sistema].[Entidad_Bancaria]    Script Date: 6/7/2023 8:42:54 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Sistema].[Entidad_Bancaria](
	[id_banco] [int] IDENTITY(1,1) NOT NULL,
	[razon_social] [varchar](30) NULL,
	[mail] [varchar](40) NULL,
	[fax] [varchar](20) NULL,
	[telefono] [varchar](20) NULL,
	[domicilio] [varchar](40) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_banco] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
