USE [BLV]
GO
/****** Object:  StoredProcedure [Produccion].[SP_Impactar_Stock]    Script Date: 6/7/2023 8:42:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Produccion].[SP_Impactar_Stock]
	@id_orden_compra int

AS

	DECLARE @id_certificado_circulacion INT;

	BEGIN TRAN

		BEGIN TRY
/*
		begin tran
		DECLARE @id_orden_compra INT
		set @id_orden_compra=1
*/
			DECLARE @LotesInsertados TABLE (
				id_batch INT
				
			)
			DECLARE @Posiciones_Stock TABLE(
				id_stock INT)
			
			
			INSERT INTO Compra.Lote(
				codigo_lote
				,codigo_producto
				,fecha_elaboracion
				,fecha_vencimiento)
			OUTPUT inserted.id_batch INTO @LotesInsertados
			SELECT
				numero_importacion+FORMAT(id_lote, '000')
				,codigo_producto
				,fecha_elaboracion
				,fecha_vencimiento
			FROM 
				Proceso.Tablon_Impacto_Stock
			WHERE
				id_compra=@id_orden_compra;


			INSERT INTO Relacion.Orden_Compra_Lote(
				id_lote
				,id_ocompra_producto)
			SELECT 
				li.id_batch 
				,ocp.id_ocompra_producto
			FROM  
				@LotesInsertados li
				INNER JOIN Compra.Lote l on l.id_batch=li.id_batch
				INNER JOIN Compra.Orden_Compra_Producto ocp ON ocp.codigo_producto=l.codigo_producto
			WHERE
				ocp.id_orden_compra=@id_orden_compra;

			
			INSERT INTO Compra.Certificado_COA(
				certificado_coa
				,fecha_certificado_coa
				,id_ocompra_producto
			)
			SELECT DISTINCT 
				prtis.certificado_coa
				,getdate()
				,ocp.id_ocompra_producto
			FROM compra.Orden_Compra_Producto ocp
			INNER JOIN proceso.tablon_impacto_stock prtis ON prtis.codigo_producto=ocp.codigo_producto
			WHERE ocp.id_orden_compra=@id_orden_compra;



			INSERT INTO relacion.Lote_stock(
				
				id_batch
				,id_stock
				,fecha_impacto
				,cantidad
			)
			OUTPUT inserted.id_stock INTO @Posiciones_Stock
			SELECT
				l.id_batch
				,prtid.id_stock
				,getdate()
				,prtid.cantidad_posicion

			FROM
				Proceso.Tablon_Impacto_Stock prtis
				INNER JOIN Proceso.Relacion_Tablones prrt ON prrt.id_tablon_impacto_stock=prtis.id_tablon_impacto_stock
				INNER JOIN Proceso.Tablon_Impacto_Deposito prtid ON prtid.id_tablon_impacto_deposito=prrt.id_tablon_impacto_deposito
				INNER JOIN Compra.Lote l ON l.codigo_lote=prtis.numero_importacion+FORMAT(prtis.id_lote, '000')
			WHERE 
				prtis.id_compra=@id_orden_compra

		
			UPDATE Produccion.Stock
			SET disponible=0
			WHERE id_stock IN(SELECT id_Stock FROM @Posiciones_Stock);
			COMMIT;			
		
			DELETE FROM Proceso.Tablon_Impacto_Deposito
			WHERE id_tablon_impacto_deposito IN(SELECT id_tablon_impacto_deposito
												FROM Proceso.Relacion_Tablones
												WHERE id_tablon_impacto_stock IN(SELECT id_tablon_impacto_stock
																				 FROM Proceso.Tablon_Impacto_Stock
																				 WHERE id_compra=@id_orden_compra));

			DELETE FROM Proceso.Relacion_Tablones
			WHERE id_tablon_impacto_stock IN (SELECT id_tablon_impacto_stock
											  FROM Proceso.Tablon_Impacto_Stock
											 WHERE id_compra=@id_orden_compra);

			DELETE FROM Proceso.Tablon_Impacto_Stock WHERE id_compra=@id_orden_compra;
		
		END TRY
		BEGIN CATCH

			print @@error;
			ROLLBACK;
		END CATCH
GO
