USE [BLV]
GO
/****** Object:  Table [Relacion].[Usuario_Pass]    Script Date: 6/7/2023 8:42:54 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Relacion].[Usuario_Pass](
	[id_usuario_pass] [int] IDENTITY(1,1) NOT NULL,
	[id_usuario] [int] NULL,
	[id_pass] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_usuario_pass] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [Relacion].[Usuario_Pass] ON 

INSERT [Relacion].[Usuario_Pass] ([id_usuario_pass], [id_usuario], [id_pass]) VALUES (1, 1, 1)
INSERT [Relacion].[Usuario_Pass] ([id_usuario_pass], [id_usuario], [id_pass]) VALUES (2, 1, 2)
SET IDENTITY_INSERT [Relacion].[Usuario_Pass] OFF
GO
