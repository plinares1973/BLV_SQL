USE [BLV]
GO
/****** Object:  StoredProcedure [Costo].[Calculador_Costo_Compra]    Script Date: 17/6/2023 4:28:33 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [Costo].[Calculador_Costo_Compra]
	@id_orden_compra int
	,@monto_costo float
	,@monto_final float out
AS
	DECLARE @auxiliar_monto float;
	DECLARE @tabla_orden TABLE(id_perfil int);
	
	
	DECLARE @tabla_productos TABLE(codigo_producto nvarchar(10),monto float)
	
	BEGIN TRANSACTION


		BEGIN TRY
			UPDATE Relacion.Costo_oc SET monto=@monto_costo WHERE id_orden_compra=@id_orden_compra;
			
			INSERT INTO 
				@tabla_orden --ORDEN DE CALCULO POR PERFIL
			SELECT
				PC.id_perfil_costo
			FROM
				Costo.Secuencia_Perfil SP
				INNER JOIN Costo.perfil_costo PC ON PC.id_perfil_costo=SP.id_perfil_costo
			ORDER BY
				orden

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
				
	
				
			SET @auxiliar_monto=@monto_costo+(SELECT SUM(monto) FROM @tabla_productos);

			SET @monto_final=(SELECT
									@auxiliar_monto*SUM(TC.valor /100)
							  FROM
									Costo.Tasa_Concepto TC
									INNER JOIN Costo.Concepto_Header CH ON CH.id_concepto_header=TC.id_concepto_header
									INNER JOIN Relacion.Perfil_Concepto RC ON RC.id_concepto_header=CH.id_concepto_header
							  WHERE
									id_perfil_costo IN(SELECT id_perfil FROM @tabla_orden WHERE id_perfil!=5))
			
			
			
			
			COMMIT
		END TRY
		BEGIN CATCH
			print @@error
			ROLLBACK
		END CATCH
