USE [BLV]
GO
/****** Object:  StoredProcedure [Proceso].[Impactar_Tablon_Stock_004]    Script Date: 20/4/2023 12:38:00 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Proceso].[Impactar_Tablon_Stock_004]
	@numero_importacion nvarchar(50)
	,@id_orden_compra int


AS
	BEGIN TRANSACTION
		BEGIN TRY
			UPDATE 
				Compra.Orden_Compra 
			SET 
				codigo_importacion=@numero_importacion
			WHERE
				id_orden_compra=@id_orden_compra;
/*
			INSERT INTO Compra.lote(
				id_orden_compra
				,id_lote)	SELECT
								id_compra
								,id_lote
							FROM
								Proceso.Tablon_Impacto_Stock
							WHERE
								id_compra=@id_compra;
				
				

			INSERT INTO Relacion.Orden_Compra_Lote(
													

		*/

		END TRY
		BEGIN CATCH
			ROLLBACK;
		END CATCH
GO
