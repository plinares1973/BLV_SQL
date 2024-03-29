USE [BLV]
GO
/****** Object:  StoredProcedure [Costo].[Calculador_Costo_Compra]    Script Date: 6/7/2023 8:42:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Costo].[Calculador_Costo_Compra]
	@id_orden_compra int
--	,@monto_costo float
	--,@monto_final float out
AS

	
	
	DECLARE @tabla_productos TABLE(codigo_producto nvarchar(10),monto float)
	
	BEGIN TRANSACTION


		BEGIN TRY
		--	UPDATE Relacion.Costo_oc SET monto=@monto_costo WHERE id_orden_compra=@id_orden_compra;
		/*	
			INSERT INTO 
				@tabla_orden --ORDEN DE CALCULO POR PERFIL
			SELECT
				PC.id_perfil_costo
			FROM
				Costo.Secuencia_Perfil SP
				INNER JOIN Costo.perfil_costo PC ON PC.id_perfil_costo=SP.id_perfil_costo
			ORDER BY
				orden
		*/

			INSERT INTO 
				@tabla_productos --DERECHOS DE IMPORTACION
			SELECT 
				ocp.codigo_producto
				,(ocp.monto*ocp.cantidad)*(dip.tasa/100)
			FROM
				Compra.Orden_Compra oc
				INNER JOIN Compra.Orden_Compra_Producto ocp ON ocp.id_orden_compra=oc.id_orden_compra
				INNER JOIN Produccion.Producto_Header ph ON ph.codigo_producto=ocp.codigo_producto
				INNER JOIN Relacion.Derecho_importacion_Producto dip ON dip.codigo_producto=ph.codigo_producto
			WHERE
				oc.id_orden_compra=@id_orden_compra ;
			
			UPDATE 
				Compra.Orden_Compra_Producto
			SET 
				derecho_importacion = t.monto
			FROM 
				compra.orden_compra_producto AS ocp
				JOIN @tabla_productos AS t ON ocp.codigo_producto = t.codigo_producto
			WHERE
				ocp.id_orden_compra=@id_orden_compra;
				
			
			
			DECLARE @veintidos int;
			
			SET @veintidos=(
					SELECT DISTINCT 
						orden
					FROM 
						Proceso.costo_a_calcular
					WHERE 
						id_orden_compra=@id_orden_compra
						AND id_concepto_header=22)

			DELETE FROM 
				Proceso.costo_a_calcular 
			WHERE 
				orden=@veintidos 
				AND id_orden_compra=@id_orden_compra

			INSERT INTO	Proceso.Costo_a_Calcular(
				id_orden_compra
				,orden
				,id_concepto_header
				,id_tipo_valor
				,valor)
			VALUES(
				@id_orden_compra
				,@veintidos
				,22
				,1
				,(SELECT SUM(derecho_importacion) 
					FROM Compra.Orden_Compra_Producto
					WHERE id_orden_compra=@id_orden_compra))

			

		

			
				DECLARE @auxiliar_monto float=0;
				DECLARE @IdTipoValor INT, @Valor DECIMAL(18, 2);

				DECLARE cursorValores CURSOR FOR
				SELECT id_tipo_valor, valor
				FROM proceso.costo_a_calcular

				ORDER BY orden;  -- Orden de aparición

				OPEN cursorValores;

				FETCH NEXT FROM cursorValores INTO @IdTipoValor, @Valor;

				WHILE @@FETCH_STATUS = 0
				BEGIN
		
					IF @IdTipoValor = 1
						BEGIN
							-- Valor nominal
							SET @auxiliar_monto = @auxiliar_monto + @Valor;
				
						END
					ELSE
					BEGIN
						-- Valor porcentual
						SET @auxiliar_monto = @auxiliar_monto* (1 + (@Valor / 100.0));
						

					END

				FETCH NEXT FROM cursorValores INTO @IdTipoValor, @Valor;
			END;
			UPDATE Relacion.Costo_oc SET monto=@auxiliar_monto WHERE id_orden_compra=@id_orden_compra;
			DEALLOCATE cursorValores;







		
			COMMIT
		END TRY
		BEGIN CATCH
			print @@error
			ROLLBACK
		END CATCH
GO
