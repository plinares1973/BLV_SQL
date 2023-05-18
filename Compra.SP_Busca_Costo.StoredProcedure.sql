USE [BLV]
GO
/****** Object:  StoredProcedure [Compra].[SP_Busca_Costo]    Script Date: 17/5/2023 9:15:23 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--incluir marca producto en el like

CREATE   PROCEDURE [Compra].[SP_Busca_Costo]

 AS
	BEGIN TRY
			
			SELECT 
				nombre
			FROM
				Costo.Concepto_header
			WHERE
				id_tipo_concepto = 3
	
	END TRY
	BEGIN CATCH
		print @@ERROR;


	END CATCH
--execute Compra.[SP_Busca_Flete]
GO
