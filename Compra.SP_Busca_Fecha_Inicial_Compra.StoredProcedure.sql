USE [BLV]
GO
/****** Object:  StoredProcedure [Compra].[SP_Busca_Fecha_Inicial_Compra]    Script Date: 14/4/2023 12:48:04 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--incluir marca producto en el like

CREATE   PROCEDURE [Compra].[SP_Busca_Fecha_Inicial_Compra]
 AS
	BEGIN TRY

				SELECT 
					isnull(convert(varchar(12),min(fecha),111),getdate()) fecha
				FROM
					compra.Orden_Compra;

	END TRY
	BEGIN CATCH
		print @@ERROR;


	END CATCH
/*
execute compra.SP_Busca_Fecha_Inicial_Compra 


*/
GO
