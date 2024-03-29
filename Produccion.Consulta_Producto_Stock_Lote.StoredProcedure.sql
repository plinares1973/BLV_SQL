USE [BLV]
GO
/****** Object:  StoredProcedure [Produccion].[Consulta_Producto_Stock_Lote]    Script Date: 6/7/2023 8:42:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Produccion].[Consulta_Producto_Stock_Lote]
	@codigo_lote varchar(10)
AS
	BEGIN TRY

		SELECT
			p.codigo_producto AS 'CODIGO DE PRODUCTO'
			,p.nombre_producto AS 'NOMBRE DE PRODUCTO'
			,p.marca AS 'MARCA'
			,p.fecha_vencimiento AS 'FECHA DE VENCIMIENTO'
			,lp.cantidad AS 'EXISTENCIA EN STOCK'
			,d.nombre AS 'DEPOSITO'
			,s.posicion AS 'POSICION EN DEPOSITO'
			,s.piso AS 'PISO EN DEPOSITO'
			,s.fila AS 'FILA EN DEPOSITO'
			,s.altura AS 'ALTURA EN DEPOSITO'
			,m.descripcion AS 'MEDIDA'
			,e.descripcion AS 'EMPAQUE'
			

		FROM 
			Produccion.Producto p
			INNER JOIN Relacion.Lote_Stock lp ON lp.id_producto=p.id_producto
			INNER JOIN Compra.Lote l ON l.id_batch=lp.id_batch
			INNER JOIN Produccion.Medida m ON m.id_medida=lp.id_medida
			INNER JOIN Produccion.Empaque e ON e.id_empaque=lp.id_empaque
			INNER JOIN Produccion.Stock s ON s.id_stock=lp.id_stock
			INNER JOIN Relacion.Deposito_Stock ds ON ds.id_stock=lp.id_stock
			INNER JOIN Sistema.Deposito d ON d.id_deposito=ds.id_deposito

		WHERE
			l.codigo_lote=@codigo_lote

	END TRY
	BEGIN CATCH
		print @@ERROR;


	END CATCH
GO
