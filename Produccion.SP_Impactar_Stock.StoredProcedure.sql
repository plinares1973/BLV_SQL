USE [BLV]
GO
/****** Object:  StoredProcedure [Produccion].[SP_Impactar_Stock]    Script Date: 10/4/2023 11:10:43 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Produccion].[SP_Impactar_Stock]
	@id_orden_compra int
	,@codigo_lote varchar(10)
	,@fecha_certificado_analisis smalldatetime
	,@certificado_analisis nvarchar(255)
	,@fecha_certificado_circulacion smalldatetime
	,@certificado_circulacion nvarchar(255)
	,@id_lote int OUT
AS

	DECLARE @id_certificado_circulacion INT;

	BEGIN TRAN

		BEGIN TRY
		 
			INSERT INTO Compra.Lote(
				codigo_lote
				,fecha_certificado_analisis
				,certificado_analisis

			)VALUES
			(
				@codigo_lote
				,@fecha_certificado_analisis
				,@certificado_analisis
			);

			SET @id_lote=SCOPE_IDENTITY();

			INSERT INTO Compra.Certificado_Circulacion(
				certificado_circulacion
				,fecha_certificado_circulacion
			)VALUES
			(
				@certificado_circulacion
				,@fecha_certificado_circulacion
				
			)

			SET @id_certificado_circulacion=SCOPE_IDENTITY();

			INSERT INTO Relacion.Orden_Compra_Lote(
				id_orden_compra
				,id_lote
			)VALUES
			(
				@id_orden_compra
				,@id_lote
			);
			
			INSERT INTO Relacion.Lote_Certificado_Circulacion(
				id_batch
				,id_certificado_circulacion
				,fecha_impacto
			)VALUES
			(
				@id_lote
				,@id_certificado_circulacion
				,getdate()

			);

			
			COMMIT;

		END TRY
		BEGIN CATCH
			SET @id_lote=0;
			print @@error;
			ROLLBACK;
		END CATCH
GO
