USE [BLV]
GO
/****** Object:  View [Sistema].[vw_medida]    Script Date: 19/6/2023 2:57:30 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [Sistema].[vw_medida] AS
SELECT 
	id_medida 
	,descripcion as MEDIDA
FROM Produccion.medida
GO
