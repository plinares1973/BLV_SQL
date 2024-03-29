USE [BLV]
GO
/****** Object:  StoredProcedure [Costo].[SP_Busca_Perfil_Costo]    Script Date: 6/7/2023 8:42:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [Costo].[SP_Busca_Perfil_Costo]
	@id_enlace_concepto int

	
AS

BEGIN TRY
	SELECT DISTINCT
		
		PC.nombre
		,PC.Descripcion
		,PC.id_perfil_costo
	FROM
		costo.perfil_costo PC
		INNER JOIN relacion.Perfil_Concepto RPC ON RPC.id_perfil_costo=PC.id_perfil_costo
	
	WHERE
		PC.vigente=1
		AND RPC.enlace_concepto=@id_enlace_concepto
END TRY
BEGIN CATCH
	print @@error;
END CATCH
GO
