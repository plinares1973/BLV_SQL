USE [BLV]
GO
/****** Object:  Table [Relacion].[Medio_Pago_Cuenta]    Script Date: 19/6/2023 2:57:30 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Relacion].[Medio_Pago_Cuenta](
	[id_medio_pago_cuenta] [int] IDENTITY(1,1) NOT NULL,
	[id_medio_pago] [int] NULL,
	[id_cuenta] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_medio_pago_cuenta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
