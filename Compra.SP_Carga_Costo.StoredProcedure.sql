USE [BLV]
GO
/****** Object:  StoredProcedure [Compra].[SP_Carga_Costo]    Script Date: 6/7/2023 8:42:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Compra].[SP_Carga_Costo](
	@id_orden_compra int
	,@monto_flete float
)
AS
	BEGIN TRANSACTION
	BEGIN TRY


		UPDATE Relacion.Orden_Compra_Costo_Flete SET monto_flete=@monto_flete WHERE id_orden_compra=@id_orden_compra;
		COMMIT;

	END TRY
	BEGIN CATCH
		ROLLBACK;

	END CATCH
GO
