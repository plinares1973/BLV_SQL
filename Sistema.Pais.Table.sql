USE [BLV]
GO
/****** Object:  Table [Sistema].[Pais]    Script Date: 14/3/2023 11:16:38 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Sistema].[Pais](
	[id_pais] [int] NOT NULL,
	[nombre] [varchar](60) NULL,
	[prefijo_telefonico] [varchar](1) NULL,
	[iso] [varchar](5) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_pais] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (101, N'ALBANIA', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (102, N'AUSTRIA', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (103, N'BELGICA', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (104, N'BULGARIA', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (106, N'CHIPRE', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (107, N'DINAMARCA', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (108, N'ESPAÑA', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (109, N'FINLANDIA', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (110, N'FRANCIA', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (111, N'GRECIA', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (112, N'HUNGRIA', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (113, N'IRLANDA', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (114, N'ISLANDIA', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (115, N'ITALIA', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (116, N'LIECHTENSTEIN', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (117, N'LUXEMBURGO', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (118, N'MALTA', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (119, N'MONACO', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (120, N'NORUEGA', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (121, N'PAISES BAJOS', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (122, N'POLONIA', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (123, N'PORTUGAL', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (124, N'ANDORRA', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (125, N'REINO UNIDO', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (126, N'ALEMANIA', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (128, N'RUMANIA', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (129, N'SAN MARINO', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (130, N'SANTA SEDE', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (131, N'SUECIA', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (132, N'SUIZA', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (135, N'UCRANIA', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (136, N'LETONIA', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (137, N'MOLDAVIA', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (138, N'BELARUS', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (139, N'GEORGIA', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (141, N'ESTONIA', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (142, N'LITUANIA', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (143, N'REPUBLICA CHECA', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (144, N'REPUBLICA ESLOVACA', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (145, N'BOSNIA Y HERZEGOVINA', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (146, N'CROACIA', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (147, N'ESLOVENIA', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (148, N'ARMENIA', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (154, N'RUSIA', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (156, N'MACEDONIA', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (157, N'SERBIA', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (158, N'MONTENEGRO', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (170, N'GUERNESEY', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (171, N'SVALBARD Y JAN MAYEN', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (172, N'ISLAS FEROE', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (173, N'ISLA DE MAN', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (174, N'GIBRALTAR', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (175, N'ISLAS DEL CANAL', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (176, N'JERSEY', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (177, N'ISLAS ALAND', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (198, N'OTROS PAISES O TERRITORIOS DE LA UNION EUROPEA', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (199, N'OTROS PAISES O TERRITORIOS DEL RESTO DE EUROPA', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (201, N'BURKINA FASO', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (202, N'ANGOLA', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (203, N'ARGELIA', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (204, N'BENIN', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (205, N'BOTSWANA', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (206, N'BURUNDI', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (207, N'CABO VERDE', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (208, N'CAMERUN', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (209, N'COMORES', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (210, N'CONGO', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (211, N'COSTA DE MARFIL', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (212, N'DJIBOUTI', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (213, N'EGIPTO', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (214, N'ETIOPIA', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (215, N'GABON', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (216, N'GAMBIA', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (217, N'GHANA', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (218, N'GUINEA', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (219, N'GUINEA-BISSAU', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (220, N'GUINEA ECUATORIAL', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (221, N'KENIA', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (222, N'LESOTHO', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (223, N'LIBERIA', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (224, N'LIBIA', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (225, N'MADAGASCAR', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (226, N'MALAWI', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (227, N'MALI', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (228, N'MARRUECOS', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (229, N'MAURICIO', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (230, N'MAURITANIA', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (231, N'MOZAMBIQUE', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (232, N'NAMIBIA', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (233, N'NIGER', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (234, N'NIGERIA', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (235, N'REPUBLICA CENTROAFRICANA', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (236, N'SUDAFRICA', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (237, N'RUANDA', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (238, N'SANTO TOME Y PRINCIPE', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (239, N'SENEGAL', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (240, N'SEYCHELLES', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (241, N'SIERRA LEONA', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (242, N'SOMALIA', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (243, N'SUDAN', NULL, NULL)
GO
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (244, N'SWAZILANDIA', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (245, N'TANZANIA', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (246, N'CHAD', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (247, N'TOGO', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (248, N'TUNEZ', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (249, N'UGANDA', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (250, N'REP.DEMOCRATICA DEL CONGO', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (251, N'ZAMBIA', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (252, N'ZIMBABWE', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (253, N'ERITREA', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (260, N'SANTA HELENA', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (261, N'REUNION', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (262, N'MAYOTTE', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (263, N'SAHARA OCCIDENTAL', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (299, N'OTROS PAISES O TERRITORIOS DE AFRICA', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (301, N'CANADA', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (302, N'ESTADOS UNIDOS DE AMERICA', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (303, N'MEXICO', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (310, N'ANTIGUA Y BARBUDA', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (311, N'BAHAMAS', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (312, N'BARBADOS', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (313, N'BELICE', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (314, N'COSTA RICA', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (315, N'CUBA', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (316, N'DOMINICA', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (317, N'EL SALVADOR', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (318, N'GRANADA', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (319, N'GUATEMALA', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (320, N'HAITI', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (321, N'HONDURAS', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (322, N'JAMAICA', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (323, N'NICARAGUA', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (324, N'PANAMA', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (325, N'SAN VICENTE Y LAS GRANADINAS', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (326, N'REPUBLICA DOMINICANA', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (327, N'TRINIDAD Y TOBAGO', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (328, N'SANTA LUCIA', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (329, N'SAN CRISTOBAL Y NIEVES', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (340, N'ARGENTINA', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (341, N'BOLIVIA', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (342, N'BRASIL', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (343, N'COLOMBIA', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (344, N'CHILE', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (345, N'ECUADOR', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (346, N'GUYANA', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (347, N'PARAGUAY', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (348, N'PERU', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (349, N'SURINAM', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (350, N'URUGUAY', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (351, N'VENEZUELA', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (370, N'SAN PEDRO Y MIQUELON', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (371, N'GROENLANDIA', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (380, N'ISLAS CAIMÁN', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (381, N'ISLAS TURCAS Y CAICOS', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (382, N'ISLAS VÍRGENES DE LOS ESTADOS UNIDOS', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (383, N'GUADALUPE', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (384, N'ANTILLAS HOLANDESAS', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (385, N'SAN MARTIN (PARTE FRANCESA)', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (386, N'ARUBA', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (387, N'MONTSERRAT', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (388, N'ANGUILLA', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (389, N'SAN BARTOLOME', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (390, N'MARTINICA', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (391, N'PUERTO RICO', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (392, N'BERMUDAS', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (393, N'ISLAS VIRGENES BRITANICAS', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (394, N'GUAYANA FRANCESA', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (395, N'ISLAS MALVINAS', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (396, N'OTROS PAISES  O TERRITORIOS DE AMERICA DEL NORTE', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (398, N'OTROS PAISES O TERRITORIOS DEL CARIBE Y AMERICA CENTRAL', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (399, N'OTROS PAISES O TERRITORIOS  DE SUDAMERICA', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (401, N'AFGANISTAN', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (402, N'ARABIA SAUDI', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (403, N'BAHREIN', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (404, N'BANGLADESH', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (405, N'MYANMAR', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (407, N'CHINA', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (408, N'EMIRATOS ARABES UNIDOS', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (409, N'FILIPINAS', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (410, N'INDIA', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (411, N'INDONESIA', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (412, N'IRAQ', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (413, N'IRAN', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (414, N'ISRAEL', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (415, N'JAPON', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (416, N'JORDANIA', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (417, N'CAMBOYA', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (418, N'KUWAIT', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (419, N'LAOS', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (420, N'LIBANO', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (421, N'MALASIA', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (422, N'MALDIVAS', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (423, N'MONGOLIA', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (424, N'NEPAL', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (425, N'OMAN', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (426, N'PAKISTAN', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (427, N'QATAR', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (430, N'COREA', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (431, N'COREA DEL NORTE', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (432, N'SINGAPUR', NULL, NULL)
GO
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (433, N'SIRIA', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (434, N'SRI LANKA', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (435, N'TAILANDIA', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (436, N'TURQUIA', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (437, N'VIETNAM', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (439, N'BRUNEI', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (440, N'ISLAS MARSHALL', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (441, N'YEMEN', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (442, N'AZERBAIYAN', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (443, N'KAZAJSTAN', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (444, N'KIRGUISTAN', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (445, N'TADYIKISTAN', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (446, N'TURKMENISTAN', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (447, N'UZBEKISTAN', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (448, N'ISLAS MARIANAS DEL NORTE', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (449, N'PALESTINA', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (450, N'HONG KONG', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (453, N'BHUTÁN', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (454, N'GUAM', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (455, N'MACAO', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (499, N'OTROS PAISES O TERRITORIOS DE ASIA', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (501, N'AUSTRALIA', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (502, N'FIJI', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (504, N'NUEVA ZELANDA', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (505, N'PAPUA NUEVA GUINEA', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (506, N'ISLAS SALOMON', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (507, N'SAMOA', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (508, N'TONGA', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (509, N'VANUATU', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (511, N'MICRONESIA', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (512, N'TUVALU', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (513, N'ISLAS COOK', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (515, N'NAURU', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (516, N'PALAOS', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (517, N'TIMOR ORIENTAL', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (520, N'POLINESIA FRANCESA', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (521, N'ISLA NORFOLK', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (522, N'KIRIBATI', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (523, N'NIUE', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (524, N'ISLAS PITCAIRN', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (525, N'TOKELAU', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (526, N'NUEVA CALEDONIA', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (527, N'WALLIS Y FORTUNA', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (528, N'SAMOA AMERICANA', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (599, N'OTROS PAISES O TERRITORIOS DE OCEANIA', NULL, NULL)
GO
