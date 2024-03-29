USE [BLV]
GO
/****** Object:  StoredProcedure [Costo].[SP_Busca_Perfil_Costo_Generico]    Script Date: 6/7/2023 8:42:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--EXEC costo.SP_Busca_Perfil_Costo_Generico 1

CREATE  procedure [Costo].[SP_Busca_Perfil_Costo_Generico]
	@vigente int

	
AS

BEGIN TRY
	IF @vigente=1
		BEGIN
			SELECT DISTINCT
				PC.id_perfil_costo
				,PC.nombre
				,PC.Descripcion
				,PC.fecha_creacion
			FROM
				costo.perfil_costo PC
	
	
			WHERE
				PC.vigente=1;
		END
	ELSE
		BEGIN
			SELECT DISTINCT
				PC.id_perfil_costo
				,PC.nombre
				,PC.Descripcion
				,PC.fecha_creacion
				,IIf(PC.fecha_baja is null,'VIGENTE',convert(varchar,pc.fecha_baja,112)) as 'Fecha de Baja'
			FROM
				costo.perfil_costo PC;
	
	
		

		END

END TRY
BEGIN CATCH
	print @@error;
END CATCH
GO
