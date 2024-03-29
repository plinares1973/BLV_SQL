USE [BLV]
GO
/****** Object:  StoredProcedure [Produccion].[SP_Busca_Detalle_Cantidad_Ingrediente]    Script Date: 6/7/2023 8:42:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Produccion].[SP_Busca_Detalle_Cantidad_Ingrediente]
	@codigo_ingrediente VARCHAR(10)
	,@codigo_producto VARCHAR(10)
	,@porcentaje INT OUT
AS
	BEGIN TRY
		SET @porcentaje=(
			SELECT 
				PR.Cantidad_Percentil AS 'PORCENTAJE EN RECETA'
			

			FROM
				Produccion.Receta R
				INNER JOIN Relacion.Producto_Receta PR ON PR.id_receta=R.id_receta
				INNER JOIN Produccion.Producto_header P ON P.codigo_producto=PR.codigo_ingrediente_producto

			WHERE
				R.codigo_producto=@codigo_producto
				AND PR.codigo_ingrediente_producto=@codigo_ingrediente);
	END TRY
	BEGIN CATCH
		print @@error;
	END CATCH

	--execute produccion.sp_busca_detalle_receta 'FAB042'
GO
