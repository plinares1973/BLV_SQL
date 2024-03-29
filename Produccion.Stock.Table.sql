USE [BLV]
GO
/****** Object:  Table [Produccion].[Stock]    Script Date: 6/7/2023 8:42:53 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Produccion].[Stock](
	[id_stock] [int] IDENTITY(1,1) NOT NULL,
	[piso] [int] NULL,
	[posicion] [int] NULL,
	[altura] [int] NULL,
	[fila] [int] NULL,
	[codigo_barra] [binary](1) NULL,
	[disponible] [bit] NULL,
	[cuarentena] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_stock] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [Produccion].[Stock] ON 

INSERT [Produccion].[Stock] ([id_stock], [piso], [posicion], [altura], [fila], [codigo_barra], [disponible], [cuarentena]) VALUES (1, 1, 1, 1, 1, NULL, 1, 0)
INSERT [Produccion].[Stock] ([id_stock], [piso], [posicion], [altura], [fila], [codigo_barra], [disponible], [cuarentena]) VALUES (2, 1, 1, 1, 2, NULL, 1, 0)
INSERT [Produccion].[Stock] ([id_stock], [piso], [posicion], [altura], [fila], [codigo_barra], [disponible], [cuarentena]) VALUES (3, 1, 1, 1, 3, NULL, 1, 0)
INSERT [Produccion].[Stock] ([id_stock], [piso], [posicion], [altura], [fila], [codigo_barra], [disponible], [cuarentena]) VALUES (4, 1, 1, 1, 4, NULL, 1, 0)
INSERT [Produccion].[Stock] ([id_stock], [piso], [posicion], [altura], [fila], [codigo_barra], [disponible], [cuarentena]) VALUES (5, 1, 1, 1, 5, NULL, 1, 0)
INSERT [Produccion].[Stock] ([id_stock], [piso], [posicion], [altura], [fila], [codigo_barra], [disponible], [cuarentena]) VALUES (6, 1, 1, 2, 1, NULL, 1, 0)
INSERT [Produccion].[Stock] ([id_stock], [piso], [posicion], [altura], [fila], [codigo_barra], [disponible], [cuarentena]) VALUES (7, 1, 1, 2, 2, NULL, 1, 0)
INSERT [Produccion].[Stock] ([id_stock], [piso], [posicion], [altura], [fila], [codigo_barra], [disponible], [cuarentena]) VALUES (8, 1, 1, 2, 3, NULL, 1, 0)
INSERT [Produccion].[Stock] ([id_stock], [piso], [posicion], [altura], [fila], [codigo_barra], [disponible], [cuarentena]) VALUES (9, 1, 1, 2, 4, NULL, 1, 1)
INSERT [Produccion].[Stock] ([id_stock], [piso], [posicion], [altura], [fila], [codigo_barra], [disponible], [cuarentena]) VALUES (10, 1, 1, 2, 5, NULL, 1, 1)
INSERT [Produccion].[Stock] ([id_stock], [piso], [posicion], [altura], [fila], [codigo_barra], [disponible], [cuarentena]) VALUES (11, 1, 1, 1, 1, NULL, 1, 0)
INSERT [Produccion].[Stock] ([id_stock], [piso], [posicion], [altura], [fila], [codigo_barra], [disponible], [cuarentena]) VALUES (12, 1, 1, 1, 2, NULL, 1, 0)
INSERT [Produccion].[Stock] ([id_stock], [piso], [posicion], [altura], [fila], [codigo_barra], [disponible], [cuarentena]) VALUES (13, 1, 1, 1, 3, NULL, 1, 0)
INSERT [Produccion].[Stock] ([id_stock], [piso], [posicion], [altura], [fila], [codigo_barra], [disponible], [cuarentena]) VALUES (14, 2, 1, 1, 2, NULL, 1, 0)
INSERT [Produccion].[Stock] ([id_stock], [piso], [posicion], [altura], [fila], [codigo_barra], [disponible], [cuarentena]) VALUES (15, 2, 1, 1, 3, NULL, 1, 0)
INSERT [Produccion].[Stock] ([id_stock], [piso], [posicion], [altura], [fila], [codigo_barra], [disponible], [cuarentena]) VALUES (16, 2, 1, 1, 4, NULL, 1, 0)
INSERT [Produccion].[Stock] ([id_stock], [piso], [posicion], [altura], [fila], [codigo_barra], [disponible], [cuarentena]) VALUES (17, 2, 1, 1, 5, NULL, 1, 0)
INSERT [Produccion].[Stock] ([id_stock], [piso], [posicion], [altura], [fila], [codigo_barra], [disponible], [cuarentena]) VALUES (18, 2, 1, 2, 1, NULL, 1, 1)
INSERT [Produccion].[Stock] ([id_stock], [piso], [posicion], [altura], [fila], [codigo_barra], [disponible], [cuarentena]) VALUES (19, 2, 1, 2, 2, NULL, 1, 1)
SET IDENTITY_INSERT [Produccion].[Stock] OFF
GO
