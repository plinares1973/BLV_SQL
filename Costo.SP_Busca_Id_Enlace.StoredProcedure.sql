USE [BLV]
GO
/****** Object:  StoredProcedure [Costo].[SP_Busca_Id_Enlace]    Script Date: 6/7/2023 8:42:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [Costo].[SP_Busca_Id_Enlace]
	@nombre varchar(20)
	,@id_enlace int out

	
AS

BEGIN TRY
	SET @id_enlace=(SELECT
						id_concepto_header
					FROM
						costo.Concepto_Header 
					WHERE
						nombre=@nombre);
END TRY
BEGIN CATCH
	print @@error;
END CATCH
GO
