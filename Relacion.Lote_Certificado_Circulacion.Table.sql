USE [BLV]
GO
/****** Object:  Table [Relacion].[Lote_Certificado_Circulacion]    Script Date: 19/6/2023 2:57:30 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Relacion].[Lote_Certificado_Circulacion](
	[id_lote_certificado_circulacion] [int] IDENTITY(1,1) NOT NULL,
	[id_batch] [int] NULL,
	[id_certificado_circulacion] [int] NULL,
	[fecha_impacto] [smalldatetime] NULL
) ON [PRIMARY]
GO
