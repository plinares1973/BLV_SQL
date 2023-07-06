USE [BLV]
GO
/****** Object:  Table [Compra].[Certificado_COA]    Script Date: 5/7/2023 10:45:14 p. m. ******/
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
SET IDENTITY_INSERT [Compra].[Certificado_COA] ON 

INSERT [Compra].[Certificado_COA] ([id_certificado_coa], [certificado_coa], [fecha_certificado_coa], [id_ocompra_producto]) VALUES (1, N'DATA FIBRA DE CELULOSA - ALBAFIBRE C100.pdf', CAST(N'2023-07-05T20:38:00' AS SmallDateTime), 1)
INSERT [Compra].[Certificado_COA] ([id_certificado_coa], [certificado_coa], [fecha_certificado_coa], [id_ocompra_producto]) VALUES (2, N'Plan de trabajo 2022.pdf', CAST(N'2023-07-05T20:38:00' AS SmallDateTime), 2)
SET IDENTITY_INSERT [Compra].[Certificado_COA] OFF
GO
