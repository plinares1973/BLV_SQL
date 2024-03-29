USE [BLV]
GO
/****** Object:  StoredProcedure [Produccion].[Consulta_Producto_Stock_Fabricacion]    Script Date: 6/7/2023 8:42:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  PROCEDURE [Produccion].[Consulta_Producto_Stock_Fabricacion]
	@codigo_producto varchar(10)

AS
	BEGIN TRY

		SELECT
			l.codigo_lote AS 'CODIGO DE LOTE'
			,ph.codigo_producto AS 'CODIGO DE PRODUCTO'
			,ph.nombre_producto AS 'NOMBRE DE PRODUCTO'
			,p.marca AS 'MARCA'
			,IIF(lp.cuarentena=1,'SI','NO') AS 'CUARENTENA'
			,p.fecha_vencimiento AS 'FECHA DE VENCIMIENTO'
			,lp.cantidad-sum(convert(int,isnull(PHF.cantidad,0))) AS 'EXISTENCIA EN STOCK'
			,sum(convert(int,isnull(PHF.cantidad,0))) AS 'COMPROMETIDO'
			,m.descripcion AS 'MEDIDA'
			

		FROM 
			Produccion.Producto_Header ph
			INNER JOIN Produccion.Producto p ON p.codigo_producto=ph.codigo_producto
			INNER JOIN Relacion.Lote_Producto lp ON lp.id_producto=p.id_producto
			INNER JOIN Compra.Lote l ON l.id_batch=lp.id_batch
			INNER JOIN Produccion.Medida m ON m.id_medida=lp.id_medida
			LEFT JOIN Proceso.Hoja_Fabricacion PHF ON PHF.id_producto=p.id_producto


		WHERE
			p.codigo_producto=@codigo_producto 
			
		GROUP BY
			l.codigo_lote 
			,ph.codigo_producto
			,ph.nombre_producto
			,p.marca
			,p.fecha_vencimiento
			,lp.cantidad
			,lp.cuarentena
			,m.descripcion
		HAVING  (lp.cantidad-sum(convert(int,isnull(PHF.cantidad,0))))>0
	
		ORDER BY
			lp.cuarentena DESC
			,p.fecha_vencimiento
		;

	END TRY
	BEGIN CATCH
		print @@ERROR;


	END CATCH
GO
