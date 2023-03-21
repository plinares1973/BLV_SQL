USE [BLV]
GO
/****** Object:  StoredProcedure [Produccion].[SP_Busca_Fecha_Inicial_Vencimiento]    Script Date: 21/3/2023 9:13:35 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--incluir marca producto en el like

CREATE   PROCEDURE [Produccion].[SP_Busca_Fecha_Inicial_Vencimiento]
 AS
	BEGIN TRY

				SELECT 
					isnull(convert(varchar(12),min(fecha_vencimiento),111),getdate()) fecha
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
