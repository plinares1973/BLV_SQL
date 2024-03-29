USE [BLV]
GO
/****** Object:  StoredProcedure [Produccion].[SP_Impactar_Stock_Paso_Tres]    Script Date: 6/7/2023 8:42:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*


DECLARE @fecha1 date
DECLARE @fecha2 date

SET @fecha1=getdate()
SET @fecha2=getdate()
Execute Produccion.SP_Impactar_Stock_Paso_Tres 5,19,11,'PRC001',@fecha1,@fecha2,0


(1 row affected)

(0 rows affected)

(1 row affected)

Completion time: 2023-01-25T16:38:21.9115405-03:00
*/




CREATE PROCEDURE [Produccion].[SP_Impactar_Stock_Paso_Tres]
	@id_lote int
	,@id_stock	int

AS
	BEGIN TRAN

		BEGIN TRY



			INSERT INTO Relacion.Lote_Stock(
				id_batch
				,id_stock
				,fecha_impacto
		
			)VALUES
			(
				@id_lote
				,@id_stock
				,getdate()
		
			);

			UPDATE Produccion.stock SET disponible=0 WHERE id_stock=@id_stock;
			
			
			COMMIT;

	END TRY
	BEGIN CATCH

			print @@error;
			ROLLBACK;
	END CATCH

GO
