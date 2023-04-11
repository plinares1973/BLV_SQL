USE [BLV]
GO
/****** Object:  Table [Relacion].[Pais_Continente]    Script Date: 10/4/2023 11:10:41 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Relacion].[Pais_Continente](
	[id_pais_continente] [int] IDENTITY(1,1) NOT NULL,
	[id_pais] [int] NULL,
	[id_continente] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_pais_continente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [Relacion].[Pais_Continente] ON 

INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (1, 102, 1)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (2, 103, 1)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (3, 104, 1)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (4, 106, 1)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (5, 107, 1)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (6, 108, 1)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (7, 109, 1)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (8, 110, 1)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (9, 111, 1)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (10, 112, 1)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (11, 113, 1)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (12, 115, 1)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (13, 117, 1)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (14, 118, 1)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (15, 121, 1)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (16, 122, 1)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (17, 123, 1)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (18, 125, 1)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (19, 126, 1)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (20, 128, 1)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (21, 131, 1)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (22, 136, 1)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (23, 141, 1)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (24, 142, 1)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (25, 143, 1)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (26, 144, 1)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (27, 147, 1)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (28, 198, 1)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (29, 101, 2)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (30, 114, 2)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (31, 116, 2)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (32, 119, 2)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (33, 120, 2)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (34, 124, 2)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (35, 129, 2)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (36, 130, 2)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (37, 132, 2)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (38, 135, 2)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (39, 137, 2)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (40, 138, 2)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (41, 139, 2)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (42, 145, 2)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (43, 146, 2)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (44, 148, 2)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (45, 154, 2)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (46, 156, 2)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (47, 157, 2)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (48, 158, 2)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (49, 170, 2)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (50, 171, 2)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (51, 172, 2)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (52, 173, 2)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (53, 174, 2)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (54, 175, 2)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (55, 176, 2)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (56, 177, 2)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (57, 436, 2)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (58, 199, 2)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (59, 201, 3)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (60, 202, 3)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (61, 203, 3)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (62, 204, 3)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (63, 205, 3)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (64, 206, 3)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (65, 207, 3)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (66, 208, 3)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (67, 209, 3)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (68, 210, 3)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (69, 211, 3)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (70, 212, 3)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (71, 213, 3)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (72, 214, 3)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (73, 215, 3)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (74, 216, 3)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (75, 217, 3)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (76, 218, 3)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (77, 219, 3)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (78, 220, 3)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (79, 221, 3)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (80, 222, 3)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (81, 223, 3)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (82, 224, 3)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (83, 225, 3)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (84, 226, 3)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (85, 227, 3)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (86, 228, 3)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (87, 229, 3)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (88, 230, 3)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (89, 231, 3)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (90, 232, 3)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (91, 233, 3)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (92, 234, 3)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (93, 235, 3)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (94, 236, 3)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (95, 237, 3)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (96, 238, 3)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (97, 239, 3)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (98, 240, 3)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (99, 241, 3)
GO
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (100, 242, 3)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (101, 243, 3)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (102, 244, 3)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (103, 245, 3)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (104, 246, 3)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (105, 247, 3)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (106, 248, 3)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (107, 249, 3)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (108, 250, 3)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (109, 251, 3)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (110, 252, 3)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (111, 253, 3)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (112, 260, 3)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (113, 261, 3)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (114, 262, 3)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (115, 263, 3)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (116, 299, 3)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (117, 301, 4)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (118, 302, 4)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (119, 303, 4)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (120, 370, 4)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (121, 371, 4)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (122, 396, 4)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (123, 310, 5)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (124, 311, 5)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (125, 312, 5)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (126, 313, 5)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (127, 314, 5)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (128, 315, 5)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (129, 316, 5)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (130, 317, 5)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (131, 318, 5)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (132, 319, 5)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (133, 320, 5)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (134, 321, 5)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (135, 322, 5)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (136, 323, 5)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (137, 324, 5)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (138, 325, 5)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (139, 326, 5)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (140, 327, 5)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (141, 328, 5)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (142, 329, 5)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (143, 380, 5)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (144, 381, 5)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (145, 382, 5)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (146, 383, 5)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (147, 384, 5)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (148, 385, 5)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (149, 386, 5)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (150, 387, 5)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (151, 388, 5)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (152, 389, 5)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (153, 390, 5)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (154, 391, 5)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (155, 392, 5)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (156, 393, 5)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (157, 398, 5)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (158, 340, 6)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (159, 341, 6)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (160, 342, 6)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (161, 343, 6)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (162, 344, 6)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (163, 345, 6)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (164, 346, 6)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (165, 347, 6)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (166, 348, 6)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (167, 349, 6)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (168, 350, 6)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (169, 351, 6)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (170, 394, 6)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (171, 395, 6)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (172, 399, 6)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (173, 401, 7)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (174, 402, 7)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (175, 403, 7)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (176, 404, 7)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (177, 405, 7)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (178, 407, 7)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (179, 408, 7)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (180, 409, 7)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (181, 410, 7)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (182, 411, 7)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (183, 412, 7)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (184, 413, 7)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (185, 414, 7)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (186, 415, 7)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (187, 416, 7)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (188, 417, 7)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (189, 418, 7)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (190, 419, 7)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (191, 420, 7)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (192, 421, 7)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (193, 422, 7)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (194, 423, 7)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (195, 424, 7)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (196, 425, 7)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (197, 426, 7)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (198, 427, 7)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (199, 430, 7)
GO
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (200, 431, 7)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (201, 432, 7)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (202, 433, 7)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (203, 434, 7)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (204, 435, 7)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (205, 437, 7)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (206, 439, 7)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (207, 440, 7)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (208, 441, 7)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (209, 442, 7)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (210, 443, 7)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (211, 444, 7)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (212, 445, 7)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (213, 446, 7)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (214, 447, 7)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (215, 448, 7)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (216, 449, 7)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (217, 450, 7)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (218, 453, 7)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (219, 454, 7)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (220, 455, 7)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (221, 499, 7)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (222, 501, 8)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (223, 502, 8)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (224, 504, 8)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (225, 505, 8)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (226, 506, 8)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (227, 507, 8)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (228, 508, 8)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (229, 509, 8)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (230, 511, 8)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (231, 512, 8)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (232, 513, 8)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (233, 515, 8)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (234, 516, 8)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (235, 517, 8)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (236, 520, 8)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (237, 521, 8)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (238, 522, 8)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (239, 523, 8)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (240, 524, 8)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (241, 525, 8)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (242, 526, 8)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (243, 527, 8)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (244, 528, 8)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (245, 599, 8)
SET IDENTITY_INSERT [Relacion].[Pais_Continente] OFF
GO
