USE [BLV]
GO
/****** Object:  StoredProcedure [Sistema].[SP_Busca_ID_Ciudad]    Script Date: 6/7/2023 8:42:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE  [Sistema].[SP_Busca_ID_Ciudad]
	@continente varchar(40)
	,@pais varchar(60)
	,@estado varchar(20)
	,@ciudad varchar(20)
	,@id_ciudad int OUT
AS
	BEGIN TRY
		SET @id_ciudad=(	
			SELECT
				ID_CIUDAD
			FROM 
				Sistema.vw_ciudades
			WHERE
				CONTINENTE =@continente
				AND PAIS =@pais
				AND ESTADO =@estado
				AND CIUDAD =@ciudad);


	END TRY
	BEGIN CATCH
		SET @id_ciudad=0;		

	END CATCH
GO
