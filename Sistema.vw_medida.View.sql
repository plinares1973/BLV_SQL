USE [BLV]
GO
/****** Object:  View [Sistema].[vw_medida]    Script Date: 14/3/2023 11:16:38 a. m. ******/
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
