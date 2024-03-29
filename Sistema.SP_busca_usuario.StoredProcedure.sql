USE [BLV]
GO
/****** Object:  StoredProcedure [Sistema].[SP_busca_usuario]    Script Date: 6/7/2023 8:42:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [Sistema].[SP_busca_usuario]
	@usuario varchar(20) 
	,@password varchar(20)
	,@resultado bit OUT
	
AS
	
	BEGIN TRY
	
		SET @resultado=(
			SELECT
				count(u.usuario)
	
		
			FROM
				Sistema.Usuario u
				INNER JOIN Relacion.Usuario_Pass rup ON u.id_usuario=rup.id_usuario
				INNER JOIN Sistema.Pass p ON rup.id_pass=p.id_pass
			WHERE
				(p.clave=@password 
				AND p.vigente=1)
				AND u.usuario=@usuario
		);

	END TRY
	BEGIN CATCH
		print @@ERROR;
		ROLLBACK;

	END CATCH



--execute Sistema.SP_busca_usuario 'plinares','123456'
/*
select * from Sistema.Usuario
select * from Relacion.usuario_pass

select * from Sistema.Pass
*/
GO
