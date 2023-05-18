USE [BLV]
GO
/****** Object:  StoredProcedure [Sistema].[SP_Busca_Deposito]    Script Date: 17/5/2023 9:15:23 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--incluir marca producto en el like

CREATE PROCEDURE [Sistema].[SP_Busca_Deposito]

 AS
	BEGIN TRY
			
		SELECT
				d.nombre
				,v.CIUDAD
				,d.id_deposito
		FROM 
			sistema.deposito d 
			INNER JOIN Relacion.Deposito_ciudad c ON c.id_deposito=d.id_deposito
			INNER JOIN Sistema.vw_ciudades v ON v.ID_CIUDAD=c.id_ciudad

	
	END TRY
	BEGIN CATCH
		print @@ERROR;


	END CATCH
--execute Compra.[SP_Busca_Flete]
GO
