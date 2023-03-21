USE [BLV]
GO
/****** Object:  Table [Sistema].[Localidad]    Script Date: 21/3/2023 9:13:35 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Sistema].[Localidad](
	[id_localidad] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](70) NULL,
	[prefijo_telefonico] [varchar](5) NULL,
	[codigo_postal] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_localidad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [Sistema].[Localidad] ON 

INSERT [Sistema].[Localidad] ([id_localidad], [nombre], [prefijo_telefonico], [codigo_postal]) VALUES (1, N'25 DE MAYO', NULL, NULL)
INSERT [Sistema].[Localidad] ([id_localidad], [nombre], [prefijo_telefonico], [codigo_postal]) VALUES (2, N'9 DE JULIO', NULL, NULL)
INSERT [Sistema].[Localidad] ([id_localidad], [nombre], [prefijo_telefonico], [codigo_postal]) VALUES (3, N'ADOLFO ALSINA', NULL, NULL)
INSERT [Sistema].[Localidad] ([id_localidad], [nombre], [prefijo_telefonico], [codigo_postal]) VALUES (4, N'ADOLFO GONZALES CHAVES', NULL, NULL)
INSERT [Sistema].[Localidad] ([id_localidad], [nombre], [prefijo_telefonico], [codigo_postal]) VALUES (5, N'ALBERTI', NULL, NULL)
INSERT [Sistema].[Localidad] ([id_localidad], [nombre], [prefijo_telefonico], [codigo_postal]) VALUES (6, N'ALMIRANTE BROWN', NULL, NULL)
INSERT [Sistema].[Localidad] ([id_localidad], [nombre], [prefijo_telefonico], [codigo_postal]) VALUES (7, N'ARRECIFES', NULL, NULL)
INSERT [Sistema].[Localidad] ([id_localidad], [nombre], [prefijo_telefonico], [codigo_postal]) VALUES (8, N'AVELLANEDA', NULL, NULL)
INSERT [Sistema].[Localidad] ([id_localidad], [nombre], [prefijo_telefonico], [codigo_postal]) VALUES (9, N'AYACUCHO', NULL, NULL)
INSERT [Sistema].[Localidad] ([id_localidad], [nombre], [prefijo_telefonico], [codigo_postal]) VALUES (10, N'AZUL', NULL, NULL)
INSERT [Sistema].[Localidad] ([id_localidad], [nombre], [prefijo_telefonico], [codigo_postal]) VALUES (11, N'BAHÍA BLANCA', NULL, NULL)
INSERT [Sistema].[Localidad] ([id_localidad], [nombre], [prefijo_telefonico], [codigo_postal]) VALUES (12, N'BALCARCE', NULL, NULL)
INSERT [Sistema].[Localidad] ([id_localidad], [nombre], [prefijo_telefonico], [codigo_postal]) VALUES (13, N'BARADERO', NULL, NULL)
INSERT [Sistema].[Localidad] ([id_localidad], [nombre], [prefijo_telefonico], [codigo_postal]) VALUES (14, N'BENITO JUAREZ', NULL, NULL)
INSERT [Sistema].[Localidad] ([id_localidad], [nombre], [prefijo_telefonico], [codigo_postal]) VALUES (15, N'BERAZATEGUI', NULL, NULL)
INSERT [Sistema].[Localidad] ([id_localidad], [nombre], [prefijo_telefonico], [codigo_postal]) VALUES (16, N'BERISSO', NULL, NULL)
INSERT [Sistema].[Localidad] ([id_localidad], [nombre], [prefijo_telefonico], [codigo_postal]) VALUES (17, N'BOLIVAR', NULL, NULL)
INSERT [Sistema].[Localidad] ([id_localidad], [nombre], [prefijo_telefonico], [codigo_postal]) VALUES (18, N'BRAGADO', NULL, NULL)
INSERT [Sistema].[Localidad] ([id_localidad], [nombre], [prefijo_telefonico], [codigo_postal]) VALUES (19, N'BRANDSEN', NULL, NULL)
INSERT [Sistema].[Localidad] ([id_localidad], [nombre], [prefijo_telefonico], [codigo_postal]) VALUES (20, N'CAMPANA', NULL, NULL)
INSERT [Sistema].[Localidad] ([id_localidad], [nombre], [prefijo_telefonico], [codigo_postal]) VALUES (21, N'CAÑUELAS', NULL, NULL)
INSERT [Sistema].[Localidad] ([id_localidad], [nombre], [prefijo_telefonico], [codigo_postal]) VALUES (22, N'CAPITAN SARMIENTO', NULL, NULL)
INSERT [Sistema].[Localidad] ([id_localidad], [nombre], [prefijo_telefonico], [codigo_postal]) VALUES (23, N'CARLOS CASARES', NULL, NULL)
INSERT [Sistema].[Localidad] ([id_localidad], [nombre], [prefijo_telefonico], [codigo_postal]) VALUES (24, N'CARLOS TEJEDOR', NULL, NULL)
INSERT [Sistema].[Localidad] ([id_localidad], [nombre], [prefijo_telefonico], [codigo_postal]) VALUES (25, N'CARMEN DE ARECO', NULL, NULL)
INSERT [Sistema].[Localidad] ([id_localidad], [nombre], [prefijo_telefonico], [codigo_postal]) VALUES (26, N'CASTELLI', NULL, NULL)
INSERT [Sistema].[Localidad] ([id_localidad], [nombre], [prefijo_telefonico], [codigo_postal]) VALUES (27, N'CHACABUCO', NULL, NULL)
INSERT [Sistema].[Localidad] ([id_localidad], [nombre], [prefijo_telefonico], [codigo_postal]) VALUES (28, N'CHASCOMUS', NULL, NULL)
INSERT [Sistema].[Localidad] ([id_localidad], [nombre], [prefijo_telefonico], [codigo_postal]) VALUES (29, N'CHIVILCOY', NULL, NULL)
INSERT [Sistema].[Localidad] ([id_localidad], [nombre], [prefijo_telefonico], [codigo_postal]) VALUES (30, N'COLON', NULL, NULL)
INSERT [Sistema].[Localidad] ([id_localidad], [nombre], [prefijo_telefonico], [codigo_postal]) VALUES (31, N'CORONEL DE MARINA L ROSALES', NULL, NULL)
INSERT [Sistema].[Localidad] ([id_localidad], [nombre], [prefijo_telefonico], [codigo_postal]) VALUES (32, N'CORONEL DORREGO', NULL, NULL)
INSERT [Sistema].[Localidad] ([id_localidad], [nombre], [prefijo_telefonico], [codigo_postal]) VALUES (33, N'CORONEL PRINGLES', NULL, NULL)
INSERT [Sistema].[Localidad] ([id_localidad], [nombre], [prefijo_telefonico], [codigo_postal]) VALUES (34, N'CORONEL SUAREZ', NULL, NULL)
INSERT [Sistema].[Localidad] ([id_localidad], [nombre], [prefijo_telefonico], [codigo_postal]) VALUES (35, N'DAIREAUX', NULL, NULL)
INSERT [Sistema].[Localidad] ([id_localidad], [nombre], [prefijo_telefonico], [codigo_postal]) VALUES (36, N'DOLORES', NULL, NULL)
INSERT [Sistema].[Localidad] ([id_localidad], [nombre], [prefijo_telefonico], [codigo_postal]) VALUES (37, N'ENSENADA', NULL, NULL)
INSERT [Sistema].[Localidad] ([id_localidad], [nombre], [prefijo_telefonico], [codigo_postal]) VALUES (38, N'ESCOBAR', NULL, NULL)
INSERT [Sistema].[Localidad] ([id_localidad], [nombre], [prefijo_telefonico], [codigo_postal]) VALUES (39, N'ESTEBAN ECHEVERRIA', NULL, NULL)
INSERT [Sistema].[Localidad] ([id_localidad], [nombre], [prefijo_telefonico], [codigo_postal]) VALUES (40, N'EXALTACIÓN DE LA CRUZ', NULL, NULL)
INSERT [Sistema].[Localidad] ([id_localidad], [nombre], [prefijo_telefonico], [codigo_postal]) VALUES (41, N'EZEIZA', NULL, NULL)
INSERT [Sistema].[Localidad] ([id_localidad], [nombre], [prefijo_telefonico], [codigo_postal]) VALUES (42, N'FLORENCIO VARELA', NULL, NULL)
INSERT [Sistema].[Localidad] ([id_localidad], [nombre], [prefijo_telefonico], [codigo_postal]) VALUES (43, N'FLORENTINO AMEGHINO', NULL, NULL)
INSERT [Sistema].[Localidad] ([id_localidad], [nombre], [prefijo_telefonico], [codigo_postal]) VALUES (44, N'GENERAL ALVARADO', NULL, NULL)
INSERT [Sistema].[Localidad] ([id_localidad], [nombre], [prefijo_telefonico], [codigo_postal]) VALUES (45, N'GENERAL ALVEAR', NULL, NULL)
INSERT [Sistema].[Localidad] ([id_localidad], [nombre], [prefijo_telefonico], [codigo_postal]) VALUES (46, N'GENERAL ARENALES', NULL, NULL)
INSERT [Sistema].[Localidad] ([id_localidad], [nombre], [prefijo_telefonico], [codigo_postal]) VALUES (47, N'GENERAL BELGRANO', NULL, NULL)
INSERT [Sistema].[Localidad] ([id_localidad], [nombre], [prefijo_telefonico], [codigo_postal]) VALUES (48, N'GENERAL GUIDO', NULL, NULL)
INSERT [Sistema].[Localidad] ([id_localidad], [nombre], [prefijo_telefonico], [codigo_postal]) VALUES (49, N'GENERAL JUAN MADARIAGA ', NULL, NULL)
INSERT [Sistema].[Localidad] ([id_localidad], [nombre], [prefijo_telefonico], [codigo_postal]) VALUES (50, N'GENERAL LA MADRID', NULL, NULL)
INSERT [Sistema].[Localidad] ([id_localidad], [nombre], [prefijo_telefonico], [codigo_postal]) VALUES (51, N'GENERAL LAVALLE', NULL, NULL)
INSERT [Sistema].[Localidad] ([id_localidad], [nombre], [prefijo_telefonico], [codigo_postal]) VALUES (52, N'GENERAL PAZ', NULL, NULL)
INSERT [Sistema].[Localidad] ([id_localidad], [nombre], [prefijo_telefonico], [codigo_postal]) VALUES (53, N'GENERAL PINTO', NULL, NULL)
INSERT [Sistema].[Localidad] ([id_localidad], [nombre], [prefijo_telefonico], [codigo_postal]) VALUES (54, N'GENERAL PUEYRREDON', NULL, NULL)
INSERT [Sistema].[Localidad] ([id_localidad], [nombre], [prefijo_telefonico], [codigo_postal]) VALUES (55, N'GENERAL RODRIGUEZ', NULL, NULL)
INSERT [Sistema].[Localidad] ([id_localidad], [nombre], [prefijo_telefonico], [codigo_postal]) VALUES (56, N'GENERAL SAN MARTIN', NULL, NULL)
INSERT [Sistema].[Localidad] ([id_localidad], [nombre], [prefijo_telefonico], [codigo_postal]) VALUES (57, N'GENERAL VIAMONTE', NULL, NULL)
INSERT [Sistema].[Localidad] ([id_localidad], [nombre], [prefijo_telefonico], [codigo_postal]) VALUES (58, N'GENERAL VILLEGAS', NULL, NULL)
INSERT [Sistema].[Localidad] ([id_localidad], [nombre], [prefijo_telefonico], [codigo_postal]) VALUES (59, N'GUAMINI', NULL, NULL)
INSERT [Sistema].[Localidad] ([id_localidad], [nombre], [prefijo_telefonico], [codigo_postal]) VALUES (60, N'HIPOLITO YRIGOYEN ', NULL, NULL)
INSERT [Sistema].[Localidad] ([id_localidad], [nombre], [prefijo_telefonico], [codigo_postal]) VALUES (61, N'HURLINGHAM', NULL, NULL)
INSERT [Sistema].[Localidad] ([id_localidad], [nombre], [prefijo_telefonico], [codigo_postal]) VALUES (62, N'ITUZAINGO', NULL, NULL)
INSERT [Sistema].[Localidad] ([id_localidad], [nombre], [prefijo_telefonico], [codigo_postal]) VALUES (63, N'JOSE C PAZ', NULL, NULL)
INSERT [Sistema].[Localidad] ([id_localidad], [nombre], [prefijo_telefonico], [codigo_postal]) VALUES (64, N'JUNIN', NULL, NULL)
INSERT [Sistema].[Localidad] ([id_localidad], [nombre], [prefijo_telefonico], [codigo_postal]) VALUES (65, N'LA COSTA', NULL, NULL)
INSERT [Sistema].[Localidad] ([id_localidad], [nombre], [prefijo_telefonico], [codigo_postal]) VALUES (66, N'LA MATANZA', NULL, NULL)
INSERT [Sistema].[Localidad] ([id_localidad], [nombre], [prefijo_telefonico], [codigo_postal]) VALUES (67, N'LA PLATA', NULL, NULL)
INSERT [Sistema].[Localidad] ([id_localidad], [nombre], [prefijo_telefonico], [codigo_postal]) VALUES (68, N'LANÚS', NULL, NULL)
INSERT [Sistema].[Localidad] ([id_localidad], [nombre], [prefijo_telefonico], [codigo_postal]) VALUES (69, N'LAPRIDA', NULL, NULL)
INSERT [Sistema].[Localidad] ([id_localidad], [nombre], [prefijo_telefonico], [codigo_postal]) VALUES (70, N'LAS FLORES', NULL, NULL)
INSERT [Sistema].[Localidad] ([id_localidad], [nombre], [prefijo_telefonico], [codigo_postal]) VALUES (71, N'LEANDRO N ALEM', NULL, NULL)
INSERT [Sistema].[Localidad] ([id_localidad], [nombre], [prefijo_telefonico], [codigo_postal]) VALUES (72, N'LEZAMA', NULL, NULL)
INSERT [Sistema].[Localidad] ([id_localidad], [nombre], [prefijo_telefonico], [codigo_postal]) VALUES (73, N'LINCOLN', NULL, NULL)
INSERT [Sistema].[Localidad] ([id_localidad], [nombre], [prefijo_telefonico], [codigo_postal]) VALUES (74, N'LOBERIA', NULL, NULL)
INSERT [Sistema].[Localidad] ([id_localidad], [nombre], [prefijo_telefonico], [codigo_postal]) VALUES (75, N'LOBOS', NULL, NULL)
INSERT [Sistema].[Localidad] ([id_localidad], [nombre], [prefijo_telefonico], [codigo_postal]) VALUES (76, N'LOMAS DE ZAMORA', NULL, NULL)
INSERT [Sistema].[Localidad] ([id_localidad], [nombre], [prefijo_telefonico], [codigo_postal]) VALUES (77, N'LUJAN', NULL, NULL)
INSERT [Sistema].[Localidad] ([id_localidad], [nombre], [prefijo_telefonico], [codigo_postal]) VALUES (78, N'MAGDALENA', NULL, NULL)
INSERT [Sistema].[Localidad] ([id_localidad], [nombre], [prefijo_telefonico], [codigo_postal]) VALUES (79, N'MAIPU', NULL, NULL)
INSERT [Sistema].[Localidad] ([id_localidad], [nombre], [prefijo_telefonico], [codigo_postal]) VALUES (80, N'MALVINAS ARGENTINAS', NULL, NULL)
INSERT [Sistema].[Localidad] ([id_localidad], [nombre], [prefijo_telefonico], [codigo_postal]) VALUES (81, N'MAR CHIQUITA', NULL, NULL)
INSERT [Sistema].[Localidad] ([id_localidad], [nombre], [prefijo_telefonico], [codigo_postal]) VALUES (82, N'MARCOS PAZ', NULL, NULL)
INSERT [Sistema].[Localidad] ([id_localidad], [nombre], [prefijo_telefonico], [codigo_postal]) VALUES (83, N'MERCEDES', NULL, NULL)
INSERT [Sistema].[Localidad] ([id_localidad], [nombre], [prefijo_telefonico], [codigo_postal]) VALUES (84, N'MERLO', NULL, NULL)
INSERT [Sistema].[Localidad] ([id_localidad], [nombre], [prefijo_telefonico], [codigo_postal]) VALUES (85, N'MONTE', NULL, NULL)
INSERT [Sistema].[Localidad] ([id_localidad], [nombre], [prefijo_telefonico], [codigo_postal]) VALUES (86, N'MONTE HERMOSO', NULL, NULL)
INSERT [Sistema].[Localidad] ([id_localidad], [nombre], [prefijo_telefonico], [codigo_postal]) VALUES (87, N'MORENO', NULL, NULL)
INSERT [Sistema].[Localidad] ([id_localidad], [nombre], [prefijo_telefonico], [codigo_postal]) VALUES (88, N'MORON', NULL, NULL)
INSERT [Sistema].[Localidad] ([id_localidad], [nombre], [prefijo_telefonico], [codigo_postal]) VALUES (89, N'NAVARRO', NULL, NULL)
INSERT [Sistema].[Localidad] ([id_localidad], [nombre], [prefijo_telefonico], [codigo_postal]) VALUES (90, N'NECOCHEA', NULL, NULL)
INSERT [Sistema].[Localidad] ([id_localidad], [nombre], [prefijo_telefonico], [codigo_postal]) VALUES (91, N'OLAVARRIA', NULL, NULL)
INSERT [Sistema].[Localidad] ([id_localidad], [nombre], [prefijo_telefonico], [codigo_postal]) VALUES (92, N'PATAGONES', NULL, NULL)
INSERT [Sistema].[Localidad] ([id_localidad], [nombre], [prefijo_telefonico], [codigo_postal]) VALUES (93, N'PEHUAJO', NULL, NULL)
INSERT [Sistema].[Localidad] ([id_localidad], [nombre], [prefijo_telefonico], [codigo_postal]) VALUES (94, N'PELLEGRINI', NULL, NULL)
INSERT [Sistema].[Localidad] ([id_localidad], [nombre], [prefijo_telefonico], [codigo_postal]) VALUES (95, N'PERGAMINO', NULL, NULL)
INSERT [Sistema].[Localidad] ([id_localidad], [nombre], [prefijo_telefonico], [codigo_postal]) VALUES (96, N'PILA', NULL, NULL)
INSERT [Sistema].[Localidad] ([id_localidad], [nombre], [prefijo_telefonico], [codigo_postal]) VALUES (97, N'PILAR', NULL, NULL)
INSERT [Sistema].[Localidad] ([id_localidad], [nombre], [prefijo_telefonico], [codigo_postal]) VALUES (98, N'PINAMAR', NULL, NULL)
INSERT [Sistema].[Localidad] ([id_localidad], [nombre], [prefijo_telefonico], [codigo_postal]) VALUES (99, N'PRESIDENTE PERON', NULL, NULL)
GO
INSERT [Sistema].[Localidad] ([id_localidad], [nombre], [prefijo_telefonico], [codigo_postal]) VALUES (100, N'PUAN', NULL, NULL)
INSERT [Sistema].[Localidad] ([id_localidad], [nombre], [prefijo_telefonico], [codigo_postal]) VALUES (101, N'PUNTA INDIO', NULL, NULL)
INSERT [Sistema].[Localidad] ([id_localidad], [nombre], [prefijo_telefonico], [codigo_postal]) VALUES (102, N'QUILMES', NULL, NULL)
INSERT [Sistema].[Localidad] ([id_localidad], [nombre], [prefijo_telefonico], [codigo_postal]) VALUES (103, N'RAMALLO', NULL, NULL)
INSERT [Sistema].[Localidad] ([id_localidad], [nombre], [prefijo_telefonico], [codigo_postal]) VALUES (104, N'RAUCH', NULL, NULL)
INSERT [Sistema].[Localidad] ([id_localidad], [nombre], [prefijo_telefonico], [codigo_postal]) VALUES (105, N'RIVADAVIA', NULL, NULL)
INSERT [Sistema].[Localidad] ([id_localidad], [nombre], [prefijo_telefonico], [codigo_postal]) VALUES (106, N'ROJAS', NULL, NULL)
INSERT [Sistema].[Localidad] ([id_localidad], [nombre], [prefijo_telefonico], [codigo_postal]) VALUES (107, N'ROQUE PEREZ', NULL, NULL)
INSERT [Sistema].[Localidad] ([id_localidad], [nombre], [prefijo_telefonico], [codigo_postal]) VALUES (108, N'SAAVEDRA', NULL, NULL)
INSERT [Sistema].[Localidad] ([id_localidad], [nombre], [prefijo_telefonico], [codigo_postal]) VALUES (109, N'SALADILLO', NULL, NULL)
INSERT [Sistema].[Localidad] ([id_localidad], [nombre], [prefijo_telefonico], [codigo_postal]) VALUES (110, N'SALLIQUELO', NULL, NULL)
INSERT [Sistema].[Localidad] ([id_localidad], [nombre], [prefijo_telefonico], [codigo_postal]) VALUES (111, N'SALTO', NULL, NULL)
INSERT [Sistema].[Localidad] ([id_localidad], [nombre], [prefijo_telefonico], [codigo_postal]) VALUES (112, N'SAN ANDRES DE GILES ', NULL, NULL)
INSERT [Sistema].[Localidad] ([id_localidad], [nombre], [prefijo_telefonico], [codigo_postal]) VALUES (113, N'SAN ANTONIO DE ARECO', NULL, NULL)
INSERT [Sistema].[Localidad] ([id_localidad], [nombre], [prefijo_telefonico], [codigo_postal]) VALUES (114, N'SAN CAYETANO', NULL, NULL)
INSERT [Sistema].[Localidad] ([id_localidad], [nombre], [prefijo_telefonico], [codigo_postal]) VALUES (115, N'SAN FERNANDO', NULL, NULL)
INSERT [Sistema].[Localidad] ([id_localidad], [nombre], [prefijo_telefonico], [codigo_postal]) VALUES (116, N'SAN ISIDRO', NULL, NULL)
INSERT [Sistema].[Localidad] ([id_localidad], [nombre], [prefijo_telefonico], [codigo_postal]) VALUES (117, N'SAN MIGUEL', NULL, NULL)
INSERT [Sistema].[Localidad] ([id_localidad], [nombre], [prefijo_telefonico], [codigo_postal]) VALUES (118, N'SAN NICOLAS', NULL, NULL)
INSERT [Sistema].[Localidad] ([id_localidad], [nombre], [prefijo_telefonico], [codigo_postal]) VALUES (119, N'SAN PEDRO', NULL, NULL)
INSERT [Sistema].[Localidad] ([id_localidad], [nombre], [prefijo_telefonico], [codigo_postal]) VALUES (120, N'SAN VICENTE', NULL, NULL)
INSERT [Sistema].[Localidad] ([id_localidad], [nombre], [prefijo_telefonico], [codigo_postal]) VALUES (121, N'SUIPACHA', NULL, NULL)
INSERT [Sistema].[Localidad] ([id_localidad], [nombre], [prefijo_telefonico], [codigo_postal]) VALUES (122, N'TANDIL', NULL, NULL)
INSERT [Sistema].[Localidad] ([id_localidad], [nombre], [prefijo_telefonico], [codigo_postal]) VALUES (123, N'TAPALQUE', NULL, NULL)
INSERT [Sistema].[Localidad] ([id_localidad], [nombre], [prefijo_telefonico], [codigo_postal]) VALUES (124, N'TIGRE', NULL, NULL)
INSERT [Sistema].[Localidad] ([id_localidad], [nombre], [prefijo_telefonico], [codigo_postal]) VALUES (125, N'TORDILLO', NULL, NULL)
INSERT [Sistema].[Localidad] ([id_localidad], [nombre], [prefijo_telefonico], [codigo_postal]) VALUES (126, N'TORNQUIST', NULL, NULL)
INSERT [Sistema].[Localidad] ([id_localidad], [nombre], [prefijo_telefonico], [codigo_postal]) VALUES (127, N'TRENQUE LAUQUEN', NULL, NULL)
INSERT [Sistema].[Localidad] ([id_localidad], [nombre], [prefijo_telefonico], [codigo_postal]) VALUES (128, N'TRES ARROYOS', NULL, NULL)
INSERT [Sistema].[Localidad] ([id_localidad], [nombre], [prefijo_telefonico], [codigo_postal]) VALUES (129, N'TRES DE FEBRERO', NULL, NULL)
INSERT [Sistema].[Localidad] ([id_localidad], [nombre], [prefijo_telefonico], [codigo_postal]) VALUES (130, N'TRES LOMAS', NULL, NULL)
INSERT [Sistema].[Localidad] ([id_localidad], [nombre], [prefijo_telefonico], [codigo_postal]) VALUES (131, N'VICENTE LOPEZ', NULL, NULL)
INSERT [Sistema].[Localidad] ([id_localidad], [nombre], [prefijo_telefonico], [codigo_postal]) VALUES (132, N'VILLA GESELL', NULL, NULL)
INSERT [Sistema].[Localidad] ([id_localidad], [nombre], [prefijo_telefonico], [codigo_postal]) VALUES (133, N'VILLARINO', NULL, NULL)
INSERT [Sistema].[Localidad] ([id_localidad], [nombre], [prefijo_telefonico], [codigo_postal]) VALUES (134, N'ZARATE', NULL, NULL)
SET IDENTITY_INSERT [Sistema].[Localidad] OFF
GO
