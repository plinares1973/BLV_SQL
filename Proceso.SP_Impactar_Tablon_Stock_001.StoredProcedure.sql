USE [BLV]
GO
/****** Object:  StoredProcedure [Proceso].[SP_Impactar_Tablon_Stock_001]    Script Date: 6/7/2023 8:42:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Proceso].[SP_Impactar_Tablon_Stock_001]
	@id_compra int

	,@numero_importacion nvarchar(50)
	
	,@id_lote int
	,@codigo_producto varchar(30)
	,@marca varchar(50)
	,@libre_circulacion nvarchar(255)
	,@fecha_certificado_libre_circulacion smalldatetime
	,@COA nvarchar(255)
	,@fecha_elaboracion smalldatetime
	,@fecha_vencimiento smalldatetime


AS



BEGIN TRAN
	BEGIN TRY
		
		INSERT INTO Proceso.Tablon_Impacto_Stock(id_compra
								
												,numero_importacion
												,id_lote
												,codigo_producto
												,marca
												,certificado_libre_circulacion
												,fecha_certificado_libre_circulacion
												,certificado_COA
												,fecha_elaboracion
												,fecha_vencimiento)
										VALUES(
												@id_compra
										
												,@numero_importacion
												,@id_lote
												,@codigo_producto
												,@marca
												,@libre_circulacion
												,CONVERT(date,@fecha_certificado_libre_circulacion,112)
												,@COA
												,CONVERT(date,@fecha_elaboracion,112)
												,CONVERT(date,@fecha_vencimiento,112));
		
		
		
		
		
					UPDATE 
						Proceso.Tablon_Impacto_Stock
					SET 
						id_ocompra_producto=ocp.id_ocompra_producto
					FROM 
						Proceso.Tablon_Impacto_Stock prtis 
						INNER JOIN Compra.Orden_Compra_Producto ocp ON ocp.codigo_producto= prtis.codigo_producto
					WHERE 
						ocp.id_orden_compra=@id_compra 
						AND prtis.id_ocompra_producto IS NULL;




		COMMIT;
	END TRY
	BEGIN CATCH
		
		
		ROLLBACK;
	END CATCH
GO
