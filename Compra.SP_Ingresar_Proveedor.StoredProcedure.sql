USE [BLV]
GO
/****** Object:  StoredProcedure [Compra].[SP_Ingresar_Proveedor]    Script Date: 6/7/2023 8:42:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--incluir marca producto en el like

CREATE  PROCEDURE [Compra].[SP_Ingresar_Proveedor]
	@razon_social varchar(70) 
	,@domicilio varchar(40) 
	,@telefono varchar(20) 
	,@fax varchar(20)
	,@mail varchar(40) 
	,@id_ciudad int


 AS
	--DECLARE @id_importador int

	
	BEGIN TRANSACTION
		BEGIN TRY

			INSERT INTO Compra.Proveedor(
				razon_social
				,domicilio
				,telefono
				,fax
				,mail
				)
			VALUES(
				@razon_social
				,@domicilio
				,@telefono
				,@fax
				,@mail
				)
			
			INSERT INTO Relacion.Proveedor_Ciudad(
				id_proveedor
				,id_ciudad
				)
			VALUES(
				SCOPE_IDENTITY()
				,@id_ciudad
				)




				

			COMMIT;
		END TRY
		BEGIN CATCH
			print @@ERROR;

			ROLLBACK;

		END CATCH
--execute Importacion.SP_busca_Importador '','','',''
--select * from produccion.producto

GO
