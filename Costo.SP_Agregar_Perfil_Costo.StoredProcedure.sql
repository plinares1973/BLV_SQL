USE [BLV]
GO
/****** Object:  StoredProcedure [Costo].[SP_Agregar_Perfil_Costo]    Script Date: 11/6/2023 10:16:01 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  PROCEDURE [Costo].[SP_Agregar_Perfil_Costo]
	@nombre VARCHAR(20)
	,@descripcion VARCHAR(200)
	,@id_perfil_costo int OUT
AS
	BEGIN TRAN
		BEGIN TRY
			INSERT INTO costo.perfil_costo(
				nombre
				,descripcion
				,fecha_creacion
				,vigente)
			VALUES(
				@nombre
				,@descripcion
				,getdate(),1);

			SET @id_perfil_costo=SCOPE_IDENTITY();

			COMMIT
		END TRY
		BEGIN CATCH
			ROLLBACK
			print @@error
		END CATCH

GO
