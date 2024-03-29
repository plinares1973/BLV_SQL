USE [BLV]
GO
/****** Object:  StoredProcedure [Produccion].[SP_Crear_Hoja_Fabricacion]    Script Date: 6/7/2023 8:42:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--select * from produccion.stock_insumo

CREATE PROCEDURE [Produccion].[SP_Crear_Hoja_Fabricacion]
	
	@id_receta INT
	,@empaque VARCHAR(40)
	,@capacidad INT
	,@medida VARCHAR(30)
	,@marca VARCHAR(50)
	,@cantidad_insumo int
	,@cantidad_fabricar int
	,@id_hoja_fabricacion int OUT


AS
	DECLARE @id_empaque INT;
	DECLARE @id_capacidad_envase INT;
	DECLARE @id_medida INT;
	DECLARE @id_stock_insumo INT;




	BEGIN TRANSACTION
		BEGIN TRY
			
			SET @id_empaque=(SELECT 
									id_empaque 
								FROM 
									Produccion.Empaque
								WHERE 
									descripcion=@empaque);
						

			SET @id_capacidad_envase=(SELECT 
											id_capacidad_envase 
										FROM 
											Produccion.Capacidad_Envase
										WHERE 
											id_empaque=@id_empaque
											AND capacidad=@capacidad);
								

			SET @id_medida=(SELECT	
								id_medida
							FROM
								Produccion.Medida
							WHERE 
								descripcion=@medida);
					
			SET @id_stock_insumo=(SELECT
										id_stock_insumo
									FROM
										Produccion.Stock_Insumo
									WHERE
										id_empaque=@id_empaque
										AND id_medida=@id_medida
										AND id_capacidad=@id_capacidad_envase
										AND marca=@marca);

			INSERT INTO 
				Produccion.Hoja_Fabricacion_Header(
					fecha_creacion_orden
					,id_receta
					,id_stock_insumo
					,cantidad_insumo
					,cantidad_fabricar)
			VALUES(
				getdate()
				,@id_receta
				,@id_stock_insumo
				,@cantidad_insumo
				,@cantidad_fabricar
			
			);
			
			SET @id_hoja_fabricacion=SCOPE_IDENTITY();

			INSERT INTO 
				Relacion.Hoja_Fab_Estado(
					id_hoja_fabrica
					,id_estado
					,fecha
					,vigente)
			VALUES(
				@id_hoja_fabricacion
				,0
				,getdate()
				,1);



					

				

/*AL CONFIRMAR
			UPDATE 
				Produccion.Stock_Insumo 
			SET 
				cantidad=cantidad-@cantidad 
			WHERE
				id_stock_insumo=@id_stock_insumo;
*/
			COMMIT;

		END TRY

		BEGIN CATCH
			print @@error;
			ROLLBACK;
		END CATCH






	
GO
