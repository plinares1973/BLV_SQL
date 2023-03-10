USE [BLV]
GO
/****** Object:  StoredProcedure [Produccion].[SP_Crear_Hoja_Fabricacion_REVISAR]    Script Date: 1/3/2023 11:38:04 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--select * from produccion.hoja_fabricacion
-- truncate table produccion.hoja_fabricacion
CREATE  PROCEDURE [Produccion].[SP_Crear_Hoja_Fabricacion_REVISAR]
	@id_receta INT
	,@id_hoja_fabricacion INT OUT
	

 AS
	BEGIN TRANSACTION
	
		BEGIN TRY

			INSERT INTO Produccion.Hoja_Fabricacion(
				fecha_elaboracion
				,id_receta)
			VALUES(
				getdate()
				,@id_receta);

			COMMIT;

			SET @id_hoja_fabricacion=SCOPE_IDENTITY();
		
		END TRY
		BEGIN CATCH
			SET @id_hoja_fabricacion=0;
			ROLLBACK;

		END CATCH



		/*
		SELECT 
			p.codigo_producto
			,p.nombre_producto
			,h.codigo_producto_ingrediente
			,(select nombre_producto from produccion.producto where codigo_producto=h.codigo_producto_ingrediente) AS Ingrediente
			,h.cantidad
		FROM
			Produccion.producto p
			INNER JOIN Produccion.Hoja_Fabricacion h ON p.codigo_producto=h.codigo_producto
		
		WHERE p.codigo_producto=@codigo_producto;
		*/		

		

		

				
			

	

--execute Produccion.SP_hoja_fabricacion 'FAB042'
GO
