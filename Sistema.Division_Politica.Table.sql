USE [BLV]
GO
/****** Object:  Table [Sistema].[Division_Politica]    Script Date: 22/3/2023 11:18:49 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Sistema].[Division_Politica](
	[id_division_politica] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](70) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_division_politica] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [Sistema].[Division_Politica] ON 

INSERT [Sistema].[Division_Politica] ([id_division_politica], [nombre]) VALUES (1, N'BIZKAIA')
INSERT [Sistema].[Division_Politica] ([id_division_politica], [nombre]) VALUES (2, N'ASTURIAS')
INSERT [Sistema].[Division_Politica] ([id_division_politica], [nombre]) VALUES (3, N'LAS PALMAS')
INSERT [Sistema].[Division_Politica] ([id_division_politica], [nombre]) VALUES (4, N'PONTEVEDRA')
INSERT [Sistema].[Division_Politica] ([id_division_politica], [nombre]) VALUES (5, N'JAÉN')
INSERT [Sistema].[Division_Politica] ([id_division_politica], [nombre]) VALUES (6, N'GUADALAJARA')
INSERT [Sistema].[Division_Politica] ([id_division_politica], [nombre]) VALUES (7, N'ILLES BALEARS')
INSERT [Sistema].[Division_Politica] ([id_division_politica], [nombre]) VALUES (8, N'NAVARRA')
INSERT [Sistema].[Division_Politica] ([id_division_politica], [nombre]) VALUES (9, N'GRANADA')
INSERT [Sistema].[Division_Politica] ([id_division_politica], [nombre]) VALUES (10, N'LA RIOJA')
INSERT [Sistema].[Division_Politica] ([id_division_politica], [nombre]) VALUES (11, N'A CORUÑA')
INSERT [Sistema].[Division_Politica] ([id_division_politica], [nombre]) VALUES (12, N'TERUEL')
INSERT [Sistema].[Division_Politica] ([id_division_politica], [nombre]) VALUES (13, N'ZARAGOZA')
INSERT [Sistema].[Division_Politica] ([id_division_politica], [nombre]) VALUES (14, N'BADAJOZ')
INSERT [Sistema].[Division_Politica] ([id_division_politica], [nombre]) VALUES (15, N'HUESCA')
INSERT [Sistema].[Division_Politica] ([id_division_politica], [nombre]) VALUES (16, N'ARABA')
INSERT [Sistema].[Division_Politica] ([id_division_politica], [nombre]) VALUES (17, N'GIRONA')
INSERT [Sistema].[Division_Politica] ([id_division_politica], [nombre]) VALUES (18, N'ALACANT')
INSERT [Sistema].[Division_Politica] ([id_division_politica], [nombre]) VALUES (19, N'MURCIA')
INSERT [Sistema].[Division_Politica] ([id_division_politica], [nombre]) VALUES (20, N'SEGOVIA')
INSERT [Sistema].[Division_Politica] ([id_division_politica], [nombre]) VALUES (21, N'ZAMORA')
INSERT [Sistema].[Division_Politica] ([id_division_politica], [nombre]) VALUES (22, N'PALENCIA')
INSERT [Sistema].[Division_Politica] ([id_division_politica], [nombre]) VALUES (23, N'ALBACETE')
INSERT [Sistema].[Division_Politica] ([id_division_politica], [nombre]) VALUES (24, N'CÁCERES')
INSERT [Sistema].[Division_Politica] ([id_division_politica], [nombre]) VALUES (25, N'CIUDAD REAL')
INSERT [Sistema].[Division_Politica] ([id_division_politica], [nombre]) VALUES (26, N'LLEIDA')
INSERT [Sistema].[Division_Politica] ([id_division_politica], [nombre]) VALUES (27, N'MÁLAGA')
INSERT [Sistema].[Division_Politica] ([id_division_politica], [nombre]) VALUES (28, N'LUGO')
INSERT [Sistema].[Division_Politica] ([id_division_politica], [nombre]) VALUES (29, N'BARCELONA')
INSERT [Sistema].[Division_Politica] ([id_division_politica], [nombre]) VALUES (30, N'CUENCA')
INSERT [Sistema].[Division_Politica] ([id_division_politica], [nombre]) VALUES (31, N'SORIA')
INSERT [Sistema].[Division_Politica] ([id_division_politica], [nombre]) VALUES (32, N'TOLEDO')
INSERT [Sistema].[Division_Politica] ([id_division_politica], [nombre]) VALUES (33, N'CASTELLÓ')
INSERT [Sistema].[Division_Politica] ([id_division_politica], [nombre]) VALUES (34, N'HUELVA')
INSERT [Sistema].[Division_Politica] ([id_division_politica], [nombre]) VALUES (35, N'SANTA CRUZ DE TENERIFE')
INSERT [Sistema].[Division_Politica] ([id_division_politica], [nombre]) VALUES (36, N'OURENSE')
INSERT [Sistema].[Division_Politica] ([id_division_politica], [nombre]) VALUES (37, N'TARRAGONA')
INSERT [Sistema].[Division_Politica] ([id_division_politica], [nombre]) VALUES (38, N'ALMERÍA')
INSERT [Sistema].[Division_Politica] ([id_division_politica], [nombre]) VALUES (39, N'CÓRDOBA')
INSERT [Sistema].[Division_Politica] ([id_division_politica], [nombre]) VALUES (40, N'LEÓN')
INSERT [Sistema].[Division_Politica] ([id_division_politica], [nombre]) VALUES (41, N'BURGOS')
INSERT [Sistema].[Division_Politica] ([id_division_politica], [nombre]) VALUES (42, N'GIPUZCOA')
INSERT [Sistema].[Division_Politica] ([id_division_politica], [nombre]) VALUES (43, N'SALAMANCA')
INSERT [Sistema].[Division_Politica] ([id_division_politica], [nombre]) VALUES (44, N'MELILLA')
INSERT [Sistema].[Division_Politica] ([id_division_politica], [nombre]) VALUES (45, N'SEVILLA')
INSERT [Sistema].[Division_Politica] ([id_division_politica], [nombre]) VALUES (46, N'VALLADOLID')
INSERT [Sistema].[Division_Politica] ([id_division_politica], [nombre]) VALUES (47, N'CEUTA')
INSERT [Sistema].[Division_Politica] ([id_division_politica], [nombre]) VALUES (48, N'BUENOS AIRES')
INSERT [Sistema].[Division_Politica] ([id_division_politica], [nombre]) VALUES (49, N'CIUDAD AUTÓNOMA DE BUENOS AIRES')
INSERT [Sistema].[Division_Politica] ([id_division_politica], [nombre]) VALUES (50, N'CATAMARCA')
INSERT [Sistema].[Division_Politica] ([id_division_politica], [nombre]) VALUES (51, N'CHACO')
INSERT [Sistema].[Division_Politica] ([id_division_politica], [nombre]) VALUES (52, N'CHUBUT')
INSERT [Sistema].[Division_Politica] ([id_division_politica], [nombre]) VALUES (53, N'CÓRDOBA')
INSERT [Sistema].[Division_Politica] ([id_division_politica], [nombre]) VALUES (54, N'CORRIENTES')
INSERT [Sistema].[Division_Politica] ([id_division_politica], [nombre]) VALUES (55, N'ENTRE RÍOS')
INSERT [Sistema].[Division_Politica] ([id_division_politica], [nombre]) VALUES (56, N'FORMOSA')
INSERT [Sistema].[Division_Politica] ([id_division_politica], [nombre]) VALUES (57, N'JUJUY')
INSERT [Sistema].[Division_Politica] ([id_division_politica], [nombre]) VALUES (58, N'LA PAMPA')
INSERT [Sistema].[Division_Politica] ([id_division_politica], [nombre]) VALUES (59, N'LA RIOJA')
INSERT [Sistema].[Division_Politica] ([id_division_politica], [nombre]) VALUES (60, N'MENDOZA')
INSERT [Sistema].[Division_Politica] ([id_division_politica], [nombre]) VALUES (61, N'MISIONES')
INSERT [Sistema].[Division_Politica] ([id_division_politica], [nombre]) VALUES (62, N'NEUQUÉN')
INSERT [Sistema].[Division_Politica] ([id_division_politica], [nombre]) VALUES (63, N'RÍO NEGRO')
INSERT [Sistema].[Division_Politica] ([id_division_politica], [nombre]) VALUES (64, N'SALTA')
INSERT [Sistema].[Division_Politica] ([id_division_politica], [nombre]) VALUES (65, N'SAN JUAN')
INSERT [Sistema].[Division_Politica] ([id_division_politica], [nombre]) VALUES (66, N'SAN LUIS')
INSERT [Sistema].[Division_Politica] ([id_division_politica], [nombre]) VALUES (67, N'SANTA CRUZ')
INSERT [Sistema].[Division_Politica] ([id_division_politica], [nombre]) VALUES (68, N'SANTA FE')
INSERT [Sistema].[Division_Politica] ([id_division_politica], [nombre]) VALUES (69, N'SANTIAGO DEL ESTERO')
INSERT [Sistema].[Division_Politica] ([id_division_politica], [nombre]) VALUES (70, N'TIERRA DEL FUEGO, ANTÁRTIDA E ISLAS DEL ATLÁNTICO SUR')
INSERT [Sistema].[Division_Politica] ([id_division_politica], [nombre]) VALUES (71, N'TUCUMÁN')
INSERT [Sistema].[Division_Politica] ([id_division_politica], [nombre]) VALUES (72, N'MACAO')
INSERT [Sistema].[Division_Politica] ([id_division_politica], [nombre]) VALUES (73, N'HONG KONG')
INSERT [Sistema].[Division_Politica] ([id_division_politica], [nombre]) VALUES (74, N'BEIJING')
INSERT [Sistema].[Division_Politica] ([id_division_politica], [nombre]) VALUES (75, N'SHANGHÁI')
INSERT [Sistema].[Division_Politica] ([id_division_politica], [nombre]) VALUES (76, N'JIANGSU')
INSERT [Sistema].[Division_Politica] ([id_division_politica], [nombre]) VALUES (77, N'ZHEJIANG')
INSERT [Sistema].[Division_Politica] ([id_division_politica], [nombre]) VALUES (78, N'FUJIAN')
INSERT [Sistema].[Division_Politica] ([id_division_politica], [nombre]) VALUES (79, N'GUANGDONG')
INSERT [Sistema].[Division_Politica] ([id_division_politica], [nombre]) VALUES (80, N'TIANJIN')
INSERT [Sistema].[Division_Politica] ([id_division_politica], [nombre]) VALUES (81, N'HUBEI')
INSERT [Sistema].[Division_Politica] ([id_division_politica], [nombre]) VALUES (82, N'CHONGQING')
INSERT [Sistema].[Division_Politica] ([id_division_politica], [nombre]) VALUES (83, N'SHANDONG')
INSERT [Sistema].[Division_Politica] ([id_division_politica], [nombre]) VALUES (84, N'INNER MONGOL')
INSERT [Sistema].[Division_Politica] ([id_division_politica], [nombre]) VALUES (85, N'SHAANXI')
INSERT [Sistema].[Division_Politica] ([id_division_politica], [nombre]) VALUES (86, N'ANHUI')
INSERT [Sistema].[Division_Politica] ([id_division_politica], [nombre]) VALUES (87, N'HUNAN')
INSERT [Sistema].[Division_Politica] ([id_division_politica], [nombre]) VALUES (88, N'LIAONING')
INSERT [Sistema].[Division_Politica] ([id_division_politica], [nombre]) VALUES (89, N'HAINAN')
INSERT [Sistema].[Division_Politica] ([id_division_politica], [nombre]) VALUES (90, N'HENAN')
INSERT [Sistema].[Division_Politica] ([id_division_politica], [nombre]) VALUES (91, N'SICHUAN')
INSERT [Sistema].[Division_Politica] ([id_division_politica], [nombre]) VALUES (92, N'XINJIANG')
INSERT [Sistema].[Division_Politica] ([id_division_politica], [nombre]) VALUES (93, N'NINGXIA')
INSERT [Sistema].[Division_Politica] ([id_division_politica], [nombre]) VALUES (94, N'JIANGXI')
INSERT [Sistema].[Division_Politica] ([id_division_politica], [nombre]) VALUES (95, N'QINGHAI')
INSERT [Sistema].[Division_Politica] ([id_division_politica], [nombre]) VALUES (96, N'TÍBET')
INSERT [Sistema].[Division_Politica] ([id_division_politica], [nombre]) VALUES (97, N'YUNNAN')
INSERT [Sistema].[Division_Politica] ([id_division_politica], [nombre]) VALUES (98, N'GUIZHOU')
INSERT [Sistema].[Division_Politica] ([id_division_politica], [nombre]) VALUES (99, N'HEBEI')
GO
INSERT [Sistema].[Division_Politica] ([id_division_politica], [nombre]) VALUES (100, N'SHANXI')
INSERT [Sistema].[Division_Politica] ([id_division_politica], [nombre]) VALUES (101, N'JILIN')
INSERT [Sistema].[Division_Politica] ([id_division_politica], [nombre]) VALUES (102, N'GUANGXI')
INSERT [Sistema].[Division_Politica] ([id_division_politica], [nombre]) VALUES (103, N'HEILONGJIANG')
INSERT [Sistema].[Division_Politica] ([id_division_politica], [nombre]) VALUES (104, N'GANSU')
INSERT [Sistema].[Division_Politica] ([id_division_politica], [nombre]) VALUES (105, N'ACRE')
INSERT [Sistema].[Division_Politica] ([id_division_politica], [nombre]) VALUES (106, N'ALAGOAS')
INSERT [Sistema].[Division_Politica] ([id_division_politica], [nombre]) VALUES (107, N'ALAGOAS')
INSERT [Sistema].[Division_Politica] ([id_division_politica], [nombre]) VALUES (108, N'AMAPÁ')
INSERT [Sistema].[Division_Politica] ([id_division_politica], [nombre]) VALUES (109, N'AMAZONAS')
INSERT [Sistema].[Division_Politica] ([id_division_politica], [nombre]) VALUES (110, N'BAHIA')
INSERT [Sistema].[Division_Politica] ([id_division_politica], [nombre]) VALUES (111, N'CEARÁ')
INSERT [Sistema].[Division_Politica] ([id_division_politica], [nombre]) VALUES (112, N'ESPÍRITO SANTO')
INSERT [Sistema].[Division_Politica] ([id_division_politica], [nombre]) VALUES (113, N'GOIÁS')
INSERT [Sistema].[Division_Politica] ([id_division_politica], [nombre]) VALUES (114, N'MARANHÃO')
INSERT [Sistema].[Division_Politica] ([id_division_politica], [nombre]) VALUES (115, N'MATO GROSSO')
INSERT [Sistema].[Division_Politica] ([id_division_politica], [nombre]) VALUES (116, N'MATO GROSSO DO SUL')
INSERT [Sistema].[Division_Politica] ([id_division_politica], [nombre]) VALUES (117, N'MINAS GERAIS')
INSERT [Sistema].[Division_Politica] ([id_division_politica], [nombre]) VALUES (118, N'PARÁ')
INSERT [Sistema].[Division_Politica] ([id_division_politica], [nombre]) VALUES (119, N'PARAÍBA')
INSERT [Sistema].[Division_Politica] ([id_division_politica], [nombre]) VALUES (120, N'PARANÁ')
INSERT [Sistema].[Division_Politica] ([id_division_politica], [nombre]) VALUES (121, N'PERNAMBUCO')
INSERT [Sistema].[Division_Politica] ([id_division_politica], [nombre]) VALUES (122, N'PIAUÍ')
INSERT [Sistema].[Division_Politica] ([id_division_politica], [nombre]) VALUES (123, N'RIO DE JANEIRO')
INSERT [Sistema].[Division_Politica] ([id_division_politica], [nombre]) VALUES (124, N'RIO GRANDE DO SUL')
INSERT [Sistema].[Division_Politica] ([id_division_politica], [nombre]) VALUES (125, N'RONDÔNIA')
INSERT [Sistema].[Division_Politica] ([id_division_politica], [nombre]) VALUES (126, N'SANTA CATARINA')
INSERT [Sistema].[Division_Politica] ([id_division_politica], [nombre]) VALUES (127, N'SÃO PAULO')
INSERT [Sistema].[Division_Politica] ([id_division_politica], [nombre]) VALUES (128, N'SERGIPE')
INSERT [Sistema].[Division_Politica] ([id_division_politica], [nombre]) VALUES (129, N'TOCANTINS')
SET IDENTITY_INSERT [Sistema].[Division_Politica] OFF
GO
