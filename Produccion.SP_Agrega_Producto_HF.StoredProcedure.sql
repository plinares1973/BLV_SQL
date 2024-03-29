USE [BLV]
GO
/****** Object:  StoredProcedure [Produccion].[SP_Agrega_Producto_HF]    Script Date: 6/7/2023 8:42:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
Execute Compra.SP_Agrega_Producto_OC 1,1,1,1000,15000,1
select * from produccion.producto
select * from produccion.empaque
select * from produccion.medida


*/



CREATE  PROCEDURE [Produccion].[SP_Agrega_Producto_HF](
	@id_hoja_fabricacion INT
	,@cantidad INT
	,@codigo_producto VARCHAR(10)
	,@codigo_lote VARCHAR(10)
	,@cuarentena int
)
AS
BEGIN


	DECLARE @id_producto INT;
	
	SET @id_producto=(SELECT	
						LP.id_producto
					FROM
						Compra.Lote L
						INNER JOIN Relacion.Lote_Producto   LP ON LP.id_batch=L.id_batch
						INNER JOIN Produccion.Producto P ON P.id_producto=LP.id_producto
					WHERE
						L.codigo_lote=@codigo_lote
						AND P.codigo_producto=@codigo_producto
						AND lp.cuarentena=@cuarentena
						);

	
						


	BEGIN TRANSACTION
		BEGIN TRY
			
			INSERT INTO Proceso.Hoja_Fabricacion(
				id_hoja_fabrica
				,id_producto
				,cantidad
			
			)
			VALUES(
				@id_hoja_fabricacion
				,@id_producto
				,@cantidad
			)

				
		


			COMMIT;

		END TRY
		BEGIN CATCH
			print @@error;
			ROLLBACK;
		END CATCH
END
GO
