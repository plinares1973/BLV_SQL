USE [BLV]
GO
/****** Object:  Table [Compra].[Lote]    Script Date: 21/3/2023 9:13:34 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Compra].[Lote](
	[id_batch] [int] IDENTITY(1,1) NOT NULL,
	[codigo_lote] [varchar](10) NULL,
	[coa] [binary](1) NULL,
	[certificado_analisis] [varchar](20) NULL,
	[fecha_certificado_analisis] [smalldatetime] NULL,
	[certificado_circulacion] [varchar](20) NULL,
	[fecha_certificado_circulacion] [smalldatetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_batch] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
