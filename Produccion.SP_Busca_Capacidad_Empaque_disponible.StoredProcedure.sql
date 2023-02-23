USE [BLV]
GO
/****** Object:  StoredProcedure [Produccion].[SP_Busca_Capacidad_Empaque_disponible]    Script Date: 22/2/2023 10:12:20 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  PROCEDURE [Produccion].[SP_Busca_Capacidad_Empaque_disponible]
	@empaque varchar(40)
 AS
	BEGIN TRY
		
			
			SELECT  DISTINCT
				CE.capacidad
			FROM
				Produccion.Capacidad_Envase CE
				INNER JOIN Produccion.Empaque E ON E.id_empaque=CE.id_empaque
				INNER JOIN Produccion.Stock_Insumo SI ON SI.id_capacidad=CE.id_capacidad_envase
			WHERE
				E.descripcion= @empaque;

	END TRY
	BEGIN CATCH
		print @@ERROR;


	END CATCH
GO
