USE [BLV]
GO
/****** Object:  StoredProcedure [Sistema].[SP_Busca_ID_Estado]    Script Date: 14/4/2023 12:48:04 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Sistema].[SP_Busca_ID_Estado](
	@descripcion varchar(20)

	)

AS

					SELECT
						id_estado
					FROM
						Sistema.Estado
					WHERE
						descripcion=TRIM(@descripcion)
GO
