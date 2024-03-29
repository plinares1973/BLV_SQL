USE [BLV]
GO
/****** Object:  StoredProcedure [Produccion].[SP_Verifica_Stock_Insumo]    Script Date: 6/7/2023 8:42:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
DECLARE @R int;
Produccion.SP_Verifica_Stock_Insumo 'BOLSA PAPEL BLANCA',25,'KILOGRAMOS',1000,@R;
print @R;
*/
CREATE PROCEDURE [Produccion].[SP_Verifica_Stock_Insumo]
	@descripcion varchar(40)
	,@capacidad int
	,@medida varchar(30)
	,@requerido int
	,@disponible int OUT
AS


BEGIN TRY

	DECLARE @id_empaque int;

	DECLARE @id_medida int;

	SET @id_empaque=(SELECT id_empaque FROM Produccion.Empaque WHERE descripcion=@descripcion);

	SET @id_medida=(SELECT id_medida FROM Produccion.Medida WHERE descripcion=@medida);

	SET @disponible=(
					SELECT
						SUM(si.cantidad)-@requerido
					FROM
						Produccion.stock_insumo si
						INNER JOIN Produccion.Empaque e ON e.id_empaque=si.id_empaque
						INNER JOIN Produccion.Capacidad_Envase ce ON ce.id_capacidad_envase=si.id_capacidad
						INNER JOIN Produccion.Medida m ON m.id_medida=si.id_medida
					WHERE
						e.id_empaque=@id_empaque AND m.id_medida=@id_medida and ce.capacidad=@capacidad
					GROUP BY e.descripcion,ce.capacidad, m.descripcion 
						
					);

	

END TRY
BEGIN CATCH
	print @@error;
END CATCH


GO
