USE [BLV]
GO
/****** Object:  StoredProcedure [Produccion].[SP_Busca_Receta_Gestion]    Script Date: 6/7/2023 8:42:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE  PROCEDURE [Produccion].[SP_Busca_Receta_Gestion]
	@codigo_producto varchar(10) null
	,@nombre_receta varchar(50) null
	,@codigo_ingrediente varchar(10) null


 AS
 	BEGIN TRY


			--DECLARE @id_receta int;
		

			--SET @id_receta=(SELECT id_receta FROM Produccion.Receta WHERE codigo_producto=@codigo_producto);


			SELECT 
				
				r.codigo_producto AS 'CODIGO A FABRICAR'
				,r.nombre_receta AS 'NOMBRE DE RECETA'
				,pr.codigo_ingrediente_producto as 'CODIGO INGREDIENTES'
				,(Select nombre_producto FROM Produccion.Producto_Header WHERE codigo_producto=pr.codigo_ingrediente_producto) AS 'INGREDIENTES'
			FROM
				Produccion.Receta R
				INNER JOIN Relacion.Producto_Receta PR ON PR.id_receta=r.id_receta
				
			WHERE 
				r.codigo_producto LIKE('%'+@codigo_producto+'%')
				AND r.nombre_receta LIKE('%'+@nombre_receta+'%')
				AND pr.codigo_ingrediente_producto LIKE('%'+@codigo_ingrediente+'%')
		
				

		

				
			

	
	END TRY
	BEGIN CATCH
		print @@ERROR;


	END CATCH


	
--execute [Produccion].[SP_Busca_Receta] 'FAB042'
GO
