USE [BLV]
GO
/****** Object:  Table [Compra].[Certificado_COA]    Script Date: 6/7/2023 8:42:53 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Compra].[Certificado_COA](
	[id_certificado_coa] [int] IDENTITY(1,1) NOT NULL,
	[certificado_coa] [nvarchar](255) NULL,
	[fecha_certificado_coa] [smalldatetime] NULL,
	[id_ocompra_producto] [int] NULL
) ON [PRIMARY]
GO
