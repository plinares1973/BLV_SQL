USE [BLV]
GO
/****** Object:  StoredProcedure [Compra].[SP_Busca_Ordenes_Compra]    Script Date: 6/7/2023 8:42:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*
DECLARE @f1 date
DECLARE @f2 date
DECLARE @monto float
DECLARE @costo float

set @f1=CONVERT(date,getdate()-1000,112)
set @f2=CONVERT(date,getdate()-365,112)

Execute Compra.SP_Busca_Ordenes_Compra 1 ,null,null,null,null,null,null,@monto,@costo
print @monto
print @costo


select * from compra.orden_compra
select * from compra.orden_compra_producto
*/



CREATE PROCEDURE [Compra].[SP_Busca_Ordenes_Compra]
	@id_orden_compra int NULL
	,@id_proveedor int null
	,@id_producto int null
	,@estado int NULL --Todos los estados
	,@vigente bit NULL --1 Solo vigente --> NULL --> Todos los estados -->0 Solo no vigentes
	,@fecha_inicio date  null
	,@fecha_fin date null
	,@monto_total float out
	,@flete_total float out

AS

	DECLARE @ordenes_compra TABLE(
		id_orden_compra int
		,fecha_compra date
		,nombre_producto varchar(30)
		,razon_social varchar(70)
		,id_estado int
		,fecha_cambio_estado date
		,id_vigente int
		,tipo_costo int
		,id_moneda int
		,id_tipo_envio int

	);


	
	BEGIN TRY

		SET @monto_total=(
						SELECT 
							SUM(monto)

						FROM
							compra.Orden_Compra_Producto
						WHERE
							id_orden_compra=@id_orden_compra);


		SET @flete_total=(
						SELECT 
							SUM(monto_flete)

						FROM
							relacion.Orden_Compra_Costo_Flete
						WHERE
							id_orden_compra=@id_orden_compra);


	IF( @id_orden_compra is not null)
		BEGIN
			INSERT INTO  @ordenes_compra(
					 id_orden_compra
					,fecha_compra 	
					,nombre_producto
					,razon_social 	
					,id_estado
					,fecha_cambio_estado
					,id_vigente
					,tipo_costo
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
				,OCCF.id_flete
				,MO.id_moneda
				,OCE.id_envio



			FROM 
				Compra.Orden_Compra OC
				INNER JOIN Compra.Orden_Compra_Producto OCP ON OC.id_orden_compra=OCP.id_orden_compra
				INNER JOIN Produccion.Producto P ON OCP.id_producto=P.id_producto
				INNER JOIN Relacion.Proveedor_OrdenCompra POC ON OC.id_orden_compra=POC.id_orden_compra
				INNER JOIN Compra.Proveedor PR ON POC.id_proveedor=PR.id_proveedor
				INNER JOIN Relacion.Compra_Estado RCE ON OC.id_orden_compra=RCE.id_compra
				INNER JOIN Relacion.Orden_Compra_Costo_Flete OCCF ON OCCF.id_orden_compra=OC.id_orden_compra
				INNER JOIN Relacion.Moneda_Orden_Compra MO ON MO.id_orden_compra=OC.id_orden_compra
				INNER JOIN Relacion.Orden_Compra_Envio OCE ON OCE.id_orden_compra=OC.id_orden_compra
			WHERE
				OC.id_orden_compra=@id_orden_compra;
		

		END
	ELSE IF ( @id_proveedor is not null)
		BEGIN
			INSERT INTO  @ordenes_compra(
					 id_orden_compra
					,fecha_compra 	
					,nombre_producto
					,razon_social 	
					,id_estado
					,fecha_cambio_estado
					,id_vigente
					,tipo_costo
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
				,OCCF.id_flete
				,MO.id_moneda
				,OCE.id_envio



			FROM 
				Compra.Orden_Compra OC
				INNER JOIN Compra.Orden_Compra_Producto OCP ON OC.id_orden_compra=OCP.id_orden_compra
				INNER JOIN Produccion.Producto P ON OCP.id_producto=P.id_producto
				INNER JOIN Relacion.Proveedor_OrdenCompra POC ON OC.id_orden_compra=POC.id_orden_compra
				INNER JOIN Compra.Proveedor PR ON POC.id_proveedor=PR.id_proveedor
				INNER JOIN Relacion.Compra_Estado RCE ON OC.id_orden_compra=RCE.id_compra
				INNER JOIN Relacion.Orden_Compra_Costo_Flete OCCF ON OCCF.id_orden_compra=OC.id_orden_compra
				INNER JOIN Relacion.Moneda_Orden_Compra MO ON MO.id_orden_compra=OC.id_orden_compra
				INNER JOIN Relacion.Orden_Compra_Envio OCE ON OCE.id_orden_compra=OC.id_orden_compra

			WHERE
				POC.id_proveedor=@id_proveedor;

		END

	ELSE IF ( @id_producto is not null)
		BEGIN

			INSERT INTO  @ordenes_compra(
					 id_orden_compra
					,fecha_compra 	
					,nombre_producto
					,razon_social 	
					,id_estado
					,fecha_cambio_estado
					,id_vigente
					,tipo_costo
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
				,OCCF.id_flete
				,MO.id_moneda
				,OCE.id_envio



			FROM 
				Compra.Orden_Compra OC
				INNER JOIN Compra.Orden_Compra_Producto OCP ON OC.id_orden_compra=OCP.id_orden_compra
				INNER JOIN Produccion.Producto P ON OCP.id_producto=P.id_producto
				INNER JOIN Relacion.Proveedor_OrdenCompra POC ON OC.id_orden_compra=POC.id_orden_compra
				INNER JOIN Compra.Proveedor PR ON POC.id_proveedor=PR.id_proveedor
				INNER JOIN Relacion.Compra_Estado RCE ON OC.id_orden_compra=RCE.id_compra
				INNER JOIN Relacion.Orden_Compra_Costo_Flete OCCF ON OCCF.id_orden_compra=OC.id_orden_compra
				INNER JOIN Relacion.Moneda_Orden_Compra MO ON MO.id_orden_compra=OC.id_orden_compra
				INNER JOIN Relacion.Orden_Compra_Envio OCE ON OCE.id_orden_compra=OC.id_orden_compra

			WHERE
				P.id_producto=@id_producto;


		END

		ELSE
		BEGIN
			INSERT INTO  @ordenes_compra(
					 id_orden_compra
					,fecha_compra 	
					,nombre_producto
					,razon_social 	
					,id_estado
					,fecha_cambio_estado
					,id_vigente
					,tipo_costo
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
				,OCCF.id_flete
				,MO.id_moneda
				,OCE.id_envio



			FROM 
				Compra.Orden_Compra OC
				INNER JOIN Compra.Orden_Compra_Producto OCP ON OC.id_orden_compra=OCP.id_orden_compra
				INNER JOIN Produccion.Producto P ON OCP.id_producto=P.id_producto
				INNER JOIN Relacion.Proveedor_OrdenCompra POC ON OC.id_orden_compra=POC.id_orden_compra
				INNER JOIN Compra.Proveedor PR ON POC.id_proveedor=PR.id_proveedor
				INNER JOIN Relacion.Compra_Estado RCE ON OC.id_orden_compra=RCE.id_compra
				INNER JOIN Relacion.Orden_Compra_Costo_Flete OCCF ON OCCF.id_orden_compra=OC.id_orden_compra
				INNER JOIN Relacion.Moneda_Orden_Compra MO ON MO.id_orden_compra=OC.id_orden_compra
				INNER JOIN Relacion.Orden_Compra_Envio OCE ON OCE.id_orden_compra=OC.id_orden_compra

		

		END



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
			,F.descripcion AS [Costo]
			,SE.descripcion AS [Medio Logistico]
			
			

		FROM  
			@ordenes_compra toc
			INNER JOIN Sistema.Estado E ON E.id_estado=toc.id_estado
			INNER JOIN sistema.Moneda M ON M.id_moneda=toc.id_moneda
			INNER JOIN Compra.Flete F ON F.id_flete=toc.tipo_costo
			INNER JOIN Sistema.Envio SE ON SE.id_envio=toc.id_tipo_envio

	END TRY
	
	BEGIN CATCH
		print @@ERROR;
		print ERROR_MESSAGE();
	END CATCH
	

	/*
	DECLARE @ordenes_compra TABLE(
		id_orden_compra int
		,fecha_compra varchar(10)
		,moneda varchar(3)
		,monto_total float
		,cantidad int
		,empaque varchar(40)
		,tipo_costo varchar(10)
		,monto_flete float
		,codigo_lote  varchar(10)
		,nombre_producto varchar(30)
		,razon_social varchar(70)
		,id_vigente bit
		,id_estado int

	);

	DECLARE @ordenes_compra_final TABLE(
		id_orden_compra int
		,fecha_compra varchar(10)
		,moneda varchar(3)
		,monto_total float
		,cantidad int
		,empaque varchar(40)
		,tipo_costo varchar(10)
		,monto_flete float
		,codigo_lote  varchar(10)
		,nombre_producto varchar(30)
		,razon_social varchar(70)
		,id_estado int
		,estado varchar(20)

	);
	

	IF(not @id_orden_compra is null)
			BEGIN
				INSERT INTO  @ordenes_compra(
					 id_orden_compra
					,fecha_compra 	
					,moneda 		
					,monto_total 	
					,cantidad 		
					,empaque 		
					,tipo_costo 	
					,monto_flete 	
					,codigo_lote  	
					,nombre_producto
					,razon_social 	
					,id_vigente
					,id_estado
				)
				
				SELECT
					oc.id_orden_compra
					,convert(varchar,oc.fecha,111) as [fecha compra]
					,m.nomenclatura as moneda
					,oc.monto_total 
					,oc.cantidad
					,e.descripcion as empaque
					,f.descripcion as [tipo costo]
					,occf.monto_flete
					,l.codigo_lote
					,p.nombre_producto
					,pr.razon_social
					,ce.vigente
					,ce.id_estado
				FROM 
					Compra.Orden_Compra oc
					INNER JOIN Relacion.Orden_Compra_Lote ocl ON ocl.id_orden_compra=oc.id_orden_compra
					INNER JOIN Compra.lote l ON l.id_batch=ocl.id_lote
					INNER JOIN Relacion.Lote_Producto lp ON lp.id_batch=l.id_batch
					INNER JOIN Produccion.Producto p ON p.id_producto=lp.id_producto
					INNER JOIN Relacion.Proveedor_OrdenCompra po ON po.id_orden_compra=oc.id_orden_compra
					INNER JOIN Compra.Proveedor pr ON pr.id_proveedor =po.id_proveedor
					INNER JOIN relacion.Lote_Empaque le ON le.id_batch=l.id_batch
					INNER JOIN Produccion.Empaque e ON e.id_empaque=le.id_empaque
					INNER JOIN relacion.Moneda_Orden_Compra moc ON moc.id_orden_compra=oc.id_orden_compra
					INNER JOIN Sistema.Moneda m ON m.id_moneda=moc.id_moneda
					INNER JOIN Relacion.Orden_Compra_Costo_Flete occf ON occf.id_orden_compra=oc.id_orden_compra
					INNER JOIN Compra.Flete f ON f.id_flete=occf.id_flete
					INNER JOIN Relacion.Compra_Estado ce ON ce.id_compra=oc.id_orden_compra
				
	
				WHERE oc.id_orden_compra =@id_orden_compra
					AND (convert(varchar,oc.fecha,111) BETWEEN convert(varchar,@fecha_inicio,111) AND convert(varchar,@fecha_fin,111));;
			END
	
			

	ELSE
		
		BEGIN
	
				INSERT INTO  @ordenes_compra(
					 id_orden_compra
					,fecha_compra 	
					,moneda 		
					,monto_total 	
					,cantidad 		
					,empaque 		
					,tipo_costo 	
					,monto_flete 	
					,codigo_lote  	
					,nombre_producto
					,razon_social 	
					,id_vigente
					,id_estado
				)
				
				SELECT
					oc.id_orden_compra
					,convert(varchar,oc.fecha,111) as [fecha compra]
					,m.nomenclatura as moneda
					,oc.monto_total 
					,oc.cantidad
					,e.descripcion as empaque
					,f.descripcion as [tipo costo]
					,occf.monto_flete
					,l.codigo_lote
					,p.nombre_producto
					,pr.razon_social
					,ce.vigente
					,ce.id_estado
				FROM 
					Compra.Orden_Compra oc
					INNER JOIN Relacion.Orden_Compra_Lote ocl ON ocl.id_orden_compra=oc.id_orden_compra
					INNER JOIN Compra.lote l ON l.id_batch=ocl.id_lote
					INNER JOIN Relacion.Lote_Producto lp ON lp.id_batch=l.id_batch
					INNER JOIN Produccion.Producto p ON p.id_producto=lp.id_producto
					INNER JOIN Relacion.Proveedor_OrdenCompra po ON po.id_orden_compra=oc.id_orden_compra
					INNER JOIN Compra.Proveedor pr ON pr.id_proveedor =po.id_proveedor
					INNER JOIN relacion.Lote_Empaque le ON le.id_batch=l.id_batch
					INNER JOIN Produccion.Empaque e ON e.id_empaque=le.id_empaque
					INNER JOIN relacion.Moneda_Orden_Compra moc ON moc.id_orden_compra=oc.id_orden_compra
					INNER JOIN Sistema.Moneda m ON m.id_moneda=moc.id_moneda
					INNER JOIN Relacion.Orden_Compra_Costo_Flete occf ON occf.id_orden_compra=oc.id_orden_compra
					INNER JOIN Compra.Flete f ON f.id_flete=occf.id_flete
					INNER JOIN Relacion.Compra_Estado ce ON ce.id_compra=oc.id_orden_compra
	
				WHERE	
					pr.razon_social LIKE('%' + @razon_social + '%')
					AND p.nombre_producto LIKE('%' + @nombre_producto + '%')
					AND l.codigo_lote LIKE('%' + @codigo_lote + '%')
					AND (convert(varchar,oc.fecha,111) BETWEEN convert(varchar,@fecha_inicio,111) AND convert(varchar,@fecha_fin,111));
			END
	

			IF(not @vigente is null)
				BEGIN
					
					INSERT INTO @ordenes_compra_final(

						 id_orden_compra 	
						,fecha_compra 		
						,moneda 			
						,monto_total 		
						,cantidad 			
						,empaque 			
						,tipo_costo 		
						,monto_flete 		
						,codigo_lote  		
						,nombre_producto	
						,razon_social 	
						,id_estado
						,estado

					)				
					SELECT
						 toc.id_orden_compra
						,toc.fecha_compra 	
						,toc.moneda 		
						,toc.monto_total 	
						,toc.cantidad 		
						,toc.empaque 		
						,toc.tipo_costo 	
						,toc.monto_flete 	
						,toc.codigo_lote  	
						,toc.nombre_producto
						,toc.razon_social 	
						,est.id_estado
						,UPPER(est.descripcion) as Estado_Actual
					FROM
						@ordenes_compra toc
						INNER JOIN Sistema.Estado est ON est.id_estado=toc.id_estado

					WHERE
						id_vigente=@vigente 

				END
			ELSE
				BEGIN
					INSERT INTO @ordenes_compra_final(

						 id_orden_compra 	
						,fecha_compra 		
						,moneda 			
						,monto_total 		
						,cantidad 			
						,empaque 			
						,tipo_costo 		
						,monto_flete 		
						,codigo_lote  		
						,nombre_producto	
						,razon_social 	
						,id_estado
						,estado

					)	
					SELECT
						 toc.id_orden_compra
						,toc.fecha_compra 	
						,toc.moneda 		
						,toc.monto_total 	
						,toc.cantidad 		
						,toc.empaque 		
						,toc.tipo_costo 	
						,toc.monto_flete 	
						,toc.codigo_lote  	
						,toc.nombre_producto
						,toc.razon_social 	
						,est.id_estado
						,UPPER(est.descripcion) as Estado_Actual
					FROM
						@ordenes_compra toc
						INNER JOIN Sistema.Estado est ON est.id_estado=toc.id_estado



				END
	
	
				IF(@estado is null)
					BEGIN
						SELECT
							id_orden_compra
							,fecha_compra 	
							,moneda 		
							,monto_total 	
							,cantidad 		
							,empaque 		
							,tipo_costo 	
							,monto_flete 	
							,codigo_lote  	
							,nombre_producto
							,razon_social 	
							,estado
						FROM
							@ordenes_compra_final;


					END
				ELSE
					BEGIN
						SELECT
							id_orden_compra
							,fecha_compra 	
							,moneda 		
							,monto_total 	
							,cantidad 		
							,empaque 		
							,tipo_costo 	
							,monto_flete 	
							,codigo_lote  	
							,nombre_producto
							,razon_social 	
							,estado
						FROM
							@ordenes_compra_final
						WHERE
							id_estado=@estado;

				END
	
	END TRY






	BEGIN CATCH
		print @@ERROR;
		print ERROR_MESSAGE();

	END CATCH
	*/
GO
