USE [BLV]
GO
/****** Object:  StoredProcedure [Proceso].[SP_Impactar_Tablon_Stock_002]    Script Date: 17/5/2023 1:14:14 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Proceso].[SP_Impactar_Tablon_Stock_002]
	@numero_importacion nvarchar(50)
	,@id_lote int
	,@cantidad int
	,@posiciones_deposito int

AS



BEGIN TRAN
	BEGIN TRY
		UPDATE 
			Proceso.Tablon_Impacto_Stock 
		SET 
			cantidad=@cantidad
			,posiciones_deposito=@posiciones_deposito
		WHERE
			numero_importacion=@numero_importacion
			AND id_lote=@id_lote;


					

	

		COMMIT;
	END TRY
	BEGIN CATCH
		
		
		ROLLBACK;
	END CATCH
GO
