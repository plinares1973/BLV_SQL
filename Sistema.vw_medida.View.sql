USE [BLV]
GO
/****** Object:  View [Sistema].[vw_medida]    Script Date: 17/5/2023 1:14:13 a. m. ******/
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
