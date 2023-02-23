USE [BLV]
GO
/****** Object:  StoredProcedure [Produccion].[SP_Impactar_Stock_Paso_Tres]    Script Date: 22/2/2023 10:12:21 p. m. ******/
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
	,@id_orden_compra int
	,@id_stock	int
	,@codigo_producto varchar(10)
	,@fecha_elaboracion date
	,@fecha_vencimiento date
	,@disponible int
AS
	DECLARE @cantidad int;
	DECLARE @id_medida int;
	DECLARE @id_empaque int;
	DECLARE @id_capacidad_envase int;
	DECLARE @id_producto int;

	BEGIN TRAN

		BEGIN TRY
			SET @id_producto=(SELECT
									id_producto
								FROM
									Produccion.Producto
								WHERE
									codigo_producto=@codigo_producto


			);


			SET @cantidad=(SELECT
								cantidad
							FROM
								Compra.Orden_Compra_Producto
							WHERE
								id_orden_compra=@id_orden_compra
								AND id_producto=@id_producto);

			SET @id_medida=(SELECT
								ocpm.id_medida
							FROM
								Compra.Orden_Compra_Producto ocp
								INNER JOIN Relacion.OC_Producto_Medida ocpm ON ocpm.id_ocompra_producto=ocp.id_ocompra_producto
							WHERE
								id_orden_compra=@id_orden_compra
								AND id_producto=@id_producto);


			SET @id_empaque=(SELECT
								ocpe.id_empaque
							FROM
								Compra.Orden_Compra_Producto ocp
								INNER JOIN Relacion.OC_Producto_Empaque ocpe ON ocpe.id_ocompra_producto=ocp.id_ocompra_producto
							WHERE
								id_orden_compra=@id_orden_compra
								AND id_producto=@id_producto);

			SET @id_capacidad_envase=(SELECT
								ocpe.id_capacidad_envase
							FROM
								Compra.Orden_Compra_Producto ocp
								INNER JOIN Relacion.OC_Producto_Empaque ocpe ON ocpe.id_ocompra_producto=ocp.id_ocompra_producto
							WHERE
								id_orden_compra=@id_orden_compra
								AND id_producto=@id_producto);


			INSERT INTO Relacion.Lote_Stock(
				id_batch
				,id_stock
				,cantidad
				,id_medida
				,id_empaque
				,id_producto
				,id_capacidad_envase
			)VALUES
			(
				@id_lote
				,@id_stock
				,@cantidad
				,@id_medida
				,@id_empaque
				,@id_producto
				,@id_capacidad_envase
			);

			UPDATE Produccion.stock SET disponible=@disponible WHERE id_stock=@id_stock;
			UPDATE Produccion.Producto 
					SET fecha_elaboracion=@fecha_elaboracion
						,fecha_vencimiento=@fecha_vencimiento
					WHERE id_producto=@id_producto;

			
			COMMIT;

		END TRY
		BEGIN CATCH

			print @@error;
			ROLLBACK;
		END CATCH

GO
