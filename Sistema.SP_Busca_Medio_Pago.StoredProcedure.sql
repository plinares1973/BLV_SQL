USE [BLV]
GO
/****** Object:  StoredProcedure [Sistema].[SP_Busca_Medio_Pago]    Script Date: 14/4/2023 12:48:04 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--incluir marca producto en el like

CREATE  PROCEDURE [Sistema].[SP_Busca_Medio_Pago]

 AS
	BEGIN TRY
			
			SELECT 
				descripcion
			FROM
				Sistema.Medio_pago
	
	END TRY
	BEGIN CATCH
		print @@ERROR;


	END CATCH
--execute Sistema.SP_Busca_Medio_Pago
GO
