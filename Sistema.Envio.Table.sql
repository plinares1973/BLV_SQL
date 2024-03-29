USE [BLV]
GO
/****** Object:  Table [Sistema].[Envio]    Script Date: 6/7/2023 8:42:54 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Sistema].[Envio](
	[id_envio] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [varchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_envio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [Sistema].[Envio] ON 

INSERT [Sistema].[Envio] ([id_envio], [descripcion]) VALUES (1, N'MARITIMO')
INSERT [Sistema].[Envio] ([id_envio], [descripcion]) VALUES (2, N'AEREO')
INSERT [Sistema].[Envio] ([id_envio], [descripcion]) VALUES (3, N'TERRESTRE')
SET IDENTITY_INSERT [Sistema].[Envio] OFF
GO
