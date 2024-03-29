USE [BLV]
GO
/****** Object:  StoredProcedure [Produccion].[SP_Busca_Codigo_Arancelario]    Script Date: 6/7/2023 8:42:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Produccion].[SP_Busca_Codigo_Arancelario]
		@codigo_producto VARCHAR(10)
		,@codigo_arancelario  nVARCHAR(12)=null OUT
		,@tasa float=0 OUT
AS
	BEGIN TRY 
		SET @codigo_arancelario=(
			SELECT 
				codigo_arancelario 
			FROM 
				relacion.Derecho_importacion_Producto
			WHERE
				codigo_producto=@codigo_producto);

			IF @codigo_arancelario is not null
			BEGIN
				SET @tasa=(
					SELECT 
						tasa 
					FROM 
						relacion.Derecho_importacion_Producto
					WHERE
						codigo_arancelario=@codigo_arancelario);

			END

	END TRY
	BEGIN CATCH
		print @@error
	END CATCH
GO
