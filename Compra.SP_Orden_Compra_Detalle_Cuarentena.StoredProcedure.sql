USE [BLV]
GO
/****** Object:  StoredProcedure [Compra].[SP_Orden_Compra_Detalle_Cuarentena]    Script Date: 6/7/2023 8:42:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--EXECUTE Compra.SP_Orden_Compra_Detalle 1
--select * from produccion.producto

CREATE PROCEDURE [Compra].[SP_Orden_Compra_Detalle_Cuarentena]
	@id_orden_compra int 
	,@codigo_producto varchar(30)

AS
	BEGIN TRY
	

		
		select
			l.codigo_lote as 'CODIGO DE LOTE'
			,pp.codigo_producto  as 'CODIGO DE PRODUCTO'
			,pp.marca as 'MARCA'
			,pp.fecha_elaboracion as 'FECHA DE ELABORACION'
			,pp.fecha_vencimiento as 'FECHA DE VENCIMIENTO'
			,lp.cantidad as 'CANTIDAD'
			
		from 
			
			relacion.Lote_Producto  lp
			INNER JOIN produccion.producto pp ON pp.id_producto=lp.id_producto
			INNER JOIN compra.lote l ON l.id_batch=lp.id_batch
			INNER JOIN relacion.Orden_Compra_Lote ocl ON ocl.id_lote=l.id_batch
		where
			lp.cuarentena=1
			and	ocl.id_orden_compra=@id_orden_compra
			and pp.codigo_producto=@codigo_producto;

	END TRY

	BEGIN CATCH

		print @@ERROR;
		print ERROR_MESSAGE();
	END CATCH
GO
