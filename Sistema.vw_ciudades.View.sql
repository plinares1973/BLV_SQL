USE [BLV]
GO
/****** Object:  View [Sistema].[vw_ciudades]    Script Date: 6/7/2023 8:42:53 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE   VIEW [Sistema].[vw_ciudades]
AS
	SELECT
		cc.nombre AS 'CONTINENTE'
		,p.nombre AS 'PAIS'
		,dp.nombre AS 'ESTADO'
		,c.nombre AS 'CIUDAD'
		,c.id_ciudad AS 'ID_CIUDAD'
	FROM
		Sistema.Continente cc
		INNER JOIN Relacion.Pais_Continente rpc ON rpc.id_continente=cc.id_continente
		INNER JOIN Sistema.Pais p ON p.id_pais=rpc.id_pais
		INNER JOIN Relacion.Pais_DP rdp ON rdp.id_pais=p.id_pais
		INNER JOIN Sistema.Division_Politica dp ON dp.id_division_politica=rdp.id_division_politica
		INNER JOIN Relacion.DP_Ciudad rdc ON rdc.id_division_politica=dp.id_division_politica
		INNER JOIN Sistema.Ciudad c ON c.id_ciudad=rdc.id_ciudad
GO
