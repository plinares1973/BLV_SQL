USE [BLV]
GO
/****** Object:  StoredProcedure [Produccion].[SP_Busca_Detalle_Receta]    Script Date: 1/3/2023 11:38:04 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Produccion].[SP_Busca_Detalle_Receta]
	@codigo_producto VARCHAR(10)
AS
	BEGIN TRY
		SELECT 
			PR.codigo_ingrediente_producto AS 'CODIGO INGREDIENTE'
			,P.nombre_producto AS 'NOMBRE INGREDIENTE'
			,PR.Cantidad_Percentil AS 'PORCENTAJE EN FORMULA'
			,SUM(LP.cantidad) AS 'DISPONIBLE'

		FROM
			Produccion.Receta R
			INNER JOIN Relacion.Producto_Receta PR ON PR.id_receta=R.id_receta
			INNER JOIN Produccion.Producto_header P ON P.codigo_producto=PR.codigo_ingrediente_producto
			LEFT JOIN Produccion.Producto PP ON PP.codigo_producto=P.codigo_producto
			LEFT JOIN Relacion.Lote_Producto LP ON LP.id_producto=PP.id_producto
		WHERE
			R.codigo_producto=@codigo_producto
			
		GROUP BY 
			PR.codigo_ingrediente_producto
			,P.nombre_producto
			,PR.Cantidad_Percentil
		;
	END TRY
	BEGIN CATCH
		print @@error;
	END CATCH

	--execute produccion.sp_busca_detalle_receta 'FAB042'
GO
