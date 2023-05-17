USE [BLV]
GO
/****** Object:  StoredProcedure [Costo].[Calculador_Costo_Compra]    Script Date: 17/5/2023 1:14:14 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Costo].[Calculador_Costo_Compra]
	@id_orden_compra int
	,@monto_costo float
	,@monto_final float out
AS
	DECLARE @tabla_orden TABLE(id_perfil int);
	
	BEGIN TRANSACTION


		BEGIN TRY
			INSERT INTO @tabla_orden
			SELECT
				PC.id_perfil_costo
			FROM
				Costo.Secuencia_Perfil SP
				INNER JOIN Costo.perfil_costo PC ON PC.id_perfil_costo=SP.id_perfil_costo
			ORDER BY
				orden

			COMMIT
		END TRY
		BEGIN CATCH
			print @@error
			ROLLBACK
		END CATCH
GO
