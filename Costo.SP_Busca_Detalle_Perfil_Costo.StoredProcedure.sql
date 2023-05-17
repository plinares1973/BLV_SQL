USE [BLV]
GO
/****** Object:  StoredProcedure [Costo].[SP_Busca_Detalle_Perfil_Costo]    Script Date: 17/5/2023 1:14:14 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [Costo].[SP_Busca_Detalle_Perfil_Costo]
	@id_perfil_costo int

	
AS

BEGIN TRY
	SELECT 
		CH.id_concepto_header
		,CH.nombre
		,(SELECT descripcion FROM Costo.Tipo_Valor WHERE id_tipo_concepto=CH.id_tipo_valor) as Valor
	
	FROM
		costo.perfil_costo PC
		INNER JOIN relacion.Perfil_Concepto RPC ON RPC.id_perfil_costo=PC.id_perfil_costo
		INNER JOIN Costo.Concepto_Header CH ON CH.id_concepto_header=rpc.id_concepto_header
	WHERE
		PC.vigente=1
		AND PC.id_perfil_costo=@id_perfil_costo;
END TRY
BEGIN CATCH
	print @@error;
END CATCH
GO
