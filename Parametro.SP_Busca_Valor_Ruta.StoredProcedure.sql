USE [BLV]
GO
/****** Object:  StoredProcedure [Parametro].[SP_Busca_Valor_Ruta]    Script Date: 21/3/2023 9:13:35 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [Parametro].[SP_Busca_Valor_Ruta]
	@id_ruta int
	,@ruta varchar(60) OUT
AS
	
	BEGIN TRY
		SET @ruta=(SELECT
						ruta
					FROM
						Parametro.Ruta
					WHERE
						id_ruta=@id_ruta);


	END TRY

	BEGIN CATCH
		SET @ruta='';
	END CATCH


GO
