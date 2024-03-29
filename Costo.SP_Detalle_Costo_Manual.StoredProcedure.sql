USE [BLV]
GO
/****** Object:  StoredProcedure [Costo].[SP_Detalle_Costo_Manual]    Script Date: 6/7/2023 8:42:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [Costo].[SP_Detalle_Costo_Manual]
	@id_concepto_costo int
	,@es_manual int out
	
AS

BEGIN TRY
	
	SET @es_manual=(SELECT 
						count(PH.id_concepto_header)
						
					FROM
						costo.Concepto_Header PH
						INNER JOIN Costo.tasa_concepto TC ON TC.id_concepto_header=PH.id_concepto_header
				
					WHERE
					
						PH.id_concepto_header=@id_concepto_costo);
	IF(@es_manual=0)
	BEGIN
		SET @es_manual=(SELECT 
							count(PH.id_concepto_header)
						
						FROM
							costo.Concepto_Header PH
						
							INNER JOIN relacion.Derecho_importacion_Producto DIP ON DIP.id_concepto=PH.id_concepto_header
						
						WHERE
					
							PH.id_concepto_header=@id_concepto_costo);
	 END
END TRY
BEGIN CATCH
	print @@error;
END CATCH
GO
