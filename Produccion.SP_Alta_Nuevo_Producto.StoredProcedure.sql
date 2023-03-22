USE [BLV]
GO
/****** Object:  StoredProcedure [Produccion].[SP_Alta_Nuevo_Producto]    Script Date: 22/3/2023 11:18:50 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Produccion].[SP_Alta_Nuevo_Producto]
	@codigo_producto VARCHAR(10)
	,@nombre_producto VARCHAR(30)
	,@marca VARCHAR(50)
	,@pais VARCHAR(60)
	,@MSDS nVARCHAR(255)
	,@error INT OUT
AS
BEGIN TRAN

	
	DECLARE @existe_codigo_marca INT;
	DECLARE @existe_codigo INT;
	DECLARE @existe_marca INT;
	DECLARE @id_pais INT;
	
	SET @error=0;
	SET @existe_codigo_marca=0;
	SET @existe_codigo=0;
	SET @existe_marca=0;
	SET @id_pais=0;


	BEGIN TRY
		SET @existe_codigo_marca=(SELECT 
						count(pm.marca)
					FROM
						Produccion.Producto_Marca pm
						INNER JOIN Produccion.Producto_Header ph ON ph.codigo_producto=pm.codigo_producto
					WHERE 
						pm.marca=@marca 
						AND ph.codigo_producto=@codigo_producto);
		
		
		IF(@existe_codigo_marca=0)
			BEGIN
				SET @existe_codigo=(SELECT 
										count(ph.codigo_producto)
									FROM
										Produccion.Producto_Header ph 
									WHERE 
										ph.codigo_producto=@codigo_producto);


				IF(@existe_codigo=0)
					BEGIN
						INSERT INTO Produccion.Producto_Header(
							codigo_producto
							,nombre_producto)
						VALUES(
							@codigo_producto
							,@nombre_producto
						);
					END


				SET @id_pais=(SELECT
									id_pais
								FROM
									Sistema.Pais
								WHERE
									nombre=@pais);
		


				INSERT INTO  Produccion.Producto_Marca(
					codigo_producto
					,marca
					,id_pais
					,MSDS
				)
				VALUES(
					@codigo_producto
					,@marca
					,@id_pais
					,@MSDS
				);
			END

		



		COMMIT;
	END TRY

	BEGIN CATCH
		SET @error=@@error;
		ROLLBACK;
	END CATCH
GO
