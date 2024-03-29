USE [BLV]
GO
/****** Object:  StoredProcedure [Produccion].[SP_Impactar_Stock_Cuarentena]    Script Date: 6/7/2023 8:42:56 p. m. ******/
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




CREATE PROCEDURE [Produccion].[SP_Impactar_Stock_Cuarentena]
	@codigo_lote varchar(10)
	,@id_stock	int

AS
	DECLARE @id_lote_producto int;
	DECLARE @id_batch int;

	BEGIN TRAN

		BEGIN TRY

			SET @id_lote_producto=(SELECT 
										LP.id_lote_producto
									FROM
										Relacion.Lote_Producto LP
										INNER JOIN Compra.Lote  L ON L.id_batch=LP.id_batch
									WHERE 
										L.codigo_lote=@codigo_lote
										AND LP.cuarentena=1);

			SET @id_batch=(SELECT 
										lp.id_batch
									FROM
										Relacion.Lote_Producto LP
										
									WHERE 
										lp.id_lote_producto=@id_lote_producto);


			INSERT INTO Relacion.Stock_Cuarentena(
				id_lote_producto
				,id_stock
				,id_batch
				,fecha_impacto
		
			)VALUES
			(
				@id_lote_producto
				,@id_stock
				,@id_batch
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
