USE [BLV]
GO
/****** Object:  Table [Relacion].[Hoja_Fab_Estado]    Script Date: 14/4/2023 12:48:02 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Relacion].[Hoja_Fab_Estado](
	[id_hoja_fab_estado] [int] IDENTITY(1,1) NOT NULL,
	[id_hoja_fabrica] [int] NULL,
	[id_estado] [int] NULL,
	[fecha] [smalldatetime] NULL,
	[vigente] [bit] NULL
) ON [PRIMARY]
GO
