USE [BLV]
GO
/****** Object:  StoredProcedure [Proceso].[SP_Impactar_Tablon_Stock_003]    Script Date: 17/5/2023 9:15:23 p. m. ******/
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
			,es_cuarentena)
		VALUES(
			@id_deposito
			,@id_stock
			,@es_cuarentena)
	
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
