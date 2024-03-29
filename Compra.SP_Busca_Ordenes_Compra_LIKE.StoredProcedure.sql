USE [BLV]
GO
/****** Object:  StoredProcedure [Compra].[SP_Busca_Ordenes_Compra_LIKE]    Script Date: 6/7/2023 8:42:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*

DECLARE @f1 date
DECLARE @f2 date


set @f1=CONVERT(date,getdate()-1,112)
set @f2=CONVERT(date,getdate(),112)
Execute Compra.SP_Busca_Ordenes_Compra_LIKE null,null,0,null, @f1, @f2

*/



CREATE PROCEDURE [Compra].[SP_Busca_Ordenes_Compra_LIKE]

	@razon_social varchar(70) NULL
	,@nombre_producto varchar(30) NULL
	,@estado int NULL --Todos los estados
	,@vigente bit NULL --1 Solo vigente --> NULL --> Todos los estados -->0 Solo no vigentes
	,@fecha_inicio date  NULL
	,@fecha_fin date  NULL
AS
	
	BEGIN TRY
	
	DECLARE @ordenes_compra TABLE(
		id_orden_compra int
		,fecha_compra date
		,nombre_producto varchar(30)
		,razon_social varchar(70)
		,id_estado int
		,fecha_cambio_estado date
		,id_vigente int
		,tipo_costo int
		,monto_costo float
		,id_moneda int
		,id_tipo_envio int

	);


			INSERT INTO  @ordenes_compra(
					 id_orden_compra
					,fecha_compra 	
					,nombre_producto
					,razon_social 	
					,id_estado
					,fecha_cambio_estado
					,id_vigente
					,tipo_costo
					,monto_costo
					,id_moneda
					,id_tipo_envio
			)
			SELECT DISTINCT
				OC.id_orden_compra
				,OC.fecha
				,P.nombre_producto
				,PR.razon_social
				,RCE.id_estado
				,RCE.fecha
				,RCE.vigente
				,COC.id_concepto
				,isnull(COC.monto,0)
				,MO.id_moneda
				,OCE.id_envio



			FROM 
				Compra.Orden_Compra OC
				INNER JOIN Compra.Orden_Compra_Producto OCP ON OC.id_orden_compra=OCP.id_orden_compra
				INNER JOIN Produccion.Producto_header P ON OCP.codigo_producto=P.codigo_producto
				INNER JOIN Relacion.Proveedor_OrdenCompra POC ON OC.id_orden_compra=POC.id_orden_compra
				INNER JOIN Compra.Proveedor PR ON POC.id_proveedor=PR.id_proveedor
				INNER JOIN Relacion.Compra_Estado RCE ON OC.id_orden_compra=RCE.id_compra
				INNER JOIN Relacion.costo_oc COC ON COC.id_orden_compra=OC.id_orden_compra
				INNER JOIN Relacion.Moneda_Orden_Compra MO ON MO.id_orden_compra=OC.id_orden_compra
				INNER JOIN Relacion.Orden_Compra_Envio OCE ON OCE.id_orden_compra=OC.id_orden_compra



				WHERE	
					pr.razon_social LIKE('%' + IIF(@razon_social is null,'',@razon_social) + '%')
					AND p.nombre_producto  LIKE('%' + IIF(@nombre_producto is null,'',@nombre_producto) + '%')
					AND	(convert(date,oc.fecha,112) BETWEEN convert(date,@fecha_inicio,112) AND convert(date,@fecha_fin,112));

	

		IF(@vigente is not null)
			BEGIN

				DELETE FROM @ordenes_compra WHERE id_vigente!=@vigente;

			END

		IF(@estado is not null)
			BEGIN
				DELETE FROM @ordenes_compra WHERE id_estado!=@estado;

			END

		IF(@fecha_inicio is not null OR @fecha_fin is not null)
			BEGIN
				IF(@fecha_inicio is null) SET @fecha_inicio=CONVERT(date,getdate(),112)
				IF(@fecha_fin is null) SET @fecha_inicio=CONVERT(date,getdate(),112)
				
				DELETE FROM @ordenes_compra WHERE CONVERT(date,fecha_compra,112) not Between @fecha_inicio AND @fecha_fin

			END


		SELECT DISTINCT
			
			toc.id_orden_compra AS [Orden de Compra]
			,toc.fecha_compra AS [Fecha de creación]
			,toc.razon_social AS [Proveedor]
			,UPPER(E.descripcion) AS [Estado Orden Compra]
			,IIF(toc.id_vigente='0','CADUCADO','VIGENTE') AS [Status de Estado]
			,toc.fecha_cambio_estado as [Actualización de Estado]
		 	,M.descripcion AS [Moneda]
		 	,C.nombre AS [Tipo de Costo]
			,IIF(toc.monto_costo=0,'PENDIENTE',convert(varchar,toc.monto_costo)) AS [Monto de Costo]
		 	,SE.descripcion AS [Medio Logistico]
			
			

		FROM  
			@ordenes_compra toc
		 	INNER JOIN Sistema.Estado E ON E.id_estado=toc.id_estado
		 	INNER JOIN sistema.Moneda M ON M.id_moneda=toc.id_moneda
		 	INNER JOIN Costo.Concepto_Header C ON C.id_concepto_header=toc.tipo_costo
		 	INNER JOIN Sistema.Envio SE ON SE.id_envio=toc.id_tipo_envio;


	
	END TRY






	BEGIN CATCH
		print @@ERROR;
		print ERROR_MESSAGE();

	END CATCH

GO
