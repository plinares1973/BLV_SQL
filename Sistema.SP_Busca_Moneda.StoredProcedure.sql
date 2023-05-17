USE [BLV]
GO
/****** Object:  StoredProcedure [Sistema].[SP_Busca_Moneda]    Script Date: 17/5/2023 1:14:14 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--incluir marca producto en el like

CREATE  PROCEDURE [Sistema].[SP_Busca_Moneda]

 AS
	BEGIN TRY
			
			SELECT 
				nomenclatura
				,descripcion
			FROM
				Sistema.moneda
	
	END TRY
	BEGIN CATCH
		print @@ERROR;


	END CATCH
--execute Produccion.SP_busca_moneda
GO
