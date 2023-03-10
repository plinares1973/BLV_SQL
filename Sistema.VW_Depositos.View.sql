USE [BLV]
GO
/****** Object:  View [Sistema].[VW_Depositos]    Script Date: 14/3/2023 11:16:38 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
		CREATE VIEW [Sistema].[VW_Depositos] AS
		SELECT
			d.nombre
			,d.domicilio
			,d.telefono
			,d.fax
			,d.mail
			,v.CIUDAD
			,v.estado
	
		FROM 
			sistema.deposito d 
			INNER JOIN Relacion.Deposito_ciudad c ON c.id_deposito=d.id_deposito
			INNER JOIN Sistema.vw_ciudades v ON v.ID_CIUDAD=c.id_ciudad
GO
