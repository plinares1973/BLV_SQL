USE [BLV]
GO
/****** Object:  Table [Sistema].[Continente]    Script Date: 6/7/2023 8:42:53 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Sistema].[Continente](
	[id_continente] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](40) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_continente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [Sistema].[Continente] ON 

INSERT [Sistema].[Continente] ([id_continente], [nombre]) VALUES (1, N'UNIÓN EUROPEA')
INSERT [Sistema].[Continente] ([id_continente], [nombre]) VALUES (2, N'RESTO DE EUROPA')
INSERT [Sistema].[Continente] ([id_continente], [nombre]) VALUES (3, N'AFRICA')
INSERT [Sistema].[Continente] ([id_continente], [nombre]) VALUES (4, N'AMERICA DEL NORTE')
INSERT [Sistema].[Continente] ([id_continente], [nombre]) VALUES (5, N'CENTRO AMERICA Y CARIBE')
INSERT [Sistema].[Continente] ([id_continente], [nombre]) VALUES (6, N'SUDAMERICA')
INSERT [Sistema].[Continente] ([id_continente], [nombre]) VALUES (7, N'ASIA')
INSERT [Sistema].[Continente] ([id_continente], [nombre]) VALUES (8, N'OCEANÍA')
SET IDENTITY_INSERT [Sistema].[Continente] OFF
GO
