USE [BLV]
GO
/****** Object:  Table [Compra].[Lote]    Script Date: 5/7/2023 10:45:14 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Compra].[Lote](
	[id_batch] [int] IDENTITY(1,1) NOT NULL,
	[codigo_lote] [varchar](20) NULL,
	[codigo_producto] [varchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_batch] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [Compra].[Lote] ON 

INSERT [Compra].[Lote] ([id_batch], [codigo_lote], [codigo_producto]) VALUES (1, N'abc001001', N'CIT005')
INSERT [Compra].[Lote] ([id_batch], [codigo_lote], [codigo_producto]) VALUES (2, N'abc001002', N'CIT005')
INSERT [Compra].[Lote] ([id_batch], [codigo_lote], [codigo_producto]) VALUES (3, N'abc001003', N'3085')
SET IDENTITY_INSERT [Compra].[Lote] OFF
GO
