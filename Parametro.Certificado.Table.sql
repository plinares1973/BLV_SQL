USE [BLV]
GO
/****** Object:  Table [Parametro].[Certificado]    Script Date: 6/7/2023 8:42:53 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Parametro].[Certificado](
	[id_certificado] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_certificado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [Parametro].[Certificado] ON 

INSERT [Parametro].[Certificado] ([id_certificado], [nombre]) VALUES (1, N'MSDS')
INSERT [Parametro].[Certificado] ([id_certificado], [nombre]) VALUES (2, N'LIBRE CIRCULACION')
INSERT [Parametro].[Certificado] ([id_certificado], [nombre]) VALUES (3, N'RNPA')
INSERT [Parametro].[Certificado] ([id_certificado], [nombre]) VALUES (4, N'COA')
SET IDENTITY_INSERT [Parametro].[Certificado] OFF
GO
