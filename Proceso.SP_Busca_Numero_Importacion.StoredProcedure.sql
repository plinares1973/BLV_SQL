USE [BLV]
GO
/****** Object:  StoredProcedure [Proceso].[SP_Busca_Numero_Importacion]    Script Date: 19/6/2023 2:57:31 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Proceso].[SP_Busca_Numero_Importacion]
	@numero_importacion nvarchar(50)
	,@resultado integer out
AS

	SET @resultado=(SELECT 
					count(1) 
				FROM 
					Proceso.Tablon_Impacto_Stock
				WHERE
					numero_importacion=@numero_importacion);
GO
