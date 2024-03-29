USE [BLV]
GO
/****** Object:  StoredProcedure [Produccion].[SP_Busca_Producto]    Script Date: 6/7/2023 8:42:56 p. m. ******/
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


CREATE  PROCEDURE [Produccion].[SP_Busca_Producto]
	@codigo_producto varchar(10) NULL
	,@descripcion_producto varchar(30) NULL
	,@marca_producto varchar(40) NULL
	,@fecha_inicio_elaboracion date NULL
	,@fecha_fin_elaboracion date NULL
	,@fecha_inicio_vencimiento date NULL
	,@fecha_fin_vencimiento date NULL

 AS

	DECLARE @primer_fecha_vencimiento date
	DECLARE @primer_fecha_elaboracion date


	BEGIN TRY

			SET @primer_fecha_vencimiento=CONVERT(date,(SELECT MIN(fecha_vencimiento) FROM Produccion.Producto),112);
			SET @primer_fecha_elaboracion=CONVERT(date,(SELECT MIN(fecha_elaboracion) FROM Produccion.Producto),112);

		
			SELECT 
				
				p.codigo_producto AS 'CODIGO DEL PRODUCTO'
				,p.nombre_producto AS 'NOMBRE DEL PRODUCTO'
				,p.marca AS 'MARCA DEL PRODUCTO'
				,CONVERT(date,p.fecha_elaboracion,112) AS 'FECHA DE ELABORACION'
				,CONVERT(date,p.fecha_vencimiento,112) AS 'FECHA DE VENCIMIENTO'
			FROM
				Produccion.Producto p
		
			WHERE p.nombre_producto LIKE('%' + IIF(@descripcion_producto is null,'', @descripcion_producto)+ '%')
				AND	p.codigo_producto LIKE('%'+	IIF(@codigo_producto is null,'', @codigo_producto) +'%')
				AND p.marca LIKE('%'+IIF(@marca_producto is null,'', @marca_producto) +'%')
				AND (CONVERT(date,p.fecha_vencimiento,112) BETWEEN CONVERT(date,IIF(@fecha_inicio_vencimiento is null,@primer_fecha_vencimiento,@fecha_inicio_vencimiento),112) 
														   AND	CONVERT(date,IIF(@fecha_fin_vencimiento is null,getdate(),@fecha_fin_vencimiento),112))
				AND (CONVERT(date,p.fecha_vencimiento,112) BETWEEN CONVERT(date,IIF(@fecha_inicio_elaboracion is null,@primer_fecha_elaboracion,@fecha_inicio_elaboracion),112) 
														   AND	CONVERT(date,IIF(@fecha_fin_elaboracion is null,getdate(),@fecha_fin_elaboracion),112))
			ORDER BY
				p.fecha_vencimiento;

		

				
			

	
	END TRY
	BEGIN CATCH
		print @@ERROR;


	END CATCH


	
GO
