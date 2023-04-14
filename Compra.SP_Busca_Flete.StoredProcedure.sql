USE [BLV]
GO
/****** Object:  StoredProcedure [Compra].[SP_Busca_Flete]    Script Date: 14/4/2023 12:48:04 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--incluir marca producto en el like

CREATE  PROCEDURE [Compra].[SP_Busca_Flete]

 AS
	BEGIN TRY
			
			SELECT 
				descripcion
			FROM
				Compra.Flete
	
	END TRY
	BEGIN CATCH
		print @@ERROR;


	END CATCH
--execute Compra.[SP_Busca_Flete]
GO
