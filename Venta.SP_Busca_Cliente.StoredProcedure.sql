USE [BLV]
GO
/****** Object:  StoredProcedure [Venta].[SP_Busca_Cliente]    Script Date: 6/7/2023 8:42:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--incluir marca producto en el like

CREATE  PROCEDURE [Venta].[SP_Busca_Cliente]
	@razon_social varchar(30) NULL
	,@ciudad varchar(20) NULL
	,@estado varchar(20) NULL
	,@pais varchar(60) NULL
 AS

	

	BEGIN TRY


		
			SELECT 
				v.razon_social AS 'RAZON SOCIAL'
				,v.domicilio AS 'DOMICILIO'
				,p.prefijo_telefonico+v.telefono AS 'TELEFONO'
				,v.mail AS 'CORREO ELECTRONICO'
				,c.nombre AS 'CIUDAD'
				,dp.nombre AS 'ESTADO-PROVINCIA'
				,p.nombre AS 'PAIS'
				
			FROM
				Venta.cliente v
				INNER JOIN Relacion.Cliente_Ciudad rcc ON rcc.id_cliente=v.id_cliente
				INNER JOIN Sistema.Ciudad c ON c.id_ciudad=rcc.id_ciudad
				INNER JOIN Relacion.DP_Ciudad rdpc ON rdpc.id_ciudad=c.id_ciudad
				INNER JOIN Sistema.Division_Politica dp ON dp.id_division_politica=rdpc.id_division_politica
				INNER JOIN Relacion.Pais_DP rpdp ON rpdp.id_division_politica=dp.id_division_politica
				INNER JOIN Sistema.Pais p ON p.id_pais=rpdp.id_pais
				INNER JOIN Relacion.Pais_Continente rpc ON rpc.id_pais=p.id_pais
				INNER JOIN Sistema.Continente cc ON cc.id_continente=rpc.id_continente
		
			WHERE v.razon_social LIKE('%' + @razon_social + '%')
				AND c.nombre LIKE('%' + @ciudad + '%')
				AND dp.nombre LIKE('%' + @estado + '%')
				AND p.nombre LIKE('%' + @pais + '%')

	
	END TRY
	BEGIN CATCH
		print @@ERROR;


	END CATCH
--execute Produccion.SP_busca_cliente 'r','m','',''
--select * from produccion.producto
GO
