USE [BLV]
GO
/****** Object:  StoredProcedure [Produccion].[Consulta_Insumo_Stock]    Script Date: 6/7/2023 8:42:56 p. m. ******/
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
		,si.cantidad- sum(convert(int,isnull(HPH.cantidad_insumo,0))) AS CANTIDAD
		,sum(convert(int,isnull(HPH.cantidad_insumo,0))) AS COMPROMETIDO
		,si.marca AS MARCA
	FROM
		Produccion.stock_insumo si
		INNER JOIN Produccion.Empaque e ON e.id_empaque=si.id_empaque
		INNER JOIN Produccion.Capacidad_Envase ce ON ce.id_capacidad_envase=si.id_capacidad
		INNER JOIN Produccion.Medida m ON m.id_medida=si.id_medida
		LEFT JOIN Produccion.Hoja_Fabricacion_Header HPH ON HPH.id_stock_insumo=si.id_stock_insumo
	GROUP BY
		e.descripcion
		,ce.capacidad
		,m.descripcion
		,si.cantidad 

		,si.marca 
	ORDER BY si.cantidad

END TRY
BEGIN CATCH
	print @@error;
END CATCH


GO
