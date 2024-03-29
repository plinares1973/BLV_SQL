USE [BLV]
GO
/****** Object:  StoredProcedure [Proceso].[SP_Orden_Compra_Tablon]    Script Date: 6/7/2023 8:42:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Proceso].[SP_Orden_Compra_Tablon]
	@id_orden_compra int
	,@numero_importacion nvarchar(50)
AS

	BEGIN TRY
		SELECT
			numero_importacion AS 'NUMERO IMPORTACION'
			,id_lote AS 'CODIGO DE LOTE'
			,codigo_producto AS 'CODIGO DE PRODUCTO'
			,marca AS 'MARCA'
			,isnull(cantidad,0) AS 'CANTIDAD ASIGNADA AL LOTE'
			,isnull(posiciones_deposito,0) AS 'POSICIONES ASIGNADAS AL LOTE'
		FROM
			Proceso.Tablon_Impacto_Stock
		WHERE
			id_compra=@id_orden_compra
			AND numero_importacion=@numero_importacion; 

	END TRY

	BEGIN CATCH
		print @@error;
	END CATCH
GO
