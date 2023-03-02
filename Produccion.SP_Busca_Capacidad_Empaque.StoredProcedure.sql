USE [BLV]
GO
/****** Object:  StoredProcedure [Produccion].[SP_Busca_Capacidad_Empaque]    Script Date: 2/3/2023 7:13:22 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  PROCEDURE [Produccion].[SP_Busca_Capacidad_Empaque]
	@empaque varchar(40)
 AS
	BEGIN TRY
		
			
			SELECT 
				CE.capacidad
			FROM
				Produccion.Capacidad_Envase CE
				INNER JOIN Produccion.Empaque E ON E.id_empaque=CE.id_empaque
			WHERE
				E.descripcion=@empaque;

	END TRY
	BEGIN CATCH
		print @@ERROR;


	END CATCH
GO
