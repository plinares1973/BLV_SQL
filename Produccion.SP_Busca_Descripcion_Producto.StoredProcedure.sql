USE [BLV]
GO
/****** Object:  StoredProcedure [Produccion].[SP_Busca_Descripcion_Producto]    Script Date: 6/7/2023 8:42:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
DECLARE @r varchar(60)
execute [Produccion].[SP_Busca_Descripcion_Producto] 'FANGUL',@r
print @r
*/

CREATE  PROCEDURE [Produccion].[SP_Busca_Descripcion_Producto]
	@codigo_producto VARCHAR(10)
	,@descripcion_producto VARCHAR(30) OUT
AS

	BEGIN TRY

			SET @descripcion_producto=(
								SELECT 
				
									ISNULL(ph.nombre_producto,' ') AS 'NOMBRE DEL PRODUCTO'
		
								FROM
									Produccion.Producto_Header ph
		
		
								WHERE codigo_producto=@codigo_producto);

		

				
			

	
	END TRY
	BEGIN CATCH
		print @@ERROR;


	END CATCH


	
GO
