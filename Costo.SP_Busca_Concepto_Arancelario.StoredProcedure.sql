USE [BLV]
GO
/****** Object:  StoredProcedure [Costo].[SP_Busca_Concepto_Arancelario]    Script Date: 6/7/2023 8:42:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  PROCEDURE [Costo].[SP_Busca_Concepto_Arancelario]

AS

BEGIN TRY

	SELECT
		ch.id_concepto_header
		,tic.descripcion
		,ch.nombre
		,ch.descripcion
		,IIF(tc.valor is not null,
			IIF(tv.id_tipo_concepto=2,'% '+Convert(varchar,tc.valor),'USD '+Convert(varchar,tc.valor))
			,'CARGAR') as Gravamen

		
	FROM
		Costo.Concepto_Header ch
		LEFT JOIN Costo.Tasa_concepto tc ON tc.id_concepto_header=ch.id_concepto_header
		INNER JOIN Costo.tipo_concepto tic ON tic.id_tipo_concepto=ch.id_tipo_concepto
		INNER JOIN Costo.Tipo_Valor tv ON tv.id_tipo_concepto=ch.id_tipo_valor




END TRY
BEGIN CATCH
	print @@error;
END CATCH
GO
