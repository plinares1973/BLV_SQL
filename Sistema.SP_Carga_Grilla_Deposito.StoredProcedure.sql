USE [BLV]
GO
/****** Object:  StoredProcedure [Sistema].[SP_Carga_Grilla_Deposito]    Script Date: 1/3/2023 11:38:04 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Sistema].[SP_Carga_Grilla_Deposito]


AS

BEGIN TRY
		
		SELECT
			nombre
			,domicilio
			,telefono
			,fax
			,mail
			,CIUDAD
			,estado
	
		FROM 
			Sistema.VW_Depositos 


END TRY

BEGIN CATCH
		print @@ERROR;
END CATCH




GO
