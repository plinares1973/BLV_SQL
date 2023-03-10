USE [BLV]
GO
/****** Object:  StoredProcedure [Produccion].[SP_Impactar_Stock]    Script Date: 14/3/2023 11:16:39 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Produccion].[SP_Impactar_Stock]
	@id_orden_compra int
	,@codigo_lote varchar(10)
	,@fecha_certificado_analisis smalldatetime
	,@fecha_certificado_circulacion smalldatetime
	,@id_lote int OUT
AS


	BEGIN TRAN

		BEGIN TRY
		 
			INSERT INTO Compra.Lote(
				codigo_lote
				,fecha_certificado_analisis
				,fecha_certificado_circulacion

			)VALUES
			(
				@codigo_lote
				,@fecha_certificado_analisis
				,@fecha_certificado_circulacion
			);

			SET @id_lote=SCOPE_IDENTITY();

			INSERT INTO Relacion.Orden_Compra_Lote(
				id_orden_compra
				,id_lote
			)VALUES
			(
				@id_orden_compra
				,@id_lote
			);
			


			
			COMMIT;

		END TRY
		BEGIN CATCH
			SET @id_lote=0;
			print @@error;
			ROLLBACK;
		END CATCH
GO
