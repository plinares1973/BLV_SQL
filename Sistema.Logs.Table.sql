USE [BLV]
GO
/****** Object:  Table [Sistema].[Logs]    Script Date: 14/3/2023 11:16:38 a. m. ******/
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
