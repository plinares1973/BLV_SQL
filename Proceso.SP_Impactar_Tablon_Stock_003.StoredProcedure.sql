USE [BLV]
GO
/****** Object:  StoredProcedure [Proceso].[SP_Impactar_Tablon_Stock_003]    Script Date: 6/7/2023 8:42:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [Proceso].[SP_Impactar_Tablon_Stock_003]
	@numero_importacion nvarchar(50)
	,@id_lote int
	,@id_deposito int
	,@id_stock int
	,@es_cuarentena int
	,@cantidad_posicion int
AS

DECLARE @id_tablon_stock int;
DECLARE @id_tablon_deposito int;

BEGIN TRAN
	BEGIN TRY
		SET @id_tablon_stock=(SELECT 
				id_tablon_impacto_stock
			FROM
				Proceso.Tablon_Impacto_Stock
			WHERE
				numero_importacion=@numero_importacion
				AND id_lote=@id_lote);



		INSERT INTO Proceso.Tablon_Impacto_Deposito(
			id_deposito
			,id_stock
			,es_cuarentena
			,cantidad_posicion)
		VALUES(
			@id_deposito
			,@id_stock
			,@es_cuarentena
			,@cantidad_posicion
			);
	
		SET @id_tablon_deposito=SCOPE_IDENTITY();

		INSERT INTO Proceso.Relacion_Tablones(
			id_tablon_impacto_stock
			,id_tablon_impacto_deposito)
		VALUES(
			@id_tablon_stock
			,@id_tablon_deposito
		);
			
		COMMIT;
	END TRY
	BEGIN CATCH
		
		
		ROLLBACK;
	END CATCH
GO
