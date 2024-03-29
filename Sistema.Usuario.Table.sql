USE [BLV]
GO
/****** Object:  Table [Sistema].[Usuario]    Script Date: 6/7/2023 8:42:54 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Sistema].[Usuario](
	[id_usuario] [int] IDENTITY(1,1) NOT NULL,
	[usuario] [varchar](20) NULL,
	[apellido] [varchar](20) NULL,
	[nombre] [varchar](30) NULL,
	[domicilio] [varchar](40) NULL,
	[telefono] [varchar](20) NULL,
	[dni] [varchar](20) NULL,
	[mail] [varchar](40) NULL,
	[fecha_alta] [smalldatetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_usuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [Sistema].[Usuario] ON 

INSERT [Sistema].[Usuario] ([id_usuario], [usuario], [apellido], [nombre], [domicilio], [telefono], [dni], [mail], [fecha_alta]) VALUES (1, N'plinares', N'LINARES', N'PABLO', N'TRES ARROYOS 3485', N'1159582428', N'23515692', N'plinares1973@gmail.com', CAST(N'2022-09-25T15:43:00' AS SmallDateTime))
SET IDENTITY_INSERT [Sistema].[Usuario] OFF
GO
