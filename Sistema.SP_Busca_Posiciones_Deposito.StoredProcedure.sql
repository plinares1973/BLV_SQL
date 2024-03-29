USE [BLV]
GO
/****** Object:  StoredProcedure [Sistema].[SP_Busca_Posiciones_Deposito]    Script Date: 6/7/2023 8:42:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  PROCEDURE [Sistema].[SP_Busca_Posiciones_Deposito]
	@id_deposito int
	,@es_cuarentena int
 AS
	BEGIN TRY
			

		SELECT
			s.id_stock AS 'IDENTIFICACION'
			,s.piso AS 'PISO'
			,s.posicion AS 'POSICION'
			,s.altura AS 'ALTURA'
			,s.fila AS 'FILA'
		FROM
			produccion.stock s
			INNER JOIN relacion.Deposito_Stock ds ON ds.id_stock=s.id_stock
			INNER JOIN sistema.deposito d ON d.id_deposito = ds.id_deposito

		WHERE
			s.disponible=1
			AND d.id_deposito=@id_deposito
			AND s.cuarentena=@es_cuarentena
			AND s.id_stock NOT IN(Select id_stock FROM Proceso.Tablon_Impacto_Deposito);
	END TRY
	BEGIN CATCH
		print @@ERROR;


	END CATCH
GO
