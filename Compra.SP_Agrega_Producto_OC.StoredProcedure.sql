USE [BLV]
GO
/****** Object:  StoredProcedure [Compra].[SP_Agrega_Producto_OC]    Script Date: 6/7/2023 8:42:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
DECLARE @e int
Execute Compra.SP_Agrega_Producto_OC 1,'CIT005','CROBION',1,25,1000,1500,1,@e
select * from produccion.producto
select * from produccion.empaque
select * from produccion.medida


*/



CREATE PROCEDURE [Compra].[SP_Agrega_Producto_OC](
	@id_orden_compra INT
	,@codigo_producto VARCHAR(10)
	,@marca VARCHAR (50)
	,@id_empaque int
	,@capacidad_envase int
	,@cantidad int
	,@monto float
	,@id_medida int

	,@error int out
	
)
AS
BEGIN
	DECLARE @id_orden_compra_producto int;

	
	SET @error=0;
	BEGIN TRANSACTION
		BEGIN TRY

			--======== SECCION DETALLE ORDEN COMPRA ================-inserto la relacion del lote con el producto
	


		
		
			INSERT INTO Compra.Orden_Compra_Producto(
				id_orden_compra
				,codigo_producto
				,marca
				,cantidad
				,monto
			)
			VALUES( 
				@id_orden_compra
				,@codigo_producto
				,@marca
				,@cantidad
				,@monto
			)



			SET @id_orden_compra_producto=SCOPE_IDENTITY();


			INSERT INTO Relacion.OC_Producto_Empaque(
				id_ocompra_producto
				,id_empaque
				,capacidad_envase
			)
			VALUES(
				@id_orden_compra_producto
				,@id_empaque
				,@capacidad_envase

			);

			INSERT INTO Relacion.OC_Producto_Medida(
				id_ocompra_producto
				,id_medida
			
			)
			VALUES(
				@id_orden_compra_producto
				,@id_medida
				
			);


			COMMIT;

		END TRY
		BEGIN CATCH
			set @error= @@error;
			ROLLBACK;
		END CATCH
END

GO
