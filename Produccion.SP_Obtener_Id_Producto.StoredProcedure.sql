USE [BLV]
GO
/****** Object:  StoredProcedure [Produccion].[SP_Obtener_Id_Producto]    Script Date: 6/7/2023 8:42:56 p. m. ******/
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


CREATE  PROCEDURE [Produccion].[SP_Obtener_Id_Producto]
	@codigo_producto varchar(10) NULL
	,@marca_producto varchar(40) NULL
	,@id_producto int OUT


 AS



	BEGIN TRY
		SET @id_producto=(SELECT 
							codigo_producto
						  FROM
							Produccion.Producto_header
						  WHERE
							codigo_producto=@codigo_producto
							--AND marca=@marca_producto
						  );

		

				
			

	
	END TRY
	BEGIN CATCH
		SET @id_producto=0;


	END CATCH


	
GO
