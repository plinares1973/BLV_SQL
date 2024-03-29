USE [BLV]
GO
/****** Object:  StoredProcedure [Produccion].[SP_Selector_Batch]    Script Date: 6/7/2023 8:42:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE  PROCEDURE [Produccion].[SP_Selector_Batch]
	@id_producto int NULL

	
	

 AS

		BEGIN TRY
	
			SELECT 
				l.codigo_lote AS 'CODIGO BATCH'
				,l.fecha_certificado_analisis AS 'FECHA CERTIFICADO ANALISIS'
				,l.fecha_certificado_circulacion AS 'FECHA CERTIFICADO CIRCULACION'
				,i.codigo_material AS 'CODIGO DE MATERIAL'
				,i.materia_prima AS 'MATERIA PRIMA'
				,e.descripcion AS 'EMPAQUE'
				,rlm.cantidad AS 'CANTIDAD'
				,m.unidad as 'UNIDAD DE MEDIDA'

			FROM
				Produccion.Lote l
				INNER JOIN Relacion.Lote_Ingrediente li ON l.id_batch=li.id_batch
				INNER JOIN Produccion.Ingrediente i ON i.id_ingrediente=li.id_ingrediente
				INNER JOIN Relacion.Lote_Producto lp ON lp.id_batch=l.id_batch
				INNER JOIN Produccion.Producto p ON lp.id_producto=p.id_producto
				INNER JOIN Relacion.Lote_Empaque rle ON l.id_batch=rle.id_batch
				INNER JOIN Produccion.Empaque e ON rle.id_empaque=e.id_empaque
				INNER JOIN Relacion.Lote_Medida rlm ON l.id_batch=rlm.id_batch
				INNER JOIN Produccion.Medida m ON rlm.id_medida=m.id_medida
			WHERE
				p.id_producto=@id_producto
					

	END TRY
	BEGIN CATCH
		print @@ERROR;


	END CATCH
--execute Produccion.SP_Selector_batch 1
--select * from produccion.lote
GO
