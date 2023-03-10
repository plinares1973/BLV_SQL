USE [BLV]
GO
/****** Object:  StoredProcedure [Produccion].[Actualiza_Insumo_Stock]    Script Date: 1/3/2023 11:38:04 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--select * from produccion.stock_insumo

CREATE PROCEDURE [Produccion].[Actualiza_Insumo_Stock]
	@empaque VARCHAR(40)
	,@capacidad INT
	,@medida VARCHAR(30)
	,@marca VARCHAR(50)
	,@cantidad int

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



			UPDATE 
				Produccion.Stock_Insumo 
			SET 
				cantidad=cantidad-@cantidad 
			WHERE
				id_stock_insumo=@id_stock_insumo;

			COMMIT;

		END TRY

		BEGIN CATCH
			print @@error;
			ROLLBACK;
		END CATCH






	
GO
