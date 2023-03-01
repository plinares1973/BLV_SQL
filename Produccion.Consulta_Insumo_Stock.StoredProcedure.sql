USE [BLV]
GO
/****** Object:  StoredProcedure [Produccion].[Consulta_Insumo_Stock]    Script Date: 1/3/2023 11:38:04 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Produccion].[Consulta_Insumo_Stock]
	

AS


BEGIN TRY

	SELECT
		e.descripcion AS EMPAQUE
		,ce.capacidad AS CAPACIDAD
		,m.descripcion AS MEDIDA
		,si.cantidad AS CANTIDAD
		,si.marca AS MARCA
	FROM
		Produccion.stock_insumo si
		INNER JOIN Produccion.Empaque e ON e.id_empaque=si.id_empaque
		INNER JOIN Produccion.Capacidad_Envase ce ON ce.id_capacidad_envase=si.id_capacidad
		INNER JOIN Produccion.Medida m ON m.id_medida=si.id_medida
	ORDER BY si.cantidad

END TRY
BEGIN CATCH
	print @@error;
END CATCH


GO
