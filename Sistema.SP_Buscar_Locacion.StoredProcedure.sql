USE [BLV]
GO
/****** Object:  StoredProcedure [Sistema].[SP_Buscar_Locacion]    Script Date: 6/7/2023 8:42:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--incluir marca producto en el like

CREATE PROCEDURE  [Sistema].[SP_Buscar_Locacion]
	@continente varchar(40)
	,@pais varchar(60)
	,@estado varchar(20)
	,@ciudad varchar(20)
AS
	BEGIN TRY
			
		SELECT
			CONTINENTE
			,PAIS
			,ESTADO
			,CIUDAD

		FROM 
			Sistema.vw_ciudades
		WHERE
			CONTINENTE like('%'+@continente+'%')
			AND PAIS like('%'+@pais+'%')
			AND ESTADO like('%'+@estado+'%')
			AND CIUDAD like('%'+@ciudad+'%')


	END TRY
	BEGIN CATCH
		print @@ERROR;
		

	END CATCH






--execute Sistema.SP_buscar_locacion 'sud','b','',''
--select * from produccion.producto

GO
