USE [BLV]
GO
/****** Object:  StoredProcedure [Produccion].[SP_Busca_Fecha_Inicial_Elaboracion]    Script Date: 6/7/2023 8:42:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--incluir marca producto en el like

CREATE   PROCEDURE [Produccion].[SP_Busca_Fecha_Inicial_Elaboracion]
 AS
	BEGIN TRY

				SELECT 
					isnull(convert(varchar(12),min(fecha_elaboracion),111),getdate()) fecha
				FROM
					produccion.Producto

	END TRY
	BEGIN CATCH
		print @@ERROR;


	END CATCH
/*
execute compra.SP_Busca_Fecha_Inicial_Compra 


*/
GO
