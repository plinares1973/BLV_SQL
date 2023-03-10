USE [BLV]
GO
/****** Object:  Table [Proceso].[Hoja_Fabricacion]    Script Date: 14/3/2023 11:16:38 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Proceso].[Hoja_Fabricacion](
	[id_proceso_hf] [int] IDENTITY(1,1) NOT NULL,
	[id_hoja_fabrica] [int] NULL,
	[id_producto] [int] NULL,
	[cantidad] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_proceso_hf] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [Proceso].[Hoja_Fabricacion] ON 

INSERT [Proceso].[Hoja_Fabricacion] ([id_proceso_hf], [id_hoja_fabrica], [id_producto], [cantidad]) VALUES (1, 2, NULL, 50)
INSERT [Proceso].[Hoja_Fabricacion] ([id_proceso_hf], [id_hoja_fabrica], [id_producto], [cantidad]) VALUES (2, 3, 6, 130)
INSERT [Proceso].[Hoja_Fabricacion] ([id_proceso_hf], [id_hoja_fabrica], [id_producto], [cantidad]) VALUES (3, 3, NULL, 70)
SET IDENTITY_INSERT [Proceso].[Hoja_Fabricacion] OFF
GO
