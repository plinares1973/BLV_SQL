USE [BLV]
GO
/****** Object:  Table [Relacion].[Lote_Stock]    Script Date: 20/4/2023 12:37:59 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Relacion].[Lote_Stock](
	[id_lote_stock] [int] IDENTITY(1,1) NOT NULL,
	[id_batch] [int] NULL,
	[id_stock] [int] NULL,
	[fecha_impacto] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_lote_stock] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
