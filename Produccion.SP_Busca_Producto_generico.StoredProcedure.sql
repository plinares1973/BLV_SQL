USE [BLV]
GO
/****** Object:  StoredProcedure [Produccion].[SP_Busca_Producto_generico]    Script Date: 6/7/2023 8:42:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
DECLARE @f1 date
DECLARE @f2 date
DECLARE @f3 date
DECLARE @f4 date

set @f1=CONVERT(date,getdate()-1000,112)
set @f2=CONVERT(date,getdate()-365,112)
set @f3=CONVERT(date,getdate()-30,112)
set @f4=CONVERT(date,getdate(),112)

Execute Produccion.SP_Busca_Producto null ,null,null,null,null,null,null
*/


CREATE  PROCEDURE [Produccion].[SP_Busca_Producto_generico]
	@codigo_producto varchar(10) NULL
	,@descripcion_producto varchar(30) NULL
	,@rnpa bit

 AS
 	BEGIN TRY

		DECLARE @productos TABLE(
			codigo_producto VARCHAR(10)
			,nombre_producto VARCHAR(30)
			,marca VARCHAR(40)
			,MSDS NVARCHAR(255) NULL
			,RNPA NVARCHAR(255) NULL)
		
		INSERT INTO @productos(
			codigo_producto
			,nombre_producto
			,marca
			,MSDS
			,RNPA)

		SELECT 
			ph.codigo_producto
			,ph.nombre_producto
			,pm.marca
			,pm.MSDS
			,pm.RNPA
		FROM
			Produccion.Producto_header ph
			LEFT JOIN Produccion.Producto_Marca pm ON pm.codigo_producto=ph.codigo_producto
		
		WHERE ph.nombre_producto LIKE('%' + IIF(@descripcion_producto is null,'', @descripcion_producto)+ '%')
			AND	ph.codigo_producto LIKE('%'+	IIF(@codigo_producto is null,'', @codigo_producto) +'%')
			AND pm.marca is not null;

		IF(@rnpa=1) DELETE FROM @productos WHERE rnpa is null ;

		SELECT
			codigo_producto AS 'CODIGO DEL PRODUCTO'
			,nombre_producto AS 'NOMBRE DEL PRODUCTO'
			,marca AS 'MARCA'
			,msds AS 'MSDS'
			,RNPA AS 'RNPA'
		FROM
			@productos;
				
			

	
	END TRY
	BEGIN CATCH
		print @@ERROR;


	END CATCH


	
GO
