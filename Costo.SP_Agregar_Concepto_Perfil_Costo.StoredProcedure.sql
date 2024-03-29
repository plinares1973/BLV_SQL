USE [BLV]
GO
/****** Object:  StoredProcedure [Costo].[SP_Agregar_Concepto_Perfil_Costo]    Script Date: 6/7/2023 8:42:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE  PROCEDURE [Costo].[SP_Agregar_Concepto_Perfil_Costo]
	@id_perfil_costo int
	,@id_concepto int
	,@id_enlace_concepto int
AS

	BEGIN TRAN
		BEGIN TRY
			INSERT INTO relacion.Perfil_Concepto(
				id_perfil_costo
				,id_concepto_header
				,enlace_concepto)
			VALUES(
				@id_perfil_costo
				,@id_concepto
				,@id_enlace_concepto)

		

			COMMIT
		END TRY
		BEGIN CATCH
			ROLLBACK
			print @@error
		END CATCH
GO
