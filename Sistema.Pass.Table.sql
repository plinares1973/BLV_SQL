USE [BLV]
GO
/****** Object:  Table [Sistema].[Pass]    Script Date: 6/7/2023 8:42:54 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Sistema].[Pass](
	[id_pass] [int] IDENTITY(1,1) NOT NULL,
	[clave] [varchar](20) NULL,
	[fecha_alta] [smalldatetime] NULL,
	[vigente] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_pass] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [Sistema].[Pass] ON 

INSERT [Sistema].[Pass] ([id_pass], [clave], [fecha_alta], [vigente]) VALUES (1, N'678910', CAST(N'2022-08-26T15:45:00' AS SmallDateTime), 0)
INSERT [Sistema].[Pass] ([id_pass], [clave], [fecha_alta], [vigente]) VALUES (2, N'1', CAST(N'2022-09-25T15:45:00' AS SmallDateTime), 1)
SET IDENTITY_INSERT [Sistema].[Pass] OFF
GO
