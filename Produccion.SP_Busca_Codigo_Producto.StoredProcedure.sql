USE [BLV]
GO
/****** Object:  StoredProcedure [Produccion].[SP_Busca_Codigo_Producto]    Script Date: 17/5/2023 1:14:14 a. m. ******/
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


CREATE  PROCEDURE [Produccion].[SP_Busca_Codigo_Producto]
AS

	BEGIN TRY

		
			SELECT 
				
				ph.codigo_producto AS 'CODIGO DEL PRODUCTO'
		
			FROM
				Produccion.Producto_Header ph
		
		
		

		

				
			

	
	END TRY
	BEGIN CATCH
		print @@ERROR;


	END CATCH


	
GO
