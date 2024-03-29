USE [BLV]
GO
/****** Object:  StoredProcedure [Sistema].[SP_Busca_ID_Proveedor]    Script Date: 6/7/2023 8:42:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE  [Sistema].[SP_Busca_ID_Proveedor]
	@razon_social varchar(70)
	,@domicilio varchar(40)
	,@telefono varchar(20)
	,@fax varchar(20)
	,@mail varchar(40)
	,@id_proveedor int OUT
AS
	BEGIN TRY
		SET @id_proveedor=(	
			SELECT
				id_proveedor
			FROM 
				Compra.Proveedor
			WHERE
				razon_social=razon_social
				AND domicilio=@domicilio
				AND telefono=@telefono
				AND fax=@fax
				AND mail=@mail);


	END TRY
	BEGIN CATCH
		SET @id_proveedor=0;		

	END CATCH
GO
