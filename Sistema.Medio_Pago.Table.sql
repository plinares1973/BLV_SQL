USE [BLV]
GO
/****** Object:  Table [Sistema].[Medio_Pago]    Script Date: 6/7/2023 8:42:54 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Sistema].[Medio_Pago](
	[id_medio_pago] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [varchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_medio_pago] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [Sistema].[Medio_Pago] ON 

INSERT [Sistema].[Medio_Pago] ([id_medio_pago], [descripcion]) VALUES (1, N'TRANSEFERENCIA BANCARIA')
INSERT [Sistema].[Medio_Pago] ([id_medio_pago], [descripcion]) VALUES (2, N'CHEQUE DIFERIDO')
INSERT [Sistema].[Medio_Pago] ([id_medio_pago], [descripcion]) VALUES (3, N'CHEQUE DIGITAL')
INSERT [Sistema].[Medio_Pago] ([id_medio_pago], [descripcion]) VALUES (4, N'EFECTIVO')
SET IDENTITY_INSERT [Sistema].[Medio_Pago] OFF
GO
