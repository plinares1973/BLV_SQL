USE [BLV]
GO
/****** Object:  StoredProcedure [Compra].[SP_Monto_OC]    Script Date: 1/3/2023 11:38:04 a. m. ******/
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
			
			sum(monto*cantidad) as 'MONTO'
			
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
