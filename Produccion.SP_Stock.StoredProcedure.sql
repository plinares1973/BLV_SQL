USE [BLV]
GO
/****** Object:  StoredProcedure [Produccion].[SP_Stock]    Script Date: 6/7/2023 8:42:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Produccion].[SP_Stock]
	@id_producto int
	,@nombre_producto varchar(30) NULL
	,@stock_total bit=1
AS
	
	BEGIN TRY
	
	IF(@stock_total=1)
		BEGIN
		IF(not @id_producto is null)
			BEGIN
	
				SELECT 
					p.codigo_producto
					,p.nombre_producto
					,SUM(ls.cantidad)
					,m.descripcion

				FROM
					produccion.producto p
					INNER JOIN relacion.Lote_Producto lp ON lp.id_producto=p.id_producto
					INNER JOIN compra.lote cl ON cl.id_batch=lp.id_batch
					INNER JOIN relacion.Lote_Empaque le ON le.id_batch=cl.id_batch
					INNER JOIN Produccion.Empaque e ON e.id_empaque=le.id_empaque
					INNER JOIN relacion.Lote_Medida lm ON lm.id_lote=cl.id_batch
					INNER JOIN Produccion.Medida m ON m.id_medida=lm.id_medida
					INNER JOIN relacion.lote_stock ls ON ls.id_batch=cl.id_batch
				
				WHERE p.id_producto =@id_producto
				
				GROUP BY
					p.codigo_producto
					,p.nombre_producto
					,m.descripcion
				
				;
			END
	
		ELSE
		
			BEGIN
	
					SELECT 
						p.codigo_producto
						,p.nombre_producto
						,SUM(ls.cantidad)
						,m.descripcion

					FROM
						produccion.producto p
						INNER JOIN relacion.Lote_Producto lp ON lp.id_producto=p.id_producto
						INNER JOIN compra.lote cl ON cl.id_batch=lp.id_batch
						INNER JOIN relacion.Lote_Empaque le ON le.id_batch=cl.id_batch
						INNER JOIN Produccion.Empaque e ON e.id_empaque=le.id_empaque
						INNER JOIN relacion.Lote_Medida lm ON lm.id_lote=cl.id_batch
						INNER JOIN Produccion.Medida m ON m.id_medida=lm.id_medida
						INNER JOIN relacion.lote_stock ls ON ls.id_batch=cl.id_batch
				
					WHERE	p.nombre_producto LIKE('%' + @nombre_producto + '%')
				
					GROUP BY
						p.codigo_producto
						,p.nombre_producto
						,m.descripcion
				
					;
	
				
				END
		END
	ELSE
		BEGIN
			SELECT 
				p.codigo_producto
				,p.nombre_producto
				,SUM(ls.cantidad)
				,m.descripcion
				,cl.codigo_lote
				,s.piso
				,s.altura
				,s.fila
				,s.posicion

			FROM
				produccion.producto p
				INNER JOIN relacion.Lote_Producto lp ON lp.id_producto=p.id_producto
				INNER JOIN compra.lote cl ON cl.id_batch=lp.id_batch
				INNER JOIN relacion.Lote_Empaque le ON le.id_batch=cl.id_batch
				INNER JOIN Produccion.Empaque e ON e.id_empaque=le.id_empaque
				INNER JOIN relacion.Lote_Medida lm ON lm.id_lote=cl.id_batch
				INNER JOIN Produccion.Medida m ON m.id_medida=lm.id_medida
				INNER JOIN relacion.lote_stock ls ON ls.id_batch=cl.id_batch
				INNER JOIN produccion.Stock s ON s.id_stock=ls.id_stock
			WHERE p.id_producto =@id_producto
				
			GROUP BY
				p.codigo_producto
				,p.nombre_producto
				,m.descripcion
				,cl.codigo_lote
				,s.piso
				,s.altura
				,s.fila
				,s.posicion
		END

	END TRY
	BEGIN CATCH
		print @@ERROR;
		print ERROR_MESSAGE();

	END CATCH

GO
