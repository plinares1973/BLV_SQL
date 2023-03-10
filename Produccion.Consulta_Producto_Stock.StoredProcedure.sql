USE [BLV]
GO
/****** Object:  StoredProcedure [Produccion].[Consulta_Producto_Stock]    Script Date: 14/3/2023 11:16:39 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Produccion].[Consulta_Producto_Stock]

AS
	BEGIN TRY


		



		SELECT
			p.codigo_producto AS 'CODIGO DE PRODUCTO'
			,ph.nombre_producto AS 'NOMBRE DE PRODUCTO'
			,sum(lp.cantidad) AS 'EXISTENCIA EN STOCK'
			,sum(isnull(phf.cantidad,0)) AS 'COMPROMETIDO'
			,m.descripcion AS 'MEDIDA'
			,ce.capacidad AS 'CAPACIDAD ENVASE'
			,e.descripcion AS 'EMPAQUE'


		FROM 
		
			Produccion.Producto_Header ph
			INNER JOIN Produccion.Producto p ON p.codigo_producto=ph.codigo_producto
			INNER JOIN Relacion.Lote_Producto lp ON lp.id_producto=p.id_producto
			INNER JOIN Produccion.Medida m ON m.id_medida=lp.id_medida
			INNER JOIN Produccion.Empaque e ON e.id_empaque=lp.id_empaque
			INNER JOIN Produccion.Capacidad_Envase ce ON ce.id_capacidad_envase=lp.id_capacidad_envase
			LEFT JOIN Proceso.Hoja_Fabricacion PHF ON phf.id_producto=p.id_producto
		WHERE
			lp.cuarentena=0
		group by 
			p.codigo_producto
			,ph.nombre_producto
			,ce.capacidad 
			,m.descripcion
			,e.descripcion

	END TRY
	BEGIN CATCH
		print @@ERROR;


	END CATCH


	;


GO
