USE [BLV]
GO
/****** Object:  StoredProcedure [Produccion].[SP_Impactar_Stock_Paso_Dos]    Script Date: 6/7/2023 8:42:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*


DECLARE @fecha1 date
DECLARE @fecha2 date

SET @fecha1=getdate()
SET @fecha2=getdate()
Execute Produccion.SP_Impactar_Stock_Paso_Tres 5,19,11,'PRC001',@fecha1,@fecha2,0


(1 row affected)

(0 rows affected)

(1 row affected)

Completion time: 2023-01-25T16:38:21.9115405-03:00
*/




CREATE PROCEDURE [Produccion].[SP_Impactar_Stock_Paso_Dos]
	@id_lote int
	,@codigo_producto varchar(10)
	,@fecha_elaboracion date
	,@fecha_vencimiento date
	,@marca varchar(40)
	,@cantidad int
	,@id_medida int
	,@id_empaque int
	,@id_capacidad int
	,@cuarentena int
AS

	DECLARE @id_producto int
BEGIN TRAN

		BEGIN TRY
			
			INSERT INTO Produccion.Producto(
				codigo_producto
				,fecha_elaboracion
				,fecha_vencimiento
				,marca
				
			)VALUES
			(
				@codigo_producto
				,@fecha_elaboracion
				,@fecha_vencimiento
				,@marca
			);

			SET @id_producto=SCOPE_IDENTITY();

			INSERT INTO Relacion.Lote_Producto(
				id_batch
				,id_producto
				,cantidad
				,id_medida
				,id_empaque
				,id_capacidad_envase
				,cuarentena

			)VALUES
			(
				@id_lote
				,@id_producto
				,@cantidad
				,@id_medida
				,@id_empaque
				,@id_capacidad
				,@cuarentena
			);
			


			
			COMMIT;

		END TRY
		BEGIN CATCH
			SET @id_lote=0;
			print @@error;
			ROLLBACK;
		END CATCH

			


GO
