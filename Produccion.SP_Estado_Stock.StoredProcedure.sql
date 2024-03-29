USE [BLV]
GO
/****** Object:  StoredProcedure [Produccion].[SP_Estado_Stock]    Script Date: 6/7/2023 8:42:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--incluir marca producto en el like
--execute produccion.SP_Estado_Stock 1
CREATE PROCEDURE  [Produccion].[SP_Estado_Stock]
	@estado bit=0 --0 disponibles 1 NO disponibles
AS
	BEGIN TRY
		IF(@estado=0)
			BEGIN
				SELECT 
					s.id_stock
					,s.piso
					,s.fila
					,s.altura
					,s.posicion
					,d.nombre
					,'DISPONIBLE' as status

				FROM
					Produccion.Stock s
					INNER JOIN Relacion.Deposito_Stock ds ON ds.id_stock=s.id_stock
					INNER JOIN Produccion.Deposito d ON d.id_deposito=ds.id_deposito
				WHERE
					s.id_stock	NOT IN (
										SELECT
											s.id_stock
										FROM 
											Produccion.Stock s
											INNER JOIN Relacion.Lote_Stock ls ON s.id_stock=ls.id_stock
											);
			END
		ELSE
			BEGIN
				SELECT 
					s.id_stock
					,s.piso
					,s.fila
					,s.altura
					,s.posicion
					,d.nombre
					,'OCUPADO' as status
				FROM
					Produccion.Stock s
					INNER JOIN Relacion.Deposito_Stock ds ON ds.id_stock=s.id_stock
					INNER JOIN Produccion.Deposito d ON d.id_deposito=ds.id_deposito
				WHERE
					s.id_stock	 IN (
										SELECT
											s.id_stock
										FROM 
											Produccion.Stock s
											INNER JOIN Relacion.Lote_Stock ls ON s.id_stock=ls.id_stock
											);

			END



	END TRY
	BEGIN CATCH
		print @@ERROR;
		

	END CATCH





GO
