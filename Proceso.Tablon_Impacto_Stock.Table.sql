USE [BLV]
GO
/****** Object:  Table [Proceso].[Tablon_Impacto_Stock]    Script Date: 17/5/2023 1:14:13 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Proceso].[Tablon_Impacto_Stock](
	[id_tablon_impacto_stock] [int] IDENTITY(1,1) NOT NULL,
	[id_compra] [int] NULL,
	[numero_importacion] [nvarchar](50) NULL,
	[certificado_libre_circulacion] [nvarchar](255) NULL,
	[fecha_certificado_libre_circulacion] [date] NULL,
	[id_lote] [int] NULL,
	[codigo_producto] [varchar](10) NULL,
	[marca] [varchar](50) NULL,
	[cantidad] [int] NULL,
	[certificado_coa] [nvarchar](255) NULL,
	[fecha_elaboracion] [smalldatetime] NULL,
	[fecha_vencimiento] [smalldatetime] NULL,
	[posiciones_deposito] [int] NULL
) ON [PRIMARY]
GO
