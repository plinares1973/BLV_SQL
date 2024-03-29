USE [BLV]
GO
/****** Object:  StoredProcedure [Costo].[Impacta_Valor_Carga]    Script Date: 6/7/2023 8:42:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Costo].[Impacta_Valor_Carga]
	@id_orden_compra int
	,@id_concepto_header int
	,@valor float
AS
BEGIN TRANSACTION
	BEGIN TRY
		UPDATE
			Proceso.Costo_a_Calcular
		SET
			valor=@valor
		WHERE
			id_orden_compra=@id_orden_compra
			AND id_concepto_header=@id_concepto_header;

		COMMIT;
	END TRY
	BEGIN CATCH
		print @@error
		ROLLBACK;
	END CATCH
	
GO
