USE [BLV]
GO
/****** Object:  StoredProcedure [Produccion].[SP_Busca_Medida]    Script Date: 14/3/2023 11:16:39 a. m. ******/
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
