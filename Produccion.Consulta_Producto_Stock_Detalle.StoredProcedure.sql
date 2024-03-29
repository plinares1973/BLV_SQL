USE [BLV]
GO
/****** Object:  StoredProcedure [Produccion].[Consulta_Producto_Stock_Detalle]    Script Date: 6/7/2023 8:42:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Produccion].[Consulta_Producto_Stock_Detalle]
	@codigo_producto varchar(10)
AS
	BEGIN TRY

				SELECT
			d.nombre AS 'NOMBRE DE PRODUCTO'
			,s.codigo_barra  AS 'IMAGEN DE IDENTIFICACION'
			,l.codigo_producto  AS 'CODIGO DE PRODUCTO'
			,ocp.marca AS 'MARCA'
			,l.fecha_elaboracion  AS 'FECHA DE ELABORACION'
			,l.fecha_vencimiento  AS 'FECHA DE VENCIMIENTO'
			,ls.cantidad AS 'EXISTENCIA EN POSICION'
			,isnull(phf.cantidad,0) AS 'COMPROMETIDO'

		FROM 
			Compra.Lote l
			INNER JOIN Relacion.Orden_Compra_Lote ocl ON ocl.id_lote=l.id_batch
			INNER JOIN Compra.Orden_Compra_Producto ocp ON ocp.id_ocompra_producto=ocl.id_ocompra_producto
			INNER JOIN Relacion.Lote_Stock ls ON ls.id_batch=l.id_batch
			INNER JOIN Produccion.Stock s ON s.id_stock=ls.id_stock
			INNER JOIN Relacion.Deposito_Stock ds ON ds.id_stock=s.id_stock
			INNER JOIN Sistema.Deposito d ON d.id_deposito=ds.id_deposito
			LEFT JOIN Proceso.Hoja_Fabricacion PHF ON phf.codigo_producto=l.codigo_producto
		WHERE
			l.codigo_producto=@codigo_producto
			--AND lp.cuarentena=0
		ORDER BY
			l.fecha_vencimiento
		;

	END TRY
	BEGIN CATCH
		print @@ERROR;


	END CATCH
GO
