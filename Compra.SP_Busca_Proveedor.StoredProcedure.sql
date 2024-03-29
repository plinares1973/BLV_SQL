USE [BLV]
GO
/****** Object:  StoredProcedure [Compra].[SP_Busca_Proveedor]    Script Date: 6/7/2023 8:42:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--incluir marca producto en el like


CREATE  PROCEDURE [Compra].[SP_Busca_Proveedor]
	@razon_social varchar(30) NULL
	,@ciudad varchar(20) NULL
	,@estado varchar(20) NULL
	,@pais varchar(60) NULL
 AS

	

	BEGIN TRY


		
			SELECT 
				p.id_proveedor AS 'ID PROVEEDOR'
				,p.razon_social AS 'RAZON SOCIAL'
				,p.domicilio AS 'DOMICILIO'
				--,p.prefijo_telefonico+i.telefono AS 'TELEFONO'
				,p.mail AS 'CORREO ELECTRONICO'
				,c.nombre AS 'CIUDAD'
				,dp.nombre AS 'ESTADO-PROVINCIA'
				,pa.nombre AS 'PAIS'
				,cc.nombre AS 'CONTINENTE'

				
			FROM
				Compra.Proveedor p
				INNER JOIN Relacion.Proveedor_Ciudad ric ON ric.id_proveedor=p.id_proveedor
				INNER JOIN Sistema.Ciudad c ON c.id_ciudad=ric.id_ciudad
				INNER JOIN Relacion.DP_Ciudad rdpc ON rdpc.id_ciudad=c.id_ciudad
				INNER JOIN Sistema.Division_Politica dp ON dp.id_division_politica=rdpc.id_division_politica
				INNER JOIN Relacion.Pais_DP rpdp ON rpdp.id_division_politica=dp.id_division_politica
				INNER JOIN Sistema.Pais pa ON pa.id_pais=rpdp.id_pais
				INNER JOIN Relacion.Pais_Continente rpc ON rpc.id_pais=pa.id_pais
				INNER JOIN Sistema.Continente cc ON cc.id_continente=rpc.id_continente
		
			WHERE p.razon_social LIKE('%' + @razon_social + '%')
				AND c.nombre LIKE('%' + @ciudad + '%')
				AND dp.nombre LIKE('%' + @estado + '%')
				AND pa.nombre LIKE('%' + @pais + '%')

			ORDER BY
				p.id_proveedor
	END TRY
	BEGIN CATCH
		print @@ERROR;


	END CATCH
--execute Importacion.SP_busca_Importador '','','',''
--select * from produccion.producto

GO
