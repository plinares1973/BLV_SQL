USE [BLV]
GO
/****** Object:  StoredProcedure [Sistema].[SP_Busca_Pais]    Script Date: 6/7/2023 8:42:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  PROCEDURE [Sistema].[SP_Busca_Pais]
AS

	DECLARE @Lista_Paises TABLE (nombre VARCHAR(60),cantidad INT);
	BEGIN TRY

			INSERT INTO 
				@Lista_Paises(
					nombre
					,cantidad)
			SELECT 
				p.nombre
				,count(pm.marca)
			FROM
				Sistema.Pais p
				LEFT JOIN Produccion.Producto_Marca pm ON pm.id_pais=p.id_pais
		
			GROUP BY p.nombre;
	

		

			SELECT
				nombre
			FROM 
				@Lista_Paises
			
			ORDER BY cantidad DESC;
	
	END TRY
	BEGIN CATCH
		print @@ERROR;


	END CATCH


	
--execute Sistema.[SP_Busca_Pais]
GO
