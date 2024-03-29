USE [BLV]
GO
/****** Object:  View [Sistema].[vw_empaque]    Script Date: 6/7/2023 8:42:53 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [Sistema].[vw_empaque] AS
SELECT 
	e.id_empaque 
	,e.descripcion as EMPAQUE
	,ce.id_capacidad_envase
	,e.id_medida_envase
FROM 
	Produccion.empaque E
	INNER JOIN Produccion.Capacidad_envase CE ON CE.id_empaque=E.id_empaque;
GO
