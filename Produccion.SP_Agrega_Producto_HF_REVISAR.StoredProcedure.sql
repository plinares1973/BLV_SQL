USE [BLV]
GO
/****** Object:  StoredProcedure [Produccion].[SP_Agrega_Producto_HF_REVISAR]    Script Date: 1/3/2023 11:38:04 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
Execute Compra.SP_Agrega_Producto_OC 1,1,1,1000,15000,1
select * from produccion.producto
select * from produccion.empaque
select * from produccion.medida


*/



CREATE  PROCEDURE [Produccion].[SP_Agrega_Producto_HF_REVISAR](
	@id_producto INT
	,@id_hoja_fabrica int
	,@cantidad int
	,@id_medida int
	,@id_empaque int
	,@error int out
	
)
AS
BEGIN
	DECLARE @id_orden_compra_producto int;

	
	SET @error=0;
	BEGIN TRANSACTION
		BEGIN TRY

			--======== SECCION DETALLE ORDEN COMPRA ================-inserto la relacion del lote con el producto
	
			
		
			INSERT INTO Proceso.Hoja_Fabricacion(
				id_producto
				,id_hoja_fabrica
				,cantidad
				,id_medida
				,id_empaque
			)
			VALUES(
				@id_producto
				,@id_hoja_fabrica
				,@cantidad
				,@id_medida
				,@id_empaque
	
			)

				
			INSERT INTO Relacion.Hoja_Fab_Estado(
				id_hoja_fab_estado
				,id_hoja_fabrica 	
				,id_estado 		
				,fecha 			
				,vigente	
			)
			VALUES(
				@id_producto
				,@id_hoja_fabrica 	
				,0	
				,getdate()			
				,1	

			);




			COMMIT;

		END TRY
		BEGIN CATCH
			set @error= @@error;
			ROLLBACK;
		END CATCH
END
GO
