USE [BLV]
GO
/****** Object:  StoredProcedure [Produccion].[SP_Busca_Empaque_Disponible]    Script Date: 22/2/2023 10:12:21 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--incluir marca producto en el like

CREATE  PROCEDURE [Produccion].[SP_Busca_Empaque_Disponible]

 AS
	BEGIN TRY
			
			SELECT DISTINCT
				e.descripcion
			FROM
				Produccion.Empaque e
				INNER JOIN Produccion.Stock_Insumo si ON si.id_empaque=e.id_empaque
				
	
	END TRY
	BEGIN CATCH
		print @@ERROR;


	END CATCH
--execute Produccion.SP_busca_Empaque 
GO
