USE [BLV]
GO
/****** Object:  StoredProcedure [Produccion].[Consulta_Producto_Stock_Fabricacion_Restante]    Script Date: 17/5/2023 9:15:23 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  PROCEDURE [Produccion].[Consulta_Producto_Stock_Fabricacion_Restante]
	@codigo_producto varchar(10)
	,@id_hoja_fabricacion int
	,@requerido int
	,@restante int out
AS
	BEGIN TRY
		DECLARE @comprometido INT;
		

		SET @comprometido=(

			SELECT
				sum(PHF.cantidad)
			
			FROM
				
				Proceso.Hoja_Fabricacion PHF
				INNER JOIN produccion.Producto p ON p.id_producto=phf.id_producto

			WHERE
				id_hoja_fabrica=@id_hoja_fabricacion
				and p.codigo_producto=@codigo_producto


			GROUP BY
				p.codigo_producto
				);

		SET @restante=@requerido-@comprometido;
				
	END TRY
	BEGIN CATCH
		print @@ERROR;


	END CATCH
GO
