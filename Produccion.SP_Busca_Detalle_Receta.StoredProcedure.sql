USE [BLV]
GO
/****** Object:  StoredProcedure [Produccion].[SP_Busca_Detalle_Receta]    Script Date: 6/7/2023 8:42:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Produccion].[SP_Busca_Detalle_Receta]
	@codigo_producto VARCHAR(10)
AS
	BEGIN TRY
		SELECT
			pp.codigo_producto AS 'CODIGO INGREDIENTE'
			,P.nombre_producto AS 'NOMBRE INGREDIENTE'
			,pr.cantidad_percentil AS 'PORCENTAJE EN FORMULA'
			,convert(int,(SUM(isnull(lp.cantidad,0)))-convert(int,SUM(isnull(phf.cantidad,0)))) AS 'DISPONIBLE'
			,convert(int,SUM(isnull(phf.cantidad,0))) AS 'COMPROMETIDO'
	
	
		FROM
			produccion.receta R
			INNER JOIN relacion.Producto_Receta pr ON pr.id_receta=r.id_receta
			INNER JOIN produccion.producto pp ON pp.codigo_producto=pr.codigo_ingrediente_producto
			INNER JOIN Produccion.Producto_header P ON P.codigo_producto= pp.codigo_producto
			LEFT JOIN proceso.Hoja_Fabricacion PHF ON PHF.id_producto=PP.id_producto
			INNER JOIN relacion.Lote_Producto LP ON LP.id_producto=pp.id_producto
		WHERE
			R.codigo_producto=@codigo_producto

		GROUP BY
			pp.codigo_producto 
			,r.nombre_receta
			,pr.cantidad_percentil
			,P.nombre_producto
	END TRY
	BEGIN CATCH
		print @@error;
	END CATCH

	--execute produccion.sp_busca_detalle_receta 'FAB042'
GO
