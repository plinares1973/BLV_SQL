USE [BLV]
GO
/****** Object:  Table [Sistema].[Cuenta]    Script Date: 6/7/2023 8:42:54 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Sistema].[Cuenta](
	[id_cuenta] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [varchar](30) NULL,
	[nro_cuenta] [varchar](10) NULL,
	[CBU] [varchar](22) NULL,
	[alias] [varchar](30) NULL,
	[id_banco] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_cuenta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Sistema].[Cuenta]  WITH CHECK ADD  CONSTRAINT [FK_Banco_Cuenta] FOREIGN KEY([id_banco])
REFERENCES [Sistema].[Entidad_Bancaria] ([id_banco])
GO
ALTER TABLE [Sistema].[Cuenta] CHECK CONSTRAINT [FK_Banco_Cuenta]
GO
