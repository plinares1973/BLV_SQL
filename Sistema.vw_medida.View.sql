USE [BLV]
GO
/****** Object:  View [Sistema].[vw_medida]    Script Date: 20/4/2023 12:37:58 a. m. ******/
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
