USE [BLV]
GO
/****** Object:  StoredProcedure [Costo].[SP_Agregar_Perfil_Costo]    Script Date: 6/7/2023 8:42:56 p. m. ******/
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
			/*ESTE INSERT ES PARA QUE EN FUTURO
			SE PUEDA CARGAR VARIOS PERFILES Y RELACIONARLOS ENTRE SI
			CON UN ORDEN DE EJECUCION*/

			INSERT INTO costo.Secuencia_Perfil(
				id_perfil_costo
				,orden)
			VALUES(
				@id_perfil_costo
				,1
			)


			COMMIT
		END TRY
		BEGIN CATCH
			ROLLBACK
			print @@error
		END CATCH

GO
