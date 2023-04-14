USE [BLV]
GO
/****** Object:  StoredProcedure [Proceso].[SP_Impactar_Tablon_Stock_001]    Script Date: 14/4/2023 12:48:04 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Proceso].[SP_Impactar_Tablon_Stock_001]
	@id_compra int
	,@id_batch nvarchar(20)
	,@id_lote int
	,@codigo_producto varchar(30)
	,@marca varchar(50)
	,@libre_circulacion nvarchar(255)
	,@fecha_libre_circulacion smalldatetime
	,@id_batch_existe bit out
AS



BEGIN TRAN
	BEGIN TRY
		
		INSERT INTO Proceso.Tablon_Impacto_Stock(id_compra
												,id_batch
												,id_lote
												,codigo_producto
												,marca
												,certificado_libre_circulacion
												,fecha_certificado_libre_circulacion)
										VALUES(
												@id_compra
												,@id_batch
												,@id_lote
												,@codigo_producto
												,@marca
												,@libre_circulacion
												,CONVERT(date,@fecha_libre_circulacion,112));
		
		
		
		
		

		set @id_batch_existe=0;

		COMMIT;
	END TRY
	BEGIN CATCH
		
		set @id_batch_existe=1;
		ROLLBACK;
	END CATCH
GO
