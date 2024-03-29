USE [BLV]
GO
/****** Object:  StoredProcedure [Sistema].[SP_busca_acceso]    Script Date: 6/7/2023 8:42:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [Sistema].[SP_busca_acceso]
	@usuario varchar(20) 
	
AS
	
	BEGIN TRY
		SELECT
			r.id_perfil
			,r.id_acceso
		FROM
			Relacion.Usuario_Perfil_Acceso r
			INNER JOIN Sistema.Usuario u ON r.id_usuario=u.id_usuario
		WHERE
			u.usuario=@usuario;

	END TRY
		BEGIN CATCH
		print @@ERROR;


	END CATCH
GO
