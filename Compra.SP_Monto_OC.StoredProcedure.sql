USE [BLV]
GO
/****** Object:  StoredProcedure [Compra].[SP_Monto_OC]    Script Date: 17/5/2023 9:15:23 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--execute Compra.SP_Monto_OC 17

CREATE PROCEDURE [Compra].[SP_Monto_OC]
	@id_orden_compra int
	,@monto  float out

AS

	
	BEGIN TRY

		SET @monto=(	

		SELECT 
			
			sum(monto*cantidad)+sum(iif(ocp.derecho_importacion is null,0,ocp.derecho_importacion)) as 'MONTO'
			
		FROM 
			Compra.Orden_Compra OC
			INNER JOIN Compra.Orden_Compra_Producto OCP ON OCP.id_orden_compra=OC.id_orden_compra
			INNER JOIN Relacion.Compra_Estado E ON E.id_compra=OC.id_orden_compra


		WHERE	
			oc.id_orden_compra=@id_orden_compra 
			AND E.vigente=1
		
		);

	END TRY

	BEGIN CATCH
		SET @monto=0;
		print @@ERROR;
		print ERROR_MESSAGE();
	END CATCH
GO
