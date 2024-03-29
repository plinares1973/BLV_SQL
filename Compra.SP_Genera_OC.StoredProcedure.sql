USE [BLV]
GO
/****** Object:  StoredProcedure [Compra].[SP_Genera_OC]    Script Date: 6/7/2023 8:42:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--incluir marca producto en el like
/*
declare @oc int
execute compra.sp_genera_oc 1,1,1,1,1,@oc

	




truncate table compra.orden_compra
delete from compra.lote where id_batch>1000

[Produccion].[SP_Fabricar_Producto]
select * from  compra.orden_compra
select * from compra.orden_compra_producto
select * from compra.Proveedor
select * from sistema.moneda
select * from sistema.medio_pago
select * from compra.flete
select * from sistema.estado
select * from sistema.envio

*/

CREATE  PROCEDURE [Compra].[SP_Genera_OC]
	@id_proveedor int
	,@id_moneda int
	,@id_medio_envio int
	,@id_medio_pago int
	,@id_concepto_costo int

	,@id_orden_compra int OUT --SI HAY ERROR ES CERO
	


 AS
	


	
 	BEGIN TRANSACTION
		BEGIN TRY
			
			
			
			--Inserto la compra
			INSERT INTO Compra.Orden_Compra(
				fecha
	
	
			)
			VALUES(
					getdate()

			);

		

			SET @id_orden_compra=SCOPE_IDENTITY();
			
			INSERT INTO Relacion.Moneda_Orden_Compra(
				id_moneda
				,id_orden_compra
			
			)
			VALUES
			(
				@id_moneda
				,@id_orden_compra
			);

			INSERT INTO Relacion.Orden_Compra_Envio(
				id_orden_compra
				,id_envio
			)
			VALUES
			(
				@id_orden_compra
				,@id_medio_envio
			);
			
			INSERT INTO Relacion.Medio_Pago_Orden_Compra(
				id_orden_compra
				,id_medio_pago
			)
			VALUES
			(
				@id_orden_compra
				,@id_medio_pago
			);
	

			INSERT INTO Relacion.Costo_oc(
				id_concepto
				,id_orden_compra

		
			)
			VALUES
			(	
				@id_concepto_costo
				,@id_orden_compra
				
			);
		

			-- INSERTO EL ESTADO EN "ABIERTA" --> 0
			INSERT INTO Relacion.Compra_Estado(
				id_compra
				,id_estado
				,fecha
				,vigente
			)
			VALUES(
				@id_orden_compra
				,0
				,getdate()
				,1
			);

			--Inserto la relacion proveedor_ordenCompra

			INSERT INTO Relacion.Proveedor_OrdenCompra(
				id_proveedor
				,id_orden_compra
				
			)
			VALUES(
				@id_proveedor
				,@id_orden_compra
			);
		

			

			COMMIT;
		END TRY

		BEGIN CATCH
			set @id_orden_compra= 0;
			ROLLBACK;


		END CATCH



	
GO
