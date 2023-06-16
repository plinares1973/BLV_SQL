USE [BLV]
GO
/****** Object:  StoredProcedure [Proceso].[SP_Impactar_Tablon_Stock_001]    Script Date: 15/6/2023 10:50:49 p. m. ******/
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
		
		
		
		
		

	

		COMMIT;
	END TRY
	BEGIN CATCH
		
		
		ROLLBACK;
	END CATCH
GO
