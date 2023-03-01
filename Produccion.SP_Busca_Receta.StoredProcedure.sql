USE [BLV]
GO
/****** Object:  StoredProcedure [Produccion].[SP_Busca_Receta]    Script Date: 1/3/2023 11:38:04 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE  PROCEDURE [Produccion].[SP_Busca_Receta]
	@codigo_producto varchar(10) 



 AS
 	BEGIN TRY


			DECLARE @id_receta int;
		

			SET @id_receta=(SELECT id_receta FROM Produccion.Receta WHERE codigo_producto=@codigo_producto);


			SELECT 
				
				codigo_producto
				,nombre_receta
				,id_receta
			FROM
				Produccion.Receta
				
			WHERE 
				id_receta =@id_receta;
				

		

				
			

	
	END TRY
	BEGIN CATCH
		print @@ERROR;


	END CATCH


	
--execute [Produccion].[SP_Busca_Receta] 'FAB042'
GO
