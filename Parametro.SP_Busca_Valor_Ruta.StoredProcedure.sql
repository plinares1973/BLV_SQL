USE [BLV]
GO
/****** Object:  StoredProcedure [Parametro].[SP_Busca_Valor_Ruta]    Script Date: 19/6/2023 2:57:31 p. m. ******/
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
