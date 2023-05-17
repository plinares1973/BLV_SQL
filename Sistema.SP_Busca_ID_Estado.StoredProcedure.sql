USE [BLV]
GO
/****** Object:  StoredProcedure [Sistema].[SP_Busca_ID_Estado]    Script Date: 17/5/2023 1:14:14 a. m. ******/
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
