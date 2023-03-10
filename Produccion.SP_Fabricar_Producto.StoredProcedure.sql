USE [BLV]
GO
/****** Object:  StoredProcedure [Produccion].[SP_Fabricar_Producto]    Script Date: 1/3/2023 11:38:04 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---IDEA:
/*

Ingresar de a un producto - ingrediente
con un parametro de "receta abierta"
luego se aglutina todo con un parametro de receta cerrada


*/

CREATE  PROCEDURE [Produccion].[SP_Fabricar_Producto]
	@codigo_producto varchar(10)
	,@nombre_producto varchar(30)
	,@nombre_ingrediente varchar(50)
	,@cantidad int


	,@fecha_elaboracion smalldatetime
	,@dias_al_vencimiento int
	,@error int=0 OUT

	
	

 AS
	BEGIN TRANSACTION
		BEGIN TRY
	/*	
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
				*/
			COMMIT
			SET @error=0
	END TRY
	BEGIN CATCH
		SET @error= @@ERROR;
		ROLLBACK

	END CATCH

GO
