USE [BLV]
GO
/****** Object:  Table [Sistema].[Estado]    Script Date: 6/7/2023 8:42:54 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Sistema].[Estado](
	[id_estado] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_estado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [Sistema].[Estado] ON 

INSERT [Sistema].[Estado] ([id_estado], [descripcion]) VALUES (0, N'OC Abierta')
INSERT [Sistema].[Estado] ([id_estado], [descripcion]) VALUES (1, N'Solicitado')
INSERT [Sistema].[Estado] ([id_estado], [descripcion]) VALUES (2, N'En transito')
INSERT [Sistema].[Estado] ([id_estado], [descripcion]) VALUES (3, N'Arribado')
INSERT [Sistema].[Estado] ([id_estado], [descripcion]) VALUES (4, N'En Stock')
SET IDENTITY_INSERT [Sistema].[Estado] OFF
GO
