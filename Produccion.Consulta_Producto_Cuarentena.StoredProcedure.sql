USE [BLV]
GO
/****** Object:  StoredProcedure [Produccion].[Consulta_Producto_Cuarentena]    Script Date: 6/7/2023 8:42:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Produccion].[Consulta_Producto_Cuarentena]
	
AS
	BEGIN TRY

		SELECT
			l.codigo_lote AS 'CODIGO DE LOTE'
			,ph.codigo_producto AS 'CODIGO DE PRODUCTO'
			,ph.nombre_producto AS 'NOMBRE DE PRODUCTO'
			,p.marca AS 'MARCA'
			,p.fecha_vencimiento AS 'FECHA DE VENCIMIENTO'
			,lp.cantidad AS 'EXISTENCIA EN STOCK'
			,isnull(phf.cantidad,0) AS 'COMPROMETIDO'
			,d.nombre AS 'DEPOSITO'
			,s.posicion AS 'POSICION EN DEPOSITO'
			,s.piso AS 'PISO EN DEPOSITO'
			,s.fila AS 'FILA EN DEPOSITO'
			,s.altura AS 'ALTURA EN DEPOSITO'
			,m.descripcion AS 'MEDIDA'
			,e.descripcion AS 'EMPAQUE'
			

		FROM 
			Produccion.Producto_Header ph
			INNER JOIN Produccion.Producto p ON p.codigo_producto=ph.codigo_producto
			INNER JOIN Relacion.Lote_Producto lp ON lp.id_producto=p.id_producto
			INNER JOIN Compra.Lote l ON l.id_batch=lp.id_batch
			INNER JOIN Produccion.Medida m ON m.id_medida=lp.id_medida
			INNER JOIN Produccion.Empaque e ON e.id_empaque=lp.id_empaque
			INNER JOIN Produccion.Capacidad_Envase ce ON ce.id_capacidad_envase=lp.id_capacidad_envase
			INNER JOIN Relacion.Lote_Stock ls ON ls.id_batch=lp.id_batch
			INNER JOIN Produccion.Stock s ON s.id_stock=ls.id_stock
			INNER JOIN Relacion.Deposito_Stock ds ON ds.id_stock=ls.id_stock
			INNER JOIN Sistema.Deposito d ON d.id_deposito=ds.id_deposito
			LEFT JOIN Proceso.Hoja_Fabricacion PHF ON phf.id_producto=p.id_producto
		WHERE
			lp.cuarentena=1
		ORDER BY
			p.fecha_vencimiento
		;

	END TRY
	BEGIN CATCH
		print @@ERROR;


	END CATCH
GO
