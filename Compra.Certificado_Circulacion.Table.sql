USE [BLV]
GO
/****** Object:  Table [Compra].[Certificado_Circulacion]    Script Date: 19/6/2023 2:57:30 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Compra].[Certificado_Circulacion](
	[id_certificado_circulacion] [int] IDENTITY(1,1) NOT NULL,
	[certificado_circulacion] [nvarchar](255) NULL,
	[fecha_certificado_circulacion] [smalldatetime] NULL
) ON [PRIMARY]
GO
