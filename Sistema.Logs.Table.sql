USE [BLV]
GO
/****** Object:  Table [Sistema].[Logs]    Script Date: 17/5/2023 9:15:21 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Sistema].[Logs](
	[id_log] [int] IDENTITY(1,1) NOT NULL,
	[fecha] [smalldatetime] NULL,
	[hora] [smalldatetime] NULL,
	[duracion] [int] NULL,
	[id_acceso] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_log] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
