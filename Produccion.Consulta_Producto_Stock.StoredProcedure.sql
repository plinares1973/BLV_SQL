USE [BLV]
GO
/****** Object:  StoredProcedure [Produccion].[Consulta_Producto_Stock]    Script Date: 22/2/2023 10:12:20 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Produccion].[Consulta_Producto_Stock]

AS
	BEGIN TRY

		SELECT
			p.codigo_producto AS 'CODIGO DE PRODUCTO'
			,p.nombre_producto AS 'NOMBRE DE PRODUCTO'
			,sum(lp.cantidad) AS 'EXISTENCIA EN STOCK'
			,m.descripcion AS 'MEDIDA'
			,e.descripcion AS 'EMPAQUE'

		FROM 
			Produccion.Producto p
			INNER JOIN Relacion.Lote_Stock lp ON lp.id_producto=p.id_producto
			INNER JOIN Produccion.Medida m ON m.id_medida=lp.id_medida
			INNER JOIN Produccion.Empaque e ON e.id_empaque=lp.id_empaque


		group by 
			p.codigo_producto
			,p.nombre_producto
			,m.descripcion
			,e.descripcion

	END TRY
	BEGIN CATCH
		print @@ERROR;


	END CATCH


	;


GO
