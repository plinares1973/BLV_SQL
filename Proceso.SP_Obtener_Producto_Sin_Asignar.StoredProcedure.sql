USE [BLV]
GO
/****** Object:  StoredProcedure [Proceso].[SP_Obtener_Producto_Sin_Asignar]    Script Date: 6/7/2023 8:42:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Proceso].[SP_Obtener_Producto_Sin_Asignar]
	@numero_importacion nvarchar(50)
	,@id_orden_compra int
	,@codigo_producto varchar(10)
	,@marca varchar(50)
	,@disponible int out
AS
DECLARE @asignado int;
DECLARE @comprado int;
BEGIN TRY
	SET @asignado=(SELECT 
						isnull(Sum(cantidad),0) 
					FROM
						Proceso.Tablon_Impacto_Stock
					WHERE
						numero_importacion=@numero_importacion
						AND codigo_producto=@codigo_producto
						AND marca=@marca);

	SET @comprado=(SELECT 
					OCP.cantidad 
				FROM 
					Compra.Orden_Compra_Producto OCP 
				WHERE	
					ocp.id_orden_compra=@id_orden_compra
					and ocp.codigo_producto=@codigo_producto
					and ocp.marca=@marca);
	
	SET @disponible=@comprado-@asignado;
	

END TRY
BEGIN CATCH
	SET @disponible=-1
END CATCH
GO
