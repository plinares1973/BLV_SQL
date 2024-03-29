USE [BLV]
GO
/****** Object:  StoredProcedure [Produccion].[SP_Busca_Producto_header]    Script Date: 6/7/2023 8:42:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--execute produccion.sp_busca_producto_header  null,null,0

CREATE  PROCEDURE [Produccion].[SP_Busca_Producto_header]
	@codigo_producto varchar(10) NULL
	,@descripcion_producto varchar(30) NULL
	,@con_receta bit NULL

 AS
 	BEGIN TRY


		IF(@con_receta=1)
			BEGIN
				SELECT 
				
					ph.codigo_producto AS 'CODIGO DEL PRODUCTO'
					,ph.nombre_producto AS 'NOMBRE DEL PRODUCTO'
			
				FROM
					Produccion.Producto_header ph
					INNER JOIN Produccion.Receta r ON r.codigo_producto=ph.codigo_producto
		
				WHERE ph.nombre_producto LIKE('%' + IIF(@descripcion_producto is null,'', @descripcion_producto)+ '%')
					AND	ph.codigo_producto LIKE('%'+	IIF(@codigo_producto is null,'', @codigo_producto) +'%')
				


			END
		ELSE
			BEGIN
				SELECT 
				
					ph.codigo_producto AS 'CODIGO DEL PRODUCTO'
					,ph.nombre_producto AS 'NOMBRE DEL PRODUCTO'
			
				FROM
					Produccion.Producto_header ph

		
				WHERE ph.nombre_producto LIKE('%' + IIF(@descripcion_producto is null,'', @descripcion_producto)+ '%')
					AND	ph.codigo_producto LIKE('%'+	IIF(@codigo_producto is null,'', @codigo_producto) +'%')
				

			END
			

		

				
			

	
	END TRY
	BEGIN CATCH
		print @@ERROR;


	END CATCH


	
GO
