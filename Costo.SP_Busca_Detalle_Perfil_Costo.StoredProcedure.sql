USE [BLV]
GO
/****** Object:  StoredProcedure [Costo].[SP_Busca_Detalle_Perfil_Costo]    Script Date: 6/7/2023 8:42:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [Costo].[SP_Busca_Detalle_Perfil_Costo]
	@id_perfil_costo int
	,@id_orden_compra int
	
AS

BEGIN TRY
	


	DECLARE @costos_a_calcular TABLE(
									orden int
									,id_concepto_header int
									,nombre varchar(20)
									,tipo_valor varchar(40)
									,valor float) 


	INSERT INTO @costos_a_calcular(
									id_concepto_header
									,nombre
									,tipo_valor
									,valor)

	SELECT 
		CH.id_concepto_header
		,CH.nombre
		,(SELECT descripcion FROM Costo.Tipo_Valor WHERE id_tipo_concepto=CH.id_tipo_valor) as Valor
		,tc.valor
	FROM
		costo.perfil_costo PC
		INNER JOIN relacion.Perfil_Concepto RPC ON RPC.id_perfil_costo=PC.id_perfil_costo
		INNER JOIN Costo.Concepto_Header CH ON CH.id_concepto_header=rpc.id_concepto_header
		LEFT JOIN Costo.Tasa_Concepto TC ON  TC.id_concepto_header=CH.id_concepto_header
	WHERE
		PC.vigente=1
		AND PC.id_perfil_costo=@id_perfil_costo
		AND CH.id_concepto_header!=22;



	INSERT INTO @costos_a_calcular(
								id_concepto_header
								,nombre
								,tipo_valor
								,valor)
	SELECT 
		22
		, dip.codigo_producto
		,'DIMP - Porcentual'
		,dip.tasa
	FROM
		compra.Orden_Compra_Producto ocp
		INNER JOIN relacion.Derecho_importacion_Producto DIP ON DIP.codigo_producto=ocp.codigo_producto
	WHERE
		ocp.id_orden_compra=@id_orden_compra
	

	




	
	-- Actualizar la columna "orden" en la variable de tabla
	BEGIN TRANSACTION
		UPDATE t
		SET t.orden = rn
		FROM @costos_a_calcular t
		INNER JOIN (
					SELECT id_perfil_costo, id_concepto_header, ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) AS rn
					FROM Relacion.Perfil_Concepto
					) p ON p.id_concepto_header = t.id_concepto_header;
		COMMIT;
	IF(@id_orden_compra!=0)
	BEGIN
		BEGIN TRANSACTION
			INSERT INTO Proceso.Costo_a_Calcular(
				id_orden_compra
				,id_concepto_header
				,orden
				,id_tipo_valor
				,valor)
			select 
				@id_orden_compra
				,id_concepto_header
				,orden
				,IIF(tipo_valor='Nominal',1,2) 
				,valor
			from @costos_a_calcular order by orden;
		COMMIT;
	END
	select 
		id_concepto_header
		,nombre
		,tipo_valor
		,valor
	from @costos_a_calcular order by orden;

END TRY
BEGIN CATCH
	ROLLBACK
	print @@error;
END CATCH


--execute [Costo].[SP_Busca_Detalle_Perfil_Costo] 1,1


GO
