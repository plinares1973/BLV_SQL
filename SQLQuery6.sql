USE [BLV]
GO
/****** Object:  StoredProcedure [Produccion].[SP_Agrega_Producto_HF_REVISAR]    Script Date: 1/3/2023 10:48:05 a. m. ******/
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

		SELECT
			l.codigo_lote AS 'CODIGO DE LOTE'
			,ph.codigo_producto AS 'CODIGO DE PRODUCTO'
			,ph.nombre_producto AS 'NOMBRE DE PRODUCTO'
			,p.marca AS 'MARCA'
			,p.fecha_vencimiento AS 'FECHA DE VENCIMIENTO'
			,lp.cantidad AS 'EXISTENCIA EN STOCK'
			,m.descripcion AS 'MEDIDA'
			

		FROM 
			Produccion.Producto_Header ph
			INNER JOIN Produccion.Producto p ON p.codigo_producto=ph.codigo_producto
			INNER JOIN Relacion.Lote_Producto lp ON lp.id_producto=p.id_producto
			INNER JOIN Compra.Lote l ON l.id_batch=lp.id_batch
			INNER JOIN Produccion.Medida m ON m.id_medida=lp.id_medida
		--	INNER JOIN Produccion.Empaque e ON e.id_empaque=lp.id_empaque
			--INNER JOIN Produccion.Capacidad_Envase ce ON ce.id_capacidad_envase=lp.id_capacidad_envase
			INNER JOIN Relacion.Lote_Stock ls ON ls.id_batch=lp.id_batch

ALTER  PROCEDURE [Produccion].[SP_Agrega_Producto_HF_REVISAR](
	@codigo_lote VARCHAR()10
	,@codigo_producto VARCHAR(10)
	,@marca VARCHAR(50)
	,@cantidad int


	@empaque VARCHAR(40)
	,@capacidad INT
	,@medida VARCHAR(30)
	
	,@cantidad int
	
)
AS
BEGIN
	
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
	
	SET @error=0;
	BEGIN TRANSACTION
		BEGIN TRY

			--======== SECCION DETALLE ORDEN COMPRA ================-inserto la relacion del lote con el producto
	
			
		
			INSERT INTO Proceso.Hoja_Fabricacion(
				id_producto
				,id_hoja_fabrica
				,cantidad
				,id_medida
				,id_empaque
			)
			VALUES(
				@id_producto
				,@id_hoja_fabrica
				,@cantidad
				,@id_medida
				,@id_empaque
	
			)

				
			INSERT INTO Relacion.Hoja_Fab_Estado(
				id_hoja_fab_estado
				,id_hoja_fabrica 	
				,id_estado 		
				,fecha 			
				,vigente	
			)
			VALUES(
				@id_producto
				,@id_hoja_fabrica 	
				,0	
				,getdate()			
				,1	

			);




			COMMIT;

		END TRY
		BEGIN CATCH
			set @error= @@error;
			ROLLBACK;
		END CATCH
END
