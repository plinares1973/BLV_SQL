USE [BLV]
GO
/****** Object:  StoredProcedure [Produccion].[SP_Busca_Medida]    Script Date: 5/7/2023 10:45:15 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--incluir marca producto en el like

CREATE  PROCEDURE [Produccion].[SP_Busca_Medida]

 AS
	BEGIN TRY
			
			SELECT 
				descripcion
			FROM
				Produccion.Medida
	
	END TRY
	BEGIN CATCH
		print @@ERROR;


	END CATCH
--execute Produccion.SP_busca_Medida
GO
