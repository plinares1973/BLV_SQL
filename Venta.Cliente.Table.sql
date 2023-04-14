USE [BLV]
GO
/****** Object:  Table [Venta].[Cliente]    Script Date: 14/4/2023 12:48:02 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Venta].[Cliente](
	[id_cliente] [int] IDENTITY(1,1) NOT NULL,
	[cuit] [varchar](20) NOT NULL,
	[razon_social] [varchar](60) NULL,
	[domicilio] [varchar](60) NULL,
	[telefono] [varchar](20) NULL,
	[dni] [varchar](20) NULL,
	[mail] [varchar](20) NULL,
	[fecha_alta] [smalldatetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[cuit] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [Venta].[Cliente] ON 

INSERT [Venta].[Cliente] ([id_cliente], [cuit], [razon_social], [domicilio], [telefono], [dni], [mail], [fecha_alta]) VALUES (1, N'20500089624', N'CACTUS COMIDAS PARA LLEVAR', N'CERRITO 333', NULL, N'50008962', NULL, CAST(N'2022-09-10T20:07:00' AS SmallDateTime))
INSERT [Venta].[Cliente] ([id_cliente], [cuit], [razon_social], [domicilio], [telefono], [dni], [mail], [fecha_alta]) VALUES (2, N'20500089627', N'WOLSKI  ZAJAZD', N'UL. FILTROWA 68', NULL, N'50008962', NULL, CAST(N'2022-09-10T20:07:00' AS SmallDateTime))
INSERT [Venta].[Cliente] ([id_cliente], [cuit], [razon_social], [domicilio], [telefono], [dni], [mail], [fecha_alta]) VALUES (3, N'20500090029', N'FOLIES GOURMANDES', N'184, CHAUSSÉE DE TOURNAI', NULL, N'50009002', NULL, CAST(N'2022-09-10T20:07:00' AS SmallDateTime))
INSERT [Venta].[Cliente] ([id_cliente], [cuit], [razon_social], [domicilio], [telefono], [dni], [mail], [fecha_alta]) VALUES (4, N'20500092242', N'THE CRACKER BOX', N'55 GRIZZLY PEAK RD.', NULL, N'50009224', NULL, CAST(N'2022-09-10T20:07:00' AS SmallDateTime))
INSERT [Venta].[Cliente] ([id_cliente], [cuit], [razon_social], [domicilio], [telefono], [dni], [mail], [fecha_alta]) VALUES (5, N'20500117571', N'FAMILIA ARQUIBALDO', N'RUA ORÓS, 92', NULL, N'50011757', NULL, CAST(N'2022-09-10T20:07:00' AS SmallDateTime))
INSERT [Venta].[Cliente] ([id_cliente], [cuit], [razon_social], [domicilio], [telefono], [dni], [mail], [fecha_alta]) VALUES (6, N'20500124152', N'WHITE CLOVER MARKETS', N'305 - 14TH AVE. S. SUITE 3B', NULL, N'50012415', NULL, CAST(N'2022-09-10T20:07:00' AS SmallDateTime))
INSERT [Venta].[Cliente] ([id_cliente], [cuit], [razon_social], [domicilio], [telefono], [dni], [mail], [fecha_alta]) VALUES (7, N'20500152547', N'FISSA FABRICA INTER. SALCHICHAS S.A.', N'C/ MORALZARZAL', NULL, N'50015254', NULL, CAST(N'2022-09-10T20:07:00' AS SmallDateTime))
INSERT [Venta].[Cliente] ([id_cliente], [cuit], [razon_social], [domicilio], [telefono], [dni], [mail], [fecha_alta]) VALUES (8, N'20500802568', N'GROSELLA-RESTAURANTE', N'5ª AVE. LOS PALOS GRANDES', NULL, N'50080256', NULL, CAST(N'2022-09-10T20:07:00' AS SmallDateTime))
INSERT [Venta].[Cliente] ([id_cliente], [cuit], [razon_social], [domicilio], [telefono], [dni], [mail], [fecha_alta]) VALUES (9, N'20516782362', N'VAFFELJERNET', N'SMAGSLOGET 45', NULL, N'51678236', NULL, CAST(N'2022-09-10T20:07:00' AS SmallDateTime))
INSERT [Venta].[Cliente] ([id_cliente], [cuit], [razon_social], [domicilio], [telefono], [dni], [mail], [fecha_alta]) VALUES (10, N'20517292792', N'TRAILS HEAD GOURMET PROVISIONERS', N'722 DAVINCI BLVD.', NULL, N'51729279', NULL, CAST(N'2022-09-10T20:07:00' AS SmallDateTime))
INSERT [Venta].[Cliente] ([id_cliente], [cuit], [razon_social], [domicilio], [telefono], [dni], [mail], [fecha_alta]) VALUES (11, N'20548274997', N'RICARDO ADOCICADOS', N'AV. COPACABANA, 267', NULL, N'54827499', NULL, CAST(N'2022-09-10T20:07:00' AS SmallDateTime))
INSERT [Venta].[Cliente] ([id_cliente], [cuit], [razon_social], [domicilio], [telefono], [dni], [mail], [fecha_alta]) VALUES (12, N'20570948012', N'MORGENSTERN GESUNDKOST', N'HEERSTR. 22', NULL, N'57094801', NULL, CAST(N'2022-09-10T20:07:00' AS SmallDateTime))
INSERT [Venta].[Cliente] ([id_cliente], [cuit], [razon_social], [domicilio], [telefono], [dni], [mail], [fecha_alta]) VALUES (13, N'20582622945', N'FRANKENVERSAND', N'BERLINER PLATZ 43', NULL, N'58262294', NULL, CAST(N'2022-09-10T20:07:00' AS SmallDateTime))
INSERT [Venta].[Cliente] ([id_cliente], [cuit], [razon_social], [domicilio], [telefono], [dni], [mail], [fecha_alta]) VALUES (14, N'20596993873', N'FRANCE RESTAURATION', N'54, RUE ROYALE', NULL, N'59699387', NULL, CAST(N'2022-09-10T20:07:00' AS SmallDateTime))
INSERT [Venta].[Cliente] ([id_cliente], [cuit], [razon_social], [domicilio], [telefono], [dni], [mail], [fecha_alta]) VALUES (15, N'20632161146', N'DIE WANDERNDE KUH', N'ADENAUERALLEE 900', NULL, N'63216114', NULL, CAST(N'2022-09-10T20:07:00' AS SmallDateTime))
INSERT [Venta].[Cliente] ([id_cliente], [cuit], [razon_social], [domicilio], [telefono], [dni], [mail], [fecha_alta]) VALUES (16, N'20633008775', N'EASTERN CONNECTION', N'35 KING GEORGE', NULL, N'63300877', NULL, CAST(N'2022-09-10T20:07:00' AS SmallDateTime))
INSERT [Venta].[Cliente] ([id_cliente], [cuit], [razon_social], [domicilio], [telefono], [dni], [mail], [fecha_alta]) VALUES (17, N'20642028754', N'VICTUAILLES EN STOCK', N'2, RUE DU COMMERCE', NULL, N'64202875', NULL, CAST(N'2022-09-10T20:07:00' AS SmallDateTime))
INSERT [Venta].[Cliente] ([id_cliente], [cuit], [razon_social], [domicilio], [telefono], [dni], [mail], [fecha_alta]) VALUES (18, N'20645953556', N'VINS ET ALCOOLS CHEVALIER', N'59 RUE DE LABBAYE', NULL, N'64595355', NULL, CAST(N'2022-09-10T20:07:00' AS SmallDateTime))
INSERT [Venta].[Cliente] ([id_cliente], [cuit], [razon_social], [domicilio], [telefono], [dni], [mail], [fecha_alta]) VALUES (19, N'20654118767', N'COMÉRCIO MINEIRO', N'AV. DOS LUSÍADAS, 23', NULL, N'65411876', NULL, CAST(N'2022-09-10T20:07:00' AS SmallDateTime))
INSERT [Venta].[Cliente] ([id_cliente], [cuit], [razon_social], [domicilio], [telefono], [dni], [mail], [fecha_alta]) VALUES (20, N'20656319263', N'SIMONS BISTRO', N'VINBÆLTET 34', NULL, N'65631926', NULL, CAST(N'2022-09-10T20:07:00' AS SmallDateTime))
INSERT [Venta].[Cliente] ([id_cliente], [cuit], [razon_social], [domicilio], [telefono], [dni], [mail], [fecha_alta]) VALUES (21, N'20657132000', N'GODOS COCINA TÍPICA', N'C/ ROMERO, 33', NULL, N'65713200', NULL, CAST(N'2022-09-10T20:07:00' AS SmallDateTime))
INSERT [Venta].[Cliente] ([id_cliente], [cuit], [razon_social], [domicilio], [telefono], [dni], [mail], [fecha_alta]) VALUES (22, N'20661798501', N'SANTÉ GOURMET', N'ERLING SKAKKES GATE 78', NULL, N'66179850', NULL, CAST(N'2022-09-10T20:07:00' AS SmallDateTime))
INSERT [Venta].[Cliente] ([id_cliente], [cuit], [razon_social], [domicilio], [telefono], [dni], [mail], [fecha_alta]) VALUES (23, N'20662145110', N'FRANCHI S.P.A.', N'VIA MONTE BIANCO 34', NULL, N'66214511', NULL, CAST(N'2022-09-10T20:07:00' AS SmallDateTime))
INSERT [Venta].[Cliente] ([id_cliente], [cuit], [razon_social], [domicilio], [telefono], [dni], [mail], [fecha_alta]) VALUES (24, N'20679107220', N'FURIA BACALHAU E FRUTOS DO MAR', N'JARDIM DAS ROSAS N. 32', NULL, N'67910722', NULL, CAST(N'2022-09-10T20:07:00' AS SmallDateTime))
INSERT [Venta].[Cliente] ([id_cliente], [cuit], [razon_social], [domicilio], [telefono], [dni], [mail], [fecha_alta]) VALUES (25, N'20696376782', N'TRADIÇÃO HIPERMERCADOS', N'AV. INÊS DE CASTRO, 414', NULL, N'69637678', NULL, CAST(N'2022-09-10T20:07:00' AS SmallDateTime))
INSERT [Venta].[Cliente] ([id_cliente], [cuit], [razon_social], [domicilio], [telefono], [dni], [mail], [fecha_alta]) VALUES (26, N'20697615713', N'CONSOLIDATED HOLDINGS ', N'BERKELEY GARDENS 12  BREWERY', NULL, N'69761571', NULL, CAST(N'2022-09-10T20:07:00' AS SmallDateTime))
INSERT [Venta].[Cliente] ([id_cliente], [cuit], [razon_social], [domicilio], [telefono], [dni], [mail], [fecha_alta]) VALUES (27, N'20701749150', N'FOLK OCH FÄ HB', N'ÅKERGATAN 24', NULL, N'70174915', NULL, CAST(N'2022-09-10T20:07:00' AS SmallDateTime))
INSERT [Venta].[Cliente] ([id_cliente], [cuit], [razon_social], [domicilio], [telefono], [dni], [mail], [fecha_alta]) VALUES (28, N'20707467254', N'DRACHENBLUT DELIKATESSEN', N'WALSERWEG 21', NULL, N'70746725', NULL, CAST(N'2022-09-10T20:07:00' AS SmallDateTime))
INSERT [Venta].[Cliente] ([id_cliente], [cuit], [razon_social], [domicilio], [telefono], [dni], [mail], [fecha_alta]) VALUES (29, N'20709311049', N'ERNST HANDEL', N'KIRCHGASSE 6', NULL, N'70931104', NULL, CAST(N'2022-09-10T20:07:00' AS SmallDateTime))
INSERT [Venta].[Cliente] ([id_cliente], [cuit], [razon_social], [domicilio], [telefono], [dni], [mail], [fecha_alta]) VALUES (30, N'20709386642', N'WARTIAN HERKKU', N'TORIKATU 38', NULL, N'70938664', NULL, CAST(N'2022-09-10T20:07:00' AS SmallDateTime))
INSERT [Venta].[Cliente] ([id_cliente], [cuit], [razon_social], [domicilio], [telefono], [dni], [mail], [fecha_alta]) VALUES (31, N'20711570000', N'GOURMET LANCHONETES', N'AV. BRASIL, 442', NULL, N'71157000', NULL, CAST(N'2022-09-10T20:07:00' AS SmallDateTime))
INSERT [Venta].[Cliente] ([id_cliente], [cuit], [razon_social], [domicilio], [telefono], [dni], [mail], [fecha_alta]) VALUES (32, N'23500365019', N'BOTTOM-DOLLAR MARKETS', N'23 TSAWASSEN BLVD.', NULL, N'50036501', NULL, CAST(N'2022-09-10T20:07:00' AS SmallDateTime))
INSERT [Venta].[Cliente] ([id_cliente], [cuit], [razon_social], [domicilio], [telefono], [dni], [mail], [fecha_alta]) VALUES (33, N'23537574581', N'TORTUGA RESTAURANTE', N'AVDA. AZTECA 123', NULL, N'53757458', NULL, CAST(N'2022-09-10T20:07:00' AS SmallDateTime))
INSERT [Venta].[Cliente] ([id_cliente], [cuit], [razon_social], [domicilio], [telefono], [dni], [mail], [fecha_alta]) VALUES (34, N'23708162219', N'DU MONDE ENTIER', N'67, RUE DES CINQUANTE OTAGES', NULL, N'70816221', NULL, CAST(N'2022-09-10T20:07:00' AS SmallDateTime))
INSERT [Venta].[Cliente] ([id_cliente], [cuit], [razon_social], [domicilio], [telefono], [dni], [mail], [fecha_alta]) VALUES (35, N'23708257589', N'GALERÍA DEL GASTRÓNOMO', N'RAMBLA DE CATALUÑA, 23', NULL, N'70825758', NULL, CAST(N'2022-09-10T20:07:00' AS SmallDateTime))
INSERT [Venta].[Cliente] ([id_cliente], [cuit], [razon_social], [domicilio], [telefono], [dni], [mail], [fecha_alta]) VALUES (36, N'27656319263', N'LILA-SUPERMERCADO', N'CARRERA 52 CON AVE. BOLÍVAR #65-98 LLANO LARGO', NULL, N'65631926', NULL, CAST(N'2022-09-10T20:07:00' AS SmallDateTime))
INSERT [Venta].[Cliente] ([id_cliente], [cuit], [razon_social], [domicilio], [telefono], [dni], [mail], [fecha_alta]) VALUES (37, N'30500089624', N'WILMAN KALA', N'KESKUSKATU 45', NULL, N'50008962', NULL, CAST(N'2022-09-10T20:07:00' AS SmallDateTime))
INSERT [Venta].[Cliente] ([id_cliente], [cuit], [razon_social], [domicilio], [telefono], [dni], [mail], [fecha_alta]) VALUES (38, N'30500090029', N'OTTILIES KÄSELADEN', N'MEHRHEIMERSTR. 369', NULL, N'50009002', NULL, CAST(N'2022-09-10T20:07:00' AS SmallDateTime))
INSERT [Venta].[Cliente] ([id_cliente], [cuit], [razon_social], [domicilio], [telefono], [dni], [mail], [fecha_alta]) VALUES (39, N'30500092242', N'MÈRE PAILLARDE', N'43 RUE ST. LAURENT', NULL, N'50009224', NULL, CAST(N'2022-09-10T20:07:00' AS SmallDateTime))
INSERT [Venta].[Cliente] ([id_cliente], [cuit], [razon_social], [domicilio], [telefono], [dni], [mail], [fecha_alta]) VALUES (40, N'30500094156', N'MAGAZZINI ALIMENTARI RIUNITI  ', N'VIA LUDOVICO IL MORO 22', NULL, N'50009415', NULL, CAST(N'2022-09-10T20:07:00' AS SmallDateTime))
INSERT [Venta].[Cliente] ([id_cliente], [cuit], [razon_social], [domicilio], [telefono], [dni], [mail], [fecha_alta]) VALUES (41, N'30500117571', N'OCÉANO ATLÁNTICO LTDA.', N'ING. GUSTAVO MONCADA 8585 PISO 20-A', NULL, N'50011757', NULL, CAST(N'2022-09-10T20:07:00' AS SmallDateTime))
INSERT [Venta].[Cliente] ([id_cliente], [cuit], [razon_social], [domicilio], [telefono], [dni], [mail], [fecha_alta]) VALUES (42, N'30500124152', N'BS BEVERAGES', N'FAUNTLEROY CIRCUS', NULL, N'50012415', NULL, CAST(N'2022-09-10T20:07:00' AS SmallDateTime))
INSERT [Venta].[Cliente] ([id_cliente], [cuit], [razon_social], [domicilio], [telefono], [dni], [mail], [fecha_alta]) VALUES (43, N'30500152547', N'OLD WORLD DELICATESSEN', N'2743 BERING ST.', NULL, N'50015254', NULL, CAST(N'2022-09-10T20:07:00' AS SmallDateTime))
INSERT [Venta].[Cliente] ([id_cliente], [cuit], [razon_social], [domicilio], [telefono], [dni], [mail], [fecha_alta]) VALUES (44, N'30500802568', N'PARIS SPÉCIALITÉS', N'265, BOULEVARD CHARONNE', NULL, N'50080256', NULL, CAST(N'2022-09-10T20:07:00' AS SmallDateTime))
INSERT [Venta].[Cliente] ([id_cliente], [cuit], [razon_social], [domicilio], [telefono], [dni], [mail], [fecha_alta]) VALUES (45, N'30516782362', N'ANA TRUJILLO EMPAREDADOS Y HELADOS  ', N'AVDA. DE LA CONSTITUCIÓN 2222', NULL, N'51678236', NULL, CAST(N'2022-09-10T20:07:00' AS SmallDateTime))
INSERT [Venta].[Cliente] ([id_cliente], [cuit], [razon_social], [domicilio], [telefono], [dni], [mail], [fecha_alta]) VALUES (46, N'30517292792', N'ALFREDS FUTTERKISTE ', N'OBERE STR. 57', NULL, N'51729279', NULL, CAST(N'2022-09-10T20:07:00' AS SmallDateTime))
INSERT [Venta].[Cliente] ([id_cliente], [cuit], [razon_social], [domicilio], [telefono], [dni], [mail], [fecha_alta]) VALUES (47, N'30521827765', N'RANCHO GRANDE', N'AV. DEL LIBERTADOR 900', NULL, N'52182776', NULL, CAST(N'2022-09-10T20:07:00' AS SmallDateTime))
INSERT [Venta].[Cliente] ([id_cliente], [cuit], [razon_social], [domicilio], [telefono], [dni], [mail], [fecha_alta]) VALUES (48, N'30537574581', N'QUE DELÍCIA', N'RUA DA PANIFICADORA, 12', NULL, N'53757458', NULL, CAST(N'2022-09-10T20:07:00' AS SmallDateTime))
INSERT [Venta].[Cliente] ([id_cliente], [cuit], [razon_social], [domicilio], [telefono], [dni], [mail], [fecha_alta]) VALUES (49, N'30544486183', N'LONESOME PINE RESTAURANT ', N'89 CHIAROSCURO RD.', NULL, N'54448618', NULL, CAST(N'2022-09-10T20:07:00' AS SmallDateTime))
INSERT [Venta].[Cliente] ([id_cliente], [cuit], [razon_social], [domicilio], [telefono], [dni], [mail], [fecha_alta]) VALUES (50, N'30548274997', N'BÓLIDO COMIDAS PREPARADAS', N'C/ ARAQUIL, 67', NULL, N'54827499', NULL, CAST(N'2022-09-10T20:07:00' AS SmallDateTime))
INSERT [Venta].[Cliente] ([id_cliente], [cuit], [razon_social], [domicilio], [telefono], [dni], [mail], [fecha_alta]) VALUES (51, N'30549547288', N'CHOP-SUEY CHINESE', N'HAUPTSTR. 29', NULL, N'54954728', NULL, CAST(N'2022-09-10T20:07:00' AS SmallDateTime))
INSERT [Venta].[Cliente] ([id_cliente], [cuit], [razon_social], [domicilio], [telefono], [dni], [mail], [fecha_alta]) VALUES (52, N'30556056702', N'PERICLES COMIDAS CLÁSICAS', N'CALLE DR. JORGE CASH 321', NULL, N'55605670', NULL, CAST(N'2022-09-10T20:07:00' AS SmallDateTime))
INSERT [Venta].[Cliente] ([id_cliente], [cuit], [razon_social], [domicilio], [telefono], [dni], [mail], [fecha_alta]) VALUES (53, N'30560956904', N'THE BIG CHEESE', N'89 JEFFERSON WAY SUITE 2', NULL, N'56095690', NULL, CAST(N'2022-09-10T20:07:00' AS SmallDateTime))
INSERT [Venta].[Cliente] ([id_cliente], [cuit], [razon_social], [domicilio], [telefono], [dni], [mail], [fecha_alta]) VALUES (54, N'30570948012', N'TOMS SPEZIALITÄTEN', N'LUISENSTR. 48', NULL, N'57094801', NULL, CAST(N'2022-09-10T20:07:00' AS SmallDateTime))
INSERT [Venta].[Cliente] ([id_cliente], [cuit], [razon_social], [domicilio], [telefono], [dni], [mail], [fecha_alta]) VALUES (55, N'30582622945', N'PRINCESA ISABEL VINHOS', N'ESTRADA DA SAÚDE N. 58', NULL, N'58262294', NULL, CAST(N'2022-09-10T20:07:00' AS SmallDateTime))
INSERT [Venta].[Cliente] ([id_cliente], [cuit], [razon_social], [domicilio], [telefono], [dni], [mail], [fecha_alta]) VALUES (56, N'30596993873', N'ISLAND TRADING', N'GARDEN HOUSE CROWTHER WAY', NULL, N'59699387', NULL, CAST(N'2022-09-10T20:07:00' AS SmallDateTime))
INSERT [Venta].[Cliente] ([id_cliente], [cuit], [razon_social], [domicilio], [telefono], [dni], [mail], [fecha_alta]) VALUES (57, N'30617999966', N'QUICK-STOP', N'TAUCHERSTRAßE 10', NULL, N'61799996', NULL, CAST(N'2022-09-10T20:07:00' AS SmallDateTime))
INSERT [Venta].[Cliente] ([id_cliente], [cuit], [razon_social], [domicilio], [telefono], [dni], [mail], [fecha_alta]) VALUES (58, N'30632161146', N'BERGLUNDS SNABBKÖP', N'BERGUVSVÄGEN  8', NULL, N'63216114', NULL, CAST(N'2022-09-10T20:07:00' AS SmallDateTime))
INSERT [Venta].[Cliente] ([id_cliente], [cuit], [razon_social], [domicilio], [telefono], [dni], [mail], [fecha_alta]) VALUES (59, N'30633008775', N'LINO-DELICATESES', N'AVE. 5 DE MAYO PORLAMAR', NULL, N'63300877', NULL, CAST(N'2022-09-10T20:07:00' AS SmallDateTime))
INSERT [Venta].[Cliente] ([id_cliente], [cuit], [razon_social], [domicilio], [telefono], [dni], [mail], [fecha_alta]) VALUES (60, N'30642028754', N'ANTONIO MORENO TAQUERÍA', N'MATADEROS  2312', NULL, N'64202875', NULL, CAST(N'2022-09-10T20:07:00' AS SmallDateTime))
INSERT [Venta].[Cliente] ([id_cliente], [cuit], [razon_social], [domicilio], [telefono], [dni], [mail], [fecha_alta]) VALUES (61, N'30645953556', N'AROUND THE HORN', N'120 HANOVER SQ.', NULL, N'64595355', NULL, CAST(N'2022-09-10T20:07:00' AS SmallDateTime))
INSERT [Venta].[Cliente] ([id_cliente], [cuit], [razon_social], [domicilio], [telefono], [dni], [mail], [fecha_alta]) VALUES (62, N'30654118767', N'HANARI CARNES', N'RUA DO PAÇO, 67', NULL, N'65411876', NULL, CAST(N'2022-09-10T20:07:00' AS SmallDateTime))
INSERT [Venta].[Cliente] ([id_cliente], [cuit], [razon_social], [domicilio], [telefono], [dni], [mail], [fecha_alta]) VALUES (63, N'30656319263', N'BLONDESDDSL PÈRE ET FILS', N'24, PLACE KLÉBER', NULL, N'65631926', NULL, CAST(N'2022-09-10T20:07:00' AS SmallDateTime))
INSERT [Venta].[Cliente] ([id_cliente], [cuit], [razon_social], [domicilio], [telefono], [dni], [mail], [fecha_alta]) VALUES (64, N'30657132000', N'LAUGHING BACCHUS WINE CELLARS', N'1900 OAK ST.', NULL, N'65713200', NULL, CAST(N'2022-09-10T20:07:00' AS SmallDateTime))
INSERT [Venta].[Cliente] ([id_cliente], [cuit], [razon_social], [domicilio], [telefono], [dni], [mail], [fecha_alta]) VALUES (65, N'30661798501', N'NORTH/SOUTH', N'SOUTH HOUSE 300 QUEENSBRIDGE', NULL, N'66179850', NULL, CAST(N'2022-09-10T20:07:00' AS SmallDateTime))
INSERT [Venta].[Cliente] ([id_cliente], [cuit], [razon_social], [domicilio], [telefono], [dni], [mail], [fecha_alta]) VALUES (66, N'30662145110', N'KÖNIGLICH ESSEN', N'MAUBELSTR. 90', NULL, N'66214511', NULL, CAST(N'2022-09-10T20:07:00' AS SmallDateTime))
INSERT [Venta].[Cliente] ([id_cliente], [cuit], [razon_social], [domicilio], [telefono], [dni], [mail], [fecha_alta]) VALUES (67, N'30677645896', N'GREAT LAKES FOOD MARKET', N'2732 BAKER BLVD.', NULL, N'67764589', NULL, CAST(N'2022-09-10T20:07:00' AS SmallDateTime))
INSERT [Venta].[Cliente] ([id_cliente], [cuit], [razon_social], [domicilio], [telefono], [dni], [mail], [fecha_alta]) VALUES (68, N'30679107220', N'LA CORNE DABONDANCE', N'67, AVENUE DE LEUROPE', NULL, N'67910722', NULL, CAST(N'2022-09-10T20:07:00' AS SmallDateTime))
INSERT [Venta].[Cliente] ([id_cliente], [cuit], [razon_social], [domicilio], [telefono], [dni], [mail], [fecha_alta]) VALUES (69, N'30696376782', N'RICHTER SUPERMARKT', N'GRENZACHERWEG 237', NULL, N'69637678', NULL, CAST(N'2022-09-10T20:07:00' AS SmallDateTime))
INSERT [Venta].[Cliente] ([id_cliente], [cuit], [razon_social], [domicilio], [telefono], [dni], [mail], [fecha_alta]) VALUES (70, N'30697615713', N'HILARION-ABASTOS', N'CARRERA 22 CON AVE. CARLOS SOUBLETTE #8-35', NULL, N'69761571', NULL, CAST(N'2022-09-10T20:07:00' AS SmallDateTime))
INSERT [Venta].[Cliente] ([id_cliente], [cuit], [razon_social], [domicilio], [telefono], [dni], [mail], [fecha_alta]) VALUES (71, N'30698101985', N'BON APP', N'12, RUE DES BOUCHERS', NULL, N'69810198', NULL, CAST(N'2022-09-10T20:07:00' AS SmallDateTime))
INSERT [Venta].[Cliente] ([id_cliente], [cuit], [razon_social], [domicilio], [telefono], [dni], [mail], [fecha_alta]) VALUES (72, N'30701749150', N'PICCOLO UND MEHR', N'GEISLWEG 14', NULL, N'70174915', NULL, CAST(N'2022-09-10T20:07:00' AS SmallDateTime))
INSERT [Venta].[Cliente] ([id_cliente], [cuit], [razon_social], [domicilio], [telefono], [dni], [mail], [fecha_alta]) VALUES (73, N'30702221710', N'RATTLESNAKE CANYON GROCERY', N'2817 MILTON DR.', NULL, N'70222171', NULL, CAST(N'2022-09-10T20:07:00' AS SmallDateTime))
INSERT [Venta].[Cliente] ([id_cliente], [cuit], [razon_social], [domicilio], [telefono], [dni], [mail], [fecha_alta]) VALUES (74, N'30703067898', N'REGGIANI CASEIFICI', N'STRADA PROVINCIALE 124', NULL, N'70306789', NULL, CAST(N'2022-09-10T20:07:00' AS SmallDateTime))
INSERT [Venta].[Cliente] ([id_cliente], [cuit], [razon_social], [domicilio], [telefono], [dni], [mail], [fecha_alta]) VALUES (75, N'30707467254', N'HUNGRY COYOTE IMPORT STORE', N'CITY CENTER PLAZA 516 MAIN ST.  ', NULL, N'70746725', NULL, CAST(N'2022-09-10T20:07:00' AS SmallDateTime))
INSERT [Venta].[Cliente] ([id_cliente], [cuit], [razon_social], [domicilio], [telefono], [dni], [mail], [fecha_alta]) VALUES (76, N'30707721509', N'LETS STOP N SHOP', N'87 POLK ST. SUITE 5', NULL, N'70772150', NULL, CAST(N'2022-09-10T20:07:00' AS SmallDateTime))
INSERT [Venta].[Cliente] ([id_cliente], [cuit], [razon_social], [domicilio], [telefono], [dni], [mail], [fecha_alta]) VALUES (77, N'30709311049', N'QUEEN COZINHA', N'ALAMEDA DOS CANÀRIOS, 891', NULL, N'70931104', NULL, CAST(N'2022-09-10T20:07:00' AS SmallDateTime))
INSERT [Venta].[Cliente] ([id_cliente], [cuit], [razon_social], [domicilio], [telefono], [dni], [mail], [fecha_alta]) VALUES (78, N'30709386642', N'BLAUER SEE DELIKATESSEN', N'FORSTERSTR. 57', NULL, N'70938664', NULL, CAST(N'2022-09-10T20:07:00' AS SmallDateTime))
INSERT [Venta].[Cliente] ([id_cliente], [cuit], [razon_social], [domicilio], [telefono], [dni], [mail], [fecha_alta]) VALUES (79, N'30711570000', N'LAZY K KOUNTRY STORE', N'12 ORCHESTRA TERRACE', NULL, N'71157000', NULL, CAST(N'2022-09-10T20:07:00' AS SmallDateTime))
INSERT [Venta].[Cliente] ([id_cliente], [cuit], [razon_social], [domicilio], [telefono], [dni], [mail], [fecha_alta]) VALUES (80, N'30712355944', N'ROMERO Y TOMILLO', N'GRAN VÍA, 1', NULL, N'71235594', NULL, CAST(N'2022-09-10T20:07:00' AS SmallDateTime))
INSERT [Venta].[Cliente] ([id_cliente], [cuit], [razon_social], [domicilio], [telefono], [dni], [mail], [fecha_alta]) VALUES (81, N'31500094156', N'SUPRÊMES DÉLICES', N'BOULEVARD TIROU, 255', NULL, N'50009415', NULL, CAST(N'2022-09-10T20:07:00' AS SmallDateTime))
INSERT [Venta].[Cliente] ([id_cliente], [cuit], [razon_social], [domicilio], [telefono], [dni], [mail], [fecha_alta]) VALUES (82, N'31560956904', N'MAISON DEWEY', N'RUE JOSEPH-BENS 532', NULL, N'56095690', NULL, CAST(N'2022-09-10T20:07:00' AS SmallDateTime))
INSERT [Venta].[Cliente] ([id_cliente], [cuit], [razon_social], [domicilio], [telefono], [dni], [mail], [fecha_alta]) VALUES (83, N'31617999966', N'SAVE-A-LOT MARKETS', N'187 SUFFOLK LN.', NULL, N'61799996', NULL, CAST(N'2022-09-10T20:07:00' AS SmallDateTime))
INSERT [Venta].[Cliente] ([id_cliente], [cuit], [razon_social], [domicilio], [telefono], [dni], [mail], [fecha_alta]) VALUES (84, N'31633008775', N'SPÉCIALITÉS DU MONDE', N'25, RUE LAURISTON', NULL, N'63300877', NULL, CAST(N'2022-09-10T20:07:00' AS SmallDateTime))
INSERT [Venta].[Cliente] ([id_cliente], [cuit], [razon_social], [domicilio], [telefono], [dni], [mail], [fecha_alta]) VALUES (85, N'32544486183', N'SPLIT RAIL BEER & ALE', N'P.O. BOX 555', NULL, N'54448618', NULL, CAST(N'2022-09-10T20:07:00' AS SmallDateTime))
INSERT [Venta].[Cliente] ([id_cliente], [cuit], [razon_social], [domicilio], [telefono], [dni], [mail], [fecha_alta]) VALUES (86, N'33500365019', N'WELLINGTON IMPORTADORA', N'RUA DO MERCADO, 12', NULL, N'50036501', NULL, CAST(N'2022-09-10T20:07:00' AS SmallDateTime))
INSERT [Venta].[Cliente] ([id_cliente], [cuit], [razon_social], [domicilio], [telefono], [dni], [mail], [fecha_alta]) VALUES (87, N'33527019759', N'CENTRO COMERCIAL MOCTEZUMA  ', N'SIERRAS DE GRANADA 9993', NULL, N'52701975', NULL, CAST(N'2022-09-10T20:07:00' AS SmallDateTime))
INSERT [Venta].[Cliente] ([id_cliente], [cuit], [razon_social], [domicilio], [telefono], [dni], [mail], [fecha_alta]) VALUES (88, N'33578212219', N'LEHMANNS MARKTSTAND', N'MAGAZINWEG 7', NULL, N'57821221', NULL, CAST(N'2022-09-10T20:07:00' AS SmallDateTime))
INSERT [Venta].[Cliente] ([id_cliente], [cuit], [razon_social], [domicilio], [telefono], [dni], [mail], [fecha_alta]) VALUES (89, N'33582622945', N'SEVEN SEAS IMPORTS', N'90 WADHURST RD.', NULL, N'58262294', NULL, CAST(N'2022-09-10T20:07:00' AS SmallDateTime))
INSERT [Venta].[Cliente] ([id_cliente], [cuit], [razon_social], [domicilio], [telefono], [dni], [mail], [fecha_alta]) VALUES (90, N'33708162219', N'HUNGRY OWL ALL-NIGHT GROCERS', N'8 JOHNSTOWN ROAD', NULL, N'70816221', NULL, CAST(N'2022-09-10T20:07:00' AS SmallDateTime))
INSERT [Venta].[Cliente] ([id_cliente], [cuit], [razon_social], [domicilio], [telefono], [dni], [mail], [fecha_alta]) VALUES (91, N'33708257589', N'LA MAISON DASIE', N'1 RUE ALSACE-LORRAINE', NULL, N'70825758', NULL, CAST(N'2022-09-10T20:07:00' AS SmallDateTime))
SET IDENTITY_INSERT [Venta].[Cliente] OFF
GO
