USE [BLV]
GO
/****** Object:  StoredProcedure [Compra].[SP_Cambia_Estado_OC]    Script Date: 6/7/2023 8:42:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- EXECUTE Compra.Cambia_Estado_OC 1

CREATE PROCEDURE [Compra].[SP_Cambia_Estado_OC]
	@id_orden_compra int
	,@id_estado int
	,@fecha_cambio date
	,@impacta bit out

AS
	DECLARE @id_estado_parametro int;
	SET @impacta=0;
	BEGIN TRANSACTION
		BEGIN TRY
		--DECLARE @estado_actual int

		--SET @estado_actual=(SELECT max(id_estado) FROM Relacion.Compra_Estado where id_compra=@id_orden_compra);

		--IF(@estado_actual<(SELECT max(id_estado) FROM Sistema.Estado))
		--BEGIN[Compra].[SP_Busca_Flete]
			
			SET @id_estado_parametro=(
										SELECT
											valor
										FROM
											Parametro.Compra
										WHERE
											id_parametro=1
									);


			IF(@id_estado=@id_estado_parametro) 
			BEGIN
				SET @impacta=1;
				--EXECUTE Produccion.SP_Impactar_Stock;

			END;
			
			UPDATE Relacion.Compra_Estado 
			SET vigente=0
			WHERE id_compra=@id_orden_compra;

			-- INSERTO EL ESTADO EN EL SIGUIENTE
			INSERT INTO  Relacion.Compra_Estado(
					id_compra
					,id_estado
					,fecha
					,vigente
				)
			VALUES(
					@id_orden_compra
					,@id_estado
			--		,(SELECT max(id_estado) FROM Relacion.Compra_Estado where id_compra=@id_orden_compra)+1
					,CONVERT(date, @fecha_cambio,112)
			--		,getdate()
					,1
				);

			

		--END
		COMMIT;

	END TRY

	BEGIN CATCH
		print @@ERROR;
		print ERROR_MESSAGE();
		ROLLBACK;

	END CATCH
	/*
	truncate table relacion.compra_estado
	truncate table Compra.Orden_compra
	truncate table compra.orden_compra_producto
	truncate table  Relacion.OC_Producto_Medida
	truncate table  Relacion.OC_Producto_Empaque
	truncate table  Relacion.Moneda_Orden_Compra
	truncate table  Relacion.Orden_Compra_Costo_Flete
	truncate table Relacion.Proveedor_OrdenCompra
	truncate table  Relacion.Orden_Compra_Envio
	*/
GO
