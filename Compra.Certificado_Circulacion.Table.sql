USE [BLV]
GO
/****** Object:  Table [Compra].[Certificado_Circulacion]    Script Date: 17/5/2023 1:14:13 a. m. ******/
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
