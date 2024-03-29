USE [BLV]
GO
/****** Object:  StoredProcedure [Produccion].[SP_Ingresar_Producto]    Script Date: 6/7/2023 8:42:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE  PROCEDURE [Produccion].[SP_Ingresar_Producto]
	@codigo_producto varchar(10)
	,@nombre_producto varchar(30)
	,@fecha_elaboracion smalldatetime
	,@dias_al_vencimiento int
	,@error int=0 OUT

	
	

 AS
	BEGIN TRANSACTION
		BEGIN TRY
		
			INSERT INTO Produccion.Producto(
				codigo_producto
				,nombre_producto
				,fecha_elaboracion
				,fecha_vencimiento
			)VALUES(
				@codigo_producto
				,@nombre_producto
				,@fecha_elaboracion
				,@fecha_elaboracion+@dias_al_vencimiento)

			COMMIT
			SET @error=0
	END TRY
	BEGIN CATCH
		SET @error= @@ERROR;
		ROLLBACK

	END CATCH
--execute Produccion.SP_Selector_batch 1


--select * from Produccion.Producto
--delete from produccion.producto where codigo_producto='PRC001'
GO
