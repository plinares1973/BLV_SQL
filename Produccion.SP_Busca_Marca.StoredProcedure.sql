USE [BLV]
GO
/****** Object:  StoredProcedure [Produccion].[SP_Busca_Marca]    Script Date: 17/5/2023 9:15:23 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  PROCEDURE [Produccion].[SP_Busca_Marca]
AS

	BEGIN TRY

		
			SELECT 
				DISTINCT
				pm.marca AS 'MARCA'
		
			FROM
				Produccion.Producto_Marca pm
		
		
		

		

				
			

	
	END TRY
	BEGIN CATCH
		print @@ERROR;


	END CATCH


	
GO
