USE [BLV]
GO
/****** Object:  StoredProcedure [Sistema].[SP_Busca_Estados]    Script Date: 6/7/2023 8:42:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--incluir marca producto en el like

CREATE  PROCEDURE [Sistema].[SP_Busca_Estados](

	@id_estado int NULL
)

 AS
	DECLARE @estados TABLE(
		id_estado INT
		,descripcion VARCHAR(20)
	);

	BEGIN TRY

			INSERT INTO @estados(
				id_estado
				,descripcion
			)
			SELECT 
				id_estado
				,descripcion
			FROM
				Sistema.Estado;
	

			IF(not @id_estado is null)
			BEGIN
				DELETE FROM @estados WHERE id_estado=@id_estado;
			
			END

			SELECT 
				descripcion
			FROM
				@estados
			
	END TRY
	BEGIN CATCH
		print @@ERROR;


	END CATCH
--execute Sistema.SP_Busca_Medio_Pago
GO
