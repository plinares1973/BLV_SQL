USE [BLV]
GO
/****** Object:  StoredProcedure [Compra].[SP_Orden_Compra_Producto]    Script Date: 6/7/2023 8:42:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--EXECUTE Compra.SP_Orden_Compra_Detalle 1
--select * from produccion.producto

CREATE PROCEDURE [Compra].[SP_Orden_Compra_Producto]
	@id_orden_compra int 
	,@codigo_producto varchar(30)

AS
	BEGIN TRY
	
		
	    
		

		SELECT 
			--oc.id_orden_compra,
			p.codigo_producto as 'CODIGO DE PRODUCTO'
			,p.nombre_producto as 'NOMBRE DE PRODUCTO'
			,ocp.marca as 'MARCA'
			,(select nombre FROM sistema.pais WHERE id_pais=(Select DISTINCT id_pais from Produccion.Producto_Marca Where marca=ocp.marca)) as 'ORIGEN'
			,OCP.cantidad as 'CANTIDAD'
			,M.descripcion as 'MEDIDA'
			,OCP.monto as 'MONTO UNITARIO'
			,(OCP.monto * OCP.cantidad) as 'SUB TOTAL'
			,E.descripcion as 'EMPAQUE'
			,OPE.capacidad_envase  as 'VOLUMEN DE EMPAQUE'
			
		FROM 
			Compra.Orden_Compra OC
			INNER JOIN Compra.Orden_Compra_Producto OCP ON OCP.id_orden_compra=OC.id_orden_compra
			INNER JOIN Produccion.Producto_header P ON P.codigo_producto=OCP.codigo_producto
			INNER JOIN Relacion.OC_Producto_Medida OPM ON OPM.id_ocompra_producto=OCP.id_ocompra_producto
			INNER JOIN Produccion.Medida M ON M.id_medida=OPM.id_medida
			INNER JOIN Relacion.OC_Producto_Empaque OPE ON OPE.id_ocompra_producto=OCP.id_ocompra_producto
			INNER JOIN Produccion.Empaque E ON E.id_empaque=OPE.id_empaque
		


		WHERE	
			oc.id_orden_compra=@id_orden_compra
			and p.codigo_producto=@codigo_producto;
	END TRY

	BEGIN CATCH

		print @@ERROR;
		print ERROR_MESSAGE();
	END CATCH
GO
