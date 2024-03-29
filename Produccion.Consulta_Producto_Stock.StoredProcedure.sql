USE [BLV]
GO
/****** Object:  StoredProcedure [Produccion].[Consulta_Producto_Stock]    Script Date: 6/7/2023 8:42:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Produccion].[Consulta_Producto_Stock]
	@por_deposito bit
AS
	BEGIN TRY
		IF(@por_deposito=1)
			BEGIN
				SELECT
					d.nombre AS 'DEPOSITO'
					,ocp.codigo_producto AS 'CODIGO PRODUCTO'
					,ph.nombre_producto AS 'PRODUCTO'
					,sum(ls.cantidad)  AS 'EXISTENCIA EN STOCK'
					,sum(isnull(phf.cantidad,0)) AS 'COMPROMETIDO'
					,sum(ls.cantidad)-sum(isnull(phf.cantidad,0)) AS 'DISPONIBLE'
					,m.unidad as 'MEDIDA'
	
				FROM 
					Produccion.Stock s
					INNER JOIN RElacion.Deposito_Stock ds ON ds.id_stock=s.id_stock
					INNER JOIN Sistema.Deposito d ON d.id_deposito=ds.id_deposito
					INNER JOIN Relacion.Lote_stock ls ON ls.id_stock=s.id_stock
					INNER JOIN Relacion.Orden_compra_lote ocl ON ocl.id_lote=ls.id_batch
					INNER JOIN Compra.Orden_Compra_Producto ocp ON ocp.id_ocompra_producto=ocl.id_ocompra_producto
					INNER JOIN Produccion.Producto_Header ph ON ph.codigo_producto=ocp.codigo_producto
					INNER JOIN Relacion.oc_producto_empaque ope ON ope.id_ocompra_producto=ocp.id_ocompra_producto
					INNER JOIN Relacion.oc_producto_medida opm ON opm.id_ocompra_producto=ocp.id_ocompra_producto
					INNER JOIN Produccion.Medida m ON m.id_medida=opm.id_medida
					LEFT JOIN Proceso.Hoja_Fabricacion PHF ON phf.codigo_producto=ocp.codigo_producto
				GROUP BY
					ocp.codigo_producto	
					,ph.nombre_producto
					,m.unidad
					,d.nombre
				ORDER By
					ocp.codigo_producto
			END
		ELSE
			BEGIN
				SELECT
					ocp.codigo_producto AS 'CODIGO PRODUCTO'
					,ph.nombre_producto AS 'PRODUCTO'
					,sum(ls.cantidad)  AS 'EXISTENCIA EN STOCK'
					,sum(isnull(phf.cantidad,0)) AS 'COMPROMETIDO'
					,sum(ls.cantidad)-sum(isnull(phf.cantidad,0)) AS 'DISPONIBLE'
					,m.unidad as 'MEDIDA'
	
				FROM 
					Produccion.Stock s
					INNER JOIN Relacion.Lote_stock ls ON ls.id_stock=s.id_stock
					INNER JOIN Relacion.Orden_compra_lote ocl ON ocl.id_lote=ls.id_batch
					INNER JOIN Compra.Orden_Compra_Producto ocp ON ocp.id_ocompra_producto=ocl.id_ocompra_producto
					INNER JOIN Produccion.Producto_Header ph ON ph.codigo_producto=ocp.codigo_producto
					INNER JOIN Relacion.oc_producto_empaque ope ON ope.id_ocompra_producto=ocp.id_ocompra_producto
					INNER JOIN Relacion.oc_producto_medida opm ON opm.id_ocompra_producto=ocp.id_ocompra_producto
					INNER JOIN Produccion.Medida m ON m.id_medida=opm.id_medida
					LEFT JOIN Proceso.Hoja_Fabricacion PHF ON phf.codigo_producto=ocp.codigo_producto
				GROUP BY
					ocp.codigo_producto	
					,ph.nombre_producto
					,m.unidad

				ORDER By
					ocp.codigo_producto
			END
	END TRY
	BEGIN CATCH
		print @@ERROR;


	END CATCH


	;


GO
