USE [BLV]
GO
/****** Object:  StoredProcedure [Sistema].[SP_Busca_Envio]    Script Date: 22/3/2023 11:18:50 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--incluir marca producto en el like

CREATE  PROCEDURE [Sistema].[SP_Busca_Envio]

 AS
	BEGIN TRY
			
			SELECT 
				descripcion
			FROM
				 Sistema.Envio
	
	END TRY
	BEGIN CATCH
		print @@ERROR;


	END CATCH
--execute Compra.[SP_Busca_Flete]
GO
